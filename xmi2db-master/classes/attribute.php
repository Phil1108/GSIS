<?php
class Attribute {

  function __construct($name, $datatype, $parent = '', $parts = array(), $not_null = false, $default = '', $comment = '') {
    $this->alias = $name;
    $this->name = $this->getName($name);
    $this->brackets = '';
    $this->parent = $parent;
    $this->parts = parts;
    $this->datatype = strtolower(substr($datatype, 0, PG_MAX_NAME_LENGTH));
    $this->datatype_alias = $datatype;
    $this->attribute_type = '';
    $this->stereotype = '';
    $this->stereotype_alias = '';
    $this->multiplicity = '';
    $this->multiplicity_lower = '';
    $this->multiplicity_upper = '';
    $this->database_type = '';
    $this->isExternal = false;

    $this->database_type_alias = $database_type; # langer Name
    $this->database_type = strtolower(substr($database_type, 0, 58)); # verkürzter Name

    $this->not_null = $not_null;
    $this->default = $default;
    $this->comment = $comment;
    $this->attributes_name = '';
    $this->path_name = '';
    $this->frequency = 0;

    $this->overwrite = array(
      'type' => '',
      'original' => ''
    );
  }

  public static function getName($name) {
    return strtolower(substr($name, 0, PG_MAX_NAME_LENGTH));
  }

  function setNameFromParts() {
    $this->path_name = implode(
      '|',
      array_map(
        function($part) {
          return $part->parent->alias . '#' . $part->alias;
        },
        $this->parts
      )
    );

    $this->attributes_name = implode(
      '|',
      array_map(
        function($part) {
          return $part->name;
        },
        $this->parts
      )
    );

    $this->short_name = end($this->parts)->name;

    if ($this->overwrite['type'] != '') {
      $this->overwrite['path_name'] = implode(
        '_',
        array_map(
          function($part) {
            if ($part->overwrite['type'] != '') {
              $str = $part->parent->alias . '_' . $part->overwrite['alias'] . '_' . $part->overwrite['type'];
            }
            else {
              $str = $part->parent->alias . '_' . $part->alias;
            }
            return $str;
          },
          $this->parts
        )
      );
    }
    # echo '<br>path: ' . $this->path_name;
    # echo '<br>attributes: ' . $this->attributes_name;
    # echo '<br>overwritten path: ' . $this->overwrite['path_name'];
    # echo '<br>short_name: ' . $this->short_name;
  }

  function getComment($table_name) {
    $sql = "
COMMENT ON COLUMN " . $table_name . "." . $this->name . " IS '";
    $sql .= trim($this->alias . ' ' . $this->stereotype_alias . ' ' . $this->datatype_alias);
    $sql .= ' ' . $this->multiplicity;
    $sql .= "';";
    return $sql;
  }

  function getLastAttributeName() {
    $last_part = end($this->parts);
    if( $this->overwrite['type'] != '' ) {
      $last_attribute_name = $last_part->overwrite['type'];
    }
    else {
      $last_attribute_name = $last_part->name;
    }
    return $last_attribute_name;
  }

  function getRenamedAttributePath() {
    if( $this->overwrite['type'] != '' ) {
      $elements = array();
      foreach ($this->parts as $part) {
        $elements[] = $part->parent->alias;
        if ($part->overwrite['type'] != '') {
          $elements[] = $part->overwrite['alias'];
          $elements[] = $part->overwrite['type'];
        }
        else {
          $elements[] = $part->alias;
        }
      }

      array_shift($elements);
      array_pop($elements);
    } else {
      $elements = explode('|', $this->getAttributePath());
    }

    if($this->isExternal) {
      $parts = explode('|', $this->getAttributePath());
    	if (end($elements) != end($parts)) {
        $elements[] = end($parts);
      }
      else {
        if( isset($this->datatype_alias) ) {
          $elements[] = $this->datatype_alias;
        } 
        else {
          $elements[] = "CharacterString";
        }
      }
    }

    if(RENAME_ZEIGT_AUF_EXTERNES && $elements[0] == 'zeigtAufExternes') {
      $elements[0] = 'zeigtAufExternes_';
    }
    return implode('|', $elements);
  }

  function getAttributePath($parts = array()) {
    if (empty($parts)) {
      $parts = $this->parts;
    }
    $attribute_path = $parts[0]->alias;
    array_shift($parts);
    if (!empty($parts)) {
      $attribute_path .= '|' . implode(
        '|',
        array_map(
          function($part) {
            return $part->parent->alias . '|' . $part->alias;
          },
          $parts
        )
      );
    }
    return $attribute_path;
  }

  function has_parent($parts = array(), $parent_name) {
    $has_parent = false;
    if (empty($parts)) {
      $parts = $this->parts;
    }
    foreach($parts AS $part) {
      if ($part->parent->name == strtolower($parent_name)) {
        $has_parent = true;
      }
    }
    return $has_parent;
  }

  function getFlattenedComment($table_name) {
    $attribute_path = $this->getRenamedAttributePath();
    $sql = "
COMMENT ON COLUMN " . $table_name . "." . $this->short_name . " IS '";
    $sql .= $this->getLastAttributeName() . ' ' . $attribute_path . ' ' . $this->stereotype_alias . ' ' . $this->datatype_alias;
    $sql .= ' ' . $this->multiplicity;
    $sql .= "';";
    return $sql;
  }

  function setMultiplicity($lower, $upper) {
    $this->multiplicity_lower = ($lower == '-1' OR intval($lower) > 1) ? '*' : $lower;
    $this->multiplicity_upper = ($upper == '-1' OR intval($upper) > 1) ? '*' : $upper;
    if ($this->multiplicity_lower == $this->multiplicity_upper)
      $this->multiplicity = $this->multiplicity_lower;
    else {
      if (empty($this->multiplicity_lower))
        $this->multiplicity_lower = '0';
      $this->multiplicity = $this->multiplicity_lower . '..' . $this->multiplicity_upper;
    }
    return $this->multiplicity;
  }

  function setStereoType($stereotype) {
    $this->stereotype = strtolower(substr($stereotype, 0, PG_MAX_NAME_LENGTH));
    $this->stereotype_alias = $stereotype;
  }

  function overwriteIso19139Type($overwriteTypes, $parts) {
    # echo 'overwriteIso19139Type: ' . $this->name;
    $msg = '';
    if (array_key_exists($this->datatype_alias, $overwriteTypes) and $overwriteTypes[$this->datatype_alias] == $this->stereotype) {
      $msg .= '<br>Overwrite ' . $this->name . ' with: ' . $this->datatype;

      $this->overwrite['name'] = $this->name;
      $this->overwrite['alias'] = $this->alias;
      $this->overwrite['type'] = $this->datatype_alias;
      $this->name = $this->datatype;
      $this->alias = $this->datatype_alias;
    }

    if ($this->name == 'description') {
      # echo '<br>' . $this->parent->alias . ' - ' . $this->name;
      # if (is_array($parts)) {
      #   echo '<br>' . $this->getAttributePath($parts);
      # }
      switch (true) {
        case ($this->has_parent($parts, 'AX_DQOhneDatenerhebung') AND $this->parent->alias == 'LI_ProcessStep') :
          $new_type = 'AX_LI_ProcessStep_OhneDatenerhebung_Description';
          break;
        case ($this->has_parent($parts, 'AX_DQOhneDatenerhebung') AND $this->parent->alias == 'LI_Source') :
          $new_type = 'AX_Datenerhebung';
          break;
        case ($this->has_parent($parts, 'AX_DQMitDatenerhebung') AND $this->parent->alias == 'LI_ProcessStep') :
          $new_type = 'AX_LI_ProcessStep_MitDatenerhebung_Description';
          break;
        case ($this->has_parent($parts, 'AX_DQMitDatenerhebung') AND $this->parent->alias == 'LI_Source') :
          $new_type = 'AX_Datenerhebung';
          break;
        case ($this->has_parent($parts, 'AX_DQPunktort') AND $this->parent->alias == 'LI_ProcessStep') :
          $new_type = 'AX_LI_ProcessStep_Punktort_Description';
          break;
        case ($this->has_parent($parts, 'AX_DQPunktort') AND $this->parent->alias == 'LI_Source') :
          $new_type = 'AX_Datenerhebung_Punktort';
          break;
        default :
          $new_type = '';
      }

      if ($new_type != '') {
        $msg .= '<br>Overwrite ' . $this->parent->alias . '|' . $this->name . ' with: ' . $new_type;
        $this->overwrite['name'] = $this->name;
        $this->overwrite['alias'] = $this->alias;
        $this->overwrite['type'] = $new_type;
        $this->name = strtolower($new_type);
        $this->alias = $new_type;
        $this->overwrite_type = $new_type;
      }
    }

    return $msg;
  }

  function get_database_type($with_enum_type = true, $with_codelist_type = true) {
    $database_type = $this->datatype;
    $defined_types = array(
      'datatype'
    );

    if ($with_enum_type) {
      $defined_types[] = 'enumeration';
    }

    if (in_array($this->stereotype, $defined_types)) {
      $database_type = $this->datatype;
    }
    else {
      switch (true) {
        # text
        case in_array($this->datatype, array(
            '',
            'featurecollection',
            'li_lineage',
            'sequence',
            'genericname',
            'query',
            'transaction',
            'dq_result',
            'md_identifier',
            'ci_citation'
          )) :
          $database_type = PG_CHARACTER_VARYING;
        break;

        # character varying
        case in_array($this->datatype, array(
            'characterstring',
            '<undefined>',
            'uri'
          )) :
          $database_type = PG_CHARACTER_VARYING;
        break;

        # external datatypes
        case in_array($this->datatype, array(
            'sc_crs',
            'doublelist',
            'measure',
            'dq_evaluationmethodtypecode'
          )) :
          $database_type = PG_CHARACTER_VARYING;
        break;

        # enumerations from stereotype
        case ($this->stereotype == 'enumeration') :
          if ($this->name == 'advstandardmodell') {
            #echo '<br>attribut: ' . $this->name . ' datatype: ' . $this->datatype . ' stereotype: ' . $this->stereotype . ' parent: ' . $this->parent->name . ' ogrSchema: ' . $this->parent->ogrSchema->schemaName . ' num enumerations: ' . count($this->parent->ogrSchema->enumerations);
            # . ' enumtype: ' . $enumType->name . ' wert typ: ' . $enumType->getWertType() . ' database type: ' . $database_type;
          }
          if ($with_enum_type) {
            $database_type = $this->datatype;
          }
          else {
            if (!empty($this->parent->ogrSchema->schemaName)) {
              $enumType = $this->parent->ogrSchema->enumerations[$this->datatype];
              $database_type = (empty($enumType)) ? PG_CHARACTER_VARYING : $enumType->getWertType();
            }
          }
        break;

        # enumerations from datatype
        case in_array($this->datatype, array(
            'enumeration',
            'enum'
          )) :
          $database_type = PG_CHARACTER_VARYING;
        break;

        # code list from stereotype
        case ($this->stereotype == 'codelist') :
          if ($with_codelist_type) {
            $database_type = $this->datatype;
          }
          else {
            $database_type = PG_CHARACTER_VARYING;
          }
        break;

        # date
        case in_array($this->datatype, array(
            'date',
            'tm_duration'
          )) :
          $database_type = PG_DATE;
        break;

        # datetime
        case in_array($this->datatype, array(
            'datetime'
          )) :
          $database_type = PG_DATETIME;
        break;

        # integer
        case in_array($this->datatype, array(
            'integer',
            'int',
            'codelist'
          )):
          $database_type = 'integer';
        break;

        # boolean
        case ($this->datatype == 'boolean'):
          $database_type = PG_BOOLEAN;
          break;

        # double precision
        case in_array($this->datatype, array(
            'angle',
            'length',
            'decimal',
            'volume',
            'area',
            'real',
            'distance'
          )):
          $database_type = 'double precision';
        break;

        # uuid
        case in_array($this->datatype, array(
            'datatype'
          )):
          $database_type = 'uuid';
        break;

        # geometry
        case in_array($this->datatype, array(
            'gm_object',
            'union',
            'xp_variablegeometrie'
          )):
          $database_type = 'geometry';
        break;

        case in_array($this->datatype, array(
            'gm_point',
            'directposition'
          )):
          $database_type = 'geometry(POINT)';
        break;

        case in_array($this->datatype, array(
            'gm_multipoint',
            'xp_punktgeometrie'
          )):
          $database_type = 'geometry(MULTIPOINT)';
        break;

        case ($this->datatype == 'gm_curve'):
          if (LINESTRING_AS_GEOMETRY)
            $database_type = 'geometry';
          else
            $database_type = 'geometry(LINESTRING)';
        break;

        case in_array($this->datatype, array(
            'gm_multicurve',
            'xp_liniengeometrie',
            'gm_compositecurve'
          )):
          if (LINESTRING_AS_GEOMETRY)
            $database_type = 'geometry';
          else
            $database_type = 'geometry(MULTILINESTRING)';
        break;

        case ($this->datatype == 'gm_surface'):
          $database_type = 'geometry(POLYGON)';
        break;

        case in_array($this->datatype, array(
            'gm_triangulatedsurface',
            'xp_flaechengeometrie',
            'gm_solid',
            'gm_compositesolid',
            'gm_multisurface'
          )):
          $database_type = 'geometry(MULTIPOLYGON)';
        break;
      } # end of switch
    }

    if ($database_type == '')
      $database_type = PG_CHARACTER_VARYING;

    $this->database_type = $database_type;
    return $database_type;
  }

  function get_gfs_type($database_type, $brackets) {

    switch (true) {
      case in_array($database_type, array(
          PG_CHARACTER_VARYING,
          PG_DATETIME,
          PG_DATE,
          PG_GML_ID,
          'character varying',
          'text',
          'date',
          'character', # 'timestamp without time zone'
        )):
        $gfs_type = 'String';
        break;

      case in_array($database_type, array(
          'integer'
        )):
        $gfs_type = 'Integer';
        break;

      case in_array($database_type, array(
          'double precision'
        )):
        $gfs_type = 'Real';
        break;

      case ($database_type == 'geometry'):
        $gfs_type = '0';
        break;

      case ($database_type == 'geometry(POINT)'):
        $gfs_type = '1';
        break;

      case ($database_type == 'geometry(LINESTRING)'):
        $gfs_type = '2';
        break;

      case ($database_type == 'geometry(POLYGON)'):
        $gfs_type = '3';
        break;

      case ($database_type == 'geometry(MULTIPOINT)'):
        $gfs_type = '4';
        break;

      case ($database_type == 'geometry(MULTILINESTRING)'):
        $gfs_type = '5';
        break;

      case ($database_type == 'geometry(MULTIPOLYGON)'):
        $gfs_type = '6';
        break;
    }

    return $gfs_type . ($brackets == '[]' ? 'List' : '');
  }

  function getBrackets() {
    $brackets = false;
    if (is_array($this->parts) and !empty($this->parts)) {
      $brackets = in_array(
        '[]',
        array_map(
          function($attribute) {
            return ($attribute->multiplicity_upper == '*' OR $attribute->multiplicity == '*' OR intval($attribute->multiplicity) > 1) ? '[]' : '';
          },
          $this->parts
        )
      );
    }
    else {
      $brackets = ($this->multiplicity_upper == '*' OR $this->multiplicity == '*' OR intval($this->multiplicity) > 1);
    }
    return $brackets ? '[]' : '';
  }

  /*
   * Ausgabe NOT NULL
   */
  function getNotNull() {
    if ($this->not_null) {
      # Wenn NOT NULL explizit beim Anlegen des Attributes gesetzt wurde
      $not_null = $this->not_null;
    }
    else {
      if (is_array($this->parts) and !empty($this->parts)) {
        # Ermittle NOT NULL aus Multiplizität des Attributes und seiner Vorgänger
        # Nur wenn alle Attribute im Pfad die Kardinalität > 0 haben,
        # darf das Blattelement auf NOT NULL gesetzt werden.
        # $not_null = true;
        # foreach($this->parts AS $attribute) {
        #   if (intval($attribute->multiplicity_lower) == 0) {
        #     $not_null = false; # Attribut darf NULL sein.
        #   }
        # }

        $not_null = !in_array(
          false,
          array_map(
            function($attribute) {
              return intval($attribute->multiplicity_lower) > 0;
            },
            $this->parts
          )
        );
      }
      else {
        # Ermittle NOT NULL nur aus multiplicity_lower des Attributes
        $not_null = (intval($this->multiplicity_lower) > 0);
      }
    }
    return ($not_null ? ' NOT NULL' : '');
  }

  function asSql($class_type) {
    $sql = "  " . $this->name . " " . $this->get_database_type() . $this->getBrackets();
    if ($class_type == 'table')
      $sql .= $this->getNotNull();

    # Ausgabe DEFAULT
    if ($this->default != '')
      $sql .= ' DEFAULT ' . $this->default;

    if ($this->name == 'genauigkeitsstufe')
      $sql .= '<br>--hier asSQL verwendet.';
    return $sql;
  }

  function asFlattenedSql() {
    # if (substr($this->get_database_type(), 0, 8) == 'geometry' and $this->name <> 'wkb_geometry') echo '<br>Klasse: ' . $this->parent->name . ' Geometriespalte: ' . $this->name . ' type: ' . $this->get_database_type();

    $sql = "  " .
      $this->short_name . " " . $this->get_database_type(false, false) . $this->getBrackets() . $this->getNotNull();

if(0) {
    $sql .= " /*";

    if ($this->short_name != end($this->parts)->name) {
        $sql .= " RENAMED " . $this->path_name . " to " . $this->short_name;
#        if(!$this->isOptional()) {
#           $sql .= "\n\t\tNOT OPTIONAL:\n";
#           foreach($this->parts AS $part) {
#             $sql .= "\t\t\t" . $part->name . ": " . $part->multiplicity_lower . " => " . (intval($part->multiplicity_lower) == 0)  . "\n";
#          }
#          $sql .= "\t\t";
#        }
#    } else {
        $sql .= " PATH " . $this->path_name;
    }

    if ($this->stereotype == 'enumeration' and $this->short_name != $this->datatype) {
      $sql .= ' datatype: ' . $this->datatype . ' stereotype: ' . $this->stereotype;
    }

    $sql .= " */";
}

    # Ausgabe DEFAULT
    if ($this->default != '')
      $sql .= ' DEFAULT ' . $this->default;

    return $sql;
  }

  function asGfs() {
    if($this->short_name != "wkb_geometry" && $this->short_name != "objektkoordinaten") {
      if(0) {
        $gfs = "\n    <!--";
        foreach ($this as $property => $value) {
                $gfs .= "\n      $property => " . (is_scalar($value) ? $value : "[" . gettype($value) . "]");
        }

        $gfs .= "\n\n      overwrite:";
        foreach ($this->overwrite as $property => $value) {
                $gfs .= "\n        $property => " . (is_scalar($value) ? $value : "[" . gettype($value) . "]");
        }

        foreach ($this->parts as $part) {
                $gfs .= "\n\n      part:";
                foreach ($part as $property => $value) {
                        $gfs .= "\n        $property => " . (is_scalar($value) ? $value : "[" . gettype($value) . "]");

                }

                $gfs .= "\n        overwrite:";
                foreach ($part->overwrite as $property => $value) {
                        $gfs .= "\n          $property => " . (is_scalar($value) ? $value : "[" . gettype($value) . "]");
                }
        }
        $gfs .= "\n      path:" . $this->getAttributePath();
        $gfs .= "\n    -->";
      }

      $gfs .= "
    <PropertyDefn>
      <Name>".$this->short_name."</Name>
      <ElementPath>" . $this->getRenamedAttributePath() . "</ElementPath>
      <Type>".$this->get_gfs_type($this->get_database_type(false, false), $this->getBrackets())."</Type>
    </PropertyDefn>";
      return $gfs;
    }
  }

  function isOptional() {
    if (!is_array($this->parts) or empty($this->parts)) {
      return false;
    }

    foreach($this->parts AS $part) {
      if ( intval($part->multiplicity_lower) == 0 )
        return true;
    }

    return false;
  }

  function setExternal($isExternal) {
    $this->isExternal = $isExternal;
  }
}
?>
