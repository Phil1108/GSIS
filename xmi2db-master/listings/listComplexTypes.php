<?php
// +----------------------------------------------------------------------+
// | listComplexeTypes.php                                                |
// | Liste complexe data types from UML-Modell created with xmi2db.php    |
// +----------------------------------------------------------------------+
// | Author: Peter Korduan <peter.korduan@gdi-service.de>                 |
// | Licence: GPL https://www.gnu.org/licenses/gpl-3.0.de.html            |
// +----------------------------------------------------------------------+
  include('../conf/database_conf.php');
  include('../classes/logger.php');
  include('../classes/databaseobject.php');
  include('../classes/schema.php');
  include('../classes/table.php');
  include('../classes/attribute.php');
  include('../classes/data.php');
  include('../classes/datatype.php');
  include('../classes/enumtype.php');
  include('../classes/associationend.php');
  include('../classes/featuretype.php');
  $tabNameAssoc = array();
  $log_sql = '';
  $logger = new Logger(LOGLEVEL);
echo '<!DOCTYPE html>
<html lang="de">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  </head>
  <body>';
  #*****************************************************************************
  #
  #*****************************************************************************

  # Initialize the umlSchema object
  $umlSchema = new Schema(UML_SCHEMA, $logger);
  $umlSchema->openConnection(PG_HOST, PG_DBNAME, PG_USER, PG_PASSWORD, PG_PORT);

  # Initialize the gmlSchema object
  $gmlSchema = new Schema(CLASSES_SCHEMA, $logger);
  $sql = $gmlSchema->asSql();

  $umlSchema->logger->level = 0;
  #**************
  # Enumerations
  #**************
  # Erzeuge Enumerations
  foreach($umlSchema->getEnumerations() AS $enumeration) {
    $sql .= $umlSchema->createEnumerationTable($enumeration, $gmlSchema);
  }
  $logger->log('<br><hr><br>');

  #***********
  # CodeLists
  #***********
  # Lade CodeLists
  foreach($umlSchema->getCodeLists() AS $code_list) {
    $sql .= $umlSchema->createCodeListTable($code_list);
  }
  $logger->log('<br><hr><br>');

  #***********
  # Unions
  #***********
  # Lade oberste Klassen vom Typ Union
  $topDataTypes = $umlSchema->getTopUmlClasses('Union');

  # Für alle oberen Unions
  foreach($topDataTypes as $topDataType) {
    $umlSchema->logger->log('<br><b>Top UnionType: ' . $topDataType['name'] . '</b> (' . $topDataType['xmi_id'] . ')');
    $sql .= $umlSchema->createComplexDataTypes('Union', $topDataType, $gmlSchema);
  }
  $logger->log('<br><hr><br>');

  #********************************************
  # Create DataTypes not definend in UML-Model
  #********************************************
  $sql .= $umlSchema->createExternalDataTypes($gmlSchema);
  $logger->log('<br><hr><br>');

  #***********
  # DataTypes
  #***********
  $dataTypes = array();
  # Lade oberste Klassen vom Typ DataType
  $topDataTypes = $umlSchema->getTopUmlClasses('DataType');

  # Für alle oberen Datentypen
  foreach($topDataTypes as $topDataType) {
    $umlSchema->logger->log('<br><b>Top DataType: ' . $topDataType['name'] . '</b> (' . $topDataType['xmi_id'] . ')');
    $sql .= $umlSchema->createComplexDataTypes('DataType', $topDataType, $gmlSchema);
  }
  $logger->log('<br><hr><br>');

  #**************
  # FeatureTypes
  #**************
  # Lade oberste Klassen vom Typ FeatureType, die von keinen anderen abgeleitet wurden
  $topClasses = $umlSchema->getTopUmlClasses('FeatureType');

  # Für alle oberen Klassen
  foreach($topClasses as $topClass) {
    $umlSchema->logger->log('<br><b>TopKlasse: ' . $topClass['name'] . '</b> (' . $topClass['xmi_id'] . ')');
    $sql .= $umlSchema->createFeatureTypeTables('FeatureType', null, $topClass);
  }
  $logger->log('<br><hr><br>');

  #******************
  # n:m Associations
  #******************
  # Lade n:m Associations
  $associations = $umlSchema->getAssociations();
  foreach($associations AS $association) {
    $text = '<br><b>Association: ' . $association['assoc_id'] . '</b><br>' .
      $association['a_class'] . ' hat ' . $association['a_num'] . ' ' . $association['b_class'] . ' über ' . $association['a_rel'] . '<br>';
    if ($association['b_rel'] != '')
      $text .= $association['b_class'] . ' hat ' . $association['b_num'] . ' ' . $association['b_rel'];
    if ($association['a_num'] == 'n' AND $association['b_num'] == 'n') {
      $assoc_table = strtolower($association['a_class'] . '2' . $association['b_class']);
      $text .= '<br>Lege n:m Tabelle ' . $assoc_table . ' an.';
      $sql .= $umlSchema->createAssociationTable($association);
    }
    $umlSchema->logger->log($text);
  }

  $logger->log('<br>Ende Debug Ausgabe<br><hr><br>');
  $umlSchema->logger->level = 1;
# $gmlSchema->execSql($sql);
  $logger->log('<b>Komplexe Uniontypen:</b><br>' . $umlSchema->outputUnionListHtml());
  $logger->log('<b>Komplexe Datentypen:</b><br>' . $umlSchema->outputDataTypeListHtml());
echo '  </body>
</html>';
?>
