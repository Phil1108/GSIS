<?php
class DatabaseObject {
  function __construct($name, $logger) {
    $this->name = $name;
    $this->logger = $logger;
  }

  function openConnection(
    $host = 'localhost',
    $dbname = 'postgres',
    $user = 'postgres',
    $password = 'postgres',
    $port = 5432
  ) {
    $this->dbConn = pg_connect(
       "host=" . $host .
      " port=" . $port .
      " dbname=" . $dbname .
      " user=" . $user .
      " password=" . $password
    ) or exit (
       "Es konnte keine Verbindung zum Datenbankserver hergestellt werden."
    );
    return $this->dbConn;
  }
}
?>
