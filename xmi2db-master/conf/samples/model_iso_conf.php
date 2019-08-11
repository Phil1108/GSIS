<?php
  # Schemas of ISO
  $schemas = array();
  $schemas[] = 'aaa';
  $schemas[] = 'iso1';
  $schemas[] = 'iso2';
  $schemas[] = 'iso_test';
  $schemas[] = 'iso_test_names';
  $schemas[] = 'iso_test_dq';
  define('SCHEMAS', "'" . implode("';'", $schemas) . "'");

  # Packages of ISO Schema
  $packages[] = 'Data quality information';

  if ($packages) define('PACKAGES', "'" . implode("';'", $packages) . "'");
?>
