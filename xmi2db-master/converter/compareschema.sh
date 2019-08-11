#!/bin/bash

set -e

pushd converter
rm -f /tmp/xmi2db.log

php-cgi -q db2ogr.php \
	umlSchema=aaa_uml \
	epsgCode=:alkis_epsg \
	ogrSchema=':"alkis_schema"' \
	withCodeLists=1 \
	loglevel=2 \
	>/tmp/alkis-schema.sql

sed -e "s/<br>/\n/g" /tmp/xmi2db.log >/tmp/xmi2db-sql.log

php-cgi -q db2gfs.php \
	umlSchema=aaa_uml \
	epsgCode=:alkis_epsg \
	loglevel=2 \
	>/tmp/alkis-schema.gfs

sed -e "s/<br>/\n/g" /tmp/xmi2db.log >/tmp/xmi2db-gfs.log

popd

D=$PWD

pushd ~/src/alkis-import
psql -v alkis_epsg=25832 service=xmi2db <<EOF
\set ON_ERROR_STOP
DROP SCHEMA IF EXISTS aaa_orig CASCADE;
CREATE SCHEMA aaa_orig;
SET search_path = aaa_orig, public;
\i $D/sql/alkis-schema-original.sql
EOF
popd

psql -v alkis_epsg=25832 -v alkis_schema=aaa_xmi2db service=xmi2db <<EOF
\set ON_ERROR_STOP
DROP SCHEMA IF EXISTS :"alkis_schema" CASCADE;
CREATE SCHEMA :"alkis_schema";
\i /tmp/alkis-schema.sql
EOF

perl converter/compare.pl | tee /tmp/schema.diff
