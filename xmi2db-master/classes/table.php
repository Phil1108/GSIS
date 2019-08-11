<?php
class Table {

  function __construct($name, $id = 0) {
    $this->alias = $name;
    $this->name = strtolower(substr($name, 0, PG_MAX_NAME_LENGTH));
    $this->id = $id;
    $this->comments = array();
    if ($this->name != $this->alias)
      $this->comments[] = 'Alias: "' . $this->alias . '"';
    $this->attributes = array();
    $this->primaryKey = '';
    $this->inherits = '';
    $this->withOids = PG_WITH_OIDS;
    $this->values = new Data();
  }

  function addAttribute($attribute) {
    $this->attributes[] = $attribute;
  }

  function getKeys() {
    return array_map(
      function($attribute) {
        return $attribute['name'];
      },
      $this->attributes
    );
  }

  function addComment($comment) {
    $this->comments[] = $comment;
  }

  function asSql() {
    $sql = "
" . PG_CREATE_TABLE . " " . $this->name . " (
";

    # Ausgabe Attribute
    $i = 0;
    while ($i < count($this->attributes)) {
      $sql .= $this->attributes[$i]->asSql('table');
      $i++;
      if ($i < count($this->attributes))
        $sql .= ",\n";
    }

    # Ausgabe Primary Key
    if ($this->primaryKey != '')
      $sql .= ",\n  PRIMARY KEY (" . $this->primaryKey . ')';

    $sql .= '
)';

    # Ausgabe Vererbung
    if ($this->inherits != '')
      $sql .= ' INHERITS (' . $this->inherits . ')';

    # Ausgabe WITH OIDS
    if ($this->withOids)
      $sql .= ' WITH OIDS';

    $sql .= ";\n";  # Tabellenende

    if(COMMENTS) {
      # Ausgabe Tabellenkommentare
      if (!empty($this->comments)) {
        $sql .= "\nCOMMENT ON TABLE " . $this->name . " IS '" .
          implode(', ', $this->comments) . "';";
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
    $xml = '    <node id="n' . $this->id . '">
      <data key="d5">
        <y:GenericNode configuration="com.yworks.entityRelationship.big_entity">
          <y:Geometry height="103.0" width="220.0" x="10754.150804910565" y="16311.552704206119"/>
          <y:Fill color="#FFFFE1" transparent="false"/>
          <y:BorderStyle color="#000000" type="line" width="1.0"/>
          <y:NodeLabel alignment="center" autoSizePolicy="content" backgroundColor="#FFFFE1" configuration="com.yworks.entityRelationship.label.name" fontFamily="Courier" fontSize="12" fontStyle="plain" hasLineColor="false" height="19.66796875" horizontalTextPosition="center" iconTextGap="4" modelName="internal" modelPosition="t" textColor="#000000" verticalTextPosition="bottom" visible="true" width="184.029296875" x="17.9853515625" y="4.0">' . $this->name . '</y:NodeLabel>
          <y:NodeLabel alignment="left" autoSizePolicy="content" backgroundColor="#FFFFFF" configuration="com.yworks.entityRelationship.label.attributes" fontFamily="Courier" fontSize="12" fontStyle="plain" hasLineColor="false" height="51.00390625" horizontalTextPosition="center" iconTextGap="4" modelName="custom" textColor="#000000" verticalTextPosition="bottom" visible="true" width="90.4140625" x="2.0" y="31.66796875">
';

    # Ausgabe Attribute
    $i = 0;
    while ($i < count($this->attributes)) {
      $xml .= $this->attributes[$i]->asSql('table');
      $i++;
      if ($i < count($this->attributes))
        $xml .= "\n";
    }

    # Ausgabe Vererbung
    if ($this->inherits != '')
      $xml .= ' INHERITS (' . $this->inherits . ')';

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

    return $xml;
  }

}
?>
