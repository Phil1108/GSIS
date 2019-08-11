<?php
class DataType {

  function __construct($name, $stereotype = 'datatype', $logger, $enumerations = NULL) {
    $this->name = strtolower(substr($name, 0, PG_MAX_NAME_LENGTH));
    $this->alias = $name;
    $this->stereotype = strtolower(substr($stereotype, 0, PG_MAX_NAME_LENGTH));
    $this->stereotype_alias = $stereotype;
    $this->comments = array();
    if ($this->name != $this->alias)
      $this->comments[] = 'Alias: "' . $this->alias . '"';
    $this->attributes = array();
    $this->inherits = '';
    $this->id = 0;
    $this->logger = $logger;
    $this->enumerations = $enumerations;
  }

  function setSchemas($umlSchema, $gmlSchema) {
    $this->umlSchema = $umlSchema;
    $this->gmlSchema = $gmlSchema;
  }

  function setId($id) {
    $this->id = $id;
  }

  function addAttribute($attribute) {
    $this->attributes[] = $attribute;
  }

  function addComment($comment) {
    $this->comments[] = $comment;
  }

  function asSql() {
    $sql = "
DO $$
BEGIN
IF NOT EXISTS (
  SELECT
    1
  FROM
    pg_type t JOIN
    pg_namespace ns ON (t.typnamespace = ns.oid)
  WHERE
    t.typname = '" . $this->name . "'
    AND ns.nspname = '" . $this->gmlSchema->schemaName . "'
) THEN
CREATE TYPE " . $this->name . " AS (
" . implode(",\n", array_map(
      function($attribute) {
        return $attribute->asSql('datatype');
      },
      $this->attributes
    )) . "
);
END IF;
END$$;";

    if(COMMENTS) {
      # Ausgabe der Kommentare
      if (!empty($this->comments)) {
        $sql .= "\nCOMMENT ON TYPE " . $this->name . " IS '" .
          implode(', ', $this->comments) . "';";
      }

      # Ausgabe Attributkommentare
      foreach($this->attributes AS $attribute) {
        $sql .= $attribute->getComment($this->name);
      }
    }

    return $sql;
  }
}
?>
