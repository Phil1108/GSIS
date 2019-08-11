#!/bin/bash
SCRIPT_DIR=`dirname $0`

ACTIVE_SCHEMA="aaa_ogr"
RENAME="YES"

POSTGRES_DBNAME="nastest"
POSTGRES_USER="kvwmap"
POSTGRES_PASSWORD="geheim"
RENAME_SCRIPT="/var/www/apps/xmi2db/converter/rename_nas.rb"

usage() {
  echo "Usage:"
  echo "import.sh [datei]"
  echo " datei ist die NAS-Datei, die eingelesen werden soll."
  echo " datei kann auch eine gz gepackte Datei sein."
  echo " Wenn der Dateiname Leerzeichen beinhaltet, werden sie"
  echo " durch Underline ersetzt und die Datei umbenannt."
}

rename_nas_file() {
if [ $RENAME = "YES" ] ; then
  echo "Führe Umbenennungen in ${NAS_FILE} aus."
  ruby $RENAME_SCRIPT $NAS_FILE $NAS_RENAMED_FILE
  IMPORT_FILE=$NAS_RENAMED_FILE
else
  IMPORT_FILE=$NAS_FILE
fi
}

load_nas_file() {
  echo "Lese Datei ${IMPORT_FILE} in Datenbank ${POSTGRES_DBNAME} in Schema ${ACTIVE_SCHEMA} ein."
  ogr2ogr -f "PostgreSQL" --config PG_USE_COPY NO -nlt CONVERT_TO_LINEAR -append PG:"dbname=${POSTGRES_DBNAME} active_schema=${ACTIVE_SCHEMA} user=${POSTGRES_USER} host=pgsql port=5432 password=${POSTGRES_PASSWORD}" -a_srs EPSG:25832 "$IMPORT_FILE"
}

delete_renamed_file() {
if [ $RENAME = "YES" ] ; then
  echo "Lösche Datei mit umbenannten Tags."
  rm $NAS_RENAMED_FILE
fi
}

delete_gfs_file() {
  IMPORT_FILENAME=${IMPORT_FILE##*/}
  #echo 'import_filename: '$IMPORT_FILENAME
  IMPORT_BASENAME=${IMPORT_FILENAME%.*}
  #echo 'base: '$IMPORT_BASENAME
  GFS_FILE="${NAS_DIR}/${IMPORT_BASENAME}.gfs"
  echo "Lösche gfs Datei ${GFS_FILE}."
  rm $GFS_FILE
}

archivate_nas_file() {
  ARCHIV_DIR="${NAS_DIR}/archiv"
  mkdir -p $ARCHIV_DIR
  echo "Verschiebe Importdatei ${IMPORT_FILE} ins archiv ${ARCHIV_DIR}."
  mv $NAS_FILE $ARCHIV_DIR
}

FILE=$1
if [ -f "$FILE" ] ; then
  echo "Ausgewählte Datei ${FILE}."
  NAS_FILE=${FILE// /_}
  if [ ! "$FILE" = "$NAS_FILE" ] ; then
    echo "Benenne Datei ${FILE} um in ${NAS_FILE}"
    mv "${FILE}" $NAS_FILE
  fi
  #echo 'file: '$NAS_FILE
  NAS_DIR=$(dirname "${NAS_FILE}")
  #echo 'dir: '$NAS_DIR
  NAS_FILENAME=${NAS_FILE##*/}
  #echo 'filename: '$NAS_FILENAME
  NAS_BASENAME=${NAS_FILENAME%.*}
  #echo 'base: '$NAS_BASENAME
  NAS_EXTENSION=${NAS_FILE##*.}
  #echo 'ext: '$NAS_EXTENSION
  NAS_RENAMED_FILE="${NAS_DIR}/${NAS_BASENAME}_renamed.${NAS_EXTENSION}"
  #echo 'renamed: '$NAS_RENAMED_FILE

  rename_nas_file
  load_nas_file
  delete_renamed_file
  delete_gfs_file
  archivate_nas_file
else
  echo "Datei ${FILE} existiert nicht."
  usage
fi

