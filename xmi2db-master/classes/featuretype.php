<?php
class FeatureType {

  function __construct($name, $parent, $logger, $umlSchema, $enumerations = NULL) {
    $this->alias = $name;
    $this->name = $this->getName($name);
    $this->comments = array();
    if ($this->name != $this->alias)
      $this->comments[] = 'FeatureType: "' . $this->alias . '"';
    $this->attributes = array();
    $this->attributes_until_leafs = array();
    $this->associationEnds = array();
    $this->primaryKey = '';
    $this->primaryKeyType = 'text';
    $this->parent = $parent;
    $this->withOids = PG_WITH_OIDS;
    $this->values = new Data();
    $this->umlSchema = $umlSchema;
    $this->logger = $logger;
    $this->stereotype = 'featuretype';
    $this->attribute_filter = array();
    $this->enumerations = $enumerations;
  }

  public static function getName($name) {
    return strtolower(substr($name, 0, PG_MAX_NAME_LENGTH));
  }

  function setId($id) {
    $this->id = $id;
  }

  function addAttribute($attribute) {
    $this->attributes[] = $attribute;
  }

  function createUserInfoColumns() {
    $this->logger->log('<br><b>Erzeuge userinfo Spalten</b>');
    $this->addAttribute(new Attribute('user_id', 'integer'));
    $this->addAttribute(new Attribute('created_at', 'timestamp without time zone','',array(), true, 'current_timestamp'));
    $this->addAttribute(new Attribute('updated_at', 'timestamp without time zone','',array(), true, 'current_timestamp'));
    $this->addAttribute(new Attribute('konvertierung_id', 'integer'));
  }

  function setAssociationEnds($class) {
    # lade navigierbare Assoziationsenden von 1:n Assoziationen
    foreach($this->umlSchema->getAssociationEnds($class) AS $end) {
      if (!$this->is_filtered('beziehungen', $class['name'], $end['b_name'])) {
        $associationEnd = new AssociationEnd(
          $end['b_name'],
          $end['a_class_name'],
          $end['b_class_name'],
          $this->logger
        );
        $associationEnd->stereotype = 'FeatureType';
        $associationEnd->setMultiplicity($end['b_multiplicity_range_lower'], $end['b_multiplicity_range_upper']);
        $this->addAssociationEnd($associationEnd);
      }
    }
    $this->logger->log($this->associationsAsTable());
  }

  function is_filtered($attribute_type, $class_name, $attribute_name) {
    $is_filtered = (
      array_key_exists($class_name, $GLOBALS['filter']) and (
        $GLOBALS['filter'][$class_name] == 0 or (
          array_key_exists($attribute_type, $GLOBALS['filter'][$class_name]) and
          array_key_exists($attribute_name, $GLOBALS['filter'][$class_name][$attribute_type])
        )
      )
    );

    if ($is_filtered) {
      $this->logger->log("<br>Ignoriere Klasse: {$class_name} Attribute: {$attribute_name}");
    }
    return $is_filtered;
  }

  function getAttributesUntilLeafs($type, $stereotype, $parts) {
    $return_attributes = array();
    $isExternal = in_array(substr($type, 0, 3), array('DQ_', 'LI_', 'CI_'));
    if ($isExternal) {
      /* Damit die DQ_, LI_ und CI_ Elemente gefunden werden, müssen sie in classes existieren.
       * Zum Anlegen kann das SQL-Script sql/external_uml_classes.sql verwendet werden.
       */
      $attributes = $this->umlSchema->getExternalClassAttributes($type, $stereotype, $parts);
    }
    else {
      $attributes = $this->umlSchema->getClassAttributes($type);
    }
    foreach ($attributes AS $attribute) {
      $this->logger->log("<br><b>Class:</b> {$attribute['class_name']} <b>Attribut:</b> {$attribute['attribute_name']} <b>datatype:</b> {$attribute['attribute_datatype']} <b>stereotype:</b> {$attribute['attribute_stereotype']}");
      if (!$this->is_filtered('attribute', $type, $attribute['attribute_name'])) {
        if (!empty($attribute['attribute_name'])) {
          if (empty($parts)) {
            $parent = $this;
          }
          else {
            #if ($attribute['class_name'] == 'AA_Modellart') echo '<br>  class: ' . $attribute['class_name'] . ' class stereotype: ' . $stereotype . ' attribute name: ' . $attribute['attribute_name'] . ' datatype: ' . $attribute['attribute_datatype'] . ' stereotyp: ' . $attribute['attribute_stereotype'];

            $parent = new Datatype($attribute['class_name'], $stereotype, $this->logger, $this->enumerations);
            $parent->ogrSchema = $this->ogrSchema;
          }

          $attributeObj = new Attribute(
            ($attribute['attribute_name'] == 'position' and GEOMETRY_COLUMN_NAME != '') ? GEOMETRY_COLUMN_NAME : $attribute['attribute_name'],
            $attribute['attribute_datatype'],
            $parent,
            $parts
          );
          $attributeObj->setStereoType($attribute['attribute_stereotype']);
          $attributeObj->setExternal($isExternal);
          # Union Typen können nicht not null sein, weil immer eines der Attribute
          # des Union Types verwendet wird. Also andere weggelassen werden.
          # Sonderfall, wenn ein Union Typ nur ein Attribut hätte, aber das wäre
          # für einen Union Typ sinnlos, weil er ja dafür da ist, dass man ein
          # Attribut aus verschiedenen auswählt.
          #if ($type == 'AX_Lagebezeichnung') echo '<br>typ: ' . $type . ' attribute: ' . $attributeObj->name . ' stereotype: ' . $stereotype;

          $attributeObj->setMultiplicity(
            (($attribute['attribute_name'] == 'position' or $stereotype == 'union') ? 0 : $attribute['multiplicity_range_lower']),
            $attribute['multiplicity_range_upper']
          );

          $msg = $attributeObj->overwriteIso19139Type($this->umlSchema->iso19139SubstitutionClasses, $parts);
          if ($msg != '') {
            $this->logger->log($msg);
          }

          $new_path = $parts;
          array_push($new_path, $attributeObj);
          if (in_array(strtolower($attribute['attribute_stereotype']), array('datatype', 'union'))) {
            foreach ($this->getAttributesUntilLeafs($attribute['attribute_datatype'], $attribute['attribute_stereotype'], $new_path) AS $child_attribute) {
              $return_attributes[] = $child_attribute;
            }
          }
          else {
            $return_attributes[] = $new_path;
          }
        }
      }
    }
    $this->attributes_until_leafs = $return_attributes;
    return $return_attributes;
  }

  function flattenAttributes() {
    if ($this->parent != null AND !empty($this->parent->attributes)) {
      foreach($this->parent->attributes AS $parent_attribute) {
        $parent_attribute->parts[0]->parent->alias = $this->alias;
        $parent_attribute->setNameFromParts();
        $this->attributes[] = clone $parent_attribute;
      }
    }

    foreach($this->attributes_until_leafs AS $attribute_parts) {
      $attribute = end($attribute_parts);
      $attribute->parts = $attribute_parts;
      $attribute->setNameFromParts();
      $this->attributes[] = clone $attribute;
    }
  }

  function getParentsAttributes() {
    if ($this->parent == null)
      return array();
    else
      return array_merge(
        $this->parent->attributes,
        $this->parent->getParentsAttributes()
      );
  }

  function getParentsAssociationEnds() {
    if ($this->parent == null)
      return array();
    else
      return array_merge(
        $this->parent->associationEnds,
        $this->parent->getParentsAssociationEnds()
      );
  }

  function hasCollisions() {
    $hasCollisions = false;

    foreach($this->attributes AS $a) {
      $frequency = 0;
      foreach($this->attributes AS $b) {
        if ($a->short_name == $b->short_name) {
          $frequency++;
        }
      }
      $a->frequency = $frequency;
      if ($frequency > 1) {
        $hasCollisions = true;
      }
    }

    return $hasCollisions;
  }

  function unifyShortNames() {
    if(RENAME_OPTIONAL_FIRST) {
      if( !$this->hasCollisions() ) {
        $this->logger->log("<br>Keine Namenskollisionen!\n");
        return;
      }

      # Erst optionale Attribute qualifizieren
      foreach($this->attributes AS $a) {
        if( $a->frequency > 1 && $a->isOptional() && count($a->parts) >= 2 ) {
          $n = count($a->parts) - 2;
          $a->short_name = $a->parts[$n]->name . '_' . $a->short_name;

          $this->logger->log('<br>Optionales Attribut ' . end($a->parts)->name . " umbenannt in " . $a->short_name . "\n");
        }
      }
    }

    $this->unifyShortNamesLevel();
  }

  function unifyShortNamesLevel($startlevel = 1) {
    $this->logger->log('<br><b>unifyShortNames:</b>');

    for($level = $startlevel; $level <= 10; ++$level) {
      if( !$this->hasCollisions() ) {
        $this->logger->log("<br>Keine verbleibenden Namenskollisionen!");
        return;
      }

      $this->logger->log('<br>gleichlautende Namen gefunden in Runde ' . $level . ' der Umbenennung!');

      foreach($this->attributes AS $a) {
        if ($a->frequency == 1)
          continue;

        $this->logger->log('<br>' . $a->path_name . ' (nicht umbenannt; ' . count($a->parts) . ')');

        $n = count($a->parts) - $level - 1; # Stufe der Klasse im Pfad
        if ($n > -1) {
          $this->logger->log('<br>' . $a->path_name);
          $this->logger->log('<br>' . $a->short_name);
          $a->short_name = $a->parts[$n]->name . '_' . $a->short_name;

          $this->logger->log(' => ' . $a->short_name . ' (kam ' . $a->frequency . ' mal vor' . ($a->isOptional() ? ' und ist OPTIONAL' : '') . ')');
        }
      }
    }

    if ($level > 10) {
      $this->logger->log('<br>Abbruch bei level: ' . $level . ' weil Umbenennung nicht möglich.');
    }
  }

  function getKeys() {
    return array_map(
      function($attribute) {
        return $attribute['name'];
      },
      $this->attributes
    );
  }

  function attributesAsTable() {
    if (empty($this->attributes)) {
      $html = '<br>Keine Attribute gefunden.';
    }
    else {
      $html = '<table border="1"><tr><th>Attribut</th><th>Attributtyp</th><th>Stereotyp</th><th>Datentyp</th><th>Multiplizität</th><th>Default</th><th>Sequence</th></tr>';
      # für jedes Attribut erzeuge Attributzeilen
      foreach($this->attributes AS $i => $attribute) {
        $html .= '<tr><td>' . $attribute->name . '</td><td>' .
                $attribute->attribute_type . '</td><td>' .
                $attribute->stereotype . '</td><td>' .
                $attribute->datatype . '</td><td>' .
                $attribute->multiplicity . '</td><td>' .
                $attribute->default . '</td><td>' .
                $attribute->sequence_number . '</td></tr>';
        $sql .= '
    ';
      }
      $html .= '</table><p>';
    }
    return $html;
  }

  function associationsAsTable() {
    if (empty($this->associationEnds)) {
      $html = '<br>Keine Assoziationen gefunden.';
    }
    else {
      $html = '<table border="1"><tr><th>Attribut</th><th>Stereotyp</th><th>Datentyp</th><th>Multiplizität</th></tr>';
      # für jedes Attribut erzeuge Attributzeilen
      foreach($this->associationEnds AS $i => $associationEnd) {
        $html .= '<tr><td>' . $associationEnd->name . '</td><td>' .
                $associationEnd->stereotype . '</td><td>' .
                $associationEnd->zeigt_auf_alias . '</td><td>' .
                $associationEnd->multiplicity . '</td>' .
        $sql .= '</tr>
    ';
      }
      $html .= '</table><p>';
    }
    return $html;
  }

  function addAssociationEnd($associationEnd) {
    $this->associationEnds[] = $associationEnd;
  }

  function addComment($comment) {
    $this->comments[] = $comment;
  }

  function outputFlattenedAttributeTable() {
    $html = '';
    if (empty($this->attributes))
      $html .= '<br>keine Attribute';
    else {
      $html .= '<table>
        <th>Pfad</th><th>Name</th><th>Kurzname</th><th>Stereotype</th><th>UML-Datatype</th><th>Databasetype</th><th>Multiplizität</th>';
        $num_attributes = 0;
        foreach ($this->attributes AS $attribute) {
          $html .= '<tr>';
          $html .=  '<td>' . $attribute->path_name . '</td>';
          $html .=  '<td>';
          $html .=  $attribute->attributes_name;
          if (strlen($attribute->attributes_name) > 58)
            $html .=  '(*)';
          $html .=  '</td>';
          $html .=  '<td>';
          $html .=  $attribute->short_name;
          $html .=  '</td>';
          $html .=  '<td>';
          $html .=  $attribute->stereotype;
          $html .=  '</td>';
          $html .=  '<td>';
          $html .=  $attribute->datatype;
          $html .=  '</td>';
          $html .=  '<td>';
          $html .=  $attribute->get_database_type(false, false);
          $html .=  '</td>';
          $html .=  '<td>';
          $html .=  $attribute->multiplicity;
          $html .=  '</td>';
          $html .=  '</tr>';
        }
      $html .= '</table>';
    }
    return $html;
  }

  function outputFlattenedAttributes() {
    $this->logger->log('<br><b>Attribute mit Pfad:</b>');
    $output = array();
    if (!empty($this->attributes)) {
      foreach ($this->attributes AS $attribute) {
        $this->logger->log('<br>Attribut Pfad: ' . $attribute->path_name . ' (' . $attribute->short_name . ')');
        if (RENAME_ZEIGT_AUF_EXTERNES) {
          $zeigt_auf_externes_pos = strpos($attribute->path_name, 'zeigtAufExternes');
          if ($zeigt_auf_externes_pos !== false) {
            $zeigt_auf_externes_path_name = substr($attribute->path_name, 0, $zeigt_auf_externes_pos + 16);
            if (!array_key_exists($zeigt_auf_externes_path_name, $output)) {
              $output[$zeigt_auf_externes_path_name] = 'zeigtaufexternes_';
            }
          }
        }
        if ($attribute->short_name != end($attribute->parts)->name) {
          if ($attribute->overwrite['type'] != '') {
            $key = $attribute->overwrite['path_name'];
          }
          else {
            $key = $attribute->path_name;
          }
          $output[$key] = $attribute->short_name;
        }
      }
    }
    return $output;
  }

  function hasGeometryColumn() {
    $hasGeometryColumn = false;
    foreach($this->attributes AS $attribute) {
      if ($attribute->name == GEOMETRY_COLUMN_NAME) {
        $hasGeometryColumn = true;
      }
    }
    return $hasGeometryColumn;
  }

  function getGeometryType() {
    $geometry_type = 100;
    foreach($this->attributes AS $attribute) {
      if($attribute->name == GEOMETRY_COLUMN_NAME) {
        $geometry_type = $attribute->get_gfs_type($attribute->get_database_type(false, false), NULL);
      }
    }
    return $geometry_type;
  }

  function asSql() {
    $attribute_parts = array();
    $sql = "
" . PG_CREATE_TABLE . " " . $this->name . " (
";

    # Ausgabe id
    if ($this->parent == null) {
      $part .= " " . $this->primaryKey;
      if (WITH_UUID_OSSP) {
        $part .= " uuid NOT NULL DEFAULT uuid_generate_v1mc()";
      }
      else {
        $part .= " " . $this->primaryKeyType;
      }
      $attribute_parts[] = $part;
    }

    $hat_objektkoordinaten = false;
    # Ausgabe Attribute
    foreach($this->attributes AS $attribute) {
      if (!in_array($attribute->name, array(GEOMETRY_COLUMN_NAME, "objektkoordinaten"))) {
        $attribute_parts[] = $attribute->asSql('table');
      }
      if ($attribute->name == "objektkoordinaten") {
        $hat_objektkoordinaten = true;
      }
    }

    # Ausgabe Assoziationsenden
    $attribute_parts = array_merge(
      $attribute_parts,
      array_map(
        function($associationsEnd) {
          return $associationsEnd->asSql('table');
        },
        $this->associationEnds
      )
    );

    # Ausgabe Primary Key
    if ($this->primaryKey != '')
      $attribute_parts[] = "  PRIMARY KEY (" . $this->primaryKey . ')';

    # Zusammenfügen der Attributteile
    $sql .= implode(",\n", $attribute_parts);

    $sql .= '
)';

    # Ausgabe Vererbung
    if ($this->parent != null)
      $sql .= ' INHERITS (' . $this->parent->name . ')';

    # Ausgabe WITH OIDS
    if ($this->withOids)
      $sql .= ' WITH OIDS';

    $sql .= ';
';  # Tabellenende

    if(WITH_INDEXES) {
      $sql .= "
CREATE UNIQUE INDEX " . $this->name . "_gml ON " . $this->name . " USING btree (gml_id,beginnt);
CREATE INDEX " . $this->name . "_endet ON " . $this->name . " USING btree (endet);";
    }

    # Set epsg code
    if (!empty(GEOMETRY_EPSG_CODE) and $this->hasGeometryColumn()) {
      $sql .= "
SELECT AddGeometryColumn('" . $this->name . "', '" . GEOMETRY_COLUMN_NAME . "', " . GEOMETRY_EPSG_CODE . ", 'GEOMETRY', 2);";
      if(WITH_INDEXES) {
        $sql .= "
CREATE INDEX " . $this->ogrSchema->identifier( $this->name . "_" . GEOMETRY_COLUMN_NAME . "_idx" ) . " ON " . $this->name . " USING gist (" . GEOMETRY_COLUMN_NAME . ");";
      }
    }

    if ($hat_objektkoordinaten) {
      $sql .= "
SELECT AddGeometryColumn('" . $this->name . "', 'objektkoordinaten', " . GEOMETRY_EPSG_CODE . ", 'POINT', 2);";
      if(WITH_INDEXES) {
        $sql .= "
CREATE INDEX " . $this->ogrSchema->identifier( $this->name . "_objektkoordinaten_idx" ) . " ON " . $this->name . " USING gist (objektkoordinaten);";
      }
    }

    if(WITH_INDEXES) {
      # Ausgabe Assoziationsindizes
      foreach($this->associationEnds AS $associationEnd) {
        $sql .= $associationEnd->getIndex($this->alias);
      }

      if ($this->parent != null) {
        # Ausgabe vererbter Assoziationsenden
        foreach($this->getParentsAssociationEnds() AS $associationEnd) {
          $sql .= $associationEnd->getIndex($this->alias);
        }
      }
    }

    $sql .= '
';

    if(COMMENTS) {
      # Ausgabe Tabellenkommentare
      if (!empty($this->comments)) {
        $sql .= "\nCOMMENT ON TABLE " . $this->name . " IS '" .
          implode(', ', $this->comments) . "';";
      }

      # Ausgabe Attributkommentare
      foreach($this->attributes AS $attribute) {
        $sql .= $attribute->getComment($this->name);
      }

      # Ausgabe Assoziationskommentare
      foreach($this->associationEnds AS $associationEnd) {
        $sql .= $associationEnd->getComment($this->name);
      }
    }

    # Ausgabe Tabellen Values
    if (!empty($this->values->rows)) {
      $sql .= "\nINSERT INTO " . $this->name . ' (' .
        implode(
          ',',
          array_map(
            function($attribute) {
              return $attribute->name;
            },
            $this->attributes
          )
        ) .
      ") VALUES\n";
      $sql .= $this->values->asSql();
      $sql .= ';';
    }

    return $sql;
  }

  function asGraphML() {
    $attribute_parts = array();
    $xml = '    <node id="n' . $this->id . '">
      <data key="d5">
        <y:GenericNode configuration="com.yworks.entityRelationship.big_entity">
          <y:Geometry height="103.0" width="220.0" x="10754.150804910565" y="16311.552704206119"/>
          <y:Fill color="#FFFFE1" transparent="false"/>
          <y:BorderStyle color="#000000" type="line" width="1.0"/>
          <y:NodeLabel alignment="center" autoSizePolicy="content" backgroundColor="#FFFFE1" configuration="com.yworks.entityRelationship.label.name" fontFamily="Courier" fontSize="12" fontStyle="plain" hasLineColor="false" height="19.66796875" horizontalTextPosition="center" iconTextGap="4" modelName="internal" modelPosition="t" textColor="#000000" verticalTextPosition="bottom" visible="true" width="184.029296875" x="17.9853515625" y="4.0">' . $this->name . '</y:NodeLabel>
          <y:NodeLabel alignment="left" autoSizePolicy="content" backgroundColor="#FFFFFF" configuration="com.yworks.entityRelationship.label.attributes" fontFamily="Courier" fontSize="12" fontStyle="plain" hasLineColor="false" height="51.00390625" horizontalTextPosition="center" iconTextGap="4" modelName="custom" textColor="#000000" verticalTextPosition="bottom" visible="true" width="90.4140625" x="2.0" y="31.66796875">
';

    # Ausgabe id
    if ($this->parent == null) {
      $part .= " " . $this->primaryKey;
      if (WITH_UUID_OSSP) {
        $part .= " uuid NOT NULL DEFAULT uuid_generate_v1mc()";
      }
      else {
        $part .= " " . $this->primaryKeyType;
      }
      $attribute_parts[] = $part;
    }

    $hat_objektkoordinaten = false;
    # Ausgabe Attribute
    foreach($this->attributes AS $attribute) {
      if (!in_array($attribute->name, array(GEOMETRY_COLUMN_NAME, "objektkoordinaten"))) {
        $attribute_parts[] = $attribute->asSql('table');
      }
      if ($attribute->name == "objektkoordinaten") {
        $hat_objektkoordinaten = true;
      }
    }

    # Ausgabe Assoziationsenden
    $attribute_parts = array_merge(
      $attribute_parts,
      array_map(
        function($associationsEnd) {
          return $associationsEnd->asSql('table');
        },
        $this->associationEnds
      )
    );

    if ($hat_objektkoordinaten) {
      $this->attribute_parts.push('objektkoordinaten geometry(Point, ' . GEOMETRY_EPSG_CODE . ')');
    }

    # Zusammenfügen der Attributteile
    $xml .= implode("\n", $attribute_parts);
    $xml .= '
            <y:LabelModel>
              <y:ErdAttributesNodeLabelModel/>
            </y:LabelModel>
            <y:ModelParameter>
              <y:ErdAttributesNodeLabelModelParameter/>
            </y:ModelParameter>
          </y:NodeLabel>
        </y:GenericNode>
      </data>
    </node>
';
    # Ausgabe Vererbung
    if ($this->parent != null) {
      $xml .= 'INHERITS
    <edge id="e' . $this->id .'" source="n' . $this->id . '" target="n' . $this->parent->id . '">
      <data key="d9">
        <y:PolyLineEdge>
          <y:Path sx="0.0" sy="0.0" tx="0.0" ty="0.0"/>
          <y:LineStyle color="#000000" type="dashed" width="1.0"/>
          <y:Arrows source="white_triangle" target="circle"/>
          <y:BendStyle smoothed="false"/>
        </y:PolyLineEdge>
      </data>
    </edge>
';
    }



    return $xml;
  }

  function asFlattenedSql() {
    $attribute_parts = array();
    $sql = "
" . PG_CREATE_TABLE . " " . $this->name . " (
";
    # ogc_fid Spalte
    $attribute_parts[] .= "  " . $this->primaryKey . " serial NOT NULL";

    # identifier Spalte
    if(PG_WITH_IDENTIFIER) {
      $attribute_parts[] .= "  identifier " . PG_CHARACTER_VARYING;
    }

    # gml_id Spalte
    $attribute_parts[] .= "  gml_id " . PG_GML_ID . " NOT NULL";

    $hat_objektkoordinaten = false;

    # Ausgabe Attribute
    foreach($this->attributes AS $attribute) {
      if (!in_array($attribute->name, array(GEOMETRY_COLUMN_NAME, "objektkoordinaten"))) {
        $attribute_parts[] = $attribute->asFlattenedSql();
      }
      if ($attribute->name == "objektkoordinaten") {
        $hat_objektkoordinaten = true;
      }
    }

    if ($this->parent != null) {
      # Ausgabe vererbter Assoziationsenden
      $attribute_parts = array_merge(
        $attribute_parts,
        array_map(
          function($associationsEnd) {
            return $associationsEnd->asSql('table');
          },
          $this->getParentsAssociationEnds()
        )
      );
    }

    # Ausgabe Assoziationsenden
    $attribute_parts = array_merge(
      $attribute_parts,
      array_map(
        function($associationsEnd) {
          return $associationsEnd->asSql('table');
        },
        $this->associationEnds
      )
    );

    # Ausgabe Primary Key
    if ($this->primaryKey != '')
      $attribute_parts[] = "  PRIMARY KEY (" . $this->primaryKey . ')';

    # Zusammenfügen der Attributteile
    $sql .= implode(",\n", $attribute_parts);

    $sql .= '
)';

    # Ausgabe WITH OIDS
    if ($this->withOids)
      $sql .= ' WITH OIDS';

    $sql .= ';
';  # Tabellenende

    if(WITH_INDEXES) {
      $sql .= "
CREATE UNIQUE INDEX " . $this->name . "_gml ON " . $this->name . " USING btree (gml_id,beginnt);
CREATE INDEX " . $this->name . "_endet ON " . $this->name . " USING btree (endet);";
    }

    # Set epsg code
    if (!empty(GEOMETRY_EPSG_CODE) and $this->hasGeometryColumn()) {
      $sql .= "
SELECT AddGeometryColumn('" . $this->name . "', '" . GEOMETRY_COLUMN_NAME . "', " . GEOMETRY_EPSG_CODE . ", 'GEOMETRY', 2);";
      if(WITH_INDEXES) {
        $sql .= "
CREATE INDEX " . $this->ogrSchema->identifier( $this->name . "_" . GEOMETRY_COLUMN_NAME . "_idx" ) . " ON " . $this->name . " USING gist (" . GEOMETRY_COLUMN_NAME . ");";
      }
    }

    if ($hat_objektkoordinaten) {
      $sql .= "
SELECT AddGeometryColumn('" . $this->name . "', 'objektkoordinaten', " . GEOMETRY_EPSG_CODE . ", 'POINT', 2);";
      if(WITH_INDEXES) {
        $sql .= "
CREATE INDEX " . $this->ogrSchema->identifier( $this->name . "_objektkoordinaten_idx" ) . " ON " . $this->name . " USING gist (objektkoordinaten);";
      }
    }

    if(WITH_INDEXES) {
      # Ausgabe Assoziationsindizes
      foreach($this->associationEnds AS $associationEnd) {
        $sql .= $associationEnd->getIndex($this->alias);
      }

      if ($this->parent != null) {
        # Ausgabe vererbter Assoziationsenden
        foreach($this->getParentsAssociationEnds() AS $associationEnd) {
          $sql .= $associationEnd->getIndex($this->alias);
        }
      }
    }

    $sql .= '
';

    if(COMMENTS) {
      # Ausgabe Tabellenkommentare
      if (!empty($this->comments)) {
        $sql .= "\nCOMMENT ON TABLE " . $this->name . " IS '" .
          implode(', ', $this->comments) . "';";
      }

      # Ausgabe Attributkommentare
      foreach($this->attributes AS $attribute) {
        $sql .= $attribute->getFlattenedComment($this->name);
      }

      # Ausgabe Assoziationskommentare
      foreach($this->associationEnds AS $associationEnd) {
        $sql .= $associationEnd->getComment($this->name);
      }
    }

    # Ausgabe Tabellen Values
    if (!empty($this->values->rows)) {
      $sql .= "\nINSERT INTO " . $this->name . ' (' .
        implode(
          ',',
          array_map(
            function($attribute) {
              return $attribute->name;
            },
            $this->attributes
          )
        ) .
      ") VALUES\n";
      $sql .= $this->values->asSql();
      $sql .= ';';
    }

    return $sql;
  }

  function asGfs() {
    $attribute_parts = array();
    $gfs = "
  <GMLFeatureClass>
    <Name>" . strtolower($this->alias) . "</Name>
    <ElementPath>" . $this->alias . "</ElementPath>";

    # identifier Spalte
    if(PG_WITH_IDENTIFIER) {
      $attribute_parts[] .= "
    <PropertyDefn>
      <Name>identifier</Name>
      <ElementPath>identifier</ElementPath>
      <Type>String</Type>
      <Width>28</Width>
    </PropertyDefn>";
    }

    $hat_position = false;
    $hat_objektkoordinaten = false;
    # Ausgabe Attribute
    foreach($this->attributes AS $attribute) {
      if ($attribute->name == "wkb_geometry") {
        $hat_position = true;
      }
      if ($attribute->name == "objektkoordinaten") {
        $hat_objektkoordinaten = true;
      }
    }

    if ($hat_position) {
      $attribute_parts[] .= "
      <GeomPropertyDefn>
        <Name>wkb_geometry</Name>
        <ElementPath>position</ElementPath>
        <GeometryType>" . $this->getGeometryType() . "</GeometryType>
      </GeomPropertyDefn>";
    }

    if($hat_objektkoordinaten) {
      $attribute_parts[] .= "
    <GeomPropertyDefn>
      <Name>objektkoordinaten</Name>
      <ElementPath>objektkoordinaten</ElementPath>
      <GeometryType>1</GeometryType>
    </GeomPropertyDefn>";
    }

    # gml_id Spalte
    $attribute_parts[] .= "
    <PropertyDefn>
      <Name>gml_id</Name>
      <ElementPath>gml_id</ElementPath>
      <Type>String</Type>
      <Width>16</Width>
    </PropertyDefn>";

    # Ausgabe Attribute
    $attribute_parts = array_merge(
      $attribute_parts,
      array_map(
        function($attribute) {
          return $attribute->asGfs();
        },
        $this->attributes
      )
    );

    if ($this->parent != null) {
      # Ausgabe vererbter Assoziationsenden
      $attribute_parts = array_merge(
        $attribute_parts,
        array_map(
          function($associationsEnd) {
            return $associationsEnd->asGfs();
          },
          $this->getParentsAssociationEnds()
        )
      );
    }

    # Ausgabe Assoziationsenden
    $attribute_parts = array_merge(
      $attribute_parts,
      array_map(
        function($associationsEnd) {
          return $associationsEnd->asGfs();
        },
        $this->associationEnds
      )
    );

    # Zusammenfügen der Attributteile
    $gfs .= implode('', $attribute_parts);

    $gfs .= "
  </GMLFeatureClass>";

    return $gfs;
  }

}
?>
