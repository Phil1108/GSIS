<html>
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.7.0/bootstrap-table.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.7.0/bootstrap-table.min.css">

    <script language="javascript" type="text/javascript">
      function exefunction(){
        var selectedSchema = document.getElementById("selectedSchema");
        var schema = selectedSchema.options[selectedSchema.selectedIndex].value;

        window.location = 'xplan2iqvoc.php?schema=' + schema;
      }
    </script>
    <title>XPlanung XMI2DB Converter</title>
  </head>
  <body>
    <div class="container">
      <h4>Schemaauswahl</h4><?php
      include( dirname(__FILE__) . "/../conf/database_conf.php");

      # Show available schemas for conversion
      $schema_sql = "SELECT schema_name FROM information_schema.schemata ORDER BY schema_name";
      $result = pg_query($db_conn, $schema_sql); ?>
      <select class="form-control" id="selectedSchema" size="15"><?php
        while ($row = pg_fetch_array($result)){ ?>
          <option value="<?php echo $row[0]; ?>"><?php echo $row[0]; ?></option><?php
        } ?>
      </select>

      <div class="text-center" id="queryButton">
        <button type="submit" class="btn btn-primary btn-sm" onclick="exefunction()"><span class="glyphicon glyphicon-ok"> </span> Erzeuge CSV für JSKOSify</button>
      </div>
    </div>
  </body>
</html>

