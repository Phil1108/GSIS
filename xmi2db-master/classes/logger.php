<?php
class Logger {
  function __construct($level = 0, $filename = '/tmp/xmi2db.log') {
    $this->level = $level;
    $this->debug = false;
    $this->text = '';
    if ($level & 2) {
      $this->file = fopen($filename, 'w');
    }
  }

  function log($text, $indent = 0, $log_always = false) {
    $space = '';
    for ($i = 0; $i < $indent; $i++) {
      $space .= '&nbsp;&nbsp;';
    }
    $this->text[] = $text;
    if ($this->level > 0 or $log_always) {
      if ($indent > 0) {
        $text = str_replace('<br>', '<br>' . $space . '|--', $text);
      }
    }
    if($this->level & 1)
      echo $text;
    if ($this->level & 2)
      fwrite($this->file, $text);
  }

  function close() {
    if ($this->level & 2)
      $this->file->close();
  }
}
?>
