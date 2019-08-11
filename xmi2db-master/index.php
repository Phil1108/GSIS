<?php
  // +----------------------------------------------------------------------+
  // | uml2db                                                               |
  // | Ableitungen von Datenbankmodellen aus UML-Modellen im XMI-Format     |
  // +----------------------------------------------------------------------+
  // | Author: Peter Korduan <peter.korduan@gdi-service.de>                 |
  // | Licence: GPL https://www.gnu.org/licenses/gpl-3.0.de.html            |
  // +----------------------------------------------------------------------+
  if (file_exists('conf/database_conf.php')) {
    include('conf/database_conf.php');
  }
?><!DOCTYPE html>
<html lang="de">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<script src="<?php echo SCRIPT_ORIGIN; ?>jQuery-1.12.0/jquery-1.12.0.min.js"></script>
	<script src="<?php echo SCRIPT_ORIGIN; ?>bootstrap-3.3.6/js/bootstrap.min.js"></script>
	<script src="<?php echo SCRIPT_ORIGIN; ?>bootstrap-3.3.6/js/bootstrap-table.js"></script>
	<script src="lib/pascoul/pascoul.js"></script>

	<link rel="stylesheet" href="<?php echo SCRIPT_ORIGIN; ?>bootstrap-3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="<?php echo SCRIPT_ORIGIN; ?>bootstrap-3.3.6/css/bootstrap-table.css">
	<link rel="stylesheet" href="lib/pascoul/pascoul.css">

	<script language="javascript" type="text/javascript">
		function execXmi2Db() {
			var selectedFile = document.getElementById("selectedFile"),
				file = selectedFile.options[selectedFile.selectedIndex].value,
				basepkg = document.getElementById("basepkg").value,
				truncateChkbx = document.getElementById("truncate").checked;

      if (truncateChkbx == true)
        var truncate = "1";
      else
        var truncate = "0";

      var argoChkbx = document.getElementById("argo").checked;
      if (argoChkbx == true)
        var argo = "1";
      else
        var argo = "0";

      $('html, body').animate({ scrollTop: 0 }, 'fast');
      //window.location = 'converter/xmi2db.php?truncate=' + truncate + '&file=' + file + '&schema=' + umlSchema + '&basepackage=' + basepkg + '&argo=' + argo;

      var args = {};
      args['url_params'] = new Array ();
      args['url_params']['url'] = "converter/xmi2db.php";
      args['url_params']['truncate'] = truncate;
      args['url_params']['basepackage'] = basepkg;
      args['url_params']['file'] = file;
      args['url_params']['argo'] = argo;

      //Styling the progress div/box
      args['html_params'] = new Array ();
      args['html_params']['divLogBoxStyle'] = "border:1px solid #000; left: 20px; padding:10px; width:100%; height:600px; overflow:auto; background:#eee;";
      args['html_params']['progressDivTitle'] = "UML-Daten Einlesen";
      args['html_params']['progressElemStyle'] = "float: left;";
      args['html_params']['percentageSpanStyle'] = "float:left; text-align:right; display:block; margin-left:5px;";

      Pascoul.init(args);
      Pascoul.startTask();
    }

    function execDb2Classes() {
      var umlSchema = document.getElementById("db2classes_umlSchema").value,
          gmlSchema = document.getElementById("db2classes_gmlSchema").value,
          createUserInfoColumns = document.getElementById('createUserInfoColumns').checked,
          url = 'converter/db2classes.php',
          params = [];

      if (umlSchema) params.push('umlSchema=' + umlSchema);
      if (gmlSchema) params.push('gmlSchema=' + gmlSchema);
      if (createUserInfoColumns) params.push('createUserInfoColumns=1');
      if (params.length > 0) url += '?';

      window.location = url + params.join('&');
    }

    function execDb2GraphML() {
      var umlSchema = document.getElementById("db2classes_umlSchema").value,
          gmlSchema = document.getElementById("db2classes_gmlSchema").value,
          createUserInfoColumns = document.getElementById('createUserInfoColumns').checked,
          url = 'converter/db2graphml.php',
          params = [];

      if (umlSchema) params.push('umlSchema=' + umlSchema);
      if (gmlSchema) params.push('gmlSchema=' + gmlSchema);
      if (createUserInfoColumns) params.push('createUserInfoColumns=1');
      if (params.length > 0) url += '?';

      window.location = url + params.join('&');
    }

    function execDb2Ogr() {
      var umlSchema = document.getElementById("db2ogr_umlSchema").value,
          ogrSchema = document.getElementById("db2ogr_ogrSchema").value,
          epsgCode = document.getElementById("db2ogr_epsgCode").value,
          withCodeLists = $('#db2ogr_withCodeLists').val();

      window.location = 'converter/db2ogr.php?umlSchema=' + umlSchema + '&ogrSchema=' + ogrSchema + '&epsgCode=' + epsgCode + '&withCodeLists=' + withCodeLists;
    }

    function execDb2Gfs() {
      var umlSchema = document.getElementById("db2ogr_umlSchema").value,
          ogrSchema = document.getElementById("db2ogr_ogrSchema").value,
          epsgCode = document.getElementById("db2ogr_epsgCode").value,
          withCodeLists = $('#db2ogr_withCodeLists').val();

      window.location = 'converter/db2gfs.php?umlSchema=' + umlSchema + '&ogrSchema=' + ogrSchema + '&epsgCode=' + epsgCode + '&withCodeLists=' + withCodeLists;
    }

    function test() {
      var selectedConf = document.getElementById("selectedConf");
      var conf = selectedConf.options[selectedConf.selectedIndex].value;

      window.location = 'converter/test.php?conf=' + conf;
    }
  </script>
  <title>UML to DB model</title>
  </head>
  <body>
  <div class="container">
    <h2>Ableitung von PostgreSQL-Datenbankmodellen aus UML-Modellen</h2><?php
  if (!file_exists('conf/database_conf.php')) {
    echo preg_replace(
      "/\r|\n/",
      "",
      file('README.md')[3]
    ); ?>
    <br><b>Es wurde noch keine Konfigurationsdatei angelegt!</b><br>
    Kopiere die Datei conf/samples/database_conf.php nach conf/database_conf.php und passe die Variablen entsprechend an. <?php
  }
  else {
    echo VERSION; ?>
    <br>
    <?php
    if (!file_exists(SCHEMA_CONF_FILE)) { echo SCHEMA_CONF_FILE; ?>
      <br><b>Es wurde noch keine Konfigurationsdatei für das Schema angelegt!</b>
      <br>Kopiere die Datei conf/samples/model_aaa_conf.php nach conf/model_aaa_conf.php, passe die Konstante SCHEMA_CONF_FILE in conf/database_conf.php an sowie den Schema- und die Paketnamen in conf/model_aaa_conf.php.<?php
    }
    else { ?>
      Gewählte Konfigurationsdatei: <b><?php echo SCHEMA_CONF_FILE; ?></b><br>
      <i>Die Einstellung erfolgt in der Konfigurationsdatei 'conf/database_conf.php' in der Konstante <b>SCHEMA_CONF_FILE</b></i><?php
    } ?>
    <h3>xmi2db</h3>
    xmi2db überträgt die UML-Modell Elemente der ausgewählten xmi Datei in das ausgewählte Datenbank Schema. Eingelesen werden nur die Elemente ab dem ausgewählten Basispaket.
    <h4>Gewählte Pakete</h4>
    <i>Folgende Pakete wurden laut <?php echo SCHEMA_CONF_FILE; ?> ausgewählt:</i><br>
    <ul class="list-unstyled">
    <?php
      include(SCHEMA_CONF_FILE);
      if (PACKAGES!='PACKAGES') {
        $packages = str_replace("'", "", PACKAGES);
        $packages = explode(";", $packages);
        foreach ($packages as $package) {
          echo '<li class="col-md-6">'.$package.'</li>';
        }
      }
      else echo "Keine Pakete gewählt!";
    ?>
    </ul>
    <div style="clear: both;">
      <i><b>(Beachte: Hierarchien sind unbedingt zu beachten bei der Angabe der Pakete in der database_conf.php! Das heißt: Möchte man Pakete in einem XPlan Modell auswählen, muss man das oberste Paket "XPlanGML 4.1" bzw. "XPlanGML 5.0" unbedingt mitangeben. Möchte man "BP_Bebauung" wählen, muss auch das Paket "Bebauungsplan" gewählt werden, da sich "BP_Bebauung" in "Bebauungsplan" befindet.)</b></i>
    </div>
  </div>
  <div class="container">
    <h4>Dateiauswahl</h4>
    <i>Zur Auswahl weiterer Dateien diese vorher auf dem Server in das Unterverzeichnis xmis dieser Anwendung ablegen.</i><br>
    <select class="form-control" id="selectedFile"><?php
      $files = scandir('xmis');
      foreach ($files AS $i => $file) {
        $path_parts = pathinfo($file);
        if (!is_dir($file) and $path_parts['extension'] == 'xmi') { ?>
          <option value="../xmis/<?php echo $file; ?>" <?php if ($file == '2016-06-30_Modell_EA-xmi12-uml14.xmi') echo 'selected'; ?>><?php echo $file; ?></option><?php
        }
      } ?>
    </select>
    <h4>Schemaauswahl/-eingabe</h4>
    Gewähltes Schema: <b><?php echo UML_SCHEMA; ?></b><br>
    <i>Die Einstellung erfolgt in der Konfigurationsdatei 'conf/database_conf.php' in der Konstante <b>UML_SCHEMA</b></i>

    <h4>BasePackageauswahl/-eingabe</h4>
    <i>Bei einem EA-Export des XPlan-Modells "XPlanGML 4.1" oder "XPlanGML 5.0" wählen, bei einem ArgoUML Export leer lassen oder ein Package eintragen, falls man nur das eine laden möchte.</i><br>
    <input type="text" id="basepkg" name="basepkg" list="basepkgNameListe" size="50"/>
    <datalist id="basepkgNameListe">
      <option value="XPlanGML 4.1" selected>XPlanGML 4.1</option>
      <option value="XPlanGML 5.0" selected>XPlanGML 5.0</option>
      <option value="Raumordnungsplan_Kernmodell">Raumordnungsplan_Kernmodell</option>
    </datalist>
    <!--input type="text" id="basepkg" name="basepkg" list="basepkgNameListe" value="XPlanGML 4.1"/>
    <datalist id="basepkgNameListe">
      <option value="XPlanGML 4.1">XPlanGML 4.1</option>
      <option value="Raumordnungsplan_Kernmodell">Raumordnungsplan_Kernmodell</option>
      <option value="">Alle Pakete</option>
    </datalist-->
    <div class="checkbox">
      <label><input type="checkbox" value="checked" id="truncate" checked="checked"> Tabellen vor dem Einlesen leeren</label>
    </div>
    <div class="checkbox">
      <label><input type="checkbox" id="argo">Argo Export mit ISO19136 Profil</label>
    </div>
    Das Befüllen der Datenbank mit den Inhalten der XMI-Datei, insbesondere der tagged values, kann einige Minuten dauern!
    <div class="text-center" id="queryButton">
    <button type="submit" class="btn btn-primary btn-sm" id="execXmi2Db" onclick="execXmi2Db()">
      <span class="glyphicon glyphicon-ok"> </span> Fülle DB mit XMI Inhalten</button>
    <!--<button type="submit" class="btn btn-primary btn-sm" id="testBtn" onclick="test()">
      <span class="glyphicon glyphicon-ok"> </span> Test</button>-->
    <button type="button" class="btn btn-danger btn-sm" id="cancelXmi2Db" onclick="Pascoul.stopTask();">
      <span class="glyphicon glyphicon-remove"> </span> Abbrechen</button>
    </div>

    <h3>db2classes</h4>
    db2classes erzeugt ein GML-Klassenschema anhand der mit xmi2db eingelesenen UML-Modell-Elemente.
    Das GML-Klassenschema enthält nach dem Ausführen des erzeugten SQL im ausgewählten Schema
    <ul>
      <li>je einen PostgreSQL Enum-DataType pro Enumeration. Die Aufzählung enthält die Werte, nicht die Beschreibungen aus dem UML-Model.</li>
      <li>je eine Tabelle für Enumerations, wenn diese Beschreibungen enthält. Die Tabellennamen werden mit dem Präfix "enum_" versehen und befüllt mit 'wert' und 'beschreibung' aus dem UML-Modell.</li>
      <li>je eine leere Tabelle pro FeatureType</li>
      <li>FeatureType-Tabellen haben Attribute für die Assoziationen</li>
      <li>FeatureType-Attribute mit Kardinalität > 1 sind Arrays</li>
      <li>je eine mit den Werten befüllte Tabelle pro CodeListe (falls im UML-Modell enthalten)</li>
      <li>je einen nutzerdefinierten Postgres Datentyp pro UML DataType</li>
      <li>je eine Tabelle pro n:m Beziehung. Die Namen setzen sich aus den beteiligten Tabellen getrennt mit "_zu_" zusammen</li>
    </ul>
  </div>
  <div class="container">
    <h4>UML-Schema</h4>
    <i>Das Schema in dem vorher die UML-Elemente mit xmi2db eingelesen wurden.</i><br>
    Gewähltes Schema: <br>
    <select class="form-control" id="db2classes_umlSchema">
    <?php
      $schemas = str_replace("'", "", UML_SCHEMA);
      $schemas = explode(";", $schemas);
      foreach ($schemas as $schema) {
        echo '<option value="'.$schema.'">'.$schema.'</option>';
      }
    ?>
    </select>
    <i>(Die Einstellung erfolgt in der Konfigurationsdatei 'conf/database_conf.php' in der Konstante <b>UML_SCHEMA</b>)</i>
    <!--
    <input type="text" id="db2classes_umlSchema" name="umlSchema" list="db2classes_umlSchemaListe" size="50" value="<?php //echo UML_SCHEMA; ?>"/>
    <datalist id="db2classes_umlSchemaListe">
      <option value="<?php //echo UML_SCHEMA; ?>" selected><?php //echo UML_SCHEMA; ?></option>
    </datalist>
    -->

    <h4>GML-Klassenschema</h4>
    <i>Das Schema in dem die GML-Tabellen und Datentypen angelegt werden sollen.</i><br>
    Gewähltes Schema:<br>
    <select class="form-control" id="db2classes_gmlSchema">
    <?php
      $schemas = str_replace("'", "", CLASSES_SCHEMA);
      $schemas = explode(";", $schemas);
      foreach ($schemas as $schema) {
        echo '<option value="'.$schema.'">'.$schema.'</option>';
      }
    ?>
    </select>
    <i>(Die Einstellung erfolgt in der Konfigurationsdatei 'conf/database_conf.php' in der Konstante <b>CLASSES_SCHEMA</b>)</i>
    <!--
    <input type="text" id="db2classes_gmlSchema" name="gmlSchema" list="db2classes_gmlSchemaListe" size="50" value="<?php //echo CLASSES_SCHEMA; ?>"/>
    <datalist id="db2classes_gmlSchemaListe">
      <option value="<?php //echo CLASSES_SCHEMA; ?>" selected><?php //echo CLASSES_SCHEMA; ?></option>
    </datalist>
    -->

    <div class="checkbox">
      <label><input type="checkbox" id="createUserInfoColumns"> Spalten für user_id, created_at, updated_at und konvertierung_id an alle FeatureType-Tabellen anhängen.</label>
    </div>

    <div class="text-center" id="queryButton">
      <button type="submit" class="btn btn-primary btn-sm" id="queryNERC" onclick="execDb2Classes()"><span class="glyphicon glyphicon-ok"> </span> Erzeuge GML-Klassenschema</button>
      <button type="submit" class="btn btn-primary btn-sm" id="queryNERC" onclick="execDb2GraphML()" style="background-color: #498649"><span class="glyphicon glyphicon-ok"> </span> Erzeuge GraphML vom Datenbank-Schema</button>
    </div>

    <h3>db2ogr</h4>
    db2ogr erzeugt aus dem UML-Modell ein flaches GML-Schema welches zum Einlesen von komplexen GML-Dateien mit ogr2ogr geeignet sein sollte. Die Tabellen der FeatureTypen enthalten alle Attribute der abgeleiteten Klassen und der verzweigenden komplexen Datentypen. Das Schema enthält nach dem Ausführen des erzeugten SQL im ausgewählten Schema
    <ul>
      <li>je eine mit den Werten befüllte Tabelle pro Enumeration</li>
      <li>je eine leere Tabelle pro FeatureType</li>
      <li>je eine mit den Werten befüllte Tabelle pro CodeListe (falls im UML-Modell enthalten)</li>
    </ul>
  </div>

	<div class="container">
		<h4>UML-Schema</h4>
		<i>Das Schema in dem vorher die UML-Elemente mit xmi2db eingelesen wurden.</i><br>
		<select class="form-control" id="db2ogr_umlSchema">
		<?php
			$schemas = str_replace("'", "", UML_SCHEMA);
			$schemas = explode(";", $schemas);
			foreach ($schemas as $schema) {
				echo '<option value="'.$schema.'">'.$schema.'</option>';
			}
		?>
		</select>

    <!--
    <input type="text" id="db2ogr_umlSchema" name="umlSchema" list="db2ogr_umlSchemaListe" size="50" value="<?php //echo UML_SCHEMA; ?>"/>
    <datalist id="db2ogr_umlSchemaListe">
      <option value="<?php //echo UML_SCHEMA; ?>" selected><?php //echo UML_SCHEMA; ?></option>
    </datalist>
    -->

		<h4>OGR-Schema</h4>
		<i>Das Schema in dem die GML-Tabellen und Datentypen angelegt werden sollen.</i><br>
		<select class="form-control" id="db2ogr_ogrSchema">
		<?php
			$schemas = str_replace("'", "", OGR_SCHEMA);
			$schemas = explode(";", $schemas);
			foreach ($schemas as $schema) {
				echo '<option value="'.$schema.'">'.$schema.'</option>';
			}
		?>
		</select>

    <h4>EPSG-Code für Geometriespalten</h4>
    <select class="form-control" id="db2ogr_epsgCode">
    <?php
      foreach (array(25832, 25833) as $epsg_code) {
        echo '<option value="' . $epsg_code . '">EPSG:' . $epsg_code . '</option>';
      }
    ?>
    </select>

    <h4>Ausgabe mit Codelisten</h4>
    Das ausgegebene Schema soll die Tabellendefinitionen und Werte von externen Codelisten beinhalten: <input id="db2ogr_withCodeLists" type="checkbox" name="db2ogr_withCodeLists" value="1" checked><br>
    <!--
    <input type="text" id="db2ogr_ogrSchema" name="ogrSchema" list="db2ogr_ogrSchemaListe" size="50" value="<?php //echo OGR_SCHEMA; ?>"/>
    <datalist id="db2ogr_ogrSchemaListe">
      <option value="<?php //echo OGR_SCHEMA; ?>" selected><?php //echo OGR_SCHEMA; ?></option>
    </datalist>
    -->
    <p>
    <div class="text-center" id="queryButton">
    <button type="submit" class="btn btn-primary btn-sm" id="queryNERC" onclick="execDb2Ogr()"><span class="glyphicon glyphicon-ok"> </span> Erzeuge OGR-Schema</button>
    <button type="submit" class="btn btn-primary btn-sm" id="queryNERC" onclick="execDb2Gfs()"><span class="glyphicon glyphicon-ok"> </span> Erzeuge GFS-Datei</button>
    </div>
  </div>
  <script language="javascript" type="text/javascript">
    $("#dbSchemaUML").change(function(){
      var schemaUML = $(this).val();
      var schemaOGR = schemaUML.substr(0,schemaUML.lastIndexOf("_")+1) + 'ogr';
      var schemaGML = schemaUML.substr(0,schemaUML.lastIndexOf("_")+1) + 'gml';
      $("#db2classes_umlSchema").val(schemaUML);
      $("#db2ogr_umlSchema").val(schemaUML);
      $("#db2ogr_ogrSchema").val(schemaOGR);
      $("#db2classes_gmlSchema").val(schemaGML);
    });
  </script><?php
  } # end of Konfigurationsdatei ist vorhanden
?>
<p><p>
  </body>
</html>