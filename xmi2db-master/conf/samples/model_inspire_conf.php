<?php
  # Schemas of Inspire
  $schemas = array();
  $schemas[] = 'inspire1';
  $schemas[] = 'inspire2';
  $schemas[] = 'inspire_test';
  $schemas[] = 'inspire';
  define('SCHEMAS', "'" . implode("';'", $schemas) . "'");

  # Packages of INSPIRE Schema
  #$packages[] = 'CadastralParcels';

  if ($packages) define('PACKAGES', "'" . implode("';'", $packages) . "'");
?>
