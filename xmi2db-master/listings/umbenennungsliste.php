<?php
// +----------------------------------------------------------------------+
// | umbenennungsliste.php                                                |
// | Liste der Umbenennungen um das ogr Modell flach machen zu können     |
// +----------------------------------------------------------------------+
// | Author: Peter Korduan <peter.korduan@gdi-service.de>                 |
// | Licence: GPL https://www.gnu.org/licenses/gpl-3.0.de.html            |
// +----------------------------------------------------------------------+
  include('../conf/database_conf.php');
  include('../classes/logger.php');
  include('../classes/databaseobject.php');
  include('../classes/schema.php');
  include('../classes/ogrschema.php');
  include('../classes/table.php');
  include('../classes/attribute.php');
  include('../classes/data.php');
  include('../classes/datatype.php');
  include('../classes/enumtype.php');
  include('../classes/associationend.php');
  include('../classes/featuretype.php');

  if (file_exists(FILTER_FILE)) {
    $filter = json_decode(file_get_contents(FILTER_FILE), true);
  }
  else {
    $logger->log("Filterdatei " . FILTER_FILE . " nicht gefunden.");
    $filter = array();
  }

  $tabNameAssoc = array();
  $log_sql = '';
  $logger = new Logger(LOGLEVEL);

  #*****************************************************************************
  #
  #*****************************************************************************

  # Initialize the umlSchema object
  $umlSchema = new Schema(UML_SCHEMA, $logger);
  $umlSchema->openConnection(PG_HOST, PG_DBNAME, PG_USER, PG_PASSWORD, PG_PORT);

  # Initialize the gmlSchema object
  $ogrSchema = new OgrSchema(OGR_SCHEMA, $logger);
  $ogrSchema->umlSchema = $umlSchema;
  $sql = $ogrSchema->asSql();

  #**************
  # FeatureTypes
  #**************
  # Lade oberste Klassen vom Typ FeatureType, die von keinen anderen abgeleitet wurden
  $topClasses = $umlSchema->getTopUmlClasses('FeatureType');

  # Für alle oberen Klassen
  foreach($topClasses as $topClass) {
    $ogrSchema->listFeatureTypesAttributes('FeatureType', null, $topClass);
  }

  # Für alle Aufzählungen
  foreach($umlSchema->getEnumerations() AS $enumeration) {
    $enumType = new EnumType($enumeration['name'], $logger);
    if (strlen($enumType->name) != strlen($enumType->alias)) {
      $ogrSchema->renameList[$enumType->alias] = $enumType->name;
    }
  }

  # Sortiere Ausgabeliste
  ksort($ogrSchema->renameList);
  header('Content-Type: application/json');
  $json = '{';
  $firstline = true;
  foreach($ogrSchema->renameList AS $key => $value) {
    if ($firstline)
      $firstline = false;
    else
      $json .= ',';

    $json .= "\n  \"{$key}\":\"{$value}\"";
  }
  $json .= "\n}";
  echo $json;
  $logger->log('<br><hr><br>');

?>
