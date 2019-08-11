<?php
class OgrSchema extends Schema {

  function create_delete_trigger() {
    $sql = str_replace('schema_name', $this->schemaName, file_get_contents('../sql/delete_trigger.sql'));
    if (!empty(GEOMETRY_EPSG_CODE)) {
      $sql = str_replace('25832', GEOMETRY_EPSG_CODE, $sql);
    }
    return $sql;
  }

  function create_ax_fortfuehrungsauftrag() {
    $sql = file_get_contents('../sql/ax_fortfuehrungsauftrag.sql');
    if(PG_WITH_OIDS) {
      $sql .= "
ALTER TABLE ax_fortfuehrungsauftrag SET WITH OIDS;";
    }
    return $sql;
  }

  function createEnumerationTable($enumeration, $dbSchema) {
    if ($this->is_table_filtered($enumeration['name'])) {
      $this->logger->log("<br>Ignoriere Enumeration: {$enumeration['name']}");
    }

    $this->logger->log('<br><b>Create Enumeration Tables: ' . $enumeration['name'] . '</b> (' . $enumeration['xmi_id'] . ')');

    $table = new Table($enumeration['name']);

    # read Values
    $enumType = new EnumType($enumeration['name'], $this->logger);
    $enumType->setSchemas($this->umlSchema, $dbSchema);
    $enumType->setId($enumeration['id']);
    $table->values = $enumType->getValues($enumeration);

    # definiere Attribute
    $wert_type = (empty($enumType)) ? PG_CHARACTER_VARYING : $enumType->getWertType();
    $attribute = new Attribute('wert', $wert_type);
    $table->addAttribute($attribute);
    $attribute = new Attribute('beschreibung', PG_CHARACTER_VARYING);
    $table->addAttribute($attribute);
    $attribute = new Attribute('dokumentation', PG_CHARACTER_VARYING);
    $table->addAttribute($attribute);

    # definiere Primärschlüssel
    $table->primaryKey = 'wert';

    $this->logger->log($table->values->asTable($table->attributes));

#   if (
#     $table->values->rows[0][0] != $table->values->rows[0][1] AND
#     $table->values->rows[0][1] != 'NULL'
#   )

    # definiere Commentare
    $table->addComment('UML-Typ: Enumeration');

    $sql .= $table->asSql();

    $this->enumerations[$enumType->name] = $enumType;

    $this->logger->log('<pre>' . $tableSql . '</pre>');

    return $sql;
  }

  function is_table_filtered($class_name) {
    $this->logger->log("<br>Prüfe ob {$class_name} komplett ignoriert wird.");
    return (
      array_key_exists($class_name, $GLOBALS['filter']) and
      !is_array($GLOBALS['filter'][$class_name])
    );
  }

  function createFeatureTypeList($stereotype, $parent, $class) {
    global $indent;
    if ($this->is_table_filtered($class['name'])) {
      $this->logger->log("<br>Ignoriere FeatureType: {$class['name']} komplett");
      return "";
    }

    $this->logger->log('<br><b>Create ' . $stereotype . ': ' . $class['name'] . ' von ' . $parent->name . '</b> (' . $parent->alias . ')');

    $featureType = new FeatureType($class['name'], $parent, $this->logger, $this->umlSchema, $this->enumerations);
    $featureType->ogrSchema = $this;

    $featureType->setId($class['id']);
    $featureType->primaryKey = 'ogc_fid';
    $featureType->primaryKeyType = 'serial NOT NULL';
    $featureType->primaryKeyNullable = false;

    if ($parent != null)
      $this->logger->log(' abgeleitet von: <b>' . $parent->name . '</b>');

    $featureType->attribute_filter = $this->filter[$class['name']]['attribute'];
    if (!is_array($attribute_filter))
      $featureType->attribute_filter = array();

    $this->logger->log('<br><b>Hole Attribute und verfolge dabei Datentypen bis zum Ende.</b>');
    $featureType->getAttributesUntilLeafs($featureType->alias, $stereotype, array());

    $featureType->flattenAttributes();

    $featureType->outputFlattenedAttributes();
    if ($this->logger->level > 0)
      $featureType->outputFlattenedAttributeTable();

    $featureType->setAssociationEnds($class);

    $res = array();

    # lade abgeleitete Klassen
    $subClasses = $this->umlSchema->getSubUmlClasses($stereotype, $class);
    if (empty($subClasses)) {
      $featureType->unifyShortNames();
      $this->renameList = array_merge(
        $this->renameList,
        $featureType->outputFlattenedAttributes()
      );
      if ($this->logger->level > 0)
        $featureType->outputFlattenedAttributeTable();
      $res[] = $featureType;
    }
    else {
      $indent++;
      foreach($subClasses as $subClass) {
        # übergibt den featureType als parent an die Sub-Klassen
        $this->logger->log('<br><b>Create Subclass: ' . $subClass['name'] . ' von Class ' . $featureType->name . '</b>');
        $res = array_merge($res, $this->createFeatureTypes($stereotype, $featureType, $subClass));
      }
      $indent--;
    }

    return $res;
  }

  function createFeatureTypes($stereotype, $parent, $class) {
    $featureTypes = $this->createFeatureTypeList($stereotype, $parent, $class);

    if(RENAME_OPTIONAL_FIRST) {
      // Pfade feststellen auf denen umbenannt wurde
      $renamed_paths = array();
      foreach($featureTypes as $featureType) {
        foreach($featureType->attributes as $a) {
          if($a->short_name != end($a->parts)->name) {
            $path =
              implode('_',
                array_map(
                  function($part) {
                    return $part->name;
                  },
                  array_slice($a->parts, 0, count($a->parts)-1)
                )
              );

            $renamed_paths[$path] = substr( $a->short_name, 0, strlen($a->short_name) - strlen(end($a->parts)->name) );
            # echo "-- renamed path: " . $path . " => " . $renamed_paths[$path] . " [" . $featureType->name . ": " . end($a->parts)->name . " => " . $a->short_name . "]\n";
          }
        }
      }

      // Auch nicht umbenannte Attribute auf Pfaden mit Umbenennung umbenennen
      // Führt z.B. zu:
      //   zeigtaufexternes_uri statt fachdatenobjekt_uri
      //   processstep_sourcereferencesystem statt processstep_source_source_sourcereferencesystem
      foreach($featureTypes as $featureType) {
        $namelen_exceeded = false;
        foreach($featureType->attributes as $a) {
          if( $a->isOptional() ) {
            for( $i = 1; $i < count($a->parts); $i++ ) {
              $path =
                implode('_',
                  array_map(
                    function($part) {
                      return $part->name;
                    },
                    array_slice($a->parts, 0, $i)
                  )
                );

              if(array_key_exists($path, $renamed_paths)) {
                $a->short_name_orig = $a->short_name;
                $a->short_name = $renamed_paths[$path] . end($a->parts)->name;
                # echo "-- renamed " . end($a->parts)->name . " in " . $a->short_name . " in " . $featureType->alias . " \n";
                if( strlen($a->short_name) > PG_MAX_NAME_LENGTH ) {
                  $namelen_exceeded = true;
                }
                $this->logger->log("<br>\nUmbenennung von " . end($a->parts)->name . " in " . $a->short_name . " in " . $featureType->alias . ".");
                break;
              }
            }
          }
        }

        if($featureType->hasCollisions() || $namelen_exceeded ) {
          // Kommt vor bei:
          // AX_Fortfuehrungsfall.verweistauf_uri => dienststellenlogo_uri
          // AX_Fortfuehrungsfall.verweistauf_uri => enthaeltewp_uri
          // AX_Fortfuehrungsfall.verweistauf_uri => verweistauf_uri
          // AX_BesondererHoehenpunkt.erfassungbesondererhoehenpunkt_ax_dqerfassungsmethodebesondererhoehenpunkt => ax_dqerfassungsmethodebesondererhoehenpunkt
          $this->logger->log("<br>\nUmbenennung auf gleichen Pfaden führte zu Doppeldeutigkeiten oder Überlängen in " . $featureType->alias . "!");
          foreach($featureType->attributes as $a) {
            if(property_exists($a, "short_name_orig") && ($a->frequency > 1 || strlen($a->short_name) > PG_MAX_NAME_LENGTH) )
            {
              $this->logger->log("<br>\n" . $featureType->alias . "." . $a->short_name . " => " . $a->short_name_orig);
              $a->short_name = $a->short_name_orig;
            }
          }
        }
      }
    }

    return $featureTypes;
  }

  function createFeatureTypeTables($stereotype, $parent, $class, $parts = array(), $createUserInfoColumns = false) {
    $sql = "";

    $wv = array();

    foreach($this->createFeatureTypes($stereotype, $parent, $class) as $featureType) {
      $sql .= $featureType->asFlattenedSql();

      foreach($featureType->attributes as $a) {
        if(in_array($a->datatype, array("", "ci_rolecode")))
          continue;

        if( $a->stereotype == "enumeration" ) {
          $wv[] = "SELECT wert::text AS k, beschreibung::text AS v,'' AS d,'" . $a->short_name . "' AS bezeichnung,'" . $featureType->name . "' AS element FROM " . $a->datatype;
        }
        else if( $a->stereotype == "codelist" ) {
          if($a->datatype == "aa_anlassart" && !WITH_CODE_LISTS)
            continue;


          $wv[] = "SELECT id::text AS k, value::text AS v,'' AS d,'" . $a->short_name . "' AS bezeichnung,'" . $featureType->name . "' AS element FROM " . $a->datatype;
        }
      }
    }

    $sql .= "
CREATE VIEW alkis_wertearten(k,v,d,bezeichnung,element) AS\n  " . implode(" UNION\n  ", $wv) . ";";

    return $sql;
  }

  function createFeatureTypeGfs($stereotype, $parent, $class) {
    $gfs = "";

    foreach($this->createFeatureTypes($stereotype, $parent, $class) as $featureType) {
      $gfs .= $featureType->asGfs();
    }

    return $gfs;
  }

  function listFeatureTypesAttributes($stereotype, $parent, $class) {
    if ($this->logger->level > 0)
      $this->createFeatureTypes($stereotype, $parent, $class);
  }

  function getAttributesFromComplexType($datatype, $stereotype) {
    if ($stereotype == 'union')
      $typeList = $this->umlSchema->unionTypes;
    if ($stereotype == 'datatype')
      $typeList = $this->umlSchema->dataTypes;

    $attributes = array();

    foreach ($typeList[$datatype]->attributes AS $attribute) {
      if ($this->umlSchema->stereoTypeAlreadyExists($attribute->datatype, $attribute->stereotype)) {
        array_merge($attributes, $this->getAttributesFromComplexType($attribute->datatype, $attribute->stereotype));
      }
      else {
        $attributes[] = $attribute;
      }
    }

    return $attributes;
  }

  function identifier($name)
  {
    if( strlen($name) <= PG_MAX_NAME_LENGTH)
      return $name;

    if( !property_exists($this, "nameidx") ) {
        $this->nameidx = 0;
    }

    $id = ++$this->nameidx;

    return substr($name, 0, PG_MAX_NAME_LENGTH - 3) . $id;
  }
}
?>
