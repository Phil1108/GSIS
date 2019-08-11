<?php
class Data {

  function __construct() {
    $this->rows = array();
  }

  function addRow($values) {
    $this->rows[] = $values;
  }

  function asTable($attributes) {
    $html = "<table style=\"border-collapse: collapse;\">\n\t<tr>\n";
    foreach($attributes AS $attribute) {
      $html .= "\t\t<th style=\"border: 1px solid #dddddd; text-align: left; padding: 5px;\">" . $attribute->name . "</th>\n";
    }
    $html .= "\t</tr>";
    foreach($this->rows AS $row) {
      $html .= "\t<tr>\n";
      foreach($row AS $value) {
        $html .= "\t\t<td style=\"border: 1px solid #dddddd; text-align: left; padding: 5px;\"> " . $value . "</td>\n";
      }
      $html .= "\t</tr>\n";
    }
    $html .= "</table>\n";
    return $html;
  }

  function asSql() {
    $sql = implode(
        ",\n",
        array_map(
          function($row) {
            $sql = "(" .
              implode(
                ', ',
                array_map(
                  function($value) {
                    switch (gettype($value)) {
                      case 'string' :
                        switch (true) {
                          case (in_array(strtolower($value), array(
                            'true',
                            't',
                            ))) :
                            $sql = "'true'";
                          break;
                          case (in_array(strtolower($value), array(
                            'false',
                            'f',
                            ))) :
                            $sql = "'false'";
                          break;
                          case ($value == 'NULL') :
                            $sql = "NULL";
                          break;
                          default:
                            $sql = "'" . $value . "'";
                        }
                      break;
                      case 'boolean' :
                        $sql = ($value) ? "'true'" : "'false'";
                      break;
                      default:
                        $sql = $value;
                    }
                    return $sql;
                  },
                  $row
                )
              ) .
            ')';
            return $sql;
          },
          $this->rows
        )
      );
    return $sql;
  }
}
?>
