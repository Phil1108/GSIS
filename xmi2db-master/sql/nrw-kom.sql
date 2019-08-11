CREATE TABLE ks_einrichtunginoeffentlichenbereichen (
	ogc_fid			serial NOT NULL,
	gml_id			character(16) NOT NULL,
	beginnt			character(20),
	endet			character(20),
	advstandardmodell 	varchar[],
	sonstigesmodell		varchar[],
	anlass			varchar[],
	art			varchar,
	oberflaechenmaterial 	integer,
	material 		integer[],
	bezeichnung		varchar,
	zustand			integer,
	PRIMARY KEY (ogc_fid)
);

SELECT AddGeometryColumn('ks_einrichtunginoeffentlichenbereichen','wkb_geometry',:alkis_epsg,'GEOMETRY',2);

CREATE INDEX ks_einrichtunginoeffentlichenbereichen_geom_idx ON ks_einrichtunginoeffentlichenbereichen USING gist (wkb_geometry);

CREATE TABLE ks_bauwerkanlagenfuerverundentsorgung (
	ogc_fid			serial NOT NULL,
	gml_id			character(16) NOT NULL,
	beginnt			character(20),
	endet			character(20),
	advstandardmodell 	varchar[],
	sonstigesmodell		varchar[],
	anlass			varchar[],
	art			integer,
	bezeichnung		varchar,
	zustand			integer,
	PRIMARY KEY (ogc_fid)
);

SELECT AddGeometryColumn('ks_bauwerkanlagenfuerverundentsorgung','wkb_geometry',:alkis_epsg,'POINT',2);

CREATE INDEX ks_bauwerkanlagenfuerverundentsorgung_geom_idx ON ks_bauwerkanlagenfuerverundentsorgung USING gist (wkb_geometry);

CREATE TABLE ks_sonstigesbauwerk (
	ogc_fid			serial NOT NULL,
	gml_id			character(16) NOT NULL,
	beginnt			character(20),
	endet			character(20),
	advstandardmodell 	varchar[],
	sonstigesmodell		varchar[],
	anlass			varchar[],
	bauwerksfunktion	integer,
	bezeichnung		varchar,
	PRIMARY KEY (ogc_fid)
);

SELECT AddGeometryColumn('ks_sonstigesbauwerk','wkb_geometry',:alkis_epsg,'GEOMETRY',2);

CREATE INDEX ks_sonstigesbauwerk_geom_idx ON ks_sonstigesbauwerk USING gist (wkb_geometry);

CREATE TABLE ks_einrichtungimstrassenverkehr(
	ogc_fid			serial NOT NULL,
	gml_id			character(16) NOT NULL,
	beginnt			character(20),
	endet			character(20),
	advstandardmodell 	varchar[],
	sonstigesmodell		varchar[],
	anlass			varchar[],
	art			integer,
	oberflaechenmaterial	integer,
	bezeichnung		varchar,
	zustand			integer,
	PRIMARY KEY (ogc_fid)
);

SELECT AddGeometryColumn('ks_einrichtungimstrassenverkehr','wkb_geometry',:alkis_epsg,'GEOMETRY',2);

CREATE INDEX ks_einrichtungimstrassenverkehr_geom_idx ON ks_einrichtungimstrassenverkehr USING gist (wkb_geometry);

CREATE TABLE ks_verkehrszeichen (
	ogc_fid			serial NOT NULL,
	gml_id			character(16) NOT NULL,
	beginnt			character(20),
	endet			character(20),
	advstandardmodell 	varchar[],
	sonstigesmodell		varchar[],
	anlass			varchar[],
	gefahrzeichen		integer[],
	vorschriftzeichen	integer[],
	richtzeichen		integer[],
	verkehrseinrichtung	integer[],
	zusatzzeichen		integer[],
	bezeichnung		varchar,
	PRIMARY KEY (ogc_fid)
);

SELECT AddGeometryColumn('ks_verkehrszeichen','wkb_geometry',:alkis_epsg,'POINT',2);

CREATE INDEX ks_verkehrszeichen_geom_idx ON ks_verkehrszeichen USING gist (wkb_geometry);

CREATE TABLE ks_einrichtungimbahnverkehr(
	ogc_fid			serial NOT NULL,
	gml_id			character(16) NOT NULL,
	beginnt			character(20),
	endet			character(20),
	advstandardmodell 	varchar[],
	sonstigesmodell		varchar[],
	anlass			varchar[],
	art			integer,
	bezeichnung		varchar,
	PRIMARY KEY (ogc_fid)
);

SELECT AddGeometryColumn('ks_einrichtungimbahnverkehr','wkb_geometry',:alkis_epsg,'GEOMETRY',2);

CREATE INDEX ks_einrichtungimbahnverkehr_geom_idx ON ks_einrichtungimbahnverkehr USING gist (wkb_geometry);

CREATE TABLE ks_bauwerkimgewaesserbereich (
	ogc_fid			serial NOT NULL,
	gml_id			character(16) NOT NULL,
	beginnt			character(20),
	endet			character(20),
	advstandardmodell 	varchar[],
	sonstigesmodell		varchar[],
	anlass			varchar[],
	bauwerksfunktion	integer,
	bezeichnung		varchar,
	zustand			integer,
	PRIMARY KEY (ogc_fid)
);

SELECT AddGeometryColumn('ks_bauwerkimgewaesserbereich','wkb_geometry',:alkis_epsg,'LINESTRING',2);

CREATE INDEX ks_bauwerkimgewaesserbereich_geom_idx ON ks_bauwerkimgewaesserbereich USING gist (wkb_geometry);

CREATE TABLE ks_vegetationsmerkmal (
	ogc_fid			serial NOT NULL,
	gml_id			character(16) NOT NULL,
	beginnt			character(20),
	endet			character(20),
	advstandardmodell 	varchar[],
	sonstigesmodell		varchar[],
	anlass			varchar[],
	bewuchs			integer,
	zustand			integer,
	breitedesobjekts	double precision,
	name			varchar,
	bezeichnung		varchar,
	PRIMARY KEY (ogc_fid)
);

SELECT AddGeometryColumn('ks_vegetationsmerkmal','wkb_geometry',:alkis_epsg,'GEOMETRY',2);

CREATE INDEX ks_vegetationsmerkmal_geom_idx ON ks_vegetationsmerkmal USING gist (wkb_geometry);

CREATE TABLE ks_bauraumoderbodenordnungsrecht (
	ogc_fid			serial NOT NULL,
	gml_id			character(16) NOT NULL,
	beginnt			character(20),
	endet			character(20),
	advstandardmodell 	varchar[],
	sonstigesmodell		varchar[],
	anlass			varchar[],
	artderfestlegung	integer,
	bezeichnung		varchar,
	PRIMARY KEY (ogc_fid)
);

SELECT AddGeometryColumn('ks_bauraumoderbodenordnungsrecht','wkb_geometry',:alkis_epsg,'GEOMETRY',2);

CREATE INDEX ks_bauraumoderbodenordnungsrecht_geom_idx ON ks_bauraumoderbodenordnungsrecht USING gist (wkb_geometry);

CREATE TABLE ks_kommunalerbesitz (
	ogc_fid			serial NOT NULL,
	gml_id			character(16) NOT NULL,
	beginnt			character(20),
	endet			character(20),
	advstandardmodell 	varchar[],
	sonstigesmodell		varchar[],
	anlass			varchar[],
	zustaendigkeit		varchar,
	nutzung			varchar,
	PRIMARY KEY (ogc_fid)
);

SELECT AddGeometryColumn('ks_kommunalerbesitz','wkb_geometry',:alkis_epsg,'GEOMETRY',2);

CREATE INDEX ks_kommunalerbesitz_geom_idx ON ks_kommunalerbesitz USING gist (wkb_geometry);
