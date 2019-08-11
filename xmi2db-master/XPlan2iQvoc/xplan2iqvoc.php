<?
  include( dirname(__FILE__) . "/../conf/database_conf.php");

  $schema = $_REQUEST['schema'];

  $full_model = "
    SELECT
      *
    FROM" .
      $schema . ".full_model
  ";
  $result = pg_query($db_conn, $full_model);
  $current_par_package = '';
  $current_package = '';
  $current_class = '';
  $current_attribute = '';

  while ($row = pg_fetch_assoc($result)) {
    $par_package = $row['parent_package_name'];
    $package = $row['package_name'];
    $class = $row['class_name'];
    $attribute = $row['atribute_name'];
    if ($par_package != $current_par_package) {
      echo $par_package.";;;;;;;;<br>";
      $current_par_package=$par_package;
      if ($package!==$current_package) {
        echo ';'.$package.";;;;;;;<br>";
        if ($class!==$current_class) {
          echo ';;'.$class.";;;;;;<br>";
          if ($attribute!==$current_attribute) {
            echo ';;;'.$attribute.";;;;;<br>";
          }
        }
      }
    }
  }
?>
