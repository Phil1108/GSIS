-- Version vom 17.10.2016
DROP SCHEMA IF EXISTS aaa_gml CASCADE;
CREATE SCHEMA aaa_gml;
COMMENT ON SCHEMA aaa_gml IS 'Version vom 17.10.2016';
SET search_path = aaa_gml, public;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_advstandardmodell'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.aa_advstandardmodell AS ENUM 
	('DLKM', 'DKKM500', 'DKKM1000', 'DKKM2000', 'DKKM5000', 'Basis-DLM', 'DLM50', 'DLM250', 'DLM1000', 'DTK10', 'DTK25', 'DTK50', 'DTK100', 'DTK250', 'DTK1000', 'DFGM', 'DGM2', 'DGM5', 'DGM25', 'DGM50');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_aa_advstandardmodell (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT enum_aa_advstandardmodell_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_aa_advstandardmodell IS 'Alias: "enum_AA_AdVStandardModell"';
INSERT INTO enum_aa_advstandardmodell (wert,beschreibung) VALUES 
('DLKM', 'LiegenschaftskatasterModell'),
('DKKM500', 'KatasterkartenModell500'),
('DKKM1000', 'KatasterkartenModell1000'),
('DKKM2000', 'KatasterkartenModell2000'),
('DKKM5000', 'KatasterkartenModell5000'),
('Basis-DLM', 'BasisLandschaftsModell'),
('DLM50', 'LandschaftsModell50'),
('DLM250', 'LandschaftsModell250'),
('DLM1000', 'LandschaftsModell1000'),
('DTK10', 'TopographischeKarte10'),
('DTK25', 'TopographischeKarte25'),
('DTK50', 'TopographischeKarte50'),
('DTK100', 'TopographischeKarte100'),
('DTK250', 'TopographischeKarte250'),
('DTK1000', 'TopographischeKarte1000'),
('DFGM', 'Festpunktmodell'),
('DGM2', 'DigitalesGelaendemodell2'),
('DGM5', 'DigitalesGelaendemodell5'),
('DGM25', 'DigitalesGelaendemodell25'),
('DGM50', 'Digitales Gelaendemodell50');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_nas_ausgabeform'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.aa_nas_ausgabeform AS ENUM 
	('application/xml', 'application/zip', 'application/gzip');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'nas_filter_capabilities'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.nas_filter_capabilities AS ENUM 
	('transparentXlinks', 'multiplePropertyValues', 'XlinkPropertyName', 'XlinkPropertyPath', 'XlinkPropertyPath_leafOnly', 'PropertyIsOfType');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_themendimension'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.aa_themendimension AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_aa_themendimension (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_aa_themendimension_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_aa_themendimension IS 'Alias: "enum_AA_Themendimension"';
INSERT INTO enum_aa_themendimension (wert,beschreibung) VALUES 
('1000', 'Punkt-Linien-Thema (Dimension 1)'),
('2000', 'Topologiethema (Dimension 2)');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_art_themendefinition'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.aa_art_themendefinition AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_aa_art_themendefinition (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_aa_art_themendefinition_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_aa_art_themendefinition IS 'Alias: "enum_AA_Art_Themendefinition"';
INSERT INTO enum_aa_art_themendefinition (wert,beschreibung) VALUES 
('1000', 'alleObjekte'),
('2000', 'anwenderdefiniert');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'operation'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.operation AS ENUM 
	('Insert', 'Replace', 'Delete', 'Query', 'Lock', 'Unlock', 'Reserve');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ap_horizontaleausrichtung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ap_horizontaleausrichtung AS ENUM 
	('linksbündig', 'rechtsbündig', 'zentrisch');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ap_vertikaleausrichtung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ap_vertikaleausrichtung AS ENUM 
	('Basis', 'Mitte', 'oben');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ap_dateityp_3d'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ap_dateityp_3d AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '6000', '9990');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ap_dateityp_3d (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ap_dateityp_3d_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ap_dateityp_3d IS 'Alias: "enum_AP_DateiTyp_3D"';
INSERT INTO enum_ap_dateityp_3d (wert,beschreibung) VALUES 
('1000', 'VRML97'),
('2000', '3DSmax'),
('3000', 'autocad DXF'),
('4000', 'autocad DWG'),
('5000', 'shockwave3D'),
('6000', 'X3D'),
('9990', 'unbekannt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artdesnullpunktes_nullpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artdesnullpunktes_nullpunkt AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artdesnullpunktes_nullpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artdesnullpunktes_nullpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artdesnullpunktes_nullpunkt IS 'Alias: "enum_AX_ArtDesNullpunktes_Nullpunkt"';
INSERT INTO enum_ax_artdesnullpunktes_nullpunkt (wert,beschreibung) VALUES 
('1000', 'Zentraler Nullpunkt'),
('2000', 'Nullpunkt'),
('3000', 'Fiktiver Nullpunkt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_li_processstep_mitdatenerhebung_description'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_li_processstep_mitdatenerhebung_description AS ENUM 
	('Erhebung');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_datenerhebung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_datenerhebung AS ENUM 
	('9999', '1000', '1100', '1200', '1900', '2000', '4000', '4100', '4200', '4210', '4220', '4230', '4240', '4250', '4300', '4310', '4320', '4330', '4340', '4350', '4360', '4370', '4380', '4390', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_datenerhebung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_datenerhebung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_datenerhebung IS 'Alias: "enum_AX_Datenerhebung"';
INSERT INTO enum_ax_datenerhebung (wert,beschreibung) VALUES 
('9999', 'Sonstiges'),
('1000', 'Aus Katastervermessung ermittelt'),
('1100', 'Aufgrund Anforderungen mit Netzanschluss ermittelt'),
('1200', 'Aufgrund Anforderungen mit Bezug zur Flurstücksgrenze ermittelt'),
('1900', 'Aus sonstiger Vermessung ermittelt'),
('2000', 'Aus Luftbildmessung oder Fernerkundungsdaten ermittelt'),
('4000', 'Aus Katasterunterlagen und Karten für graphische Zwecke ermittelt'),
('4100', 'Aus Katasterzahlen für graphische Zwecke ermittelt'),
('4200', 'Aus Katasterkarten digitalisiert'),
('4210', 'Aus Katasterkarten digitalisiert, Kartenmaßstab M größer gleich 1 zu 1000'),
('4220', 'Aus Katasterkarten digitalisiert, Kartenmaßstab 1 zu 1000 größer M größer gleich 1 zu 2000'),
('4230', 'Aus Katasterkarten digitalisiert, Kartenmaßstab 1 zu 2000 größer M größer gleich 1 zu 3000'),
('4240', 'Aus Katasterkarten digitalisiert, Kartenmaßstab 1 zu 3000 größer M größer gleich 1 zu 5000'),
('4250', 'Aus Katasterkarten  digitalisiert, Kartenmaßstab 1 zu 5000 größer M'),
('4300', 'Aus sonstigen Unterlagen digitalisiert'),
('4310', 'Aus sonstigen Unterlagen digitalisiert, Kartenmaßstab M größer gleich 1 zu 1000'),
('4320', 'Aus sonstigen Unterlagen digitalisiert, Kartenmaßstab 1 zu 1000 größer M größer gleich 1 zu 2000'),
('4330', 'Aus sonstigen Unterlagen digitalisiert, Kartenmaßstab 1 zu 2000 größer M größer gleich 1 zu 3000'),
('4340', 'Aus sonstigen Unterlagen digitalisiert, Kartenmaßstab 1 zu 3000 größer M größer gleich 1 zu 5000'),
('4350', 'Aus sonstigen Unterlagen digitalisiert, Kartenmaßstab 1 zu 5000 größer M'),
('4360', 'Aus sonstigen Unterlagen digitalisiert, mit sonstigen geometrischen Bedingungen und bzw. oder Homogenisierung (M größer gleich 1 zu 1000)'),
('4370', 'Aus sonstigen Unterlagen digitalisiert, mit Berechnung oder Abstandsbedingung (M größer gleich 1 zu 1000)'),
('4380', 'Aus sonstigen Unterlagen digitalisiert, mit sonstigen geometrischen Bedingungen und bzw. oder Homogenisierung (M kleiner 1 zu 1000)'),
('4390', 'Aus sonstigen Unterlagen digitalisiert, mit Berechnung oder Abstandsbedingungen (M kleiner 1 zu 1000)'),
('9998', 'Nach Quellenlage nicht zu spezifizieren');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_sportart_bauwerkoderanlagefuersportfreizeitunderholung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_sportart_bauwerkoderanlagefuersportfreizeitunderholung AS ENUM 
	('1010', '1011', '1020', '1030', '1040', '1050', '1060', '1070', '1071', '1072', '1080', '1090', '1100', '1110', '1115');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_sportart_bauwerkoderanlagefuersportfreizeitunderho (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_sportart_bauwerkoderanlagefuersportfreizeitunderho_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_sportart_bauwerkoderanlagefuersportfreizeitunderho IS 'Alias: "enum_AX_Sportart_BauwerkOderAnlageFuerSportFreizeitUndErholung"';
INSERT INTO enum_ax_sportart_bauwerkoderanlagefuersportfreizeitunderho (wert,beschreibung) VALUES 
('1010', 'Ballsport'),
('1011', 'Fußball'),
('1020', 'Leichtathletik'),
('1030', 'Tennis'),
('1040', 'Reiten'),
('1050', 'Schwimmen'),
('1060', 'Skisport'),
('1070', 'Eislaufsport, Rollschuhlaufen'),
('1071', 'Eislaufsport'),
('1072', 'Rollschuhlaufen'),
('1080', 'Skating'),
('1090', 'Motorrennsport'),
('1100', 'Radsport'),
('1110', 'Pferderennsport'),
('1115', 'Hunderennsport');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_lagezurerdoberflaeche_transportanlage'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_lagezurerdoberflaeche_transportanlage AS ENUM 
	('1200', '1400', '1700');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_lagezurerdoberflaeche_transportanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_lagezurerdoberflaeche_transportanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_lagezurerdoberflaeche_transportanlage IS 'Alias: "enum_AX_LageZurErdoberflaeche_Transportanlage"';
INSERT INTO enum_ax_lagezurerdoberflaeche_transportanlage (wert,beschreibung) VALUES 
('1200', 'Unter der Erdoberfläche'),
('1400', 'Aufgeständert'),
('1700', 'Unter der Wasseroberfläche');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_produkt_transportanlage'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_produkt_transportanlage AS ENUM 
	('1110', '1120', '1130', '1131', '1132', '1133', '1140');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_produkt_transportanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_produkt_transportanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_produkt_transportanlage IS 'Alias: "enum_AX_Produkt_Transportanlage"';
INSERT INTO enum_ax_produkt_transportanlage (wert,beschreibung) VALUES 
('1110', 'Erdöl'),
('1120', 'Gas'),
('1130', 'Wasser'),
('1131', 'Trinkwasser'),
('1132', 'Brauchwasser'),
('1133', 'Abwasser'),
('1140', 'Fernwärme');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bauwerksfunktion_turm'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bauwerksfunktion_turm AS ENUM 
	('1001', '1002', '1003', '1004', '1005', '1006', '1007', '1008', '1009', '1010', '1011', '1012', '9998', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bauwerksfunktion_turm (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bauwerksfunktion_turm_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bauwerksfunktion_turm IS 'Alias: "enum_AX_Bauwerksfunktion_Turm"';
INSERT INTO enum_ax_bauwerksfunktion_turm (wert,beschreibung) VALUES 
('1001', 'Wasserturm'),
('1002', 'Kirchturm, Glockenturm'),
('1003', 'Aussichtsturm'),
('1004', 'Kontrollturm'),
('1005', 'Kühlturm'),
('1006', 'Leuchtturm'),
('1007', 'Feuerwachturm'),
('1008', 'Sende-, Funkturm, Fernmeldeturm'),
('1009', 'Stadt-, Torturm'),
('1010', 'Förderturm'),
('1011', 'Bohrturm'),
('1012', 'Schloss-, Burgturm'),
('9998', 'Nach Quellenlage nicht zu spezifizieren'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_hydrologischesmerkmal_sonstigesbauwerkodersonstigeeinri'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_hydrologischesmerkmal_sonstigesbauwerkodersonstigeeinri AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_hydrologischesmerkmal_sonstigesbauwerkodersonstige (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_hydrologischesmerkmal_sonstigesbauwerkodersonstige_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_hydrologischesmerkmal_sonstigesbauwerkodersonstige IS 'Alias: "enum_AX_HydrologischesMerkmal_SonstigesBauwerkOderSonstigeEinrichtung"';
INSERT INTO enum_ax_hydrologischesmerkmal_sonstigesbauwerkodersonstige (wert,beschreibung) VALUES 
('1000', 'Ständig Wasser führend'),
('2000', 'Nicht ständig Wasser führend'),
('3000', 'Trocken, versiegt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_turm'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_turm AS ENUM 
	('2100', '2200');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_turm (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_turm_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_turm IS 'Alias: "enum_AX_Zustand_Turm"';
INSERT INTO enum_ax_zustand_turm (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('2200', 'Verfallen, zerstört');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_heilquellegasquelle'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_heilquellegasquelle AS ENUM 
	('4010', '4020');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_heilquellegasquelle (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_heilquellegasquelle_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_heilquellegasquelle IS 'Alias: "enum_AX_Art_HeilquelleGasquelle"';
INSERT INTO enum_ax_art_heilquellegasquelle (wert,beschreibung) VALUES 
('4010', 'Heilquelle'),
('4020', 'Gasquelle, Mofette');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bauwerksfunktion_transportanlage'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bauwerksfunktion_transportanlage AS ENUM 
	('1101', '1102', '1103');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bauwerksfunktion_transportanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bauwerksfunktion_transportanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bauwerksfunktion_transportanlage IS 'Alias: "enum_AX_Bauwerksfunktion_Transportanlage"';
INSERT INTO enum_ax_bauwerksfunktion_transportanlage (wert,beschreibung) VALUES 
('1101', 'Rohrleitung, Pipeline'),
('1102', 'Förderband, Bandstraße'),
('1103', 'Pumpe');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_lagezurerdoberflaeche_vorratsbehaelterspeicherbauwerk'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_lagezurerdoberflaeche_vorratsbehaelterspeicherbauwerk AS ENUM 
	('1200', '1400');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_lagezurerdoberflaeche_vorratsbehaelterspeicherbauw (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_lagezurerdoberflaeche_vorratsbehaelterspeicherbauw_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_lagezurerdoberflaeche_vorratsbehaelterspeicherbauw IS 'Alias: "enum_AX_LageZurErdoberflaeche_VorratsbehaelterSpeicherbauwerk"';
INSERT INTO enum_ax_lagezurerdoberflaeche_vorratsbehaelterspeicherbauw (wert,beschreibung) VALUES 
('1200', 'Unter der Erdoberfläche'),
('1400', 'Aufgeständert');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_speicherinhalt_vorratsbehaelterspeicherbauwerk'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_speicherinhalt_vorratsbehaelterspeicherbauwerk AS ENUM 
	('1000', '1100', '1110', '1120', '1130', '1140', '1200', '1300', '1500', '1501', '1510', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_speicherinhalt_vorratsbehaelterspeicherbauwerk (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_speicherinhalt_vorratsbehaelterspeicherbauwerk_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_speicherinhalt_vorratsbehaelterspeicherbauwerk IS 'Alias: "enum_AX_Speicherinhalt_VorratsbehaelterSpeicherbauwerk"';
INSERT INTO enum_ax_speicherinhalt_vorratsbehaelterspeicherbauwerk (wert,beschreibung) VALUES 
('1000', 'Erze'),
('1100', 'Treib- und Brennstoffe'),
('1110', 'Erdöl'),
('1120', 'Gas'),
('1130', 'Wasser'),
('1140', 'Gülle'),
('1200', 'Baustoffe'),
('1300', 'Chemikalien'),
('1500', 'Lebensmittel'),
('1501', 'Getreide'),
('1510', 'Futtermittel'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bauwerksfunktion_bauwerkoderanlagefuerindustrieundgewer'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bauwerksfunktion_bauwerkoderanlagefuerindustrieundgewer AS ENUM 
	('1210', '1215', '1220', '1230', '1240', '1250', '1251', '1260', '1270', '1280', '1290', '1310', '1320', '1330', '1331', '1332', '1333', '1340', '1350', '1360', '1370', '1371', '1372', '1380', '1390', '1400', '1700', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bauwerksfunktion_bauwerkoderanlagefuerindustrieund (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bauwerksfunktion_bauwerkoderanlagefuerindustrieund_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bauwerksfunktion_bauwerkoderanlagefuerindustrieund IS 'Alias: "enum_AX_Bauwerksfunktion_BauwerkOderAnlageFuerIndustrieUndGewerbe"';
INSERT INTO enum_ax_bauwerksfunktion_bauwerkoderanlagefuerindustrieund (wert,beschreibung) VALUES 
('1210', 'Klärbecken'),
('1215', 'Biogasanlage'),
('1220', 'Windrad'),
('1230', 'Solarzellen'),
('1240', 'Wasserrad'),
('1250', 'Mast'),
('1251', 'Freileitungsmast'),
('1260', 'Funkmast'),
('1270', 'Antenne'),
('1280', 'Radioteleskop'),
('1290', 'Schornstein, Schlot, Esse'),
('1310', 'Stollenmundloch'),
('1320', 'Schachtöffnung'),
('1330', 'Kran'),
('1331', 'Drehkran'),
('1332', 'Portalkran'),
('1333', 'Laufkran, Brückenlaufkran'),
('1340', 'Trockendock'),
('1350', 'Hochofen'),
('1360', 'Merkzeichen, Merkstein'),
('1370', 'Hydrant'),
('1371', 'Oberflurhydrant'),
('1372', 'Unterflurhydrant'),
('1380', 'Schieberkappe'),
('1390', 'Einsteigeschacht'),
('1400', 'Umformer'),
('1700', 'Bergbaubetrieb'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_einrichtunginoeffentlichenbereichen'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_einrichtunginoeffentlichenbereichen AS ENUM 
	('1100', '1110', '1120', '1130', '1140', '1150', '1200', '1300', '1310', '1320', '1330', '1340', '1350', '1400', '1410', '1420', '1430', '1500', '1510', '1600', '1610', '1620', '1630', '1640', '1650', '1700', '1710', '1910', '2100', '2200', '2300', '2400', '2500', '2600', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_einrichtunginoeffentlichenbereichen (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_einrichtunginoeffentlichenbereichen_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_einrichtunginoeffentlichenbereichen IS 'Alias: "enum_AX_Art_EinrichtungInOeffentlichenBereichen"';
INSERT INTO enum_ax_art_einrichtunginoeffentlichenbereichen (wert,beschreibung) VALUES 
('1100', 'Kommunikationseinrichtung'),
('1110', 'Fernsprechhäuschen'),
('1120', 'Briefkasten'),
('1130', 'Notrufeinrichtung'),
('1140', 'Feuermelder'),
('1150', 'Polizeirufsäule'),
('1200', 'Kabelkasten, Schaltkasten'),
('1300', 'Verkehrszeichen'),
('1310', 'Verkehrsampel'),
('1320', 'Freistehende Hinweistafel, -zeichen'),
('1330', 'Wegweiser von besonderer Bedeutung'),
('1340', 'Freistehende Warntafel'),
('1350', 'Bushaltestelle'),
('1400', 'Markierungshinweise, -steine'),
('1410', 'Kilometerstein, -tafel'),
('1420', 'Ortsdurchfahrtsstein'),
('1430', 'Fischereigrenzstein'),
('1500', 'Bahnübergang, Schranke'),
('1510', 'Tor'),
('1600', 'Laterne, Kandelaber'),
('1610', 'Gaslaterne'),
('1620', 'Laterne, elektrisch'),
('1630', 'Gaskandelaber'),
('1640', 'Kandelaber, elektrisch'),
('1650', 'Hängende Lampe'),
('1700', 'Säule, Werbefläche'),
('1710', 'Leuchtsäule'),
('1910', 'Fahnenmast'),
('2100', 'Straßensinkkasten'),
('2200', 'Müllbox'),
('2300', 'Kehrichtgrube'),
('2400', 'Uhr'),
('2500', 'Richtscheinwerfer'),
('2600', 'Flutlichtmast'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bauwerksfunktion_bauwerkoderanlagefuersportfreizeitunde'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bauwerksfunktion_bauwerkoderanlagefuersportfreizeitunde AS ENUM 
	('1410', '1411', '1412', '1420', '1430', '1431', '1432', '1440', '1450', '1460', '1470', '1480', '1490', '1510', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bauwerksfunktion_bauwerkoderanlagefuersportfreizei (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bauwerksfunktion_bauwerkoderanlagefuersportfreizei_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bauwerksfunktion_bauwerkoderanlagefuersportfreizei IS 'Alias: "enum_AX_Bauwerksfunktion_BauwerkOderAnlageFuerSportFreizeitUndErholung"';
INSERT INTO enum_ax_bauwerksfunktion_bauwerkoderanlagefuersportfreizei (wert,beschreibung) VALUES 
('1410', 'Spielfeld'),
('1411', 'Hartplatz'),
('1412', 'Rasenplatz'),
('1420', 'Rennbahn, Laufbahn, Geläuf'),
('1430', 'Zuschauertribüne'),
('1431', 'Zuschauertribüne, überdacht'),
('1432', 'Zuschauertribüne, nicht überdacht'),
('1440', 'Stadion'),
('1450', 'Schwimmbecken'),
('1460', 'Liegewiese'),
('1470', 'Sprungschanze (Anlauf)'),
('1480', 'Schießanlage'),
('1490', 'Gradierwerk'),
('1510', 'Wildgehege'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_archaeologischertyp_historischesbauwerkoderhistorischee'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_archaeologischertyp_historischesbauwerkoderhistorischee AS ENUM 
	('1000', '1010', '1020', '1100', '1110', '1200', '1210', '1300', '1400', '1410', '1420', '1430', '1500', '1510', '1520', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_archaeologischertyp_historischesbauwerkoderhistori (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_archaeologischertyp_historischesbauwerkoderhistori_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_archaeologischertyp_historischesbauwerkoderhistori IS 'Alias: "enum_AX_ArchaeologischerTyp_HistorischesBauwerkOderHistorischeEinrichtung"';
INSERT INTO enum_ax_archaeologischertyp_historischesbauwerkoderhistori (wert,beschreibung) VALUES 
('1000', 'Grab'),
('1010', 'Großsteingrab (Dolmen, Hünenbett)'),
('1020', 'Grabhügel (Hügelgrab)'),
('1100', 'Historische Wasserleitung'),
('1110', 'Aquädukt'),
('1200', 'Befestigung (Wall, Graben)'),
('1210', 'Wachturm (römisch), Warte'),
('1300', 'Steinmal'),
('1400', 'Befestigung (Burgruine)'),
('1410', 'Burg (Fliehburg, Ringwall)'),
('1420', 'Schanze'),
('1430', 'Lager'),
('1500', 'Historische Mauer'),
('1510', 'Stadtmauer'),
('1520', 'Sonstige historische Mauer'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_hydrologischesmerkmal_heilquellegasquelle'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_hydrologischesmerkmal_heilquellegasquelle AS ENUM 
	('4000', '5000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_hydrologischesmerkmal_heilquellegasquelle (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_hydrologischesmerkmal_heilquellegasquelle_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_hydrologischesmerkmal_heilquellegasquelle IS 'Alias: "enum_AX_HydrologischesMerkmal_HeilquelleGasquelle"';
INSERT INTO enum_ax_hydrologischesmerkmal_heilquellegasquelle (wert,beschreibung) VALUES 
('4000', 'Ständig schüttend'),
('5000', 'Nicht ständig schüttend');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_bauwerkoderanlagefuerindustrieundgewerbe'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_bauwerkoderanlagefuerindustrieundgewerbe AS ENUM 
	('2100', '2200', '4100', '4200');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_bauwerkoderanlagefuerindustrieundgewerbe (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_bauwerkoderanlagefuerindustrieundgewerbe_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_bauwerkoderanlagefuerindustrieundgewerbe IS 'Alias: "enum_AX_Zustand_BauwerkOderAnlageFuerIndustrieUndGewerbe"';
INSERT INTO enum_ax_zustand_bauwerkoderanlagefuerindustrieundgewerbe (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('2200', 'Verfallen, zerstört'),
('4100', 'Offen'),
('4200', 'Verschlossen');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bauwerksfunktion_sonstigesbauwerkodersonstigeeinrichtun'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bauwerksfunktion_sonstigesbauwerkodersonstigeeinrichtun AS ENUM 
	('1610', '1611', '1620', '1621', '1622', '1630', '1640', '1641', '1642', '1650', '1670', '1700', '1701', '1702', '1703', '1720', '1721', '1722', '1723', '1740', '1750', '1760', '1761', '1762', '1763', '1770', '1780', '1781', '1782', '1783', '1790', '1791', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bauwerksfunktion_sonstigesbauwerkodersonstigeeinri (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bauwerksfunktion_sonstigesbauwerkodersonstigeeinri_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bauwerksfunktion_sonstigesbauwerkodersonstigeeinri IS 'Alias: "enum_AX_Bauwerksfunktion_SonstigesBauwerkOderSonstigeEinrichtung"';
INSERT INTO enum_ax_bauwerksfunktion_sonstigesbauwerkodersonstigeeinri (wert,beschreibung) VALUES 
('1610', 'Überdachung'),
('1611', 'Carport'),
('1620', 'Treppe'),
('1621', 'Freitreppe'),
('1622', 'Rolltreppe'),
('1630', 'Treppenunterkante'),
('1640', 'Kellereingang'),
('1641', 'Kellereingang, offen'),
('1642', 'Kellereingang, geschlossen'),
('1650', 'Rampe'),
('1670', 'Terrasse'),
('1700', 'Mauer'),
('1701', 'Mauerkante, rechts'),
('1702', 'Mauerkante, links'),
('1703', 'Mauermitte'),
('1720', 'Stützmauer'),
('1721', 'Stützmauer, rechts'),
('1722', 'Stützmauer, links'),
('1723', 'Stützmauermitte'),
('1740', 'Zaun'),
('1750', 'Gedenkstätte, Denkmal, Denkstein, Standbild'),
('1760', 'Bildstock, Wegekreuz, Gipfelkreuz'),
('1761', 'Bildstock'),
('1762', 'Wegekreuz'),
('1763', 'Gipfelkreuz'),
('1770', 'Meilenstein, historischer Grenzstein'),
('1780', 'Brunnen'),
('1781', 'Brunnen (Trinkwasserversorgung)'),
('1782', 'Springbrunnen, Zierbrunnen'),
('1783', 'Ziehbrunnen'),
('1790', 'Spundwand'),
('1791', 'Höckerlinie'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_bauwerk'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_bauwerk AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_bauwerk (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_bauwerk_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_bauwerk IS 'Alias: "enum_AX_Funktion_Bauwerk"';
INSERT INTO enum_ax_funktion_bauwerk (wert,beschreibung) VALUES 
('1000', 'Hochwasser-, Sturmflutschutz'),
('2000', 'Lärmschutz');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bauwerksfunktion_leitung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bauwerksfunktion_leitung AS ENUM 
	('1110', '1111');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bauwerksfunktion_leitung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bauwerksfunktion_leitung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bauwerksfunktion_leitung IS 'Alias: "enum_AX_Bauwerksfunktion_Leitung"';
INSERT INTO enum_ax_bauwerksfunktion_leitung (wert,beschreibung) VALUES 
('1110', 'Freileitung'),
('1111', 'Erdkabel');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bauwerksfunktion_vorratsbehaelterspeicherbauwerk'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bauwerksfunktion_vorratsbehaelterspeicherbauwerk AS ENUM 
	('1201', '1202', '1203', '1204', '1205', '1206', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bauwerksfunktion_vorratsbehaelterspeicherbauwerk (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bauwerksfunktion_vorratsbehaelterspeicherbauwerk_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bauwerksfunktion_vorratsbehaelterspeicherbauwerk IS 'Alias: "enum_AX_Bauwerksfunktion_VorratsbehaelterSpeicherbauwerk"';
INSERT INTO enum_ax_bauwerksfunktion_vorratsbehaelterspeicherbauwerk (wert,beschreibung) VALUES 
('1201', 'Silo'),
('1202', 'Fülltrichter'),
('1203', 'Bunker'),
('1204', 'Getreideheber'),
('1205', 'Tank'),
('1206', 'Gasometer'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_befestigung_wegpfadsteig'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_befestigung_wegpfadsteig AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_befestigung_wegpfadsteig (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_befestigung_wegpfadsteig_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_befestigung_wegpfadsteig IS 'Alias: "enum_AX_Befestigung_WegPfadSteig"';
INSERT INTO enum_ax_befestigung_wegpfadsteig (wert,beschreibung) VALUES 
('1000', 'Befestigt'),
('2000', 'Unbefestigt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_oberflaechenmaterial_flugverkehrsanlage'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_oberflaechenmaterial_flugverkehrsanlage AS ENUM 
	('1210', '1220', '1230');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_oberflaechenmaterial_flugverkehrsanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_oberflaechenmaterial_flugverkehrsanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_oberflaechenmaterial_flugverkehrsanlage IS 'Alias: "enum_AX_Oberflaechenmaterial_Flugverkehrsanlage"';
INSERT INTO enum_ax_oberflaechenmaterial_flugverkehrsanlage (wert,beschreibung) VALUES 
('1210', 'Gras, Rasen'),
('1220', 'Beton'),
('1230', 'Bitumen, Asphalt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_gleis'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_gleis AS ENUM 
	('1200');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_gleis (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_gleis_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_gleis IS 'Alias: "enum_AX_Art_Gleis"';
INSERT INTO enum_ax_art_gleis (wert,beschreibung) VALUES 
('1200', 'Drehscheibe');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bahnkategorie_gleis'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bahnkategorie_gleis AS ENUM 
	('1100', '1102', '1104', '1200', '1201', '1202', '1300', '1301', '1302', '1400', '1500', '1600', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bahnkategorie_gleis (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bahnkategorie_gleis_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bahnkategorie_gleis IS 'Alias: "enum_AX_Bahnkategorie_Gleis"';
INSERT INTO enum_ax_bahnkategorie_gleis (wert,beschreibung) VALUES 
('1100', 'Eisenbahn'),
('1102', 'Güterverkehr'),
('1104', 'S-Bahn'),
('1200', 'Stadtbahn'),
('1201', 'Straßenbahn'),
('1202', 'U-Bahn'),
('1300', 'Bergbahn, Seilbahn'),
('1301', 'Zahnradbahn'),
('1302', 'Standseilbahn'),
('1400', 'Museumsbahn'),
('1500', 'Bahn im Freizeitpark'),
('1600', 'Magnetschwebebahn'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_strassenverkehrsanlage'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_strassenverkehrsanlage AS ENUM 
	('1000', '1010', '1011', '2000', '3000', '3001', '3002', '3003', '4000', '5330', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_strassenverkehrsanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_strassenverkehrsanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_strassenverkehrsanlage IS 'Alias: "enum_AX_Art_Strassenverkehrsanlage"';
INSERT INTO enum_ax_art_strassenverkehrsanlage (wert,beschreibung) VALUES 
('1000', 'Fahrbahn'),
('1010', 'Fahrbahnbegrenzungslinie'),
('1011', 'Fahrbahnbegrenzungslinie, überdeckt'),
('2000', 'Furt'),
('3000', 'Autobahnknoten'),
('3001', 'Kreuz'),
('3002', 'Dreieck'),
('3003', 'Anschlussstelle'),
('4000', 'Platz'),
('5330', 'Raststätte'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_markierung_wegpfadsteig'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_markierung_wegpfadsteig AS ENUM 
	('1401', '1402', '1403');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_markierung_wegpfadsteig (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_markierung_wegpfadsteig_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_markierung_wegpfadsteig IS 'Alias: "enum_AX_Markierung_WegPfadSteig"';
INSERT INTO enum_ax_markierung_wegpfadsteig (wert,beschreibung) VALUES 
('1401', 'Gekennzeichneter Wanderweg'),
('1402', 'Gekennzeichneter Radwanderweg'),
('1403', 'Gekennzeichnete Skaterstrecke');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bahnhofskategorie_bahnverkehrsanlage'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bahnhofskategorie_bahnverkehrsanlage AS ENUM 
	('1010', '1020', '1030');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bahnhofskategorie_bahnverkehrsanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bahnhofskategorie_bahnverkehrsanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bahnhofskategorie_bahnverkehrsanlage IS 'Alias: "enum_AX_Bahnhofskategorie_Bahnverkehrsanlage"';
INSERT INTO enum_ax_bahnhofskategorie_bahnverkehrsanlage (wert,beschreibung) VALUES 
('1010', 'Bahnhof'),
('1020', 'Haltestelle'),
('1030', 'Haltepunkt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bahnkategorie_seilbahnschwebebahn'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bahnkategorie_seilbahnschwebebahn AS ENUM 
	('2100', '2200', '2300', '2400', '2500', '2600');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bahnkategorie_seilbahnschwebebahn (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bahnkategorie_seilbahnschwebebahn_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bahnkategorie_seilbahnschwebebahn IS 'Alias: "enum_AX_Bahnkategorie_SeilbahnSchwebebahn"';
INSERT INTO enum_ax_bahnkategorie_seilbahnschwebebahn (wert,beschreibung) VALUES 
('2100', 'Luftseilbahn, Großkabinenbahn'),
('2200', 'Kabinenbahn, Umlaufseilbahn'),
('2300', 'Sessellift'),
('2400', 'Ski-, Schlepplift'),
('2500', 'Schwebebahn'),
('2600', 'Materialseilbahn');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_bahnverkehrsanlage'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_bahnverkehrsanlage AS ENUM 
	('2100', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_bahnverkehrsanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_bahnverkehrsanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_bahnverkehrsanlage IS 'Alias: "enum_AX_Zustand_Bahnverkehrsanlage"';
INSERT INTO enum_ax_zustand_bahnverkehrsanlage (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_bauwerkimgewaesserbereich'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_bauwerkimgewaesserbereich AS ENUM 
	('2100', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_bauwerkimgewaesserbereich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_bauwerkimgewaesserbereich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_bauwerkimgewaesserbereich IS 'Alias: "enum_AX_Zustand_BauwerkImGewaesserbereich"';
INSERT INTO enum_ax_zustand_bauwerkimgewaesserbereich (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_wegpfadsteig'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_wegpfadsteig AS ENUM 
	('1103', '1105', '1106', '1107', '1108', '1109', '1110', '1111');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_wegpfadsteig (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_wegpfadsteig_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_wegpfadsteig IS 'Alias: "enum_AX_Art_WegPfadSteig"';
INSERT INTO enum_ax_art_wegpfadsteig (wert,beschreibung) VALUES 
('1103', 'Fußweg'),
('1105', 'Karren- und Ziehweg'),
('1106', 'Radweg'),
('1107', 'Reitweg'),
('1108', 'Wattenweg'),
('1109', '(Kletter-)Steig im Gebirge'),
('1110', 'Rad- und Fußweg'),
('1111', 'Skaterstrecke');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_lagezuroberflaeche_gleis'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_lagezuroberflaeche_gleis AS ENUM 
	('1200', '1400');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_lagezuroberflaeche_gleis (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_lagezuroberflaeche_gleis_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_lagezuroberflaeche_gleis IS 'Alias: "enum_AX_LageZurOberflaeche_Gleis"';
INSERT INTO enum_ax_lagezuroberflaeche_gleis (wert,beschreibung) VALUES 
('1200', 'Unter der Erdoberfläche'),
('1400', 'Aufgeständert');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_flugverkehrsanlage'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_flugverkehrsanlage AS ENUM 
	('1310', '1320', '1330', '5520', '5531', '5540', '5550');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_flugverkehrsanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_flugverkehrsanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_flugverkehrsanlage IS 'Alias: "enum_AX_Art_Flugverkehrsanlage"';
INSERT INTO enum_ax_art_flugverkehrsanlage (wert,beschreibung) VALUES 
('1310', 'Startbahn, Landebahn'),
('1320', 'Zurollbahn, Taxiway'),
('1330', 'Vorfeld'),
('5520', 'Verkehrslandeplatz'),
('5531', 'Hubschrauberlandeplatz'),
('5540', 'Landeplatz, Sonderlandeplatz'),
('5550', 'Segelfluggelände');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bauwerksfunktion_bauwerkimverkehrsbereich'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bauwerksfunktion_bauwerkimverkehrsbereich AS ENUM 
	('1800', '1801', '1802', '1803', '1804', '1805', '1806', '1807', '1808', '1810', '1820', '1830', '1840', '1845', '1850', '1870', '1880', '1890', '1900', '1910', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bauwerksfunktion_bauwerkimverkehrsbereich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bauwerksfunktion_bauwerkimverkehrsbereich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bauwerksfunktion_bauwerkimverkehrsbereich IS 'Alias: "enum_AX_Bauwerksfunktion_BauwerkImVerkehrsbereich"';
INSERT INTO enum_ax_bauwerksfunktion_bauwerkimverkehrsbereich (wert,beschreibung) VALUES 
('1800', 'Brücke'),
('1801', 'Mehrstöckige Brücke'),
('1802', 'Bogenbrücke'),
('1803', 'Fachwerkbrücke'),
('1804', 'Hängebrücke'),
('1805', 'Pontonbrücke'),
('1806', 'Drehbrücke'),
('1807', 'Hebebrücke'),
('1808', 'Zugbrücke'),
('1810', 'Landebrücke'),
('1820', 'Steg'),
('1830', 'Hochbahn, Hochstraße'),
('1840', 'Brückenpfeiler'),
('1845', 'Widerlager'),
('1850', 'Strompfeiler'),
('1870', 'Tunnel, Unterführung'),
('1880', 'Schutzgalerie, Einhausung'),
('1890', 'Schleusenkammer'),
('1900', 'Durchfahrt'),
('1910', 'Anflugbefeuerung'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bauwerksfunktion_bauwerkimgewaesserbereich'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bauwerksfunktion_bauwerkimgewaesserbereich AS ENUM 
	('2010', '2011', '2012', '2020', '2030', '2040', '2050', '2060', '2070', '2080', '2090', '2110', '2120', '2130', '2131', '2132', '2133', '2134', '2135', '2136', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bauwerksfunktion_bauwerkimgewaesserbereich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bauwerksfunktion_bauwerkimgewaesserbereich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bauwerksfunktion_bauwerkimgewaesserbereich IS 'Alias: "enum_AX_Bauwerksfunktion_BauwerkImGewaesserbereich"';
INSERT INTO enum_ax_bauwerksfunktion_bauwerkimgewaesserbereich (wert,beschreibung) VALUES 
('2010', 'Durchlass'),
('2011', 'Rohrdurchlass'),
('2012', 'Düker'),
('2020', 'Rückhaltebecken'),
('2030', 'Staumauer'),
('2040', 'Staudamm'),
('2050', 'Wehr'),
('2060', 'Sicherheitstor'),
('2070', 'Siel'),
('2080', 'Sperrwerk'),
('2090', 'Schöpfwerk'),
('2110', 'Fischtreppe'),
('2120', 'Pegel'),
('2130', 'Uferbefestigung'),
('2131', 'Wellenbrecher, Buhne'),
('2132', 'Lahnung'),
('2133', 'Hafendamm, Mole'),
('2134', 'Höft'),
('2135', 'Deckwerk'),
('2136', 'Ufermauer, Kaimauer'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_einrichtungenfuerdenschiffsverkehr'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_einrichtungenfuerdenschiffsverkehr AS ENUM 
	('1410', '1420', '1430', '1440', '1450', '1460', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_einrichtungenfuerdenschiffsverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_einrichtungenfuerdenschiffsverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_einrichtungenfuerdenschiffsverkehr IS 'Alias: "enum_AX_Art_EinrichtungenFuerDenSchiffsverkehr"';
INSERT INTO enum_ax_art_einrichtungenfuerdenschiffsverkehr (wert,beschreibung) VALUES 
('1410', 'Bake'),
('1420', 'Leuchtfeuer'),
('1430', 'Kilometerstein'),
('1440', 'Tafel an Gewässern'),
('1450', 'Pricke'),
('1460', 'Anleger'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_bauwerkimverkehrsbereich'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_bauwerkimverkehrsbereich AS ENUM 
	('2100');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_bauwerkimverkehrsbereich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_bauwerkimverkehrsbereich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_bauwerkimverkehrsbereich IS 'Alias: "enum_AX_Zustand_BauwerkImVerkehrsbereich"';
INSERT INTO enum_ax_zustand_bauwerkimverkehrsbereich (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artdergewaesserachse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artdergewaesserachse AS ENUM 
	('1000', '2000', '3001', '3002');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artdergewaesserachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artdergewaesserachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artdergewaesserachse IS 'Alias: "enum_AX_ArtDerGewaesserachse"';
INSERT INTO enum_ax_artdergewaesserachse (wert,beschreibung) VALUES 
('1000', 'Gewässerachse der WSV'),
('2000', 'Genäherte Mittellinie in Gewässern'),
('3001', 'Fiktive Verbindung in Fließgewässern'),
('3002', 'Fiktive Verbindung in Seen und Teichen');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_schifffahrtsliniefaehrverkehr'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_schifffahrtsliniefaehrverkehr AS ENUM 
	('1710', '1720', '1730', '1740');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_schifffahrtsliniefaehrverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_schifffahrtsliniefaehrverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_schifffahrtsliniefaehrverkehr IS 'Alias: "enum_AX_Art_SchifffahrtslinieFaehrverkehr"';
INSERT INTO enum_ax_art_schifffahrtsliniefaehrverkehr (wert,beschreibung) VALUES 
('1710', 'Autofährverkehr'),
('1720', 'Eisenbahnfährverkehr'),
('1730', 'Personenfährverkehr'),
('1740', 'Linienverkehr');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_schleuse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_schleuse AS ENUM 
	('2100');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_schleuse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_schleuse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_schleuse IS 'Alias: "enum_AX_Zustand_Schleuse"';
INSERT INTO enum_ax_zustand_schleuse (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_nutzung_hafen'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_nutzung_hafen AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_nutzung_hafen (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_nutzung_hafen_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_nutzung_hafen IS 'Alias: "enum_AX_Nutzung_Hafen"';
INSERT INTO enum_ax_nutzung_hafen (wert,beschreibung) VALUES 
('1000', 'Zivil'),
('2000', 'Militärisch'),
('3000', 'Teils zivil, teils militärisch');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_konstruktionsmerkmalbauart_schleuse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_konstruktionsmerkmalbauart_schleuse AS ENUM 
	('1010', '1020');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_konstruktionsmerkmalbauart_schleuse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_konstruktionsmerkmalbauart_schleuse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_konstruktionsmerkmalbauart_schleuse IS 'Alias: "enum_AX_KonstruktionsmerkmalBauart_Schleuse"';
INSERT INTO enum_ax_konstruktionsmerkmalbauart_schleuse (wert,beschreibung) VALUES 
('1010', 'Schiffshebewerk'),
('1020', 'Kammerschleuse');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_hafenkategorie_hafen'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_hafenkategorie_hafen AS ENUM 
	('1010', '1020', '1030', '1040', '1050', '1060', '1070');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_hafenkategorie_hafen (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_hafenkategorie_hafen_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_hafenkategorie_hafen IS 'Alias: "enum_AX_Hafenkategorie_Hafen"';
INSERT INTO enum_ax_hafenkategorie_hafen (wert,beschreibung) VALUES 
('1010', 'Containerhafen'),
('1020', 'Ölhafen'),
('1030', 'Fischereihafen'),
('1040', 'Sporthafen, Yachthafen'),
('1050', 'Fährhafen'),
('1060', 'Stückguthafen'),
('1070', 'Hafen für Massengüter');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_gewaessermerkmal'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_gewaessermerkmal AS ENUM 
	('1610', '1620', '1630', '1640', '1650', '1660', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_gewaessermerkmal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_gewaessermerkmal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_gewaessermerkmal IS 'Alias: "enum_AX_Art_Gewaessermerkmal"';
INSERT INTO enum_ax_art_gewaessermerkmal (wert,beschreibung) VALUES 
('1610', 'Quelle'),
('1620', 'Wasserfall'),
('1630', 'Stromschnelle'),
('1640', 'Sandbank'),
('1650', 'Watt'),
('1660', 'Priel'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_hydrologischesmerkmal_untergeordnetesgewaesser'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_hydrologischesmerkmal_untergeordnetesgewaesser AS ENUM 
	('2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_hydrologischesmerkmal_untergeordnetesgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_hydrologischesmerkmal_untergeordnetesgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_hydrologischesmerkmal_untergeordnetesgewaesser IS 'Alias: "enum_AX_HydrologischesMerkmal_UntergeordnetesGewaesser"';
INSERT INTO enum_ax_hydrologischesmerkmal_untergeordnetesgewaesser (wert,beschreibung) VALUES 
('2000', 'Nicht ständig Wasser führend'),
('3000', 'Trocken, versiegt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_lagezurerdoberflaeche_untergeordnetesgewaesser'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_lagezurerdoberflaeche_untergeordnetesgewaesser AS ENUM 
	('1800', '1810');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_lagezurerdoberflaeche_untergeordnetesgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_lagezurerdoberflaeche_untergeordnetesgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_lagezurerdoberflaeche_untergeordnetesgewaesser IS 'Alias: "enum_AX_LageZurErdoberflaeche_UntergeordnetesGewaesser"';
INSERT INTO enum_ax_lagezurerdoberflaeche_untergeordnetesgewaesser (wert,beschreibung) VALUES 
('1800', 'Verrohrt, unterirdisch, bedeckt'),
('1810', 'Verdolt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artdespolders'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artdespolders AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artdespolders (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artdespolders_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artdespolders IS 'Alias: "enum_AX_ArtDesPolders"';
INSERT INTO enum_ax_artdespolders (wert,beschreibung) VALUES 
('1000', 'Sommerpolder'),
('2000', 'Entlastungspolder'),
('3000', 'Flutungspolder');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_polder'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_polder AS ENUM 
	(' 7410', ' 7420');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_polder (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_polder_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_polder IS 'Alias: "enum_AX_Funktion_Polder"';
INSERT INTO enum_ax_funktion_polder (wert,beschreibung) VALUES 
(' 7410', 'Gesteuert = 7410'),
(' 7420', 'Ungesteuert = 7420');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_untergeordnetesgewaesser'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_untergeordnetesgewaesser AS ENUM 
	('1010', '1011', '1012', '1013', '1020', '1030', '1040');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_untergeordnetesgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_untergeordnetesgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_untergeordnetesgewaesser IS 'Alias: "enum_AX_Funktion_UntergeordnetesGewaesser"';
INSERT INTO enum_ax_funktion_untergeordnetesgewaesser (wert,beschreibung) VALUES 
('1010', 'Graben'),
('1011', 'Grabenkante, rechts'),
('1012', 'Grabenkante, links'),
('1013', 'Grabenmitte'),
('1020', 'Fleet'),
('1030', 'Bach'),
('1040', 'Teich');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_hydrologischesmerkmal_gewaessermerkmal'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_hydrologischesmerkmal_gewaessermerkmal AS ENUM 
	('2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_hydrologischesmerkmal_gewaessermerkmal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_hydrologischesmerkmal_gewaessermerkmal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_hydrologischesmerkmal_gewaessermerkmal IS 'Alias: "enum_AX_HydrologischesMerkmal_Gewaessermerkmal"';
INSERT INTO enum_ax_hydrologischesmerkmal_gewaessermerkmal (wert,beschreibung) VALUES 
('2000', 'Nicht ständig Wasser führend');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_vegetationsmerkmal'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_vegetationsmerkmal AS ENUM 
	('1000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_vegetationsmerkmal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_vegetationsmerkmal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_vegetationsmerkmal IS 'Alias: "enum_AX_Funktion_Vegetationsmerkmal"';
INSERT INTO enum_ax_funktion_vegetationsmerkmal (wert,beschreibung) VALUES 
('1000', 'Windschutz');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_vegetationsmerkmal'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_vegetationsmerkmal AS ENUM 
	('5000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_vegetationsmerkmal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_vegetationsmerkmal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_vegetationsmerkmal IS 'Alias: "enum_AX_Zustand_Vegetationsmerkmal"';
INSERT INTO enum_ax_zustand_vegetationsmerkmal (wert,beschreibung) VALUES 
('5000', 'Nass');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bewuchs_vegetationsmerkmal'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bewuchs_vegetationsmerkmal AS ENUM 
	('1250', '1011', '1012', '1021', '1022', '1023', '1100', '1101', '1102', '1103', '1210', '1220', '1230', '1260', '1300', '1400', '1500', '1510', '1600', '1700', '1800', '1900');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bewuchs_vegetationsmerkmal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bewuchs_vegetationsmerkmal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bewuchs_vegetationsmerkmal IS 'Alias: "enum_AX_Bewuchs_Vegetationsmerkmal"';
INSERT INTO enum_ax_bewuchs_vegetationsmerkmal (wert,beschreibung) VALUES 
('1250', 'Gehölz'),
('1011', 'Nadelbaum'),
('1012', 'Laubbaum'),
('1021', 'Baumbestand, Laubholz'),
('1022', 'Baumbestand, Nadelholz'),
('1023', 'Baumbestand, Laub- und Nadelholz'),
('1100', 'Hecke'),
('1101', 'Heckenkante, rechts'),
('1102', 'Heckenkante, links'),
('1103', 'Heckenmitte'),
('1210', 'Baumreihe, Laubholz'),
('1220', 'Baumreihe, Nadelholz'),
('1230', 'Baumreihe, Laub- und Nadelholz'),
('1260', 'Gebüsch'),
('1300', 'Schneise'),
('1400', 'Röhricht, Schilf'),
('1500', 'Gras'),
('1510', 'Rain'),
('1600', 'Zierfläche'),
('1700', 'Korbweide'),
('1800', 'Reet'),
('1900', 'Streuobst');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_eigentuemerart_namensnummer'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_eigentuemerart_namensnummer AS ENUM 
	('1000', '1100', '1200', '1300', '1500', '2000', '2100', '2200', '2300', '2400', '2500', '2900', '3000', '3100', '4000', '4100', '4200', '4900', '5100', '5101', '5102', '5103', '5104', '5105', '5106', '5107', '5210', '5220', '5230', '5240', '5300', '5400', '5500', '5600', '5700', '5800', '5920', '5921', '5922', '5923', '5924', '5925', '5926', '5927', '5928', '5929', '5930', '5931', '5932', '5933', '5934', '5935', '5936', '5937', '5938', '5939', '6000', '6001', '6002', '6003', '6004', '6005', '6006', '6007', '6008', '6009', '6010', '6012', '6011', '6013', '6014', '6015', '6016', '7100', '8000', '9000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_eigentuemerart_namensnummer (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_eigentuemerart_namensnummer_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_eigentuemerart_namensnummer IS 'Alias: "enum_AX_Eigentuemerart_Namensnummer"';
INSERT INTO enum_ax_eigentuemerart_namensnummer (wert,beschreibung) VALUES 
('1000', 'Natürliche Personen'),
('1100', 'Natürliche Person - Alleineigentum oder Ehepartner'),
('1200', 'Natürliche Person - Wohnsitz im Land'),
('1300', 'Natürliche Person - Wohnsitz außerhalb des Landes'),
('1500', 'Natürliche Person - Gemeinschaftseigentum'),
('2000', 'Juristische Personen'),
('2100', 'Gemeinnützige Bau-, Wohnungs- oder Siedlungsgesellschaft oder -genossenschaft einschließlich Heimstätte'),
('2200', 'Sonstige gemeinnützige Institution (Träger von Krankenhäusern, Altenheimen usw.)'),
('2300', 'Privates Wohnungsunternehmen, private Baugesellschaft u.ä.'),
('2400', 'Kreditinstitut'),
('2500', 'Versicherungsunternehmen'),
('2900', 'Andere Unternehmen, Gesellschaften usw.'),
('3000', 'Körperschaften'),
('3100', 'Stiftung'),
('4000', 'Kirchliches Eigentum'),
('4100', 'Evangelische Kirche'),
('4200', 'Katholische Kirche'),
('4900', 'Andere Kirchen, Religionsgemeinschaften usw.'),
('5100', 'Bundesrepublik Deutschland'),
('5101', 'Bundesrepublik Deutschland, Bundesstraßenverwaltung'),
('5102', 'Bundesrepublik Deutschland, Bundeswehrverwaltung'),
('5103', 'Bundesrepublik Deutschland, Forstverwaltung'),
('5104', 'Bundesrepublik Deutschland, Finanzverwaltung'),
('5105', 'Bundesrepublik Deutschland, Zivilschutz'),
('5106', 'Bundesrepublik Deutschland, Wasserstraßenverwaltung'),
('5107', 'Bundesrepublik Deutschland, Bundeseisenbahnvermögen'),
('5210', 'Eigentum des Volkes nach DDR-Recht'),
('5220', 'Eigentum der Genossenschaften und deren Einrichtungen'),
('5230', 'Eigentum der gesellschaftlichen Organisationen und deren Einrichtungen'),
('5240', 'Kommunale Gebietskörperschaften nach DDR-Recht'),
('5300', 'Ausländischer Staat'),
('5400', 'Kreis'),
('5500', 'Gemeinde'),
('5600', 'Kommunale Gebietskörperschaften'),
('5700', 'Andere Gebietskörperschaften, Regionalverbände usw.'),
('5800', 'Zweckverbände, Kommunale Betriebe'),
('5920', 'Eigenes Bundesland'),
('5921', 'Eigenes Bundesland, Denkmalpflege'),
('5922', 'Eigenes Bundesland, Domänenverwaltung'),
('5923', 'Eigenes Bundesland, Eichverwaltung'),
('5924', 'Eigenes Bundesland, Finanzverwaltung'),
('5925', 'Eigenes Bundesland, Forstverwaltung'),
('5926', 'Eigenes Bundesland, Gesundheitswesen'),
('5927', 'Eigenes Bundesland, Polizeiverwaltung'),
('5928', 'Eigenes Bundesland, innere Verwaltung'),
('5929', 'Eigenes Bundesland, Justizverwaltung'),
('5930', 'Eigenes Bundesland, Kultusverwaltung'),
('5931', 'Eigenes Bundesland, Landespflanzenschutzverwaltung'),
('5932', 'Eigenes Bundesland, Arbeitsverwaltung'),
('5933', 'Eigenes Bundesland, Sozialwesen'),
('5934', 'Eigenes Bundesland, Landesbetrieb Straßen und Verkehr'),
('5935', 'Eigenes Bundesland, Umweltverwaltung'),
('5936', 'Eigenes Bundesland, Vermessungs- und Katasterverwaltung'),
('5937', 'Eigenes Bundesland, Wasserwirtschaftsverwaltung'),
('5938', 'Eigenes Bundesland, Wirtschaftsverwaltung'),
('5939', 'Eigenes Bundesland, Liegenschafts- und Baubetreuung (LBB)'),
('6000', 'Anderes Bundesland (allg.)'),
('6001', 'Schleswig-Holstein'),
('6002', 'Hamburg'),
('6003', 'Niedersachsen'),
('6004', 'Bremen'),
('6005', 'Nordrhein-Westfalen'),
('6006', 'Hessen'),
('6007', 'Rheinland-Pfalz'),
('6008', 'Baden-Württemberg'),
('6009', 'Bayern'),
('6010', 'Saarland'),
('6012', 'Brandenburg'),
('6011', 'Berlin'),
('6013', 'Mecklenburg-Vorpommern'),
('6014', 'Sachsen'),
('6015', 'Sachsen-Anhalt'),
('6016', 'Thüringen'),
('7100', 'Deutsche Bahn AG'),
('8000', 'Herrenlos'),
('9000', 'Eigentümer unbekannt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_li_processstep_ohnedatenerhebung_description'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_li_processstep_ohnedatenerhebung_description AS ENUM 
	('Erhebung');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_blattart_buchungsblatt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_blattart_buchungsblatt AS ENUM 
	('1000', '2000', '3000', '4000', '5000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_blattart_buchungsblatt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_blattart_buchungsblatt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_blattart_buchungsblatt IS 'Alias: "enum_AX_Blattart_Buchungsblatt"';
INSERT INTO enum_ax_blattart_buchungsblatt (wert,beschreibung) VALUES 
('1000', 'Grundbuchblatt'),
('2000', 'Katasterblatt'),
('3000', 'Pseudoblatt'),
('4000', 'Erwerberblatt'),
('5000', 'Fiktives Blatt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_anrede_person'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_anrede_person AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_anrede_person (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_anrede_person_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_anrede_person IS 'Alias: "enum_AX_Anrede_Person"';
INSERT INTO enum_ax_anrede_person (wert,beschreibung) VALUES 
('1000', 'Frau'),
('2000', 'Herr'),
('3000', 'Firma');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderrechtsgemeinschaft_namensnummer'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderrechtsgemeinschaft_namensnummer AS ENUM 
	('1000', '2000', '3000', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderrechtsgemeinschaft_namensnummer (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderrechtsgemeinschaft_namensnummer_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderrechtsgemeinschaft_namensnummer IS 'Alias: "enum_AX_ArtDerRechtsgemeinschaft_Namensnummer"';
INSERT INTO enum_ax_artderrechtsgemeinschaft_namensnummer (wert,beschreibung) VALUES 
('1000', 'Erbengemeinschaft'),
('2000', 'Gütergemeinschaft'),
('3000', 'BGB-Gesellschaft'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_buchungsart_buchungsstelle'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_buchungsart_buchungsstelle AS ENUM 
	('1100', '1101', '1102', '1200', '1301', '1302', '1303', '1401', '1402', '1403', '1501', '1502', '1503', '2101', '2102', '2103', '2104', '2105', '2106', '2107', '2108', '2109', '2110', '2201', '2202', '2203', '2204', '2205', '2301', '2302', '2303', '2304', '2305', '2401', '2402', '2403', '2404', '2405', '2501', '2502', '2503', '2504', '2505', '3100', '4100', '5101', '5200', '5201', '5202', '5203', '6101');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_buchungsart_buchungsstelle (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_buchungsart_buchungsstelle_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_buchungsart_buchungsstelle IS 'Alias: "enum_AX_Buchungsart_Buchungsstelle"';
INSERT INTO enum_ax_buchungsart_buchungsstelle (wert,beschreibung) VALUES 
('1100', 'Grundstück'),
('1101', 'Aufgeteiltes Grundstück WEG'),
('1102', 'Aufgeteiltes Grundstück Par. 3 Abs. 4 GBO'),
('1200', 'Ungetrennter Hofraum'),
('1301', 'Wohnungs-/Teileigentum'),
('1302', 'Miteigentum Par. 3 Abs. 4 GBO'),
('1303', 'Anteil am ungetrennten Hofraum'),
('1401', 'Aufgeteilter Anteil Wohnungs-/Teileigentum'),
('1402', 'Aufgeteilter Anteil Miteigentum Par. 3 Abs. 4 GBO'),
('1403', 'Aufgeteilter Anteil am ungetrennten Hofraum'),
('1501', 'Anteil an Wohnungs-/Teileigentumsanteil'),
('1502', 'Anteil an Miteigentumsanteil Par. 3 Abs. 4 GBO'),
('1503', 'Anteil am Anteil zum ungetrennten Hofraum'),
('2101', 'Erbbaurecht'),
('2102', 'Untererbbaurecht'),
('2103', 'Gebäudeeigentum'),
('2104', 'Fischereirecht'),
('2105', 'Bergwerksrecht'),
('2106', 'Nutzungsrecht'),
('2107', 'Realgewerberecht'),
('2108', 'Gemeinderecht'),
('2109', 'Stavenrecht'),
('2110', 'Hauberge'),
('2201', 'Aufgeteiltes Erbbaurecht WEG'),
('2202', 'Aufgeteiltes Untererbbaurecht WEG'),
('2203', 'Aufgeteiltes Recht Par. 3 Abs. 4 GBO'),
('2204', 'Aufgeteiltes Recht, Körperschaft'),
('2205', 'Aufgeteiltes Gebäudeeigentum'),
('2301', 'Wohnungs-/Teilerbbaurecht'),
('2302', 'Wohnungs-/Teiluntererbbaurecht'),
('2303', 'Erbbaurechtsanteil Par. 3 Abs. 4 GBO'),
('2304', 'Anteiliges Recht, Körperschaft'),
('2305', 'Anteil am Gebäudeeigentum'),
('2401', 'Aufgeteilter Anteil Wohnungs-/Teilerbbaurecht'),
('2402', 'Aufgeteilter Anteil Wohnungs-/Teiluntererbbaurecht'),
('2403', 'Aufgeteilter Erbbaurechtsanteil Par. 3 Abs. 4 GBO'),
('2404', 'Aufgeteiltes anteiliges Recht, Körperschaft'),
('2405', 'Aufgeteilter Anteil am Gebäudeeigentum'),
('2501', 'Anteil am Wohnungs-/Teilerbbaurechtsanteil'),
('2502', 'Anteil am Wohnungs-/Teiluntererbbaurechtsanteil'),
('2503', 'Anteil am Erbbaurechtsanteil Par. 3 Abs. 4 GBO'),
('2504', 'Anteil am anteiligen Recht, Körperschaft'),
('2505', 'Anteil am Anteil zum Gebäudeeigentum'),
('3100', 'Vermerk subjektiv dinglicher Rechte (Par. 9 GBO)'),
('4100', 'Stockwerkseigentum'),
('5101', 'Von Buchungspflicht befreit Par. 3 Abs. 2 GBO'),
('5200', 'Anliegerflurstück'),
('5201', 'Anliegerweg'),
('5202', 'Anliegergraben'),
('5203', 'Anliegerwasserlauf, Anliegergewässer'),
('6101', 'Nicht gebuchtes Fischereirecht');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_klassifikation_hierarchiestufe3d_lagefestpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_klassifikation_hierarchiestufe3d_lagefestpunkt AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_klassifikation_hierarchiestufe3d_lagefestpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_klassifikation_hierarchiestufe3d_lagefestpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_klassifikation_hierarchiestufe3d_lagefestpunkt IS 'Alias: "enum_AX_Klassifikation_Hierarchiestufe3D_Lagefestpunkt"';
INSERT INTO enum_ax_klassifikation_hierarchiestufe3d_lagefestpunkt (wert,beschreibung) VALUES 
('1000', 'Hierarchiestufe A'),
('2000', 'Hierarchiestufe B'),
('3000', 'Hierarchiestufe C'),
('4000', 'Hierarchiestufe D'),
('5000', 'Hierarchiestufe E'),
('9998', 'Nach Quellenlage nicht zu spezifizieren');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktstabilitaet'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_punktstabilitaet AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '5100', '5200', '5300', '5400', '6000', '8000', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_punktstabilitaet (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_punktstabilitaet_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_punktstabilitaet IS 'Alias: "enum_AX_Punktstabilitaet"';
INSERT INTO enum_ax_punktstabilitaet (wert,beschreibung) VALUES 
('1000', 'sehr gut'),
('2000', 'gut'),
('3000', 'befriedigend'),
('4000', 'ausreichend'),
('5000', 'mangelhaft (ohne Nennung eines Grundes)'),
('5100', 'mangelhaft (Bergsenkungsgebiet)'),
('5200', 'mangelhaft (in rutschgefährdeter Hanglage)'),
('5300', 'mangelhaft (sehr nahe an Gewässer)'),
('5400', 'mangelhaft (instabiler Untergrund)'),
('6000', 'aus Wiederholungsmessungen nachgewiesene Stabilität der Vermarkung'),
('8000', 'mangelhaft'),
('9998', 'Stabilität der Vermarkung nicht untersucht');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktstabilitaet_hoehenfestpunkt_geologischestabilitaet'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_punktstabilitaet_hoehenfestpunkt_geologischestabilitaet AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_punktstabilitaet_hoehenfestpunkt_geologischestabil (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_punktstabilitaet_hoehenfestpunkt_geologischestabil_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_punktstabilitaet_hoehenfestpunkt_geologischestabil IS 'Alias: "enum_AX_Punktstabilitaet_Hoehenfestpunkt_GeologischeStabilitaet"';
INSERT INTO enum_ax_punktstabilitaet_hoehenfestpunkt_geologischestabil (wert,beschreibung) VALUES 
('1000', 'sehr gute geologische Stabilität'),
('2000', 'gute geologische Stabilität'),
('3000', 'befriedigende geologische Stabilität'),
('4000', 'ausreichende geologische Stabilität'),
('5000', 'mangelhafte geologische Stabilität'),
('9998', 'geologische Stabilität nicht untersucht');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_klassifikation_ordnung_lagefestpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_klassifikation_ordnung_lagefestpunkt AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '6000', '9000', '9998', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_klassifikation_ordnung_lagefestpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_klassifikation_ordnung_lagefestpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_klassifikation_ordnung_lagefestpunkt IS 'Alias: "enum_AX_Klassifikation_Ordnung_Lagefestpunkt"';
INSERT INTO enum_ax_klassifikation_ordnung_lagefestpunkt (wert,beschreibung) VALUES 
('1000', 'TP (1) - Hauptdreieckspunkt, Zwischenpunkt 1. Ordnung'),
('2000', 'TP (2) - Trigonometrischer Punkt 2. Ordnung'),
('3000', 'TP (3) - Trigonometrischer Punkt 3. Ordnung'),
('4000', 'TP (4) - Trigonometrischer Punkt 4. Ordnung'),
('5000', 'TP (5) - Trigonometrischer Punkt 5. Ordnung'),
('6000', 'ÜL - Übergeordneter Lagefestpunkt (Berlin)'),
('9000', 'LFP, der nur eine interne Bedeutung hat'),
('9998', 'Nach Quellenlage nicht zu spezifieren'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktstabilitaet_hoehenfestpunkt_guetedesvermarkungstra'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_punktstabilitaet_hoehenfestpunkt_guetedesvermarkungstra AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_punktstabilitaet_hoehenfestpunkt_guetedesvermarkun (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_punktstabilitaet_hoehenfestpunkt_guetedesvermarkun_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_punktstabilitaet_hoehenfestpunkt_guetedesvermarkun IS 'Alias: "enum_AX_Punktstabilitaet_Hoehenfestpunkt_GueteDesVermarkungstraegers"';
INSERT INTO enum_ax_punktstabilitaet_hoehenfestpunkt_guetedesvermarkun (wert,beschreibung) VALUES 
('1000', 'sehr gut'),
('2000', 'gut'),
('3000', 'befriedigend'),
('4000', 'ausreichend'),
('5000', 'unzureichend'),
('9998', 'nicht bekannt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_ordnung_schwerefestpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_ordnung_schwerefestpunkt AS ENUM 
	('0500', '1000', '2000', '3000', '4000', '9000', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_ordnung_schwerefestpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_ordnung_schwerefestpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_ordnung_schwerefestpunkt IS 'Alias: "enum_AX_Ordnung_Schwerefestpunkt"';
INSERT INTO enum_ax_ordnung_schwerefestpunkt (wert,beschreibung) VALUES 
('0500', 'SFP(0) - Schweregrundnetzpunkt'),
('1000', 'SFP(1) - Schwerefestpunkt 1.Ordnung, Hauptschwerenetzpunkt'),
('2000', 'SFP(2) - Schwerefestpunkt 2.Ordnung'),
('3000', 'SFP(3) - Schwerefestpunkt 3.Ordnung'),
('4000', 'SFP(4) - Schwerefestpunkt 4. Ordnung'),
('9000', 'SFP, der nur eine interne Bedeutung hat'),
('9998', 'nach Quellenlage nicht zu spezifizieren');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_referenzstationspunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_referenzstationspunkt AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_referenzstationspunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_referenzstationspunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_referenzstationspunkt IS 'Alias: "enum_AX_Funktion_Referenzstationspunkt"';
INSERT INTO enum_ax_funktion_referenzstationspunkt (wert,beschreibung) VALUES 
('1000', 'Zentrum'),
('2000', 'Exzentrum');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_lagefestpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_lagefestpunkt AS ENUM 
	('1000', '2000', '3000', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_lagefestpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_lagefestpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_lagefestpunkt IS 'Alias: "enum_AX_Funktion_Lagefestpunkt"';
INSERT INTO enum_ax_funktion_lagefestpunkt (wert,beschreibung) VALUES 
('1000', 'Zentrum'),
('2000', 'Exzentrum, Stationspunkt, Nebenstand'),
('3000', 'Zwillingspunkt, Orientierungspunkt'),
('4000', 'Versicherungspunkt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_skizzenart_skizze'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_skizzenart_skizze AS ENUM 
	('1000', '2000', '2100', '2200', '2300', '3000', '3100', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_skizzenart_skizze (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_skizzenart_skizze_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_skizzenart_skizze IS 'Alias: "enum_AX_Skizzenart_Skizze"';
INSERT INTO enum_ax_skizzenart_skizze (wert,beschreibung) VALUES 
('1000', 'Lage-/Einmessungsskizze/Ansicht für die Standardausgabe'),
('2000', 'sonstige Lageskizze'),
('2100', 'sonstige Einmessungsskizze'),
('2200', 'sonstige Ansichtszeichnung oder Foto'),
('2300', 'Randzeichnung'),
('3000', 'Ausschnitt aus der Punktübersicht'),
('3100', 'Luftbildausschnitt mit Punkteintrag'),
('4000', 'Diagramm, Tabelle');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_schwerefestpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_schwerefestpunkt AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_schwerefestpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_schwerefestpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_schwerefestpunkt IS 'Alias: "enum_AX_Funktion_Schwerefestpunkt"';
INSERT INTO enum_ax_funktion_schwerefestpunkt (wert,beschreibung) VALUES 
('1000', 'Zentrum'),
('2000', 'Exzentrum');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktstabilitaet_hoehenfestpunkt_hoehenstabilitaetauswi'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_punktstabilitaet_hoehenfestpunkt_hoehenstabilitaetauswi AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_punktstabilitaet_hoehenfestpunkt_hoehenstabilitaet (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_punktstabilitaet_hoehenfestpunkt_hoehenstabilitaet_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_punktstabilitaet_hoehenfestpunkt_hoehenstabilitaet IS 'Alias: "enum_AX_Punktstabilitaet_Hoehenfestpunkt_HoehenstabilitaetAusWiederholungsmessungen"';
INSERT INTO enum_ax_punktstabilitaet_hoehenfestpunkt_hoehenstabilitaet (wert,beschreibung) VALUES 
('1000', 'sehr gut'),
('2000', 'gut'),
('3000', 'befriedigend'),
('4000', 'bedenklich'),
('5000', 'unzureichend'),
('9998', 'nicht bekannt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktstabilitaet_hoehenfestpunkt_guetedesbaugrundes'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_punktstabilitaet_hoehenfestpunkt_guetedesbaugrundes AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_punktstabilitaet_hoehenfestpunkt_guetedesbaugrunde (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_punktstabilitaet_hoehenfestpunkt_guetedesbaugrunde_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_punktstabilitaet_hoehenfestpunkt_guetedesbaugrunde IS 'Alias: "enum_AX_Punktstabilitaet_Hoehenfestpunkt_GueteDesBaugrundes"';
INSERT INTO enum_ax_punktstabilitaet_hoehenfestpunkt_guetedesbaugrunde (wert,beschreibung) VALUES 
('1000', 'sehr gute Stabilität des Baugrundes'),
('2000', 'gute Stabilität des Baugrundes'),
('3000', 'befriedigende Güte des Baugrundes'),
('4000', 'ausreichende Güte des Baugrundes'),
('5000', 'mangelhafte Güte des Baugrundes'),
('9998', 'Güte des Baugrundes nicht untersucht');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktstabilitaet_hoehenfestpunkt_grundwasserschwankung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_punktstabilitaet_hoehenfestpunkt_grundwasserschwankung AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_punktstabilitaet_hoehenfestpunkt_grundwasserschwan (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_punktstabilitaet_hoehenfestpunkt_grundwasserschwan_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_punktstabilitaet_hoehenfestpunkt_grundwasserschwan IS 'Alias: "enum_AX_Punktstabilitaet_Hoehenfestpunkt_Grundwasserschwankung"';
INSERT INTO enum_ax_punktstabilitaet_hoehenfestpunkt_grundwasserschwan (wert,beschreibung) VALUES 
('1000', 'sehr geringe Grundwasserschwankung (kleiner gleich 0,5 m)'),
('2000', 'geringe Grundwasserschwankung (groesser 0,5 m und kleiner gleich 2 m)'),
('3000', 'mäßige Grundwasserschwankung (groesser 2 m und kleiner gleich 5 m)'),
('4000', 'starke Grundwasserschwankung (groesser 5m und kleiner gleich 10 m)'),
('5000', 'sehr starke Grundwasserschwankung (groesser 10 m)'),
('9998', 'Grundwasserschwankung nicht ermittelt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktstabilitaet_hoehenfestpunkt_topographieundumwelt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_punktstabilitaet_hoehenfestpunkt_topographieundumwelt AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_punktstabilitaet_hoehenfestpunkt_topographieundumw (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_punktstabilitaet_hoehenfestpunkt_topographieundumw_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_punktstabilitaet_hoehenfestpunkt_topographieundumw IS 'Alias: "enum_AX_Punktstabilitaet_Hoehenfestpunkt_TopographieUndUmwelt"';
INSERT INTO enum_ax_punktstabilitaet_hoehenfestpunkt_topographieundumw (wert,beschreibung) VALUES 
('1000', 'keine Topographie- und Umwelteinflüsse'),
('2000', 'geringe Topographie- und Umwelteinflüsse'),
('3000', 'mäßige Topographie- und Umwelteinflüsse'),
('4000', 'starke Topographie- und Umwelteinflüsse'),
('5000', 'sehr starke Topographie- und Umwelteinflüsse'),
('9998', 'Topographie- und Umwelteinflüsse nicht untersucht');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_klassifikation_wertigkeit_lagefestpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_klassifikation_wertigkeit_lagefestpunkt AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '9998', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_klassifikation_wertigkeit_lagefestpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_klassifikation_wertigkeit_lagefestpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_klassifikation_wertigkeit_lagefestpunkt IS 'Alias: "enum_AX_Klassifikation_Wertigkeit_Lagefestpunkt"';
INSERT INTO enum_ax_klassifikation_wertigkeit_lagefestpunkt (wert,beschreibung) VALUES 
('1000', 'Fundamentalpunkt (Punkt auf dem die Position (3D), die schwerebezogene Höhe und die Schwere hoch genau bestimmt worden sind)'),
('2000', 'Übergeordneter Festpunkt'),
('3000', 'Geodätischer Grundnetzpunkt'),
('4000', 'Gebrauchsfestpunkt'),
('5000', 'Untergeordneter Festpunkt'),
('9998', 'Nach Quellenlage nicht zu spezifizieren'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_gnsstauglichkeit'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_gnsstauglichkeit AS ENUM 
	('1000', '1001', '3000', '3001', '3100', '3101', '5000', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_gnsstauglichkeit (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_gnsstauglichkeit_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_gnsstauglichkeit IS 'Alias: "enum_AX_GNSSTauglichkeit"';
INSERT INTO enum_ax_gnsstauglichkeit (wert,beschreibung) VALUES 
('1000', 'weitgehende Horizontfreiheit, Mehrwegeffekte nicht wahrscheinlich'),
('1001', 'sehr gute Satelliten-Empfangseigenschaften nachgewiesen'),
('3000', 'eingeschränkte Horizontfreiheit'),
('3001', 'eingeschränkte Horizontfreiheit, Tauglichkeit nachgewiesen'),
('3100', 'Mehrwegeffekte möglich'),
('3101', 'Mehrwegeffekte nachgewiesen'),
('5000', 'Festpunkt nicht geeignet für Satellitenmessverfahren'),
('9998', 'GNSS-Tauglichkeit nicht untersucht');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktstabilitaet_hoehenfestpunkt_grundwasserstand'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_punktstabilitaet_hoehenfestpunkt_grundwasserstand AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '9000', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_punktstabilitaet_hoehenfestpunkt_grundwasserstand (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_punktstabilitaet_hoehenfestpunkt_grundwasserstand_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_punktstabilitaet_hoehenfestpunkt_grundwasserstand IS 'Alias: "enum_AX_Punktstabilitaet_Hoehenfestpunkt_Grundwasserstand"';
INSERT INTO enum_ax_punktstabilitaet_hoehenfestpunkt_grundwasserstand (wert,beschreibung) VALUES 
('1000', 'Grundwasserstand sehr tief (groesser 10 m)'),
('2000', 'Grundwasserstand tief (groesser 5 m und kleiner gleich 10 m)'),
('3000', 'Grundwasserstand normal (groesser 2 m und kleiner gleich 5 m)'),
('4000', 'Grundwasserstand hoch (groesser 0,5 m und kleiner gleich 2 m)'),
('5000', 'Grundwasserstand sehr hoch (kleiner gleich 0,5 m)'),
('9000', 'Grundwasserstand abgesenkt'),
('9998', 'Grundwasserstand nicht ermittelt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktstabilitaet_hoehenfestpunkt_vermutetehoehenstabili'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_punktstabilitaet_hoehenfestpunkt_vermutetehoehenstabili AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_punktstabilitaet_hoehenfestpunkt_vermutetehoehenst (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_punktstabilitaet_hoehenfestpunkt_vermutetehoehenst_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_punktstabilitaet_hoehenfestpunkt_vermutetehoehenst IS 'Alias: "enum_AX_Punktstabilitaet_Hoehenfestpunkt_VermuteteHoehenstabilitaet"';
INSERT INTO enum_ax_punktstabilitaet_hoehenfestpunkt_vermutetehoehenst (wert,beschreibung) VALUES 
('1000', 'sehr gut'),
('2000', 'gut'),
('3000', 'befriedigend'),
('4000', 'ausreichend'),
('5000', 'mangelhaft'),
('9998', 'nicht bekannt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_ordnung_hoehenfestpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_ordnung_hoehenfestpunkt AS ENUM 
	('1000', '1001', '2000', '3000', '3001', '4000', '6000', '9000', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_ordnung_hoehenfestpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_ordnung_hoehenfestpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_ordnung_hoehenfestpunkt IS 'Alias: "enum_AX_Ordnung_Hoehenfestpunkt"';
INSERT INTO enum_ax_ordnung_hoehenfestpunkt (wert,beschreibung) VALUES 
('1000', 'NivP(1) - Haupthöhenpunkt, Zwischenlinienpunkt 1.Ordnung'),
('1001', 'NivP(1) - Netzverdichtung GPS (Niedersachsen)'),
('2000', 'NivP(2) - Nivellementpunkt 2. Ordnung'),
('3000', 'NivP(3) - Nivellementpunkt 3. Ordnung'),
('3001', 'NivP(3) - nivellitisch bestimmter Bodenpunkt für Referenzstation'),
('4000', 'NivP(4) - Nivellementpunkt 4. Ordnung'),
('6000', 'ÜH - Übergeordneter Höhenfestpunkt (Berlin)'),
('9000', 'Höhenfestpunkt, der nur eine interne Bedeutung hat'),
('9998', 'Nach Quellenlage nicht zu spezifizieren');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_horizontfreiheit_grenzpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_horizontfreiheit_grenzpunkt AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_horizontfreiheit_grenzpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_horizontfreiheit_grenzpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_horizontfreiheit_grenzpunkt IS 'Alias: "enum_AX_Horizontfreiheit_Grenzpunkt"';
INSERT INTO enum_ax_horizontfreiheit_grenzpunkt (wert,beschreibung) VALUES 
('1000', 'Uneingeschränkt'),
('2000', 'Eingeschränkt'),
('3000', 'Nicht geeignet');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_gruendederausgesetztenabmarkung_grenzpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_gruendederausgesetztenabmarkung_grenzpunkt AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '6000', '7000', '8000', '9000', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_gruendederausgesetztenabmarkung_grenzpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_gruendederausgesetztenabmarkung_grenzpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_gruendederausgesetztenabmarkung_grenzpunkt IS 'Alias: "enum_AX_GruendeDerAusgesetztenAbmarkung_Grenzpunkt"';
INSERT INTO enum_ax_gruendederausgesetztenabmarkung_grenzpunkt (wert,beschreibung) VALUES 
('1000', 'Grenzpunkt durch bauliche Anlage ausreichend gekennzeichnet'),
('2000', 'Grenzpunkt liegt innerhalb einer baulichen Anlage'),
('3000', 'Grenzpunkt in öffentlich-rechtlichem Bodenordnungsverfahren'),
('4000', 'Grenzpunkt liegt innerhalb eines Baugebietes'),
('5000', 'Grenzpunkt liegt innerhalb oder an einem Gewässer'),
('6000', 'Keine Abmarkung aufgrund von anderweitigen Hindernissen'),
('7000', 'Abmarkung würde unzumutbare Schäden verursachen'),
('8000', 'Langfristige gemeinschaftliche Nutzung der angrenzenden  Flurstücke'),
('9000', 'Angrenzende Flurstücke dienen dem Gemeingebrauch'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bemerkungzurabmarkung_grenzpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bemerkungzurabmarkung_grenzpunkt AS ENUM 
	('1000', '2000', '3000', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bemerkungzurabmarkung_grenzpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bemerkungzurabmarkung_grenzpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bemerkungzurabmarkung_grenzpunkt IS 'Alias: "enum_AX_BemerkungZurAbmarkung_Grenzpunkt"';
INSERT INTO enum_ax_bemerkungzurabmarkung_grenzpunkt (wert,beschreibung) VALUES 
('1000', 'Abmarkung unterirdisch gesichert'),
('2000', 'Abmarkung exzentrisch gesichert'),
('3000', 'Abmarkung unterirdisch und exzentrisch gesichert'),
('4000', 'Ohne unterirdische oder exzentrische Sicherung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderflurstuecksgrenze_besondereflurstuecksgrenze'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderflurstuecksgrenze_besondereflurstuecksgrenze AS ENUM 
	('1000', '2001', '2002', '2003', '2004', '2010', '2100', '2500', '3000', '7003', '7101', '7102', '7103', '7104', '7106', '7107', '7108');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderflurstuecksgrenze_besondereflurstuecksgrenze (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderflurstuecksgrenze_besondereflurstuecksgrenze_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderflurstuecksgrenze_besondereflurstuecksgrenze IS 'Alias: "enum_AX_ArtDerFlurstuecksgrenze_BesondereFlurstuecksgrenze"';
INSERT INTO enum_ax_artderflurstuecksgrenze_besondereflurstuecksgrenze (wert,beschreibung) VALUES 
('1000', 'Strittige Grenze'),
('2001', 'Nicht festgestellte Grenze'),
('2002', 'Verwaltungsstreitverfahren (Grenze)'),
('2003', 'Mittellinie in Gewässern'),
('2004', 'Flurstücksgrenze nicht feststellbar'),
('2010', 'Topographische Grenzeinrichtung'),
('2100', 'Topographische Gewaesserbegrenzung'),
('2500', 'Grenze der Region'),
('3000', 'Grenze der Flur'),
('7003', 'Grenze der Gemarkung'),
('7101', 'Grenze der Bundesrepublik Deutschland'),
('7102', 'Grenze des Bundeslandes'),
('7103', 'Grenze des Regierungsbezirks'),
('7104', 'Grenze des Landkreises'),
('7106', 'Grenze der Gemeinde'),
('7107', 'Grenze des Gemeindeteils'),
('7108', 'Grenze der Verwaltungsgemeinschaft');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_horizontfreiheit_netzpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_horizontfreiheit_netzpunkt AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_horizontfreiheit_netzpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_horizontfreiheit_netzpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_horizontfreiheit_netzpunkt IS 'Alias: "enum_AX_Horizontfreiheit_Netzpunkt"';
INSERT INTO enum_ax_horizontfreiheit_netzpunkt (wert,beschreibung) VALUES 
('1000', 'Uneingeschränkt'),
('2000', 'Eingeschränkt'),
('3000', 'Nicht geeignet');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_marke'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_marke AS ENUM 
	('1000', '1100', '1110', '1111', '1112', '1120', '1130', '1131', '1132', '1140', '1160', '1190', '1200', '1201', '1202', '1203', '1210', '1211', '1212', '1220', '1221', '1222', '1230', '1240', '1250', '1260', '1290', '1300', '1310', '1311', '1320', '1400', '1410', '1500', '1600', '1610', '1620', '1630', '1631', '1632', '1635', '1640', '1650', '1655', '1660', '1670', '1700', '1710', '1711', '1712', '1713', '1714', '1720', '1800', '1820', '2100', '2101', '2102', '2110', '2111', '2120', '2121', '2130', '2131', '2132', '2133', '2134', '2135', '2140', '2150', '2160', '2161', '2162', '2163', '2164', '2165', '2166', '2170', '2180', '2181', '2190', '2191', '2192', '2200', '2201', '2210', '2220', '2613', '2230', '2240', '2250', '2260', '2261', '2262', '2263', '2264', '2265', '2266', '2300', '2310', '2320', '2330', '2340', '2350', '2360', '2370', '2400', '2410', '2420', '2430', '2440', '2450', '2460', '2470', '2500', '2510', '2540', '2550', '2551', '2552', '2553', '2560', '2600', '2601', '2602', '2603', '2604', '2605', '2606', '2607', '2608', '2609', '2610', '2611', '2612', '2614', '2615', '2616', '2620', '2630', '2640', '2700', '2710', '2750', '2760', '2770', '2800', '2810', '2820', '2830', '2840', '2850', '2860', '2870', '2880', '2890', '2900', '2901', '2902', '2903', '2904', '2910', '2920', '2930', '2940', '2950', '2951', '2960', '2970', '2980', '3000', '3010', '3020', '3030', '3040', '3050', '3060', '3070', '3100', '3110', '3120', '3130', '3140', '3150', '3160', '3170', '3180', '3190', '3200', '3210', '3220', '3230', '3240', '3250', '3260', '3270', '3280', '3290', '3300', '3301', '3310', '3311', '3320', '3330', '3331', '3340', '3350', '3400', '3410', '3420', '3810', '3820', '3830', '3840', '3845', '3850', '3860', '3870', '3880', '4100', '4110', '4120', '4130', '4140', '4150', '4160', '5100', '5150', '5200', '5250', '5300', '5350', '5400', '5450', '5500', '5550', '5900', '9000', '9500', '9600', '9998', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_marke (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_marke_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_marke IS 'Alias: "enum_AX_Marke"';
INSERT INTO enum_ax_marke (wert,beschreibung) VALUES 
('1000', 'Marke, allgemein'),
('1100', 'Stein'),
('1110', 'Stein, Grenzstein'),
('1111', 'Lochstein'),
('1112', 'Vermessungspunktstein'),
('1120', 'Unbehauener Feldstein'),
('1130', 'Gemeinde- und Waldgrenzstein'),
('1131', 'Gemeindegrenzstein'),
('1132', 'Waldgrenzstein, Forstgrenzstein'),
('1140', 'Kunststoffmarke'),
('1160', 'Landesgrenzstein'),
('1190', 'Stein mit Besonderheiten in Form oder Material'),
('1200', 'Rohr'),
('1201', 'Rohr mit Schutzkappe'),
('1202', 'Rohr mit Kopf'),
('1203', 'Rohr mit Bolzen, oberirdisch'),
('1210', 'Eisenrohr'),
('1211', 'Eisenrohr (mit Schutzkappe)'),
('1212', 'Eisenrohr (ohne Schutzkappe)'),
('1220', 'Kunststoffrohr'),
('1221', 'Kunststoffrohr (mit Schutzkappe)'),
('1222', 'Kunststoffrohr (ohne Schutzkappe)'),
('1230', 'Drainrohr'),
('1240', 'Rohr mit Schutzkasten'),
('1250', 'Zementrohr'),
('1260', 'Glasrohr'),
('1290', 'Tonrohr'),
('1300', 'Bolzen/Nagel'),
('1310', 'Bolzen'),
('1311', 'Adapterbolzen'),
('1320', 'Nagel'),
('1400', 'Meißelzeichen (z. B. Kreuz, Kerbe, Anker)'),
('1410', 'Bohrloch'),
('1500', 'Pfahl'),
('1600', 'Sonstige Marke'),
('1610', 'Marke in Schutzbehälter'),
('1620', 'Flasche'),
('1630', 'Platte'),
('1631', 'Klinkerplatte'),
('1632', 'Granitplatte'),
('1635', 'Platte mit Loch'),
('1640', 'Hohlziegel'),
('1650', 'Klebemarke'),
('1655', 'Schlagmarke'),
('1660', 'Kanaldeckel (Kreuz des Gütesiegels auf Rand)'),
('1670', 'Marke besonderer Ausführung'),
('1700', 'Punkt dauerhaft und gut erkennbar festgelegt'),
('1710', 'Punkt der baulichen Anlage'),
('1711', 'Sockel (roh)'),
('1712', 'Sockel (verputzt)'),
('1713', 'Mauerecke (roh)'),
('1714', 'Mauerecke (verputzt)'),
('1720', 'Grenzsäule'),
('1800', 'Pfeiler'),
('1820', 'Kegel'),
('2100', 'Festlegung 1. Ordnung, Kopf 30x30 cm, Bezugspunkt Platte'),
('2101', 'Festlegung 1. Ordnung, Bezugspunkt Kopf 30x30 cm'),
('2102', 'Festlegung STN 1. Ordnung, Pfeiler-kopf 30x30 cm, Bezugspunkt Platte 60x60 cm, Steinwürfel, Tonkegel'),
('2110', 'Festlegung 2. bis 5. Ordnung, Kopf 16x16 oder 12x12 cm, Bezugspunkt Platte 30x30 cm'),
('2111', 'Festlegung 3. bis 5. Ordnung, Bezugspunkt Kopf 16x16 oder 12x12 cm, Platte 30x30 cm'),
('2120', 'Festlegung 2. bis 4. Ordnung, Kopf 20x20 cm, Bezugspunkt Platte'),
('2121', 'Festlegung 2. bis 4. Ordnung, Bezugspunkt Kopf 20x20 cm,'),
('2130', 'Festlegung 2. bis 4. Ordnung, Kopf 25x25 cm, Bezugspunkt Platte'),
('2131', 'Festlegung 2. bis 4. Ordnung, Bezugspunkt Kopf 25x25 cm,'),
('2132', 'Festlegung STN 3. und 5. Ordnung, Pfeilerkopf 16x16 cm, Bezugspunkt Platte 30x30-40x40 cm'),
('2133', 'Festlegung STN 3. und 5. Ordnung, Pfeilerkopf 16x16 cm, Bezugspunkt Bolzen oder Rotgußkappe im Fels'),
('2134', 'Festlegung TP-Feld, Pfeilerkopf 25x25 cm, Bezugspunkt Platte 35x35 cm'),
('2135', 'Festlegung RBP-Feld, Pfeilerkopf 16x16 cm mit Gravur "TP" und "Dreieck", Bezugspunkt Platte 30x30-35x35 cm'),
('2140', 'Plattformbolzen mit Aufschrift TP'),
('2150', 'Turmbolzen mit Aufschrift TP'),
('2160', 'Leuchtschraube oder -bolzen'),
('2161', 'Schraube (vertikal)'),
('2162', 'Messingmarke oder Messingbolzen'),
('2163', 'Keramikbolzen, oberirdisch'),
('2164', 'Bolzen im Fels, unterirdisch'),
('2165', 'Rotgusskappe im Fels, unterirdisch'),
('2166', 'Messingbolzen (gewölbt), Aufschrift TP und Dreieck'),
('2170', 'Turmbolzen, Festlegungsbolzen oder sonstiger Bolzen, keine weiteren Angaben bekannt oder gespeichert'),
('2180', 'Festlegung 2. Ordnung, Kopf 16x16 cm oder 12x12 cm, Bezugspunkt Platte 60x60 cm'),
('2181', 'Festlegung 2. Ordnung, Bezugspunkt Kopf 16x16 cm oder 12x12 cm, Platte 60x60 cm'),
('2190', 'Festlegung 2. bis 3. Ordnung, Kopf 16x16 cm, Bezugspunkt Platte 40x40 cm'),
('2191', 'Festlegung 2. bis 3. Ordnung, Bezugspunkt Kopf 16x16 cm, Platte 40x40 cm'),
('2192', 'Bergpfeiler ca. 60 cm lang, ohne Platte, Kopf 12x12 cm'),
('2200', 'Pfeiler mit Aufschrift AP'),
('2201', 'Pfeiler mit Aufschrift AP mit Platte, Bezugspunkt Kopf'),
('2210', 'Plattformbolzen mit der Aufschrift AP'),
('2220', 'Turmbolzen mit der Aufschrift AP'),
('2613', 'Stein über Platte (Bezugspunkt)'),
('2230', 'Festlegung der Wasserstraßenverwaltung, Stein mit Rohr und Stehbolzen, Typ 1'),
('2240', 'Festlegung der Wasserstraßenverwaltung, Stein mit Rohr und Stehbolzen, Typ 2'),
('2250', 'Festlegung der Wasserstraßenverwaltung, Stein mit Rohr und Stehbolzen, Typ 3'),
('2260', 'Festlegung Sachsen-Anhalt SANREF (unterirdischer Granitpfeiler mit Kopfbolzen)'),
('2261', '3D-Bolzen einzementiert in Kopffläche einer Festlegung STN 1. Ordnung'),
('2262', '3D-Bolzen in Kopffläche einer Festle-gung TP-Feld'),
('2263', '3D-Bolzen in Kopffläche einer AF Sachsen 3. Ordnung'),
('2264', '3D-Bolzen in Kopffläche einer AF Sachsen 5. Ordnung'),
('2265', '3D-Bolzen in Granitplatte unter Schutzkasten oder Kunststoff- Schutz-rohr'),
('2266', 'Sondervermarkung, einbetonierter Granitpfeiler 40x40x90 cm mit Zentrumsbolzen in Kopffläche'),
('2300', 'Alte Festlegung der Kgl. Generalkommission und von Kurhessen, Rillenstein'),
('2310', 'Alte Festlegung von Nassau, exz., ehemals 2.O.'),
('2320', 'Alte Festlegung von Nassau, exz., ehemals 3.O.'),
('2330', 'Alte Festlegung von Hessen-Darmstadt, 3.O.'),
('2340', 'Alte Festlegung von Hessen-Darmstadt, 4.O.'),
('2350', 'Alte Festlegung von Hessen-Darmstadt, 3.O. exz.'),
('2360', 'Alte Festlegung von Hessen-Darmstadt, 4.O.exz.'),
('2370', 'Alte Festlegung von Westfalen, 2. O. exz.'),
('2400', 'Alte Festlegung von Württemberg, exz.'),
('2410', 'Alte Festlegung von Württemberg'),
('2420', 'Alte Festlegung von Mecklenburg, ehemals 1. bis 2. Ordnung'),
('2430', 'Alte Festlegung von Mecklenburg, ehemals 2. bis 3. Ordnung'),
('2440', 'Alte Festlegung von Mecklenburg, ehemals 4. Ordnung'),
('2450', 'Alte Festlegung Sachsen, 1. und 2. Ordnung (Nagelsche Säule)'),
('2460', 'Alte Festlegung Sachsen, 3. Ordnung, Pfeilerkopf 35x35 cm mit zentrischer Messingmarke'),
('2470', 'Alte Festlegung Sachsen, 5. Ordnung, Pfeilerkopf 25x25 cm mit zentrischer Messingmarke'),
('2500', 'Alte Festlegung von Baden, exz., Typ 1'),
('2510', 'Alte Festlegung von Baden, exz., Typ 2'),
('2540', 'Alte Festlegung von Baden'),
('2550', 'Rohr mit Schutzkasten, Grundständer'),
('2551', 'Grundständer mit Messingmarke unter Schutzkasten'),
('2552', 'Marke (allgemein) unter Schutzkasten'),
('2553', 'Platte unter Schutzkasten'),
('2560', 'Rohr mit Verschlusskappe und aufgesetztem Lochstein'),
('2600', 'Alte Festlegung in Bayern, exz.'),
('2601', 'gebohrter Granitstein (Bezugspunkt) über Tonrohr'),
('2602', 'gebohrter Granitstein über Tonrohr (Bezugspunkt)'),
('2603', 'gebohrter Granitstein (Bezugspunkt) über Platte'),
('2604', 'gebohrter Granitstein über Platte (Bezugspunkt)'),
('2605', 'gebohrter Granitstein (Bezugspunkt) über Eisenrohr'),
('2606', 'gebohrter Granitstein über Eisenrohr (Bezugspunkt)'),
('2607', 'Betonstein (Bezugspunkt) über Platte'),
('2608', 'Betonstein über Platte (Bezugspunkt)'),
('2609', 'Betonstein mit durchgehendem Bohrloch (Einschaltpunkt-Stein in Bayern)'),
('2610', 'Alte Festlegung in Bayern'),
('2611', 'KT-Stein der österreichischen Katastraltriangulation'),
('2612', 'Stein (Bezugspunkt) über Platte'),
('2614', 'Stein (Bezugspunkt) über Tonrohr'),
('2615', 'Stein über Tonrohr (Bezugspunkt)'),
('2616', 'Stein mit Eisenrohr'),
('2620', 'Alte Festlegung in Sachsen-Coburg, 3.O.'),
('2630', 'Alte Festlegung in Sachsen-Coburg, 4.O.'),
('2640', 'Alte Festlegung in Bayern und der Pfalz, HDNP-Stein'),
('2700', 'Festlegung MP-Pfeiler'),
('2710', 'Festlegung Orientierungspunkt'),
('2750', 'Steinpfeiler'),
('2760', 'Betonpfeiler'),
('2770', 'Kreuz (gemeisselt)'),
('2800', 'Knopf'),
('2810', 'Mitte'),
('2820', 'Spitze'),
('2830', 'Kreuz (Mitte)'),
('2840', 'Helmstange'),
('2850', 'Fahnenstange'),
('2860', 'Wetterstange'),
('2870', 'Blitzableiter'),
('2880', 'Antenne'),
('2890', 'Rohrstange'),
('2900', 'Platte, unterirdisch'),
('2901', 'Platte einbetoniert mit zentrischem Messingbolzen'),
('2902', 'Platte einbetoniert mit zentrischem Bohrloch'),
('2903', 'Platte einbetoniert mit zentrischer Keramikmarke'),
('2904', 'Platte einbetoniert mit zentrischer Messingmarke'),
('2910', 'Steinwürfel, unterirdisch'),
('2920', 'Steinplatte, unterirdisch'),
('2930', 'Platte, unterirdisch, 60x60 cm'),
('2940', 'Platte, unterirdisch, 30x30 cm'),
('2950', 'Platte, unterirdisch, mit Stehniet'),
('2951', 'Platte unterirdisch mit Kopfbolzen'),
('2960', 'Platte, unterirdisch, mit Schutzrohr'),
('2970', 'Pfeiler 30x30x90 cm, mit Stehniete'),
('2980', 'Platte, mit Bolzen, unterirdisch, im Schacht'),
('3000', 'Unterirdische Festlegung (des RfL)'),
('3010', 'Unterirdische Festlegung Sonderform'),
('3020', 'Unterirdischer Rammpfahl'),
('3030', 'Unterirdischer Pfeilerbolzen'),
('3040', 'Unterirdischer Bolzen'),
('3050', 'Hamburger Flachpunkt'),
('3060', 'Unterirdische Säule'),
('3070', 'Unterirdischer Rammstab'),
('3100', 'Rohrfestpunkt'),
('3110', 'Rohrfestpunkt, Hamburger Bauart'),
('3120', 'Rohrfestpunkt, Oldenburger Bauart'),
('3130', 'Rohrfestpunkt, Eider Bauart'),
('3140', 'Rohrfestpunkt Nordrhein-Westfalen'),
('3150', 'Rohrfestpunkt Nebenpunkt, flach gegründet'),
('3160', 'Rohrfestpunkt, Celler Bauart'),
('3170', 'Unterirdische Festlegung im Boden'),
('3180', 'Unterirdische Festlegung im Schacht'),
('3190', 'kleine unterirdische Festlegung'),
('3200', 'Mauerbolzen'),
('3210', 'Mauerbolzen, horizontal eingebracht (mit Inschrift)'),
('3220', 'Mauerbolzen, vertikal eingebracht (mit Inschrift)'),
('3230', 'Höhenmarke (des RfL)'),
('3240', 'Kugelbolzen'),
('3250', 'Tonnenbolzen'),
('3260', 'Landeshöhenbolzen'),
('3270', 'Stehbolzen bzw. Bolzen vertikal'),
('3280', 'Stehniete'),
('3290', 'sonstiger horizontaler Bolzen'),
('3300', 'Pfeilerbolzen'),
('3301', 'Pfeilerbolzen, Bezugspunkt Pfeileroberfläche'),
('3310', 'Pfeilerbolzen, Naturstein, Bolzen horizontal'),
('3311', 'Pfeilerbolzen, Naturstein, Bolzen horizontal, Bezugspunkt Pfeileroberfläche'),
('3320', 'Pfeilerbolzen, Naturstein, Bolzen vertikal'),
('3330', 'Pfeilerbolzen, Beton, Bolzen, horizontal'),
('3331', 'Pfeilerbolzen, Beton, Bolzen horizontal, Bezugspunkt Pfeileroberfläche'),
('3340', 'Pfeilerbolzen, Beton, Bolzen vertikal'),
('3350', 'Pfeilerniete, Naturstein, Niete vertikal'),
('3400', 'Rammpfahl'),
('3410', 'Rammpfahl, Bolzen horizontal'),
('3420', 'Rammpfahl, Bolzen vertikal'),
('3810', 'Schraubpfahl'),
('3820', 'Hektometerstein'),
('3830', 'Markstein'),
('3840', 'Schraubbolzen'),
('3845', 'Schraubeisen'),
('3850', 'Lochmarke/-bolzen (ohne Höhentafel)'),
('3860', 'Lochmarke/-bolzen mit Höhentafel'),
('3870', 'Festpunktstein'),
('3880', 'Eichpfahl'),
('4100', 'Gravimeterplatte 80 x 80 oder 60 x 60 cm'),
('4110', 'Gravimeternagel'),
('4120', 'Gravimeterpfeiler 20 x 20 x 100 cm'),
('4130', 'Gravimeterpfeiler 16 x 16 x 60 cm'),
('4140', 'Messingscheibe mit zentrischer Wölbung (Durchm. 8 cm)'),
('4150', 'Stehniete, Messing (Durchmesser 3 cm, Aufschrift SFP)'),
('4160', 'Messplakette, Aufschrift'),
('5100', 'Gewindebolzen (höchste Stelle, Mitte) auf Metallplatte (Betonpfeiler mit Fundament im festen Erdboden)'),
('5150', 'Oberfläche der Metallplatte (höchste Stelle, Mitte) (Betonpfeiler mit Fundament im festen Erdboden)'),
('5200', 'Gewindebolzen (höchste Stelle, Mitte) auf Metallplatte (Gemauerter Pfeiler auf einem Bauwerk)'),
('5250', 'Oberfläche der Metallplatte (höchste Stelle, Mitte) (Gemauerter Pfeiler auf einem Bauwerk)'),
('5300', 'Gewindebolzen (höchste Stelle, Mitte) auf Metallplatte (Stahlpfeiler auf einem Bauwerk)'),
('5350', 'Oberfläche der Metallplatte (höchste Stelle, Mitte) (Stahlpfeiler auf einem Bauwerk)'),
('5400', 'Gewindebolzen (höchste Stelle, Mitte) auf Metallplatte (Seitlich befestigtes Stahlrohr am Bauwerk)'),
('5450', 'Oberfläche der Metallplatte (höchste Stelle, Mitte) (Seitlich befestigtes Stahlrohr am Bauwerk)'),
('5500', 'Gewindebolzen (höchste Stelle, Mitte) auf Metallplatte (Antennenträger)'),
('5550', 'Oberfläche der Metallplatte (höchste Stelle, Mitte) (Antennenträger)'),
('5900', 'GNSS-Antennenhalterung, Oberfläche Platte (Loch) (SL)'),
('9000', 'Marke unter Bemerkung näher definiert'),
('9500', 'Ohne Marke'),
('9600', 'Abmarkung zeitweilig ausgesetzt'),
('9998', 'Nach Quellenlage nicht zu spezifizieren'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_genauigkeitsstufe_punktort'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_genauigkeitsstufe_punktort AS ENUM 
	('0900', '1000', '1100', '1200', '1300', '2000', '2050', '2100', '2200', '2300', '3000', '3100', '3200', '3300', '5000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_genauigkeitsstufe_punktort (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_genauigkeitsstufe_punktort_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_genauigkeitsstufe_punktort IS 'Alias: "enum_AX_Genauigkeitsstufe_Punktort"';
INSERT INTO enum_ax_genauigkeitsstufe_punktort (wert,beschreibung) VALUES 
('0900', 'Standardabweichung S kleiner 1 mm'),
('1000', 'Standardabweichung S kleiner gleich 2 mm'),
('1100', 'Standardabweichung S kleiner gleich 5 mm'),
('1200', 'Standardabweichung S kleiner gleich 1 cm'),
('1300', 'Standardabweichung S kleiner gleich 1,5 cm'),
('2000', 'Standardabweichung S kleiner gleich 2 cm'),
('2050', 'Standardabweichung S kleiner gleich 2,5 cm'),
('2100', 'Standardabweichung S kleiner gleich 3 cm'),
('2200', 'Standardabweichung S kleiner gleich 6 cm'),
('2300', 'Standardabweichung S kleiner gleich 10 cm'),
('3000', 'Standardabweichung S kleiner gleich 30 cm'),
('3100', 'Standardabweichung S kleiner gleich 60 cm'),
('3200', 'Standardabweichung S kleiner gleich 100 cm'),
('3300', 'Standardabweichung S kleiner gleich 500 cm'),
('5000', 'Standardabweichung S groesser 500 cm');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_messmethode_schwere'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_messmethode_schwere AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_messmethode_schwere (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_messmethode_schwere_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_messmethode_schwere IS 'Alias: "enum_AX_Messmethode_Schwere"';
INSERT INTO enum_ax_messmethode_schwere (wert,beschreibung) VALUES 
('1000', 'Aus Absolutgravimetermessung ermittelt'),
('2000', 'Aus Relativgravimetermessung ermittelt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_koordinatenstatus_punktort'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_koordinatenstatus_punktort AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '5100');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_koordinatenstatus_punktort (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_koordinatenstatus_punktort_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_koordinatenstatus_punktort IS 'Alias: "enum_AX_Koordinatenstatus_Punktort"';
INSERT INTO enum_ax_koordinatenstatus_punktort (wert,beschreibung) VALUES 
('1000', 'Amtliche Koordinaten bzw. amtliche Höhe'),
('2000', 'Weitere gültige Koordinaten bzw. weitere gültige Höhe'),
('3000', 'Vorläufige Koordinaten bzw. vorläufige Höhe'),
('4000', 'Zu keiner Zeit gültig gewesene Koordinaten bzw. Höhe'),
('5000', 'Historische (nicht mehr gültige)  Koordinaten bzw. Höhe'),
('5100', 'Koordinaten bzw. Höhe, die sich als fehlerhaft herausgestellt haben');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_datenerhebung_schwere'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_datenerhebung_schwere AS ENUM 
	('1000', '2000', '3000', '3100', '3200', '4000', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_datenerhebung_schwere (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_datenerhebung_schwere_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_datenerhebung_schwere IS 'Alias: "enum_AX_Datenerhebung_Schwere"';
INSERT INTO enum_ax_datenerhebung_schwere (wert,beschreibung) VALUES 
('1000', 'Schwerewert direkt gemessen oder mittels Freiluftreduktion über geringe Entfernung abgeleitet (Höhenunterschied bis 1 m, Horizontalabstand bis 5 m)'),
('2000', 'Schwerewert mittels Freiluftreduktion über größere Entfernung abgeleitet'),
('3000', 'Schwerewert mittels Interpolation unter Verwendung einfacher Bougueranomalien ermittelt'),
('3100', 'Schwerewert im System DHSN 96 durch Abschlag ( -19 10-8 m s-2 ) aus Schwerewert im System DHSN 82 ermittelt (alte Bundesländer)'),
('3200', 'Schwerewert DHSN 96 durch Transformation aus System 71 ermittelt (neue Bundesländer)'),
('4000', 'Schwerewert durch andere Methode ermittelt'),
('9998', 'Methode der Datenerhebung Schwere unbekannt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_vertrauenswuerdigkeit_schwere'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_vertrauenswuerdigkeit_schwere AS ENUM 
	('1100', '1300', '1400');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_vertrauenswuerdigkeit_schwere (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_vertrauenswuerdigkeit_schwere_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_vertrauenswuerdigkeit_schwere IS 'Alias: "enum_AX_Vertrauenswuerdigkeit_Schwere"';
INSERT INTO enum_ax_vertrauenswuerdigkeit_schwere (wert,beschreibung) VALUES 
('1100', 'Vertrauenswürdigkeitsstufe Ausgleichung'),
('1300', 'Vertrauenswürdigkeitsstufe ohne Ausgleichung kontrolliert'),
('1400', 'Vertrauenswürdigkeitsstufe unkontrolliert');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_schwereanomalie_schwere_art'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_schwereanomalie_schwere_art AS ENUM 
	('1000', '2000', '3000', '3100', '4000', '5000', '6000', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_schwereanomalie_schwere_art (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_schwereanomalie_schwere_art_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_schwereanomalie_schwere_art IS 'Alias: "enum_AX_Schwereanomalie_Schwere_Art"';
INSERT INTO enum_ax_schwereanomalie_schwere_art (wert,beschreibung) VALUES 
('1000', 'Geländereduktion (Reliefkorrektion)'),
('2000', 'Freiluftanomalie im System Potsdam 1909 - Normalschwere nach Helmert 1901 - Breite auf dem Krassowski-Ellipsoid'),
('3000', 'Freiluftanomalie im System Potsdam 1909 mit Geländereduktion (Fayeanomalie) - Normalschwere nach Helmert 1901 - Breite auf dem Krassowski-Ellipsoid'),
('3100', 'Freiluftanomalie nach Molodenski: Schwere (im System DHSN 96) im Oberflächenpunkt minus Normalschwere (Formel des GRS 80) im Telluroidpunkt'),
('4000', 'Bougueranomalie im System Potsdam 1909 mit Geländereduktion - Normalschwere nach Helmert 1901 - Breite auf dem Krassowski-Ellipsoid'),
('5000', 'Bougueranomalie im System DHSN 82 mit Freiluft- und Plattenreduktion - Normalschwere im GRS 80'),
('6000', 'Bougueranomalie im System DHSN 96 mit Freiluft- und Plattenreduktion - Normalschwere im GRS 80'),
('9998', 'Art der Anomalie bzw. Reduktion unbekannt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_vertrauenswuerdigkeit_punktort'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_vertrauenswuerdigkeit_punktort AS ENUM 
	('1100', '1200', '1300', '1400');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_vertrauenswuerdigkeit_punktort (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_vertrauenswuerdigkeit_punktort_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_vertrauenswuerdigkeit_punktort IS 'Alias: "enum_AX_Vertrauenswuerdigkeit_Punktort"';
INSERT INTO enum_ax_vertrauenswuerdigkeit_punktort (wert,beschreibung) VALUES 
('1100', 'Vertrauenswürdigkeitsstufe Ausgleichung'),
('1200', 'Vertrauenswürdigkeitsstufe Berechnung'),
('1300', 'Vertrauenswürdigkeitsstufe Bestimmungsverfahren'),
('1400', 'Vertrauenswürdigkeitsstufe ohne Kontrollen');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_schwerestatus_schwere'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_schwerestatus_schwere AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '5100');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_schwerestatus_schwere (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_schwerestatus_schwere_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_schwerestatus_schwere IS 'Alias: "enum_AX_Schwerestatus_Schwere"';
INSERT INTO enum_ax_schwerestatus_schwere (wert,beschreibung) VALUES 
('1000', 'amtlicher Schwerewert (gültiger Wert im amtlichen Schweresystem)'),
('2000', 'weiterer gültiger Schwerewert (nicht im amtlichen Schweresystem)'),
('3000', 'vorläufiger Schwerewert'),
('4000', 'zu keiner Zeit gültig gewesener Schwerewert'),
('5000', 'historischer (nicht mehr gültiger) Schwerewert'),
('5100', 'Schwerewert, der sich als fehlerhaft herausgestellt hat');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_li_processstep_punktort_description'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_li_processstep_punktort_description AS ENUM 
	('Erhebung', 'Berechnung');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_genauigkeitsstufe_schwere'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_genauigkeitsstufe_schwere AS ENUM 
	('1000', '2000', '3000', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_genauigkeitsstufe_schwere (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_genauigkeitsstufe_schwere_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_genauigkeitsstufe_schwere IS 'Alias: "enum_AX_Genauigkeitsstufe_Schwere"';
INSERT INTO enum_ax_genauigkeitsstufe_schwere (wert,beschreibung) VALUES 
('1000', 'Standardabweichung S kleiner 20 10-8m s-2'),
('2000', 'Standardabweichung S kleiner gleich 100 10-8m s-2'),
('3000', 'Standardabweichung S groesser 100 10-8m s-2'),
('4000', 'Als Schwereanschlusspunkt ungeeignet');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_datenerhebung_punktort'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_datenerhebung_punktort AS ENUM 
	('0100', '0110', '0120', '0130', '0200', '0210', '0220', '1000', '1010', '1020', '1030', '1040', '1060', '1070', '1080', '1100', '1200', '1300', '1400', '1500', '1600', '1610', '1620', '1630', '1640', '1650', '1700', '1710', '1720', '1800', '1900', '2000', '3000', '3100', '3200', '3300', '4000', '4100', '4200', '4210', '4220', '4230', '4240', '4250', '4260', '4270', '4280', '4290', '4300', '4310', '4320', '4330', '4340', '4350', '4360', '4370', '4380', '4390', '5000', '5010', '5020', '5030', '5100', '5110', '5120', '5130', '5140', '5150', '5160', '5170', '5200', '5500', '6000', '6100', '6200', '7000', '8000', '8100', '8200', '8300', '8310', '8320', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_datenerhebung_punktort (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_datenerhebung_punktort_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_datenerhebung_punktort IS 'Alias: "enum_AX_Datenerhebung_Punktort"';
INSERT INTO enum_ax_datenerhebung_punktort (wert,beschreibung) VALUES 
('0100', 'Aus GNSS-Messung'),
('0110', 'Aus langzeitstatischer GNSS-Messung'),
('0120', 'Aus statischer GNSS-Messung'),
('0130', 'Aus Echtzeit-GNSS-Messung'),
('0200', 'Aus trigonometrischer Messung im TP-Netz'),
('0210', 'Aus lokaler trigonometrischer Messung (innerhalb einer Punktgruppe)'),
('0220', 'Aus netzweiser terrestrischer Messung'),
('1000', 'Aus Katastervermessung ermittelt'),
('1010', 'Aus Katastervermessung mit höchster Lagegenauigkeit (NW)'),
('1020', 'Aus Katastervermessung mit hoher Lagegenauigkeit (NW)'),
('1030', 'Aus Katastervermessung mit mittlerer Lagegenauigkeit (NW)'),
('1040', 'Aus Katastervermessung mit unzureichender Lagegenauigkeit (NW)'),
('1060', 'Aus Vermessung mit höchster Positionsgenauigkeit'),
('1070', 'Aus Vermessung mit mittlerer Positionsgenauigkeit'),
('1080', 'Aus Vermessung mit unterer Positionsgenauigkeit'),
('1100', 'Aufgrund Anforderungen mit Netzanschluss ermittelt'),
('1200', 'Aufgrund Anforderungen mit Bezug zur Flurstücksgrenze ermittelt'),
('1300', 'Aufgrund Anforderungen des LiegVermErlasses ermittelt (NI)'),
('1400', 'Aufgrund Anforderungen des Fortführungerlasses II ermittelt (NI)'),
('1500', 'Aufgrund Anforderungen älterer Vorschriften ermittelt'),
('1600', 'Auf einheitlichem und eindeutigem Raumbezug basierend (E-Koord.) (BW)'),
('1610', 'Auf bislang einheitlichem Raumbezug basierend ermittelt (B-Koord.) (BW)'),
('1620', 'Auf früher gültigem Raumbezug basierend ermittelt(T-Koord.) (BW)'),
('1630', 'Aufgrund Anforderungen des AP-Erlasses (M-V)'),
('1640', 'Aufgrund Anforderungen der LiVermA M-V, basierend auf AP-Feld'),
('1650', 'Aufgrund Anforderungen der LiVermA M-V'),
('1700', 'Aufgrund Anforderungen des LiegVermErlasses LSA (LSA)'),
('1710', 'Aufgrund Anforderungen der Anleitung für die Ausführung von Neuvermessungen, 1953, DDR (LSA)'),
('1720', 'Aufgrund Anforderungen der Liegenschaftsvermessungsordnung 112/82, DDR (LSA)'),
('1800', 'Aus Koordinatentransformation ermittelt'),
('1900', 'Aus sonstiger Vermessung ermittelt'),
('2000', 'Aus Luftbildmessung oder Fernerkundungsdaten ermittelt'),
('3000', 'Aus Netzvermessung ermittelt'),
('3100', 'Aufgrund Anforderungen des Festpunktfelderlasses ermittelt (NI, ST)'),
('3200', 'Aufgrund Anforderungen des Polygonpunktfelderlasses ermittelt (NI)'),
('3300', 'Aus Polygonierungsmessung'),
('4000', 'Aus Katasterunterlagen und Karten für graphische Zwecke ermittelt'),
('4100', 'Aus Katasterzahlen für graphische Zwecke ermittelt'),
('4200', 'Aus Katasterkarten digitalisiert'),
('4210', 'Aus Katasterkarten digitalisiert, Kartenmaßstab M größer gleich 1 zu 1000'),
('4220', 'Aus Katasterkarten digitalisiert, Kartenmaßstab 1 zu 1000 größer M größer gleich 1 zu 2000'),
('4230', 'Aus Katasterkarten digitalisiert, Kartenmaßstab 1 zu 2000 größer M größer gleich 1 zu 3000'),
('4240', 'Aus Katasterkarten digitalisiert, Kartenmaßstab 1 zu 3000 größer M größer gleich 1 zu 5000'),
('4250', 'Aus Katasterkarten digitalisiert, Kartenmaßstab 1 zu 5000 größer M'),
('4260', 'Mit  sonstigen geometrischen Bedingungen und/oder Homogenisierung (M größer gleich 1 zu 1000)'),
('4270', 'Mit Berechnung  oder Abstandsbedingung (M größer gleich 1 zu 1000)'),
('4280', 'Mit sonstigen geometrischen  Bedingungen und/oder Homogenisierung (M kleiner 1 zu 1000)'),
('4290', 'Mit  Berechnung oder Abstandsbedingungen (M kleiner 1 zu 1000)'),
('4300', 'Aus sonstigen Unterlagen digitalisiert'),
('4310', 'Aus sonstigen Unterlagen digitalisiert, Kartenmaßstab M größer gleich 1 zu 1000'),
('4320', 'Aus  sonstigen Unterlagen digitalisiert, Kartenmaßstab 1 zu 1000 größer M größer gleich 1 zu 2000'),
('4330', 'Aus sonstigen Unterlagen digitalisiert, Kartenmaßstab 1 zu 2000 größer M größer gleich 1 zu 3000'),
('4340', 'Aus sonstigen Unterlagen digitalisiert, Kartenmaßstab 1 zu 3000 größer M größer gleich 1 zu 5000'),
('4350', 'Aus sonstigen Unterlagen digitalisiert, Kartenmaßstab 1 zu 5000 größer M'),
('4360', 'Aus sonstigen Unterlagen digitalisiert, mit sonstigen geometrischen Bedingungen und/oder Homogenisierung (M größer gleich 1 zu 1000)'),
('4370', 'Aus sonstigen Unterlagen digitalisiert, Mit Berechnung oder Abstandsbedingung (M größer gleich 1 zu 1000)'),
('4380', 'Aus sonstigen Unterlagen digitalisiert, Mit sonstigen geometrischen Bedingungen und/oder Homogenisierung (M kleiner 1 zu 1000)'),
('4390', 'Aus sonstigen Unterlagen digitalisiert, Mit Berechnung oder Abstandsbedingungen (M kleiner 1 zu 1000)'),
('5000', 'Aus Nivellement'),
('5010', 'Aus geometrischem Nivellement'),
('5020', 'Aus trigonometrischer Höhenübertragung'),
('5030', 'Aus trigonometrischer Präzisionshöhenübertragung'),
('5100', 'Aus Präzisionsnivellement'),
('5110', 'Aus Höhenangaben nivellitisch bestimmt, Messgenauigkeit 1.Ordnung'),
('5120', 'Aus  Höhenangaben nivellitisch bestimmt, Messgenauigkeit 2.Ordnung'),
('5130', 'Aus Höhenangaben  nivellitisch bestimmt, Messgenauigkeit 3.Ordnung'),
('5140', 'Aus Höhenangaben nivellitisch bestimmt, Messgenauigkeit 4.Ordnung'),
('5150', 'Aus geometrischem Präzisionsnivellement, Messgenauigkeit  1. Ordnung'),
('5160', 'Aus geometrischem Präzisionsnivellement, Messgenauigkeit  2. Ordnung'),
('5170', 'Aus geometrischem Präzisionsnivellement, Messgenauigkeit  3. Ordnung'),
('5200', 'Aus Präzisionsnivellement (nur eine Messungsrichtung)'),
('5500', 'Höhe aus Laserscannermessung'),
('6000', 'Aus satellitengeodätischer Messung  und Addition einer Undulation'),
('6100', 'Mittels Quasigeoidundulation abgeleitet von gemessener ellipsoidischer Höhe'),
('6200', 'Mittels Quasigeoidundulation abgeleitet von gemessener Normalhöhe'),
('7000', 'Aus trigonometrischer Messung'),
('8000', 'Aus analoger Unterlage abgeleitet'),
('8100', 'Aus näherungsweiser Berechnung oder Transformation'),
('8200', 'Aus Stereo-Auswertung von Luftbildern'),
('8300', 'Graphisch bestimmt'),
('8310', 'Aus der Topographischen Karte 1 zu 10 000 abgegriffen'),
('8320', 'Aus der Topographischen Karte 1 zu 25 000 abgegriffen'),
('9998', 'Nach Quellenlage nicht zu spezifizieren');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_schweresystem_schwere'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_schweresystem_schwere AS ENUM 
	('1000', '1100', '1200', '1300', '4000', '4010', '4020', '6000', '6100');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_schweresystem_schwere (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_schweresystem_schwere_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_schweresystem_schwere IS 'Alias: "enum_AX_Schweresystem_Schwere"';
INSERT INTO enum_ax_schweresystem_schwere (wert,beschreibung) VALUES 
('1000', 'Schwerewert im System des DHSN 82 (System der Landesvermessung)'),
('1100', 'Schwerewert im System des DSGN 62 (auch als DSN 62 bezeichnet)'),
('1200', 'Schwerewert im System des SGN der DDR (auch als System 71 bezeichnet)'),
('1300', 'Schwerewert im System des DHSN 96 (System der Landesvermessung)'),
('4000', 'Schwerewert im System des ISGN 71 (wissenschaftliches System)'),
('4010', 'Schwerewert im System des DSGN 76 (wissenschaftliches System)'),
('4020', 'Schwerewert im System des DSGN 94 (wissenschaftliches System)'),
('6000', 'Potsdamer Schweresystem 1909'),
('6100', 'Schweresystem der Geophysikalischen Reichsaufnahme 1934 - 1943');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_blattart_historischesflurstueck'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_blattart_historischesflurstueck AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_blattart_historischesflurstueck (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_blattart_historischesflurstueck_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_blattart_historischesflurstueck IS 'Alias: "enum_AX_Blattart_HistorischesFlurstueck"';
INSERT INTO enum_ax_blattart_historischesflurstueck (wert,beschreibung) VALUES 
('1000', 'Grundbuchblatt'),
('2000', 'Katasterblatt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_qualitaet_hauskoordinate'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_qualitaet_hauskoordinate AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_qualitaet_hauskoordinate (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_qualitaet_hauskoordinate_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_qualitaet_hauskoordinate IS 'Alias: "enum_AX_Qualitaet_Hauskoordinate"';
INSERT INTO enum_ax_qualitaet_hauskoordinate (wert,beschreibung) VALUES 
('1000', 'gebaeudeumring (A)'),
('2000', 'innerhalbFlurstueck (B)'),
('3000', 'interpoliert (C)');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_punktkennung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_punktkennung AS ENUM 
	('1000', '1100', '1200', '1300', '1400', '1500', '1600', '1700');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_punktkennung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_punktkennung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_punktkennung IS 'Alias: "enum_AX_Art_Punktkennung"';
INSERT INTO enum_ax_art_punktkennung (wert,beschreibung) VALUES 
('1000', 'Punktkennung - allgemein'),
('1100', 'Punktkennung - Grenzpunkt'),
('1200', 'Punktkennung - Besonderer Gebäudepunkt'),
('1300', 'Punktkennung - Besonderer topographischer Punkt'),
('1400', 'Punktkennung - Aufnahmepunkt'),
('1500', 'Punktkennung - Sicherungspunkt'),
('1600', 'Punktkennung - Sonstiger Vermessungspunkt'),
('1700', 'Punktkennung - Besonderer Bauwerkspunkt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_reservierung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_reservierung AS ENUM 
	('1000', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000', '2100', '2200', '2300', '3000', '4000', '5000', '6000', '6100', '6200', '6300', '6400');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_reservierung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_reservierung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_reservierung IS 'Alias: "enum_AX_Art_Reservierung"';
INSERT INTO enum_ax_art_reservierung (wert,beschreibung) VALUES 
('1000', 'Punktkennung'),
('1300', 'Punktkennung - Grenzpunkt'),
('1400', 'Punktkennung - Besonderer Gebäudepunkt'),
('1500', 'Punktkennung - Besonderer topographischer Punkt'),
('1600', 'Punktkennung - Besonderer Bauwerkspunkt'),
('1700', 'Punktkennung - Aufnahmepunkt'),
('1800', 'Punktkennung - Sicherungspunkt'),
('1900', 'Punktkennung - Sonstiger Vermessungspunkt'),
('2000', 'Punktkennung - Lagefestpunkt'),
('2100', 'Punktkennung - Höhenfestpunkt'),
('2200', 'Punktkennung - Schwerefestpunkt'),
('2300', 'Punktkennung - Referenzstationspunkt'),
('3000', 'Flurstückskennzeichen'),
('4000', 'FN-Nummer'),
('5000', 'Abmarkungsprotokollnummer'),
('6000', 'Buchungsblattkennzeichen'),
('6100', 'Katasterblatt'),
('6200', 'Pseudoblatt'),
('6300', 'Erwerberblatt'),
('6400', 'Fiktives Blatt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_adressat_auszug'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_adressat_auszug AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '6000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_adressat_auszug (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_adressat_auszug_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_adressat_auszug IS 'Alias: "enum_AX_Art_Adressat_Auszug"';
INSERT INTO enum_ax_art_adressat_auszug (wert,beschreibung) VALUES 
('1000', 'Privat'),
('2000', 'Notar'),
('3000', 'Grundbuchamt'),
('4000', 'Finanzamt'),
('5000', 'Bauaufsichtsbehörde'),
('6000', 'Weitere Beteiligte');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_lagezurerdoberflaeche_bauteil'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_lagezurerdoberflaeche_bauteil AS ENUM 
	('1200', '1400');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_lagezurerdoberflaeche_bauteil (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_lagezurerdoberflaeche_bauteil_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_lagezurerdoberflaeche_bauteil IS 'Alias: "enum_AX_LageZurErdoberflaeche_Bauteil"';
INSERT INTO enum_ax_lagezurerdoberflaeche_bauteil (wert,beschreibung) VALUES 
('1200', 'Unter der Erdoberfläche'),
('1400', 'Aufgeständert');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_lagezurerdoberflaeche_gebaeude'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_lagezurerdoberflaeche_gebaeude AS ENUM 
	('1200', '1400');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_lagezurerdoberflaeche_gebaeude (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_lagezurerdoberflaeche_gebaeude_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_lagezurerdoberflaeche_gebaeude IS 'Alias: "enum_AX_LageZurErdoberflaeche_Gebaeude"';
INSERT INTO enum_ax_lagezurerdoberflaeche_gebaeude (wert,beschreibung) VALUES 
('1200', 'Unter der Erdoberfläche'),
('1400', 'Aufgeständert');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_gebaeude'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_gebaeude AS ENUM 
	('1000', '2000', '2100', '2200', '2300', '3000', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_gebaeude (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_gebaeude_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_gebaeude IS 'Alias: "enum_AX_Zustand_Gebaeude"';
INSERT INTO enum_ax_zustand_gebaeude (wert,beschreibung) VALUES 
('1000', 'In behelfsmäßigem Zustand'),
('2000', 'In ungenutztem Zustand'),
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('2200', 'Verfallen, zerstört'),
('2300', 'Teilweise zerstört'),
('3000', 'Geplant und beantragt'),
('4000', 'Im Bau');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dachgeschossausbau_gebaeude'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_dachgeschossausbau_gebaeude AS ENUM 
	('1000', '2000', '3000', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_dachgeschossausbau_gebaeude (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_dachgeschossausbau_gebaeude_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_dachgeschossausbau_gebaeude IS 'Alias: "enum_AX_Dachgeschossausbau_Gebaeude"';
INSERT INTO enum_ax_dachgeschossausbau_gebaeude (wert,beschreibung) VALUES 
('1000', 'Nicht ausbaufähig'),
('2000', 'Ausbaufähig'),
('3000', 'Ausgebaut'),
('4000', 'Ausbaufähigkeit unklar');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dachform'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_dachform AS ENUM 
	('3500', '1000', '2100', '2200', '3100', '3200', '3300', '3400', '3600', '3700', '3800', '3900', '4000', '5000', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_dachform (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_dachform_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_dachform IS 'Alias: "enum_AX_Dachform"';
INSERT INTO enum_ax_dachform (wert,beschreibung) VALUES 
('3500', 'Zeltdach'),
('1000', 'Flachdach'),
('2100', 'Pultdach'),
('2200', 'Versetztes Pultdach'),
('3100', 'Satteldach'),
('3200', 'Walmdach'),
('3300', 'Krüppelwalmdach'),
('3400', 'Mansardendach'),
('3600', 'Kegeldach'),
('3700', 'Kuppeldach'),
('3800', 'Sheddach'),
('3900', 'Bogendach'),
('4000', 'Turmdach'),
('5000', 'Mischform'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bauweise_gebaeude'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bauweise_gebaeude AS ENUM 
	('1100', '1200', '1300', '1400', '1500', '2100', '2200', '2300', '2400', '2500', '4000', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bauweise_gebaeude (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bauweise_gebaeude_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bauweise_gebaeude IS 'Alias: "enum_AX_Bauweise_Gebaeude"';
INSERT INTO enum_ax_bauweise_gebaeude (wert,beschreibung) VALUES 
('1100', 'Freistehendes Einzelgebäude'),
('1200', 'Freistehender Gebäudeblock'),
('1300', 'Einzelgarage'),
('1400', 'Doppelgarage'),
('1500', 'Sammelgarage'),
('2100', 'Doppelhaushälfte'),
('2200', 'Reihenhaus'),
('2300', 'Haus in Reihe'),
('2400', 'Gruppenhaus'),
('2500', 'Gebäudeblock in geschlossener Bauweise'),
('4000', 'Offene Halle'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_gebaeudefunktion'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_gebaeudefunktion AS ENUM 
	('1000', '1010', '1020', '1021', '1022', '1023', '1024', '1025', '1100', '1110', '1120', '1121', '1122', '1123', '1130', '1131', '1210', '1220', '1221', '1222', '1223', '1310', '1311', '1312', '1313', '2000', '2010', '2020', '2030', '2040', '2050', '2051', '2052', '2053', '2054', '2055', '2056', '2060', '2070', '2071', '2072', '2073', '2074', '2080', '2081', '2082', '2083', '2090', '2091', '2092', '2093', '2094', '2100', '2110', '2111', '2112', '2113', '2114', '2120', '2121', '2130', '2131', '2140', '2141', '2142', '2143', '2150', '2160', '2170', '2171', '2172', '2180', '2200', '2210', '2211', '2212', '2213', '2220', '2310', '2320', '2400', '2410', '2411', '2412', '2420', '2421', '2422', '2423', '2424', '2430', '2431', '2440', '2441', '2442', '2443', '2444', '2450', '2451', '2460', '2461', '2462', '2463', '2464', '2465', '2500', '2501', '2510', '2511', '2512', '2513', '2520', '2521', '2522', '2523', '2527', '2528', '2529', '2540', '2560', '2570', '2571', '2580', '2590', '2591', '2600', '2610', '2611', '2612', '2620', '2621', '2622', '2623', '2700', '2720', '2721', '2723', '2724', '2726', '2727', '2728', '2729', '2732', '2735', '2740', '2741', '2742', '3000', '3010', '3011', '3012', '3013', '3014', '3015', '3016', '3017', '3018', '3019', '3020', '3021', '3022', '3023', '3024', '3030', '3031', '3032', '3033', '3034', '3035', '3036', '3037', '3038', '3040', '3041', '3042', '3043', '3044', '3045', '3046', '3047', '3048', '3050', '3051', '3052', '3053', '3060', '3061', '3062', '3063', '3064', '3065', '3066', '3070', '3071', '3072', '3073', '3074', '3075', '3080', '3081', '3082', '3090', '3091', '3092', '3094', '3095', '3097', '3098', '3100', '3200', '3210', '3211', '3212', '3220', '3221', '3222', '3230', '3240', '3241', '3242', '3260', '3261', '3262', '3263', '3264', '3270', '3271', '3272', '3273', '3280', '3281', '3290', '9998');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_gebaeudefunktion (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_gebaeudefunktion_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_gebaeudefunktion IS 'Alias: "enum_AX_Gebaeudefunktion"';
INSERT INTO enum_ax_gebaeudefunktion (wert,beschreibung) VALUES 
('1000', 'Wohngebäude'),
('1010', 'Wohnhaus'),
('1020', 'Wohnheim'),
('1021', 'Kinderheim'),
('1022', 'Seniorenheim'),
('1023', 'Schwesternwohnheim'),
('1024', 'Studenten-, Schülerwohnheim'),
('1025', 'Schullandheim'),
('1100', 'Gemischt genutztes Gebäude mit Wohnen'),
('1110', 'Wohngebäude mit Gemeinbedarf'),
('1120', 'Wohngebäude mit Handel und Dienstleistungen'),
('1121', 'Wohn- und Verwaltungsgebäude'),
('1122', 'Wohn- und Bürogebäude'),
('1123', 'Wohn- und Geschäftsgebäude'),
('1130', 'Wohngebäude mit Gewerbe und Industrie'),
('1131', 'Wohn- und Betriebsgebäude'),
('1210', 'Land- und forstwirtschaftliches Wohngebäude'),
('1220', 'Land- und forstwirtschaftliches Wohn- und Betriebsgebäude'),
('1221', 'Bauernhaus'),
('1222', 'Wohn- und Wirtschaftsgebäude'),
('1223', 'Forsthaus'),
('1310', 'Gebäude zur Freizeitgestaltung'),
('1311', 'Ferienhaus'),
('1312', 'Wochenendhaus'),
('1313', 'Gartenhaus'),
('2000', 'Gebäude für Wirtschaft oder Gewerbe'),
('2010', 'Gebäude für Handel und Dienstleistungen'),
('2020', 'Bürogebäude'),
('2030', 'Kreditinstitut'),
('2040', 'Versicherung'),
('2050', 'Geschäftsgebäude'),
('2051', 'Kaufhaus'),
('2052', 'Einkaufszentrum'),
('2053', 'Markthalle'),
('2054', 'Laden'),
('2055', 'Kiosk'),
('2056', 'Apotheke'),
('2060', 'Messehalle'),
('2070', 'Gebäude für Beherbergung'),
('2071', 'Hotel, Motel, Pension'),
('2072', 'Jugendherberge'),
('2073', 'Hütte (mit Übernachtungsmöglichkeit)'),
('2074', 'Campingplatzgebäude'),
('2080', 'Gebäude für Bewirtung'),
('2081', 'Gaststätte, Restaurant'),
('2082', 'Hütte (ohne Übernachtungsmöglichkeit)'),
('2083', 'Kantine'),
('2090', 'Freizeit- und Vergnügungsstätte'),
('2091', 'Festsaal'),
('2092', 'Kino'),
('2093', 'Kegel-, Bowlinghalle'),
('2094', 'Spielkasino'),
('2100', 'Gebäude für Gewerbe und Industrie'),
('2110', 'Produktionsgebäude'),
('2111', 'Fabrik'),
('2112', 'Betriebsgebäude'),
('2113', 'Brauerei'),
('2114', 'Brennerei'),
('2120', 'Werkstatt'),
('2121', 'Sägewerk'),
('2130', 'Tankstelle'),
('2131', 'Waschstraße, Waschanlage, Waschhalle'),
('2140', 'Gebäude für Vorratshaltung'),
('2141', 'Kühlhaus'),
('2142', 'Speichergebäude'),
('2143', 'Lagerhalle, Lagerschuppen, Lagerhaus'),
('2150', 'Speditionsgebäude'),
('2160', 'Gebäude für Forschungszwecke'),
('2170', 'Gebäude für Grundstoffgewinnung'),
('2171', 'Bergwerk'),
('2172', 'Saline'),
('2180', 'Gebäude für betriebliche Sozialeinrichtung'),
('2200', 'Sonstiges Gebäude für Gewerbe und Industrie'),
('2210', 'Mühle'),
('2211', 'Windmühle'),
('2212', 'Wassermühle'),
('2213', 'Schöpfwerk'),
('2220', 'Wetterstation'),
('2310', 'Gebäude für Handel und Dienstleistung mit Wohnen'),
('2320', 'Gebäude für Gewerbe und Industrie mit Wohnen'),
('2400', 'Betriebsgebäude zu Verkehrsanlagen (allgemein)'),
('2410', 'Betriebsgebäude für Straßenverkehr'),
('2411', 'Straßenmeisterei'),
('2412', 'Wartehalle'),
('2420', 'Betriebsgebäude für Schienenverkehr'),
('2421', 'Bahnwärterhaus'),
('2422', 'Lokschuppen, Wagenhalle'),
('2423', 'Stellwerk, Blockstelle'),
('2424', 'Betriebsgebäude des Güterbahnhofs'),
('2430', 'Betriebsgebäude für Flugverkehr'),
('2431', 'Flugzeughalle'),
('2440', 'Betriebsgebäude für Schiffsverkehr'),
('2441', 'Werft (Halle)'),
('2442', 'Dock (Halle)'),
('2443', 'Betriebsgebäude zur Schleuse'),
('2444', 'Bootshaus'),
('2450', 'Betriebsgebäude zur Seilbahn'),
('2451', 'Spannwerk zur Drahtseilbahn'),
('2460', 'Gebäude zum Parken'),
('2461', 'Parkhaus'),
('2462', 'Parkdeck'),
('2463', 'Garage'),
('2464', 'Fahrzeughalle'),
('2465', 'Tiefgarage'),
('2500', 'Gebäude zur Versorgung'),
('2501', 'Gebäude zur Energieversorgung'),
('2510', 'Gebäude zur Wasserversorgung'),
('2511', 'Wasserwerk'),
('2512', 'Pumpstation'),
('2513', 'Wasserbehälter'),
('2520', 'Gebäude zur Elektrizitätsversorgung'),
('2521', 'Elektrizitätswerk'),
('2522', 'Umspannwerk'),
('2523', 'Umformer'),
('2527', 'Reaktorgebäude'),
('2528', 'Turbinenhaus'),
('2529', 'Kesselhaus'),
('2540', 'Gebäude für Fernmeldewesen'),
('2560', 'Gebäude an unterirdischen Leitungen'),
('2570', 'Gebäude zur Gasversorgung'),
('2571', 'Gaswerk'),
('2580', 'Heizwerk'),
('2590', 'Gebäude zur Versorgungsanlage'),
('2591', 'Pumpwerk (nicht für Wasserversorgung)'),
('2600', 'Gebäude zur Entsorgung'),
('2610', 'Gebäude zur Abwasserbeseitigung'),
('2611', 'Gebäude der Kläranlage'),
('2612', 'Toilette'),
('2620', 'Gebäude zur Abfallbehandlung'),
('2621', 'Müllbunker'),
('2622', 'Gebäude zur Müllverbrennung'),
('2623', 'Gebäude der Abfalldeponie'),
('2700', 'Gebäude für Land- und Forstwirtschaft'),
('2720', 'Land- und forstwirtschaftliches Betriebsgebäude'),
('2721', 'Scheune'),
('2723', 'Schuppen'),
('2724', 'Stall'),
('2726', 'Scheune und Stall'),
('2727', 'Stall für Tiergroßhaltung'),
('2728', 'Reithalle'),
('2729', 'Wirtschaftsgebäude'),
('2732', 'Almhütte'),
('2735', 'Jagdhaus, Jagdhütte'),
('2740', 'Treibhaus, Gewächshaus'),
('2741', 'Treibhaus'),
('2742', 'Gewächshaus, verschiebbar'),
('3000', 'Gebäude für öffentliche Zwecke'),
('3010', 'Verwaltungsgebäude'),
('3011', 'Parlament'),
('3012', 'Rathaus'),
('3013', 'Post'),
('3014', 'Zollamt'),
('3015', 'Gericht'),
('3016', 'Botschaft, Konsulat'),
('3017', 'Kreisverwaltung'),
('3018', 'Bezirksregierung'),
('3019', 'Finanzamt'),
('3020', 'Gebäude für Bildung und Forschung'),
('3021', 'Allgemein bildende Schule'),
('3022', 'Berufsbildende Schule'),
('3023', 'Hochschulgebäude (Fachhochschule, Universität)'),
('3024', 'Forschungsinstitut'),
('3030', 'Gebäude für kulturelle Zwecke'),
('3031', 'Schloss'),
('3032', 'Theater, Oper'),
('3033', 'Konzertgebäude'),
('3034', 'Museum'),
('3035', 'Rundfunk, Fernsehen'),
('3036', 'Veranstaltungsgebäude'),
('3037', 'Bibliothek, Bücherei'),
('3038', 'Burg, Festung'),
('3040', 'Gebäude für religiöse Zwecke'),
('3041', 'Kirche'),
('3042', 'Synagoge'),
('3043', 'Kapelle'),
('3044', 'Gemeindehaus'),
('3045', 'Gotteshaus'),
('3046', 'Moschee'),
('3047', 'Tempel'),
('3048', 'Kloster'),
('3050', 'Gebäude für Gesundheitswesen'),
('3051', 'Krankenhaus'),
('3052', 'Heilanstalt, Pflegeanstalt, Pflegestation'),
('3053', 'Ärztehaus, Poliklinik'),
('3060', 'Gebäude für soziale Zwecke'),
('3061', 'Jugendfreizeitheim'),
('3062', 'Freizeit-, Vereinsheim, Dorfgemeinschafts-, Bürgerhaus'),
('3063', 'Seniorenfreizeitstätte'),
('3064', 'Obdachlosenheim'),
('3065', 'Kinderkrippe, Kindergarten, Kindertagesstätte'),
('3066', 'Asylbewerberheim'),
('3070', 'Gebäude für Sicherheit und Ordnung'),
('3071', 'Polizei'),
('3072', 'Feuerwehr'),
('3073', 'Kaserne'),
('3074', 'Schutzbunker'),
('3075', 'Justizvollzugsanstalt'),
('3080', 'Friedhofsgebäude'),
('3081', 'Trauerhalle'),
('3082', 'Krematorium'),
('3090', 'Empfangsgebäude'),
('3091', 'Bahnhofsgebäude'),
('3092', 'Flughafengebäude'),
('3094', 'Gebäude zum U-Bahnhof'),
('3095', 'Gebäude zum S-Bahnhof'),
('3097', 'Gebäude zum Busbahnhof'),
('3098', 'Empfangsgebäude Schifffahrt'),
('3100', 'Gebäude für öffentliche Zwecke mit Wohnen'),
('3200', 'Gebäude für Erholungszwecke'),
('3210', 'Gebäude für Sportzwecke'),
('3211', 'Sport-, Turnhalle'),
('3212', 'Gebäude zum Sportplatz'),
('3220', 'Badegebäude'),
('3221', 'Hallenbad'),
('3222', 'Gebäude im Freibad'),
('3230', 'Gebäude im Stadion'),
('3240', 'Gebäude für Kurbetrieb'),
('3241', 'Badegebäude für medizinische Zwecke'),
('3242', 'Sanatorium'),
('3260', 'Gebäude im Zoo'),
('3261', 'Empfangsgebäude des Zoos'),
('3262', 'Aquarium, Terrarium, Voliere'),
('3263', 'Tierschauhaus'),
('3264', 'Stall im Zoo'),
('3270', 'Gebäude im botanischen Garten'),
('3271', 'Empfangsgebäude des botanischen Gartens'),
('3272', 'Gewächshaus (Botanik)'),
('3273', 'Pflanzenschauhaus'),
('3280', 'Gebäude für andere Erholungseinrichtung'),
('3281', 'Schutzhütte'),
('3290', 'Touristisches Informationszentrum'),
('9998', 'Nach Quellenlage nicht zu spezifizieren');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_gebaeudepunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_gebaeudepunkt AS ENUM 
	('1100', '1200', '2100', '2200');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_gebaeudepunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_gebaeudepunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_gebaeudepunkt IS 'Alias: "enum_AX_Art_Gebaeudepunkt"';
INSERT INTO enum_ax_art_gebaeudepunkt (wert,beschreibung) VALUES 
('1100', 'First'),
('1200', 'Traufe'),
('2100', 'Eingang'),
('2200', 'Lichtschacht');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_weitere_gebaeudefunktion'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_weitere_gebaeudefunktion AS ENUM 
	('1000', '1010', '1020', '1030', '1040', '1050', '1060', '1070', '1080', '1090', '1100', '1110', '1120', '1130', '1140', '1150', '1160', '1170', '1180', '1190', '1200', '1210', '1220', '1230', '1240');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_weitere_gebaeudefunktion (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_weitere_gebaeudefunktion_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_weitere_gebaeudefunktion IS 'Alias: "enum_AX_Weitere_Gebaeudefunktion"';
INSERT INTO enum_ax_weitere_gebaeudefunktion (wert,beschreibung) VALUES 
('1000', 'Bankfiliale'),
('1010', 'Hotel'),
('1020', 'Jugendherberge'),
('1030', 'Gaststätte'),
('1040', 'Kino'),
('1050', 'Spielkasino'),
('1060', 'Tiefgarage'),
('1070', 'Parkdeck'),
('1080', 'Toilette'),
('1090', 'Post'),
('1100', 'Zoll'),
('1110', 'Theater'),
('1120', 'Museum'),
('1130', 'Bibliothek'),
('1140', 'Kapelle'),
('1150', 'Moschee'),
('1160', 'Tempel'),
('1170', 'Apotheke'),
('1180', 'Polizeiwache'),
('1190', 'Rettungsstelle'),
('1200', 'Touristisches Informationszentrum'),
('1210', 'Kindergarten'),
('1220', 'Arztpraxis'),
('1230', 'Supermarkt'),
('1240', 'Geschäft');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_beschaffenheit_besonderegebaeudelinie'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_beschaffenheit_besonderegebaeudelinie AS ENUM 
	('1000', '2100', '2200', '2300', '3100', '3200', '3300', '3400', '4000', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_beschaffenheit_besonderegebaeudelinie (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_beschaffenheit_besonderegebaeudelinie_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_beschaffenheit_besonderegebaeudelinie IS 'Alias: "enum_AX_Beschaffenheit_BesondereGebaeudelinie"';
INSERT INTO enum_ax_beschaffenheit_besonderegebaeudelinie (wert,beschreibung) VALUES 
('1000', 'Offene Gebäudelinie'),
('2100', 'Unverputzt'),
('2200', 'Verputzt'),
('2300', 'Verklinkert'),
('3100', 'Holz'),
('3200', 'Sichtbeton'),
('3300', 'Naturstein'),
('3400', 'Glas'),
('4000', 'Trennlinie nicht eindeutig festgelegt'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bauart_bauteil'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bauart_bauteil AS ENUM 
	('1100', '1200', '1300', '1400', '2000', '2100', '2300', '2350', '2400', '2500', '2510', '2520', '2610', '2620', '2710', '2720', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bauart_bauteil (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bauart_bauteil_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bauart_bauteil IS 'Alias: "enum_AX_Bauart_Bauteil"';
INSERT INTO enum_ax_bauart_bauteil (wert,beschreibung) VALUES 
('1100', 'Geringergeschossiger Gebäudeteil'),
('1200', 'Höhergeschossiger Gebäudeteil (nicht Hochhaus)'),
('1300', 'Hochhausgebäudeteil'),
('1400', 'Abweichende Geschosshöhe'),
('2000', 'Keller'),
('2100', 'Tiefgarage'),
('2300', 'Loggia'),
('2350', 'Wintergarten'),
('2400', 'Arkade'),
('2500', 'Auskragende/zurückspringende Geschosse'),
('2510', 'Auskragende Geschosse'),
('2520', 'Zurückspringende Geschosse'),
('2610', 'Durchfahrt im Gebäude'),
('2620', 'Durchfahrt an überbauter Verkehrsstraße'),
('2710', 'Schornstein im Gebäude'),
('2720', 'Turm im Gebäude'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_nutzung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_nutzung AS ENUM 
	('1000', '1100', '1200', '1300', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_nutzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_nutzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_nutzung IS 'Alias: "enum_AX_Nutzung"';
INSERT INTO enum_ax_nutzung (wert,beschreibung) VALUES 
('1000', 'Zivil'),
('1100', 'Privat'),
('1200', 'Öffentlich'),
('1300', 'Religiös'),
('2000', 'Militärisch');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_verbandsgemeinde'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_verbandsgemeinde AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_verbandsgemeinde (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_verbandsgemeinde_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_verbandsgemeinde IS 'Alias: "enum_AX_Art_Verbandsgemeinde"';
INSERT INTO enum_ax_art_verbandsgemeinde (wert,beschreibung) VALUES 
('1000', 'Samtgemeinde'),
('2000', 'Verbandsgemeinde'),
('3000', 'Amt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_baublock'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_baublock AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_baublock (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_baublock_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_baublock IS 'Alias: "enum_AX_Art_Baublock"';
INSERT INTO enum_ax_art_baublock (wert,beschreibung) VALUES 
('1000', 'Nettobaublockfläche'),
('2000', 'Bruttobaublockfläche');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artdergebietsgrenze_gebietsgrenze'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artdergebietsgrenze_gebietsgrenze AS ENUM 
	('7101', '7102', '7103', '7104', '7105', '7106', '7107');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artdergebietsgrenze_gebietsgrenze (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artdergebietsgrenze_gebietsgrenze_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artdergebietsgrenze_gebietsgrenze IS 'Alias: "enum_AX_ArtDerGebietsgrenze_Gebietsgrenze"';
INSERT INTO enum_ax_artdergebietsgrenze_gebietsgrenze (wert,beschreibung) VALUES 
('7101', 'Grenze der Bundesrepublik Deutschland'),
('7102', 'Grenze des Bundeslandes'),
('7103', 'Grenze des Regierungsbezirks'),
('7104', 'Grenze des Kreises/Region'),
('7105', 'Grenze der Verwaltungsgemeinschaft'),
('7106', 'Grenze der Gemeinde'),
('7107', 'Grenze des Gemeindeteils');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_sonstigeangaben_bodenschaetzung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_sonstigeangaben_bodenschaetzung AS ENUM 
	('1100', '1200', '1300', '1400', '2100', '2200', '2300', '2400', '2500', '2600', '3000', '4000', '5000', '9000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_sonstigeangaben_bodenschaetzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_sonstigeangaben_bodenschaetzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_sonstigeangaben_bodenschaetzung IS 'Alias: "enum_AX_SonstigeAngaben_Bodenschaetzung"';
INSERT INTO enum_ax_sonstigeangaben_bodenschaetzung (wert,beschreibung) VALUES 
('1100', 'Nass, zu viel Wasser (Wa+)'),
('1200', 'Trocken, zu wenig Wasser (Wa-)'),
('1300', 'Besonders günstige Wasserverhältnisse (Wa gt)'),
('1400', 'Rieselwasser, künstliche Bewässerung (RiWa)'),
('2100', 'Unbedingtes Wiesenland (W)'),
('2200', 'Streuwiese (Str)'),
('2300', 'Hutung (Hu)'),
('2400', 'Acker-Hackrain (A-Hack)'),
('2500', 'Grünland-Hackrain (Gr-Hack)'),
('2600', 'Garten (G)'),
('3000', 'Neukultur (N)'),
('4000', 'Tiefkultur (T)'),
('5000', 'Geringstland (Ger)'),
('9000', 'Nachschätzung erforderlich');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_kulturart_musterlandesmusterundvergleichsstueck'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_kulturart_musterlandesmusterundvergleichsstueck AS ENUM 
	('1000', '2000', '3000', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_kulturart_musterlandesmusterundvergleichsstueck (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_kulturart_musterlandesmusterundvergleichsstueck_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_kulturart_musterlandesmusterundvergleichsstueck IS 'Alias: "enum_AX_Kulturart_MusterLandesmusterUndVergleichsstueck"';
INSERT INTO enum_ax_kulturart_musterlandesmusterundvergleichsstueck (wert,beschreibung) VALUES 
('1000', 'Ackerland (A)'),
('2000', 'Acker-Grünland (AGr)'),
('3000', 'Grünland (Gr)'),
('4000', 'Grünland-Acker (GrA)');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_entstehungsartoderklimastufewasserverhaeltnisse_bodensc'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_entstehungsartoderklimastufewasserverhaeltnisse_bodensc AS ENUM 
	('1000', '1100', '1200', '1300', '1400', '1410', '1420', '1430', '2000', '2100', '2110', '2120', '2200', '2300', '2310', '2400', '3000', '3100', '3200', '3300', '3400', '3410', '3420', '3430', '3500', '3610', '3620', '3700', '4000', '4100', '4200', '4300', '4400', '4410', '5000', '6100', '6200', '6300', '6400', '7100', '7200', '7300', '7400', '7410', '7500', '7510', '7520', '7530');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_entstehungsartoderklimastufewasserverhaeltnisse_bo (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_entstehungsartoderklimastufewasserverhaeltnisse_bo_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_entstehungsartoderklimastufewasserverhaeltnisse_bo IS 'Alias: "enum_AX_EntstehungsartOderKlimastufeWasserverhaeltnisse_Bodenschaetzung"';
INSERT INTO enum_ax_entstehungsartoderklimastufewasserverhaeltnisse_bo (wert,beschreibung) VALUES 
('1000', 'Diluvium (D)'),
('1100', 'Diluvium über Alluvium (DAl)'),
('1200', 'Diluvium über Löß (DLö)'),
('1300', 'Diluvium über Verwitterung (DV)'),
('1400', 'Diluvium, gesteinig (Dg)'),
('1410', 'Diluvium, gesteinig über Alluvium (DgAl)'),
('1420', 'Diluvium, gesteinig über Löß (DgLö)'),
('1430', 'Diluvium, gesteinig über Verwitterung (DgV)'),
('2000', 'Löß (Lö)'),
('2100', 'Löß über Diluvium (LöD)'),
('2110', 'Löß, Diluvium, Gesteinsböden (LöDg)'),
('2120', 'Löß, Diluvium, Verwitterung (LöDV)'),
('2200', 'Löß über Alluvium (LöAl)'),
('2300', 'Löß über Verwitterung (LöV)'),
('2310', 'Löß, Verwitterung, Gesteinsböden (LöVg)'),
('2400', 'Löß über Verwitterung, gesteinig (LöVg)'),
('3000', 'Alluvium (Al)'),
('3100', 'Alluvium über Diluvium (AlD)'),
('3200', 'Alluvium über Löß (AlLö)'),
('3300', 'Alluvium über Verwitterung (AlV)'),
('3400', 'Alluvium, gesteinig (Alg)'),
('3410', 'Alluvium, gesteinig über Diluvium (AlgD)'),
('3420', 'Alluvium, gesteinig über Löß (AlgLö)'),
('3430', 'Alluvium, gesteinig über Verwitterung (AlgV)'),
('3500', 'Alluvium, Marsch (AlMa)'),
('3610', 'Alluvium, Moor (AlMo)'),
('3620', 'Moor, Alluvium (MoAI)'),
('3700', 'Mergel (Me)'),
('4000', 'Verwitterung (V)'),
('4100', 'Verwitterung über Diluvium (VD)'),
('4200', 'Verwitterung über Alluvium (VAl)'),
('4300', 'Verwitterung über Löß (VLö)'),
('4400', 'Verwitterung, Gesteinsböden (Vg)'),
('4410', 'Verwitterung, Gesteinsböden über Diluvium (VgD)'),
('5000', 'Entstehungsart nicht erkennbar (-)'),
('6100', 'Klimastufe 8° C und darüber (a)'),
('6200', 'Klimastufe 7,9° - 7,0° C (b)'),
('6300', 'Klimastufe 6,9° - 5,7° C (c)'),
('6400', 'Klimastufe 5,6° C und darunter (d)'),
('7100', 'Wasserstufe (1)'),
('7200', 'Wasserstufe (2)'),
('7300', 'Wasserstufe (3)'),
('7400', 'Wasserstufe (4)'),
('7410', 'Wasserstufe (4-)'),
('7500', 'Wasserstufe (5)'),
('7510', 'Wasserstufe (5-)'),
('7520', 'Wasserstufe (3-)'),
('7530', 'Wasserstufe (3+4)');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_sonstigeangaben_musterlandesmusterundvergleichsstueck'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_sonstigeangaben_musterlandesmusterundvergleichsstueck AS ENUM 
	('1100', '1200', '1300', '1400', '2100', '2200', '2300', '2400', '2500', '2600', '5000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_sonstigeangaben_musterlandesmusterundvergleichsstu (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_sonstigeangaben_musterlandesmusterundvergleichsstu_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_sonstigeangaben_musterlandesmusterundvergleichsstu IS 'Alias: "enum_AX_SonstigeAngaben_MusterLandesmusterUndVergleichsstueck"';
INSERT INTO enum_ax_sonstigeangaben_musterlandesmusterundvergleichsstu (wert,beschreibung) VALUES 
('1100', 'Nass, zu viel Wasser (Wa+)'),
('1200', 'Trocken, zu wenig Wasser (Wa-)'),
('1300', 'Besonders günstige Wasserverhältnisse (Wa gt)'),
('1400', 'Rieselwasser, künstliche Bewässerung (RiWa)'),
('2100', 'Unbedingtes Wiesenland (W)'),
('2200', 'Streuwiese (Str)'),
('2300', 'Hutung (Hu)'),
('2400', 'Acker-Hackrain (A-Hack)'),
('2500', 'Grünland-Hackrain (Gr-Hack)'),
('2600', 'Garten (G)'),
('5000', 'Geringstland (Ger)');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_kulturart_bodenschaetzung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_kulturart_bodenschaetzung AS ENUM 
	('1000', '2000', '3000', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_kulturart_bodenschaetzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_kulturart_bodenschaetzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_kulturart_bodenschaetzung IS 'Alias: "enum_AX_Kulturart_Bodenschaetzung"';
INSERT INTO enum_ax_kulturart_bodenschaetzung (wert,beschreibung) VALUES 
('1000', 'Ackerland (A)'),
('2000', 'Acker-Grünland (AGr)'),
('3000', 'Grünland (Gr)'),
('4000', 'Grünland-Acker (GrA)');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_klassifizierung_bewertung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_klassifizierung_bewertung AS ENUM 
	('1110', '1120', '1130', '1140', '1210', '1220', '1230', '1240', '1250', '1260', '1310', '1320', '1330', '1340', '1350', '1360', '2110', '2120', '2130', '2190', '2200', '2300', '2310', '2320', '2330', '2340', '2350', '2360', '2370', '2380', '2390', '2410', '2420', '2430', '2440', '2450', '2510', '2520', '2530', '2610', '2620', '2630', '2640', '2650', '2700', '2710', '2720', '2730', '2800', '2899');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_klassifizierung_bewertung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_klassifizierung_bewertung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_klassifizierung_bewertung IS 'Alias: "enum_AX_Klassifizierung_Bewertung"';
INSERT INTO enum_ax_klassifizierung_bewertung (wert,beschreibung) VALUES 
('1110', 'Unbebautes Grundstück'),
('1120', 'Unbebautes Grundstück mit Gebäude von untergeordneter Bedeutung'),
('1130', 'Unbebautes Grundstück mit einem dem Verfall preisgegebenen Gebäude'),
('1140', 'Unbebautes Grundstück für Erholungs- und Freizeitzwecke'),
('1210', 'Einfamilienhausgrundstück'),
('1220', 'Zweifamilienhausgrundstück'),
('1230', 'Mietwohngrundstück'),
('1240', 'Gemischtgenutztes Grundstück'),
('1250', 'Geschäftsgrundstück'),
('1260', 'Sonstiges bebautes Grundstück'),
('1310', 'Einfamilienhaus auf fremdem Grund und Boden'),
('1320', 'Zweifamilienhaus auf fremdem Grund und Boden'),
('1330', 'Mietwohngrundstück, Mietwohngebäude auf fremdem Grund und Boden'),
('1340', 'Gemischtgenutztes Grundstück, gemischtgenutztes Gebäude auf fremdem Grund und Boden'),
('1350', 'Geschäftsgrundstück, Geschäftsgebäude auf fremdem Grund und Boden'),
('1360', 'Sonstige bebaute Grundstücke, sonstige Gebäude auf fremdem Grund und Boden'),
('2110', 'Landwirtschaftliche Nutzung'),
('2120', 'Hopfen'),
('2130', 'Spargel'),
('2190', 'Sonstige Sonderkulturen'),
('2200', 'Holzung'),
('2300', 'Weingarten (allgemein)'),
('2310', 'Weingarten 1'),
('2320', 'Weingarten 2'),
('2330', 'Weingarten 3'),
('2340', 'Weingarten 4'),
('2350', 'Weingarten 5'),
('2360', 'Weingarten 6'),
('2370', 'Weingarten 7'),
('2380', 'Weingarten 8'),
('2390', 'Weingarten 9'),
('2410', 'Gartenland'),
('2420', 'Obstplantage'),
('2430', 'Baumschule'),
('2440', 'Anbaufläche unter Glas'),
('2450', 'Kleingarten'),
('2510', 'Weihnachtsbaumkultur'),
('2520', 'Saatzucht'),
('2530', 'Teichwirtschaft'),
('2610', 'Abbauland der Land- und Forstwirtschaft'),
('2620', 'Geringstland'),
('2630', 'Unland'),
('2640', 'Moor'),
('2650', 'Heide'),
('2700', 'Reet'),
('2710', 'Reet I'),
('2720', 'Reet II'),
('2730', 'Reet III'),
('2800', 'Nebenfläche des Betriebs der Land- und Forstwirtschaft'),
('2899', 'Noch nicht klassifiziert');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_merkmal_musterlandesmusterundvergleichsstueck'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_merkmal_musterlandesmusterundvergleichsstueck AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_merkmal_musterlandesmusterundvergleichsstueck (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_merkmal_musterlandesmusterundvergleichsstueck_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_merkmal_musterlandesmusterundvergleichsstueck IS 'Alias: "enum_AX_Merkmal_MusterLandesmusterUndVergleichsstueck"';
INSERT INTO enum_ax_merkmal_musterlandesmusterundvergleichsstueck (wert,beschreibung) VALUES 
('1000', 'Musterstück (M)'),
('2000', 'Landesmusterstück (L)'),
('3000', 'Vergleichsstück (V)');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustandsstufeoderbodenstufe_bodenschaetzung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustandsstufeoderbodenstufe_bodenschaetzung AS ENUM 
	('1100', '1200', '1300', '1400', '1500', '1600', '1700', '1800', '2100', '2200', '2300', '2400', '3100', '3200', '3300');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustandsstufeoderbodenstufe_bodenschaetzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustandsstufeoderbodenstufe_bodenschaetzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustandsstufeoderbodenstufe_bodenschaetzung IS 'Alias: "enum_AX_ZustandsstufeOderBodenstufe_Bodenschaetzung"';
INSERT INTO enum_ax_zustandsstufeoderbodenstufe_bodenschaetzung (wert,beschreibung) VALUES 
('1100', 'Zustandsstufe (1)'),
('1200', 'Zustandsstufe (2)'),
('1300', 'Zustandsstufe (3)'),
('1400', 'Zustandsstufe (4)'),
('1500', 'Zustandsstufe (5)'),
('1600', 'Zustandsstufe (6)'),
('1700', 'Zustandsstufe (7)'),
('1800', 'Zustandsstufe Misch- und Schichtböden sowie künstlichveränderte Böden (-)'),
('2100', 'Bodenstufe (I)'),
('2200', 'Bodenstufe (II)'),
('2300', 'Bodenstufe (III)'),
('2400', 'Bodenstufe Misch- und Schichtböden sowie künstlich veränderte Böden (-)'),
('3100', 'Bodenstufe (II+III)'),
('3200', 'Bodenstufe ("(III)")'),
('3300', 'Bodenstufe (IV)');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bedeutung_grablochderbodenschaetzung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bedeutung_grablochderbodenschaetzung AS ENUM 
	('1100', '1200', '1300', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bedeutung_grablochderbodenschaetzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bedeutung_grablochderbodenschaetzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bedeutung_grablochderbodenschaetzung IS 'Alias: "enum_AX_Bedeutung_GrablochDerBodenschaetzung"';
INSERT INTO enum_ax_bedeutung_grablochderbodenschaetzung (wert,beschreibung) VALUES 
('1100', 'Grabloch, bestimmend, lagerichtig (innerhalb der Fläche)'),
('1200', 'Grabloch, bestimmend, lagerichtig (außerhalb des Abschnitts)'),
('1300', 'Grabloch, nicht lagerichtig, im Abschnitt nicht vorhanden'),
('2000', 'Grabloch für Muster-, Landesmuster-, Vergleichsstück'),
('3000', 'Grabloch, nicht bestimmend');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustandsstufeoderbodenstufe_musterlandesmusterundvergle'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustandsstufeoderbodenstufe_musterlandesmusterundvergle AS ENUM 
	('1100', '1200', '1300', '1400', '1500', '1600', '1700', '1800', '2100', '2200', '2300', '2400');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustandsstufeoderbodenstufe_musterlandesmusterundv (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustandsstufeoderbodenstufe_musterlandesmusterundv_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustandsstufeoderbodenstufe_musterlandesmusterundv IS 'Alias: "enum_AX_ZustandsstufeOderBodenstufe_MusterLandesmusterUndVergleichsstueck"';
INSERT INTO enum_ax_zustandsstufeoderbodenstufe_musterlandesmusterundv (wert,beschreibung) VALUES 
('1100', 'Zustandsstufe (1)'),
('1200', 'Zustandsstufe (2)'),
('1300', 'Zustandsstufe (3)'),
('1400', 'Zustandsstufe (4)'),
('1500', 'Zustandsstufe (5)'),
('1600', 'Zustandsstufe (6)'),
('1700', 'Zustandsstufe (7)'),
('1800', 'Zustandsstufe Misch- und Schichtböden sowie künstlichveränderte Böden (-)'),
('2100', 'Bodenstufe (I)'),
('2200', 'Bodenstufe (II)'),
('2300', 'Bodenstufe (III)'),
('2400', 'Bodenstufe Misch- und Schichtböden sowie künstlich veränderte Böden (-)');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_entstehungsartoderklimastufewasserverhaeltnisse_musterl'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_entstehungsartoderklimastufewasserverhaeltnisse_musterl AS ENUM 
	('1000', '1100', '1200', '1300', '1400', '1410', '1420', '1430', '2000', '2100', '2200', '2300', '3000', '3100', '3200', '3300', '3400', '3410', '3420', '3430', '4000', '4100', '4200', '4300', '4400', '4410', '5000', '6100', '6200', '6300', '6400', '7100', '7200', '7300', '7400', '7410', '7500', '7510');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_entstehungsartoderklimastufewasserverhaeltnisse_mu (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_entstehungsartoderklimastufewasserverhaeltnisse_mu_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_entstehungsartoderklimastufewasserverhaeltnisse_mu IS 'Alias: "enum_AX_EntstehungsartOderKlimastufeWasserverhaeltnisse_MusterLandesmusterUndVergleichsstueck"';
INSERT INTO enum_ax_entstehungsartoderklimastufewasserverhaeltnisse_mu (wert,beschreibung) VALUES 
('1000', 'Diluvium (D)'),
('1100', 'Diluvium über Alluvium (DAl)'),
('1200', 'Diluvium über Löß (DLö)'),
('1300', 'Diluvium über Verwitterung (DV)'),
('1400', 'Diluvium, gesteinig (Dg)'),
('1410', 'Diluvium, gesteinig über Alluvium (DgAl)'),
('1420', 'Diluvium, gesteinig über Löß (DgLö)'),
('1430', 'Diluvium, gesteinig über Verwitterung (DgV)'),
('2000', 'Löß (Lö)'),
('2100', 'Löß über Diluvium (LöD)'),
('2200', 'Löß über Alluvium (LöAl)'),
('2300', 'Löß über Verwitterung (LöV)'),
('3000', 'Alluvium (Al)'),
('3100', 'Alluvium über Diluvium (AlD)'),
('3200', 'Alluvium über Löß (AlLö)'),
('3300', 'Alluvium über Verwitterung (AlV)'),
('3400', 'Alluvium, gesteinig (Alg)'),
('3410', 'Alluvium, gesteinig über Diluvium (AlgD)'),
('3420', 'Alluvium, gesteinig über Löß (AlgLö)'),
('3430', 'Alluvium, gesteinig über Verwitterung (AlgV)'),
('4000', 'Verwitterung (V)'),
('4100', 'Verwitterung über Diluvium (VD)'),
('4200', 'Verwitterung über Alluvium (VAl)'),
('4300', 'Verwitterung über Löß (VLö)'),
('4400', 'Verwitterung, Gesteinsböden (Vg)'),
('4410', 'Verwitterung, Gesteinsböden über Diluvium (VgD)'),
('5000', 'Entstehungsart nicht erkennbar (-)'),
('6100', 'Klimastufe 8 Grad C und darüber (a)'),
('6200', 'Klimastufe 7,9 Grad - 7,0 Grad C (b)'),
('6300', 'Klimastufe 6,9 Grad - 5,7 Grad C (c)'),
('6400', 'Klimastufe 5,6 Grad C und darunter (d)'),
('7100', 'Wasserstufe (1)'),
('7200', 'Wasserstufe (2)'),
('7300', 'Wasserstufe (3)'),
('7400', 'Wasserstufe (4)'),
('7410', 'Wasserstufe (4-)'),
('7500', 'Wasserstufe (5)'),
('7510', 'Wasserstufe (5-)');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bodenart_bodenschaetzung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bodenart_bodenschaetzung AS ENUM 
	('1100', '2100', '3100', '4100', '5000', '1200', '2200', '3200', '4200', '6110', '6120', '6130', '6140', '6210', '6220', '6230', '6240', '7110', '7130', '7210', '7220', '7230', '7310', '7320', '7400', '7510', '7530', '7610', '7620', '7630', '7710', '7800', '7120', '7140', '7330', '7520', '7540', '7720', '8110', '8120', '8130', '8140', '8210', '8220', '8230', '8240', '9120', '9130', '9140', '9150', '9160', '9170', '9180', '9190', '9200', '9210', '9220', '9310', '9320', '9330', '9340', '9350', '9360', '9370', '9380', '9390', '9410', '9420', '9430', '9440', '9450', '9460', '9470', '9480', '9490');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bodenart_bodenschaetzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bodenart_bodenschaetzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bodenart_bodenschaetzung IS 'Alias: "enum_AX_Bodenart_Bodenschaetzung"';
INSERT INTO enum_ax_bodenart_bodenschaetzung (wert,beschreibung) VALUES 
('1100', 'Sand (S)'),
('2100', 'Lehmiger Sand (lS)'),
('3100', 'Lehm (L)'),
('4100', 'Ton (T)'),
('5000', 'Moor (Mo)'),
('1200', 'Anlehmiger Sand (Sl)'),
('2200', 'Stark lehmiger Sand (SL)'),
('3200', 'Sandiger Lehm (sL)'),
('4200', 'Schwerer Lehm (LT)'),
('6110', 'Sand, Moor (SMo)'),
('6120', 'Lehmiger Sand, Moor (lSMo)'),
('6130', 'Lehm, Moor (LMo)'),
('6140', 'Ton, Moor (TMo)'),
('6210', 'Moor,Sand (MoS)'),
('6220', 'Moor, Lehmiger Sand (MolS)'),
('6230', 'Moor, Lehm (MoL)'),
('6240', 'Moor, Ton (MoT)'),
('7110', 'Sand auf sandigem Lehm (S/sL)'),
('7130', 'Sand auf schwerem Lehm (S/LT)'),
('7210', 'Anlehmiger Sand auf Lehm (Sl/L)'),
('7220', 'Anlehmiger Sand auf schwerem Lehm (Sl/LT)'),
('7230', 'Anlehmiger Sand auf Ton (Sl/T)'),
('7310', 'Lehmiger Sand auf schwerem Lehm (lS/LT)'),
('7320', 'Lehmiger Sand auf Sand (lS/S)'),
('7400', 'Stark lehmiger Sand auf Ton (SL/T)'),
('7510', 'Ton auf stark lehmigen Sand (T/SL)'),
('7530', 'Ton auf anlehmigen Sand (T/Sl)'),
('7610', 'Schwerer Lehm auf lehmigen Sand (LT/lS)'),
('7620', 'Schwerer Lehm auf anlehmigen Sand (LT/Sl)'),
('7630', 'Schwerer Lehm auf Sand (LT/S)'),
('7710', 'Lehm auf anlehmigen Sand (L/Sl)'),
('7800', 'Sandiger Lehm auf Sand (sL/S)'),
('7120', 'Sand auf Lehm (S/L)'),
('7140', 'Sand auf Ton (S/T)'),
('7330', 'Lehmiger Sand auf Ton (lS/T)'),
('7520', 'Ton auf lehmigen Sand (T/lS)'),
('7540', 'Ton auf Sand (T/S)'),
('7720', 'Lehm auf Sand (L/S)'),
('8110', 'Sand auf Moor (S/Mo)'),
('8120', 'Lehmiger Sand auf Moor (lS/Mo)'),
('8130', 'Lehm auf Moor (L/Mo)'),
('8140', 'Ton auf Moor (T/Mo)'),
('8210', 'Moor auf Sand (Mo/S)'),
('8220', 'Moor auf lehmigen Sand (Mo/lS)'),
('8230', 'Moor auf Lehm (Mo/L)'),
('8240', 'Moor auf Ton (Mo/T)'),
('9120', 'Bodenwechsel vom Lehm zu Moor (L+Mo)'),
('9130', 'Lehmiger Sand mit starkem Steingehalt (lSg)'),
('9140', 'Lehm mit starkem Steingehalt (Lg)'),
('9150', 'lehmiger Sand mit Steinen und Blöcken (lS+St)'),
('9160', 'Lehm mit Steinen und Blöcken L+St)'),
('9170', 'Steine und Blöcke mit  lehmigem Sand (St+lS)'),
('9180', 'Steine und Blöcke mit  Lehm (St+L)'),
('9190', 'lehmiger Sand mit Felsen (lS+Fe)'),
('9200', 'Lehm mit Felsen (L+Fe)'),
('9210', 'Felsen mit lehmigem Sand (Fe+lS)'),
('9220', 'Felsen mit Lehm (Fe+L)'),
('9310', 'Sand auf lehmigen Sand (S/lS)'),
('9320', 'Anlehmiger Sand auf Mergel (Sl/Me)'),
('9330', 'Anlehmiger Sand auf sandigem Lehm (Sl/sL)'),
('9340', 'Lehmiger Sand auf Lehm (lS/L)'),
('9350', 'Lehmiger Sand auf Mergel (lS/Me)'),
('9360', 'Lehmiger Sand auf sandigem Lehm (lS/sL)'),
('9370', 'Lehmiger Sand, Mergel (lSMe)'),
('9380', 'Lehmiger Sand, Moor auf Mergel (lSMo/Me)'),
('9390', 'Anlehmiger Sand, Moor (SlMo)'),
('9410', 'Lehm auf Mergel (L/Me)'),
('9420', 'Lehm, Moor auf Mergel (LMo/Me)'),
('9430', 'Schwerer Lehm auf Moor (LT/Mo)'),
('9440', 'Ton auf Mergel (T/Me)'),
('9450', 'Moor auf Mergel (Mo/Me)'),
('9460', 'Moor, Lehm auf Mergel (MoL/Me)'),
('9470', 'Moor, Mergel (MoMe)'),
('9480', 'LößDiluvium(LöD)'),
('9490', 'AlluviumDiluvium(AlD)');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bodenart_musterlandesmusterundvergleichsstueck'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bodenart_musterlandesmusterundvergleichsstueck AS ENUM 
	('1100', '2100', '3100', '4100', '5000', '1200', '2200', '3200', '4200', '6110', '6120', '6130', '6140', '6210', '6220', '6230', '6240', '7110', '7130', '7210', '7220', '7230', '7310', '7400', '7510', '7530', '7610', '7620', '7630', '7710', '7800', '7120', '7140', '7320', '7520', '7540', '7720', '8110', '8120', '8130', '8140', '8210', '8220', '8230', '8240');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bodenart_musterlandesmusterundvergleichsstueck (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bodenart_musterlandesmusterundvergleichsstueck_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bodenart_musterlandesmusterundvergleichsstueck IS 'Alias: "enum_AX_Bodenart_MusterLandesmusterUndVergleichsstueck"';
INSERT INTO enum_ax_bodenart_musterlandesmusterundvergleichsstueck (wert,beschreibung) VALUES 
('1100', 'Sand (S)'),
('2100', 'Lehmiger Sand (lS)'),
('3100', 'Lehm (L)'),
('4100', 'Ton (T)'),
('5000', 'Moor (Mo)'),
('1200', 'Anlehmiger Sand (Sl)'),
('2200', 'Stark lehmiger Sand (SL)'),
('3200', 'Sandiger Lehm (sL)'),
('4200', 'Schwerer Lehm (LT)'),
('6110', 'Sand, Moor (SMo)'),
('6120', 'Lehmiger Sand, Moor (lSMo)'),
('6130', 'Lehm, Moor (LMo)'),
('6140', 'Ton, Moor (TMo)'),
('6210', 'Moor, Sand (MoS)'),
('6220', 'Moor, Lehmiger Sand (MolS)'),
('6230', 'Moor, Lehm (MoL)'),
('6240', 'Moor, Ton (MoT)'),
('7110', 'Sand auf sandigem Lehm (S/sL)'),
('7130', 'Sand auf schwerem Lehm (S/LT)'),
('7210', 'Anlehmiger Sand auf Lehm (Sl/L)'),
('7220', 'Anlehmiger Sand auf schwerem Lehm (Sl/LT)'),
('7230', 'Anlehmiger Sand auf Ton (Sl/T)'),
('7310', 'Lehmiger Sand auf schwerem Lehm (lS/LT)'),
('7400', 'Stark lehmiger Sand auf Ton (SL/T)'),
('7510', 'Ton auf stark lehmigen Sand (T/SL)'),
('7530', 'Ton auf anlehmigen Sand (T/Sl)'),
('7610', 'Schwerer Lehm auf lehmigen Sand (LT/lS)'),
('7620', 'Schwerer Lehm auf anlehmigen Sand (LT/Sl)'),
('7630', 'Schwerer Lehm auf Sand (LT/S)'),
('7710', 'Lehm auf anlehmigen Sand (L/Sl)'),
('7800', 'Sandiger Lehm auf Sand (sL/S)'),
('7120', 'Sand auf Lehm (S/L)'),
('7140', 'Sand auf Ton (S/T)'),
('7320', 'Lehmiger Sand auf Ton (lS/T)'),
('7520', 'Ton auf lehmigen Sand (T/lS)'),
('7540', 'Ton auf Sand (T/S)'),
('7720', 'Lehm auf Sand (L/S)'),
('8110', 'Sand auf Moor (S/Mo)'),
('8120', 'Lehmiger Sand auf Moor (lS/Mo)'),
('8130', 'Lehm auf Moor (L/Mo)'),
('8140', 'Ton auf Moor (T/Mo)'),
('8210', 'Moor auf Sand (Mo/S)'),
('8220', 'Moor auf lehmigen Sand (Mo/lS)'),
('8230', 'Moor auf Lehm (Mo/L)'),
('8240', 'Moor auf Ton (Mo/T)');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_landschaftstyp'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_landschaftstyp AS ENUM 
	('1100', '1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000', '2100', '2200', '2300', '2400', '2500');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_landschaftstyp (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_landschaftstyp_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_landschaftstyp IS 'Alias: "enum_AX_Landschaftstyp"';
INSERT INTO enum_ax_landschaftstyp (wert,beschreibung) VALUES 
('1100', 'Gebirge'),
('1200', 'Berg'),
('1300', 'Niederung/Senke'),
('1400', 'Tal'),
('1500', 'Tiefebene'),
('1600', 'Plateau/Hochebene'),
('1700', 'Mündungsgebiet'),
('1800', 'Dünenlandschaft'),
('1900', 'Waldlandschaft'),
('2000', 'Inselgruppe'),
('2100', 'Seenlandschaft'),
('2200', 'Siedlungslandschaft'),
('2300', 'Moorlandschaft'),
('2400', 'Heidelandschaft'),
('2500', 'Wattlandschaft');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_verband'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_verband AS ENUM 
	('1000', '2000', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_verband (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_verband_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_verband IS 'Alias: "enum_AX_Art_Verband"';
INSERT INTO enum_ax_art_verband (wert,beschreibung) VALUES 
('1000', 'Planungsverband'),
('2000', 'Region'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_behoerde'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_behoerde AS ENUM 
	('1000', '1100', '1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000', '2100', '2200', '2300', '2400', '2500');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_behoerde (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_behoerde_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_behoerde IS 'Alias: "enum_AX_Behoerde"';
INSERT INTO enum_ax_behoerde (wert,beschreibung) VALUES 
('1000', 'Grundbuchamt'),
('1100', 'Katasteramt'),
('1200', 'Finanzamt'),
('1300', 'Flurbereinigungsbehörde'),
('1400', 'Forstamt'),
('1500', 'Wasserwirtschaftsamt'),
('1600', 'Straßenbauamt'),
('1700', 'Gemeindeamt'),
('1800', 'Landratsamt'),
('1900', 'Kreis- oder Stadtverwaltung'),
('2000', 'Wasser- und Bodenverband'),
('2100', 'Umlegungsstelle'),
('2200', 'Landesvermessungsverwaltung'),
('2300', 'ÖbVI'),
('2400', 'Bundeseisenbahnvermögen'),
('2500', 'Landwirtschaftskammer');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_administrative_funktion'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_administrative_funktion AS ENUM 
	('2001', '2002', '1001', '2003', '3001', '3002', '3003', '3004', '4001', '4002', '4003', '4007', '4008', '4009', '5002', '5004', '5006', '5007', '5008', '5012', '5013', '6001', '6002', '6003', '6004', '6005', '6006', '6007', '6008', '6009', '6010', '6011', '6012', '6013', '6014', '6015', '7001', '7003', '7004', '7005', '7007', '8001');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_administrative_funktion (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_administrative_funktion_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_administrative_funktion IS 'Alias: "enum_AX_Administrative_Funktion"';
INSERT INTO enum_ax_administrative_funktion (wert,beschreibung) VALUES 
('2001', 'Land'),
('2002', 'Freistaat'),
('1001', 'Bundesrepublik'),
('2003', 'Freie und Hansestadt'),
('3001', 'Regierungsbezirk'),
('3002', 'Freie Hansestadt'),
('3003', 'Bezirk'),
('3004', 'Stadt (Bremerhaven)'),
('4001', 'Kreis'),
('4002', 'Landkreis'),
('4003', 'Kreisfreie Stadt'),
('4007', 'Ursprünglich gemeindefreies Gebiet'),
('4008', 'Ortsteil'),
('4009', 'Region'),
('5002', 'Verbandsfreie Gemeinde'),
('5004', 'Große kreisangehörige Stadt'),
('5006', 'Verwaltungsgemeinschaft'),
('5007', 'Amt'),
('5008', 'Samtgemeinde'),
('5012', 'Gemeinde, die sich einer erfüllenden Gemeinde bedient'),
('5013', 'Erfüllende Gemeinde'),
('6001', 'Gemeinde'),
('6002', 'Ortsgemeinde'),
('6003', 'Stadt'),
('6004', 'Kreisangehörige Stadt'),
('6005', 'Große Kreisstadt'),
('6006', 'Amtsangehörige Stadt'),
('6007', 'Amtsangehörige Landgemeinde'),
('6008', 'Amtsangehörige Gemeinde'),
('6009', 'Kreisangehörige Gemeinde'),
('6010', 'Mitgliedsgemeinde einer Verwaltungsgemeinschaft'),
('6011', 'Mitgliedsgemeinde'),
('6012', 'Markt'),
('6013', 'Große kreisangehoerige Stadt'),
('6014', 'Kreisangehörige Gemeinde, die die Bezeichnung Stadt führt'),
('6015', 'Gemeindefreies Gebiet'),
('7001', 'Gemeindeteil'),
('7003', 'Gemarkung'),
('7004', 'Stadtteil'),
('7005', 'Stadtbezirk'),
('7007', 'Ortsteil (Gemeinde)'),
('8001', 'Kondominium');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bezeichnung_verwaltungsgemeinschaft'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bezeichnung_verwaltungsgemeinschaft AS ENUM 
	('1000', '2000', '3000', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bezeichnung_verwaltungsgemeinschaft (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bezeichnung_verwaltungsgemeinschaft_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bezeichnung_verwaltungsgemeinschaft IS 'Alias: "enum_AX_Bezeichnung_Verwaltungsgemeinschaft"';
INSERT INTO enum_ax_bezeichnung_verwaltungsgemeinschaft (wert,beschreibung) VALUES 
('1000', 'Samtgemeinde'),
('2000', 'Verbandsgemeinde'),
('3000', 'Amt'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_schutzgebietnachwasserrecht'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_schutzgebietnachwasserrecht AS ENUM 
	('2111', '2112', '2113');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_schutzgebietnachwasserrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_schutzgebietnachwasserrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_schutzgebietnachwasserrecht IS 'Alias: "enum_AX_Funktion_SchutzgebietNachWasserrecht"';
INSERT INTO enum_ax_funktion_schutzgebietnachwasserrecht (wert,beschreibung) VALUES 
('2111', 'Öffentliche Wasserversorgung'),
('2112', 'Grundwasseranreicherung'),
('2113', 'Verhütung von schädlichem Abfluss');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderfestlegung_schutzgebietnachnaturumweltoderbodensc'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderfestlegung_schutzgebietnachnaturumweltoderbodensc AS ENUM 
	('1670', '1680', '1690');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderfestlegung_schutzgebietnachnaturumweltoderbo (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderfestlegung_schutzgebietnachnaturumweltoderbo_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderfestlegung_schutzgebietnachnaturumweltoderbo IS 'Alias: "enum_AX_ArtDerFestlegung_SchutzgebietNachNaturUmweltOderBodenschutzrecht"';
INSERT INTO enum_ax_artderfestlegung_schutzgebietnachnaturumweltoderbo (wert,beschreibung) VALUES 
('1670', 'Nationalpark'),
('1680', 'Lärmschutzbereich'),
('1690', 'Biosphärenreservat');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderfestlegung_anderefestlegungnachstrassenrecht'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderfestlegung_anderefestlegungnachstrassenrecht AS ENUM 
	('1210', '1220', '1230', '1231', '1232', '1240', '1241', '1242', '1250', '1260', '1270', '1280');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderfestlegung_anderefestlegungnachstrassenrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderfestlegung_anderefestlegungnachstrassenrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderfestlegung_anderefestlegungnachstrassenrecht IS 'Alias: "enum_AX_ArtDerFestlegung_AndereFestlegungNachStrassenrecht"';
INSERT INTO enum_ax_artderfestlegung_anderefestlegungnachstrassenrecht (wert,beschreibung) VALUES 
('1210', 'Bundesfernstraßengesetz'),
('1220', 'Anbauverbot'),
('1230', 'Anbauverbot nach Bundesfernstraßengesetz'),
('1231', 'Anbauverbot (40m)'),
('1232', 'Anbauverbot (20m)'),
('1240', 'Anbaubeschränkung'),
('1241', 'Anbaubeschränkung (100m)'),
('1242', 'Anbaubeschränkung (40m)'),
('1250', 'Veränderungssperre nach Bundesfernstraßengesetz'),
('1260', 'Landesstraßengesetz'),
('1270', 'Anbauverbot nach Landesstraßengesetz'),
('1280', 'Veränderungssperre');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderfestlegung_schutzgebietnachwasserrecht'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderfestlegung_schutzgebietnachwasserrecht AS ENUM 
	('1510', '1520');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderfestlegung_schutzgebietnachwasserrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderfestlegung_schutzgebietnachwasserrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderfestlegung_schutzgebietnachwasserrecht IS 'Alias: "enum_AX_ArtDerFestlegung_SchutzgebietNachWasserrecht"';
INSERT INTO enum_ax_artderfestlegung_schutzgebietnachwasserrecht (wert,beschreibung) VALUES 
('1510', 'Wasserschutzgebiet'),
('1520', 'Heilquellenschutzgebiet');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_besonderefunktion_forstrecht'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_besonderefunktion_forstrecht AS ENUM 
	('1000', '1010', '2000', '2010', '3000', '3010', '4000', '4010', '5010', '6000', '6010', '7010', '8010', '9000', '9010', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_besonderefunktion_forstrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_besonderefunktion_forstrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_besonderefunktion_forstrecht IS 'Alias: "enum_AX_BesondereFunktion_Forstrecht"';
INSERT INTO enum_ax_besonderefunktion_forstrecht (wert,beschreibung) VALUES 
('1000', 'Ohne besondere gesetzliche Bindung'),
('1010', 'Ohne besondere gesetzliche Bindung nach LWaldG- Holzboden'),
('2000', 'Schutzwald'),
('2010', 'Schutzwald - Holzboden'),
('3000', 'Erholungswald'),
('3010', 'Erholungswald - Holzboden'),
('4000', 'Bannwald'),
('4010', 'Nationalpark - Holzboden'),
('5010', 'Naturschutzgebiet - Holzboden'),
('6000', 'Schutz- und Erholungswald'),
('6010', 'Schutz- und Erholungswald - Holzboden'),
('7010', 'Nationalpark - Nichtholzboden'),
('8010', 'Naturschutzgebiet - Nichtholzboden'),
('9000', 'Andere Forstbetriebsfläche'),
('9010', 'Nichtholzboden'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zone_schutzzone'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zone_schutzzone AS ENUM 
	('1010', '1020', '1030', '1031', '1032', '1040', '1060', '1070', '1080', '1090', '9997');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zone_schutzzone (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zone_schutzzone_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zone_schutzzone IS 'Alias: "enum_AX_Zone_Schutzzone"';
INSERT INTO enum_ax_zone_schutzzone (wert,beschreibung) VALUES 
('1010', 'Zone I'),
('1020', 'Zone II'),
('1030', 'Zone III'),
('1031', 'Zone IIIa'),
('1032', 'Zone IIIb'),
('1040', 'Zone IV'),
('1060', 'Kernzone'),
('1070', 'Pflegezone'),
('1080', 'Entwicklungszone'),
('1090', 'Regenerationszone'),
('9997', 'Attribut trifft nicht zu');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderfestlegung_klassifizierungnachstrassenrecht'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderfestlegung_klassifizierungnachstrassenrecht AS ENUM 
	('1100', '1110', '1120', '1130', '1140', '1150', '1160', '1170', '1180', '1190');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderfestlegung_klassifizierungnachstrassenrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderfestlegung_klassifizierungnachstrassenrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderfestlegung_klassifizierungnachstrassenrecht IS 'Alias: "enum_AX_ArtDerFestlegung_KlassifizierungNachStrassenrecht"';
INSERT INTO enum_ax_artderfestlegung_klassifizierungnachstrassenrecht (wert,beschreibung) VALUES 
('1100', 'Klassifizierung nach Bundes- oder Landesstraßengesetz'),
('1110', 'Bundesautobahn'),
('1120', 'Bundesstraße'),
('1130', 'Landes- oder Staatsstraße'),
('1140', 'Kreisstraße'),
('1150', 'Gemeindestraße'),
('1160', 'Ortsstraße'),
('1170', 'Gemeindeverbindungsstraße'),
('1180', 'Sonstige öffentliche Straße'),
('1190', 'Privatstraße');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderfestlegung_denkmalschutzrecht'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderfestlegung_denkmalschutzrecht AS ENUM 
	('2700', '2710', '2711', '2712', '2713', '2800', '2810', '2820', '2900', '2910', '2920', '2930', '3100', '3110', '3111', '3112', '3113', '3114', '3115', '3116', '3117', '3118', '3120', '3121', '3122', '3130', '3131', '3132', '3133', '3134', '3135', '3200', '3210', '3220', '3230', '3240', '3250', '3300', '3310', '3320', '3330', '3340', '3350', '3360', '3400', '3410', '3420', '3430', '3440', '3500', '3510', '3520', '3530', '3540', '3600', '3610', '3620', '3630', '3640', '3700', '3710', '3720', '3730', '3740', '3750', '3800', '3810', '3820', '3830', '3840', '3850', '3860');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderfestlegung_denkmalschutzrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderfestlegung_denkmalschutzrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderfestlegung_denkmalschutzrecht IS 'Alias: "enum_AX_ArtDerFestlegung_Denkmalschutzrecht"';
INSERT INTO enum_ax_artderfestlegung_denkmalschutzrecht (wert,beschreibung) VALUES 
('2700', 'Kulturdenkmal'),
('2710', 'Bau- und Kunstdenkmal nach Landesdenkmalschutzgesetz'),
('2711', 'Baudenkmal'),
('2712', 'Kunstdenkmal'),
('2713', 'Gartendenkmal'),
('2800', 'Archäologisches Denkmal (auch Bodendenkmal) nach Landesdenkmalschutzgesetz'),
('2810', 'Archäologisches Denkmal'),
('2820', 'Bodendenkmal'),
('2900', 'Schutzgebiet oder -bereiche nach Landesdenkmalschutzgesetz'),
('2910', 'Denkmalzone oder -bereich'),
('2920', 'Geschützter Baubereich'),
('2930', 'Grabungsschutzgebiet'),
('3100', 'Befestigungen'),
('3110', 'Befestigung (Burg)'),
('3111', 'Burg (Fliehburg, Ringwall)'),
('3112', 'Erdwerk'),
('3113', 'Ringwall'),
('3114', 'Steinwerk'),
('3115', 'Festung'),
('3116', 'Gräftenanlage'),
('3117', 'Schanze'),
('3118', 'Lager'),
('3120', 'Wachturm (römisch), Warte'),
('3121', 'Wachturm'),
('3122', 'Warte'),
('3130', 'Befestigung (Wall, Graben)'),
('3131', 'Grenzwall, Schutzwall'),
('3132', 'Limes'),
('3133', 'Landwehr'),
('3134', 'Stadtwall'),
('3135', 'Historischer Wall'),
('3200', 'Historische Siedlung'),
('3210', 'Pfahlbau'),
('3220', 'Wüstung'),
('3230', 'Wurt'),
('3240', 'Abri'),
('3250', 'Höhle'),
('3300', 'Historische Bestattung'),
('3310', 'Großsteingrab (Dolmen, Hünenbett)'),
('3320', 'Grabhügel (Hügelgrab)'),
('3330', 'Grabhügelfeld'),
('3340', 'Urnenfriedhof'),
('3350', 'Körpergräberfeld'),
('3360', 'Reihengräberfriedhof'),
('3400', 'Historisches land- oder forstwirtschaftliches Objekt'),
('3410', 'Historischer Pflanzkamp'),
('3420', 'Historisches Viehgehege'),
('3430', 'Sandfang'),
('3440', 'Historisches Ackersystem'),
('3500', 'Historische Bergbau-, Verhüttungs- oder sonstige Produktionsstätte'),
('3510', 'Historisches Bergbaurelikt'),
('3520', 'Historischer Meiler'),
('3530', 'Historischer Ofen'),
('3540', 'Historischer Verhüttungsplatz'),
('3600', 'Historische Straße oder Weg'),
('3610', 'Heerstraße'),
('3620', 'Hohlweg'),
('3630', 'Moorweg'),
('3640', 'Wegespur'),
('3700', 'Historisches wasserwirtschaftliches Objekt'),
('3710', 'Historische Wasserleitung'),
('3720', 'Aquädukt'),
('3730', 'Historischer Deich'),
('3740', 'Historischer Damm'),
('3750', 'Historischer Graben'),
('3800', 'Steinmal'),
('3810', 'Schalenstein'),
('3820', 'Rillenstein'),
('3830', 'Wetzrillen'),
('3840', 'Kreuzstein'),
('3850', 'Historischer Grenzstein'),
('3860', 'Menhir');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderfestlegung_klassifizierungnachwasserrecht'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderfestlegung_klassifizierungnachwasserrecht AS ENUM 
	('1300', '1310', '1320', '1330', '1340');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderfestlegung_klassifizierungnachwasserrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderfestlegung_klassifizierungnachwasserrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderfestlegung_klassifizierungnachwasserrecht IS 'Alias: "enum_AX_ArtDerFestlegung_KlassifizierungNachWasserrecht"';
INSERT INTO enum_ax_artderfestlegung_klassifizierungnachwasserrecht (wert,beschreibung) VALUES 
('1300', 'Klassifizierung nach Bundes- oder Landeswassergesetz'),
('1310', 'Gewässer I. Ordnung - Bundeswasserstraße'),
('1320', 'Gewässer I. Ordnung - nach Landesrecht'),
('1330', 'Gewässer II. Ordnung'),
('1340', 'Gewässer III. Ordnung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_rechtszustand_schutzzone'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_rechtszustand_schutzzone AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_rechtszustand_schutzzone (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_rechtszustand_schutzzone_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_rechtszustand_schutzzone IS 'Alias: "enum_AX_Rechtszustand_Schutzzone"';
INSERT INTO enum_ax_rechtszustand_schutzzone (wert,beschreibung) VALUES 
('1000', 'Amtlich festgestellt'),
('2000', 'Im Verfahren befindlich'),
('3000', 'In Planung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderfestlegung_bauraumoderbodenordnungsrecht'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderfestlegung_bauraumoderbodenordnungsrecht AS ENUM 
	('1700', '1710', '1720', '1730', '1740', '1750', '1760', '1770', '1780', '1790', '1800', '1810', '1811', '1820', '1821', '1822', '1823', '1824', '1830', '1840', '1841', '1900', '2100', '2110', '2120', '2130', '2140', '2150', '2160', '2170', '2180', '2200', '2210', '2220', '2230', '2240', '2300', '2310', '2320', '2330', '2340', '2400', '2410', '2411', '2412', '2500', '2510', '2600', '2610', '2611', '2612', '2700', '2800');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderfestlegung_bauraumoderbodenordnungsrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderfestlegung_bauraumoderbodenordnungsrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderfestlegung_bauraumoderbodenordnungsrecht IS 'Alias: "enum_AX_ArtDerFestlegung_BauRaumOderBodenordnungsrecht"';
INSERT INTO enum_ax_artderfestlegung_bauraumoderbodenordnungsrecht (wert,beschreibung) VALUES 
('1700', 'Festlegung nach Baugesetzbuch - Allgemeines Städtebaurecht'),
('1710', 'Bebauungsplan'),
('1720', 'Veränderungssperre nach Baugesetzbuch'),
('1730', 'Vorkaufrechtssatzung'),
('1740', 'Enteignungsverfahren'),
('1750', 'Umlegung nach dem BauGB'),
('1760', 'Bauland'),
('1770', 'Vereinfachte Umlegung'),
('1780', 'Vorhaben- und Erschließungsplan'),
('1790', 'Flächennutzungsplan'),
('1800', 'Festlegung nach Baugesetzbuch - Besonderes Städtebaurecht'),
('1810', 'Städtebauliche Entwicklungsmaßnahme'),
('1811', 'Städtebauliche Entwicklungsmaßnahme (Beschluss zu vorbereitenden Untersuchungen gefasst)'),
('1820', 'Erhaltungssatzung'),
('1821', 'Städtebauliches Erhaltungsgebiet'),
('1822', 'Soziales Erhaltungsgebiet'),
('1823', 'Erhaltungsgebiet zur städtebaulichen Umstrukturierung'),
('1824', 'Soziales Erhaltungsgebiet (Aufstellungsbeschluss gefasst)'),
('1830', 'Städtebauliche Gebote'),
('1840', 'Sanierung'),
('1841', 'Sanierung (Beschluss zu vorbereitenden Untersuchungen gefasst)'),
('1900', 'Wohnungsbauerleichterungsgesetz'),
('2100', 'Flurbereinigungsgesetz'),
('2110', 'Flurbereinigung (Par. 1, 37 FlurbG)'),
('2120', 'Vereinfachtes Flurbereinigungsverfahren (Par. 86 FlurbG)'),
('2130', 'Unternehmensflurbereinigung (nach Par. 87 oder 90 FlurbG)'),
('2140', 'Beschleunigtes Zusammenlegungsverfahren (Par. 91 FlurbG)'),
('2150', 'Freiwilliger Landtausch (Par. 103a FlurbG)'),
('2160', 'Verfahren nach dem Gemeinheitsteilungsgesetz'),
('2170', 'Verfahren nach dem Gemeinschaftswaldgesetz'),
('2180', 'Freiwilliger Nutzungstausch'),
('2200', 'Verfahren nach dem Landwirtschaftsanpassungsgesetz'),
('2210', 'Flurneuordnung'),
('2220', 'Freiwilliger Landtausch (Par. 54 LwAnpG)'),
('2230', 'Bodenordnungsverfahren (Par. 56 LwAnpG)'),
('2240', 'Zusammenführung von Boden- und Gebäudeeigentum (Par. 64 LwAnpG)'),
('2300', 'Bodensonderungsgesetz'),
('2310', 'Unvermessenes Eigentum'),
('2320', 'Unvermessenes Nutzungsrecht'),
('2330', 'Ergänzende Bodenneuordnung'),
('2340', 'Komplexe Bodenneuordnung'),
('2400', 'Vermögenszuordnungsgesetz'),
('2410', 'Vermögenszuordnung nach Plan'),
('2411', 'Vermögenszuordnung nach dem Aufteilungsplan'),
('2412', 'Vermögenszuordnung nach dem Zuordnungsplan'),
('2500', 'Landesraumordnungsgesetz'),
('2510', 'Wasservorranggebiete'),
('2600', 'Bauordnung'),
('2610', 'Baulast'),
('2611', 'Begünstigende Baulast'),
('2612', 'Belastende Baulast'),
('2700', 'Grenzfeststellungsverfahren nach Hamb. Wassergesetz'),
('2800', 'Verkehrsflächenbereinigung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderfestlegung_anderefestlegungnachwasserrecht'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderfestlegung_anderefestlegungnachwasserrecht AS ENUM 
	('1410', '1420', '1421', '1430', '1440', '1441', '1442', '1450', '1460', '1470', '1480');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderfestlegung_anderefestlegungnachwasserrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderfestlegung_anderefestlegungnachwasserrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderfestlegung_anderefestlegungnachwasserrecht IS 'Alias: "enum_AX_ArtDerFestlegung_AndereFestlegungNachWasserrecht"';
INSERT INTO enum_ax_artderfestlegung_anderefestlegungnachwasserrecht (wert,beschreibung) VALUES 
('1410', 'Wasserstraßengesetz'),
('1420', 'Veränderungssperre'),
('1421', 'Veränderungssperre nach Bundeswasserstraßengesetz'),
('1430', 'Landeswassergesetz'),
('1440', 'Überschwemmungsgebiet'),
('1441', 'Festgesetztes Überschwemmungsgebiet'),
('1442', 'Natürliches Überschwemmungsgebiet'),
('1450', 'Pegelschutzgebiet'),
('1460', 'Wasser- und Bodenverbandsgebiet'),
('1470', 'Deichgebiet'),
('1480', 'Unterhaltungsverbandsgebiet');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderfestlegung_forstrecht'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderfestlegung_forstrecht AS ENUM 
	('3900', '3910', '3920', '3930', '3940', '3950', '3960', '3970', '3980', '3990');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderfestlegung_forstrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderfestlegung_forstrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderfestlegung_forstrecht IS 'Alias: "enum_AX_ArtDerFestlegung_Forstrecht"';
INSERT INTO enum_ax_artderfestlegung_forstrecht (wert,beschreibung) VALUES 
('3900', 'Klassifizierung nach Bundes- oder Landeswaldgesetz'),
('3910', 'Staatswald Bund'),
('3920', 'Staatswald Land'),
('3930', 'Kommunalwald'),
('3940', 'Anstalts- und Stiftungswald'),
('3950', 'Anderer öffentlicher Wald'),
('3960', 'Privater Gemeinschaftswald'),
('3970', 'Großprivatwald'),
('3980', 'Kleinprivatwald'),
('3990', 'Anderer Privatwald');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_naturumweltoderbodenschutzrecht'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_naturumweltoderbodenschutzrecht AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_naturumweltoderbodenschutzrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_naturumweltoderbodenschutzrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_naturumweltoderbodenschutzrecht IS 'Alias: "enum_AX_Zustand_NaturUmweltOderBodenschutzrecht"';
INSERT INTO enum_ax_zustand_naturumweltoderbodenschutzrecht (wert,beschreibung) VALUES 
('1000', 'Amtlich festgestellt'),
('2000', 'Einstweilig sicher gestellt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderfestlegung_sonstigesrecht'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderfestlegung_sonstigesrecht AS ENUM 
	('4100', '4110', '4120', '4200', '4210', '4300', '4301', '4302', '4310', '4400', '4410', '4500', '4510', '4600', '4610', '4710', '4720', '4800', '4810', '4811', '4812', '4813', '4814', '4815', '4820', '4830', '4900', '5100', '5200', '5300', '5400', '5500', '5600', '5700', '5710', '5720', '6000', '7000', '7100', '7200', '7300', '8000', '9100', '9200', '9300', '9400', '9450', '9500', '9600', '9700', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderfestlegung_sonstigesrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderfestlegung_sonstigesrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderfestlegung_sonstigesrecht IS 'Alias: "enum_AX_ArtDerFestlegung_SonstigesRecht"';
INSERT INTO enum_ax_artderfestlegung_sonstigesrecht (wert,beschreibung) VALUES 
('4100', 'Luftverkehrsgesetz'),
('4110', 'Bauschutzbereich'),
('4120', 'Beschränkter Bauschutzbereich'),
('4200', 'Bundeskleingartengesetz'),
('4210', 'Dauerkleingarten'),
('4300', 'Berggesetz'),
('4301', 'Bodenbewegungsgebiet'),
('4302', 'Bruchfeld'),
('4310', 'Baubeschränkung'),
('4400', 'Reichsheimstättengesetz'),
('4410', 'Reichsheimstätte'),
('4500', 'Schutzbereichsgesetz'),
('4510', 'Schutzbereich'),
('4600', 'Eisenbahnneuordnungsgesetz'),
('4610', 'Übergabebescheidverfahren'),
('4710', 'Baubeschränkungen durch Richtfunkverbindungen'),
('4720', 'Truppenübungsplatz, Standortübungsplatz'),
('4800', 'Vermessungs- und Katasterrecht'),
('4810', 'Schutzfläche Festpunkt'),
('4811', 'Schutzfläche Festpunkt, 1 m Radius'),
('4812', 'Schutzfläche Festpunkt, 2 m Radius'),
('4813', 'Schutzfläche Festpunkt, 5 m Radius'),
('4814', 'Schutzfläche Festpunkt, 10 m Radius'),
('4815', 'Schutzfläche Festpunkt, 30 m Radius'),
('4820', 'Marksteinschutzfläche'),
('4830', 'Liegenschaftskatastererneuerung'),
('4900', 'Fischereirecht'),
('5100', 'Jagdkataster'),
('5200', 'Landesgrundbesitzkataster'),
('5300', 'Bombenblindgängerverdacht'),
('5400', 'Rieselfeld'),
('5500', 'Sicherungsstreifen'),
('5600', 'Grenzbereinigung'),
('5700', 'Hochwasserdeich'),
('5710', 'Hauptdeich, 1. Deichlinie'),
('5720', '2. Deichlinie'),
('6000', 'Beregnungsverband'),
('7000', 'Weinlage'),
('7100', 'Weinbausteillage'),
('7200', 'Weinbergsrolle'),
('7300', 'Weinbausteilstlage'),
('8000', 'Benachteiligtes landwirtschaftliches Gebiet'),
('9100', 'Mitverwendung Hochwasserschutz, Oberirdische Anlagen'),
('9200', 'Mitverwendung Hochwasserschutz, Unterirdische Anlagen'),
('9300', 'Hafennutzungsgebiet'),
('9400', 'Hafenerweiterungsgebiet'),
('9450', 'Hafenbecken'),
('9500', 'Bohrung verfüllt'),
('9600', 'Zollgrenze'),
('9700', 'Belastung nach §7 Abs. 2 GBO'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderfestlegung_naturumweltoderbodenschutzrecht'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderfestlegung_naturumweltoderbodenschutzrecht AS ENUM 
	('1610', '1611', '1612', '1620', '1621', '1622', '1623', '1624', '1630', '1631', '1632', '1633', '1634', '1640', '1641', '1642', '1643', '1650', '1651', '1652', '1653', '1654', '1655', '1656', '1660', '1661', '1662');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderfestlegung_naturumweltoderbodenschutzrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderfestlegung_naturumweltoderbodenschutzrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderfestlegung_naturumweltoderbodenschutzrecht IS 'Alias: "enum_AX_ArtDerFestlegung_NaturUmweltOderBodenschutzrecht"';
INSERT INTO enum_ax_artderfestlegung_naturumweltoderbodenschutzrecht (wert,beschreibung) VALUES 
('1610', 'Schutzfläche nach Europarecht'),
('1611', 'Flora-Fauna-Habitat-Gebiet'),
('1612', 'Vogelschutzgebiet'),
('1620', 'Schutzflächen nach Landesnaturschutzgesetz'),
('1621', 'Naturschutzgebiet'),
('1622', 'Geschützter Landschaftsbestandteil'),
('1623', 'Landschaftsschutzgebiet'),
('1624', 'Naturpark'),
('1630', 'Bundesbodenschutzgesetz'),
('1631', 'Verdachtsfläche auf schädliche Bodenveränderung'),
('1632', 'Schädliche Bodenveränderung'),
('1633', 'Altlastenverdächtige Fläche'),
('1634', 'Altlast'),
('1640', 'Bundesimmisionsschutzgesetz'),
('1641', 'Belastungsgebiet'),
('1642', 'Schutzbedürftiges Gebiet'),
('1643', 'Gefährdetes Gebiet'),
('1650', 'Naturschutzgesetz'),
('1651', 'Besonders geschütztes Biotop'),
('1652', 'Besonders geschütztes Feuchtgrünland'),
('1653', 'Naturdenkmal'),
('1654', 'Einstweilige Sicherstellung, Veränderungssperre'),
('1655', 'Vorkaufsrecht'),
('1656', 'Ausgleichs- oder Kompensationsfläche'),
('1660', 'Bodenschutzgesetz'),
('1661', 'Dauerbeobachtungsflächen'),
('1662', 'Bodenschutzgebiet');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_liniendarstellung_topographischelinie'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_liniendarstellung_topographischelinie AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_liniendarstellung_topographischelinie (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_liniendarstellung_topographischelinie_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_liniendarstellung_topographischelinie IS 'Alias: "enum_AX_Liniendarstellung_TopographischeLinie"';
INSERT INTO enum_ax_liniendarstellung_topographischelinie (wert,beschreibung) VALUES 
('1000', 'Durchgezogen'),
('2000', 'Lang gestrichelt'),
('3000', 'Kurz gestrichelt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_darstellung_gebaeudeausgestaltung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_darstellung_gebaeudeausgestaltung AS ENUM 
	('0251', '0252', '1011', '1012', '1013', '1014', '1016', '1041', '1042', '1043', '1044', '1045', '1046', '1047', '1048');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_darstellung_gebaeudeausgestaltung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_darstellung_gebaeudeausgestaltung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_darstellung_gebaeudeausgestaltung IS 'Alias: "enum_AX_Darstellung_Gebaeudeausgestaltung"';
INSERT INTO enum_ax_darstellung_gebaeudeausgestaltung (wert,beschreibung) VALUES 
('0251', 'Topographische Begrenzungslinie'),
('0252', 'Überdeckte topographische Begrenzungslinie'),
('1011', 'Hochhausbegrenzungslinie'),
('1012', 'Begrenzungslinie eines öffentlichen Gebäudes'),
('1013', 'Begrenzungslinie eines nicht öffentlichen Gebäudes'),
('1014', 'Offene Begrenzungslinie eines Gebäudes'),
('1016', 'Begrenzungslinie eines unterirdischen Gebäudes'),
('1041', 'Durchfahrt im Gebäude'),
('1042', 'Durchfahrt an überbauter Straße'),
('1043', 'Arkade'),
('1044', 'Freitreppe'),
('1045', 'Überdachung'),
('1046', 'Aufgeständertes Gebäude'),
('1047', 'Begrenzungslinie auskragendes Geschoss, aufgehendes Mauerwerk'),
('1048', 'Rampe');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_datenformat_benutzer'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_datenformat_benutzer AS ENUM 
	('1000', '2000', '3000', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_datenformat_benutzer (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_datenformat_benutzer_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_datenformat_benutzer IS 'Alias: "enum_AX_Datenformat_Benutzer"';
INSERT INTO enum_ax_datenformat_benutzer (wert,beschreibung) VALUES 
('1000', 'NAS'),
('2000', 'DXF'),
('3000', 'TIFF'),
('4000', 'GeoTIFF');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_bereichzeitlich'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_bereichzeitlich AS ENUM 
	('1000', '1100', '3000', '3100');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_bereichzeitlich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_bereichzeitlich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_bereichzeitlich IS 'Alias: "enum_AX_Art_BereichZeitlich"';
INSERT INTO enum_ax_art_bereichzeitlich (wert,beschreibung) VALUES 
('1000', 'Stichtagsbezogen ohne Historie'),
('1100', 'Stichtagsbezogen mit Historie'),
('3000', 'Fallbezogen ohne Historie'),
('3100', 'Fallbezogen mit Historie');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_letzteabgabeart'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_letzteabgabeart AS ENUM 
	('1000', '1100', '2000', '2100', '2200');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_letzteabgabeart (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_letzteabgabeart_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_letzteabgabeart IS 'Alias: "enum_AX_LetzteAbgabeArt"';
INSERT INTO enum_ax_letzteabgabeart (wert,beschreibung) VALUES 
('1000', 'Zeitintervall'),
('1100', 'NBA auf Abruf'),
('2000', 'Wiederholungslauf'),
('2100', 'Aufholungslauf auf Abruf'),
('2200', 'Aufholungslauf bis Intervallende');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_ausgabemedium_benutzer'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_ausgabemedium_benutzer AS ENUM 
	('1000', '2000', '3000', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_ausgabemedium_benutzer (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_ausgabemedium_benutzer_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_ausgabemedium_benutzer IS 'Alias: "enum_AX_Ausgabemedium_Benutzer"';
INSERT INTO enum_ax_ausgabemedium_benutzer (wert,beschreibung) VALUES 
('1000', 'Analog'),
('2000', 'CD-R'),
('3000', 'DVD'),
('4000', 'E-Mail');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_identifikation'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_identifikation AS ENUM 
	('5400', '5410');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_identifikation (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_identifikation_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_identifikation IS 'Alias: "enum_AX_Identifikation"';
INSERT INTO enum_ax_identifikation (wert,beschreibung) VALUES 
('5400', 'Sicher'),
('5410', 'Unsicher');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dqerfassungsmethodemarkantergelaendepunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_dqerfassungsmethodemarkantergelaendepunkt AS ENUM 
	('5000', '5010', '5020', '5030');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_dqerfassungsmethodemarkantergelaendepunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_dqerfassungsmethodemarkantergelaendepunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_dqerfassungsmethodemarkantergelaendepunkt IS 'Alias: "enum_AX_DQErfassungsmethodeMarkanterGelaendepunkt"';
INSERT INTO enum_ax_dqerfassungsmethodemarkantergelaendepunkt (wert,beschreibung) VALUES 
('5000', 'Terrestrische Aufnahme'),
('5010', 'Interaktive photogrammetrische Datenerfassung'),
('5020', 'Laserscanning'),
('5030', 'Digitalisierung analoger Vorlagen');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dqerfassungsmethodestrukturiertegelaendepunkte'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_dqerfassungsmethodestrukturiertegelaendepunkte AS ENUM 
	('5000', '5010', '5030');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_dqerfassungsmethodestrukturiertegelaendepunkte (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_dqerfassungsmethodestrukturiertegelaendepunkte_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_dqerfassungsmethodestrukturiertegelaendepunkte IS 'Alias: "enum_AX_DQErfassungsmethodeStrukturierteGelaendepunkte"';
INSERT INTO enum_ax_dqerfassungsmethodestrukturiertegelaendepunkte (wert,beschreibung) VALUES 
('5000', 'Terrestrische Aufnahme'),
('5010', 'Interaktive photogrammetrische Datenerfassung'),
('5030', 'Digitalisierung analoger Vorlagen');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dqerfassungsmethode'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_dqerfassungsmethode AS ENUM 
	('5000', '5010', '5020', '5030', '5040', '5050');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_dqerfassungsmethode (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_dqerfassungsmethode_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_dqerfassungsmethode IS 'Alias: "enum_AX_DQErfassungsmethode"';
INSERT INTO enum_ax_dqerfassungsmethode (wert,beschreibung) VALUES 
('5000', 'Terrestrische Aufnahme'),
('5010', 'Interaktive photogrammetrische Datenerfassung'),
('5020', 'Laserscanning'),
('5030', 'Digitalisierung analoger Vorlagen'),
('5040', 'Bildkorrelation'),
('5050', 'IfSAR');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_besonderebedeutung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_besonderebedeutung AS ENUM 
	('1600', '1610');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_besonderebedeutung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_besonderebedeutung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_besonderebedeutung IS 'Alias: "enum_AX_BesondereBedeutung"';
INSERT INTO enum_ax_besonderebedeutung (wert,beschreibung) VALUES 
('1600', 'Höhenpunkt auf Wasserfläche'),
('1610', 'Wegepunkt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dqerfassungsmethodebesondererhoehenpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_dqerfassungsmethodebesondererhoehenpunkt AS ENUM 
	('5000', '5010', '5020', '5030', '5060');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_dqerfassungsmethodebesondererhoehenpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_dqerfassungsmethodebesondererhoehenpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_dqerfassungsmethodebesondererhoehenpunkt IS 'Alias: "enum_AX_DQErfassungsmethodeBesondererHoehenpunkt"';
INSERT INTO enum_ax_dqerfassungsmethodebesondererhoehenpunkt (wert,beschreibung) VALUES 
('5000', 'Terrestrische Aufnahme'),
('5010', 'Interaktive photogrammetrische Aufnahme'),
('5020', 'Laserscanning'),
('5030', 'Digitalisierung analoger Vorlagen'),
('5060', 'Amtliche Festlegung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artdergeripplinie'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artdergeripplinie AS ENUM 
	('1300', '1310', '1320');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artdergeripplinie (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artdergeripplinie_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artdergeripplinie IS 'Alias: "enum_AX_ArtDerGeripplinie"';
INSERT INTO enum_ax_artdergeripplinie (wert,beschreibung) VALUES 
('1300', 'Muldenlinie'),
('1310', 'Wasserführende Muldenlinie'),
('1320', 'Rückenlinie');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artdergelaendekante'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artdergelaendekante AS ENUM 
	('1200', '1210', '1220', '1230', '1240');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artdergelaendekante (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artdergelaendekante_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artdergelaendekante IS 'Alias: "enum_AX_ArtDerGelaendekante"';
INSERT INTO enum_ax_artdergelaendekante (wert,beschreibung) VALUES 
('1200', 'Allgemeine Geländekante'),
('1210', 'Steilrand, Kliffkante'),
('1220', 'Böschungsoberkante'),
('1230', 'Böschungsunterkante'),
('1240', 'Sonstige Begrenzungskante');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderstrukturierung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderstrukturierung AS ENUM 
	('1700', '1710');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderstrukturierung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderstrukturierung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderstrukturierung IS 'Alias: "enum_AX_ArtDerStrukturierung"';
INSERT INTO enum_ax_artderstrukturierung (wert,beschreibung) VALUES 
('1700', 'Höhenlinien'),
('1710', 'Dynamisch gemessene Profile');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dqerfassungsmethodegewaesserbegrenzung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_dqerfassungsmethodegewaesserbegrenzung AS ENUM 
	('5000', '5010', '5020', '5030', '5040', '5050', '5060');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_dqerfassungsmethodegewaesserbegrenzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_dqerfassungsmethodegewaesserbegrenzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_dqerfassungsmethodegewaesserbegrenzung IS 'Alias: "enum_AX_DQErfassungsmethodeGewaesserbegrenzung"';
INSERT INTO enum_ax_dqerfassungsmethodegewaesserbegrenzung (wert,beschreibung) VALUES 
('5000', 'Terrestrische Aufnahme'),
('5010', 'Interaktive photogrammetrische Datenerfassung'),
('5020', 'Laserscanning'),
('5030', 'Digitalisierung analoger Vorlagen'),
('5040', 'Bildkorrelation'),
('5050', 'IfSAR'),
('5060', 'Amtliche Festlegung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artdernichtgelaendepunkte'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artdernichtgelaendepunkte AS ENUM 
	('1000', '1010', '1020');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artdernichtgelaendepunkte (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artdernichtgelaendepunkte_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artdernichtgelaendepunkte IS 'Alias: "enum_AX_ArtDerNichtGelaendepunkte"';
INSERT INTO enum_ax_artdernichtgelaendepunkte (wert,beschreibung) VALUES 
('1000', 'Brückenpunkte'),
('1010', 'Gebäudepunkte'),
('1020', 'Vegetationspunkte');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artdesmarkantengelaendepunktes'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artdesmarkantengelaendepunktes AS ENUM 
	('1400', '1410', '1420');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artdesmarkantengelaendepunktes (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artdesmarkantengelaendepunktes_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artdesmarkantengelaendepunktes IS 'Alias: "enum_AX_ArtDesMarkantenGelaendepunktes"';
INSERT INTO enum_ax_artdesmarkantengelaendepunktes (wert,beschreibung) VALUES 
('1400', 'Kuppenpunkt'),
('1410', 'Kesselpunkt'),
('1420', 'Sattelpunkt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderaussparung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderaussparung AS ENUM 
	('1500', '1510');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderaussparung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderaussparung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderaussparung IS 'Alias: "enum_AX_ArtDerAussparung"';
INSERT INTO enum_ax_artderaussparung (wert,beschreibung) VALUES 
('1500', 'DGM-Aussparung'),
('1510', 'Kartographische Aussparung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_besondereartdergewaesserbegrenzung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_besondereartdergewaesserbegrenzung AS ENUM 
	('1350');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_besondereartdergewaesserbegrenzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_besondereartdergewaesserbegrenzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_besondereartdergewaesserbegrenzung IS 'Alias: "enum_AX_BesondereArtDerGewaesserbegrenzung"';
INSERT INTO enum_ax_besondereartdergewaesserbegrenzung (wert,beschreibung) VALUES 
('1350', 'Gleichzeitig Böschungsunterkante');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_ursprung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_ursprung AS ENUM 
	('1100', '1110');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_ursprung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_ursprung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_ursprung IS 'Alias: "enum_AX_Ursprung"';
INSERT INTO enum_ax_ursprung (wert,beschreibung) VALUES 
('1100', 'Natürlich entstanden'),
('1110', 'Künstlich entstanden');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_dammwalldeich'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_dammwalldeich AS ENUM 
	('3001', '3002', '3003', '3004');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_dammwalldeich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_dammwalldeich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_dammwalldeich IS 'Alias: "enum_AX_Funktion_DammWallDeich"';
INSERT INTO enum_ax_funktion_dammwalldeich (wert,beschreibung) VALUES 
('3001', 'Hochwasserschutz, Sturmflutschutz'),
('3002', 'Verkehrsführung'),
('3003', 'Hochwasserschutz, Sturmflutschutz zugleich Verkehrsführung'),
('3004', 'Lärmschutz');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_dammwalldeich'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_dammwalldeich AS ENUM 
	('1910', '1920', '1930', '1940', '1950', '1960', '1970', '1980', '1990', '1991', '1992', '1993', '2000', '2001', '2002', '2003', '2010', '2011', '2012', '2013');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_dammwalldeich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_dammwalldeich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_dammwalldeich IS 'Alias: "enum_AX_Art_DammWallDeich"';
INSERT INTO enum_ax_art_dammwalldeich (wert,beschreibung) VALUES 
('1910', 'Hochwasserdeich'),
('1920', 'Hauptdeich, Landesschutzdeich'),
('1930', 'Überlaufdeich'),
('1940', 'Leitdeich'),
('1950', 'Polderdeich'),
('1960', 'Schlafdeich'),
('1970', 'Mitteldeich'),
('1980', 'Binnendeich'),
('1990', 'Wall'),
('1991', 'Wallkante, rechts'),
('1992', 'Wallkante, links'),
('1993', 'Wallmitte'),
('2000', 'Knick'),
('2001', 'Knickkante, rechts'),
('2002', 'Knickkante, links'),
('2003', 'Knickmitte'),
('2010', 'Graben mit Wall, rechts'),
('2011', 'Graben mit Wall, links'),
('2012', 'Graben mit Knick, rechts'),
('2013', 'Graben mit Knick, links');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_einschnitt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_einschnitt AS ENUM 
	('3002');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_einschnitt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_einschnitt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_einschnitt IS 'Alias: "enum_AX_Funktion_Einschnitt"';
INSERT INTO enum_ax_funktion_einschnitt (wert,beschreibung) VALUES 
('3002', 'Verkehrsführung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_boeschungkliff'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_boeschungkliff AS ENUM 
	('2400', '2500');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_boeschungkliff (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_boeschungkliff_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_boeschungkliff IS 'Alias: "enum_AX_Zustand_BoeschungKliff"';
INSERT INTO enum_ax_zustand_boeschungkliff (wert,beschreibung) VALUES 
('2400', 'Befestigt'),
('2500', 'Unbefestigt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_hoehleneingang'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_hoehleneingang AS ENUM 
	('2200', '4100', '4200');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_hoehleneingang (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_hoehleneingang_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_hoehleneingang IS 'Alias: "enum_AX_Zustand_Hoehleneingang"';
INSERT INTO enum_ax_zustand_hoehleneingang (wert,beschreibung) VALUES 
('2200', 'Verfallen, zerstört'),
('4100', 'Offen'),
('4200', 'Verschlossen');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_berechnungsmethode'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_berechnungsmethode AS ENUM 
	('5300', '5310', '5320', '5330', '5340', '5350', '5360');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_berechnungsmethode (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_berechnungsmethode_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_berechnungsmethode IS 'Alias: "enum_AX_Berechnungsmethode"';
INSERT INTO enum_ax_berechnungsmethode (wert,beschreibung) VALUES 
('5300', 'Einfache Mittelbildung'),
('5310', 'Gewichtete Mittelbildung'),
('5320', 'Gleitende Schrägebene'),
('5330', 'Prädiktion'),
('5340', 'Polynomasatz'),
('5350', 'Finite Elemente'),
('5360', 'Dreiecksvermaschung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_verwendeteobjekte'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_verwendeteobjekte AS ENUM 
	('5111', '5121', '5122', '5123', '5124', '5131', '5211');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_verwendeteobjekte (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_verwendeteobjekte_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_verwendeteobjekte IS 'Alias: "enum_AX_VerwendeteObjekte"';
INSERT INTO enum_ax_verwendeteobjekte (wert,beschreibung) VALUES 
('5111', 'Geländepunkte'),
('5121', 'Geländekanten'),
('5122', 'Gewässerbegrenzung'),
('5123', 'Geripplinien'),
('5124', 'Markante Geländepunkte'),
('5131', 'Aussparungsflächen'),
('5211', 'DGM-Gitter');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_berechnungsmethodehoehenlinie'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_berechnungsmethodehoehenlinie AS ENUM 
	('5211', '5360');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_berechnungsmethodehoehenlinie (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_berechnungsmethodehoehenlinie_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_berechnungsmethodehoehenlinie IS 'Alias: "enum_AX_BerechnungsmethodeHoehenlinie"';
INSERT INTO enum_ax_berechnungsmethodehoehenlinie (wert,beschreibung) VALUES 
('5211', 'Aus sekundärem DGM-Gitter'),
('5360', 'Über Dreiecksvermaschung abgeleitet');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dqerfassungsmethodesekundaeresdgm'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_dqerfassungsmethodesekundaeresdgm AS ENUM 
	('5000', '5010', '5020', '5030', '5040', '5050', '5060');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_dqerfassungsmethodesekundaeresdgm (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_dqerfassungsmethodesekundaeresdgm_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_dqerfassungsmethodesekundaeresdgm IS 'Alias: "enum_AX_DQErfassungsmethodeSekundaeresDGM"';
INSERT INTO enum_ax_dqerfassungsmethodesekundaeresdgm (wert,beschreibung) VALUES 
('5000', 'Terrestrische Aufnahme'),
('5010', 'Interaktive photogrammetrische Aufnahme'),
('5020', 'Laserscanning'),
('5030', 'Digitalisierung analoger Vorlagen'),
('5040', 'Bildkorrelation'),
('5050', 'IfSAR'),
('5060', 'Amtliche Festlegung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_kanal'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_kanal AS ENUM 
	('2100', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_kanal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_kanal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_kanal IS 'Alias: "enum_AX_Zustand_Kanal"';
INSERT INTO enum_ax_zustand_kanal (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_stehendesgewaesser'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_stehendesgewaesser AS ENUM 
	('8620', '8630', '8610', '8631', '8640', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_stehendesgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_stehendesgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_stehendesgewaesser IS 'Alias: "enum_AX_Funktion_StehendesGewaesser"';
INSERT INTO enum_ax_funktion_stehendesgewaesser (wert,beschreibung) VALUES 
('8620', 'Teich'),
('8630', 'Stausee'),
('8610', 'See'),
('8631', 'Speicherbecken'),
('8640', 'Baggersee'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_schifffahrtskategorie'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_schifffahrtskategorie AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_schifffahrtskategorie (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_schifffahrtskategorie_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_schifffahrtskategorie IS 'Alias: "enum_AX_Schifffahrtskategorie"';
INSERT INTO enum_ax_schifffahrtskategorie (wert,beschreibung) VALUES 
('1000', 'Binnenwasserstraße'),
('2000', 'Seewasserstraße'),
('3000', 'Landesgewässer mit Verkehrsordnung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_hydrologischesmerkmal_fliessgewaesser'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_hydrologischesmerkmal_fliessgewaesser AS ENUM 
	('2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_hydrologischesmerkmal_fliessgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_hydrologischesmerkmal_fliessgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_hydrologischesmerkmal_fliessgewaesser IS 'Alias: "enum_AX_HydrologischesMerkmal_Fliessgewaesser"';
INSERT INTO enum_ax_hydrologischesmerkmal_fliessgewaesser (wert,beschreibung) VALUES 
('2000', 'Nicht ständig Wasser führend');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_schifffahrtskategorie_kanal'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_schifffahrtskategorie_kanal AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_schifffahrtskategorie_kanal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_schifffahrtskategorie_kanal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_schifffahrtskategorie_kanal IS 'Alias: "enum_AX_Schifffahrtskategorie_Kanal"';
INSERT INTO enum_ax_schifffahrtskategorie_kanal (wert,beschreibung) VALUES 
('1000', 'Binnenwasserstraße'),
('2000', 'Seewasserstraße'),
('3000', 'Landesgewässer mit Verkehrsordnung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_fliessgewaesser'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_fliessgewaesser AS ENUM 
	('8200', '8210', '8220', '8230', '8300', '8400', '8410', '8500');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_fliessgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_fliessgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_fliessgewaesser IS 'Alias: "enum_AX_Funktion_Fliessgewaesser"';
INSERT INTO enum_ax_funktion_fliessgewaesser (wert,beschreibung) VALUES 
('8200', 'Fluss'),
('8210', 'Altwasser'),
('8220', 'Altarm'),
('8230', 'Flussmündungstrichter'),
('8300', 'Kanal'),
('8400', 'Graben'),
('8410', 'Fleet'),
('8500', 'Bach');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_widmung_wasserlauf'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_widmung_wasserlauf AS ENUM 
	('1310', '1320', '1330', '1340');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_widmung_wasserlauf (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_widmung_wasserlauf_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_widmung_wasserlauf IS 'Alias: "enum_AX_Widmung_Wasserlauf"';
INSERT INTO enum_ax_widmung_wasserlauf (wert,beschreibung) VALUES 
('1310', 'Gewässer I. Ordnung - Bundeswasserstraße'),
('1320', 'Gewässer I. Ordnung - nach Landesrecht'),
('1330', 'Gewässer II. Ordnung'),
('1340', 'Gewässer III. Ordnung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_meer'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_meer AS ENUM 
	('8710');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_meer (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_meer_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_meer IS 'Alias: "enum_AX_Funktion_Meer"';
INSERT INTO enum_ax_funktion_meer (wert,beschreibung) VALUES 
('8710', 'Küstengewässer');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_hydrologischesmerkmal_gewaesserachse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_hydrologischesmerkmal_gewaesserachse AS ENUM 
	('2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_hydrologischesmerkmal_gewaesserachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_hydrologischesmerkmal_gewaesserachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_hydrologischesmerkmal_gewaesserachse IS 'Alias: "enum_AX_HydrologischesMerkmal_Gewaesserachse"';
INSERT INTO enum_ax_hydrologischesmerkmal_gewaesserachse (wert,beschreibung) VALUES 
('2000', 'Nicht ständig Wasser führend'),
('3000', 'Trocken, versiegt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_tidemerkmal_meer'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_tidemerkmal_meer AS ENUM 
	('1000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_tidemerkmal_meer (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_tidemerkmal_meer_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_tidemerkmal_meer IS 'Alias: "enum_AX_Tidemerkmal_Meer"';
INSERT INTO enum_ax_tidemerkmal_meer (wert,beschreibung) VALUES 
('1000', 'Mit Tideeinfluss');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_nutzung_hafenbecken'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_nutzung_hafenbecken AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_nutzung_hafenbecken (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_nutzung_hafenbecken_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_nutzung_hafenbecken IS 'Alias: "enum_AX_Nutzung_Hafenbecken"';
INSERT INTO enum_ax_nutzung_hafenbecken (wert,beschreibung) VALUES 
('1000', 'Zivil'),
('2000', 'Militärisch'),
('3000', 'Teils zivil, teils militärisch');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_hydrologischesmerkmal_stehendesgewaesser'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_hydrologischesmerkmal_stehendesgewaesser AS ENUM 
	('2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_hydrologischesmerkmal_stehendesgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_hydrologischesmerkmal_stehendesgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_hydrologischesmerkmal_stehendesgewaesser IS 'Alias: "enum_AX_HydrologischesMerkmal_StehendesGewaesser"';
INSERT INTO enum_ax_hydrologischesmerkmal_stehendesgewaesser (wert,beschreibung) VALUES 
('2000', 'Nicht ständig Wasser führend');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_widmung_stehendesgewaesser'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_widmung_stehendesgewaesser AS ENUM 
	('1310', '1320', '1330', '1340');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_widmung_stehendesgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_widmung_stehendesgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_widmung_stehendesgewaesser IS 'Alias: "enum_AX_Widmung_StehendesGewaesser"';
INSERT INTO enum_ax_widmung_stehendesgewaesser (wert,beschreibung) VALUES 
('1310', 'Gewässer I. Ordnung - Bundeswasserstraße'),
('1320', 'Gewässer I. Ordnung - nach Landesrecht'),
('1330', 'Gewässer II. Ordnung'),
('1340', 'Gewässer III. Ordnung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_gewaesserachse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_gewaesserachse AS ENUM 
	('8300');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_gewaesserachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_gewaesserachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_gewaesserachse IS 'Alias: "enum_AX_Funktion_Gewaesserachse"';
INSERT INTO enum_ax_funktion_gewaesserachse (wert,beschreibung) VALUES 
('8300', 'Kanal');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_hafenbecken'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_hafenbecken AS ENUM 
	('8810');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_hafenbecken (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_hafenbecken_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_hafenbecken IS 'Alias: "enum_AX_Funktion_Hafenbecken"';
INSERT INTO enum_ax_funktion_hafenbecken (wert,beschreibung) VALUES 
('8810', 'Sportboothafenbecken');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_widmung_kanal'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_widmung_kanal AS ENUM 
	('1310', '1320', '1330', '1340');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_widmung_kanal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_widmung_kanal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_widmung_kanal IS 'Alias: "enum_AX_Widmung_Kanal"';
INSERT INTO enum_ax_widmung_kanal (wert,beschreibung) VALUES 
('1310', 'Gewässer I. Ordnung - Bundeswasserstraße'),
('1320', 'Gewässer I. Ordnung - nach Landesrecht'),
('1330', 'Gewässer II. Ordnung'),
('1340', 'Gewässer III. Ordnung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_wohnbauflaeche'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_wohnbauflaeche AS ENUM 
	('2100', '8000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_wohnbauflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_wohnbauflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_wohnbauflaeche IS 'Alias: "enum_AX_Zustand_Wohnbauflaeche"';
INSERT INTO enum_ax_zustand_wohnbauflaeche (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderbebauung_wohnbauflaeche'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderbebauung_wohnbauflaeche AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderbebauung_wohnbauflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderbebauung_wohnbauflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderbebauung_wohnbauflaeche IS 'Alias: "enum_AX_ArtDerBebauung_Wohnbauflaeche"';
INSERT INTO enum_ax_artderbebauung_wohnbauflaeche (wert,beschreibung) VALUES 
('1000', 'Offen'),
('2000', 'Geschlossen');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_flaechebesondererfunktionalerpraegung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_flaechebesondererfunktionalerpraegung AS ENUM 
	('2100', '8000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_flaechebesondererfunktionalerpraegung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_flaechebesondererfunktionalerpraegung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_flaechebesondererfunktionalerpraegung IS 'Alias: "enum_AX_Zustand_FlaecheBesondererFunktionalerPraegung"';
INSERT INTO enum_ax_zustand_flaechebesondererfunktionalerpraegung (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_flaechegemischternutzung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_flaechegemischternutzung AS ENUM 
	('2100', '2110', '2120', '2130', '2140', '2150', '2160', '2700', '2710', '2720', '2730', '6800', '7600');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_flaechegemischternutzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_flaechegemischternutzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_flaechegemischternutzung IS 'Alias: "enum_AX_Funktion_FlaecheGemischterNutzung"';
INSERT INTO enum_ax_funktion_flaechegemischternutzung (wert,beschreibung) VALUES 
('2100', 'Gebäude- und Freifläche, Mischnutzung mit Wohnen'),
('2110', 'Wohnen mit Öffentlich'),
('2120', 'Wohnen mit Handel und Dienstleistungen'),
('2130', 'Wohnen mit Gewerbe und Industrie'),
('2140', 'Öffentlich mit Wohnen'),
('2150', 'Handel und Dienstleistungen mit Wohnen'),
('2160', 'Gewerbe und Industrie mit Wohnen'),
('2700', 'Gebäude- und Freifläche Land- und Forstwirtschaft'),
('2710', 'Wohnen'),
('2720', 'Betrieb'),
('2730', 'Wohnen und Betrieb'),
('6800', 'Landwirtschaftliche Betriebsfläche'),
('7600', 'Forstwirtschaftliche Betriebsfläche');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_foerdergut_industrieundgewerbeflaeche'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_foerdergut_industrieundgewerbeflaeche AS ENUM 
	('1000', '2000', '3000', '4000', '5000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_foerdergut_industrieundgewerbeflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_foerdergut_industrieundgewerbeflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_foerdergut_industrieundgewerbeflaeche IS 'Alias: "enum_AX_Foerdergut_IndustrieUndGewerbeflaeche"';
INSERT INTO enum_ax_foerdergut_industrieundgewerbeflaeche (wert,beschreibung) VALUES 
('1000', 'Erdöl'),
('2000', 'Erdgas'),
('3000', 'Sole, Lauge'),
('4000', 'Kohlensäure'),
('5000', 'Erdwärme');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderbebauung_flaechegemischternutzung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderbebauung_flaechegemischternutzung AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderbebauung_flaechegemischternutzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderbebauung_flaechegemischternutzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderbebauung_flaechegemischternutzung IS 'Alias: "enum_AX_ArtDerBebauung_FlaecheGemischterNutzung"';
INSERT INTO enum_ax_artderbebauung_flaechegemischternutzung (wert,beschreibung) VALUES 
('1000', 'Offen'),
('2000', 'Geschlossen');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_sportfreizeitunderholungsflaeche'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_sportfreizeitunderholungsflaeche AS ENUM 
	('2100', '8000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_sportfreizeitunderholungsflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_sportfreizeitunderholungsflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_sportfreizeitunderholungsflaeche IS 'Alias: "enum_AX_Zustand_SportFreizeitUndErholungsflaeche"';
INSERT INTO enum_ax_zustand_sportfreizeitunderholungsflaeche (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_flaechebesondererfunktionalerpraegung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_flaechebesondererfunktionalerpraegung AS ENUM 
	('1100', '1110', '1120', '1130', '1140', '1150', '1160', '1170', '1200', '1300', '1310', '1320');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_flaechebesondererfunktionalerpraegung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_flaechebesondererfunktionalerpraegung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_flaechebesondererfunktionalerpraegung IS 'Alias: "enum_AX_Funktion_FlaecheBesondererFunktionalerPraegung"';
INSERT INTO enum_ax_funktion_flaechebesondererfunktionalerpraegung (wert,beschreibung) VALUES 
('1100', 'Öffentliche Zwecke'),
('1110', 'Verwaltung'),
('1120', 'Bildung und Forschung'),
('1130', 'Kultur'),
('1140', 'Religiöse Einrichtung'),
('1150', 'Gesundheit, Kur'),
('1160', 'Soziales'),
('1170', 'Sicherheit und Ordnung'),
('1200', 'Parken'),
('1300', 'Historische Anlage'),
('1310', 'Burg-, Festungsanlage'),
('1320', 'Schlossanlage');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_sportfreizeitunderholungsflaeche'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_sportfreizeitunderholungsflaeche AS ENUM 
	('4100', '4001', '4101', '4110', '4120', '4130', '4140', '4150', '4160', '4170', '4200', '4210', '4211', '4220', '4230', '4240', '4250', '4260', '4270', '4280', '4290', '4300', '4301', '4310', '4320', '4321', '4330', '4331', '4400', '4410', '4420', '4430', '4431', '4440', '4450', '4460', '4470', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_sportfreizeitunderholungsflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_sportfreizeitunderholungsflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_sportfreizeitunderholungsflaeche IS 'Alias: "enum_AX_Funktion_SportFreizeitUndErholungsflaeche"';
INSERT INTO enum_ax_funktion_sportfreizeitunderholungsflaeche (wert,beschreibung) VALUES 
('4100', 'Sportanlage'),
('4001', 'Gebäude- und Freifläche Sport, Freizeit und Erholung'),
('4101', 'Gebäude- u. Freifläche Erholung, Sport'),
('4110', 'Golfplatz'),
('4120', 'Sportplatz'),
('4130', 'Rennbahn'),
('4140', 'Reitplatz'),
('4150', 'Schießanlage'),
('4160', 'Eis-, Rollschuhbahn'),
('4170', 'Tennisplatz'),
('4200', 'Freizeitanlage'),
('4210', 'Zoo'),
('4211', 'Gebäude- u. Freifläche Erholung, Zoologie'),
('4220', 'Safaripark, Wildpark'),
('4230', 'Freizeitpark'),
('4240', 'Freilichttheater'),
('4250', 'Freilichtmuseum'),
('4260', 'Autokino, Freilichtkino'),
('4270', 'Verkehrsübungsplatz'),
('4280', 'Hundeübungsplatz'),
('4290', 'Modellflugplatz'),
('4300', 'Erholungsfläche'),
('4301', 'Gebäude- und Freifläche Erholung'),
('4310', 'Wochenend- und Ferienhausfläche'),
('4320', 'Schwimmbad, Freibad'),
('4321', 'Gebäude- u. Freifläche Erholung, Bad'),
('4330', 'Campingplatz'),
('4331', 'Gebäude- u. Freifläche Erholung, Camping'),
('4400', 'Grünanlage'),
('4410', 'Grünfläche'),
('4420', 'Park'),
('4430', 'Botanischer Garten'),
('4431', 'Gebäude- u. Freifläche Erholung, Botanik'),
('4440', 'Kleingarten'),
('4450', 'Wochenendplatz'),
('4460', 'Garten'),
('4470', 'Spielplatz, Bolzplatz'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_lagergut_industrieundgewerbeflaeche'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_lagergut_industrieundgewerbeflaeche AS ENUM 
	('7000', '1000', '4000', '2000', '3000', '6000', '8000', '5000', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_lagergut_industrieundgewerbeflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_lagergut_industrieundgewerbeflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_lagergut_industrieundgewerbeflaeche IS 'Alias: "enum_AX_Lagergut_IndustrieUndGewerbeflaeche"';
INSERT INTO enum_ax_lagergut_industrieundgewerbeflaeche (wert,beschreibung) VALUES 
('7000', 'Abraum'),
('1000', 'Baustoffe'),
('4000', 'Erde'),
('2000', 'Kohle'),
('3000', 'Öl'),
('6000', 'Schlacke'),
('8000', 'Schrott, Altmaterial'),
('5000', 'Schutt'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_halde'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_halde AS ENUM 
	('2100', '8000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_halde (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_halde_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_halde IS 'Alias: "enum_AX_Zustand_Halde"';
INSERT INTO enum_ax_zustand_halde (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_bergbaubetrieb'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_bergbaubetrieb AS ENUM 
	('2100', '8000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_bergbaubetrieb (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_bergbaubetrieb_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_bergbaubetrieb IS 'Alias: "enum_AX_Zustand_Bergbaubetrieb"';
INSERT INTO enum_ax_zustand_bergbaubetrieb (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_abbaugut_tagebaugrubesteinbruch'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_abbaugut_tagebaugrubesteinbruch AS ENUM 
	('2011', '1000', '1001', '1002', '1003', '1004', '1005', '1006', '1007', '1008', '1009', '1011', '1012', '1013', '2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021', '4000', '4010', '4020', '4021', '4022', '4030', '5000', '5001', '5002', '5005', '5007', '5008', '5009', '5010', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_abbaugut_tagebaugrubesteinbruch (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_abbaugut_tagebaugrubesteinbruch_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_abbaugut_tagebaugrubesteinbruch IS 'Alias: "enum_AX_Abbaugut_TagebauGrubeSteinbruch"';
INSERT INTO enum_ax_abbaugut_tagebaugrubesteinbruch (wert,beschreibung) VALUES 
('2011', 'Quarzit'),
('1000', 'Erden, Lockergestein'),
('1001', 'Ton'),
('1002', 'Bentonit'),
('1003', 'Kaolin'),
('1004', 'Lehm'),
('1005', 'Löß, Lößlehm'),
('1006', 'Mergel'),
('1007', 'Kalk, Kalktuff, Kreide'),
('1008', 'Sand'),
('1009', 'Kies, Kiessand'),
('1011', 'Farberden'),
('1012', 'Quarzsand'),
('1013', 'Kieselerde'),
('2000', 'Steine, Gestein, Festgestein'),
('2001', 'Tonstein'),
('2002', 'Schiefer, Dachschiefer'),
('2003', 'Metamorpher Schiefer'),
('2004', 'Mergelstein'),
('2005', 'Kalkstein'),
('2006', 'Dolomitstein'),
('2007', 'Travertin'),
('2008', 'Marmor'),
('2009', 'Sandstein'),
('2010', 'Grauwacke'),
('2012', 'Gneis'),
('2013', 'Basalt, Diabas'),
('2014', 'Andesit'),
('2015', 'Porphyr, Quarzporphyr'),
('2016', 'Granit'),
('2017', 'Granodiorit'),
('2018', 'Tuff-, Bimsstein'),
('2019', 'Trass'),
('2020', 'Lavaschlacke'),
('2021', 'Talkschiefer, Speckstein'),
('4000', 'Treib- und Brennstoffe'),
('4010', 'Torf'),
('4020', 'Kohle'),
('4021', 'Braunkohle'),
('4022', 'Steinkohle'),
('4030', 'Ölschiefer'),
('5000', 'Industrieminerale, Salze'),
('5001', 'Gipsstein'),
('5002', 'Anhydritstein'),
('5005', 'Kalkspat'),
('5007', 'Schwerspat'),
('5008', 'Quarz'),
('5009', 'Feldspat'),
('5010', 'Pegmatitsand'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_primaerenergie_industrieundgewerbeflaeche'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_primaerenergie_industrieundgewerbeflaeche AS ENUM 
	('1000', '2000', '3000', '4000', '5000', '6000', '7000', '7100', '7200', '7300', '7400');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_primaerenergie_industrieundgewerbeflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_primaerenergie_industrieundgewerbeflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_primaerenergie_industrieundgewerbeflaeche IS 'Alias: "enum_AX_Primaerenergie_IndustrieUndGewerbeflaeche"';
INSERT INTO enum_ax_primaerenergie_industrieundgewerbeflaeche (wert,beschreibung) VALUES 
('1000', 'Wasser'),
('2000', 'Kernkraft'),
('3000', 'Sonne'),
('4000', 'Wind'),
('5000', 'Gezeiten'),
('6000', 'Erdwärme'),
('7000', 'Verbrennung'),
('7100', 'Kohle'),
('7200', 'Öl'),
('7300', 'Gas'),
('7400', 'Müll, Abfall');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_abbaugut_bergbaubetrieb'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_abbaugut_bergbaubetrieb AS ENUM 
	('1000', '1001', '1007', '2000', '2002', '2003', '2005', '2006', '2013', '2021', '3000', '3001', '3002', '3003', '3004', '3005', '3006', '3007', '3008', '3009', '3010', '3011', '4000', '4020', '4021', '4022', '4030', '5000', '5001', '5002', '5003', '5004', '5005', '5006', '5007', '5011');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_abbaugut_bergbaubetrieb (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_abbaugut_bergbaubetrieb_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_abbaugut_bergbaubetrieb IS 'Alias: "enum_AX_Abbaugut_Bergbaubetrieb"';
INSERT INTO enum_ax_abbaugut_bergbaubetrieb (wert,beschreibung) VALUES 
('1000', 'Erden, Lockergestein'),
('1001', 'Ton'),
('1007', 'Kalk, Kalktuff, Kreide'),
('2000', 'Steine, Gestein, Festgestein'),
('2002', 'Schiefer, Dachschiefer'),
('2003', 'Metamorpher Schiefer'),
('2005', 'Kalkstein'),
('2006', 'Dolomitstein'),
('2013', 'Basalt, Diabas'),
('2021', 'Talkschiefer, Speckstein'),
('3000', 'Erze'),
('3001', 'Eisen'),
('3002', 'Buntmetallerze'),
('3003', 'Kupfer'),
('3004', 'Blei'),
('3005', 'Zink'),
('3006', 'Zinn'),
('3007', 'Wismut, Kobalt, Nickel'),
('3008', 'Uran'),
('3009', 'Mangan'),
('3010', 'Antimon'),
('3011', 'Edelmetallerze'),
('4000', 'Treib- und Brennstoffe'),
('4020', 'Kohle'),
('4021', 'Braunkohle'),
('4022', 'Steinkohle'),
('4030', 'Ölschiefer'),
('5000', 'Industrieminerale, Salze'),
('5001', 'Gipsstein'),
('5002', 'Anhydritstein'),
('5003', 'Steinsalz'),
('5004', 'Kalisalz'),
('5005', 'Kalkspat'),
('5006', 'Flussspat'),
('5007', 'Schwerspat'),
('5011', 'Graphit');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_flaechegemischternutzung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_flaechegemischternutzung AS ENUM 
	('2100', '8000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_flaechegemischternutzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_flaechegemischternutzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_flaechegemischternutzung IS 'Alias: "enum_AX_Zustand_FlaecheGemischterNutzung"';
INSERT INTO enum_ax_zustand_flaechegemischternutzung (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_industrieundgewerbeflaeche'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_industrieundgewerbeflaeche AS ENUM 
	('2100', '8000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_industrieundgewerbeflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_industrieundgewerbeflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_industrieundgewerbeflaeche IS 'Alias: "enum_AX_Zustand_IndustrieUndGewerbeflaeche"';
INSERT INTO enum_ax_zustand_industrieundgewerbeflaeche (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_friedhof'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_friedhof AS ENUM 
	('9401', '9402', '9403', '9404');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_friedhof (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_friedhof_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_friedhof IS 'Alias: "enum_AX_Funktion_Friedhof"';
INSERT INTO enum_ax_funktion_friedhof (wert,beschreibung) VALUES 
('9401', 'Gebäude- und Freifläche Friedhof'),
('9402', 'Friedhof (ohne Gebäude)'),
('9403', 'Friedhof (Park)'),
('9404', 'Historischer Friedhof');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_friedhof'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_friedhof AS ENUM 
	('2100', '8000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_friedhof (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_friedhof_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_friedhof IS 'Alias: "enum_AX_Zustand_Friedhof"';
INSERT INTO enum_ax_zustand_friedhof (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_lagergut_halde'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_lagergut_halde AS ENUM 
	('1000', '2000', '4000', '5000', '6000', '7000', '8000', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_lagergut_halde (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_lagergut_halde_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_lagergut_halde IS 'Alias: "enum_AX_Lagergut_Halde"';
INSERT INTO enum_ax_lagergut_halde (wert,beschreibung) VALUES 
('1000', 'Baustoffe'),
('2000', 'Kohle'),
('4000', 'Erde'),
('5000', 'Schutt'),
('6000', 'Schlacke'),
('7000', 'Abraum'),
('8000', 'Schrott, Altmaterial'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_industrieundgewerbeflaeche'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_industrieundgewerbeflaeche AS ENUM 
	('1700', '1701', '1710', '1720', '1730', '1740', '1750', '1760', '1770', '1780', '1790', '1400', '1410', '1420', '1430', '1440', '1450', '1460', '1470', '1480', '1490', '2500', '2501', '2502', '2510', '2520', '2521', '2522', '2530', '2531', '2532', '2540', '2550', '2551', '2552', '2560', '2561', '2562', '2570', '2571', '2572', '2580', '2581', '2582', '2600', '2601', '2602', '2610', '2611', '2612', '2620', '2621', '2622', '2623', '2630', '2640');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_industrieundgewerbeflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_industrieundgewerbeflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_industrieundgewerbeflaeche IS 'Alias: "enum_AX_Funktion_IndustrieUndGewerbeflaeche"';
INSERT INTO enum_ax_funktion_industrieundgewerbeflaeche (wert,beschreibung) VALUES 
('1700', 'Industrie und Gewerbe'),
('1701', 'Gebäude- und Freifläche Industrie und Gewerbe'),
('1710', 'Produktion'),
('1720', 'Handwerk'),
('1730', 'Tankstelle'),
('1740', 'Lagerplatz'),
('1750', 'Transport'),
('1760', 'Forschung'),
('1770', 'Grundstoff'),
('1780', 'Betriebliche Sozialeinrichtung'),
('1790', 'Werft'),
('1400', 'Handel und Dienstleistung'),
('1410', 'Verwaltung, freie Berufe'),
('1420', 'Bank, Kredit'),
('1430', 'Versicherung'),
('1440', 'Handel'),
('1450', 'Ausstellung, Messe'),
('1460', 'Beherbergung'),
('1470', 'Restauration'),
('1480', 'Vergnügung'),
('1490', 'Gärtnerei'),
('2500', 'Versorgungsanlage'),
('2501', 'Gebäude- und Freifläche Versorgungsanlage'),
('2502', 'Betriebsfläche Versorgungsanlage'),
('2510', 'Förderanlage'),
('2520', 'Wasserwerk'),
('2521', 'Gebäude- und Freifläche Versorgungsanlage, Wasser'),
('2522', 'Betriebsfläche Versorgungsanlage, Wasser'),
('2530', 'Kraftwerk'),
('2531', 'Gebäude- und Freifläche Versorgungsanlage, Elektrizität'),
('2532', 'Betriebsfläche Versorgungsanlage, Elektrizität'),
('2540', 'Umspannstation'),
('2550', 'Raffinerie'),
('2551', 'Gebäude- und Freifläche Versorgungsanlage, Öl'),
('2552', 'Betriebsfläche Versorganlage, Öl'),
('2560', 'Gaswerk'),
('2561', 'Gebäude- und Freifläche Versorgungsanlage, Gas'),
('2562', 'Betriebsfläche Versorgungsanlage, Gas'),
('2570', 'Heizwerk'),
('2571', 'Gebäude- und Freifläche Versorgungsanlage, Wärme'),
('2572', 'Betriebsfläche Versorgungsanlage, Wärme'),
('2580', 'Funk- und Fernmeldeanlage'),
('2581', 'Gebäude- und Freifläche Versorgungsanlage, Funk- und Fernmeldewesen'),
('2582', 'Betriebsfläche Versorgungsanlage, Funk- und Fernmeldewesen'),
('2600', 'Entsorgung'),
('2601', 'Gebäude- und Freifläche Entsorgungsanlage'),
('2602', 'Betriebsfläche Entsorgungsanlage'),
('2610', 'Kläranlage, Klärwerk'),
('2611', 'Gebäude- und Freifläche Entsorgungsanlage, Abwasserbeseitigung'),
('2612', 'Betriebsfläche Entsorgungsanlage, Abwasserbeseitigung'),
('2620', 'Abfallbehandlungsanlage'),
('2621', 'Gebäude- und Freifläche Entsorgungsanlage, Abfallbeseitigung'),
('2622', 'Betriebsfläche Entsorgungsanlage, Abfallbeseitigung'),
('2623', 'Betriebsfläche Entsorgungsanlage, Schlamm'),
('2630', 'Deponie (oberirdisch)'),
('2640', 'Deponie (untertägig)');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_tagebaugrubesteinbruch'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_tagebaugrubesteinbruch AS ENUM 
	('2100', '8000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_tagebaugrubesteinbruch (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_tagebaugrubesteinbruch_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_tagebaugrubesteinbruch IS 'Alias: "enum_AX_Zustand_TagebauGrubeSteinbruch"';
INSERT INTO enum_ax_zustand_tagebaugrubesteinbruch (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderbebauung_siedlungsflaeche'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderbebauung_siedlungsflaeche AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderbebauung_siedlungsflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderbebauung_siedlungsflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderbebauung_siedlungsflaeche IS 'Alias: "enum_AX_ArtDerBebauung_Siedlungsflaeche"';
INSERT INTO enum_ax_artderbebauung_siedlungsflaeche (wert,beschreibung) VALUES 
('1000', 'Offen'),
('2000', 'Geschlossen');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_artderbebauung_flaechebesondererfunktionalerpraegung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_artderbebauung_flaechebesondererfunktionalerpraegung AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_artderbebauung_flaechebesondererfunktionalerpraegu (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_artderbebauung_flaechebesondererfunktionalerpraegu_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_artderbebauung_flaechebesondererfunktionalerpraegu IS 'Alias: "enum_AX_ArtDerBebauung_FlaecheBesondererFunktionalerPraegung"';
INSERT INTO enum_ax_artderbebauung_flaechebesondererfunktionalerpraegu (wert,beschreibung) VALUES 
('1000', 'Offen'),
('2000', 'Geschlossen');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_vegetationsmerkmal_gehoelz'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_vegetationsmerkmal_gehoelz AS ENUM 
	('1400');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_vegetationsmerkmal_gehoelz (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_vegetationsmerkmal_gehoelz_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_vegetationsmerkmal_gehoelz IS 'Alias: "enum_AX_Vegetationsmerkmal_Gehoelz"';
INSERT INTO enum_ax_vegetationsmerkmal_gehoelz (wert,beschreibung) VALUES 
('1400', 'Latschenkiefer');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_vegetationsmerkmal_wald'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_vegetationsmerkmal_wald AS ENUM 
	('1100', '1200', '1300', '1310', '1320');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_vegetationsmerkmal_wald (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_vegetationsmerkmal_wald_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_vegetationsmerkmal_wald IS 'Alias: "enum_AX_Vegetationsmerkmal_Wald"';
INSERT INTO enum_ax_vegetationsmerkmal_wald (wert,beschreibung) VALUES 
('1100', 'Laubholz'),
('1200', 'Nadelholz'),
('1300', 'Laub- und Nadelholz'),
('1310', 'Laubwald mit Nadelholz'),
('1320', 'Nadelwald mit Laubholz');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_vegetationsmerkmal_landwirtschaft'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_vegetationsmerkmal_landwirtschaft AS ENUM 
	('1010', '1011', '1012', '1013', '1020', '1021', '1030', '1031', '1040', '1050', '1051', '1052', '1200');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_vegetationsmerkmal_landwirtschaft (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_vegetationsmerkmal_landwirtschaft_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_vegetationsmerkmal_landwirtschaft IS 'Alias: "enum_AX_Vegetationsmerkmal_Landwirtschaft"';
INSERT INTO enum_ax_vegetationsmerkmal_landwirtschaft (wert,beschreibung) VALUES 
('1010', 'Ackerland'),
('1011', 'Streuobstacker'),
('1012', 'Hopfen'),
('1013', 'Spargel'),
('1020', 'Grünland'),
('1021', 'Streuobstwiese'),
('1030', 'Gartenland'),
('1031', 'Baumschule'),
('1040', 'Weingarten'),
('1050', 'Obstplantage'),
('1051', 'Obstbaumplantage'),
('1052', 'Obststrauchplantage'),
('1200', 'Brachland');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_oberflaechenmaterial_unlandvegetationsloseflaeche'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_oberflaechenmaterial_unlandvegetationsloseflaeche AS ENUM 
	('1010', '1020', '1030', '1040', '1110', '1120');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_oberflaechenmaterial_unlandvegetationsloseflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_oberflaechenmaterial_unlandvegetationsloseflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_oberflaechenmaterial_unlandvegetationsloseflaeche IS 'Alias: "enum_AX_Oberflaechenmaterial_UnlandVegetationsloseFlaeche"';
INSERT INTO enum_ax_oberflaechenmaterial_unlandvegetationsloseflaeche (wert,beschreibung) VALUES 
('1010', 'Fels'),
('1020', 'Steine, Schotter'),
('1030', 'Geröll'),
('1040', 'Sand'),
('1110', 'Schnee'),
('1120', 'Eis, Firn');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_unlandvegetationsloseflaeche'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_unlandvegetationsloseflaeche AS ENUM 
	('1000', '1100', '1110', '1120', '1200', '1300');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_unlandvegetationsloseflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_unlandvegetationsloseflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_unlandvegetationsloseflaeche IS 'Alias: "enum_AX_Funktion_UnlandVegetationsloseFlaeche"';
INSERT INTO enum_ax_funktion_unlandvegetationsloseflaeche (wert,beschreibung) VALUES 
('1000', 'Vegetationslose Fläche'),
('1100', 'Gewässerbegleitfläche'),
('1110', 'Bebaute Gewässerbegleitfläche'),
('1120', 'Unbebaute Gewässerbegleitfläche'),
('1200', 'Sukzessionsfläche'),
('1300', 'Naturnahe Fläche');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_gehoelz'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_gehoelz AS ENUM 
	('1000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_gehoelz (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_gehoelz_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_gehoelz IS 'Alias: "enum_AX_Funktion_Gehoelz"';
INSERT INTO enum_ax_funktion_gehoelz (wert,beschreibung) VALUES 
('1000', 'Windschutz');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bahnkategorie'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_bahnkategorie AS ENUM 
	('1100', '1102', '1104', '1200', '1201', '1202', '1300', '1301', '1302', '1400', '1500', '1600');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_bahnkategorie (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_bahnkategorie_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_bahnkategorie IS 'Alias: "enum_AX_Bahnkategorie"';
INSERT INTO enum_ax_bahnkategorie (wert,beschreibung) VALUES 
('1100', 'Eisenbahn'),
('1102', 'Güterverkehr'),
('1104', 'S-Bahn'),
('1200', 'Stadtbahn'),
('1201', 'Straßenbahn'),
('1202', 'U-Bahn'),
('1300', 'Seilbahn, Bergbahn'),
('1301', 'Zahnradbahn'),
('1302', 'Standseilbahn'),
('1400', 'Museumsbahn'),
('1500', 'Bahn im Freizeitpark'),
('1600', 'Magnetschwebebahn');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_weg'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_weg AS ENUM 
	('5210', '5211', '5212', '5220', '5230', '5240', '5250', '5260', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_weg (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_weg_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_weg IS 'Alias: "enum_AX_Funktion_Weg"';
INSERT INTO enum_ax_funktion_weg (wert,beschreibung) VALUES 
('5210', 'Fahrweg'),
('5211', 'Hauptwirtschaftsweg'),
('5212', 'Wirtschaftsweg'),
('5220', 'Fußweg'),
('5230', 'Gang'),
('5240', 'Radweg'),
('5250', 'Rad- und Fußweg'),
('5260', 'Reitweg'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_bahnverkehr'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_bahnverkehr AS ENUM 
	('2321', '2322');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_bahnverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_bahnverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_bahnverkehr IS 'Alias: "enum_AX_Funktion_Bahnverkehr"';
INSERT INTO enum_ax_funktion_bahnverkehr (wert,beschreibung) VALUES 
('2321', 'Gebäude- und Freifläche zu Verkehrsanlagen, Schiene'),
('2322', 'Verkehrsbegleitfläche Bahnverkehr');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_verkehrsbedeutunginneroertlich'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_verkehrsbedeutunginneroertlich AS ENUM 
	('1000', '2000', '2001', '2002');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_verkehrsbedeutunginneroertlich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_verkehrsbedeutunginneroertlich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_verkehrsbedeutunginneroertlich IS 'Alias: "enum_AX_VerkehrsbedeutungInneroertlich"';
INSERT INTO enum_ax_verkehrsbedeutunginneroertlich (wert,beschreibung) VALUES 
('1000', 'Durchgangsverkehr'),
('2000', 'Ortsverkehr'),
('2001', 'Sammelverkehr'),
('2002', 'Anliegerverkehr');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_internationalebedeutung_strasse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_internationalebedeutung_strasse AS ENUM 
	('2001');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_internationalebedeutung_strasse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_internationalebedeutung_strasse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_internationalebedeutung_strasse IS 'Alias: "enum_AX_InternationaleBedeutung_Strasse"';
INSERT INTO enum_ax_internationalebedeutung_strasse (wert,beschreibung) VALUES 
('2001', 'Europastraße');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_besonderefahrstreifen'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_besonderefahrstreifen AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_besonderefahrstreifen (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_besonderefahrstreifen_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_besonderefahrstreifen IS 'Alias: "enum_AX_BesondereFahrstreifen"';
INSERT INTO enum_ax_besonderefahrstreifen (wert,beschreibung) VALUES 
('1000', 'Mit Radweg'),
('2000', 'Mit Fußweg'),
('3000', 'Mit Rad- und Fußweg');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_bahnverkehr'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_bahnverkehr AS ENUM 
	('2100', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_bahnverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_bahnverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_bahnverkehr IS 'Alias: "enum_AX_Zustand_Bahnverkehr"';
INSERT INTO enum_ax_zustand_bahnverkehr (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_befestigung_fahrwegachse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_befestigung_fahrwegachse AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_befestigung_fahrwegachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_befestigung_fahrwegachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_befestigung_fahrwegachse IS 'Alias: "enum_AX_Befestigung_Fahrwegachse"';
INSERT INTO enum_ax_befestigung_fahrwegachse (wert,beschreibung) VALUES 
('1000', 'Befestigt'),
('2000', 'Unbefestigt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_spurweite'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_spurweite AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_spurweite (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_spurweite_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_spurweite IS 'Alias: "enum_AX_Spurweite"';
INSERT INTO enum_ax_spurweite (wert,beschreibung) VALUES 
('1000', 'Normalspur (Regelspur, Vollspur)'),
('2000', 'Schmalspur'),
('3000', 'Breitspur');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_schiffsverkehr'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_schiffsverkehr AS ENUM 
	('2100', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_schiffsverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_schiffsverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_schiffsverkehr IS 'Alias: "enum_AX_Zustand_Schiffsverkehr"';
INSERT INTO enum_ax_zustand_schiffsverkehr (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_platz'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_platz AS ENUM 
	('5130', '5310', '5320', '5330', '5340', '5350');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_platz (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_platz_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_platz IS 'Alias: "enum_AX_Funktion_Platz"';
INSERT INTO enum_ax_funktion_platz (wert,beschreibung) VALUES 
('5130', 'Fußgängerzone'),
('5310', 'Parkplatz'),
('5320', 'Rastplatz'),
('5330', 'Raststätte'),
('5340', 'Marktplatz'),
('5350', 'Festplatz');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_art_flugverkehr'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_art_flugverkehr AS ENUM 
	('5510', '5511', '5512', '5520', '5530', '5540', '5550');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_art_flugverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_art_flugverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_art_flugverkehr IS 'Alias: "enum_AX_Art_Flugverkehr"';
INSERT INTO enum_ax_art_flugverkehr (wert,beschreibung) VALUES 
('5510', 'Flughafen'),
('5511', 'Internationaler Flughafen'),
('5512', 'Regionalflughafen'),
('5520', 'Verkehrslandeplatz'),
('5530', 'Hubschrauberflugplatz'),
('5540', 'Landeplatz, Sonderlandeplatz'),
('5550', 'Segelfluggelände');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_elektrifizierung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_elektrifizierung AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_elektrifizierung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_elektrifizierung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_elektrifizierung IS 'Alias: "enum_AX_Elektrifizierung"';
INSERT INTO enum_ax_elektrifizierung (wert,beschreibung) VALUES 
('1000', 'Elektrifiziert'),
('2000', 'Nicht elektrifiziert');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand AS ENUM 
	('2100', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand IS 'Alias: "enum_AX_Zustand"';
INSERT INTO enum_ax_zustand (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_fahrbahntrennung_strasse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_fahrbahntrennung_strasse AS ENUM 
	('2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_fahrbahntrennung_strasse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_fahrbahntrennung_strasse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_fahrbahntrennung_strasse IS 'Alias: "enum_AX_Fahrbahntrennung_Strasse"';
INSERT INTO enum_ax_fahrbahntrennung_strasse (wert,beschreibung) VALUES 
('2000', 'Getrennt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_fahrbahnachse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_fahrbahnachse AS ENUM 
	('1808');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_fahrbahnachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_fahrbahnachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_fahrbahnachse IS 'Alias: "enum_AX_Funktion_Fahrbahnachse"';
INSERT INTO enum_ax_funktion_fahrbahnachse (wert,beschreibung) VALUES 
('1808', 'Fußgängerzone');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_oberflaechenmaterial_strasse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_oberflaechenmaterial_strasse AS ENUM 
	('1220', '1230', '1240', '1250');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_oberflaechenmaterial_strasse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_oberflaechenmaterial_strasse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_oberflaechenmaterial_strasse IS 'Alias: "enum_AX_Oberflaechenmaterial_Strasse"';
INSERT INTO enum_ax_oberflaechenmaterial_strasse (wert,beschreibung) VALUES 
('1220', 'Beton'),
('1230', 'Bitumen, Asphalt'),
('1240', 'Pflaster'),
('1250', 'Gestein, zerkleinert');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_flugverkehr'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_flugverkehr AS ENUM 
	('5501');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_flugverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_flugverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_flugverkehr IS 'Alias: "enum_AX_Funktion_Flugverkehr"';
INSERT INTO enum_ax_funktion_flugverkehr (wert,beschreibung) VALUES 
('5501', 'Gebäude- und Freifläche zu Verkehrsanlagen, Luftfahrt');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_wegachse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_wegachse AS ENUM 
	('5211', '5212');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_wegachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_wegachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_wegachse IS 'Alias: "enum_AX_Funktion_Wegachse"';
INSERT INTO enum_ax_funktion_wegachse (wert,beschreibung) VALUES 
('5211', 'Hauptwirtschaftsweg'),
('5212', 'Wirtschaftsweg');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_strasse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_strasse AS ENUM 
	('2100', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_strasse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_strasse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_strasse IS 'Alias: "enum_AX_Zustand_Strasse"';
INSERT INTO enum_ax_zustand_strasse (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_markierung_wegachse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_markierung_wegachse AS ENUM 
	('1401', '1402', '1403');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_markierung_wegachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_markierung_wegachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_markierung_wegachse IS 'Alias: "enum_AX_Markierung_Wegachse"';
INSERT INTO enum_ax_markierung_wegachse (wert,beschreibung) VALUES 
('1401', 'Gekennzeichneter Wanderweg'),
('1402', 'Gekennzeichneter Rad(wander)weg'),
('1403', 'Gekennzeichnete Skaterstrecke');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_zustand_flugverkehr'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_zustand_flugverkehr AS ENUM 
	('2100', '4000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_zustand_flugverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_zustand_flugverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_zustand_flugverkehr IS 'Alias: "enum_AX_Zustand_Flugverkehr"';
INSERT INTO enum_ax_zustand_flugverkehr (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_strassenachse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_strassenachse AS ENUM 
	('1808');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_strassenachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_strassenachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_strassenachse IS 'Alias: "enum_AX_Funktion_Strassenachse"';
INSERT INTO enum_ax_funktion_strassenachse (wert,beschreibung) VALUES 
('1808', 'Fußgängerzone');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_verkehrsbedeutungueberoertlich'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_verkehrsbedeutungueberoertlich AS ENUM 
	('1000', '1001', '1002', '1003');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_verkehrsbedeutungueberoertlich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_verkehrsbedeutungueberoertlich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_verkehrsbedeutungueberoertlich IS 'Alias: "enum_AX_VerkehrsbedeutungUeberoertlich"';
INSERT INTO enum_ax_verkehrsbedeutungueberoertlich (wert,beschreibung) VALUES 
('1000', 'Überörtlicher Verkehr'),
('1001', 'Fernverkehr'),
('1002', 'Regionalverkehr'),
('1003', 'Nahverkehr, zwischenörtlicher Verkehr');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_nutzung_flugverkehr'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_nutzung_flugverkehr AS ENUM 
	('1000', '2000', '3000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_nutzung_flugverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_nutzung_flugverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_nutzung_flugverkehr IS 'Alias: "enum_AX_Nutzung_Flugverkehr"';
INSERT INTO enum_ax_nutzung_flugverkehr (wert,beschreibung) VALUES 
('1000', 'Zivil'),
('2000', 'Militärisch'),
('3000', 'Teils zivil, teils militärisch');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_schiffsverkehr'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_schiffsverkehr AS ENUM 
	('2341', '5610', '5620', '5630', '5640');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_schiffsverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_schiffsverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_schiffsverkehr IS 'Alias: "enum_AX_Funktion_Schiffsverkehr"';
INSERT INTO enum_ax_funktion_schiffsverkehr (wert,beschreibung) VALUES 
('2341', 'Gebäude und Freifläche zu Verkehrsanlagen, Schifffahrt'),
('5610', 'Hafenanlage (Landfläche)'),
('5620', 'Schleuse (Landfläche)'),
('5630', 'Anlegestelle'),
('5640', 'Fähranlage');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktion_strasse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktion_strasse AS ENUM 
	('2311', '2312', '2313', '5130');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_funktion_strasse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_funktion_strasse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_funktion_strasse IS 'Alias: "enum_AX_Funktion_Strasse"';
INSERT INTO enum_ax_funktion_strasse (wert,beschreibung) VALUES 
('2311', 'Gebäude- und Freifläche zu Verkehrsanlagen, Straße'),
('2312', 'Verkehrsbegleitfläche Straße'),
('2313', 'Straßenentwässerungsanlage'),
('5130', 'Fußgängerzone');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_widmung_strasse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_widmung_strasse AS ENUM 
	('1301', '1303', '1305', '1306', '1307', '9997', '9999');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_widmung_strasse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_widmung_strasse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_widmung_strasse IS 'Alias: "enum_AX_Widmung_Strasse"';
INSERT INTO enum_ax_widmung_strasse (wert,beschreibung) VALUES 
('1301', 'Bundesautobahn'),
('1303', 'Bundesstraße'),
('1305', 'Landesstraße, Staatsstraße'),
('1306', 'Kreisstraße'),
('1307', 'Gemeindestraße'),
('9997', 'Attribut trifft nicht zu'),
('9999', 'Sonstiges');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_anzahlderstreckengleise'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_anzahlderstreckengleise AS ENUM 
	('1000', '2000');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS enum_ax_anzahlderstreckengleise (
	wert integer,
	beschreibung character varying,
	CONSTRAINT enum_ax_anzahlderstreckengleise_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE enum_ax_anzahlderstreckengleise IS 'Alias: "enum_AX_AnzahlDerStreckengleise"';
INSERT INTO enum_ax_anzahlderstreckengleise (wert,beschreibung) VALUES 
('1000', 'Eingleisig'),
('2000', 'Zweigleisig');
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktionoa_k_tngr_all'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktionoa_k_tngr_all AS ENUM 
	('Heide', 'Moor', 'Sumpf', 'Wohnbaufläche', 'Industrie- und Gewerbefläche', 'Halde', 'Bergbaubetrieb', 'Tagebau, Grube, Steinbruch', 'Fläche gemischter Nutzung', 'Fläche besonderer funktionaler Prägung', 'Sport-, Freizeit- und Erholungsfläche', 'Friedhof', 'Straßenverkehr', 'Platz', 'Weg', 'Bahnverkehr', 'Flugverkehr', 'Schiffsverkehr', 'Landwirtschaft', 'Wald', 'Gehölz', 'UnlandVegetationslose Fläche', 'Fließgewässer', 'Stehendes Gewässer', 'Meer', 'Hafenbecken');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_klassifizierunggr_k_bewgr'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_klassifizierunggr_k_bewgr AS ENUM 
	('Landwirtschaftliche Nutzung', 'Forstwirtschaftliche Nutzung', 'Weinbauliche Nutzung', 'Gärtnerische Nutzung', 'Sonstige Land- und forstwirtschaftliche Nutzung', 'Andere Nutzung', 'Nebenflächen des Betriebs der Land- und Forstwirtschaft', 'Straßenflächen', 'Gewässerflächen', 'Waldflächen', 'Noch nicht klassifiziert');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktionoa_k_tnfl'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktionoa_k_tnfl AS ENUM 
	('Halde', 'Wohnbaufläche', 'Industrie- und Gewerbefläche', 'Industrie und Gewerbe', 'Handel und Dienstleistungen', 'Versorgungsanlage', 'Entsorgung', 'Bergbaubetrieb', 'Tagebau, Grube, Steinbruch', 'Fläche gemischter Nutzung', 'Fläche besonderer funktionaler Prägung', 'Sport-, Freizeit- und Erholungsfläche', 'Grünanlage', 'Friedhof', 'Straßenverkehr', 'Platz', 'Weg', 'Bahnverkehr', 'Flugverkehr', 'Schiffsverkehr', 'Landwirtschaft', 'Wald', 'Gehölz', 'Heide', 'Moor', 'Sumpf', 'UnlandVegetationslose Fläche', 'Fließgewässer', 'StehendesGewässer', 'Meer', 'Hafenbecken');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_klassifizierungobg_k_bewfl'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_klassifizierungobg_k_bewfl AS ENUM 
	('Ackerland', 'Ackerland-Grünland', 'Acherland-Hackrain', 'Grünland', 'Grünland-Acker', 'Grünland-Hackrain', 'Wiese', 'Streuwiese', 'Hutung', 'Hopfen', 'Spargel', 'Holzung', 'Weingarten (allgemein)', 'Weingarten 1', 'Weingarten 2', 'Weingarten 3', 'Weingarten 4', 'Weingarten 5', 'Weingarten 6', 'Weingarten 7', 'Gartenland', 'Obstplantage', 'Baumschule', 'Anbaufläche unter Glas', 'Kleingarten', 'Weihnachtsbaumkultur', 'Saatzucht', 'Teichwirtschaft', 'Abbauland der Land- und Forstwirtschaft', 'Geringstland', 'Unland', 'Nebenflächen des Betriebs der Land- und Forstwirtschaft');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktionoa_k_tngrerweitert_all'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktionoa_k_tngrerweitert_all AS ENUM 
	('Reitplatz', 'Wohnbaufläche', 'Industrie- und Gewerbefläche', 'Industrie und Gewerbe', 'Gebäude- und Freifläche Industrie und Gewerbe', 'Produktion', 'Handwerk', 'Tankstelle', 'Lagerplatz', 'Transport', 'Forschung', 'Grundstoff', 'Betriebliche Sozialeinrichtungen', 'Werft', 'Handel und Dienstleistung', 'Verwaltung, freie Berufe', 'Bank, Kredit', 'Versicherung', 'Handel', 'Ausstellung, Messe', 'Beherbergung', 'Restauration', 'Vergnügen', 'Gärtnerei', 'Versorgungsanlage', 'Gebäude- und Freifläche Versorgungsanlage', 'Betriebsfläche Versorgungsanlage', 'Förderanlage', 'Wasserwerk', 'Gebäude- und Freifläche Versorgungsanlage, Wasser', 'Betriebsfläche Versorgungsanlage, Wasser', 'Kraftwerk', 'Gebäude- und Freifläche Versorgungsanlage, Elektrizität', 'Betriebsfläche Versorgungsanlage, Elektrizität', 'Umspannstation', 'Raffinerie', 'Gebäude- und Freifläche Versorgungsanlage, Öl', 'Betriebsfläche Versorgungsanlage, Öl', 'Gaswerk', 'Gebäude- und Freifläche Versorgungsanlage, Gas', 'Betriebsfläche Versorgungsanlage, Gas', 'Heizwerk', 'Gebäude- und Freifläche Versorgungsanlage, Wärme', 'Betriebsfläche Versorgungsanlage, Wärme', 'Funk- und Fernmeldeanlage', 'Gebäude- und Freifläche Versorgungsanlage, Funk- und Fernmeld', 'Betriebsfläche Versorgungsanlage, Funkt- und Fernmeldewesen', 'Entsorgung', 'Gebäude- und Freifläche Entsorgungsanlage', 'Betriebsfläche Entsorgungsanlage', 'Kläranlage, Klärwerk', 'Gebäude- und Freifläche Entsorgungsanlage, Abwasserbeseitigun', 'Betriebsfläche Entsorgungsanlage, Abwasserbeseitigung', 'Abfallbehandlungsanlage', 'Gebäude- und Freifläche Entsorgungsanlage, Abfallbeseitigung', 'Betriebsfläche Entsorguingsanlage, Abfallbeseitigung', 'Betriebsfläche Entsorgungsanlage, Schlamm', 'Deponie (oberirdisch)', 'Deponie (untertägig)', 'Halde', 'Bergbaubetrieb', 'Tagebau, Grube, Steinbruch', 'Fläche gemischter Nutzung', 'Gebäude- und Freifläche, Mischnutzung mit Wohnen', 'Wohnen mit Öffentlich', 'Wohnen mit Handel und Dienstleistungen', 'Wohnen mit Gewerbe und Industrie', 'Öffentlich mit Wohnen', 'Handel und Dienstleistungen mit Wohnen', 'Gewerbe und Industrie mit Wohnen', 'Gebäude- und Freifläche Land- und Forstwirtschaft', 'Wohnen', 'Betrieb', 'Wohnen und Betrieb', 'Landwirtschaftliche Betriebsfläche', 'Fortswirtschaftliche Betriebsfläche', 'Fläche besonderer funktionaler Prägung', 'Öffentliche Zwecke', 'Verwaltung', 'Bildung und Forschung', 'Kultur', 'Religiöse Einrichtung', 'Gesundheit, Kur', 'Soziales', 'Sicherheit und Ordnung', 'Parken', 'Historische Anlage', 'Burg-, Festungsanlage', 'Schlossanlage', 'Sport-, Freizeit- und Erholungsfläche', 'Sportanlage', 'Gebäude- und Freifläche Sport, Freizeit und Erholung', 'Gebäude- und Freifläche Erholung, Sport', 'Golfplatz', 'Sportplatz', 'Rennbahn', 'Schießanlage', 'Eis-, Rollschuhbahn', 'Tennisplatz', 'Freizeitanlage', 'Zoo', 'Gebäude- und Freifläche Erholung, Zoologie', 'Safaripark, Wildpark', 'Freizeitpark', 'Freilichttheater', 'Freilichtmuseum', 'Autokino, Freilichtkino', 'Verkehrsübungsplatz', 'Hundeübungsplatz', 'Modellflugplatz', 'Erholungsfläche', 'Gebäude- und Freifläche Erholung', 'Wochenend- und Ferienhausfläche', 'Schwimmbad, Freibad', 'Gebäude- und Freifläche Erholung, Bad', 'Campingplatz', 'Gebäude- und Freifläche Erholung, Camping', 'Grünanlage', 'Grünfläche', 'Park', 'Botanischer Garten', 'Gebäude- und Freifläche Erholung, Botanik', 'Kleingarten', 'Wochenendplatz', 'Garten', 'Spielplatz, Bolzplatz', 'Sonstiges (Sport-, Freizeit- und Erholungsfläche)', 'Friedhof', 'Gebäude- und Freifläche Friedhof', 'Friedhof (ohne Geb äude)', 'Friedhof (Park)', 'Historischer Friedhof', 'Straßenverkehr', 'Gebäude- und Freifläche zu Verkehrsanlagen, Straße', 'Verkehrsbegleitfläche Straße', 'Straßenentwässerungsanlage', 'Fußgängerzone (Straßenverkehr)', 'Weg', 'Fahrweg', 'Hauptwirtschaftsweg', 'Wirtschaftsweg', 'Fußweg', 'Gang', 'Radweg', 'Rad- und Fußweg', 'Reitweg', 'Sonstiges (Weg)', 'Platz', 'Fußgängerzone (Platz)', 'Parkplatz', 'Rastplatz', 'Raststätte', 'Marktplatz', 'Festplatz', 'Bahnverkehr', 'Gebäude- und Freifläche zu Verkehrtsanlagen, Schiene', 'Verkehrsbegleitfläche Bahnverkehr', 'Flugverkehr', 'Gebäude- und Freifläche zu Verkehrsanlagen, Luftfahrt', 'Schiffsverkehr', 'Gebäude- und Freifläche zu Verkehrsanlagen, Schifffahrt', 'Hafenanlage (Landfläche)', 'Schleuse (Landfläche)', 'Anlegestelle', 'Fähranlage', 'Landwirtschaft', 'Ackerland', 'Streuobstacker', 'Hopfen', 'Spargel', 'Grünland', 'Streuobstwiese', 'Gartenland', 'Baumschule', 'Weingarten', 'Obstplantage', 'Obstbaumplantage', 'Obststrauchplantage', 'Brachland', 'Wald', 'Laubholz', 'Nadelholz', 'Laub- und Nadelholz', 'Laubwald mit Nadelholz', 'Nadelwald mit Laubholz', 'Gehölz', 'Latschenkiefer', 'Windschutz', 'Heide', 'Moor', 'Sumpf', 'UnlandVegetationslose Fläche', 'Vegetationslose Fläche', 'Gewässerbegleitfläche', 'Bebaute Gewässerbegleitfläche', 'Unbebaute Gewässerbegleitfläche', 'Sukzessionsfläche', 'Fließgewässer', 'Fluss', 'Altwasser', 'Altarm', 'Flussmündungstrichter', 'Kanal', 'Graben', 'Fleet', 'Bach', 'Hafenbecken', 'Sporthafenbecken', 'Stehendes Gewässer', 'See', 'Teich', 'Stausee', 'Speicherbecken', 'Baggersee', 'Meer', 'Küstengewässer');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_funktionhgr_k_tnhgr'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_funktionhgr_k_tnhgr AS ENUM 
	('Siedlung', 'Verkehr', 'Vegetation', 'Gewässer');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_wirtschaftsart'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_wirtschaftsart AS ENUM 
	('Gebäude- und Freifläche', 'Betriebsfläche', 'Erholungsfläche', 'Verkehrsfläche', 'Landwirtschaftsfläche', 'Waldfläche', 'Wasserfläche', 'Übungsgelände', 'Historische Anlage', 'Friedhof', 'Unland');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktart_k_punkte'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_punktart_k_punkte AS ENUM 
	('Aufnahmepunkt', 'Sicherungspunkt', 'Vermessungspunkt', 'Gebäudepunkt', 'Bauwerkspunkt', 'Topographischer Punkt', 'Lagefestpunkt');
END IF;
END$$;

DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_zeile_punktart'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aaa_gml.ax_k_zeile_punktart AS ENUM 
	('Grenzpunkt', 'Besonderer Gebäudepunkt', 'Besonderer topographischer Punkt', 'Aufnahmepunkt', 'Sicherungspunkt', 'Sonstiger Vermessungspunkt', 'Besonderer Bauwerkspunkt');
END IF;
END$$;


CREATE TABLE IF NOT EXISTS aa_besonderemeilensteinkategorie (
	codespace text,
	id character varying,
	CONSTRAINT aa_besonderemeilensteinkategorie_pkey PRIMARY KEY (id)
) WITH OIDS;

COMMENT ON TABLE aa_besonderemeilensteinkategorie IS 'Alias: "AA_BesondereMeilensteinkategorie", UML-Typ: Code Liste';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_besonderemeilensteinkategorie'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_besonderemeilensteinkategorie AS (
	codespace text,
	id character varying
);
END IF;
END$$;
COMMENT ON TYPE aa_besonderemeilensteinkategorie IS 'Alias: "AA_BesondereMeilensteinkategorie"';
COMMENT ON COLUMN aa_besonderemeilensteinkategorie.codespace IS 'codeSpace  text ';
COMMENT ON COLUMN aa_besonderemeilensteinkategorie.id IS 'id  character varying ';

CREATE TABLE IF NOT EXISTS aa_anlassart (
	codespace text,
	id character varying,
	CONSTRAINT aa_anlassart_pkey PRIMARY KEY (id)
) WITH OIDS;

COMMENT ON TABLE aa_anlassart IS 'Alias: "AA_Anlassart", UML-Typ: Code Liste';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_anlassart'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_anlassart AS (
	codespace text,
	id character varying
);
END IF;
END$$;
COMMENT ON TYPE aa_anlassart IS 'Alias: "AA_Anlassart"';
COMMENT ON COLUMN aa_anlassart.codespace IS 'codeSpace  text ';
COMMENT ON COLUMN aa_anlassart.id IS 'id  character varying ';

CREATE TABLE IF NOT EXISTS aa_levelofdetail (
	codespace text,
	id character varying,
	CONSTRAINT aa_levelofdetail_pkey PRIMARY KEY (id)
) WITH OIDS;

COMMENT ON TABLE aa_levelofdetail IS 'Alias: "AA_LevelOfDetail", UML-Typ: Code Liste';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_levelofdetail'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_levelofdetail AS (
	codespace text,
	id character varying
);
END IF;
END$$;
COMMENT ON TYPE aa_levelofdetail IS 'Alias: "AA_LevelOfDetail"';
COMMENT ON COLUMN aa_levelofdetail.codespace IS 'codeSpace  text ';
COMMENT ON COLUMN aa_levelofdetail.id IS 'id  character varying ';

CREATE TABLE IF NOT EXISTS aa_anlassart_benutzungsauftrag (
	codespace text,
	id character varying,
	CONSTRAINT aa_anlassart_benutzungsauftrag_pkey PRIMARY KEY (id)
) WITH OIDS;

COMMENT ON TABLE aa_anlassart_benutzungsauftrag IS 'Alias: "AA_Anlassart_Benutzungsauftrag", UML-Typ: Code Liste';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_anlassart_benutzungsauftrag'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_anlassart_benutzungsauftrag AS (
	codespace text,
	id character varying
);
END IF;
END$$;
COMMENT ON TYPE aa_anlassart_benutzungsauftrag IS 'Alias: "AA_Anlassart_Benutzungsauftrag"';
COMMENT ON COLUMN aa_anlassart_benutzungsauftrag.codespace IS 'codeSpace  text ';
COMMENT ON COLUMN aa_anlassart_benutzungsauftrag.id IS 'id  character varying ';

CREATE TABLE IF NOT EXISTS aa_weiteremodellart (
	codespace text,
	id character varying,
	CONSTRAINT aa_weiteremodellart_pkey PRIMARY KEY (id)
) WITH OIDS;

COMMENT ON TABLE aa_weiteremodellart IS 'Alias: "AA_WeitereModellart", UML-Typ: Code Liste';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_weiteremodellart'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_weiteremodellart AS (
	codespace text,
	id character varying
);
END IF;
END$$;
COMMENT ON TYPE aa_weiteremodellart IS 'Alias: "AA_WeitereModellart"';
COMMENT ON COLUMN aa_weiteremodellart.codespace IS 'codeSpace  text ';
COMMENT ON COLUMN aa_weiteremodellart.id IS 'id  character varying ';

CREATE TABLE IF NOT EXISTS aa_instanzenthemen (
	codespace text,
	id character varying,
	CONSTRAINT aa_instanzenthemen_pkey PRIMARY KEY (id)
) WITH OIDS;

COMMENT ON TABLE aa_instanzenthemen IS 'Alias: "AA_Instanzenthemen", UML-Typ: Code Liste';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_instanzenthemen'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_instanzenthemen AS (
	codespace text,
	id character varying
);
END IF;
END$$;
COMMENT ON TYPE aa_instanzenthemen IS 'Alias: "AA_Instanzenthemen"';
COMMENT ON COLUMN aa_instanzenthemen.codespace IS 'codeSpace  text ';
COMMENT ON COLUMN aa_instanzenthemen.id IS 'id  character varying ';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_fachdatenobjekt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_fachdatenobjekt AS (
	name character varying,
	uri character varying
);
END IF;
END$$;
COMMENT ON TYPE aa_fachdatenobjekt IS 'Alias: "AA_Fachdatenobjekt",  1, UML-DataType: URI 1';
COMMENT ON COLUMN aa_fachdatenobjekt.name IS 'name  CharacterString 1';
COMMENT ON COLUMN aa_fachdatenobjekt.uri IS 'uri  URI 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_modellart'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_modellart AS (
	advstandardmodell aa_advstandardmodell,
	sonstigesmodell aa_weiteremodellart
);
END IF;
END$$;
COMMENT ON TYPE aa_modellart IS 'Alias: "AA_Modellart", UML-Classifier: AA_AdVStandardModell Stereotyp: enumeration 1, UML-Classifier: AA_WeitereModellart Stereotyp: codeList 1';
COMMENT ON COLUMN aa_modellart.advstandardmodell IS 'advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN aa_modellart.sonstigesmodell IS 'sonstigesModell codeList AA_WeitereModellart 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_empfaenger'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_empfaenger AS (
	direkt boolean,
	email character varying,
	http character varying,
	manuell character varying
);
END IF;
END$$;
COMMENT ON TYPE aa_empfaenger IS 'Alias: "AA_Empfaenger", UML-DataType: Boolean 1, UML-DataType: URI 1, UML-DataType: URI 1,  1';
COMMENT ON COLUMN aa_empfaenger.direkt IS 'direkt  Boolean 1';
COMMENT ON COLUMN aa_empfaenger.email IS 'email  URI 1';
COMMENT ON COLUMN aa_empfaenger.http IS 'http  URI 1';
COMMENT ON COLUMN aa_empfaenger.manuell IS 'manuell  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_verschluesseltelagebezeichnung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_verschluesseltelagebezeichnung AS (
	land character varying,
	regierungsbezirk character varying,
	kreis character varying,
	gemeinde character varying,
	lage character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_verschluesseltelagebezeichnung IS 'Alias: "AX_VerschluesselteLagebezeichnung",  1,  [0..1],  1,  1,  1';
COMMENT ON COLUMN ax_verschluesseltelagebezeichnung.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_verschluesseltelagebezeichnung.regierungsbezirk IS 'regierungsbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_verschluesseltelagebezeichnung.kreis IS 'kreis  CharacterString 1';
COMMENT ON COLUMN ax_verschluesseltelagebezeichnung.gemeinde IS 'gemeinde  CharacterString 1';
COMMENT ON COLUMN ax_verschluesseltelagebezeichnung.lage IS 'lage  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_lagebezeichnung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_lagebezeichnung AS (
	unverschluesselt character varying,
	verschluesselt ax_verschluesseltelagebezeichnung
);
END IF;
END$$;
COMMENT ON TYPE ax_lagebezeichnung IS 'Alias: "AX_Lagebezeichnung",  1, UML-Classifier: AX_VerschluesselteLagebezeichnung Stereotyp: DataType 1';
COMMENT ON COLUMN ax_lagebezeichnung.unverschluesselt IS 'unverschluesselt  CharacterString 1';
COMMENT ON COLUMN ax_lagebezeichnung.verschluesselt IS 'verschluesselt DataType AX_VerschluesselteLagebezeichnung 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_gemarkung_schluessel'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_gemarkung_schluessel AS (
	land character varying,
	gemarkungsnummer character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_gemarkung_schluessel IS 'Alias: "AX_Gemarkung_Schluessel",  1,  1';
COMMENT ON COLUMN ax_gemarkung_schluessel.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_gemarkung_schluessel.gemarkungsnummer IS 'gemarkungsnummer  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_gemarkungsteilflur_schluessel'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_gemarkungsteilflur_schluessel AS (
	land character varying,
	gemarkung character varying,
	gemarkungsteilflur character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_gemarkungsteilflur_schluessel IS 'Alias: "AX_GemarkungsteilFlur_Schluessel",  1,  1,  1';
COMMENT ON COLUMN ax_gemarkungsteilflur_schluessel.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_gemarkungsteilflur_schluessel.gemarkung IS 'gemarkung  CharacterString 1';
COMMENT ON COLUMN ax_gemarkungsteilflur_schluessel.gemarkungsteilflur IS 'gemarkungsteilFlur  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_buchungsblattbezirk_schluessel'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_buchungsblattbezirk_schluessel AS (
	land character varying,
	bezirk character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_buchungsblattbezirk_schluessel IS 'Alias: "AX_Buchungsblattbezirk_Schluessel",  1,  1';
COMMENT ON COLUMN ax_buchungsblattbezirk_schluessel.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_buchungsblattbezirk_schluessel.bezirk IS 'bezirk  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_reservierungsauftrag_gebietskennung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_reservierungsauftrag_gebietskennung AS (
	gemarkung ax_gemarkung_schluessel,
	flur ax_gemarkungsteilflur_schluessel,
	buchungsblattbezirk ax_buchungsblattbezirk_schluessel
);
END IF;
END$$;
COMMENT ON TYPE ax_reservierungsauftrag_gebietskennung IS 'Alias: "AX_Reservierungsauftrag_Gebietskennung", UML-Classifier: AX_Gemarkung_Schluessel Stereotyp: DataType 1, UML-Classifier: AX_GemarkungsteilFlur_Schluessel Stereotyp: DataType 1, UML-Classifier: AX_Buchungsblattbezirk_Schluessel Stereotyp: DataType 1';
COMMENT ON COLUMN ax_reservierungsauftrag_gebietskennung.gemarkung IS 'gemarkung DataType AX_Gemarkung_Schluessel 1';
COMMENT ON COLUMN ax_reservierungsauftrag_gebietskennung.flur IS 'flur DataType AX_GemarkungsteilFlur_Schluessel 1';
COMMENT ON COLUMN ax_reservierungsauftrag_gebietskennung.buchungsblattbezirk IS 'buchungsblattbezirk DataType AX_Buchungsblattbezirk_Schluessel 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'sc_crs'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE sc_crs AS (
	scope character varying[]
);
END IF;
END$$;
COMMENT ON TYPE sc_crs IS 'Alias: "SC_CRS", ISO 19136 GML Type: scope 1..*';
COMMENT ON COLUMN sc_crs.scope IS 'scope CharacterString CharacterString 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'query'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE query AS (
	url character varying
);
END IF;
END$$;
COMMENT ON TYPE query IS 'Alias: "Query", wfs:Query nach Web Feature Service Specifikation, Version 1.0.0: url 0..1';
COMMENT ON COLUMN query.url IS 'url CharacterString CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'transaction'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE transaction AS (
	content text
);
END IF;
END$$;
COMMENT ON TYPE transaction IS 'Alias: "Transaction", wfs:Transaction nach Web Feature Service Specifikation, Version 1.0.0: content 0..1';
COMMENT ON COLUMN transaction.content IS 'content CharacterString Text 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'doublelist'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE doublelist AS (
	list text
);
END IF;
END$$;
COMMENT ON TYPE doublelist IS 'Alias: "doubleList", ISO 19136 GML Type: list';
COMMENT ON COLUMN doublelist.list IS 'list Sequence Sequence 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'measure'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE measure AS (
	value integer
);
END IF;
END$$;
COMMENT ON TYPE measure IS 'Alias: "Measure", ISO 19136 GML Type: value';
COMMENT ON COLUMN measure.value IS 'value DataType Integer 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_lebenszeitintervall'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_lebenszeitintervall AS (
	beginnt timestamp without time zone,
	endet timestamp without time zone
);
END IF;
END$$;
COMMENT ON TYPE aa_lebenszeitintervall IS 'Alias: "AA_Lebenszeitintervall", UML-DataType: DateTime 1, UML-DataType: DateTime [0..1]';
COMMENT ON COLUMN aa_lebenszeitintervall.beginnt IS 'beginnt  DateTime 1';
COMMENT ON COLUMN aa_lebenszeitintervall.endet IS 'endet  DateTime 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_fachdatenverbindung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_fachdatenverbindung AS (
	art character varying,
	fachdatenobjekt aa_fachdatenobjekt
);
END IF;
END$$;
COMMENT ON TYPE aa_fachdatenverbindung IS 'Alias: "AA_Fachdatenverbindung", UML-DataType: URI 1, UML-Classifier: AA_Fachdatenobjekt Stereotyp: union 1';
COMMENT ON COLUMN aa_fachdatenverbindung.art IS 'art  URI 1';
COMMENT ON COLUMN aa_fachdatenverbindung.fachdatenobjekt IS 'fachdatenobjekt union AA_Fachdatenobjekt 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_koordinatenreferenzsystemangaben'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_koordinatenreferenzsystemangaben AS (
	crs character varying,
	anzahldernachkommastellen integer,
	standard boolean
);
END IF;
END$$;
COMMENT ON TYPE aa_koordinatenreferenzsystemangaben IS 'Alias: "AA_Koordinatenreferenzsystemangaben", UML-DataType: SC_CRS 1, UML-DataType: Integer 1, UML-DataType: Boolean 1';
COMMENT ON COLUMN aa_koordinatenreferenzsystemangaben.crs IS 'crs  SC_CRS 1';
COMMENT ON COLUMN aa_koordinatenreferenzsystemangaben.anzahldernachkommastellen IS 'anzahlDerNachkommastellen  Integer 1';
COMMENT ON COLUMN aa_koordinatenreferenzsystemangaben.standard IS 'standard  Boolean 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'dcp'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE dcp AS (
	http character varying,
	email character varying,
	manuell character varying
);
END IF;
END$$;
COMMENT ON TYPE dcp IS 'Alias: "DCP", UML-DataType: URI 1, UML-DataType: URI 1,  1';
COMMENT ON COLUMN dcp.http IS 'HTTP  URI 1';
COMMENT ON COLUMN dcp.email IS 'email  URI 1';
COMMENT ON COLUMN dcp.manuell IS 'manuell  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_themendefinition'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_themendefinition AS (
	name character varying,
	art aa_art_themendefinition,
	objektart character varying[],
	modellart aa_modellart,
	dimension aa_themendimension
);
END IF;
END$$;
COMMENT ON TYPE aa_themendefinition IS 'Alias: "AA_Themendefinition",  1, UML-Classifier: AA_Art_Themendefinition Stereotyp: enumeration 1,  [1..*], UML-Classifier: AA_Modellart Stereotyp: union 1, UML-Classifier: AA_Themendimension Stereotyp: enumeration 1';
COMMENT ON COLUMN aa_themendefinition.name IS 'name  CharacterString 1';
COMMENT ON COLUMN aa_themendefinition.art IS 'art enumeration AA_Art_Themendefinition 1';
COMMENT ON COLUMN aa_themendefinition.objektart IS 'objektart  CharacterString 1..*';
COMMENT ON COLUMN aa_themendefinition.modellart IS 'modellart union AA_Modellart 1';
COMMENT ON COLUMN aa_themendefinition.dimension IS 'dimension enumeration AA_Themendimension 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_auftrag'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_auftrag AS (
	empfaenger aa_empfaenger,
	ausgabeform aa_nas_ausgabeform
);
END IF;
END$$;
COMMENT ON TYPE aa_auftrag IS 'Alias: "AA_Auftrag", UML-Classifier: AA_Empfaenger Stereotyp: union 1, UML-Classifier: AA_NAS_Ausgabeform Stereotyp: enumeration 1';
COMMENT ON COLUMN aa_auftrag.empfaenger IS 'empfaenger union AA_Empfaenger 1';
COMMENT ON COLUMN aa_auftrag.ausgabeform IS 'ausgabeform enumeration AA_NAS_Ausgabeform 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_benutzungsauftrag'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_benutzungsauftrag AS (
	art aa_anlassart_benutzungsauftrag,
	koordinatenreferenzsystem character varying,
	anforderungsmerkmale text[]
);
END IF;
END$$;
COMMENT ON TYPE aa_benutzungsauftrag IS 'Alias: "AA_Benutzungsauftrag", UML-Classifier: AA_Anlassart_Benutzungsauftrag Stereotyp: codeList 1, UML-DataType: SC_CRS [0..1],  [1..*]';
COMMENT ON COLUMN aa_benutzungsauftrag.art IS 'art codeList AA_Anlassart_Benutzungsauftrag 1';
COMMENT ON COLUMN aa_benutzungsauftrag.koordinatenreferenzsystem IS 'koordinatenreferenzsystem  SC_CRS 0..1';
COMMENT ON COLUMN aa_benutzungsauftrag.anforderungsmerkmale IS 'anforderungsmerkmale  Query 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_fortfuehrungsauftrag'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_fortfuehrungsauftrag AS (
	verwendeteinstanzenthemen aa_instanzenthemen[],
	koordinatenangaben aa_koordinatenreferenzsystemangaben[],
	geaenderteobjekte text
);
END IF;
END$$;
COMMENT ON TYPE aa_fortfuehrungsauftrag IS 'Alias: "AA_Fortfuehrungsauftrag", UML-Classifier: AA_Instanzenthemen Stereotyp: codeList [0..*], UML-Classifier: AA_Koordinatenreferenzsystemangaben Stereotyp: DataType [0..*],  1';
COMMENT ON COLUMN aa_fortfuehrungsauftrag.verwendeteinstanzenthemen IS 'verwendeteInstanzenthemen codeList AA_Instanzenthemen 0..*';
COMMENT ON COLUMN aa_fortfuehrungsauftrag.koordinatenangaben IS 'koordinatenangaben DataType AA_Koordinatenreferenzsystemangaben 0..*';
COMMENT ON COLUMN aa_fortfuehrungsauftrag.geaenderteobjekte IS 'geaenderteObjekte  Transaction 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_portionskennung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_portionskennung AS (
	profilkennung character varying,
	datum timestamp without time zone,
	laufendenummervongesamtzahl integer,
	gesamtzahl integer,
	suedwestecke geometry(POINT)
);
END IF;
END$$;
COMMENT ON TYPE ax_portionskennung IS 'Alias: "AX_Portionskennung",  1, UML-DataType: DateTime 1, UML-DataType: Integer 1, UML-DataType: Integer 1, UML-DataType: DirectPosition 1';
COMMENT ON COLUMN ax_portionskennung.profilkennung IS 'profilkennung  CharacterString 1';
COMMENT ON COLUMN ax_portionskennung.datum IS 'datum  DateTime 1';
COMMENT ON COLUMN ax_portionskennung.laufendenummervongesamtzahl IS 'laufendeNummerVonGesamtzahl  Integer 1';
COMMENT ON COLUMN ax_portionskennung.gesamtzahl IS 'gesamtzahl  Integer 1';
COMMENT ON COLUMN ax_portionskennung.suedwestecke IS 'suedwestEcke  DirectPosition 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_portion_erfolgreich'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_portion_erfolgreich AS (
	portionskennung ax_portionskennung,
	erfolgreich boolean,
	uebernahmeprotokoll character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_portion_erfolgreich IS 'Alias: "AX_Portion_Erfolgreich", UML-Classifier: AX_Portionskennung Stereotyp: DataType 1, UML-DataType: Boolean 1,  1';
COMMENT ON COLUMN ax_portion_erfolgreich.portionskennung IS 'portionskennung DataType AX_Portionskennung 1';
COMMENT ON COLUMN ax_portion_erfolgreich.erfolgreich IS 'erfolgreich  Boolean 1';
COMMENT ON COLUMN ax_portion_erfolgreich.uebernahmeprotokoll IS 'uebernahmeprotokoll  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_nbaquittierung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_nbaquittierung AS (
	profilkennung character varying,
	antragsnummer character varying,
	abhaengigvon character varying[],
	auftragsnummer character varying,
	gesamtnbaerfolgreich boolean,
	portionnbaerfolgreich ax_portion_erfolgreich[],
	uebernahmeprotokoll character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_nbaquittierung IS 'Alias: "AX_NBAQuittierung", UML-DataType: CharacterString 1, UML-DataType: CharacterString 1, UML-DataType: CharacterString [0..*],  1, UML-DataType: Boolean 1, UML-Classifier: AX_Portion_Erfolgreich Stereotyp: dataType [0..*],  1';
COMMENT ON COLUMN ax_nbaquittierung.profilkennung IS 'profilkennung  CharacterString 1';
COMMENT ON COLUMN ax_nbaquittierung.antragsnummer IS 'antragsnummer  CharacterString 1';
COMMENT ON COLUMN ax_nbaquittierung.abhaengigvon IS 'abhaengigVon  CharacterString 0..*';
COMMENT ON COLUMN ax_nbaquittierung.auftragsnummer IS 'auftragsnummer  CharacterString 1';
COMMENT ON COLUMN ax_nbaquittierung.gesamtnbaerfolgreich IS 'gesamtNBAErfolgreich  Boolean 1';
COMMENT ON COLUMN ax_nbaquittierung.portionnbaerfolgreich IS 'portionNBAErfolgreich dataType AX_Portion_Erfolgreich 0..*';
COMMENT ON COLUMN ax_nbaquittierung.uebernahmeprotokoll IS 'uebernahmeprotokoll  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_ergebnis'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_ergebnis AS (
	erlaeuterung character varying,
	erfolgreich boolean
);
END IF;
END$$;
COMMENT ON TYPE aa_ergebnis IS 'Alias: "AA_Ergebnis",  [0..1], UML-DataType: Boolean 1';
COMMENT ON COLUMN aa_ergebnis.erlaeuterung IS 'erlaeuterung  CharacterString 0..1';
COMMENT ON COLUMN aa_ergebnis.erfolgreich IS 'erfolgreich  Boolean 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_bestandsdatenauszug'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_bestandsdatenauszug AS (
	koordinatenangaben aa_koordinatenreferenzsystemangaben[],
	enthaelt text
);
END IF;
END$$;
COMMENT ON TYPE aa_bestandsdatenauszug IS 'Alias: "AA_Bestandsdatenauszug", UML-DataType: AA_Koordinatenreferenzsystemangaben Stereotyp: DataType [0..*], UML-DataType: FeatureCollection [0..1]';
COMMENT ON COLUMN aa_bestandsdatenauszug.koordinatenangaben IS 'koordinatenangaben DataType AA_Koordinatenreferenzsystemangaben 0..*';
COMMENT ON COLUMN aa_bestandsdatenauszug.enthaelt IS 'enthaelt  FeatureCollection 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_fortfuehrungsergebnis'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_fortfuehrungsergebnis AS (

);
END IF;
END$$;
COMMENT ON TYPE aa_fortfuehrungsergebnis IS 'Alias: "AA_Fortfuehrungsergebnis"';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_nbaquittierungsergebnis'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_nbaquittierungsergebnis AS (
	antragsnummer character varying,
	auftragsnummer character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_nbaquittierungsergebnis IS 'Alias: "AX_NBAQuittierungsergebnis", UML-DataType: CharacterString 1,  1';
COMMENT ON COLUMN ax_nbaquittierungsergebnis.antragsnummer IS 'antragsnummer  CharacterString 1';
COMMENT ON COLUMN ax_nbaquittierungsergebnis.auftragsnummer IS 'auftragsnummer  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ap_transformationsmatrix_3d'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ap_transformationsmatrix_3d AS (
	parameter double precision[]
);
END IF;
END$$;
COMMENT ON TYPE ap_transformationsmatrix_3d IS 'Alias: "AP_TransformationsMatrix_3D", UML-DataType: Real *';
COMMENT ON COLUMN ap_transformationsmatrix_3d.parameter IS 'parameter  Real *';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_gebuehrenparameter'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_gebuehrenparameter AS (

);
END IF;
END$$;
COMMENT ON TYPE aa_gebuehrenparameter IS 'Alias: "AA_Gebuehrenparameter"';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'aa_gebuehrenangaben'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE aa_gebuehrenangaben AS (
	parameterart aa_gebuehrenparameter,
	parameterwert character varying
);
END IF;
END$$;
COMMENT ON TYPE aa_gebuehrenangaben IS 'Alias: "AA_Gebuehrenangaben", UML-Classifier: AA_Gebuehrenparameter Stereotyp: dataType 1,  1';
COMMENT ON COLUMN aa_gebuehrenangaben.parameterart IS 'parameterArt dataType AA_Gebuehrenparameter 1';
COMMENT ON COLUMN aa_gebuehrenangaben.parameterwert IS 'parameterWert  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dqmitdatenerhebung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_dqmitdatenerhebung AS (
	herkunft text
);
END IF;
END$$;
COMMENT ON TYPE ax_dqmitdatenerhebung IS 'Alias: "AX_DQMitDatenerhebung", UML-DataType: LI_Lineage [0..1]';
COMMENT ON COLUMN ax_dqmitdatenerhebung.herkunft IS 'herkunft  LI_Lineage 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dqohnedatenerhebung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_dqohnedatenerhebung AS (
	herkunft text
);
END IF;
END$$;
COMMENT ON TYPE ax_dqohnedatenerhebung IS 'Alias: "AX_DQOhneDatenerhebung", UML-DataType: LI_Lineage [0..1]';
COMMENT ON COLUMN ax_dqohnedatenerhebung.herkunft IS 'herkunft  LI_Lineage 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_anteil'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_anteil AS (
	zaehler double precision,
	nenner double precision
);
END IF;
END$$;
COMMENT ON TYPE ax_anteil IS 'Alias: "AX_Anteil", UML-DataType: Real 1, UML-DataType: Real 1';
COMMENT ON COLUMN ax_anteil.zaehler IS 'zaehler  Real 1';
COMMENT ON COLUMN ax_anteil.nenner IS 'nenner  Real 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_phasenzentrumsvariation_referenzstationspunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_phasenzentrumsvariation_referenzstationspunkt AS (
	zeile character varying[]
);
END IF;
END$$;
COMMENT ON TYPE ax_phasenzentrumsvariation_referenzstationspunkt IS 'Alias: "AX_Phasenzentrumsvariation_Referenzstationspunkt", UML-DataType: doubleList *';
COMMENT ON COLUMN ax_phasenzentrumsvariation_referenzstationspunkt.zeile IS 'zeile  doubleList *';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktstabilitaet_hoehenfestpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_punktstabilitaet_hoehenfestpunkt AS (
	vermutetehoehenstabilitaet ax_punktstabilitaet_hoehenfestpunkt_vermutetehoehenstabili,
	guetedesvermarkungstraegers ax_punktstabilitaet_hoehenfestpunkt_guetedesvermarkungstra,
	topographieundumwelt ax_punktstabilitaet_hoehenfestpunkt_topographieundumwelt,
	guetedesbaugrundes ax_punktstabilitaet_hoehenfestpunkt_guetedesbaugrundes,
	geologischestabilitaet ax_punktstabilitaet_hoehenfestpunkt_geologischestabilitaet,
	grundwasserstand ax_punktstabilitaet_hoehenfestpunkt_grundwasserstand,
	grundwasserschwankung ax_punktstabilitaet_hoehenfestpunkt_grundwasserschwankung,
	hoehenstabilitaetauswiederholungsmessungen ax_punktstabilitaet_hoehenfestpunkt_hoehenstabilitaetauswi
);
END IF;
END$$;
COMMENT ON TYPE ax_punktstabilitaet_hoehenfestpunkt IS 'Alias: "AX_Punktstabilitaet_Hoehenfestpunkt", UML-Classifier: AX_Punktstabilitaet_Hoehenfestpunkt_VermuteteHoehenstabilitaet Stereotyp: enumeration [0..1], UML-Classifier: AX_Punktstabilitaet_Hoehenfestpunkt_GueteDesVermarkungstraegers Stereotyp: enumeration [0..1], UML-Classifier: AX_Punktstabilitaet_Hoehenfestpunkt_TopographieUndUmwelt Stereotyp: enumeration [0..1], UML-Classifier: AX_Punktstabilitaet_Hoehenfestpunkt_GueteDesBaugrundes Stereotyp: enumeration [0..1], UML-Classifier: AX_Punktstabilitaet_Hoehenfestpunkt_GeologischeStabilitaet Stereotyp: enumeration [0..1], UML-Classifier: AX_Punktstabilitaet_Hoehenfestpunkt_Grundwasserstand Stereotyp: enumeration [0..1], UML-Classifier: AX_Punktstabilitaet_Hoehenfestpunkt_Grundwasserschwankung Stereotyp: enumeration [0..1], UML-Classifier: AX_Punktstabilitaet_Hoehenfestpunkt_HoehenstabilitaetAusWiederholungsmessungen Stereotyp: enumeration [0..1]';
COMMENT ON COLUMN ax_punktstabilitaet_hoehenfestpunkt.vermutetehoehenstabilitaet IS 'vermuteteHoehenstabilitaet enumeration AX_Punktstabilitaet_Hoehenfestpunkt_VermuteteHoehenstabilitaet 0..1';
COMMENT ON COLUMN ax_punktstabilitaet_hoehenfestpunkt.guetedesvermarkungstraegers IS 'gueteDesVermarkungstraegers enumeration AX_Punktstabilitaet_Hoehenfestpunkt_GueteDesVermarkungstraegers 0..1';
COMMENT ON COLUMN ax_punktstabilitaet_hoehenfestpunkt.topographieundumwelt IS 'topographieUndUmwelt enumeration AX_Punktstabilitaet_Hoehenfestpunkt_TopographieUndUmwelt 0..1';
COMMENT ON COLUMN ax_punktstabilitaet_hoehenfestpunkt.guetedesbaugrundes IS 'gueteDesBaugrundes enumeration AX_Punktstabilitaet_Hoehenfestpunkt_GueteDesBaugrundes 0..1';
COMMENT ON COLUMN ax_punktstabilitaet_hoehenfestpunkt.geologischestabilitaet IS 'geologischeStabilitaet enumeration AX_Punktstabilitaet_Hoehenfestpunkt_GeologischeStabilitaet 0..1';
COMMENT ON COLUMN ax_punktstabilitaet_hoehenfestpunkt.grundwasserstand IS 'grundwasserstand enumeration AX_Punktstabilitaet_Hoehenfestpunkt_Grundwasserstand 0..1';
COMMENT ON COLUMN ax_punktstabilitaet_hoehenfestpunkt.grundwasserschwankung IS 'grundwasserschwankung enumeration AX_Punktstabilitaet_Hoehenfestpunkt_Grundwasserschwankung 0..1';
COMMENT ON COLUMN ax_punktstabilitaet_hoehenfestpunkt.hoehenstabilitaetauswiederholungsmessungen IS 'hoehenstabilitaetAusWiederholungsmessungen enumeration AX_Punktstabilitaet_Hoehenfestpunkt_HoehenstabilitaetAusWiederholungsmessungen 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dqfestpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_dqfestpunkt AS (
	ueberwachungsdatum date,
	befund character varying,
	punktstabilitaet ax_punktstabilitaet,
	gnsstauglichkeit ax_gnsstauglichkeit
);
END IF;
END$$;
COMMENT ON TYPE ax_dqfestpunkt IS 'Alias: "AX_DQFestpunkt", UML-DataType: Date [0..1],  [0..1], UML-Classifier: AX_Punktstabilitaet Stereotyp: enumeration [0..1], UML-Classifier: AX_GNSSTauglichkeit Stereotyp: enumeration [0..1]';
COMMENT ON COLUMN ax_dqfestpunkt.ueberwachungsdatum IS 'ueberwachungsdatum  Date 0..1';
COMMENT ON COLUMN ax_dqfestpunkt.befund IS 'befund  CharacterString 0..1';
COMMENT ON COLUMN ax_dqfestpunkt.punktstabilitaet IS 'punktstabilitaet enumeration AX_Punktstabilitaet 0..1';
COMMENT ON COLUMN ax_dqfestpunkt.gnsstauglichkeit IS 'gnssTauglichkeit enumeration AX_GNSSTauglichkeit 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dqhoehenfestpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_dqhoehenfestpunkt AS (
	punktstabilitaet ax_punktstabilitaet_hoehenfestpunkt,
	ueberwachungsdatum date,
	befund character varying,
	gnsstauglichkeit ax_gnsstauglichkeit
);
END IF;
END$$;
COMMENT ON TYPE ax_dqhoehenfestpunkt IS 'Alias: "AX_DQHoehenfestpunkt", UML-Classifier: AX_Punktstabilitaet_Hoehenfestpunkt Stereotyp: DataType [0..1], UML-DataType: Date [0..1],  [0..1], UML-Classifier: AX_GNSSTauglichkeit Stereotyp: enumeration [0..1]';
COMMENT ON COLUMN ax_dqhoehenfestpunkt.punktstabilitaet IS 'punktstabilitaet DataType AX_Punktstabilitaet_Hoehenfestpunkt 0..1';
COMMENT ON COLUMN ax_dqhoehenfestpunkt.ueberwachungsdatum IS 'ueberwachungsdatum  Date 0..1';
COMMENT ON COLUMN ax_dqhoehenfestpunkt.befund IS 'befund  CharacterString 0..1';
COMMENT ON COLUMN ax_dqhoehenfestpunkt.gnsstauglichkeit IS 'gnssTauglichkeit enumeration AX_GNSSTauglichkeit 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_klassifikation_lagefestpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_klassifikation_lagefestpunkt AS (
	ordnung ax_klassifikation_ordnung_lagefestpunkt,
	hierarchiestufe3d ax_klassifikation_hierarchiestufe3d_lagefestpunkt,
	wertigkeit ax_klassifikation_wertigkeit_lagefestpunkt
);
END IF;
END$$;
COMMENT ON TYPE ax_klassifikation_lagefestpunkt IS 'Alias: "AX_Klassifikation_Lagefestpunkt", UML-Classifier: AX_Klassifikation_Ordnung_Lagefestpunkt Stereotyp: enumeration [0..1], UML-Classifier: AX_Klassifikation_Hierarchiestufe3D_Lagefestpunkt Stereotyp: enumeration [0..1], UML-Classifier: AX_Klassifikation_Wertigkeit_Lagefestpunkt Stereotyp: enumeration [0..1]';
COMMENT ON COLUMN ax_klassifikation_lagefestpunkt.ordnung IS 'ordnung enumeration AX_Klassifikation_Ordnung_Lagefestpunkt 0..1';
COMMENT ON COLUMN ax_klassifikation_lagefestpunkt.hierarchiestufe3d IS 'hierarchiestufe3D enumeration AX_Klassifikation_Hierarchiestufe3D_Lagefestpunkt 0..1';
COMMENT ON COLUMN ax_klassifikation_lagefestpunkt.wertigkeit IS 'wertigkeit enumeration AX_Klassifikation_Wertigkeit_Lagefestpunkt 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_pfeilerhoehe_lagefestpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_pfeilerhoehe_lagefestpunkt AS (
	abstand double precision,
	messung date
);
END IF;
END$$;
COMMENT ON TYPE ax_pfeilerhoehe_lagefestpunkt IS 'Alias: "AX_Pfeilerhoehe_Lagefestpunkt", UML-DataType: Distance 1, UML-DataType: Date 1';
COMMENT ON COLUMN ax_pfeilerhoehe_lagefestpunkt.abstand IS 'abstand  Distance 1';
COMMENT ON COLUMN ax_pfeilerhoehe_lagefestpunkt.messung IS 'messung  Date 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_offsetkomponenten_referenzstationspunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_offsetkomponenten_referenzstationspunkt AS (
	north double precision,
	east double precision,
	height double precision
);
END IF;
END$$;
COMMENT ON TYPE ax_offsetkomponenten_referenzstationspunkt IS 'Alias: "AX_Offsetkomponenten_Referenzstationspunkt", UML-DataType: Distance 1, UML-DataType: Distance 1, UML-DataType: Distance 1';
COMMENT ON COLUMN ax_offsetkomponenten_referenzstationspunkt.north IS 'north  Distance 1';
COMMENT ON COLUMN ax_offsetkomponenten_referenzstationspunkt.east IS 'east  Distance 1';
COMMENT ON COLUMN ax_offsetkomponenten_referenzstationspunkt.height IS 'height  Distance 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_gnssempfaenger'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_gnssempfaenger AS (
	gnssempfaengertyp character varying,
	seriennummer character varying,
	firmwareversion character varying,
	aufbaudatum character varying,
	abbaudatum character varying,
	zusaetzlicheinformationen character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_gnssempfaenger IS 'Alias: "AX_GNSSEmpfaenger",  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1]';
COMMENT ON COLUMN ax_gnssempfaenger.gnssempfaengertyp IS 'gnssEmpfaengertyp  CharacterString 0..1';
COMMENT ON COLUMN ax_gnssempfaenger.seriennummer IS 'seriennummer  CharacterString 0..1';
COMMENT ON COLUMN ax_gnssempfaenger.firmwareversion IS 'firmwareversion  CharacterString 0..1';
COMMENT ON COLUMN ax_gnssempfaenger.aufbaudatum IS 'aufbaudatum  CharacterString 0..1';
COMMENT ON COLUMN ax_gnssempfaenger.abbaudatum IS 'abbaudatum  CharacterString 0..1';
COMMENT ON COLUMN ax_gnssempfaenger.zusaetzlicheinformationen IS 'zusaetzlicheInformationen  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_gnssantenne'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_gnssantenne AS (
	gnssantennenundradometyp character varying,
	seriennummer character varying,
	antennenreferenzpunkt character varying,
	azimutaleabweichung double precision,
	antennenhoehe double precision,
	hoehenoffsetl1 double precision,
	hoehenoffsetl2 double precision,
	aufbaudatum character varying,
	abbaudatum character varying,
	zusaetzlicheinformationen character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_gnssantenne IS 'Alias: "AX_GNSSAntenne",  1,  1,  1, UML-DataType: Angle 1, UML-DataType: Distance 1, UML-DataType: Distance 1, UML-DataType: Distance 1,  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_gnssantenne.gnssantennenundradometyp IS 'gnssAntennenUndRadomeTyp  CharacterString 1';
COMMENT ON COLUMN ax_gnssantenne.seriennummer IS 'seriennummer  CharacterString 1';
COMMENT ON COLUMN ax_gnssantenne.antennenreferenzpunkt IS 'antennenreferenzpunkt  CharacterString 1';
COMMENT ON COLUMN ax_gnssantenne.azimutaleabweichung IS 'azimutaleAbweichung  Angle 1';
COMMENT ON COLUMN ax_gnssantenne.antennenhoehe IS 'antennenhoehe  Distance 1';
COMMENT ON COLUMN ax_gnssantenne.hoehenoffsetl1 IS 'hoehenoffsetL1  Distance 1';
COMMENT ON COLUMN ax_gnssantenne.hoehenoffsetl2 IS 'hoehenoffsetL2  Distance 1';
COMMENT ON COLUMN ax_gnssantenne.aufbaudatum IS 'aufbaudatum  CharacterString 1';
COMMENT ON COLUMN ax_gnssantenne.abbaudatum IS 'abbaudatum  CharacterString 0..1';
COMMENT ON COLUMN ax_gnssantenne.zusaetzlicheinformationen IS 'zusaetzlicheInformationen  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_flurstuecksnummer'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_flurstuecksnummer AS (
	zaehler character varying,
	nenner character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_flurstuecksnummer IS 'Alias: "AX_Flurstuecksnummer",  1,  [0..1]';
COMMENT ON COLUMN ax_flurstuecksnummer.zaehler IS 'zaehler  CharacterString 1';
COMMENT ON COLUMN ax_flurstuecksnummer.nenner IS 'nenner  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_sonstigeeigenschaften_flurstueck'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_sonstigeeigenschaften_flurstueck AS (
	kennungschluessel character varying,
	flaechedesabschnitts double precision,
	angabenzumabschnittflurstueck character varying,
	angabenzumabschnittstelle character varying,
	angabenzumabschnittnummeraktenzeichen character varying,
	angabenzumabschnittbemerkung character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_sonstigeeigenschaften_flurstueck IS 'Alias: "AX_SonstigeEigenschaften_Flurstueck",  [0..1], UML-DataType: Area [0..1],  [0..1],  [0..1],  [0..1],  [0..1]';
COMMENT ON COLUMN ax_sonstigeeigenschaften_flurstueck.kennungschluessel IS 'kennungSchluessel  CharacterString 0..1';
COMMENT ON COLUMN ax_sonstigeeigenschaften_flurstueck.flaechedesabschnitts IS 'flaecheDesAbschnitts  Area 0..1';
COMMENT ON COLUMN ax_sonstigeeigenschaften_flurstueck.angabenzumabschnittflurstueck IS 'angabenZumAbschnittFlurstueck  CharacterString 0..1';
COMMENT ON COLUMN ax_sonstigeeigenschaften_flurstueck.angabenzumabschnittstelle IS 'angabenZumAbschnittStelle  CharacterString 0..1';
COMMENT ON COLUMN ax_sonstigeeigenschaften_flurstueck.angabenzumabschnittnummeraktenzeichen IS 'angabenZumAbschnittNummerAktenzeichen  CharacterString 0..1';
COMMENT ON COLUMN ax_sonstigeeigenschaften_flurstueck.angabenzumabschnittbemerkung IS 'angabenZumAbschnittBemerkung  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dqschwere'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_dqschwere AS (
	datenerhebung ax_datenerhebung_schwere,
	bestimmungsdatum date,
	genauigkeitsstufe ax_genauigkeitsstufe_schwere,
	genauigkeitswert integer,
	vertrauenswuerdigkeit ax_vertrauenswuerdigkeit_schwere,
	messmethode ax_messmethode_schwere
);
END IF;
END$$;
COMMENT ON TYPE ax_dqschwere IS 'Alias: "AX_DQSchwere", UML-Classifier: AX_Datenerhebung_Schwere Stereotyp: enumeration [0..1], UML-DataType: Date [0..1], UML-Classifier: AX_Genauigkeitsstufe_Schwere Stereotyp: enumeration [0..1], UML-DataType: Integer [0..1], UML-Classifier: AX_Vertrauenswuerdigkeit_Schwere Stereotyp: enumeration [0..1], UML-Classifier: AX_Messmethode_Schwere Stereotyp: enumeration [0..1]';
COMMENT ON COLUMN ax_dqschwere.datenerhebung IS 'datenerhebung enumeration AX_Datenerhebung_Schwere 0..1';
COMMENT ON COLUMN ax_dqschwere.bestimmungsdatum IS 'bestimmungsdatum  Date 0..1';
COMMENT ON COLUMN ax_dqschwere.genauigkeitsstufe IS 'genauigkeitsstufe enumeration AX_Genauigkeitsstufe_Schwere 0..1';
COMMENT ON COLUMN ax_dqschwere.genauigkeitswert IS 'genauigkeitswert  Integer 0..1';
COMMENT ON COLUMN ax_dqschwere.vertrauenswuerdigkeit IS 'vertrauenswuerdigkeit enumeration AX_Vertrauenswuerdigkeit_Schwere 0..1';
COMMENT ON COLUMN ax_dqschwere.messmethode IS 'messmethode enumeration AX_Messmethode_Schwere 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_schwereanomalie_schwere'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_schwereanomalie_schwere AS (
	art ax_schwereanomalie_schwere_art,
	wert character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_schwereanomalie_schwere IS 'Alias: "AX_Schwereanomalie_Schwere", UML-Classifier: AX_Schwereanomalie_Schwere_Art Stereotyp: enumeration 1, UML-DataType: Measure 1';
COMMENT ON COLUMN ax_schwereanomalie_schwere.art IS 'art enumeration AX_Schwereanomalie_Schwere_Art 1';
COMMENT ON COLUMN ax_schwereanomalie_schwere.wert IS 'wert  Measure 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dqpunktort'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_dqpunktort AS (
	herkunft text,
	genauigkeitswert text,
	genauigkeitsstufe ax_genauigkeitsstufe_punktort,
	vertrauenswuerdigkeit ax_vertrauenswuerdigkeit_punktort,
	lagezuverlaessigkeit boolean
);
END IF;
END$$;
COMMENT ON TYPE ax_dqpunktort IS 'Alias: "AX_DQPunktort", UML-DataType: LI_Lineage [0..1], UML-DataType: DQ_RelativeInternalPositionalAccuracy [0..1], UML-Classifier: AX_Genauigkeitsstufe_Punktort Stereotyp: enumeration [0..1], UML-Classifier: AX_Vertrauenswuerdigkeit_Punktort Stereotyp: enumeration [0..1], UML-DataType: Boolean [0..1]';
COMMENT ON COLUMN ax_dqpunktort.herkunft IS 'herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_dqpunktort.genauigkeitswert IS 'genauigkeitswert  DQ_RelativeInternalPositionalAccuracy 0..1';
COMMENT ON COLUMN ax_dqpunktort.genauigkeitsstufe IS 'genauigkeitsstufe enumeration AX_Genauigkeitsstufe_Punktort 0..1';
COMMENT ON COLUMN ax_dqpunktort.vertrauenswuerdigkeit IS 'vertrauenswuerdigkeit enumeration AX_Vertrauenswuerdigkeit_Punktort 0..1';
COMMENT ON COLUMN ax_dqpunktort.lagezuverlaessigkeit IS 'lagezuverlaessigkeit  Boolean 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_buchungsblattbezirk_schluessel'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_buchungsblattbezirk_schluessel AS (
	land character varying,
	bezirk character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_buchungsblattbezirk_schluessel IS 'Alias: "AX_Buchungsblattbezirk_Schluessel",  1,  1';
COMMENT ON COLUMN ax_buchungsblattbezirk_schluessel.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_buchungsblattbezirk_schluessel.bezirk IS 'bezirk  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_buchung_historischesflurstueck'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_buchung_historischesflurstueck AS (
	blattart ax_blattart_historischesflurstueck,
	buchungsart character varying,
	buchungsblattkennzeichen character varying,
	buchungsblattbezirk ax_buchungsblattbezirk_schluessel,
	buchungsblattnummermitbuchstabenerweiterung character varying,
	laufendenummerderbuchungsstelle character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_buchung_historischesflurstueck IS 'Alias: "AX_Buchung_HistorischesFlurstueck", UML-Classifier: AX_Blattart_HistorischesFlurstueck Stereotyp: enumeration 1,  1,  1, UML-Classifier: AX_Buchungsblattbezirk_Schluessel Stereotyp: DataType 1,  1,  1';
COMMENT ON COLUMN ax_buchung_historischesflurstueck.blattart IS 'blattart enumeration AX_Blattart_HistorischesFlurstueck 1';
COMMENT ON COLUMN ax_buchung_historischesflurstueck.buchungsart IS 'buchungsart  CharacterString 1';
COMMENT ON COLUMN ax_buchung_historischesflurstueck.buchungsblattkennzeichen IS 'buchungsblattkennzeichen  CharacterString 1';
COMMENT ON COLUMN ax_buchung_historischesflurstueck.buchungsblattbezirk IS 'buchungsblattbezirk DataType AX_Buchungsblattbezirk_Schluessel 1';
COMMENT ON COLUMN ax_buchung_historischesflurstueck.buchungsblattnummermitbuchstabenerweiterung IS 'buchungsblattnummerMitBuchstabenerweiterung  CharacterString 1';
COMMENT ON COLUMN ax_buchung_historischesflurstueck.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_post'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_post AS (
	postleitzahl character varying,
	ortsnamepost character varying,
	zusatzortsname character varying,
	strassenname character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_post IS 'Alias: "AX_Post",  1,  1,  [0..1],  1';
COMMENT ON COLUMN ax_post.postleitzahl IS 'postleitzahl  CharacterString 1';
COMMENT ON COLUMN ax_post.ortsnamepost IS 'ortsnamePost  CharacterString 1';
COMMENT ON COLUMN ax_post.zusatzortsname IS 'zusatzOrtsname  CharacterString 0..1';
COMMENT ON COLUMN ax_post.strassenname IS 'strassenname  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_anschrift'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_anschrift AS (
	strassehausnummer character varying,
	plzort character varying,
	telefon character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_anschrift IS 'Alias: "AX_K_ANSCHRIFT",  1,  1,  [0..1]';
COMMENT ON COLUMN ax_k_anschrift.strassehausnummer IS 'strasseHausnummer  CharacterString 1';
COMMENT ON COLUMN ax_k_anschrift.plzort IS 'plzOrt  CharacterString 1';
COMMENT ON COLUMN ax_k_anschrift.telefon IS 'telefon  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_landeswappen'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_landeswappen AS (
	uri character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_landeswappen IS 'Alias: "AX_Landeswappen", UML-DataType: URI 1';
COMMENT ON COLUMN ax_landeswappen.uri IS 'uri  URI 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dienststellenlogo'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_dienststellenlogo AS (
	uri character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_dienststellenlogo IS 'Alias: "AX_Dienststellenlogo", UML-DataType: URI 1';
COMMENT ON COLUMN ax_dienststellenlogo.uri IS 'uri  URI 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_ausgkopf_standard'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_ausgkopf_standard AS (
	datumderausgabe character varying,
	dienststelle character varying,
	anschriftdienststelle ax_k_anschrift,
	artderausgabe character varying,
	enthaeltewp ax_landeswappen,
	dienststellenlogo ax_dienststellenlogo
);
END IF;
END$$;
COMMENT ON TYPE ax_k_ausgkopf_standard IS 'Alias: "AX_K_AUSGKOPF_Standard",  1,  [0..1], UML-Classifier: AX_K_ANSCHRIFT Stereotyp: DataType [0..1],  1, UML-Classifier: AX_Landeswappen Stereotyp: DataType 1, UML-Classifier: AX_Dienststellenlogo Stereotyp: DataType [0..1]';
COMMENT ON COLUMN ax_k_ausgkopf_standard.datumderausgabe IS 'datumDerAusgabe  CharacterString 1';
COMMENT ON COLUMN ax_k_ausgkopf_standard.dienststelle IS 'dienststelle  CharacterString 0..1';
COMMENT ON COLUMN ax_k_ausgkopf_standard.anschriftdienststelle IS 'anschriftDienststelle DataType AX_K_ANSCHRIFT 0..1';
COMMENT ON COLUMN ax_k_ausgkopf_standard.artderausgabe IS 'artDerAusgabe  CharacterString 1';
COMMENT ON COLUMN ax_k_ausgkopf_standard.enthaeltewp IS 'enthaeltEWP DataType AX_Landeswappen 1';
COMMENT ON COLUMN ax_k_ausgkopf_standard.dienststellenlogo IS 'dienststellenlogo DataType AX_Dienststellenlogo 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_landeswappen'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_landeswappen AS (
	uri character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_landeswappen IS 'Alias: "AX_Landeswappen", UML-DataType: URI 1';
COMMENT ON COLUMN ax_landeswappen.uri IS 'uri  URI 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dienststellenlogo'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_dienststellenlogo AS (
	uri character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_dienststellenlogo IS 'Alias: "AX_Dienststellenlogo", UML-DataType: URI 1';
COMMENT ON COLUMN ax_dienststellenlogo.uri IS 'uri  URI 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_fortfuehrungsnummer'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_fortfuehrungsnummer AS (
	land character varying,
	gemarkungsnummer character varying,
	laufendenummer character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_fortfuehrungsnummer IS 'Alias: "AX_Fortfuehrungsnummer",  1,  1,  1';
COMMENT ON COLUMN ax_fortfuehrungsnummer.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_fortfuehrungsnummer.gemarkungsnummer IS 'gemarkungsnummer  CharacterString 1';
COMMENT ON COLUMN ax_fortfuehrungsnummer.laufendenummer IS 'laufendeNummer  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_fgraphik'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_fgraphik AS (
	ausgabekopf ax_k_ausgkopf_standard,
	uri character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_fgraphik IS 'Alias: "AX_FGraphik", UML-Classifier: AX_K_AUSGKOPF_Standard Stereotyp: DataType 1, UML-DataType: URI 1';
COMMENT ON COLUMN ax_fgraphik.ausgabekopf IS 'ausgabekopf DataType AX_K_AUSGKOPF_Standard 1';
COMMENT ON COLUMN ax_fgraphik.uri IS 'uri  URI 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_anschrift'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_anschrift AS (
	strassehausnummer character varying,
	plzort character varying,
	telefon character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_anschrift IS 'Alias: "AX_K_ANSCHRIFT",  1,  1,  [0..1]';
COMMENT ON COLUMN ax_k_anschrift.strassehausnummer IS 'strasseHausnummer  CharacterString 1';
COMMENT ON COLUMN ax_k_anschrift.plzort IS 'plzOrt  CharacterString 1';
COMMENT ON COLUMN ax_k_anschrift.telefon IS 'telefon  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_auszug'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_auszug AS (
	art ax_art_adressat_auszug,
	adressat character varying,
	datum date
);
END IF;
END$$;
COMMENT ON TYPE ax_auszug IS 'Alias: "AX_Auszug", UML-Classifier: AX_Art_Adressat_Auszug Stereotyp: enumeration 1,  1, UML-DataType: Date 1';
COMMENT ON COLUMN ax_auszug.art IS 'art enumeration AX_Art_Adressat_Auszug 1';
COMMENT ON COLUMN ax_auszug.adressat IS 'adressat  CharacterString 1';
COMMENT ON COLUMN ax_auszug.datum IS 'datum  Date 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_nutzung_gebaeude'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_nutzung_gebaeude AS (
	anteil integer,
	nutzung ax_nutzung
);
END IF;
END$$;
COMMENT ON TYPE ax_nutzung_gebaeude IS 'Alias: "AX_Nutzung_Gebaeude", UML-DataType: Integer [0..1], UML-Classifier: AX_Nutzung Stereotyp: enumeration 1';
COMMENT ON COLUMN ax_nutzung_gebaeude.anteil IS 'anteil  Integer 0..1';
COMMENT ON COLUMN ax_nutzung_gebaeude.nutzung IS 'nutzung enumeration AX_Nutzung 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_kennziffergrabloch'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_kennziffergrabloch AS (
	land character varying,
	nummerierungsbezirk character varying,
	gemarkungsnummer character varying,
	nummerdesgrablochs character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_kennziffergrabloch IS 'Alias: "AX_KennzifferGrabloch",  [0..1],  [0..1],  [0..1],  1';
COMMENT ON COLUMN ax_kennziffergrabloch.land IS 'land  CharacterString 0..1';
COMMENT ON COLUMN ax_kennziffergrabloch.nummerierungsbezirk IS 'nummerierungsbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_kennziffergrabloch.gemarkungsnummer IS 'gemarkungsnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_kennziffergrabloch.nummerdesgrablochs IS 'nummerDesGrablochs  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_regierungsbezirk_schluessel'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_regierungsbezirk_schluessel AS (
	land character varying,
	regierungsbezirk character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_regierungsbezirk_schluessel IS 'Alias: "AX_Regierungsbezirk_Schluessel",  1,  1';
COMMENT ON COLUMN ax_regierungsbezirk_schluessel.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_regierungsbezirk_schluessel.regierungsbezirk IS 'regierungsbezirk  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_kreis_schluessel'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_kreis_schluessel AS (
	land character varying,
	regierungsbezirk character varying,
	kreis character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_kreis_schluessel IS 'Alias: "AX_Kreis_Schluessel",  1,  [0..1],  1';
COMMENT ON COLUMN ax_kreis_schluessel.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_kreis_schluessel.regierungsbezirk IS 'regierungsbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_kreis_schluessel.kreis IS 'kreis  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_buchungsblattbezirk_schluessel'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_buchungsblattbezirk_schluessel AS (
	land character varying,
	bezirk character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_buchungsblattbezirk_schluessel IS 'Alias: "AX_Buchungsblattbezirk_Schluessel",  1,  1';
COMMENT ON COLUMN ax_buchungsblattbezirk_schluessel.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_buchungsblattbezirk_schluessel.bezirk IS 'bezirk  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_gemeindekennzeichen'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_gemeindekennzeichen AS (
	land character varying,
	regierungsbezirk character varying,
	kreis character varying,
	gemeinde character varying,
	gemeindeteil character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_gemeindekennzeichen IS 'Alias: "AX_Gemeindekennzeichen",  1,  [0..1],  1,  1,  [0..1]';
COMMENT ON COLUMN ax_gemeindekennzeichen.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_gemeindekennzeichen.regierungsbezirk IS 'regierungsbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_gemeindekennzeichen.kreis IS 'kreis  CharacterString 1';
COMMENT ON COLUMN ax_gemeindekennzeichen.gemeinde IS 'gemeinde  CharacterString 1';
COMMENT ON COLUMN ax_gemeindekennzeichen.gemeindeteil IS 'gemeindeteil  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_verwaltungsgemeinschaft_schluessel'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_verwaltungsgemeinschaft_schluessel AS (
	land character varying,
	regierungsbezirk character varying,
	kreis character varying,
	verwaltungsgemeinschaft character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_verwaltungsgemeinschaft_schluessel IS 'Alias: "AX_Verwaltungsgemeinschaft_Schluessel",  1,  [0..1],  1,  1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft_schluessel.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft_schluessel.regierungsbezirk IS 'regierungsbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft_schluessel.kreis IS 'kreis  CharacterString 1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft_schluessel.verwaltungsgemeinschaft IS 'verwaltungsgemeinschaft  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_dienststelle_schluessel'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_dienststelle_schluessel AS (
	land character varying,
	stelle character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_dienststelle_schluessel IS 'Alias: "AX_Dienststelle_Schluessel",  1,  1';
COMMENT ON COLUMN ax_dienststelle_schluessel.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_dienststelle_schluessel.stelle IS 'stelle  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_verschluesseltelagebezeichnung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_verschluesseltelagebezeichnung AS (
	land character varying,
	regierungsbezirk character varying,
	kreis character varying,
	gemeinde character varying,
	lage character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_verschluesseltelagebezeichnung IS 'Alias: "AX_VerschluesselteLagebezeichnung",  1,  [0..1],  1,  1,  1';
COMMENT ON COLUMN ax_verschluesseltelagebezeichnung.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_verschluesseltelagebezeichnung.regierungsbezirk IS 'regierungsbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_verschluesseltelagebezeichnung.kreis IS 'kreis  CharacterString 1';
COMMENT ON COLUMN ax_verschluesseltelagebezeichnung.gemeinde IS 'gemeinde  CharacterString 1';
COMMENT ON COLUMN ax_verschluesseltelagebezeichnung.lage IS 'lage  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bundesland_schluessel'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_bundesland_schluessel AS (
	land character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_bundesland_schluessel IS 'Alias: "AX_Bundesland_Schluessel",  1';
COMMENT ON COLUMN ax_bundesland_schluessel.land IS 'land  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_gemarkungsteilflur_schluessel'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_gemarkungsteilflur_schluessel AS (
	land character varying,
	gemarkung character varying,
	gemarkungsteilflur character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_gemarkungsteilflur_schluessel IS 'Alias: "AX_GemarkungsteilFlur_Schluessel",  1,  1,  1';
COMMENT ON COLUMN ax_gemarkungsteilflur_schluessel.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_gemarkungsteilflur_schluessel.gemarkung IS 'gemarkung  CharacterString 1';
COMMENT ON COLUMN ax_gemarkungsteilflur_schluessel.gemarkungsteilflur IS 'gemarkungsteilFlur  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_gemarkung_schluessel'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_gemarkung_schluessel AS (
	land character varying,
	gemarkungsnummer character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_gemarkung_schluessel IS 'Alias: "AX_Gemarkung_Schluessel",  1,  1';
COMMENT ON COLUMN ax_gemarkung_schluessel.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_gemarkung_schluessel.gemarkungsnummer IS 'gemarkungsnummer  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_folgeva'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_folgeva AS (
	ausgabemasstab double precision,
	formatangabe character varying,
	ausgabemedium ax_ausgabemedium_benutzer,
	datenformat ax_datenformat_benutzer
);
END IF;
END$$;
COMMENT ON TYPE ax_folgeva IS 'Alias: "AX_FOLGEVA", UML-DataType: Real [0..1],  [0..1], UML-Classifier: AX_Ausgabemedium_Benutzer Stereotyp: enumeration [0..1], UML-Classifier: AX_Datenformat_Benutzer Stereotyp: enumeration [0..1]';
COMMENT ON COLUMN ax_folgeva.ausgabemasstab IS 'ausgabemasstab  Real 0..1';
COMMENT ON COLUMN ax_folgeva.formatangabe IS 'formatangabe  CharacterString 0..1';
COMMENT ON COLUMN ax_folgeva.ausgabemedium IS 'ausgabemedium enumeration AX_Ausgabemedium_Benutzer 0..1';
COMMENT ON COLUMN ax_folgeva.datenformat IS 'datenformat enumeration AX_Datenformat_Benutzer 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_bereichzeitlich'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_bereichzeitlich AS (
	art ax_art_bereichzeitlich,
	ersterstichtag date,
	intervall date
);
END IF;
END$$;
COMMENT ON TYPE ax_bereichzeitlich IS 'Alias: "AX_BereichZeitlich", UML-Classifier: AX_Art_BereichZeitlich Stereotyp: enumeration 1, UML-DataType: Date 1, UML-DataType: TM_Duration 1';
COMMENT ON COLUMN ax_bereichzeitlich.art IS 'art enumeration AX_Art_BereichZeitlich 1';
COMMENT ON COLUMN ax_bereichzeitlich.ersterstichtag IS 'ersterStichtag  Date 1';
COMMENT ON COLUMN ax_bereichzeitlich.intervall IS 'intervall  TM_Duration 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_portionierungsparameter'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_portionierungsparameter AS (
	seitenlaenge integer
);
END IF;
END$$;
COMMENT ON TYPE ax_portionierungsparameter IS 'Alias: "AX_Portionierungsparameter", UML-DataType: Integer 1';
COMMENT ON COLUMN ax_portionierungsparameter.seitenlaenge IS 'seitenlaenge  Integer 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_erfassunggewaesserbegrenzung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_erfassunggewaesserbegrenzung AS (
	description ax_dqerfassungsmethodegewaesserbegrenzung,
	datetime timestamp without time zone,
	identifikation ax_identifikation
);
END IF;
END$$;
COMMENT ON TYPE ax_erfassunggewaesserbegrenzung IS 'Alias: "AX_ErfassungGewaesserbegrenzung", UML-Classifier: AX_DQErfassungsmethodeGewaesserbegrenzung Stereotyp: enumeration 1, UML-DataType: DateTime [0..1], UML-Classifier: AX_Identifikation Stereotyp: enumeration 1';
COMMENT ON COLUMN ax_erfassunggewaesserbegrenzung.description IS 'description enumeration AX_DQErfassungsmethodeGewaesserbegrenzung 1';
COMMENT ON COLUMN ax_erfassunggewaesserbegrenzung.datetime IS 'dateTime  DateTime 0..1';
COMMENT ON COLUMN ax_erfassunggewaesserbegrenzung.identifikation IS 'identifikation enumeration AX_Identifikation 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_erfassung_dgmbesondererhoehenpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_erfassung_dgmbesondererhoehenpunkt AS (
	description ax_dqerfassungsmethodebesondererhoehenpunkt,
	datetime timestamp without time zone
);
END IF;
END$$;
COMMENT ON TYPE ax_erfassung_dgmbesondererhoehenpunkt IS 'Alias: "AX_Erfassung_DGMBesondererHoehenpunkt", UML-Classifier: AX_DQErfassungsmethodeBesondererHoehenpunkt Stereotyp: enumeration 1, UML-DataType: DateTime [0..1]';
COMMENT ON COLUMN ax_erfassung_dgmbesondererhoehenpunkt.description IS 'description enumeration AX_DQErfassungsmethodeBesondererHoehenpunkt 1';
COMMENT ON COLUMN ax_erfassung_dgmbesondererhoehenpunkt.datetime IS 'dateTime  DateTime 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_erfassung_dgm'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_erfassung_dgm AS (
	description ax_dqerfassungsmethode,
	datetime timestamp without time zone,
	identifikation ax_identifikation
);
END IF;
END$$;
COMMENT ON TYPE ax_erfassung_dgm IS 'Alias: "AX_Erfassung_DGM", UML-Classifier: AX_DQErfassungsmethode Stereotyp: enumeration 1, UML-DataType: DateTime [0..1], UML-Classifier: AX_Identifikation Stereotyp: enumeration 1';
COMMENT ON COLUMN ax_erfassung_dgm.description IS 'description enumeration AX_DQErfassungsmethode 1';
COMMENT ON COLUMN ax_erfassung_dgm.datetime IS 'dateTime  DateTime 0..1';
COMMENT ON COLUMN ax_erfassung_dgm.identifikation IS 'identifikation enumeration AX_Identifikation 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_erfassungmarkantergelaendepunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_erfassungmarkantergelaendepunkt AS (
	description ax_dqerfassungsmethodemarkantergelaendepunkt,
	datetime timestamp without time zone
);
END IF;
END$$;
COMMENT ON TYPE ax_erfassungmarkantergelaendepunkt IS 'Alias: "AX_ErfassungMarkanterGelaendepunkt", UML-Classifier: AX_DQErfassungsmethodeMarkanterGelaendepunkt Stereotyp: enumeration 1, UML-DataType: DateTime [0..1]';
COMMENT ON COLUMN ax_erfassungmarkantergelaendepunkt.description IS 'description enumeration AX_DQErfassungsmethodeMarkanterGelaendepunkt 1';
COMMENT ON COLUMN ax_erfassungmarkantergelaendepunkt.datetime IS 'dateTime  DateTime 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_erfassungstrukturiertegelaendepunkte'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_erfassungstrukturiertegelaendepunkte AS (
	description ax_dqerfassungsmethodestrukturiertegelaendepunkte,
	datetime timestamp without time zone
);
END IF;
END$$;
COMMENT ON TYPE ax_erfassungstrukturiertegelaendepunkte IS 'Alias: "AX_ErfassungStrukturierteGelaendepunkte", UML-Classifier: AX_DQErfassungsmethodeStrukturierteGelaendepunkte Stereotyp: enumeration 1, UML-DataType: DateTime [0..1]';
COMMENT ON COLUMN ax_erfassungstrukturiertegelaendepunkte.description IS 'description enumeration AX_DQErfassungsmethodeStrukturierteGelaendepunkte 1';
COMMENT ON COLUMN ax_erfassungstrukturiertegelaendepunkte.datetime IS 'dateTime  DateTime 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_erfassung_sekundaeresdgm'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_erfassung_sekundaeresdgm AS (
	description ax_dqerfassungsmethodesekundaeresdgm,
	datetime timestamp without time zone
);
END IF;
END$$;
COMMENT ON TYPE ax_erfassung_sekundaeresdgm IS 'Alias: "AX_Erfassung_SekundaeresDGM", UML-Classifier: AX_DQErfassungsmethodeSekundaeresDGM Stereotyp: enumeration 1, UML-DataType: DateTime [0..1]';
COMMENT ON COLUMN ax_erfassung_sekundaeresdgm.description IS 'description enumeration AX_DQErfassungsmethodeSekundaeresDGM 1';
COMMENT ON COLUMN ax_erfassung_sekundaeresdgm.datetime IS 'dateTime  DateTime 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_portionskennung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_portionskennung AS (
	profilkennung character varying,
	datum timestamp without time zone,
	laufendenummervongesamtzahl integer,
	gesamtzahl integer,
	suedwestecke geometry(POINT)
);
END IF;
END$$;
COMMENT ON TYPE ax_portionskennung IS 'Alias: "AX_Portionskennung",  1, UML-DataType: DateTime 1, UML-DataType: Integer 1, UML-DataType: Integer 1, UML-DataType: DirectPosition 1';
COMMENT ON COLUMN ax_portionskennung.profilkennung IS 'profilkennung  CharacterString 1';
COMMENT ON COLUMN ax_portionskennung.datum IS 'datum  DateTime 1';
COMMENT ON COLUMN ax_portionskennung.laufendenummervongesamtzahl IS 'laufendeNummerVonGesamtzahl  Integer 1';
COMMENT ON COLUMN ax_portionskennung.gesamtzahl IS 'gesamtzahl  Integer 1';
COMMENT ON COLUMN ax_portionskennung.suedwestecke IS 'suedwestEcke  DirectPosition 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_portion_erfolgreich'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_portion_erfolgreich AS (
	portionskennung ax_portionskennung,
	erfolgreich boolean,
	uebernahmeprotokoll character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_portion_erfolgreich IS 'Alias: "AX_Portion_Erfolgreich", UML-Classifier: AX_Portionskennung Stereotyp: DataType 1, UML-DataType: Boolean 1,  1';
COMMENT ON COLUMN ax_portion_erfolgreich.portionskennung IS 'portionskennung DataType AX_Portionskennung 1';
COMMENT ON COLUMN ax_portion_erfolgreich.erfolgreich IS 'erfolgreich  Boolean 1';
COMMENT ON COLUMN ax_portion_erfolgreich.uebernahmeprotokoll IS 'uebernahmeprotokoll  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lagesystem'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lagesystem AS (
	messjahr character varying,
	genauigkeitsstufe character varying,
	rechtswertodereast character varying,
	hochwertodernorth character varying,
	system character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lagesystem IS 'Alias: "AX_K_Lagesystem",  1,  [0..1],  1,  1,  1';
COMMENT ON COLUMN ax_k_lagesystem.messjahr IS 'messjahr  CharacterString 1';
COMMENT ON COLUMN ax_k_lagesystem.genauigkeitsstufe IS 'genauigkeitsstufe  CharacterString 0..1';
COMMENT ON COLUMN ax_k_lagesystem.rechtswertodereast IS 'rechtswertOderEast  CharacterString 1';
COMMENT ON COLUMN ax_k_lagesystem.hochwertodernorth IS 'hochwertOderNorth  CharacterString 1';
COMMENT ON COLUMN ax_k_lagesystem.system IS 'system  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_hoehensystem'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_hoehensystem AS (
	messjahr character varying,
	genauigkeitsstufe character varying,
	hoehe character varying,
	system character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_hoehensystem IS 'Alias: "AX_K_Hoehensystem",  1,  [0..1],  1,  1';
COMMENT ON COLUMN ax_k_hoehensystem.messjahr IS 'messjahr  CharacterString 1';
COMMENT ON COLUMN ax_k_hoehensystem.genauigkeitsstufe IS 'genauigkeitsstufe  CharacterString 0..1';
COMMENT ON COLUMN ax_k_hoehensystem.hoehe IS 'hoehe  CharacterString 1';
COMMENT ON COLUMN ax_k_hoehensystem.system IS 'system  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_schweresystem'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_schweresystem AS (
	messjahr character varying,
	genauigkeitsstufe character varying,
	schwere character varying,
	schweresystem character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_schweresystem IS 'Alias: "AX_K_Schweresystem",  1,  [0..1],  1,  1';
COMMENT ON COLUMN ax_k_schweresystem.messjahr IS 'messjahr  CharacterString 1';
COMMENT ON COLUMN ax_k_schweresystem.genauigkeitsstufe IS 'genauigkeitsstufe  CharacterString 0..1';
COMMENT ON COLUMN ax_k_schweresystem.schwere IS 'schwere  CharacterString 1';
COMMENT ON COLUMN ax_k_schweresystem.schweresystem IS 'schweresystem  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_positionssystem'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_positionssystem AS (
	messjahr character varying,
	genauigkeitsstufe character varying,
	eastoderxwert character varying,
	northoderywert character varying,
	hoeheoderzwert character varying,
	system character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_positionssystem IS 'Alias: "AX_K_Positionssystem",  1,  [0..1],  1,  1,  1,  1';
COMMENT ON COLUMN ax_k_positionssystem.messjahr IS 'messjahr  CharacterString 1';
COMMENT ON COLUMN ax_k_positionssystem.genauigkeitsstufe IS 'genauigkeitsstufe  CharacterString 0..1';
COMMENT ON COLUMN ax_k_positionssystem.eastoderxwert IS 'eastOderXWert  CharacterString 1';
COMMENT ON COLUMN ax_k_positionssystem.northoderywert IS 'northOderYWert  CharacterString 1';
COMMENT ON COLUMN ax_k_positionssystem.hoeheoderzwert IS 'hoeheOderZWert  CharacterString 1';
COMMENT ON COLUMN ax_k_positionssystem.system IS 'system  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktlistelagefestpunkte_eintrag'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_punktlistelagefestpunkte_eintrag AS (
	punktkennung character varying,
	vermarkungsart character varying,
	bemerkungen character varying,
	pfeilerhoehe character varying,
	rechtswertodereast character varying,
	hochwertodernorth character varying,
	hoehe character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_punktlistelagefestpunkte_eintrag IS 'Alias: "AX_PunktlisteLagefestpunkte_Eintrag",  1,  1,  [0..1],  [0..1],  1,  1,  1';
COMMENT ON COLUMN ax_punktlistelagefestpunkte_eintrag.punktkennung IS 'punktkennung  CharacterString 1';
COMMENT ON COLUMN ax_punktlistelagefestpunkte_eintrag.vermarkungsart IS 'vermarkungsart  CharacterString 1';
COMMENT ON COLUMN ax_punktlistelagefestpunkte_eintrag.bemerkungen IS 'bemerkungen  CharacterString 0..1';
COMMENT ON COLUMN ax_punktlistelagefestpunkte_eintrag.pfeilerhoehe IS 'pfeilerhoehe  CharacterString 0..1';
COMMENT ON COLUMN ax_punktlistelagefestpunkte_eintrag.rechtswertodereast IS 'rechtswertOderEast  CharacterString 1';
COMMENT ON COLUMN ax_punktlistelagefestpunkte_eintrag.hochwertodernorth IS 'hochwertOderNorth  CharacterString 1';
COMMENT ON COLUMN ax_punktlistelagefestpunkte_eintrag.hoehe IS 'hoehe  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktlistereferenzstationspunkte_eintrag'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_punktlistereferenzstationspunkte_eintrag AS (
	punktkennung character varying,
	name character varying,
	eastoderxwert character varying,
	northoderywert character varying,
	hoeheoderzwert character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_punktlistereferenzstationspunkte_eintrag IS 'Alias: "AX_PunktlisteReferenzstationspunkte_Eintrag",  1,  1,  1,  1,  1';
COMMENT ON COLUMN ax_punktlistereferenzstationspunkte_eintrag.punktkennung IS 'punktkennung  CharacterString 1';
COMMENT ON COLUMN ax_punktlistereferenzstationspunkte_eintrag.name IS 'name  CharacterString 1';
COMMENT ON COLUMN ax_punktlistereferenzstationspunkte_eintrag.eastoderxwert IS 'eastOderXWert  CharacterString 1';
COMMENT ON COLUMN ax_punktlistereferenzstationspunkte_eintrag.northoderywert IS 'northOderYWert  CharacterString 1';
COMMENT ON COLUMN ax_punktlistereferenzstationspunkte_eintrag.hoeheoderzwert IS 'hoeheOderZWert  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktlisteschwerefestpunkte_eintrag'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_punktlisteschwerefestpunkte_eintrag AS (
	punktkennung character varying,
	vermarkungsart character varying,
	bemerkungen character varying,
	rechtswertodereast character varying,
	hochwertodernorth character varying,
	hoehe character varying,
	schwere character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_punktlisteschwerefestpunkte_eintrag IS 'Alias: "AX_PunktlisteSchwerefestpunkte_Eintrag",  1,  1,  [0..1],  1,  1,  1,  1';
COMMENT ON COLUMN ax_punktlisteschwerefestpunkte_eintrag.punktkennung IS 'punktkennung  CharacterString 1';
COMMENT ON COLUMN ax_punktlisteschwerefestpunkte_eintrag.vermarkungsart IS 'vermarkungsart  CharacterString 1';
COMMENT ON COLUMN ax_punktlisteschwerefestpunkte_eintrag.bemerkungen IS 'bemerkungen  CharacterString 0..1';
COMMENT ON COLUMN ax_punktlisteschwerefestpunkte_eintrag.rechtswertodereast IS 'rechtswertOderEast  CharacterString 1';
COMMENT ON COLUMN ax_punktlisteschwerefestpunkte_eintrag.hochwertodernorth IS 'hochwertOderNorth  CharacterString 1';
COMMENT ON COLUMN ax_punktlisteschwerefestpunkte_eintrag.hoehe IS 'hoehe  CharacterString 1';
COMMENT ON COLUMN ax_punktlisteschwerefestpunkte_eintrag.schwere IS 'schwere  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktlistegrundnetzpunkt_eintrag'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_punktlistegrundnetzpunkt_eintrag AS (
	punktkennung character varying,
	vermarkungsart character varying,
	bemerkungen character varying,
	pfeilerhoehe character varying,
	eastoderxwert character varying,
	northoderywert character varying,
	hoeheoderzwert character varying,
	normalhoehe character varying,
	schwere character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_punktlistegrundnetzpunkt_eintrag IS 'Alias: "AX_PunktlisteGrundnetzpunkt_Eintrag",  1,  1,  [0..1],  [0..1],  1,  1,  1,  1,  1';
COMMENT ON COLUMN ax_punktlistegrundnetzpunkt_eintrag.punktkennung IS 'punktkennung  CharacterString 1';
COMMENT ON COLUMN ax_punktlistegrundnetzpunkt_eintrag.vermarkungsart IS 'vermarkungsart  CharacterString 1';
COMMENT ON COLUMN ax_punktlistegrundnetzpunkt_eintrag.bemerkungen IS 'bemerkungen  CharacterString 0..1';
COMMENT ON COLUMN ax_punktlistegrundnetzpunkt_eintrag.pfeilerhoehe IS 'pfeilerhoehe  CharacterString 0..1';
COMMENT ON COLUMN ax_punktlistegrundnetzpunkt_eintrag.eastoderxwert IS 'eastOderXWert  CharacterString 1';
COMMENT ON COLUMN ax_punktlistegrundnetzpunkt_eintrag.northoderywert IS 'northOderYWert  CharacterString 1';
COMMENT ON COLUMN ax_punktlistegrundnetzpunkt_eintrag.hoeheoderzwert IS 'hoeheOderZWert  CharacterString 1';
COMMENT ON COLUMN ax_punktlistegrundnetzpunkt_eintrag.normalhoehe IS 'normalhoehe  CharacterString 1';
COMMENT ON COLUMN ax_punktlistegrundnetzpunkt_eintrag.schwere IS 'schwere  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_punktlistehoehenfestpunkte_eintrag'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_punktlistehoehenfestpunkte_eintrag AS (
	punktkennung character varying,
	vermarkungsart character varying,
	bemerkungen character varying,
	rechtswertodereast character varying,
	hochwertodernorth character varying,
	hoehe character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_punktlistehoehenfestpunkte_eintrag IS 'Alias: "AX_PunktlisteHoehenfestpunkte_Eintrag",  1,  1,  [0..1],  1,  1,  1';
COMMENT ON COLUMN ax_punktlistehoehenfestpunkte_eintrag.punktkennung IS 'punktkennung  CharacterString 1';
COMMENT ON COLUMN ax_punktlistehoehenfestpunkte_eintrag.vermarkungsart IS 'vermarkungsart  CharacterString 1';
COMMENT ON COLUMN ax_punktlistehoehenfestpunkte_eintrag.bemerkungen IS 'bemerkungen  CharacterString 0..1';
COMMENT ON COLUMN ax_punktlistehoehenfestpunkte_eintrag.rechtswertodereast IS 'rechtswertOderEast  CharacterString 1';
COMMENT ON COLUMN ax_punktlistehoehenfestpunkte_eintrag.hochwertodernorth IS 'hochwertOderNorth  CharacterString 1';
COMMENT ON COLUMN ax_punktlistehoehenfestpunkte_eintrag.hoehe IS 'hoehe  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_buchungsangaben_hd'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_buchungsangaben_hd AS (
	gemarkungsname character varying,
	flurstuecksnummer ax_flurstuecksnummer,
	flurnummer character varying,
	laufendenummerderbuchungsstelle character varying,
	anteil ax_anteil,
	aufgeteilteranteil ax_anteil
);
END IF;
END$$;
COMMENT ON TYPE ax_k_buchungsangaben_hd IS 'Alias: "AX_K_Buchungsangaben_HD",  1, UML-Classifier: AX_Flurstuecksnummer Stereotyp: DataType 1,  [0..1],  1, UML-Classifier: AX_Anteil Stereotyp: DataType [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1]';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.gemarkungsname IS 'gemarkungsname  CharacterString 1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.flurnummer IS 'flurnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.aufgeteilteranteil IS 'aufgeteilterAnteil DataType AX_Anteil 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbez_lagebezeichnung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbez_lagebezeichnung AS (
	lagebezeichnung character varying,
	hausnummer character varying,
	ortsteil character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbez_lagebezeichnung IS 'Alias: "AX_K_LBEZ_Lagebezeichnung",  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.lagebezeichnung IS 'lagebezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.hausnummer IS 'hausnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.ortsteil IS 'ortsteil  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbez'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbez AS (
	lagebezeichnung ax_k_lbez_lagebezeichnung[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbez IS 'Alias: "AX_K_LBEZ", UML-Classifier: AX_K_LBEZ_Lagebezeichnung Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_k_lbez.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ_Lagebezeichnung 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_abschnitttn'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_abschnitttn AS (
	abschnittsflaechetn character varying,
	nutzung character varying,
	name character varying,
	zweitname character varying,
	zustand character varying,
	weiterenutzungsangaben character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_abschnitttn IS 'Alias: "AX_AbschnittTN",  1,  1,  [0..1],  [0..1],  [0..1],  [0..1]';
COMMENT ON COLUMN ax_abschnitttn.abschnittsflaechetn IS 'abschnittsflaecheTN  CharacterString 1';
COMMENT ON COLUMN ax_abschnitttn.nutzung IS 'nutzung  CharacterString 1';
COMMENT ON COLUMN ax_abschnitttn.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.zweitname IS 'zweitname  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.zustand IS 'zustand  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.weiterenutzungsangaben IS 'weitereNutzungsangaben  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_ntn'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_ntn AS (
	abschnitttn ax_abschnitttn
);
END IF;
END$$;
COMMENT ON TYPE ax_k_ntn IS 'Alias: "AX_K_NTN", UML-Classifier: AX_AbschnittTN Stereotyp: DataType 1';
COMMENT ON COLUMN ax_k_ntn.abschnitttn IS 'abschnittTN DataType AX_AbschnittTN 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_festlegungosw'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_festlegungosw AS (
	klassifizierung character varying,
	bezeichnung character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_festlegungosw IS 'Alias: "AX_FestlegungOSW",  1,  [0..1]';
COMMENT ON COLUMN ax_festlegungosw.klassifizierung IS 'klassifizierung  CharacterString 1';
COMMENT ON COLUMN ax_festlegungosw.bezeichnung IS 'bezeichnung  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_festlegungosz'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_festlegungosz AS (
	art character varying,
	zone character varying,
	name character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_festlegungosz IS 'Alias: "AX_FestlegungOSZ",  1,  1,  [0..1]';
COMMENT ON COLUMN ax_festlegungosz.art IS 'art  CharacterString 1';
COMMENT ON COLUMN ax_festlegungosz.zone IS 'zone  CharacterString 1';
COMMENT ON COLUMN ax_festlegungosz.name IS 'name  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_festlegungsonstigeorf'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_festlegungsonstigeorf AS (
	art character varying,
	besonderefunktionforst character varying,
	ausfuehrendestelle character varying,
	bezeichnung character varying,
	name character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_festlegungsonstigeorf IS 'Alias: "AX_FestlegungSonstigeORF",  1,  [0..1],  [0..1],  [0..1],  [0..1]';
COMMENT ON COLUMN ax_festlegungsonstigeorf.art IS 'art  CharacterString 1';
COMMENT ON COLUMN ax_festlegungsonstigeorf.besonderefunktionforst IS 'besondereFunktionForst  CharacterString 0..1';
COMMENT ON COLUMN ax_festlegungsonstigeorf.ausfuehrendestelle IS 'ausfuehrendeStelle  CharacterString 0..1';
COMMENT ON COLUMN ax_festlegungsonstigeorf.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_festlegungsonstigeorf.name IS 'name  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_orf'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_orf AS (
	festlegungosw ax_festlegungosw[],
	festlegungschutzgebietmitzoneneinteilung ax_festlegungosz[],
	festlegungsonstigeorf ax_festlegungsonstigeorf[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_orf IS 'Alias: "AX_K_ORF", UML-Classifier: AX_FestlegungOSW Stereotyp: DataType [0..*], UML-Classifier: AX_FestlegungOSZ Stereotyp: DataType [0..*], UML-Classifier: AX_FestlegungSonstigeORF Stereotyp: DataType [0..*]';
COMMENT ON COLUMN ax_k_orf.festlegungosw IS 'festlegungOSW DataType AX_FestlegungOSW 0..*';
COMMENT ON COLUMN ax_k_orf.festlegungschutzgebietmitzoneneinteilung IS 'festlegungSchutzgebietMitZoneneinteilung DataType AX_FestlegungOSZ 0..*';
COMMENT ON COLUMN ax_k_orf.festlegungsonstigeorf IS 'festlegungSonstigeORF DataType AX_FestlegungSonstigeORF 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_lagebezeichnung_k_gebaeude'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_lagebezeichnung_k_gebaeude AS (
	lagebezeichnung character varying,
	nummer character varying,
	laufendenummer character varying,
	ortsteil character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_lagebezeichnung_k_gebaeude IS 'Alias: "AX_Lagebezeichnung_K_GEBAEUDE",  1,  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_lagebezeichnung_k_gebaeude.lagebezeichnung IS 'lagebezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_lagebezeichnung_k_gebaeude.nummer IS 'nummer  CharacterString 1';
COMMENT ON COLUMN ax_lagebezeichnung_k_gebaeude.laufendenummer IS 'laufendeNummer  CharacterString 0..1';
COMMENT ON COLUMN ax_lagebezeichnung_k_gebaeude.ortsteil IS 'ortsteil  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_gebaeude'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_gebaeude AS (
	lagebezeichnung ax_lagebezeichnung_k_gebaeude[],
	gebaeudename character varying[],
	gebaeudefunktion character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_gebaeude IS 'Alias: "AX_K_GEBAEUDE", UML-Classifier: AX_Lagebezeichnung_K_GEBAEUDE Stereotyp: DataType [0..*],  [0..*],  1';
COMMENT ON COLUMN ax_k_gebaeude.lagebezeichnung IS 'lagebezeichnung DataType AX_Lagebezeichnung_K_GEBAEUDE 0..*';
COMMENT ON COLUMN ax_k_gebaeude.gebaeudename IS 'gebaeudename  CharacterString 0..*';
COMMENT ON COLUMN ax_k_gebaeude.gebaeudefunktion IS 'gebaeudefunktion  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_anliegervermerk'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_anliegervermerk AS (
	gemarkungsname character varying,
	flurstuecksnummer ax_flurstuecksnummer,
	flurnummer character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_anliegervermerk IS 'Alias: "AX_K_Anliegervermerk",  1, UML-Classifier: AX_Flurstuecksnummer Stereotyp: DataType 1,  [0..1]';
COMMENT ON COLUMN ax_k_anliegervermerk.gemarkungsname IS 'gemarkungsname  CharacterString 1';
COMMENT ON COLUMN ax_k_anliegervermerk.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_k_anliegervermerk.flurnummer IS 'flurnummer  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_flurstueck2'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_flurstueck2 AS (
	regierungsbezirk character varying,
	kreis character varying,
	gemeinde character varying,
	gemarkungsname character varying,
	flurstuecksnummer ax_flurstuecksnummer,
	flurnummer character varying,
	amtlicheflaeche double precision,
	lagebezeichnung ax_k_lbez[],
	tatsaechlichenutzung ax_k_ntn[],
	abschnitteorf ax_k_orf,
	gebaeude ax_k_gebaeude[],
	strittigegrenze boolean,
	rechtsbehelfsverfahren boolean,
	zweifelhafterflurstuecksnachweis boolean,
	anliegervermerk ax_k_anliegervermerk[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_flurstueck2 IS 'Alias: "AX_K_FLURSTUECK2",  [0..1],  [0..1],  [0..1],  1, UML-Classifier: AX_Flurstuecksnummer Stereotyp: DataType 1,  [0..1], UML-DataType: Area 1, UML-Classifier: AX_K_LBEZ Stereotyp: DataType [1..*], UML-Classifier: AX_K_NTN Stereotyp: DataType [1..*], UML-Classifier: AX_K_ORF Stereotyp: DataType [0..1], UML-Classifier: AX_K_GEBAEUDE Stereotyp: DataType [0..*], UML-DataType: Boolean [0..1], UML-DataType: Boolean [0..1], UML-DataType: Boolean [0..1], UML-Classifier: AX_K_Anliegervermerk Stereotyp: DataType [0..*]';
COMMENT ON COLUMN ax_k_flurstueck2.regierungsbezirk IS 'regierungsbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.kreis IS 'kreis  CharacterString 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.gemeinde IS 'gemeinde  CharacterString 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.gemarkungsname IS 'gemarkungsname  CharacterString 1';
COMMENT ON COLUMN ax_k_flurstueck2.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_k_flurstueck2.flurnummer IS 'flurnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.amtlicheflaeche IS 'amtlicheFlaeche  Area 1';
COMMENT ON COLUMN ax_k_flurstueck2.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ 1..*';
COMMENT ON COLUMN ax_k_flurstueck2.tatsaechlichenutzung IS 'tatsaechlicheNutzung DataType AX_K_NTN 1..*';
COMMENT ON COLUMN ax_k_flurstueck2.abschnitteorf IS 'abschnitteORF DataType AX_K_ORF 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.gebaeude IS 'gebaeude DataType AX_K_GEBAEUDE 0..*';
COMMENT ON COLUMN ax_k_flurstueck2.strittigegrenze IS 'strittigeGrenze  Boolean 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.rechtsbehelfsverfahren IS 'rechtsbehelfsverfahren  Boolean 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.zweifelhafterflurstuecksnachweis IS 'zweifelhafterFlurstuecksnachweis  Boolean 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.anliegervermerk IS 'anliegervermerk DataType AX_K_Anliegervermerk 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_buchung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_buchung AS (
	amtsgericht character varying,
	buchungsblattbezirk character varying,
	buchungsblattnummer character varying,
	laufendenummerderbuchungsstelle character varying,
	blattart character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_buchung IS 'Alias: "AX_Buchung",  [0..1],  [0..1],  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_buchung.amtsgericht IS 'amtsgericht  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattbezirk IS 'buchungsblattbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattnummer IS 'buchungsblattnummer  CharacterString 1';
COMMENT ON COLUMN ax_buchung.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.blattart IS 'blattart  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_namensnummer_k_pers1'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_namensnummer_k_pers1 AS (
	laufendenummer character varying,
	nummer character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_namensnummer_k_pers1 IS 'Alias: "AX_Namensnummer_K_PERS1",  1,  [0..1]';
COMMENT ON COLUMN ax_namensnummer_k_pers1.laufendenummer IS 'laufendeNummer  CharacterString 1';
COMMENT ON COLUMN ax_namensnummer_k_pers1.nummer IS 'nummer  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_pers1'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_pers1 AS (
	namensnummer ax_namensnummer_k_pers1,
	anteil ax_anteil,
	artderrechtsgemeinschaft character varying,
	beschriebderrechtsgemeinschaft character varying,
	nachnameoderfirma character varying,
	vorname character varying,
	namensbestandteil character varying,
	akademischergrad character varying,
	geburtsname character varying,
	bestimmungsland character varying,
	ort_post character varying,
	postleitzahlpostzustellung character varying,
	ortsteil character varying,
	strasse character varying,
	hausnummer character varying,
	weitereadressen character varying[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_pers1 IS 'Alias: "AX_K_PERS1", UML-Classifier: AX_Namensnummer_K_PERS1 Stereotyp: DataType [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..*]';
COMMENT ON COLUMN ax_k_pers1.namensnummer IS 'namensnummer DataType AX_Namensnummer_K_PERS1 0..1';
COMMENT ON COLUMN ax_k_pers1.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_k_pers1.artderrechtsgemeinschaft IS 'artDerRechtsgemeinschaft  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.beschriebderrechtsgemeinschaft IS 'beschriebDerRechtsgemeinschaft  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.nachnameoderfirma IS 'nachnameOderFirma  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.vorname IS 'vorname  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.namensbestandteil IS 'namensbestandteil  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.akademischergrad IS 'akademischerGrad  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.geburtsname IS 'geburtsname  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.bestimmungsland IS 'bestimmungsland  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.ort_post IS 'ort_Post  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.postleitzahlpostzustellung IS 'postleitzahlPostzustellung  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.ortsteil IS 'ortsteil  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.strasse IS 'strasse  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.hausnummer IS 'hausnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.weitereadressen IS 'weitereAdressen  CharacterString 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_recht'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_recht AS (
	buchung ax_buchung,
	buchungsart character varying,
	anteil ax_anteil,
	aufgeteilteranteil ax_anteil,
	rechtsinhaber ax_k_pers1[]
);
END IF;
END$$;
COMMENT ON TYPE ax_recht IS 'Alias: "AX_Recht", UML-Classifier: AX_Buchung Stereotyp: DataType 1,  1, UML-Classifier: AX_Anteil Stereotyp: DataType [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1], UML-Classifier: AX_K_PERS1 Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_recht.buchung IS 'buchung DataType AX_Buchung 1';
COMMENT ON COLUMN ax_recht.buchungsart IS 'buchungsart  CharacterString 1';
COMMENT ON COLUMN ax_recht.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_recht.aufgeteilteranteil IS 'aufgeteilterAnteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_recht.rechtsinhaber IS 'rechtsinhaber DataType AX_K_PERS1 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_grundstueck_bestandsnachweis'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_grundstueck_bestandsnachweis AS (
	laufendenummerderbuchungsstelle character varying,
	buchungsart character varying,
	buchungstext character varying,
	anteil ax_anteil,
	aufgeteilteranteil ax_anteil,
	nummerimaufteilungsplan character varying,
	beschreibungdessondereigentums character varying,
	herrschenddienend ax_k_buchungsangaben_hd[],
	flurstueck ax_k_flurstueck2[],
	grundstuecksflaeche character varying,
	grundstuecksgleicherechte ax_recht[]
);
END IF;
END$$;
COMMENT ON TYPE ax_grundstueck_bestandsnachweis IS 'Alias: "AX_Grundstueck_Bestandsnachweis",  [0..1],  1,  [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1],  [0..1],  [0..1], UML-Classifier: AX_K_Buchungsangaben_HD Stereotyp: DataType [0..*], UML-Classifier: AX_K_FLURSTUECK2 Stereotyp: DataType [1..*],  1, UML-Classifier: AX_Recht Stereotyp: DataType [0..*]';
COMMENT ON COLUMN ax_grundstueck_bestandsnachweis.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 0..1';
COMMENT ON COLUMN ax_grundstueck_bestandsnachweis.buchungsart IS 'buchungsart  CharacterString 1';
COMMENT ON COLUMN ax_grundstueck_bestandsnachweis.buchungstext IS 'buchungstext  CharacterString 0..1';
COMMENT ON COLUMN ax_grundstueck_bestandsnachweis.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_grundstueck_bestandsnachweis.aufgeteilteranteil IS 'aufgeteilterAnteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_grundstueck_bestandsnachweis.nummerimaufteilungsplan IS 'nummerImAufteilungsplan  CharacterString 0..1';
COMMENT ON COLUMN ax_grundstueck_bestandsnachweis.beschreibungdessondereigentums IS 'beschreibungDesSondereigentums  CharacterString 0..1';
COMMENT ON COLUMN ax_grundstueck_bestandsnachweis.herrschenddienend IS 'herrschendDienend DataType AX_K_Buchungsangaben_HD 0..*';
COMMENT ON COLUMN ax_grundstueck_bestandsnachweis.flurstueck IS 'flurstueck DataType AX_K_FLURSTUECK2 1..*';
COMMENT ON COLUMN ax_grundstueck_bestandsnachweis.grundstuecksflaeche IS 'grundstuecksflaeche  CharacterString 1';
COMMENT ON COLUMN ax_grundstueck_bestandsnachweis.grundstuecksgleicherechte IS 'grundstuecksgleicheRechte DataType AX_Recht 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_gebiet_statistikderflaechennachdembewertungsgesetz'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_gebiet_statistikderflaechennachdembewertungsgesetz AS (
	bezeichnung character varying,
	schluessel character varying,
	name character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_gebiet_statistikderflaechennachdembewertungsgesetz IS 'Alias: "AX_Gebiet_StatistikDerFlaechenNachDemBewertungsgesetz",  1,  1,  1';
COMMENT ON COLUMN ax_gebiet_statistikderflaechennachdembewertungsgesetz.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_gebiet_statistikderflaechennachdembewertungsgesetz.schluessel IS 'schluessel  CharacterString 1';
COMMENT ON COLUMN ax_gebiet_statistikderflaechennachdembewertungsgesetz.name IS 'name  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_gebiet_statistikderflaechendertn_all'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_gebiet_statistikderflaechendertn_all AS (
	anzahlflurstuecke character varying,
	schluessel character varying,
	name character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_gebiet_statistikderflaechendertn_all IS 'Alias: "AX_Gebiet_StatistikDerFlaechenDerTN_all",  1,  1,  1';
COMMENT ON COLUMN ax_gebiet_statistikderflaechendertn_all.anzahlflurstuecke IS 'anzahlFlurstuecke  CharacterString 1';
COMMENT ON COLUMN ax_gebiet_statistikderflaechendertn_all.schluessel IS 'schluessel  CharacterString 1';
COMMENT ON COLUMN ax_gebiet_statistikderflaechendertn_all.name IS 'name  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_abschnittwia'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_abschnittwia AS (
	abschnittsflaechetn character varying,
	wirtschaftsart ax_wirtschaftsart
);
END IF;
END$$;
COMMENT ON TYPE ax_abschnittwia IS 'Alias: "AX_AbschnittWIA",  1, UML-Classifier: AX_Wirtschaftsart Stereotyp: enumeration 1';
COMMENT ON COLUMN ax_abschnittwia.abschnittsflaechetn IS 'abschnittsflaecheTN  CharacterString 1';
COMMENT ON COLUMN ax_abschnittwia.wirtschaftsart IS 'wirtschaftsart enumeration AX_Wirtschaftsart 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_wia'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_wia AS (
	abschnittwia ax_abschnittwia
);
END IF;
END$$;
COMMENT ON TYPE ax_k_wia IS 'Alias: "AX_K_WIA", UML-Classifier: AX_AbschnittWIA Stereotyp: DataType 1';
COMMENT ON COLUMN ax_k_wia.abschnittwia IS 'abschnittWIA DataType AX_AbschnittWIA 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_abschnittwia'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_abschnittwia AS (
	abschnittsflaechetn character varying,
	wirtschaftsart ax_wirtschaftsart
);
END IF;
END$$;
COMMENT ON TYPE ax_abschnittwia IS 'Alias: "AX_AbschnittWIA",  1, UML-Classifier: AX_Wirtschaftsart Stereotyp: enumeration 1';
COMMENT ON COLUMN ax_abschnittwia.abschnittsflaechetn IS 'abschnittsflaecheTN  CharacterString 1';
COMMENT ON COLUMN ax_abschnittwia.wirtschaftsart IS 'wirtschaftsart enumeration AX_Wirtschaftsart 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_flurst_f_alt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_flurst_f_alt AS (
	flurstueckskennzeichen character varying,
	amtlicheflaeche character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_flurst_f_alt IS 'Alias: "AX_K_FLURST_F_alt",  1,  1';
COMMENT ON COLUMN ax_k_flurst_f_alt.flurstueckskennzeichen IS 'flurstueckskennzeichen  CharacterString 1';
COMMENT ON COLUMN ax_k_flurst_f_alt.amtlicheflaeche IS 'amtlicheFlaeche  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbez_lagebezeichnung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbez_lagebezeichnung AS (
	lagebezeichnung character varying,
	hausnummer character varying,
	ortsteil character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbez_lagebezeichnung IS 'Alias: "AX_K_LBEZ_Lagebezeichnung",  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.lagebezeichnung IS 'lagebezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.hausnummer IS 'hausnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.ortsteil IS 'ortsteil  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbez'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbez AS (
	lagebezeichnung ax_k_lbez_lagebezeichnung[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbez IS 'Alias: "AX_K_LBEZ", UML-Classifier: AX_K_LBEZ_Lagebezeichnung Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_k_lbez.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ_Lagebezeichnung 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_flurst_f_neu'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_flurst_f_neu AS (
	flurstueckskennzeichen character varying,
	amtlicheflaeche character varying,
	lagebezeichnung ax_k_lbez[],
	wirtschaftsart ax_k_wia[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_flurst_f_neu IS 'Alias: "AX_K_FLURST_F_neu",  1,  1, UML-Classifier: AX_K_LBEZ Stereotyp: DataType [1..*], UML-Classifier: AX_K_WIA Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_k_flurst_f_neu.flurstueckskennzeichen IS 'flurstueckskennzeichen  CharacterString 1';
COMMENT ON COLUMN ax_k_flurst_f_neu.amtlicheflaeche IS 'amtlicheFlaeche  CharacterString 1';
COMMENT ON COLUMN ax_k_flurst_f_neu.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ 1..*';
COMMENT ON COLUMN ax_k_flurst_f_neu.wirtschaftsart IS 'wirtschaftsart DataType AX_K_WIA 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_buchung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_buchung AS (
	amtsgericht character varying,
	buchungsblattbezirk character varying,
	buchungsblattnummer character varying,
	laufendenummerderbuchungsstelle character varying,
	blattart character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_buchung IS 'Alias: "AX_Buchung",  [0..1],  [0..1],  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_buchung.amtsgericht IS 'amtsgericht  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattbezirk IS 'buchungsblattbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattnummer IS 'buchungsblattnummer  CharacterString 1';
COMMENT ON COLUMN ax_buchung.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.blattart IS 'blattart  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_buchungsangaben'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_buchungsangaben AS (
	buchung ax_buchung,
	buchungsart character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_buchungsangaben IS 'Alias: "AX_K_BUCHUNGSANGABEN", UML-Classifier: AX_Buchung Stereotyp: DataType 1,  [0..1]';
COMMENT ON COLUMN ax_k_buchungsangaben.buchung IS 'buchung DataType AX_Buchung 1';
COMMENT ON COLUMN ax_k_buchungsangaben.buchungsart IS 'buchungsart  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_fanalyse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_fanalyse AS (
	gesamtflaechevorher character varying,
	flurstueckevorher integer,
	gesamtflaechenachher character varying,
	flurstueckenachher integer,
	flaechendifferenz character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_fanalyse IS 'Alias: "AX_K_FANALYSE",  1, UML-DataType: Integer 1,  1, UML-DataType: Integer 1,  [0..1]';
COMMENT ON COLUMN ax_k_fanalyse.gesamtflaechevorher IS 'gesamtflaecheVorher  CharacterString 1';
COMMENT ON COLUMN ax_k_fanalyse.flurstueckevorher IS 'flurstueckeVorher  Integer 1';
COMMENT ON COLUMN ax_k_fanalyse.gesamtflaechenachher IS 'gesamtflaecheNachher  CharacterString 1';
COMMENT ON COLUMN ax_k_fanalyse.flurstueckenachher IS 'flurstueckeNachher  Integer 1';
COMMENT ON COLUMN ax_k_fanalyse.flaechendifferenz IS 'flaechendifferenz  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_fortfuehrungsfall_fmj'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_fortfuehrungsfall_fmj AS (
	fortfuehrungsfallnummer integer,
	laufendenummer character varying,
	ueberschriftimfortfuehrungsnachweis aa_anlassart[],
	flurstueck_alt ax_k_flurst_f_alt[],
	flurstueck_neu ax_k_flurst_f_neu[],
	buchung ax_k_buchungsangaben[],
	strittigegrenze boolean,
	veraenderungsanalyse ax_k_fanalyse,
	verweistauf ax_fgraphik
);
END IF;
END$$;
COMMENT ON TYPE ax_k_fortfuehrungsfall_fmj IS 'Alias: "AX_K_Fortfuehrungsfall_FMJ", UML-DataType: Integer 1,  1, UML-Classifier: AA_Anlassart Stereotyp: codeList [1..*], UML-Classifier: AX_K_FLURST_F_alt Stereotyp: DataType [0..*], UML-Classifier: AX_K_FLURST_F_neu Stereotyp: DataType [0..*], UML-Classifier: AX_K_BUCHUNGSANGABEN Stereotyp: DataType [0..*], UML-DataType: Boolean 1, UML-Classifier: AX_K_FANALYSE Stereotyp: DataType [0..1], UML-Classifier: AX_FGraphik Stereotyp: DataType [0..1]';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fmj.fortfuehrungsfallnummer IS 'fortfuehrungsfallnummer  Integer 1';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fmj.laufendenummer IS 'laufendeNummer  CharacterString 1';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fmj.ueberschriftimfortfuehrungsnachweis IS 'ueberschriftImFortfuehrungsnachweis codeList AA_Anlassart 1..*';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fmj.flurstueck_alt IS 'flurstueck_alt DataType AX_K_FLURST_F_alt 0..*';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fmj.flurstueck_neu IS 'flurstueck_neu DataType AX_K_FLURST_F_neu 0..*';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fmj.buchung IS 'buchung DataType AX_K_BUCHUNGSANGABEN 0..*';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fmj.strittigegrenze IS 'strittigeGrenze  Boolean 1';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fmj.veraenderungsanalyse IS 'veraenderungsanalyse DataType AX_K_FANALYSE 0..1';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fmj.verweistauf IS 'verweistAuf DataType AX_FGraphik 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_flurst_f_alt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_flurst_f_alt AS (
	flurstueckskennzeichen character varying,
	amtlicheflaeche character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_flurst_f_alt IS 'Alias: "AX_K_FLURST_F_alt",  1,  1';
COMMENT ON COLUMN ax_k_flurst_f_alt.flurstueckskennzeichen IS 'flurstueckskennzeichen  CharacterString 1';
COMMENT ON COLUMN ax_k_flurst_f_alt.amtlicheflaeche IS 'amtlicheFlaeche  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbez_lagebezeichnung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbez_lagebezeichnung AS (
	lagebezeichnung character varying,
	hausnummer character varying,
	ortsteil character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbez_lagebezeichnung IS 'Alias: "AX_K_LBEZ_Lagebezeichnung",  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.lagebezeichnung IS 'lagebezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.hausnummer IS 'hausnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.ortsteil IS 'ortsteil  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbez'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbez AS (
	lagebezeichnung ax_k_lbez_lagebezeichnung[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbez IS 'Alias: "AX_K_LBEZ", UML-Classifier: AX_K_LBEZ_Lagebezeichnung Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_k_lbez.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ_Lagebezeichnung 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_flurst_f_neu'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_flurst_f_neu AS (
	flurstueckskennzeichen character varying,
	amtlicheflaeche character varying,
	lagebezeichnung ax_k_lbez[],
	wirtschaftsart ax_k_wia[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_flurst_f_neu IS 'Alias: "AX_K_FLURST_F_neu",  1,  1, UML-Classifier: AX_K_LBEZ Stereotyp: DataType [1..*], UML-Classifier: AX_K_WIA Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_k_flurst_f_neu.flurstueckskennzeichen IS 'flurstueckskennzeichen  CharacterString 1';
COMMENT ON COLUMN ax_k_flurst_f_neu.amtlicheflaeche IS 'amtlicheFlaeche  CharacterString 1';
COMMENT ON COLUMN ax_k_flurst_f_neu.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ 1..*';
COMMENT ON COLUMN ax_k_flurst_f_neu.wirtschaftsart IS 'wirtschaftsart DataType AX_K_WIA 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_fm_titel'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_fm_titel AS (
	ausgabekopf ax_k_ausgkopf_standard,
	ingemarkung character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_fm_titel IS 'Alias: "AX_K_FM_Titel", UML-Classifier: AX_K_AUSGKOPF_Standard Stereotyp: DataType 1,  1';
COMMENT ON COLUMN ax_k_fm_titel.ausgabekopf IS 'ausgabekopf DataType AX_K_AUSGKOPF_Standard 1';
COMMENT ON COLUMN ax_k_fm_titel.ingemarkung IS 'inGemarkung  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_buchung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_buchung AS (
	amtsgericht character varying,
	buchungsblattbezirk character varying,
	buchungsblattnummer character varying,
	laufendenummerderbuchungsstelle character varying,
	blattart character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_buchung IS 'Alias: "AX_Buchung",  [0..1],  [0..1],  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_buchung.amtsgericht IS 'amtsgericht  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattbezirk IS 'buchungsblattbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattnummer IS 'buchungsblattnummer  CharacterString 1';
COMMENT ON COLUMN ax_buchung.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.blattart IS 'blattart  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_namensnummer_k_pers1'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_namensnummer_k_pers1 AS (
	laufendenummer character varying,
	nummer character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_namensnummer_k_pers1 IS 'Alias: "AX_Namensnummer_K_PERS1",  1,  [0..1]';
COMMENT ON COLUMN ax_namensnummer_k_pers1.laufendenummer IS 'laufendeNummer  CharacterString 1';
COMMENT ON COLUMN ax_namensnummer_k_pers1.nummer IS 'nummer  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_pers1'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_pers1 AS (
	namensnummer ax_namensnummer_k_pers1,
	anteil ax_anteil,
	artderrechtsgemeinschaft character varying,
	beschriebderrechtsgemeinschaft character varying,
	nachnameoderfirma character varying,
	vorname character varying,
	namensbestandteil character varying,
	akademischergrad character varying,
	geburtsname character varying,
	bestimmungsland character varying,
	ort_post character varying,
	postleitzahlpostzustellung character varying,
	ortsteil character varying,
	strasse character varying,
	hausnummer character varying,
	weitereadressen character varying[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_pers1 IS 'Alias: "AX_K_PERS1", UML-Classifier: AX_Namensnummer_K_PERS1 Stereotyp: DataType [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..*]';
COMMENT ON COLUMN ax_k_pers1.namensnummer IS 'namensnummer DataType AX_Namensnummer_K_PERS1 0..1';
COMMENT ON COLUMN ax_k_pers1.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_k_pers1.artderrechtsgemeinschaft IS 'artDerRechtsgemeinschaft  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.beschriebderrechtsgemeinschaft IS 'beschriebDerRechtsgemeinschaft  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.nachnameoderfirma IS 'nachnameOderFirma  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.vorname IS 'vorname  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.namensbestandteil IS 'namensbestandteil  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.akademischergrad IS 'akademischerGrad  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.geburtsname IS 'geburtsname  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.bestimmungsland IS 'bestimmungsland  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.ort_post IS 'ort_Post  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.postleitzahlpostzustellung IS 'postleitzahlPostzustellung  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.ortsteil IS 'ortsteil  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.strasse IS 'strasse  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.hausnummer IS 'hausnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.weitereadressen IS 'weitereAdressen  CharacterString 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_recht'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_recht AS (
	buchung ax_buchung,
	buchungsart character varying,
	anteil ax_anteil,
	aufgeteilteranteil ax_anteil,
	rechtsinhaber ax_k_pers1[]
);
END IF;
END$$;
COMMENT ON TYPE ax_recht IS 'Alias: "AX_Recht", UML-Classifier: AX_Buchung Stereotyp: DataType 1,  1, UML-Classifier: AX_Anteil Stereotyp: DataType [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1], UML-Classifier: AX_K_PERS1 Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_recht.buchung IS 'buchung DataType AX_Buchung 1';
COMMENT ON COLUMN ax_recht.buchungsart IS 'buchungsart  CharacterString 1';
COMMENT ON COLUMN ax_recht.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_recht.aufgeteilteranteil IS 'aufgeteilterAnteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_recht.rechtsinhaber IS 'rechtsinhaber DataType AX_K_PERS1 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbez_lagebezeichnung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbez_lagebezeichnung AS (
	lagebezeichnung character varying,
	hausnummer character varying,
	ortsteil character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbez_lagebezeichnung IS 'Alias: "AX_K_LBEZ_Lagebezeichnung",  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.lagebezeichnung IS 'lagebezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.hausnummer IS 'hausnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.ortsteil IS 'ortsteil  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbez'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbez AS (
	lagebezeichnung ax_k_lbez_lagebezeichnung[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbez IS 'Alias: "AX_K_LBEZ", UML-Classifier: AX_K_LBEZ_Lagebezeichnung Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_k_lbez.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ_Lagebezeichnung 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_abschnitttn'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_abschnitttn AS (
	abschnittsflaechetn character varying,
	nutzung character varying,
	name character varying,
	zweitname character varying,
	zustand character varying,
	weiterenutzungsangaben character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_abschnitttn IS 'Alias: "AX_AbschnittTN",  1,  1,  [0..1],  [0..1],  [0..1],  [0..1]';
COMMENT ON COLUMN ax_abschnitttn.abschnittsflaechetn IS 'abschnittsflaecheTN  CharacterString 1';
COMMENT ON COLUMN ax_abschnitttn.nutzung IS 'nutzung  CharacterString 1';
COMMENT ON COLUMN ax_abschnitttn.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.zweitname IS 'zweitname  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.zustand IS 'zustand  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.weiterenutzungsangaben IS 'weitereNutzungsangaben  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_ntn'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_ntn AS (
	abschnitttn ax_abschnitttn
);
END IF;
END$$;
COMMENT ON TYPE ax_k_ntn IS 'Alias: "AX_K_NTN", UML-Classifier: AX_AbschnittTN Stereotyp: DataType 1';
COMMENT ON COLUMN ax_k_ntn.abschnitttn IS 'abschnittTN DataType AX_AbschnittTN 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_flurst_f'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_flurst_f AS (
	flurstueckskennzeichen character varying,
	amtlicheflaeche character varying,
	lagebezeichnung ax_k_lbez[],
	tatsaechlichenutzung ax_k_ntn[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_flurst_f IS 'Alias: "AX_K_FLURST_F",  1,  1, UML-Classifier: AX_K_LBEZ Stereotyp: DataType [1..*], UML-Classifier: AX_K_NTN Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_k_flurst_f.flurstueckskennzeichen IS 'flurstueckskennzeichen  CharacterString 1';
COMMENT ON COLUMN ax_k_flurst_f.amtlicheflaeche IS 'amtlicheFlaeche  CharacterString 1';
COMMENT ON COLUMN ax_k_flurst_f.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ 1..*';
COMMENT ON COLUMN ax_k_flurst_f.tatsaechlichenutzung IS 'tatsaechlicheNutzung DataType AX_K_NTN 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbez_lagebezeichnung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbez_lagebezeichnung AS (
	lagebezeichnung character varying,
	hausnummer character varying,
	ortsteil character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbez_lagebezeichnung IS 'Alias: "AX_K_LBEZ_Lagebezeichnung",  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.lagebezeichnung IS 'lagebezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.hausnummer IS 'hausnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.ortsteil IS 'ortsteil  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbez'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbez AS (
	lagebezeichnung ax_k_lbez_lagebezeichnung[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbez IS 'Alias: "AX_K_LBEZ", UML-Classifier: AX_K_LBEZ_Lagebezeichnung Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_k_lbez.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ_Lagebezeichnung 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_abschnitttn'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_abschnitttn AS (
	abschnittsflaechetn character varying,
	nutzung character varying,
	name character varying,
	zweitname character varying,
	zustand character varying,
	weiterenutzungsangaben character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_abschnitttn IS 'Alias: "AX_AbschnittTN",  1,  1,  [0..1],  [0..1],  [0..1],  [0..1]';
COMMENT ON COLUMN ax_abschnitttn.abschnittsflaechetn IS 'abschnittsflaecheTN  CharacterString 1';
COMMENT ON COLUMN ax_abschnitttn.nutzung IS 'nutzung  CharacterString 1';
COMMENT ON COLUMN ax_abschnitttn.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.zweitname IS 'zweitname  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.zustand IS 'zustand  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.weiterenutzungsangaben IS 'weitereNutzungsangaben  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_ntn'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_ntn AS (
	abschnitttn ax_abschnitttn
);
END IF;
END$$;
COMMENT ON TYPE ax_k_ntn IS 'Alias: "AX_K_NTN", UML-Classifier: AX_AbschnittTN Stereotyp: DataType 1';
COMMENT ON COLUMN ax_k_ntn.abschnitttn IS 'abschnittTN DataType AX_AbschnittTN 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_flurst_f'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_flurst_f AS (
	flurstueckskennzeichen character varying,
	amtlicheflaeche character varying,
	lagebezeichnung ax_k_lbez[],
	tatsaechlichenutzung ax_k_ntn[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_flurst_f IS 'Alias: "AX_K_FLURST_F",  1,  1, UML-Classifier: AX_K_LBEZ Stereotyp: DataType [1..*], UML-Classifier: AX_K_NTN Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_k_flurst_f.flurstueckskennzeichen IS 'flurstueckskennzeichen  CharacterString 1';
COMMENT ON COLUMN ax_k_flurst_f.amtlicheflaeche IS 'amtlicheFlaeche  CharacterString 1';
COMMENT ON COLUMN ax_k_flurst_f.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ 1..*';
COMMENT ON COLUMN ax_k_flurst_f.tatsaechlichenutzung IS 'tatsaechlicheNutzung DataType AX_K_NTN 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_buchung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_buchung AS (
	amtsgericht character varying,
	buchungsblattbezirk character varying,
	buchungsblattnummer character varying,
	laufendenummerderbuchungsstelle character varying,
	blattart character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_buchung IS 'Alias: "AX_Buchung",  [0..1],  [0..1],  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_buchung.amtsgericht IS 'amtsgericht  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattbezirk IS 'buchungsblattbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattnummer IS 'buchungsblattnummer  CharacterString 1';
COMMENT ON COLUMN ax_buchung.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.blattart IS 'blattart  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_buchungsangaben'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_buchungsangaben AS (
	buchung ax_buchung,
	buchungsart character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_buchungsangaben IS 'Alias: "AX_K_BUCHUNGSANGABEN", UML-Classifier: AX_Buchung Stereotyp: DataType 1,  [0..1]';
COMMENT ON COLUMN ax_k_buchungsangaben.buchung IS 'buchung DataType AX_Buchung 1';
COMMENT ON COLUMN ax_k_buchungsangaben.buchungsart IS 'buchungsart  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_fanalyse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_fanalyse AS (
	gesamtflaechevorher character varying,
	flurstueckevorher integer,
	gesamtflaechenachher character varying,
	flurstueckenachher integer,
	flaechendifferenz character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_fanalyse IS 'Alias: "AX_K_FANALYSE",  1, UML-DataType: Integer 1,  1, UML-DataType: Integer 1,  [0..1]';
COMMENT ON COLUMN ax_k_fanalyse.gesamtflaechevorher IS 'gesamtflaecheVorher  CharacterString 1';
COMMENT ON COLUMN ax_k_fanalyse.flurstueckevorher IS 'flurstueckeVorher  Integer 1';
COMMENT ON COLUMN ax_k_fanalyse.gesamtflaechenachher IS 'gesamtflaecheNachher  CharacterString 1';
COMMENT ON COLUMN ax_k_fanalyse.flurstueckenachher IS 'flurstueckeNachher  Integer 1';
COMMENT ON COLUMN ax_k_fanalyse.flaechendifferenz IS 'flaechendifferenz  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_fortfuehrungsfall_fm'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_fortfuehrungsfall_fm AS (
	fortfuehrungsfallnummer integer,
	laufendenummer character varying,
	ueberschriftimfortfuehrungsnachweis aa_anlassart[],
	anmerkungfuerdennotar character varying,
	bemerkung character varying,
	flurstueck_alt ax_k_flurst_f[],
	flurstueck_neu ax_k_flurst_f[],
	buchung ax_k_buchungsangaben[],
	veraenderungsanalyse ax_k_fanalyse
);
END IF;
END$$;
COMMENT ON TYPE ax_k_fortfuehrungsfall_fm IS 'Alias: "AX_K_Fortfuehrungsfall_FM", UML-DataType: Integer 1,  1, UML-Classifier: AA_Anlassart Stereotyp: codeList [1..*],  [0..1],  [0..1], UML-Classifier: AX_K_FLURST_F Stereotyp: DataType [0..*], UML-Classifier: AX_K_FLURST_F Stereotyp: DataType [0..*], UML-Classifier: AX_K_BUCHUNGSANGABEN Stereotyp: DataType [0..*], UML-Classifier: AX_K_FANALYSE Stereotyp: DataType [0..1]';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fm.fortfuehrungsfallnummer IS 'fortfuehrungsfallnummer  Integer 1';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fm.laufendenummer IS 'laufendeNummer  CharacterString 1';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fm.ueberschriftimfortfuehrungsnachweis IS 'ueberschriftImFortfuehrungsnachweis codeList AA_Anlassart 1..*';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fm.anmerkungfuerdennotar IS 'anmerkungFuerDenNotar  CharacterString 0..1';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fm.bemerkung IS 'bemerkung  CharacterString 0..1';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fm.flurstueck_alt IS 'flurstueck_alt DataType AX_K_FLURST_F 0..*';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fm.flurstueck_neu IS 'flurstueck_neu DataType AX_K_FLURST_F 0..*';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fm.buchung IS 'buchung DataType AX_K_BUCHUNGSANGABEN 0..*';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_fm.veraenderungsanalyse IS 'veraenderungsanalyse DataType AX_K_FANALYSE 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_bewgr'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_bewgr AS (
	gebiet character varying,
	klassifizierunggr ax_klassifizierunggr_k_bewgr,
	flaeche character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_bewgr IS 'Alias: "AX_K_BEWGR",  [0..1], UML-Classifier: AX_KlassifizierungGr_K_BEWGR Stereotyp: enumeration 1,  1';
COMMENT ON COLUMN ax_k_bewgr.gebiet IS 'gebiet  CharacterString 0..1';
COMMENT ON COLUMN ax_k_bewgr.klassifizierunggr IS 'klassifizierungGr enumeration AX_KlassifizierungGr_K_BEWGR 1';
COMMENT ON COLUMN ax_k_bewgr.flaeche IS 'flaeche  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_tnhgr_all'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_tnhgr_all AS (
	gebiet character varying,
	funktionhgr ax_funktionhgr_k_tnhgr,
	flaeche character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_tnhgr_all IS 'Alias: "AX_K_TNHGR_all",  [0..1], UML-Classifier: AX_FunktionHGr_K_TNHGR Stereotyp: enumeration 1,  1';
COMMENT ON COLUMN ax_k_tnhgr_all.gebiet IS 'gebiet  CharacterString 0..1';
COMMENT ON COLUMN ax_k_tnhgr_all.funktionhgr IS 'funktionHGr enumeration AX_FunktionHGr_K_TNHGR 1';
COMMENT ON COLUMN ax_k_tnhgr_all.flaeche IS 'flaeche  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_gkg'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_gkg AS (
	gemarkungsnummer character varying,
	gemarkungsname character varying,
	gemarkungsflaeche character varying,
	anzahlflurstuecke character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_gkg IS 'Alias: "AX_K_GKG",  1,  1,  1,  1';
COMMENT ON COLUMN ax_k_gkg.gemarkungsnummer IS 'gemarkungsnummer  CharacterString 1';
COMMENT ON COLUMN ax_k_gkg.gemarkungsname IS 'gemarkungsname  CharacterString 1';
COMMENT ON COLUMN ax_k_gkg.gemarkungsflaeche IS 'gemarkungsflaeche  CharacterString 1';
COMMENT ON COLUMN ax_k_gkg.anzahlflurstuecke IS 'anzahlFlurstuecke  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_flusu'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_flusu AS (
	gemarkung character varying,
	anzahlflurstuecke character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_flusu IS 'Alias: "AX_K_FLUSU",  1,  1';
COMMENT ON COLUMN ax_k_flusu.gemarkung IS 'gemarkung  CharacterString 1';
COMMENT ON COLUMN ax_k_flusu.anzahlflurstuecke IS 'anzahlFlurstuecke  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_tngrerweitert_all'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_tngrerweitert_all AS (
	flaeche character varying,
	funktionoa ax_funktionoa_k_tngrerweitert_all,
	gebiet character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_tngrerweitert_all IS 'Alias: "AX_K_TNGRerweitert_all",  1, UML-Classifier: AX_FunktionOA_K_TNGRerweitert_all Stereotyp: enumeration 1,  [0..1]';
COMMENT ON COLUMN ax_k_tngrerweitert_all.flaeche IS 'flaeche  CharacterString 1';
COMMENT ON COLUMN ax_k_tngrerweitert_all.funktionoa IS 'funktionOA enumeration AX_FunktionOA_K_TNGRerweitert_all 1';
COMMENT ON COLUMN ax_k_tngrerweitert_all.gebiet IS 'gebiet  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_tnfl'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_tnfl AS (
	funktionoa ax_funktionoa_k_tnfl,
	flaeche character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_tnfl IS 'Alias: "AX_K_TNFL", UML-Classifier: AX_FunktionOA_K_TNFL Stereotyp: enumeration 1,  1';
COMMENT ON COLUMN ax_k_tnfl.funktionoa IS 'funktionOA enumeration AX_FunktionOA_K_TNFL 1';
COMMENT ON COLUMN ax_k_tnfl.flaeche IS 'flaeche  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_flasu'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_flasu AS (
	gebiet character varying,
	flaechensumme character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_flasu IS 'Alias: "AX_K_FLASU",  1,  1';
COMMENT ON COLUMN ax_k_flasu.gebiet IS 'gebiet  CharacterString 1';
COMMENT ON COLUMN ax_k_flasu.flaechensumme IS 'flaechensumme  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_bewfl'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_bewfl AS (
	gebiet character varying,
	klassifizierungobg ax_klassifizierungobg_k_bewfl,
	flaeche character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_bewfl IS 'Alias: "AX_K_BEWFL",  [0..1], UML-Classifier: AX_KlassifizierungOBG_K_BEWFL Stereotyp: enumeration 1,  1';
COMMENT ON COLUMN ax_k_bewfl.gebiet IS 'gebiet  CharacterString 0..1';
COMMENT ON COLUMN ax_k_bewfl.klassifizierungobg IS 'klassifizierungOBG enumeration AX_KlassifizierungOBG_K_BEWFL 1';
COMMENT ON COLUMN ax_k_bewfl.flaeche IS 'flaeche  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_tngr_all'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_tngr_all AS (
	gebiet character varying,
	funktionoa ax_funktionoa_k_tngr_all,
	flaeche character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_tngr_all IS 'Alias: "AX_K_TNGR_all",  [0..1], UML-Classifier: AX_FunktionOA_K_TNGR_all Stereotyp: enumeration 1,  1';
COMMENT ON COLUMN ax_k_tngr_all.gebiet IS 'gebiet  CharacterString 0..1';
COMMENT ON COLUMN ax_k_tngr_all.funktionoa IS 'funktionOA enumeration AX_FunktionOA_K_TNGR_all 1';
COMMENT ON COLUMN ax_k_tngr_all.flaeche IS 'flaeche  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_tnhgr'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_tnhgr AS (
	funktionhgr ax_funktionhgr_k_tnhgr,
	flaeche character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_tnhgr IS 'Alias: "AX_K_TNHGR", UML-Classifier: AX_FunktionHGr_K_TNHGR Stereotyp: enumeration 1,  1';
COMMENT ON COLUMN ax_k_tnhgr.funktionhgr IS 'funktionHGr enumeration AX_FunktionHGr_K_TNHGR 1';
COMMENT ON COLUMN ax_k_tnhgr.flaeche IS 'flaeche  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_tnfl_all'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_tnfl_all AS (
	gebiet character varying,
	funktionoa ax_funktionoa_k_tngrerweitert_all,
	flaeche character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_tnfl_all IS 'Alias: "AX_K_TNFL_all",  [0..1], UML-Classifier: AX_FunktionOA_K_TNGRerweitert_all Stereotyp: enumeration 1,  1';
COMMENT ON COLUMN ax_k_tnfl_all.gebiet IS 'gebiet  CharacterString 0..1';
COMMENT ON COLUMN ax_k_tnfl_all.funktionoa IS 'funktionOA enumeration AX_FunktionOA_K_TNGRerweitert_all 1';
COMMENT ON COLUMN ax_k_tnfl_all.flaeche IS 'flaeche  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_kopf_flurstueck'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_kopf_flurstueck AS (
	gemarkungsname character varying,
	flurstuecksnummer ax_flurstuecksnummer,
	flurnummer character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_kopf_flurstueck IS 'Alias: "AX_Kopf_Flurstueck",  1, UML-Classifier: AX_Flurstuecksnummer Stereotyp: DataType 1,  [0..1]';
COMMENT ON COLUMN ax_kopf_flurstueck.gemarkungsname IS 'gemarkungsname  CharacterString 1';
COMMENT ON COLUMN ax_kopf_flurstueck.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_kopf_flurstueck.flurnummer IS 'flurnummer  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_abschnittobg'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_abschnittobg AS (
	abschnittsflaecheobg character varying,
	klassifizierung character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_abschnittobg IS 'Alias: "AX_AbschnittOBG",  1,  1';
COMMENT ON COLUMN ax_abschnittobg.abschnittsflaecheobg IS 'abschnittsflaecheOBG  CharacterString 1';
COMMENT ON COLUMN ax_abschnittobg.klassifizierung IS 'klassifizierung  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_festlegungosz'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_festlegungosz AS (
	art character varying,
	zone character varying,
	name character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_festlegungosz IS 'Alias: "AX_FestlegungOSZ",  1,  1,  [0..1]';
COMMENT ON COLUMN ax_festlegungosz.art IS 'art  CharacterString 1';
COMMENT ON COLUMN ax_festlegungosz.zone IS 'zone  CharacterString 1';
COMMENT ON COLUMN ax_festlegungosz.name IS 'name  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbez_lagebezeichnung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbez_lagebezeichnung AS (
	lagebezeichnung character varying,
	hausnummer character varying,
	ortsteil character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbez_lagebezeichnung IS 'Alias: "AX_K_LBEZ_Lagebezeichnung",  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.lagebezeichnung IS 'lagebezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.hausnummer IS 'hausnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.ortsteil IS 'ortsteil  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbez'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbez AS (
	lagebezeichnung ax_k_lbez_lagebezeichnung[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbez IS 'Alias: "AX_K_LBEZ", UML-Classifier: AX_K_LBEZ_Lagebezeichnung Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_k_lbez.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ_Lagebezeichnung 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_abschnitttn'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_abschnitttn AS (
	abschnittsflaechetn character varying,
	nutzung character varying,
	name character varying,
	zweitname character varying,
	zustand character varying,
	weiterenutzungsangaben character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_abschnitttn IS 'Alias: "AX_AbschnittTN",  1,  1,  [0..1],  [0..1],  [0..1],  [0..1]';
COMMENT ON COLUMN ax_abschnitttn.abschnittsflaechetn IS 'abschnittsflaecheTN  CharacterString 1';
COMMENT ON COLUMN ax_abschnitttn.nutzung IS 'nutzung  CharacterString 1';
COMMENT ON COLUMN ax_abschnitttn.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.zweitname IS 'zweitname  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.zustand IS 'zustand  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.weiterenutzungsangaben IS 'weitereNutzungsangaben  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_ntn'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_ntn AS (
	abschnitttn ax_abschnitttn
);
END IF;
END$$;
COMMENT ON TYPE ax_k_ntn IS 'Alias: "AX_K_NTN", UML-Classifier: AX_AbschnittTN Stereotyp: DataType 1';
COMMENT ON COLUMN ax_k_ntn.abschnitttn IS 'abschnittTN DataType AX_AbschnittTN 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_festlegungosw'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_festlegungosw AS (
	klassifizierung character varying,
	bezeichnung character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_festlegungosw IS 'Alias: "AX_FestlegungOSW",  1,  [0..1]';
COMMENT ON COLUMN ax_festlegungosw.klassifizierung IS 'klassifizierung  CharacterString 1';
COMMENT ON COLUMN ax_festlegungosw.bezeichnung IS 'bezeichnung  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_festlegungsonstigeorf'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_festlegungsonstigeorf AS (
	art character varying,
	besonderefunktionforst character varying,
	ausfuehrendestelle character varying,
	bezeichnung character varying,
	name character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_festlegungsonstigeorf IS 'Alias: "AX_FestlegungSonstigeORF",  1,  [0..1],  [0..1],  [0..1],  [0..1]';
COMMENT ON COLUMN ax_festlegungsonstigeorf.art IS 'art  CharacterString 1';
COMMENT ON COLUMN ax_festlegungsonstigeorf.besonderefunktionforst IS 'besondereFunktionForst  CharacterString 0..1';
COMMENT ON COLUMN ax_festlegungsonstigeorf.ausfuehrendestelle IS 'ausfuehrendeStelle  CharacterString 0..1';
COMMENT ON COLUMN ax_festlegungsonstigeorf.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_festlegungsonstigeorf.name IS 'name  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_orf'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_orf AS (
	festlegungosw ax_festlegungosw[],
	festlegungschutzgebietmitzoneneinteilung ax_festlegungosz[],
	festlegungsonstigeorf ax_festlegungsonstigeorf[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_orf IS 'Alias: "AX_K_ORF", UML-Classifier: AX_FestlegungOSW Stereotyp: DataType [0..*], UML-Classifier: AX_FestlegungOSZ Stereotyp: DataType [0..*], UML-Classifier: AX_FestlegungSonstigeORF Stereotyp: DataType [0..*]';
COMMENT ON COLUMN ax_k_orf.festlegungosw IS 'festlegungOSW DataType AX_FestlegungOSW 0..*';
COMMENT ON COLUMN ax_k_orf.festlegungschutzgebietmitzoneneinteilung IS 'festlegungSchutzgebietMitZoneneinteilung DataType AX_FestlegungOSZ 0..*';
COMMENT ON COLUMN ax_k_orf.festlegungsonstigeorf IS 'festlegungSonstigeORF DataType AX_FestlegungSonstigeORF 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_lagebezeichnung_k_gebaeude'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_lagebezeichnung_k_gebaeude AS (
	lagebezeichnung character varying,
	nummer character varying,
	laufendenummer character varying,
	ortsteil character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_lagebezeichnung_k_gebaeude IS 'Alias: "AX_Lagebezeichnung_K_GEBAEUDE",  1,  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_lagebezeichnung_k_gebaeude.lagebezeichnung IS 'lagebezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_lagebezeichnung_k_gebaeude.nummer IS 'nummer  CharacterString 1';
COMMENT ON COLUMN ax_lagebezeichnung_k_gebaeude.laufendenummer IS 'laufendeNummer  CharacterString 0..1';
COMMENT ON COLUMN ax_lagebezeichnung_k_gebaeude.ortsteil IS 'ortsteil  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_gebaeude'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_gebaeude AS (
	lagebezeichnung ax_lagebezeichnung_k_gebaeude[],
	gebaeudename character varying[],
	gebaeudefunktion character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_gebaeude IS 'Alias: "AX_K_GEBAEUDE", UML-Classifier: AX_Lagebezeichnung_K_GEBAEUDE Stereotyp: DataType [0..*],  [0..*],  1';
COMMENT ON COLUMN ax_k_gebaeude.lagebezeichnung IS 'lagebezeichnung DataType AX_Lagebezeichnung_K_GEBAEUDE 0..*';
COMMENT ON COLUMN ax_k_gebaeude.gebaeudename IS 'gebaeudename  CharacterString 0..*';
COMMENT ON COLUMN ax_k_gebaeude.gebaeudefunktion IS 'gebaeudefunktion  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_anliegervermerk'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_anliegervermerk AS (
	gemarkungsname character varying,
	flurstuecksnummer ax_flurstuecksnummer,
	flurnummer character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_anliegervermerk IS 'Alias: "AX_K_Anliegervermerk",  1, UML-Classifier: AX_Flurstuecksnummer Stereotyp: DataType 1,  [0..1]';
COMMENT ON COLUMN ax_k_anliegervermerk.gemarkungsname IS 'gemarkungsname  CharacterString 1';
COMMENT ON COLUMN ax_k_anliegervermerk.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_k_anliegervermerk.flurnummer IS 'flurnummer  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_flurstueck2'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_flurstueck2 AS (
	regierungsbezirk character varying,
	kreis character varying,
	gemeinde character varying,
	gemarkungsname character varying,
	flurstuecksnummer ax_flurstuecksnummer,
	flurnummer character varying,
	amtlicheflaeche double precision,
	lagebezeichnung ax_k_lbez[],
	tatsaechlichenutzung ax_k_ntn[],
	abschnitteorf ax_k_orf,
	gebaeude ax_k_gebaeude[],
	strittigegrenze boolean,
	rechtsbehelfsverfahren boolean,
	zweifelhafterflurstuecksnachweis boolean,
	anliegervermerk ax_k_anliegervermerk[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_flurstueck2 IS 'Alias: "AX_K_FLURSTUECK2",  [0..1],  [0..1],  [0..1],  1, UML-Classifier: AX_Flurstuecksnummer Stereotyp: DataType 1,  [0..1], UML-DataType: Area 1, UML-Classifier: AX_K_LBEZ Stereotyp: DataType [1..*], UML-Classifier: AX_K_NTN Stereotyp: DataType [1..*], UML-Classifier: AX_K_ORF Stereotyp: DataType [0..1], UML-Classifier: AX_K_GEBAEUDE Stereotyp: DataType [0..*], UML-DataType: Boolean [0..1], UML-DataType: Boolean [0..1], UML-DataType: Boolean [0..1], UML-Classifier: AX_K_Anliegervermerk Stereotyp: DataType [0..*]';
COMMENT ON COLUMN ax_k_flurstueck2.regierungsbezirk IS 'regierungsbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.kreis IS 'kreis  CharacterString 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.gemeinde IS 'gemeinde  CharacterString 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.gemarkungsname IS 'gemarkungsname  CharacterString 1';
COMMENT ON COLUMN ax_k_flurstueck2.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_k_flurstueck2.flurnummer IS 'flurnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.amtlicheflaeche IS 'amtlicheFlaeche  Area 1';
COMMENT ON COLUMN ax_k_flurstueck2.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ 1..*';
COMMENT ON COLUMN ax_k_flurstueck2.tatsaechlichenutzung IS 'tatsaechlicheNutzung DataType AX_K_NTN 1..*';
COMMENT ON COLUMN ax_k_flurstueck2.abschnitteorf IS 'abschnitteORF DataType AX_K_ORF 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.gebaeude IS 'gebaeude DataType AX_K_GEBAEUDE 0..*';
COMMENT ON COLUMN ax_k_flurstueck2.strittigegrenze IS 'strittigeGrenze  Boolean 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.rechtsbehelfsverfahren IS 'rechtsbehelfsverfahren  Boolean 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.zweifelhafterflurstuecksnachweis IS 'zweifelhafterFlurstuecksnachweis  Boolean 0..1';
COMMENT ON COLUMN ax_k_flurstueck2.anliegervermerk IS 'anliegervermerk DataType AX_K_Anliegervermerk 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_abschnittobs'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_abschnittobs AS (
	abschnittsflaecheobs character varying,
	beschrieb character varying,
	ertragsmesszahl integer
);
END IF;
END$$;
COMMENT ON TYPE ax_abschnittobs IS 'Alias: "AX_AbschnittOBS",  1,  1, UML-DataType: Integer 1';
COMMENT ON COLUMN ax_abschnittobs.abschnittsflaecheobs IS 'abschnittsflaecheOBS  CharacterString 1';
COMMENT ON COLUMN ax_abschnittobs.beschrieb IS 'beschrieb  CharacterString 1';
COMMENT ON COLUMN ax_abschnittobs.ertragsmesszahl IS 'ertragsmesszahl  Integer 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_buchung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_buchung AS (
	amtsgericht character varying,
	buchungsblattbezirk character varying,
	buchungsblattnummer character varying,
	laufendenummerderbuchungsstelle character varying,
	blattart character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_buchung IS 'Alias: "AX_Buchung",  [0..1],  [0..1],  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_buchung.amtsgericht IS 'amtsgericht  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattbezirk IS 'buchungsblattbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattnummer IS 'buchungsblattnummer  CharacterString 1';
COMMENT ON COLUMN ax_buchung.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.blattart IS 'blattart  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_namensnummer_k_pers1'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_namensnummer_k_pers1 AS (
	laufendenummer character varying,
	nummer character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_namensnummer_k_pers1 IS 'Alias: "AX_Namensnummer_K_PERS1",  1,  [0..1]';
COMMENT ON COLUMN ax_namensnummer_k_pers1.laufendenummer IS 'laufendeNummer  CharacterString 1';
COMMENT ON COLUMN ax_namensnummer_k_pers1.nummer IS 'nummer  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_pers1'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_pers1 AS (
	namensnummer ax_namensnummer_k_pers1,
	anteil ax_anteil,
	artderrechtsgemeinschaft character varying,
	beschriebderrechtsgemeinschaft character varying,
	nachnameoderfirma character varying,
	vorname character varying,
	namensbestandteil character varying,
	akademischergrad character varying,
	geburtsname character varying,
	bestimmungsland character varying,
	ort_post character varying,
	postleitzahlpostzustellung character varying,
	ortsteil character varying,
	strasse character varying,
	hausnummer character varying,
	weitereadressen character varying[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_pers1 IS 'Alias: "AX_K_PERS1", UML-Classifier: AX_Namensnummer_K_PERS1 Stereotyp: DataType [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..*]';
COMMENT ON COLUMN ax_k_pers1.namensnummer IS 'namensnummer DataType AX_Namensnummer_K_PERS1 0..1';
COMMENT ON COLUMN ax_k_pers1.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_k_pers1.artderrechtsgemeinschaft IS 'artDerRechtsgemeinschaft  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.beschriebderrechtsgemeinschaft IS 'beschriebDerRechtsgemeinschaft  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.nachnameoderfirma IS 'nachnameOderFirma  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.vorname IS 'vorname  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.namensbestandteil IS 'namensbestandteil  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.akademischergrad IS 'akademischerGrad  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.geburtsname IS 'geburtsname  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.bestimmungsland IS 'bestimmungsland  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.ort_post IS 'ort_Post  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.postleitzahlpostzustellung IS 'postleitzahlPostzustellung  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.ortsteil IS 'ortsteil  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.strasse IS 'strasse  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.hausnummer IS 'hausnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.weitereadressen IS 'weitereAdressen  CharacterString 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_eigentum_anlieger'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_eigentum_anlieger AS (
	buchung ax_buchung,
	buchungsart character varying,
	eigentuemer ax_k_pers1[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_eigentum_anlieger IS 'Alias: "AX_K_Eigentum_Anlieger", UML-Classifier: AX_Buchung Stereotyp: DataType 1,  1, UML-Classifier: AX_K_PERS1 Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_k_eigentum_anlieger.buchung IS 'buchung DataType AX_Buchung 1';
COMMENT ON COLUMN ax_k_eigentum_anlieger.buchungsart IS 'buchungsart  CharacterString 1';
COMMENT ON COLUMN ax_k_eigentum_anlieger.eigentuemer IS 'eigentuemer DataType AX_K_PERS1 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_abschnitttn'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_abschnitttn AS (
	abschnittsflaechetn character varying,
	nutzung character varying,
	name character varying,
	zweitname character varying,
	zustand character varying,
	weiterenutzungsangaben character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_abschnitttn IS 'Alias: "AX_AbschnittTN",  1,  1,  [0..1],  [0..1],  [0..1],  [0..1]';
COMMENT ON COLUMN ax_abschnitttn.abschnittsflaechetn IS 'abschnittsflaecheTN  CharacterString 1';
COMMENT ON COLUMN ax_abschnitttn.nutzung IS 'nutzung  CharacterString 1';
COMMENT ON COLUMN ax_abschnitttn.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.zweitname IS 'zweitname  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.zustand IS 'zustand  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.weiterenutzungsangaben IS 'weitereNutzungsangaben  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_ntn'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_ntn AS (
	abschnitttn ax_abschnitttn
);
END IF;
END$$;
COMMENT ON TYPE ax_k_ntn IS 'Alias: "AX_K_NTN", UML-Classifier: AX_AbschnittTN Stereotyp: DataType 1';
COMMENT ON COLUMN ax_k_ntn.abschnitttn IS 'abschnittTN DataType AX_AbschnittTN 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_bowert'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_bowert AS (
	abschnittobs ax_abschnittobs[],
	gesamtertragsmesszahl integer,
	abschnittobg ax_abschnittobg[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_bowert IS 'Alias: "AX_K_BOWERT", UML-Classifier: AX_AbschnittOBS Stereotyp: DataType [0..*], UML-DataType: Integer [0..1], UML-Classifier: AX_AbschnittOBG Stereotyp: DataType [0..*]';
COMMENT ON COLUMN ax_k_bowert.abschnittobs IS 'abschnittOBS DataType AX_AbschnittOBS 0..*';
COMMENT ON COLUMN ax_k_bowert.gesamtertragsmesszahl IS 'gesamtertragsmesszahl  Integer 0..1';
COMMENT ON COLUMN ax_k_bowert.abschnittobg IS 'abschnittOBG DataType AX_AbschnittOBG 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_buchung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_buchung AS (
	amtsgericht character varying,
	buchungsblattbezirk character varying,
	buchungsblattnummer character varying,
	laufendenummerderbuchungsstelle character varying,
	blattart character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_buchung IS 'Alias: "AX_Buchung",  [0..1],  [0..1],  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_buchung.amtsgericht IS 'amtsgericht  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattbezirk IS 'buchungsblattbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattnummer IS 'buchungsblattnummer  CharacterString 1';
COMMENT ON COLUMN ax_buchung.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.blattart IS 'blattart  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_buchungsangaben_hd'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_buchungsangaben_hd AS (
	gemarkungsname character varying,
	flurstuecksnummer ax_flurstuecksnummer,
	flurnummer character varying,
	laufendenummerderbuchungsstelle character varying,
	anteil ax_anteil,
	aufgeteilteranteil ax_anteil
);
END IF;
END$$;
COMMENT ON TYPE ax_k_buchungsangaben_hd IS 'Alias: "AX_K_Buchungsangaben_HD",  1, UML-Classifier: AX_Flurstuecksnummer Stereotyp: DataType 1,  [0..1],  1, UML-Classifier: AX_Anteil Stereotyp: DataType [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1]';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.gemarkungsname IS 'gemarkungsname  CharacterString 1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.flurnummer IS 'flurnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.aufgeteilteranteil IS 'aufgeteilterAnteil DataType AX_Anteil 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_namensnummer_k_pers1'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_namensnummer_k_pers1 AS (
	laufendenummer character varying,
	nummer character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_namensnummer_k_pers1 IS 'Alias: "AX_Namensnummer_K_PERS1",  1,  [0..1]';
COMMENT ON COLUMN ax_namensnummer_k_pers1.laufendenummer IS 'laufendeNummer  CharacterString 1';
COMMENT ON COLUMN ax_namensnummer_k_pers1.nummer IS 'nummer  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_pers1'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_pers1 AS (
	namensnummer ax_namensnummer_k_pers1,
	anteil ax_anteil,
	artderrechtsgemeinschaft character varying,
	beschriebderrechtsgemeinschaft character varying,
	nachnameoderfirma character varying,
	vorname character varying,
	namensbestandteil character varying,
	akademischergrad character varying,
	geburtsname character varying,
	bestimmungsland character varying,
	ort_post character varying,
	postleitzahlpostzustellung character varying,
	ortsteil character varying,
	strasse character varying,
	hausnummer character varying,
	weitereadressen character varying[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_pers1 IS 'Alias: "AX_K_PERS1", UML-Classifier: AX_Namensnummer_K_PERS1 Stereotyp: DataType [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..*]';
COMMENT ON COLUMN ax_k_pers1.namensnummer IS 'namensnummer DataType AX_Namensnummer_K_PERS1 0..1';
COMMENT ON COLUMN ax_k_pers1.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_k_pers1.artderrechtsgemeinschaft IS 'artDerRechtsgemeinschaft  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.beschriebderrechtsgemeinschaft IS 'beschriebDerRechtsgemeinschaft  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.nachnameoderfirma IS 'nachnameOderFirma  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.vorname IS 'vorname  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.namensbestandteil IS 'namensbestandteil  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.akademischergrad IS 'akademischerGrad  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.geburtsname IS 'geburtsname  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.bestimmungsland IS 'bestimmungsland  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.ort_post IS 'ort_Post  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.postleitzahlpostzustellung IS 'postleitzahlPostzustellung  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.ortsteil IS 'ortsteil  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.strasse IS 'strasse  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.hausnummer IS 'hausnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.weitereadressen IS 'weitereAdressen  CharacterString 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_eigentum'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_eigentum AS (
	buchung ax_buchung,
	buchungsart character varying,
	buchungstext character varying,
	anteil ax_anteil,
	aufgeteilteranteil ax_anteil,
	nummerimaufteilungsplan character varying,
	beschreibungdessondereigentums character varying,
	herrschenddienend ax_k_buchungsangaben_hd[],
	eigentuemer ax_k_pers1[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_eigentum IS 'Alias: "AX_K_Eigentum", UML-Classifier: AX_Buchung Stereotyp: DataType 1,  [0..1],  [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1],  [0..1],  [0..1], UML-Classifier: AX_K_Buchungsangaben_HD Stereotyp: DataType [0..*], UML-Classifier: AX_K_PERS1 Stereotyp: DataType [0..*]';
COMMENT ON COLUMN ax_k_eigentum.buchung IS 'buchung DataType AX_Buchung 1';
COMMENT ON COLUMN ax_k_eigentum.buchungsart IS 'buchungsart  CharacterString 0..1';
COMMENT ON COLUMN ax_k_eigentum.buchungstext IS 'buchungstext  CharacterString 0..1';
COMMENT ON COLUMN ax_k_eigentum.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_k_eigentum.aufgeteilteranteil IS 'aufgeteilterAnteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_k_eigentum.nummerimaufteilungsplan IS 'nummerImAufteilungsplan  CharacterString 0..1';
COMMENT ON COLUMN ax_k_eigentum.beschreibungdessondereigentums IS 'beschreibungDesSondereigentums  CharacterString 0..1';
COMMENT ON COLUMN ax_k_eigentum.herrschenddienend IS 'herrschendDienend DataType AX_K_Buchungsangaben_HD 0..*';
COMMENT ON COLUMN ax_k_eigentum.eigentuemer IS 'eigentuemer DataType AX_K_PERS1 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_flurstueck4'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_flurstueck4 AS (
	land character varying,
	gemarkungsnummer character varying,
	flurstuecksnummer ax_flurstuecksnummer,
	flurnummer character varying,
	amtlicheflaeche character varying,
	tatsaechlichenutzung ax_k_ntn[],
	abschnitteobsobg ax_k_bowert,
	eigentum ax_k_eigentum
);
END IF;
END$$;
COMMENT ON TYPE ax_k_flurstueck4 IS 'Alias: "AX_K_FLURSTUECK4",  1,  1, UML-Classifier: AX_Flurstuecksnummer Stereotyp: DataType 1,  [0..1],  1, UML-Classifier: AX_K_NTN Stereotyp: DataType [1..*], UML-Classifier: AX_K_BOWERT Stereotyp: DataType [0..1], UML-Classifier: AX_K_Eigentum Stereotyp: DataType 1';
COMMENT ON COLUMN ax_k_flurstueck4.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_k_flurstueck4.gemarkungsnummer IS 'gemarkungsnummer  CharacterString 1';
COMMENT ON COLUMN ax_k_flurstueck4.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_k_flurstueck4.flurnummer IS 'flurnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_flurstueck4.amtlicheflaeche IS 'amtlicheFlaeche  CharacterString 1';
COMMENT ON COLUMN ax_k_flurstueck4.tatsaechlichenutzung IS 'tatsaechlicheNutzung DataType AX_K_NTN 1..*';
COMMENT ON COLUMN ax_k_flurstueck4.abschnitteobsobg IS 'abschnitteOBSOBG DataType AX_K_BOWERT 0..1';
COMMENT ON COLUMN ax_k_flurstueck4.eigentum IS 'eigentum DataType AX_K_Eigentum 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_festlegungosw'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_festlegungosw AS (
	klassifizierung character varying,
	bezeichnung character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_festlegungosw IS 'Alias: "AX_FestlegungOSW",  1,  [0..1]';
COMMENT ON COLUMN ax_festlegungosw.klassifizierung IS 'klassifizierung  CharacterString 1';
COMMENT ON COLUMN ax_festlegungosw.bezeichnung IS 'bezeichnung  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbez_lagebezeichnung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbez_lagebezeichnung AS (
	lagebezeichnung character varying,
	hausnummer character varying,
	ortsteil character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbez_lagebezeichnung IS 'Alias: "AX_K_LBEZ_Lagebezeichnung",  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.lagebezeichnung IS 'lagebezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.hausnummer IS 'hausnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.ortsteil IS 'ortsteil  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbez'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbez AS (
	lagebezeichnung ax_k_lbez_lagebezeichnung[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbez IS 'Alias: "AX_K_LBEZ", UML-Classifier: AX_K_LBEZ_Lagebezeichnung Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_k_lbez.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ_Lagebezeichnung 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_anliegervermerk'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_anliegervermerk AS (
	gemarkungsname character varying,
	flurstuecksnummer ax_flurstuecksnummer,
	flurnummer character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_anliegervermerk IS 'Alias: "AX_K_Anliegervermerk",  1, UML-Classifier: AX_Flurstuecksnummer Stereotyp: DataType 1,  [0..1]';
COMMENT ON COLUMN ax_k_anliegervermerk.gemarkungsname IS 'gemarkungsname  CharacterString 1';
COMMENT ON COLUMN ax_k_anliegervermerk.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_k_anliegervermerk.flurnummer IS 'flurnummer  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_festlegungsonstigeorf'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_festlegungsonstigeorf AS (
	art character varying,
	besonderefunktionforst character varying,
	ausfuehrendestelle character varying,
	bezeichnung character varying,
	name character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_festlegungsonstigeorf IS 'Alias: "AX_FestlegungSonstigeORF",  1,  [0..1],  [0..1],  [0..1],  [0..1]';
COMMENT ON COLUMN ax_festlegungsonstigeorf.art IS 'art  CharacterString 1';
COMMENT ON COLUMN ax_festlegungsonstigeorf.besonderefunktionforst IS 'besondereFunktionForst  CharacterString 0..1';
COMMENT ON COLUMN ax_festlegungsonstigeorf.ausfuehrendestelle IS 'ausfuehrendeStelle  CharacterString 0..1';
COMMENT ON COLUMN ax_festlegungsonstigeorf.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_festlegungsonstigeorf.name IS 'name  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbez_lagebezeichnung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbez_lagebezeichnung AS (
	lagebezeichnung character varying,
	hausnummer character varying,
	ortsteil character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbez_lagebezeichnung IS 'Alias: "AX_K_LBEZ_Lagebezeichnung",  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.lagebezeichnung IS 'lagebezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.hausnummer IS 'hausnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_lbez_lagebezeichnung.ortsteil IS 'ortsteil  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_bowert'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_bowert AS (
	abschnittobs ax_abschnittobs[],
	gesamtertragsmesszahl integer,
	abschnittobg ax_abschnittobg[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_bowert IS 'Alias: "AX_K_BOWERT", UML-Classifier: AX_AbschnittOBS Stereotyp: DataType [0..*], UML-DataType: Integer [0..1], UML-Classifier: AX_AbschnittOBG Stereotyp: DataType [0..*]';
COMMENT ON COLUMN ax_k_bowert.abschnittobs IS 'abschnittOBS DataType AX_AbschnittOBS 0..*';
COMMENT ON COLUMN ax_k_bowert.gesamtertragsmesszahl IS 'gesamtertragsmesszahl  Integer 0..1';
COMMENT ON COLUMN ax_k_bowert.abschnittobg IS 'abschnittOBG DataType AX_AbschnittOBG 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_orf'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_orf AS (
	festlegungosw ax_festlegungosw[],
	festlegungschutzgebietmitzoneneinteilung ax_festlegungosz[],
	festlegungsonstigeorf ax_festlegungsonstigeorf[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_orf IS 'Alias: "AX_K_ORF", UML-Classifier: AX_FestlegungOSW Stereotyp: DataType [0..*], UML-Classifier: AX_FestlegungOSZ Stereotyp: DataType [0..*], UML-Classifier: AX_FestlegungSonstigeORF Stereotyp: DataType [0..*]';
COMMENT ON COLUMN ax_k_orf.festlegungosw IS 'festlegungOSW DataType AX_FestlegungOSW 0..*';
COMMENT ON COLUMN ax_k_orf.festlegungschutzgebietmitzoneneinteilung IS 'festlegungSchutzgebietMitZoneneinteilung DataType AX_FestlegungOSZ 0..*';
COMMENT ON COLUMN ax_k_orf.festlegungsonstigeorf IS 'festlegungSonstigeORF DataType AX_FestlegungSonstigeORF 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_anlieger'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_anlieger AS (
	gemarkungsname character varying,
	flurstuecksnummer ax_flurstuecksnummer,
	flurnummer character varying,
	buchungsangaben ax_k_eigentum_anlieger
);
END IF;
END$$;
COMMENT ON TYPE ax_k_anlieger IS 'Alias: "AX_K_Anlieger",  1, UML-Classifier: AX_Flurstuecksnummer Stereotyp: DataType 1,  [0..1], UML-Classifier: AX_K_Eigentum_Anlieger Stereotyp: DataType [0..1]';
COMMENT ON COLUMN ax_k_anlieger.gemarkungsname IS 'gemarkungsname  CharacterString 1';
COMMENT ON COLUMN ax_k_anlieger.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_k_anlieger.flurnummer IS 'flurnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_anlieger.buchungsangaben IS 'buchungsangaben DataType AX_K_Eigentum_Anlieger 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_flurstueck1'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_flurstueck1 AS (
	regierungsbezirk character varying,
	kreis character varying,
	gemeinde character varying,
	amtlicheflaeche double precision,
	abweichenderrechtszustand boolean,
	strittigegrenze boolean,
	rechtsbehelfsverfahren boolean,
	zweifelhafterflurstuecksnachweis boolean,
	lagebezeichnung ax_k_lbez[],
	abschnitteorf ax_k_orf,
	tatsaechlichenutzung ax_k_ntn[],
	anliegervermerk ax_k_anliegervermerk[],
	anlieger ax_k_anlieger[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_flurstueck1 IS 'Alias: "AX_K_FLURSTUECK1",  [0..1],  [0..1],  [0..1], UML-DataType: Area 1, UML-DataType: Boolean [0..1], UML-DataType: Boolean [0..1], UML-DataType: Boolean [0..1], UML-DataType: Boolean [0..1], UML-Classifier: AX_K_LBEZ Stereotyp: DataType [1..*], UML-Classifier: AX_K_ORF Stereotyp: DataType [0..1], UML-Classifier: AX_K_NTN Stereotyp: DataType [1..*], UML-Classifier: AX_K_Anliegervermerk Stereotyp: DataType [0..*], UML-Classifier: AX_K_Anlieger Stereotyp: DataType [0..*]';
COMMENT ON COLUMN ax_k_flurstueck1.regierungsbezirk IS 'regierungsbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_k_flurstueck1.kreis IS 'kreis  CharacterString 0..1';
COMMENT ON COLUMN ax_k_flurstueck1.gemeinde IS 'gemeinde  CharacterString 0..1';
COMMENT ON COLUMN ax_k_flurstueck1.amtlicheflaeche IS 'amtlicheFlaeche  Area 1';
COMMENT ON COLUMN ax_k_flurstueck1.abweichenderrechtszustand IS 'abweichenderRechtszustand  Boolean 0..1';
COMMENT ON COLUMN ax_k_flurstueck1.strittigegrenze IS 'strittigeGrenze  Boolean 0..1';
COMMENT ON COLUMN ax_k_flurstueck1.rechtsbehelfsverfahren IS 'rechtsbehelfsverfahren  Boolean 0..1';
COMMENT ON COLUMN ax_k_flurstueck1.zweifelhafterflurstuecksnachweis IS 'zweifelhafterFlurstuecksnachweis  Boolean 0..1';
COMMENT ON COLUMN ax_k_flurstueck1.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ 1..*';
COMMENT ON COLUMN ax_k_flurstueck1.abschnitteorf IS 'abschnitteORF DataType AX_K_ORF 0..1';
COMMENT ON COLUMN ax_k_flurstueck1.tatsaechlichenutzung IS 'tatsaechlicheNutzung DataType AX_K_NTN 1..*';
COMMENT ON COLUMN ax_k_flurstueck1.anliegervermerk IS 'anliegervermerk DataType AX_K_Anliegervermerk 0..*';
COMMENT ON COLUMN ax_k_flurstueck1.anlieger IS 'anlieger DataType AX_K_Anlieger 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_abschnitttn'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_abschnitttn AS (
	abschnittsflaechetn character varying,
	nutzung character varying,
	name character varying,
	zweitname character varying,
	zustand character varying,
	weiterenutzungsangaben character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_abschnitttn IS 'Alias: "AX_AbschnittTN",  1,  1,  [0..1],  [0..1],  [0..1],  [0..1]';
COMMENT ON COLUMN ax_abschnitttn.abschnittsflaechetn IS 'abschnittsflaecheTN  CharacterString 1';
COMMENT ON COLUMN ax_abschnitttn.nutzung IS 'nutzung  CharacterString 1';
COMMENT ON COLUMN ax_abschnitttn.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.zweitname IS 'zweitname  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.zustand IS 'zustand  CharacterString 0..1';
COMMENT ON COLUMN ax_abschnitttn.weiterenutzungsangaben IS 'weitereNutzungsangaben  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_flurst_f'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_flurst_f AS (
	flurstueckskennzeichen character varying,
	amtlicheflaeche character varying,
	lagebezeichnung ax_k_lbez[],
	tatsaechlichenutzung ax_k_ntn[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_flurst_f IS 'Alias: "AX_K_FLURST_F",  1,  1, UML-Classifier: AX_K_LBEZ Stereotyp: DataType [1..*], UML-Classifier: AX_K_NTN Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_k_flurst_f.flurstueckskennzeichen IS 'flurstueckskennzeichen  CharacterString 1';
COMMENT ON COLUMN ax_k_flurst_f.amtlicheflaeche IS 'amtlicheFlaeche  CharacterString 1';
COMMENT ON COLUMN ax_k_flurst_f.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ 1..*';
COMMENT ON COLUMN ax_k_flurst_f.tatsaechlichenutzung IS 'tatsaechlicheNutzung DataType AX_K_NTN 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_fn_deckblatt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_fn_deckblatt AS (
	ausgabekopf ax_k_ausgkopf_standard,
	fortfuehrungsfallnummernbereich character varying,
	fnnummer ax_fortfuehrungsnummer,
	titel character varying,
	ingemarkung ax_gemarkung_schluessel,
	erstelltam date,
	eignungspruefungam date,
	fortfuehrungsentscheidungam date,
	fortfuehrungsentscheidungvon character varying,
	eignungspruefungvon character varying,
	fortfuehrungsmitteilungenerzeugt date,
	bemerkung character varying,
	verwaltungsaktjn character varying,
	erstelltvon character varying,
	bekanntgabeanbeteiligteam date,
	auszugfuer ax_auszug[],
	grundbuchmitteilungfuerfinanzamt character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_fn_deckblatt IS 'Alias: "AX_K_FN_Deckblatt", UML-Classifier: AX_K_AUSGKOPF_Standard Stereotyp: DataType 1,  1, UML-Classifier: AX_Fortfuehrungsnummer Stereotyp: DataType 1,  1, UML-Classifier: AX_Gemarkung_Schluessel Stereotyp: DataType 1, UML-DataType: Date [0..1], UML-DataType: Date [0..1], UML-DataType: Date [0..1],  [0..1],  [0..1], UML-DataType: Date [0..1],  [0..1],  [0..1],  [0..1], UML-DataType: Date [0..1], UML-Classifier: AX_Auszug Stereotyp: DataType [0..*],  [0..1]';
COMMENT ON COLUMN ax_k_fn_deckblatt.ausgabekopf IS 'ausgabekopf DataType AX_K_AUSGKOPF_Standard 1';
COMMENT ON COLUMN ax_k_fn_deckblatt.fortfuehrungsfallnummernbereich IS 'fortfuehrungsfallNummernbereich  CharacterString 1';
COMMENT ON COLUMN ax_k_fn_deckblatt.fnnummer IS 'fNNummer DataType AX_Fortfuehrungsnummer 1';
COMMENT ON COLUMN ax_k_fn_deckblatt.titel IS 'titel  CharacterString 1';
COMMENT ON COLUMN ax_k_fn_deckblatt.ingemarkung IS 'inGemarkung DataType AX_Gemarkung_Schluessel 1';
COMMENT ON COLUMN ax_k_fn_deckblatt.erstelltam IS 'erstelltAm  Date 0..1';
COMMENT ON COLUMN ax_k_fn_deckblatt.eignungspruefungam IS 'eignungspruefungAm  Date 0..1';
COMMENT ON COLUMN ax_k_fn_deckblatt.fortfuehrungsentscheidungam IS 'fortfuehrungsentscheidungAm  Date 0..1';
COMMENT ON COLUMN ax_k_fn_deckblatt.fortfuehrungsentscheidungvon IS 'fortfuehrungsentscheidungVon  CharacterString 0..1';
COMMENT ON COLUMN ax_k_fn_deckblatt.eignungspruefungvon IS 'eignungspruefungVon  CharacterString 0..1';
COMMENT ON COLUMN ax_k_fn_deckblatt.fortfuehrungsmitteilungenerzeugt IS 'fortfuehrungsmitteilungenErzeugt  Date 0..1';
COMMENT ON COLUMN ax_k_fn_deckblatt.bemerkung IS 'bemerkung  CharacterString 0..1';
COMMENT ON COLUMN ax_k_fn_deckblatt.verwaltungsaktjn IS 'verwaltungsaktJN  CharacterString 0..1';
COMMENT ON COLUMN ax_k_fn_deckblatt.erstelltvon IS 'erstelltVon  CharacterString 0..1';
COMMENT ON COLUMN ax_k_fn_deckblatt.bekanntgabeanbeteiligteam IS 'bekanntgabeAnBeteiligteAm  Date 0..1';
COMMENT ON COLUMN ax_k_fn_deckblatt.auszugfuer IS 'auszugFuer DataType AX_Auszug 0..*';
COMMENT ON COLUMN ax_k_fn_deckblatt.grundbuchmitteilungfuerfinanzamt IS 'grundbuchmitteilungFuerFinanzamt  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_fanalyse'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_fanalyse AS (
	gesamtflaechevorher character varying,
	flurstueckevorher integer,
	gesamtflaechenachher character varying,
	flurstueckenachher integer,
	flaechendifferenz character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_fanalyse IS 'Alias: "AX_K_FANALYSE",  1, UML-DataType: Integer 1,  1, UML-DataType: Integer 1,  [0..1]';
COMMENT ON COLUMN ax_k_fanalyse.gesamtflaechevorher IS 'gesamtflaecheVorher  CharacterString 1';
COMMENT ON COLUMN ax_k_fanalyse.flurstueckevorher IS 'flurstueckeVorher  Integer 1';
COMMENT ON COLUMN ax_k_fanalyse.gesamtflaechenachher IS 'gesamtflaecheNachher  CharacterString 1';
COMMENT ON COLUMN ax_k_fanalyse.flurstueckenachher IS 'flurstueckeNachher  Integer 1';
COMMENT ON COLUMN ax_k_fanalyse.flaechendifferenz IS 'flaechendifferenz  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_buchung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_buchung AS (
	amtsgericht character varying,
	buchungsblattbezirk character varying,
	buchungsblattnummer character varying,
	laufendenummerderbuchungsstelle character varying,
	blattart character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_buchung IS 'Alias: "AX_Buchung",  [0..1],  [0..1],  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_buchung.amtsgericht IS 'amtsgericht  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattbezirk IS 'buchungsblattbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattnummer IS 'buchungsblattnummer  CharacterString 1';
COMMENT ON COLUMN ax_buchung.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.blattart IS 'blattart  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_buchungsangaben'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_buchungsangaben AS (
	buchung ax_buchung,
	buchungsart character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_buchungsangaben IS 'Alias: "AX_K_BUCHUNGSANGABEN", UML-Classifier: AX_Buchung Stereotyp: DataType 1,  [0..1]';
COMMENT ON COLUMN ax_k_buchungsangaben.buchung IS 'buchung DataType AX_Buchung 1';
COMMENT ON COLUMN ax_k_buchungsangaben.buchungsart IS 'buchungsart  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_fortfuehrungsfall_ausgabe'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_fortfuehrungsfall_ausgabe AS (
	fortfuehrungsfallnummer integer,
	laufendenummer character varying,
	ueberschriftimfortfuehrungsnachweis aa_anlassart[],
	anzahlderfortfuehrungsmitteilungen integer,
	fortfuehrungsmitteilunganeigentuemerantragsteller character varying,
	anmerkungfuerdennotar character varying,
	bemerkung character varying,
	flurstueck_alt ax_k_flurst_f[],
	flurstueck_neu ax_k_flurst_f[],
	buchung ax_k_buchungsangaben[],
	veraenderungsanalyse ax_k_fanalyse,
	verweistauf ax_fgraphik
);
END IF;
END$$;
COMMENT ON TYPE ax_k_fortfuehrungsfall_ausgabe IS 'Alias: "AX_K_Fortfuehrungsfall_Ausgabe", UML-DataType: Integer 1,  1, UML-Classifier: AA_Anlassart Stereotyp: codeList [1..*], UML-DataType: Integer [0..1],  [0..1],  [0..1],  [0..1], UML-Classifier: AX_K_FLURST_F Stereotyp: DataType [0..*], UML-Classifier: AX_K_FLURST_F Stereotyp: DataType [0..*], UML-Classifier: AX_K_BUCHUNGSANGABEN Stereotyp: DataType [0..*], UML-Classifier: AX_K_FANALYSE Stereotyp: DataType [0..1], UML-Classifier: AX_FGraphik Stereotyp: DataType [0..1]';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_ausgabe.fortfuehrungsfallnummer IS 'fortfuehrungsfallnummer  Integer 1';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_ausgabe.laufendenummer IS 'laufendeNummer  CharacterString 1';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_ausgabe.ueberschriftimfortfuehrungsnachweis IS 'ueberschriftImFortfuehrungsnachweis codeList AA_Anlassart 1..*';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_ausgabe.anzahlderfortfuehrungsmitteilungen IS 'anzahlDerFortfuehrungsmitteilungen  Integer 0..1';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_ausgabe.fortfuehrungsmitteilunganeigentuemerantragsteller IS 'fortfuehrungsmitteilungAnEigentuemerAntragsteller  CharacterString 0..1';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_ausgabe.anmerkungfuerdennotar IS 'anmerkungFuerDenNotar  CharacterString 0..1';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_ausgabe.bemerkung IS 'bemerkung  CharacterString 0..1';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_ausgabe.flurstueck_alt IS 'flurstueck_alt DataType AX_K_FLURST_F 0..*';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_ausgabe.flurstueck_neu IS 'flurstueck_neu DataType AX_K_FLURST_F 0..*';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_ausgabe.buchung IS 'buchung DataType AX_K_BUCHUNGSANGABEN 0..*';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_ausgabe.veraenderungsanalyse IS 'veraenderungsanalyse DataType AX_K_FANALYSE 0..1';
COMMENT ON COLUMN ax_k_fortfuehrungsfall_ausgabe.verweistauf IS 'verweistAuf DataType AX_FGraphik 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_lagebezeichnung_k_gebaeude'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_lagebezeichnung_k_gebaeude AS (
	lagebezeichnung character varying,
	nummer character varying,
	laufendenummer character varying,
	ortsteil character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_lagebezeichnung_k_gebaeude IS 'Alias: "AX_Lagebezeichnung_K_GEBAEUDE",  1,  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_lagebezeichnung_k_gebaeude.lagebezeichnung IS 'lagebezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_lagebezeichnung_k_gebaeude.nummer IS 'nummer  CharacterString 1';
COMMENT ON COLUMN ax_lagebezeichnung_k_gebaeude.laufendenummer IS 'laufendeNummer  CharacterString 0..1';
COMMENT ON COLUMN ax_lagebezeichnung_k_gebaeude.ortsteil IS 'ortsteil  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_lbh'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_lbh AS (
	kopf ax_kopf_flurstueck,
	lagebezeichnung ax_k_lbez_lagebezeichnung[],
	baublockbezeichnung character varying[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_lbh IS 'Alias: "AX_K_LBH", UML-Classifier: AX_Kopf_Flurstueck Stereotyp: DataType 1, UML-Classifier: AX_K_LBEZ_Lagebezeichnung Stereotyp: DataType [1..*],  [0..*]';
COMMENT ON COLUMN ax_k_lbh.kopf IS 'kopf DataType AX_Kopf_Flurstueck 1';
COMMENT ON COLUMN ax_k_lbh.lagebezeichnung IS 'lagebezeichnung DataType AX_K_LBEZ_Lagebezeichnung 1..*';
COMMENT ON COLUMN ax_k_lbh.baublockbezeichnung IS 'baublockbezeichnung  CharacterString 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_gebaeude'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_gebaeude AS (
	lagebezeichnung ax_lagebezeichnung_k_gebaeude[],
	gebaeudename character varying[],
	gebaeudefunktion character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_gebaeude IS 'Alias: "AX_K_GEBAEUDE", UML-Classifier: AX_Lagebezeichnung_K_GEBAEUDE Stereotyp: DataType [0..*],  [0..*],  1';
COMMENT ON COLUMN ax_k_gebaeude.lagebezeichnung IS 'lagebezeichnung DataType AX_Lagebezeichnung_K_GEBAEUDE 0..*';
COMMENT ON COLUMN ax_k_gebaeude.gebaeudename IS 'gebaeudename  CharacterString 0..*';
COMMENT ON COLUMN ax_k_gebaeude.gebaeudefunktion IS 'gebaeudefunktion  CharacterString 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_buchung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_buchung AS (
	amtsgericht character varying,
	buchungsblattbezirk character varying,
	buchungsblattnummer character varying,
	laufendenummerderbuchungsstelle character varying,
	blattart character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_buchung IS 'Alias: "AX_Buchung",  [0..1],  [0..1],  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_buchung.amtsgericht IS 'amtsgericht  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattbezirk IS 'buchungsblattbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattnummer IS 'buchungsblattnummer  CharacterString 1';
COMMENT ON COLUMN ax_buchung.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.blattart IS 'blattart  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_buchungsangaben_hd'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_buchungsangaben_hd AS (
	gemarkungsname character varying,
	flurstuecksnummer ax_flurstuecksnummer,
	flurnummer character varying,
	laufendenummerderbuchungsstelle character varying,
	anteil ax_anteil,
	aufgeteilteranteil ax_anteil
);
END IF;
END$$;
COMMENT ON TYPE ax_k_buchungsangaben_hd IS 'Alias: "AX_K_Buchungsangaben_HD",  1, UML-Classifier: AX_Flurstuecksnummer Stereotyp: DataType 1,  [0..1],  1, UML-Classifier: AX_Anteil Stereotyp: DataType [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1]';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.gemarkungsname IS 'gemarkungsname  CharacterString 1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.flurnummer IS 'flurnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.aufgeteilteranteil IS 'aufgeteilterAnteil DataType AX_Anteil 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_namensnummer_k_pers1'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_namensnummer_k_pers1 AS (
	laufendenummer character varying,
	nummer character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_namensnummer_k_pers1 IS 'Alias: "AX_Namensnummer_K_PERS1",  1,  [0..1]';
COMMENT ON COLUMN ax_namensnummer_k_pers1.laufendenummer IS 'laufendeNummer  CharacterString 1';
COMMENT ON COLUMN ax_namensnummer_k_pers1.nummer IS 'nummer  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_pers1'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_pers1 AS (
	namensnummer ax_namensnummer_k_pers1,
	anteil ax_anteil,
	artderrechtsgemeinschaft character varying,
	beschriebderrechtsgemeinschaft character varying,
	nachnameoderfirma character varying,
	vorname character varying,
	namensbestandteil character varying,
	akademischergrad character varying,
	geburtsname character varying,
	bestimmungsland character varying,
	ort_post character varying,
	postleitzahlpostzustellung character varying,
	ortsteil character varying,
	strasse character varying,
	hausnummer character varying,
	weitereadressen character varying[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_pers1 IS 'Alias: "AX_K_PERS1", UML-Classifier: AX_Namensnummer_K_PERS1 Stereotyp: DataType [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..*]';
COMMENT ON COLUMN ax_k_pers1.namensnummer IS 'namensnummer DataType AX_Namensnummer_K_PERS1 0..1';
COMMENT ON COLUMN ax_k_pers1.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_k_pers1.artderrechtsgemeinschaft IS 'artDerRechtsgemeinschaft  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.beschriebderrechtsgemeinschaft IS 'beschriebDerRechtsgemeinschaft  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.nachnameoderfirma IS 'nachnameOderFirma  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.vorname IS 'vorname  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.namensbestandteil IS 'namensbestandteil  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.akademischergrad IS 'akademischerGrad  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.geburtsname IS 'geburtsname  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.bestimmungsland IS 'bestimmungsland  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.ort_post IS 'ort_Post  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.postleitzahlpostzustellung IS 'postleitzahlPostzustellung  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.ortsteil IS 'ortsteil  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.strasse IS 'strasse  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.hausnummer IS 'hausnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.weitereadressen IS 'weitereAdressen  CharacterString 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_eigentum'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_eigentum AS (
	buchung ax_buchung,
	buchungsart character varying,
	buchungstext character varying,
	anteil ax_anteil,
	aufgeteilteranteil ax_anteil,
	nummerimaufteilungsplan character varying,
	beschreibungdessondereigentums character varying,
	herrschenddienend ax_k_buchungsangaben_hd[],
	eigentuemer ax_k_pers1[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_eigentum IS 'Alias: "AX_K_Eigentum", UML-Classifier: AX_Buchung Stereotyp: DataType 1,  [0..1],  [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1],  [0..1],  [0..1], UML-Classifier: AX_K_Buchungsangaben_HD Stereotyp: DataType [0..*], UML-Classifier: AX_K_PERS1 Stereotyp: DataType [0..*]';
COMMENT ON COLUMN ax_k_eigentum.buchung IS 'buchung DataType AX_Buchung 1';
COMMENT ON COLUMN ax_k_eigentum.buchungsart IS 'buchungsart  CharacterString 0..1';
COMMENT ON COLUMN ax_k_eigentum.buchungstext IS 'buchungstext  CharacterString 0..1';
COMMENT ON COLUMN ax_k_eigentum.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_k_eigentum.aufgeteilteranteil IS 'aufgeteilterAnteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_k_eigentum.nummerimaufteilungsplan IS 'nummerImAufteilungsplan  CharacterString 0..1';
COMMENT ON COLUMN ax_k_eigentum.beschreibungdessondereigentums IS 'beschreibungDesSondereigentums  CharacterString 0..1';
COMMENT ON COLUMN ax_k_eigentum.herrschenddienend IS 'herrschendDienend DataType AX_K_Buchungsangaben_HD 0..*';
COMMENT ON COLUMN ax_k_eigentum.eigentuemer IS 'eigentuemer DataType AX_K_PERS1 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_namensnummer_k_pers1'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_namensnummer_k_pers1 AS (
	laufendenummer character varying,
	nummer character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_namensnummer_k_pers1 IS 'Alias: "AX_Namensnummer_K_PERS1",  1,  [0..1]';
COMMENT ON COLUMN ax_namensnummer_k_pers1.laufendenummer IS 'laufendeNummer  CharacterString 1';
COMMENT ON COLUMN ax_namensnummer_k_pers1.nummer IS 'nummer  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_pers1'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_pers1 AS (
	namensnummer ax_namensnummer_k_pers1,
	anteil ax_anteil,
	artderrechtsgemeinschaft character varying,
	beschriebderrechtsgemeinschaft character varying,
	nachnameoderfirma character varying,
	vorname character varying,
	namensbestandteil character varying,
	akademischergrad character varying,
	geburtsname character varying,
	bestimmungsland character varying,
	ort_post character varying,
	postleitzahlpostzustellung character varying,
	ortsteil character varying,
	strasse character varying,
	hausnummer character varying,
	weitereadressen character varying[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_pers1 IS 'Alias: "AX_K_PERS1", UML-Classifier: AX_Namensnummer_K_PERS1 Stereotyp: DataType [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..1],  [0..*]';
COMMENT ON COLUMN ax_k_pers1.namensnummer IS 'namensnummer DataType AX_Namensnummer_K_PERS1 0..1';
COMMENT ON COLUMN ax_k_pers1.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_k_pers1.artderrechtsgemeinschaft IS 'artDerRechtsgemeinschaft  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.beschriebderrechtsgemeinschaft IS 'beschriebDerRechtsgemeinschaft  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.nachnameoderfirma IS 'nachnameOderFirma  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.vorname IS 'vorname  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.namensbestandteil IS 'namensbestandteil  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.akademischergrad IS 'akademischerGrad  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.geburtsname IS 'geburtsname  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.bestimmungsland IS 'bestimmungsland  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.ort_post IS 'ort_Post  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.postleitzahlpostzustellung IS 'postleitzahlPostzustellung  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.ortsteil IS 'ortsteil  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.strasse IS 'strasse  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.hausnummer IS 'hausnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_pers1.weitereadressen IS 'weitereAdressen  CharacterString 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_buchungsangaben_hd'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_buchungsangaben_hd AS (
	gemarkungsname character varying,
	flurstuecksnummer ax_flurstuecksnummer,
	flurnummer character varying,
	laufendenummerderbuchungsstelle character varying,
	anteil ax_anteil,
	aufgeteilteranteil ax_anteil
);
END IF;
END$$;
COMMENT ON TYPE ax_k_buchungsangaben_hd IS 'Alias: "AX_K_Buchungsangaben_HD",  1, UML-Classifier: AX_Flurstuecksnummer Stereotyp: DataType 1,  [0..1],  1, UML-Classifier: AX_Anteil Stereotyp: DataType [0..1], UML-Classifier: AX_Anteil Stereotyp: DataType [0..1]';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.gemarkungsname IS 'gemarkungsname  CharacterString 1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.flurnummer IS 'flurnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_k_buchungsangaben_hd.aufgeteilteranteil IS 'aufgeteilterAnteil DataType AX_Anteil 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_buchung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_buchung AS (
	amtsgericht character varying,
	buchungsblattbezirk character varying,
	buchungsblattnummer character varying,
	laufendenummerderbuchungsstelle character varying,
	blattart character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_buchung IS 'Alias: "AX_Buchung",  [0..1],  [0..1],  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_buchung.amtsgericht IS 'amtsgericht  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattbezirk IS 'buchungsblattbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattnummer IS 'buchungsblattnummer  CharacterString 1';
COMMENT ON COLUMN ax_buchung.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.blattart IS 'blattart  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_buchungsangaben'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_buchungsangaben AS (
	buchung ax_buchung,
	buchungsart character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_k_buchungsangaben IS 'Alias: "AX_K_BUCHUNGSANGABEN", UML-Classifier: AX_Buchung Stereotyp: DataType 1,  [0..1]';
COMMENT ON COLUMN ax_k_buchungsangaben.buchung IS 'buchung DataType AX_Buchung 1';
COMMENT ON COLUMN ax_k_buchungsangaben.buchungsart IS 'buchungsart  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_buchung'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_buchung AS (
	amtsgericht character varying,
	buchungsblattbezirk character varying,
	buchungsblattnummer character varying,
	laufendenummerderbuchungsstelle character varying,
	blattart character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_buchung IS 'Alias: "AX_Buchung",  [0..1],  [0..1],  1,  [0..1],  [0..1]';
COMMENT ON COLUMN ax_buchung.amtsgericht IS 'amtsgericht  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattbezirk IS 'buchungsblattbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.buchungsblattnummer IS 'buchungsblattnummer  CharacterString 1';
COMMENT ON COLUMN ax_buchung.laufendenummerderbuchungsstelle IS 'laufendeNummerDerBuchungsstelle  CharacterString 0..1';
COMMENT ON COLUMN ax_buchung.blattart IS 'blattart  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_position'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_position AS (
	rechtswert character varying,
	hochwert character varying,
	herkunft character varying
);
END IF;
END$$;
COMMENT ON TYPE ax_position IS 'Alias: "AX_Position",  1,  1,  [0..1]';
COMMENT ON COLUMN ax_position.rechtswert IS 'rechtswert  CharacterString 1';
COMMENT ON COLUMN ax_position.hochwert IS 'hochwert  CharacterString 1';
COMMENT ON COLUMN ax_position.herkunft IS 'herkunft  CharacterString 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_grenzpunkt'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_grenzpunkt AS (
	punktnummer character varying,
	vermarkung_marke character varying,
	relativehoehe character varying,
	position ax_position[],
	bemerkungzurabmarkung character varying,
	zwischenmarke character varying,
	besonderepunktnummer character varying,
	ausgesetzteabmarkung character varying,
	sonstigeeigenschaft character varying[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_grenzpunkt IS 'Alias: "AX_K_GRENZPUNKT",  1,  [0..1],  [0..1], UML-Classifier: AX_Position Stereotyp: DataType [1..*],  [0..1],  [0..1],  [0..1],  [0..1],  [0..*]';
COMMENT ON COLUMN ax_k_grenzpunkt.punktnummer IS 'punktnummer  CharacterString 1';
COMMENT ON COLUMN ax_k_grenzpunkt.vermarkung_marke IS 'vermarkung_Marke  CharacterString 0..1';
COMMENT ON COLUMN ax_k_grenzpunkt.relativehoehe IS 'relativeHoehe  CharacterString 0..1';
COMMENT ON COLUMN ax_k_grenzpunkt.position IS 'position DataType AX_Position 1..*';
COMMENT ON COLUMN ax_k_grenzpunkt.bemerkungzurabmarkung IS 'bemerkungZurAbmarkung  CharacterString 0..1';
COMMENT ON COLUMN ax_k_grenzpunkt.zwischenmarke IS 'zwischenmarke  CharacterString 0..1';
COMMENT ON COLUMN ax_k_grenzpunkt.besonderepunktnummer IS 'besonderePunktnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_k_grenzpunkt.ausgesetzteabmarkung IS 'ausgesetzteAbmarkung  CharacterString 0..1';
COMMENT ON COLUMN ax_k_grenzpunkt.sonstigeeigenschaft IS 'sonstigeEigenschaft  CharacterString 0..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_punkte'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_punkte AS (
	punktart ax_punktart_k_punkte,
	punktnummer character varying,
	vermarkung_marke character varying,
	relativehoehe character varying,
	position ax_position[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_punkte IS 'Alias: "AX_K_PUNKTE", UML-Classifier: AX_Punktart_K_PUNKTE Stereotyp: enumeration 1,  1,  [0..1],  [0..1], UML-Classifier: AX_Position Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_k_punkte.punktart IS 'punktart enumeration AX_Punktart_K_PUNKTE 1';
COMMENT ON COLUMN ax_k_punkte.punktnummer IS 'punktnummer  CharacterString 1';
COMMENT ON COLUMN ax_k_punkte.vermarkung_marke IS 'vermarkung_Marke  CharacterString 0..1';
COMMENT ON COLUMN ax_k_punkte.relativehoehe IS 'relativeHoehe  CharacterString 0..1';
COMMENT ON COLUMN ax_k_punkte.position IS 'position DataType AX_Position 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_zeile'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_zeile AS (
	punktart ax_k_zeile_punktart,
	vorlaeufigepunktkennung character varying,
	endgueltigepunktkennung character varying,
	antragsnummerdervermessung character varying,
	entstehung date
);
END IF;
END$$;
COMMENT ON TYPE ax_k_zeile IS 'Alias: "AX_K_ZEILE", UML-Classifier: AX_K_ZEILE_Punktart Stereotyp: enumeration 1,  1,  1,  1, UML-DataType: Date 1';
COMMENT ON COLUMN ax_k_zeile.punktart IS 'punktart enumeration AX_K_ZEILE_Punktart 1';
COMMENT ON COLUMN ax_k_zeile.vorlaeufigepunktkennung IS 'vorlaeufigePunktkennung  CharacterString 1';
COMMENT ON COLUMN ax_k_zeile.endgueltigepunktkennung IS 'endgueltigePunktkennung  CharacterString 1';
COMMENT ON COLUMN ax_k_zeile.antragsnummerdervermessung IS 'antragsnummerDerVermessung  CharacterString 1';
COMMENT ON COLUMN ax_k_zeile.entstehung IS 'entstehung  Date 1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_reserviert'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_reserviert AS (
	ordnungsnummer character varying,
	antragsnummerdervermessung character varying,
	ablauf date
);
END IF;
END$$;
COMMENT ON TYPE ax_k_reserviert IS 'Alias: "AX_K_RESERVIERT",  1,  1, UML-DataType: Date [0..1]';
COMMENT ON COLUMN ax_k_reserviert.ordnungsnummer IS 'ordnungsnummer  CharacterString 1';
COMMENT ON COLUMN ax_k_reserviert.antragsnummerdervermessung IS 'antragsnummerDerVermessung  CharacterString 1';
COMMENT ON COLUMN ax_k_reserviert.ablauf IS 'ablauf  Date 0..1';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_gruppe'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_gruppe AS (
	nummerierungsbezirk character varying,
	reserviert ax_k_reserviert[]
);
END IF;
END$$;
COMMENT ON TYPE ax_k_gruppe IS 'Alias: "AX_K_GRUPPE",  [0..1], UML-Classifier: AX_K_RESERVIERT Stereotyp: DataType [1..*]';
COMMENT ON COLUMN ax_k_gruppe.nummerierungsbezirk IS 'nummerierungsbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_k_gruppe.reserviert IS 'reserviert DataType AX_K_RESERVIERT 1..*';
DO $$
BEGIN
IF NOT EXISTS (
	SELECT
		1
	FROM
		pg_type t JOIN
		pg_namespace ns ON (t.typnamespace = ns.oid)
	WHERE
		t.typname = 'ax_k_reserviert'
		AND ns.nspname = 'aaa_gml'
) THEN
CREATE TYPE ax_k_reserviert AS (
	ordnungsnummer character varying,
	antragsnummerdervermessung character varying,
	ablauf date
);
END IF;
END$$;
COMMENT ON TYPE ax_k_reserviert IS 'Alias: "AX_K_RESERVIERT",  1,  1, UML-DataType: Date [0..1]';
COMMENT ON COLUMN ax_k_reserviert.ordnungsnummer IS 'ordnungsnummer  CharacterString 1';
COMMENT ON COLUMN ax_k_reserviert.antragsnummerdervermessung IS 'antragsnummerDerVermessung  CharacterString 1';
COMMENT ON COLUMN ax_k_reserviert.ablauf IS 'ablauf  Date 0..1';
CREATE TABLE IF NOT EXISTS aa_objekt (
	gml_id text,
	zeigtaufexternes aa_fachdatenverbindung[],
	lebenszeitintervall aa_lebenszeitintervall NOT NULL,
	modellart aa_modellart[] NOT NULL,
	anlass aa_anlassart[],
	user_id integer,
	created_at timestamp without time zone NOT NULL DEFAULT current_timestamp,
	updated_at timestamp without time zone NOT NULL DEFAULT current_timestamp,
	konvertierung_id integer,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT aa_objekt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE aa_objekt IS 'FeatureType: "AA_Objekt"';
COMMENT ON COLUMN aa_objekt.zeigtaufexternes IS 'zeigtAufExternes DataType AA_Fachdatenverbindung 0..*';
COMMENT ON COLUMN aa_objekt.lebenszeitintervall IS 'lebenszeitintervall DataType AA_Lebenszeitintervall 1';
COMMENT ON COLUMN aa_objekt.modellart IS 'modellart union AA_Modellart 1..*';
COMMENT ON COLUMN aa_objekt.anlass IS 'anlass codeList AA_Anlassart 0..*';
COMMENT ON COLUMN aa_objekt.user_id IS 'user_id  integer ';
COMMENT ON COLUMN aa_objekt.created_at IS 'created_at  timestamp without time zone ';
COMMENT ON COLUMN aa_objekt.updated_at IS 'updated_at  timestamp without time zone ';
COMMENT ON COLUMN aa_objekt.konvertierung_id IS 'konvertierung_id  integer ';
COMMENT ON COLUMN aa_objekt.istteilvon IS 'Assoziation zu: FeatureType AA_ZUSO (aa_zuso) 0..*';
COMMENT ON COLUMN aa_objekt.inverszu_dientzurdarstellungvon_ap_lto IS 'Assoziation zu: FeatureType AP_LTO (ap_lto) 0..*';
COMMENT ON COLUMN aa_objekt.inverszu_dientzurdarstellungvon_ap_pto IS 'Assoziation zu: FeatureType AP_PTO (ap_pto) 0..*';
COMMENT ON COLUMN aa_objekt.inverszu_dientzurdarstellungvon_ap_ppo IS 'Assoziation zu: FeatureType AP_PPO (ap_ppo) 0..*';
COMMENT ON COLUMN aa_objekt.inverszu_dientzurdarstellungvon_ap_lpo IS 'Assoziation zu: FeatureType AP_LPO (ap_lpo) 0..*';
COMMENT ON COLUMN aa_objekt.inverszu_dientzurdarstellungvon_ap_fpo IS 'Assoziation zu: FeatureType AP_FPO (ap_fpo) 0..*';
COMMENT ON COLUMN aa_objekt.inverszu_dientzurdarstellungvon_ap_darstellung IS 'Assoziation zu: FeatureType AP_Darstellung (ap_darstellung) 0..*';
COMMENT ON COLUMN aa_objekt.inverszu_dientzurdarstellungvon_ap_kpo_3d IS 'Assoziation zu: FeatureType AP_KPO_3D (ap_kpo_3d) 0..*';
CREATE TABLE IF NOT EXISTS aa_nreo (

) INHERITS (aa_objekt) WITH OIDS;

COMMENT ON TABLE aa_nreo IS 'FeatureType: "AA_NREO"';
CREATE TABLE IF NOT EXISTS aa_benutzer (
	inverszu_wer text[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE aa_benutzer IS 'FeatureType: "AA_Benutzer"';
COMMENT ON COLUMN aa_benutzer.inverszu_wer IS 'Assoziation zu: FeatureType AA_Meilenstein (aa_meilenstein) 0..*';
CREATE TABLE IF NOT EXISTS ax_benutzer (
	profilkennung character varying NOT NULL,
	art character varying,
	zeitlicheberechtigung date,
	zahlungsweise character varying,
	letzteabgabezugriff timestamp without time zone,
	vorletzteabgabezugriff timestamp without time zone,
	folgeverarbeitung ax_folgeva,
	empfaenger aa_empfaenger NOT NULL,
	letzteabgabeart ax_letzteabgabeart,
	nbauebernahmeerfolgreich boolean,
	nbaquittierungerhalten timestamp without time zone,
	ist text NOT NULL,
	gehoertzu text NOT NULL
) INHERITS (aa_benutzer) WITH OIDS;

COMMENT ON TABLE ax_benutzer IS 'FeatureType: "AX_Benutzer"';
COMMENT ON COLUMN ax_benutzer.profilkennung IS 'profilkennung  CharacterString 1';
COMMENT ON COLUMN ax_benutzer.art IS 'art  CharacterString 0..1';
COMMENT ON COLUMN ax_benutzer.zeitlicheberechtigung IS 'zeitlicheBerechtigung  Date 0..1';
COMMENT ON COLUMN ax_benutzer.zahlungsweise IS 'zahlungsweise  CharacterString 0..1';
COMMENT ON COLUMN ax_benutzer.letzteabgabezugriff IS 'letzteAbgabeZugriff  DateTime 0..1';
COMMENT ON COLUMN ax_benutzer.vorletzteabgabezugriff IS 'vorletzteAbgabeZugriff  DateTime 0..1';
COMMENT ON COLUMN ax_benutzer.folgeverarbeitung IS 'folgeverarbeitung DataType AX_FOLGEVA 0..1';
COMMENT ON COLUMN ax_benutzer.empfaenger IS 'empfaenger union AA_Empfaenger 1';
COMMENT ON COLUMN ax_benutzer.letzteabgabeart IS 'letzteAbgabeArt enumeration AX_LetzteAbgabeArt 0..1';
COMMENT ON COLUMN ax_benutzer.nbauebernahmeerfolgreich IS 'nBAUebernahmeErfolgreich  Boolean 0..1';
COMMENT ON COLUMN ax_benutzer.nbaquittierungerhalten IS 'nBAQuittierungErhalten  DateTime 0..1';
COMMENT ON COLUMN ax_benutzer.ist IS 'Assoziation zu: FeatureType AX_Person (ax_person) 1';
COMMENT ON COLUMN ax_benutzer.gehoertzu IS 'Assoziation zu: FeatureType AX_Benutzergruppe (ax_benutzergruppe) 1';
CREATE TABLE IF NOT EXISTS aa_benutzergruppe (
	inverszu_bearbeitbardurch text[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE aa_benutzergruppe IS 'FeatureType: "AA_Benutzergruppe"';
COMMENT ON COLUMN aa_benutzergruppe.inverszu_bearbeitbardurch IS 'Assoziation zu: FeatureType AA_Vorgang (aa_vorgang) 0..*';
CREATE TABLE IF NOT EXISTS ax_benutzergruppe (
	bezeichnung character varying NOT NULL,
	zustaendigestelle ax_dienststelle_schluessel NOT NULL,
	koordinatenreferenzsystem character varying,
	bestehtaus text[]
) INHERITS (aa_benutzergruppe) WITH OIDS;

COMMENT ON TABLE ax_benutzergruppe IS 'FeatureType: "AX_Benutzergruppe"';
COMMENT ON COLUMN ax_benutzergruppe.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_benutzergruppe.zustaendigestelle IS 'zustaendigeStelle DataType AX_Dienststelle_Schluessel 1';
COMMENT ON COLUMN ax_benutzergruppe.koordinatenreferenzsystem IS 'koordinatenreferenzsystem  SC_CRS 0..1';
COMMENT ON COLUMN ax_benutzergruppe.bestehtaus IS 'Assoziation zu: FeatureType AX_Benutzer (ax_benutzer) 0..*';
CREATE TABLE IF NOT EXISTS ax_benutzergruppemitzugriffskontrolle (
	selektionskriterien text[] NOT NULL,
	zugriffhistorie boolean NOT NULL,
	zugriffsartproduktkennungbenutzung aa_anlassart_benutzungsauftrag[],
	zugriffsartproduktkennungfuehrung aa_anlassart[],
	zugriffsartfortfuehrungsanlass aa_anlassart[]
) INHERITS (ax_benutzergruppe) WITH OIDS;

COMMENT ON TABLE ax_benutzergruppemitzugriffskontrolle IS 'FeatureType: "AX_BenutzergruppeMitZugriffskontrolle"';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.selektionskriterien IS 'selektionskriterien  Query 1..*';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.zugriffhistorie IS 'zugriffHistorie  Boolean 1';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.zugriffsartproduktkennungbenutzung IS 'zugriffsartProduktkennungBenutzung codeList AA_Anlassart_Benutzungsauftrag 0..*';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.zugriffsartproduktkennungfuehrung IS 'zugriffsartProduktkennungFuehrung codeList AA_Anlassart 0..*';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.zugriffsartfortfuehrungsanlass IS 'zugriffsartFortfuehrungsanlass codeList AA_Anlassart 0..*';
CREATE TABLE IF NOT EXISTS ax_benutzergruppenba (
	selektionskriterien text[] NOT NULL,
	bereichzeitlich ax_bereichzeitlich,
	portionierungsparameter ax_portionierungsparameter,
	quittierung boolean
) INHERITS (ax_benutzergruppe) WITH OIDS;

COMMENT ON TABLE ax_benutzergruppenba IS 'FeatureType: "AX_BenutzergruppeNBA"';
COMMENT ON COLUMN ax_benutzergruppenba.selektionskriterien IS 'selektionskriterien  Query 1..*';
COMMENT ON COLUMN ax_benutzergruppenba.bereichzeitlich IS 'bereichZeitlich DataType AX_BereichZeitlich 0..1';
COMMENT ON COLUMN ax_benutzergruppenba.portionierungsparameter IS 'portionierungsparameter DataType AX_Portionierungsparameter 0..1';
COMMENT ON COLUMN ax_benutzergruppenba.quittierung IS 'quittierung  Boolean 0..1';
CREATE TABLE IF NOT EXISTS ap_darstellung (
	positionierungsregel character varying,
	signaturnummer character varying,
	darstellungsprioritaet integer,
	art character varying,
	dientzurdarstellungvon text[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ap_darstellung IS 'FeatureType: "AP_Darstellung"';
COMMENT ON COLUMN ap_darstellung.positionierungsregel IS 'positionierungsregel  CharacterString 0..1';
COMMENT ON COLUMN ap_darstellung.signaturnummer IS 'signaturnummer  CharacterString 0..1';
COMMENT ON COLUMN ap_darstellung.darstellungsprioritaet IS 'darstellungsprioritaet  Integer 0..1';
COMMENT ON COLUMN ap_darstellung.art IS 'art  CharacterString 0..1';
COMMENT ON COLUMN ap_darstellung.dientzurdarstellungvon IS 'Assoziation zu: FeatureType AA_Objekt (aa_objekt) 0..*';
CREATE TABLE IF NOT EXISTS aa_projektsteuerung (
	anlassdesprozesses aa_anlassart[] NOT NULL,
	gebuehren aa_gebuehrenangaben,
	inverszu_verweistauf text,
	enthaelt text[] NOT NULL
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE aa_projektsteuerung IS 'FeatureType: "AA_Projektsteuerung"';
COMMENT ON COLUMN aa_projektsteuerung.anlassdesprozesses IS 'anlassDesProzesses codeList AA_Anlassart 1..*';
COMMENT ON COLUMN aa_projektsteuerung.gebuehren IS 'gebuehren DataType AA_Gebuehrenangaben 0..1';
COMMENT ON COLUMN aa_projektsteuerung.inverszu_verweistauf IS 'Assoziation zu: FeatureType AA_Antrag (aa_antrag) 0..1';
COMMENT ON COLUMN aa_projektsteuerung.enthaelt IS 'Assoziation zu: FeatureType AA_Vorgang (aa_vorgang) 1..*';
CREATE TABLE IF NOT EXISTS aa_meilenstein (
	begonnen boolean,
	abgeschlossen boolean,
	erfolgreich boolean,
	wannabgeschlossen timestamp without time zone,
	kategorie aa_besonderemeilensteinkategorie,
	bemerkung character varying,
	wer text,
	vonantrag text[],
	vonaktivitaet text[],
	vonvorgang text[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE aa_meilenstein IS 'FeatureType: "AA_Meilenstein"';
COMMENT ON COLUMN aa_meilenstein.begonnen IS 'begonnen  Boolean 0..1';
COMMENT ON COLUMN aa_meilenstein.abgeschlossen IS 'abgeschlossen  Boolean 0..1';
COMMENT ON COLUMN aa_meilenstein.erfolgreich IS 'erfolgreich  Boolean 0..1';
COMMENT ON COLUMN aa_meilenstein.wannabgeschlossen IS 'wannAbgeschlossen  DateTime 0..1';
COMMENT ON COLUMN aa_meilenstein.kategorie IS 'kategorie codeList AA_BesondereMeilensteinkategorie 0..1';
COMMENT ON COLUMN aa_meilenstein.bemerkung IS 'bemerkung  CharacterString 0..1';
COMMENT ON COLUMN aa_meilenstein.wer IS 'Assoziation zu: FeatureType AA_Benutzer (aa_benutzer) 0..1';
COMMENT ON COLUMN aa_meilenstein.vonantrag IS 'Assoziation zu: FeatureType AA_Antrag (aa_antrag) 0..*';
COMMENT ON COLUMN aa_meilenstein.vonaktivitaet IS 'Assoziation zu: FeatureType AA_Aktivitaet (aa_aktivitaet) 0..*';
COMMENT ON COLUMN aa_meilenstein.vonvorgang IS 'Assoziation zu: FeatureType AA_Vorgang (aa_vorgang) 0..*';
CREATE TABLE IF NOT EXISTS aa_antrag (
	kennzeichen character varying NOT NULL,
	antragunterbrochen boolean NOT NULL,
	erlaeuterungzumstatus character varying,
	verweistauf text[] NOT NULL,
	bearbeitungsstatus text,
	gebiet text
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE aa_antrag IS 'FeatureType: "AA_Antrag"';
COMMENT ON COLUMN aa_antrag.kennzeichen IS 'kennzeichen  CharacterString 1';
COMMENT ON COLUMN aa_antrag.antragunterbrochen IS 'antragUnterbrochen  Boolean 1';
COMMENT ON COLUMN aa_antrag.erlaeuterungzumstatus IS 'erlaeuterungZumStatus  CharacterString 0..1';
COMMENT ON COLUMN aa_antrag.verweistauf IS 'Assoziation zu: FeatureType AA_Projektsteuerung (aa_projektsteuerung) 1..*';
COMMENT ON COLUMN aa_antrag.bearbeitungsstatus IS 'Assoziation zu: FeatureType AA_Meilenstein (aa_meilenstein) 0..1';
COMMENT ON COLUMN aa_antrag.gebiet IS 'Assoziation zu: FeatureType AA_Antragsgebiet (aa_antragsgebiet) 0..1';
CREATE TABLE IF NOT EXISTS aa_aktivitaet (
	erlaeuterung character varying,
	status text NOT NULL,
	inverszu_enthaelt text
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE aa_aktivitaet IS 'FeatureType: "AA_Aktivitaet"';
COMMENT ON COLUMN aa_aktivitaet.erlaeuterung IS 'erlaeuterung  CharacterString 0..1';
COMMENT ON COLUMN aa_aktivitaet.status IS 'Assoziation zu: FeatureType AA_Meilenstein (aa_meilenstein) 1';
COMMENT ON COLUMN aa_aktivitaet.inverszu_enthaelt IS 'Assoziation zu: FeatureType AA_Vorgang (aa_vorgang) 0..1';
CREATE TABLE IF NOT EXISTS aa_vorgang (
	erlaeuterung character varying,
	bearbeitbardurch text NOT NULL,
	inverszu_enthaelt text,
	status text NOT NULL,
	enthaelt text[],
	synchronisiertmit text,
	inverszu_synchronisiertmit text
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE aa_vorgang IS 'FeatureType: "AA_Vorgang"';
COMMENT ON COLUMN aa_vorgang.erlaeuterung IS 'erlaeuterung  CharacterString 0..1';
COMMENT ON COLUMN aa_vorgang.bearbeitbardurch IS 'Assoziation zu: FeatureType AA_Benutzergruppe (aa_benutzergruppe) 1';
COMMENT ON COLUMN aa_vorgang.inverszu_enthaelt IS 'Assoziation zu: FeatureType AA_Projektsteuerung (aa_projektsteuerung) 0..1';
COMMENT ON COLUMN aa_vorgang.status IS 'Assoziation zu: FeatureType AA_Meilenstein (aa_meilenstein) 1';
COMMENT ON COLUMN aa_vorgang.enthaelt IS 'Assoziation zu: FeatureType AA_Aktivitaet (aa_aktivitaet) 0..*';
COMMENT ON COLUMN aa_vorgang.synchronisiertmit IS 'Assoziation zu: FeatureType AA_Vorgang (aa_vorgang) 0..1';
COMMENT ON COLUMN aa_vorgang.inverszu_synchronisiertmit IS 'Assoziation zu: FeatureType AA_Vorgang (aa_vorgang) 0..1';
CREATE TABLE IF NOT EXISTS ax_person (
	nachnameoderfirma character varying NOT NULL,
	anrede ax_anrede_person,
	vorname character varying,
	namensbestandteil character varying,
	akademischergrad character varying,
	geburtsname character varying,
	geburtsdatum date,
	wohnortodersitz character varying,
	beruf character varying,
	sonstigeeigenschaften character varying,
	haushaltsstellelandesgrundbesitz character varying,
	qualitaetsangaben ax_dqohnedatenerhebung,
	inverszu_zeigtauf text[],
	zeigtauf text,
	weistauf text[],
	hat text[],
	benennt text[],
	gehoertzu text[],
	wirdvertretenvon text[],
	uebtaus text[],
	besitzt text[],
	inverszu_ist text[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_person IS 'FeatureType: "AX_Person"';
COMMENT ON COLUMN ax_person.nachnameoderfirma IS 'nachnameOderFirma  CharacterString 1';
COMMENT ON COLUMN ax_person.anrede IS 'anrede enumeration AX_Anrede_Person 0..1';
COMMENT ON COLUMN ax_person.vorname IS 'vorname  CharacterString 0..1';
COMMENT ON COLUMN ax_person.namensbestandteil IS 'namensbestandteil  CharacterString 0..1';
COMMENT ON COLUMN ax_person.akademischergrad IS 'akademischerGrad  CharacterString 0..1';
COMMENT ON COLUMN ax_person.geburtsname IS 'geburtsname  CharacterString 0..1';
COMMENT ON COLUMN ax_person.geburtsdatum IS 'geburtsdatum  Date 0..1';
COMMENT ON COLUMN ax_person.wohnortodersitz IS 'wohnortOderSitz  CharacterString 0..1';
COMMENT ON COLUMN ax_person.beruf IS 'beruf  CharacterString 0..1';
COMMENT ON COLUMN ax_person.sonstigeeigenschaften IS 'sonstigeEigenschaften  CharacterString 0..1';
COMMENT ON COLUMN ax_person.haushaltsstellelandesgrundbesitz IS 'haushaltsstelleLandesgrundbesitz  CharacterString 0..1';
COMMENT ON COLUMN ax_person.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQOhneDatenerhebung 0..1';
COMMENT ON COLUMN ax_person.inverszu_zeigtauf IS 'Assoziation zu: FeatureType AX_Person (ax_person) 0..*';
COMMENT ON COLUMN ax_person.zeigtauf IS 'Assoziation zu: FeatureType AX_Person (ax_person) 0..1';
COMMENT ON COLUMN ax_person.weistauf IS 'Assoziation zu: FeatureType AX_Namensnummer (ax_namensnummer) 0..*';
COMMENT ON COLUMN ax_person.hat IS 'Assoziation zu: FeatureType AX_Anschrift (ax_anschrift) 0..*';
COMMENT ON COLUMN ax_person.benennt IS 'Assoziation zu: FeatureType AX_Verwaltung (ax_verwaltung) 0..*';
COMMENT ON COLUMN ax_person.gehoertzu IS 'Assoziation zu: FeatureType AX_Personengruppe (ax_personengruppe) 0..*';
COMMENT ON COLUMN ax_person.wirdvertretenvon IS 'Assoziation zu: FeatureType AX_Vertretung (ax_vertretung) 0..*';
COMMENT ON COLUMN ax_person.uebtaus IS 'Assoziation zu: FeatureType AX_Vertretung (ax_vertretung) 0..*';
COMMENT ON COLUMN ax_person.besitzt IS 'Assoziation zu: FeatureType AX_Gebaeude (ax_gebaeude) 0..*';
COMMENT ON COLUMN ax_person.inverszu_ist IS 'Assoziation zu: FeatureType AX_Benutzer (ax_benutzer) 0..*';
CREATE TABLE IF NOT EXISTS ax_namensnummer (
	laufendenummernachdin1421 character varying,
	nummer character varying,
	anteil ax_anteil,
	artderrechtsgemeinschaft ax_artderrechtsgemeinschaft_namensnummer,
	beschriebderrechtsgemeinschaft character varying,
	eigentuemerart ax_eigentuemerart_namensnummer,
	strichblattnummer integer,
	benennt text,
	inverszu_bestehtausrechtsverhaeltnissenzu  text[],
	bestehtausrechtsverhaeltnissenzu  text,
	inverszu_hatvorgaenger  text[],
	hatvorgaenger  text[],
	istbestandteilvon text NOT NULL
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_namensnummer IS 'FeatureType: "AX_Namensnummer"';
COMMENT ON COLUMN ax_namensnummer.laufendenummernachdin1421 IS 'laufendeNummerNachDIN1421  CharacterString 0..1';
COMMENT ON COLUMN ax_namensnummer.nummer IS 'nummer  CharacterString 0..1';
COMMENT ON COLUMN ax_namensnummer.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_namensnummer.artderrechtsgemeinschaft IS 'artDerRechtsgemeinschaft enumeration AX_ArtDerRechtsgemeinschaft_Namensnummer 0..1';
COMMENT ON COLUMN ax_namensnummer.beschriebderrechtsgemeinschaft IS 'beschriebDerRechtsgemeinschaft  CharacterString 0..1';
COMMENT ON COLUMN ax_namensnummer.eigentuemerart IS 'eigentuemerart enumeration AX_Eigentuemerart_Namensnummer 0..1';
COMMENT ON COLUMN ax_namensnummer.strichblattnummer IS 'strichblattnummer  Integer 0..1';
COMMENT ON COLUMN ax_namensnummer.benennt IS 'Assoziation zu: FeatureType AX_Person (ax_person) 0..1';
COMMENT ON COLUMN ax_namensnummer.inverszu_bestehtausrechtsverhaeltnissenzu  IS 'Assoziation zu: FeatureType AX_Namensnummer (ax_namensnummer) 0..*';
COMMENT ON COLUMN ax_namensnummer.bestehtausrechtsverhaeltnissenzu  IS 'Assoziation zu: FeatureType AX_Namensnummer (ax_namensnummer) 0..1';
COMMENT ON COLUMN ax_namensnummer.inverszu_hatvorgaenger  IS 'Assoziation zu: FeatureType AX_Namensnummer (ax_namensnummer) 0..*';
COMMENT ON COLUMN ax_namensnummer.hatvorgaenger  IS 'Assoziation zu: FeatureType AX_Namensnummer (ax_namensnummer) 0..*';
COMMENT ON COLUMN ax_namensnummer.istbestandteilvon IS 'Assoziation zu: FeatureType AX_Buchungsblatt (ax_buchungsblatt) 1';
CREATE TABLE IF NOT EXISTS ax_anschrift (
	ort_post character varying NOT NULL,
	postleitzahlpostzustellung character varying,
	postleitzahlpostfach character varying,
	bestimmungsland character varying,
	ortsteil character varying,
	strasse character varying,
	hausnummer character varying,
	ort_amtlichesortsnamensverzeichnis character varying,
	postfach character varying,
	fax character varying[],
	telefon character varying[],
	weitereadressen character varying[],
	qualitaetsangaben ax_dqohnedatenerhebung,
	gehoertzu text[],
	beziehtsichauf text[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_anschrift IS 'FeatureType: "AX_Anschrift"';
COMMENT ON COLUMN ax_anschrift.ort_post IS 'ort_Post  CharacterString 1';
COMMENT ON COLUMN ax_anschrift.postleitzahlpostzustellung IS 'postleitzahlPostzustellung  CharacterString 0..1';
COMMENT ON COLUMN ax_anschrift.postleitzahlpostfach IS 'postleitzahlPostfach  CharacterString 0..1';
COMMENT ON COLUMN ax_anschrift.bestimmungsland IS 'bestimmungsland  CharacterString 0..1';
COMMENT ON COLUMN ax_anschrift.ortsteil IS 'ortsteil  CharacterString 0..1';
COMMENT ON COLUMN ax_anschrift.strasse IS 'strasse  CharacterString 0..1';
COMMENT ON COLUMN ax_anschrift.hausnummer IS 'hausnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_anschrift.ort_amtlichesortsnamensverzeichnis IS 'ort_AmtlichesOrtsnamensverzeichnis  CharacterString 0..1';
COMMENT ON COLUMN ax_anschrift.postfach IS 'postfach  CharacterString 0..1';
COMMENT ON COLUMN ax_anschrift.fax IS 'fax  CharacterString 0..*';
COMMENT ON COLUMN ax_anschrift.telefon IS 'telefon  CharacterString 0..*';
COMMENT ON COLUMN ax_anschrift.weitereadressen IS 'weitereAdressen  CharacterString 0..*';
COMMENT ON COLUMN ax_anschrift.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQOhneDatenerhebung 0..1';
COMMENT ON COLUMN ax_anschrift.gehoertzu IS 'Assoziation zu: FeatureType AX_Person (ax_person) 0..*';
COMMENT ON COLUMN ax_anschrift.beziehtsichauf IS 'Assoziation zu: FeatureType AX_Dienststelle (ax_dienststelle) 0..*';
CREATE TABLE IF NOT EXISTS ax_verwaltung (
	bestellungsbeschluss character varying,
	beginnderbestellung date,
	endederbestellung date,
	notariat character varying,
	grundakt character varying,
	qualitaetsangaben ax_dqohnedatenerhebung,
	haengtan text NOT NULL,
	beziehtsichauf text[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_verwaltung IS 'FeatureType: "AX_Verwaltung"';
COMMENT ON COLUMN ax_verwaltung.bestellungsbeschluss IS 'bestellungsbeschluss  CharacterString 0..1';
COMMENT ON COLUMN ax_verwaltung.beginnderbestellung IS 'beginnDerBestellung  Date 0..1';
COMMENT ON COLUMN ax_verwaltung.endederbestellung IS 'endeDerBestellung  Date 0..1';
COMMENT ON COLUMN ax_verwaltung.notariat IS 'notariat  CharacterString 0..1';
COMMENT ON COLUMN ax_verwaltung.grundakt IS 'grundakt  CharacterString 0..1';
COMMENT ON COLUMN ax_verwaltung.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQOhneDatenerhebung 0..1';
COMMENT ON COLUMN ax_verwaltung.haengtan IS 'Assoziation zu: FeatureType AX_Person (ax_person) 1';
COMMENT ON COLUMN ax_verwaltung.beziehtsichauf IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';
CREATE TABLE IF NOT EXISTS ax_buchungsstelle (
	buchungsart ax_buchungsart_buchungsstelle NOT NULL,
	laufendenummer character varying NOT NULL,
	anteil ax_anteil,
	nummerimaufteilungsplan character varying,
	beschreibungdessondereigentums character varying,
	buchungstext character varying,
	beschreibungdesumfangsderbuchung character varying,
	zeitpunktdereintragung date,
	wirdverwaltetvon text,
	inverszu_an text[],
	an text[],
	inverszu_durch text[],
	durch text[],
	inverszu_zu text[],
	zu text[],
	inverszu_hatvorgaenger text[],
	hatvorgaenger text[],
	istbestandteilvon text NOT NULL,
	beziehtsichauf text[],
	verweistauf text[],
	grundstueckbestehtaus text[],
	inverszu_istgebucht text[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_buchungsstelle IS 'FeatureType: "AX_Buchungsstelle"';
COMMENT ON COLUMN ax_buchungsstelle.buchungsart IS 'buchungsart enumeration AX_Buchungsart_Buchungsstelle 1';
COMMENT ON COLUMN ax_buchungsstelle.laufendenummer IS 'laufendeNummer  CharacterString 1';
COMMENT ON COLUMN ax_buchungsstelle.anteil IS 'anteil DataType AX_Anteil 0..1';
COMMENT ON COLUMN ax_buchungsstelle.nummerimaufteilungsplan IS 'nummerImAufteilungsplan  CharacterString 0..1';
COMMENT ON COLUMN ax_buchungsstelle.beschreibungdessondereigentums IS 'beschreibungDesSondereigentums  CharacterString 0..1';
COMMENT ON COLUMN ax_buchungsstelle.buchungstext IS 'buchungstext  CharacterString 0..1';
COMMENT ON COLUMN ax_buchungsstelle.beschreibungdesumfangsderbuchung IS 'beschreibungDesUmfangsDerBuchung  CharacterString 0..1';
COMMENT ON COLUMN ax_buchungsstelle.zeitpunktdereintragung IS 'zeitpunktDerEintragung  Date 0..1';
COMMENT ON COLUMN ax_buchungsstelle.wirdverwaltetvon IS 'Assoziation zu: FeatureType AX_Verwaltung (ax_verwaltung) 0..1';
COMMENT ON COLUMN ax_buchungsstelle.inverszu_an IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';
COMMENT ON COLUMN ax_buchungsstelle.an IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';
COMMENT ON COLUMN ax_buchungsstelle.inverszu_durch IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';
COMMENT ON COLUMN ax_buchungsstelle.durch IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';
COMMENT ON COLUMN ax_buchungsstelle.inverszu_zu IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';
COMMENT ON COLUMN ax_buchungsstelle.zu IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';
COMMENT ON COLUMN ax_buchungsstelle.inverszu_hatvorgaenger IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';
COMMENT ON COLUMN ax_buchungsstelle.hatvorgaenger IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';
COMMENT ON COLUMN ax_buchungsstelle.istbestandteilvon IS 'Assoziation zu: FeatureType AX_Buchungsblatt (ax_buchungsblatt) 1';
COMMENT ON COLUMN ax_buchungsstelle.beziehtsichauf IS 'Assoziation zu: FeatureType AX_Buchungsblatt (ax_buchungsblatt) 0..*';
COMMENT ON COLUMN ax_buchungsstelle.verweistauf IS 'Assoziation zu: FeatureType AX_Flurstueck (ax_flurstueck) 0..*';
COMMENT ON COLUMN ax_buchungsstelle.grundstueckbestehtaus IS 'Assoziation zu: FeatureType AX_Flurstueck (ax_flurstueck) 0..*';
COMMENT ON COLUMN ax_buchungsstelle.inverszu_istgebucht IS 'Assoziation zu: FeatureType AX_HistorischesFlurstueckOhneRaumbezug (ax_historischesflurstueckohneraumbezug) 0..*';
CREATE TABLE IF NOT EXISTS ax_personengruppe (
	namederpersonengruppe character varying NOT NULL,
	bestehtaus text[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_personengruppe IS 'FeatureType: "AX_Personengruppe"';
COMMENT ON COLUMN ax_personengruppe.namederpersonengruppe IS 'nameDerPersonengruppe  CharacterString 1';
COMMENT ON COLUMN ax_personengruppe.bestehtaus IS 'Assoziation zu: FeatureType AX_Person (ax_person) 0..*';
CREATE TABLE IF NOT EXISTS ax_buchungsblatt (
	buchungsblattkennzeichen character varying NOT NULL,
	buchungsblattbezirk ax_buchungsblattbezirk_schluessel NOT NULL,
	buchungsblattnummermitbuchstabenerweiterung character varying NOT NULL,
	blattart ax_blattart_buchungsblatt NOT NULL,
	inverszu_istbestandteilvon text[],
	bestehtaus text[],
	inverszu_beziehtsichauf text[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_buchungsblatt IS 'FeatureType: "AX_Buchungsblatt"';
COMMENT ON COLUMN ax_buchungsblatt.buchungsblattkennzeichen IS 'buchungsblattkennzeichen  CharacterString 1';
COMMENT ON COLUMN ax_buchungsblatt.buchungsblattbezirk IS 'buchungsblattbezirk DataType AX_Buchungsblattbezirk_Schluessel 1';
COMMENT ON COLUMN ax_buchungsblatt.buchungsblattnummermitbuchstabenerweiterung IS 'buchungsblattnummerMitBuchstabenerweiterung  CharacterString 1';
COMMENT ON COLUMN ax_buchungsblatt.blattart IS 'blattart enumeration AX_Blattart_Buchungsblatt 1';
COMMENT ON COLUMN ax_buchungsblatt.inverszu_istbestandteilvon IS 'Assoziation zu: FeatureType AX_Namensnummer (ax_namensnummer) 0..*';
COMMENT ON COLUMN ax_buchungsblatt.bestehtaus IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';
COMMENT ON COLUMN ax_buchungsblatt.inverszu_beziehtsichauf IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';
CREATE TABLE IF NOT EXISTS ax_vertretung (
	beginndervertretung date,
	artdervertretung character varying[],
	endedervertretung date,
	angabenzurvertretung character varying,
	vertritt text[],
	haengtan text NOT NULL,
	beziehtsichauf text[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_vertretung IS 'FeatureType: "AX_Vertretung"';
COMMENT ON COLUMN ax_vertretung.beginndervertretung IS 'beginnDerVertretung  Date 0..1';
COMMENT ON COLUMN ax_vertretung.artdervertretung IS 'artDerVertretung  CharacterString 0..*';
COMMENT ON COLUMN ax_vertretung.endedervertretung IS 'endeDerVertretung  Date 0..1';
COMMENT ON COLUMN ax_vertretung.angabenzurvertretung IS 'angabenZurVertretung  CharacterString 0..1';
COMMENT ON COLUMN ax_vertretung.vertritt IS 'Assoziation zu: FeatureType AX_Person (ax_person) 0..*';
COMMENT ON COLUMN ax_vertretung.haengtan IS 'Assoziation zu: FeatureType AX_Person (ax_person) 1';
COMMENT ON COLUMN ax_vertretung.beziehtsichauf IS 'Assoziation zu: FeatureType AX_Flurstueck (ax_flurstueck) 0..*';
CREATE TABLE IF NOT EXISTS ax_skizze (
	skizzenname character varying NOT NULL,
	skizzenart ax_skizzenart_skizze,
	bemerkungen character varying
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_skizze IS 'FeatureType: "AX_Skizze"';
COMMENT ON COLUMN ax_skizze.skizzenname IS 'skizzenname  URI 1';
COMMENT ON COLUMN ax_skizze.skizzenart IS 'skizzenart enumeration AX_Skizzenart_Skizze 0..1';
COMMENT ON COLUMN ax_skizze.bemerkungen IS 'bemerkungen  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_schwere (
	schwerewert double precision NOT NULL,
	schweresystem ax_schweresystem_schwere NOT NULL,
	schwerestatus ax_schwerestatus_schwere,
	schwereanomalie ax_schwereanomalie_schwere[],
	aufstellhoehe double precision,
	ueberpruefungsdatum date,
	hinweise character varying,
	qualitaetsangaben ax_dqschwere
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_schwere IS 'FeatureType: "AX_Schwere"';
COMMENT ON COLUMN ax_schwere.schwerewert IS 'schwerewert  Real 1';
COMMENT ON COLUMN ax_schwere.schweresystem IS 'schweresystem enumeration AX_Schweresystem_Schwere 1';
COMMENT ON COLUMN ax_schwere.schwerestatus IS 'schwerestatus enumeration AX_Schwerestatus_Schwere 0..1';
COMMENT ON COLUMN ax_schwere.schwereanomalie IS 'schwereanomalie DataType AX_Schwereanomalie_Schwere 0..*';
COMMENT ON COLUMN ax_schwere.aufstellhoehe IS 'aufstellhoehe  Distance 0..1';
COMMENT ON COLUMN ax_schwere.ueberpruefungsdatum IS 'ueberpruefungsdatum  Date 0..1';
COMMENT ON COLUMN ax_schwere.hinweise IS 'hinweise  CharacterString 0..1';
COMMENT ON COLUMN ax_schwere.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQSchwere 0..1';
CREATE TABLE IF NOT EXISTS ax_historischesflurstueckalb (
	gemarkung ax_gemarkung_schluessel NOT NULL,
	flurstuecksnummer ax_flurstuecksnummer NOT NULL,
	flurstueckskennzeichen character varying NOT NULL,
	amtlicheflaeche double precision NOT NULL,
	vorgaengerflurstueckskennzeichen character varying[],
	nachfolgerflurstueckskennzeichen character varying[],
	buchung ax_buchung_historischesflurstueck[],
	flurnummer integer,
	flurstuecksfolge character varying,
	objektkoordinaten geometry(POINT),
	zeitpunktderentstehungdesbezugsflurstuecks date,
	laufendenummerderfortfuehrung character varying,
	fortfuehrungsart character varying
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_historischesflurstueckalb IS 'FeatureType: "AX_HistorischesFlurstueckALB"';
COMMENT ON COLUMN ax_historischesflurstueckalb.gemarkung IS 'gemarkung DataType AX_Gemarkung_Schluessel 1';
COMMENT ON COLUMN ax_historischesflurstueckalb.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_historischesflurstueckalb.flurstueckskennzeichen IS 'flurstueckskennzeichen  CharacterString 1';
COMMENT ON COLUMN ax_historischesflurstueckalb.amtlicheflaeche IS 'amtlicheFlaeche  Area 1';
COMMENT ON COLUMN ax_historischesflurstueckalb.vorgaengerflurstueckskennzeichen IS 'vorgaengerFlurstueckskennzeichen  CharacterString 0..*';
COMMENT ON COLUMN ax_historischesflurstueckalb.nachfolgerflurstueckskennzeichen IS 'nachfolgerFlurstueckskennzeichen  CharacterString 0..*';
COMMENT ON COLUMN ax_historischesflurstueckalb.buchung IS 'buchung DataType AX_Buchung_HistorischesFlurstueck 0..*';
COMMENT ON COLUMN ax_historischesflurstueckalb.flurnummer IS 'flurnummer  Integer 0..1';
COMMENT ON COLUMN ax_historischesflurstueckalb.flurstuecksfolge IS 'flurstuecksfolge  CharacterString 0..1';
COMMENT ON COLUMN ax_historischesflurstueckalb.objektkoordinaten IS 'objektkoordinaten  GM_Point 0..1';
COMMENT ON COLUMN ax_historischesflurstueckalb.zeitpunktderentstehungdesbezugsflurstuecks IS 'zeitpunktDerEntstehungDesBezugsflurstuecks  Date 0..1';
COMMENT ON COLUMN ax_historischesflurstueckalb.laufendenummerderfortfuehrung IS 'laufendeNummerDerFortfuehrung  CharacterString 0..1';
COMMENT ON COLUMN ax_historischesflurstueckalb.fortfuehrungsart IS 'fortfuehrungsart  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_historischesflurstueckohneraumbezug (
	gemarkung ax_gemarkung_schluessel NOT NULL,
	flurstuecksnummer ax_flurstuecksnummer NOT NULL,
	flurstueckskennzeichen character varying NOT NULL,
	amtlicheflaeche double precision NOT NULL,
	vorgaengerflurstueckskennzeichen character varying[],
	nachfolgerflurstueckskennzeichen character varying[],
	flurnummer integer,
	flurstuecksfolge character varying,
	abweichenderrechtszustand boolean,
	zweifelhafterflurstuecksnachweis boolean,
	rechtsbehelfsverfahren boolean,
	objektkoordinaten geometry(POINT),
	sonstigeeigenschaften ax_sonstigeeigenschaften_flurstueck[],
	zeitpunktderentstehung date,
	gemeindezugehoerigkeit ax_gemeindekennzeichen,
	istgebucht text,
	inverszu_gehoertanteiligzu  text[],
	gehoertanteiligzu  text[],
	zeigtauf text[],
	weistauf text[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_historischesflurstueckohneraumbezug IS 'FeatureType: "AX_HistorischesFlurstueckOhneRaumbezug"';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.gemarkung IS 'gemarkung DataType AX_Gemarkung_Schluessel 1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.flurstueckskennzeichen IS 'flurstueckskennzeichen  CharacterString 1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.amtlicheflaeche IS 'amtlicheFlaeche  Area 1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.vorgaengerflurstueckskennzeichen IS 'vorgaengerFlurstueckskennzeichen  CharacterString 0..*';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.nachfolgerflurstueckskennzeichen IS 'nachfolgerFlurstueckskennzeichen  CharacterString 0..*';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.flurnummer IS 'flurnummer  Integer 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.flurstuecksfolge IS 'flurstuecksfolge  CharacterString 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.abweichenderrechtszustand IS 'abweichenderRechtszustand  Boolean 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.zweifelhafterflurstuecksnachweis IS 'zweifelhafterFlurstuecksnachweis  Boolean 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.rechtsbehelfsverfahren IS 'rechtsbehelfsverfahren  Boolean 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.objektkoordinaten IS 'objektkoordinaten  GM_Point 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.sonstigeeigenschaften IS 'sonstigeEigenschaften DataType AX_SonstigeEigenschaften_Flurstueck 0..*';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.zeitpunktderentstehung IS 'zeitpunktDerEntstehung  Date 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.gemeindezugehoerigkeit IS 'gemeindezugehoerigkeit DataType AX_Gemeindekennzeichen 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.istgebucht IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.inverszu_gehoertanteiligzu  IS 'Assoziation zu: FeatureType AX_HistorischesFlurstueckOhneRaumbezug (ax_historischesflurstueckohneraumbezug) 0..*';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.gehoertanteiligzu  IS 'Assoziation zu: FeatureType AX_HistorischesFlurstueckOhneRaumbezug (ax_historischesflurstueckohneraumbezug) 0..*';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.zeigtauf IS 'Assoziation zu: FeatureType AX_LagebezeichnungOhneHausnummer (ax_lagebezeichnungohnehausnummer) 0..*';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.weistauf IS 'Assoziation zu: FeatureType AX_LagebezeichnungMitHausnummer (ax_lagebezeichnungmithausnummer) 0..*';
CREATE TABLE IF NOT EXISTS ax_lage (
	lagebezeichnung ax_lagebezeichnung NOT NULL
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_lage IS 'FeatureType: "AX_Lage"';
COMMENT ON COLUMN ax_lage.lagebezeichnung IS 'lagebezeichnung union AX_Lagebezeichnung 1';
CREATE TABLE IF NOT EXISTS ax_lagebezeichnungohnehausnummer (
	zusatzzurlagebezeichnung character varying,
	ortsteil character varying,
	gehoertzu text[],
	beschreibt text[]
) INHERITS (ax_lage) WITH OIDS;

COMMENT ON TABLE ax_lagebezeichnungohnehausnummer IS 'FeatureType: "AX_LagebezeichnungOhneHausnummer"';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.zusatzzurlagebezeichnung IS 'zusatzZurLagebezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.ortsteil IS 'ortsteil  CharacterString 0..1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.gehoertzu IS 'Assoziation zu: FeatureType AX_Flurstueck (ax_flurstueck) 0..*';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.beschreibt IS 'Assoziation zu: FeatureType AX_HistorischesFlurstueckOhneRaumbezug (ax_historischesflurstueckohneraumbezug) 0..*';
CREATE TABLE IF NOT EXISTS ax_lagebezeichnungmithausnummer (
	hausnummer character varying NOT NULL,
	ortsteil character varying,
	weistzum text,
	gehoertzu text[],
	hat text[],
	beziehtsichauchauf text,
	beziehtsichauf text
) INHERITS (ax_lage) WITH OIDS;

COMMENT ON TABLE ax_lagebezeichnungmithausnummer IS 'FeatureType: "AX_LagebezeichnungMitHausnummer"';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.hausnummer IS 'hausnummer  CharacterString 1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.ortsteil IS 'ortsteil  CharacterString 0..1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.weistzum IS 'Assoziation zu: FeatureType AX_Turm (ax_turm) 0..1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.gehoertzu IS 'Assoziation zu: FeatureType AX_Flurstueck (ax_flurstueck) 0..*';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.hat IS 'Assoziation zu: FeatureType AX_HistorischesFlurstueckOhneRaumbezug (ax_historischesflurstueckohneraumbezug) 0..*';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.beziehtsichauchauf IS 'Assoziation zu: FeatureType AX_GeoreferenzierteGebaeudeadresse (ax_georeferenziertegebaeudeadresse) 0..1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.beziehtsichauf IS 'Assoziation zu: FeatureType AX_Gebaeude (ax_gebaeude) 0..1';
CREATE TABLE IF NOT EXISTS ax_lagebezeichnungmitpseudonummer (
	pseudonummer character varying NOT NULL,
	laufendenummer character varying,
	ortsteil character varying,
	gehoertzu text
) INHERITS (ax_lage) WITH OIDS;

COMMENT ON TABLE ax_lagebezeichnungmitpseudonummer IS 'FeatureType: "AX_LagebezeichnungMitPseudonummer"';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.pseudonummer IS 'pseudonummer  CharacterString 1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.laufendenummer IS 'laufendeNummer  CharacterString 0..1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.ortsteil IS 'ortsteil  CharacterString 0..1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.gehoertzu IS 'Assoziation zu: FeatureType AX_Gebaeude (ax_gebaeude) 0..1';
CREATE TABLE IF NOT EXISTS ax_reservierung (
	art ax_art_reservierung NOT NULL,
	nummer character varying NOT NULL,
	vermessungsstelle ax_dienststelle_schluessel NOT NULL,
	ablaufderreservierung date,
	antragsnummer character varying,
	auftragsnummer character varying,
	nummerierungsbezirk character varying,
	gebietskennung ax_reservierungsauftrag_gebietskennung
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_reservierung IS 'FeatureType: "AX_Reservierung"';
COMMENT ON COLUMN ax_reservierung.art IS 'art enumeration AX_Art_Reservierung 1';
COMMENT ON COLUMN ax_reservierung.nummer IS 'nummer  CharacterString 1';
COMMENT ON COLUMN ax_reservierung.vermessungsstelle IS 'vermessungsstelle DataType AX_Dienststelle_Schluessel 1';
COMMENT ON COLUMN ax_reservierung.ablaufderreservierung IS 'ablaufDerReservierung  Date 0..1';
COMMENT ON COLUMN ax_reservierung.antragsnummer IS 'antragsnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_reservierung.auftragsnummer IS 'auftragsnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_reservierung.nummerierungsbezirk IS 'nummerierungsbezirk  CharacterString 0..1';
COMMENT ON COLUMN ax_reservierung.gebietskennung IS 'gebietskennung union AX_Reservierungsauftrag_Gebietskennung 0..1';
CREATE TABLE IF NOT EXISTS ax_punktkennunguntergegangen (
	punktkennung character varying NOT NULL,
	art ax_art_punktkennung
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_punktkennunguntergegangen IS 'FeatureType: "AX_PunktkennungUntergegangen"';
COMMENT ON COLUMN ax_punktkennunguntergegangen.punktkennung IS 'punktkennung  CharacterString 1';
COMMENT ON COLUMN ax_punktkennunguntergegangen.art IS 'art enumeration AX_Art_Punktkennung 0..1';
CREATE TABLE IF NOT EXISTS ax_punktkennungvergleichend (
	vorlaeufigepunktkennung character varying NOT NULL,
	endgueltigepunktkennung character varying NOT NULL,
	art ax_art_punktkennung,
	antragsnummer character varying NOT NULL
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_punktkennungvergleichend IS 'FeatureType: "AX_PunktkennungVergleichend"';
COMMENT ON COLUMN ax_punktkennungvergleichend.vorlaeufigepunktkennung IS 'vorlaeufigePunktkennung  CharacterString 1';
COMMENT ON COLUMN ax_punktkennungvergleichend.endgueltigepunktkennung IS 'endgueltigePunktkennung  CharacterString 1';
COMMENT ON COLUMN ax_punktkennungvergleichend.art IS 'art enumeration AX_Art_Punktkennung 0..1';
COMMENT ON COLUMN ax_punktkennungvergleichend.antragsnummer IS 'antragsnummer  CharacterString 1';
CREATE TABLE IF NOT EXISTS ax_fortfuehrungsnachweisdeckblatt (
	ausgabekopf ax_k_ausgkopf_standard,
	fortfuehrungsfallnummernbereich character varying,
	fnnummer ax_fortfuehrungsnummer NOT NULL,
	titel character varying NOT NULL,
	ingemarkung ax_gemarkung_schluessel NOT NULL,
	erstelltam date,
	eignungspruefungam date,
	fortfuehrungsentscheidungam date,
	fortfuehrungsentscheidungvon character varying,
	eignungspruefungvon character varying,
	fortfuehrungsmitteilungenerzeugt date,
	bemerkung character varying,
	verwaltungsaktjn character varying,
	erstelltvon character varying,
	bekanntgabeanbeteiligteam date,
	auszugfuer ax_auszug[],
	grundbuchmitteilungfuerfinanzamt character varying,
	beziehtsichauf text[] NOT NULL
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_fortfuehrungsnachweisdeckblatt IS 'FeatureType: "AX_FortfuehrungsnachweisDeckblatt"';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.ausgabekopf IS 'ausgabekopf DataType AX_K_AUSGKOPF_Standard 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.fortfuehrungsfallnummernbereich IS 'fortfuehrungsfallNummernbereich  CharacterString 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.fnnummer IS 'fNNummer DataType AX_Fortfuehrungsnummer 1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.titel IS 'titel  CharacterString 1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.ingemarkung IS 'inGemarkung DataType AX_Gemarkung_Schluessel 1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.erstelltam IS 'erstelltAm  Date 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.eignungspruefungam IS 'eignungspruefungAm  Date 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.fortfuehrungsentscheidungam IS 'fortfuehrungsentscheidungAm  Date 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.fortfuehrungsentscheidungvon IS 'fortfuehrungsentscheidungVon  CharacterString 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.eignungspruefungvon IS 'eignungspruefungVon  CharacterString 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.fortfuehrungsmitteilungenerzeugt IS 'fortfuehrungsmitteilungenErzeugt  Date 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.bemerkung IS 'bemerkung  CharacterString 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.verwaltungsaktjn IS 'verwaltungsaktJN  CharacterString 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.erstelltvon IS 'erstelltVon  CharacterString 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.bekanntgabeanbeteiligteam IS 'bekanntgabeAnBeteiligteAm  Date 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.auszugfuer IS 'auszugFuer DataType AX_Auszug 0..*';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.grundbuchmitteilungfuerfinanzamt IS 'grundbuchmitteilungFuerFinanzamt  CharacterString 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.beziehtsichauf IS 'Assoziation zu: FeatureType AX_Fortfuehrungsfall (ax_fortfuehrungsfall) 1..*';
CREATE TABLE IF NOT EXISTS ax_fortfuehrungsfall (
	fortfuehrungsfallnummer integer NOT NULL,
	laufendenummer character varying,
	ueberschriftimfortfuehrungsnachweis aa_anlassart[] NOT NULL,
	anzahlderfortfuehrungsmitteilungen integer,
	fortfuehrungsmitteilunganeigentuemerantragsteller character varying,
	anmerkungfuerdennotar character varying,
	bemerkung character varying,
	zeigtaufaltesflurstueck character varying[],
	zeigtaufneuesflurstueck character varying[],
	verweistauf ax_fgraphik,
	inverszu_beziehtsichauf text
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_fortfuehrungsfall IS 'FeatureType: "AX_Fortfuehrungsfall"';
COMMENT ON COLUMN ax_fortfuehrungsfall.fortfuehrungsfallnummer IS 'fortfuehrungsfallnummer  Integer 1';
COMMENT ON COLUMN ax_fortfuehrungsfall.laufendenummer IS 'laufendeNummer  CharacterString 0..1';
COMMENT ON COLUMN ax_fortfuehrungsfall.ueberschriftimfortfuehrungsnachweis IS 'ueberschriftImFortfuehrungsnachweis codeList AA_Anlassart 1..*';
COMMENT ON COLUMN ax_fortfuehrungsfall.anzahlderfortfuehrungsmitteilungen IS 'anzahlDerFortfuehrungsmitteilungen  Integer 0..1';
COMMENT ON COLUMN ax_fortfuehrungsfall.fortfuehrungsmitteilunganeigentuemerantragsteller IS 'fortfuehrungsmitteilungAnEigentuemerAntragsteller  CharacterString 0..1';
COMMENT ON COLUMN ax_fortfuehrungsfall.anmerkungfuerdennotar IS 'anmerkungFuerDenNotar  CharacterString 0..1';
COMMENT ON COLUMN ax_fortfuehrungsfall.bemerkung IS 'bemerkung  CharacterString 0..1';
COMMENT ON COLUMN ax_fortfuehrungsfall.zeigtaufaltesflurstueck IS 'zeigtAufAltesFlurstueck  CharacterString 0..*';
COMMENT ON COLUMN ax_fortfuehrungsfall.zeigtaufneuesflurstueck IS 'zeigtAufNeuesFlurstueck  CharacterString 0..*';
COMMENT ON COLUMN ax_fortfuehrungsfall.verweistauf IS 'verweistAuf DataType AX_FGraphik 0..1';
COMMENT ON COLUMN ax_fortfuehrungsfall.inverszu_beziehtsichauf IS 'Assoziation zu: FeatureType AX_FortfuehrungsnachweisDeckblatt (ax_fortfuehrungsnachweisdeckblatt) 0..1';
CREATE TABLE IF NOT EXISTS ax_gemeinde (
	gemeindekennzeichen ax_gemeindekennzeichen NOT NULL,
	istamtsbezirkvon ax_dienststelle_schluessel[],
	schluesselgesamt character varying NOT NULL,
	bezeichnung character varying NOT NULL,
	administrativefunktion ax_administrative_funktion[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_gemeinde IS 'FeatureType: "AX_Gemeinde"';
COMMENT ON COLUMN ax_gemeinde.gemeindekennzeichen IS 'gemeindekennzeichen DataType AX_Gemeindekennzeichen 1';
COMMENT ON COLUMN ax_gemeinde.istamtsbezirkvon IS 'istAmtsbezirkVon DataType AX_Dienststelle_Schluessel 0..*';
COMMENT ON COLUMN ax_gemeinde.schluesselgesamt IS 'schluesselGesamt  CharacterString 1';
COMMENT ON COLUMN ax_gemeinde.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_gemeinde.administrativefunktion IS 'administrativeFunktion enumeration AX_Administrative_Funktion 0..*';
CREATE TABLE IF NOT EXISTS ax_buchungsblattbezirk (
	schluessel ax_buchungsblattbezirk_schluessel NOT NULL,
	gehoertzu ax_dienststelle_schluessel,
	schluesselgesamt character varying NOT NULL,
	bezeichnung character varying NOT NULL,
	administrativefunktion ax_administrative_funktion[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_buchungsblattbezirk IS 'FeatureType: "AX_Buchungsblattbezirk"';
COMMENT ON COLUMN ax_buchungsblattbezirk.schluessel IS 'schluessel DataType AX_Buchungsblattbezirk_Schluessel 1';
COMMENT ON COLUMN ax_buchungsblattbezirk.gehoertzu IS 'gehoertZu DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_buchungsblattbezirk.schluesselgesamt IS 'schluesselGesamt  CharacterString 1';
COMMENT ON COLUMN ax_buchungsblattbezirk.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_buchungsblattbezirk.administrativefunktion IS 'administrativeFunktion enumeration AX_Administrative_Funktion 0..*';
CREATE TABLE IF NOT EXISTS ax_gemarkungsteilflur (
	schluesselgesamt character varying NOT NULL,
	bezeichnung character varying NOT NULL,
	administrativefunktion ax_administrative_funktion[],
	schluessel ax_gemarkungsteilflur_schluessel NOT NULL,
	gehoertzu ax_dienststelle_schluessel[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_gemarkungsteilflur IS 'FeatureType: "AX_GemarkungsteilFlur"';
COMMENT ON COLUMN ax_gemarkungsteilflur.schluesselgesamt IS 'schluesselGesamt  CharacterString 1';
COMMENT ON COLUMN ax_gemarkungsteilflur.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_gemarkungsteilflur.administrativefunktion IS 'administrativeFunktion enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_gemarkungsteilflur.schluessel IS 'schluessel DataType AX_GemarkungsteilFlur_Schluessel 1';
COMMENT ON COLUMN ax_gemarkungsteilflur.gehoertzu IS 'gehoertZu DataType AX_Dienststelle_Schluessel 0..*';
CREATE TABLE IF NOT EXISTS ax_kreisregion (
	schluesselgesamt character varying NOT NULL,
	bezeichnung character varying NOT NULL,
	administrativefunktion ax_administrative_funktion[],
	schluessel ax_kreis_schluessel NOT NULL,
	istamtsbezirkvon ax_dienststelle_schluessel[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_kreisregion IS 'FeatureType: "AX_KreisRegion"';
COMMENT ON COLUMN ax_kreisregion.schluesselgesamt IS 'schluesselGesamt  CharacterString 1';
COMMENT ON COLUMN ax_kreisregion.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_kreisregion.administrativefunktion IS 'administrativeFunktion enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_kreisregion.schluessel IS 'schluessel DataType AX_Kreis_Schluessel 1';
COMMENT ON COLUMN ax_kreisregion.istamtsbezirkvon IS 'istAmtsbezirkVon DataType AX_Dienststelle_Schluessel 0..*';
CREATE TABLE IF NOT EXISTS ax_bundesland (
	schluesselgesamt character varying NOT NULL,
	bezeichnung character varying NOT NULL,
	administrativefunktion ax_administrative_funktion[],
	schluessel ax_bundesland_schluessel NOT NULL,
	istamtsbezirkvon ax_dienststelle_schluessel[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_bundesland IS 'FeatureType: "AX_Bundesland"';
COMMENT ON COLUMN ax_bundesland.schluesselgesamt IS 'schluesselGesamt  CharacterString 1';
COMMENT ON COLUMN ax_bundesland.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_bundesland.administrativefunktion IS 'administrativeFunktion enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_bundesland.schluessel IS 'schluessel DataType AX_Bundesland_Schluessel 1';
COMMENT ON COLUMN ax_bundesland.istamtsbezirkvon IS 'istAmtsbezirkVon DataType AX_Dienststelle_Schluessel 0..*';
CREATE TABLE IF NOT EXISTS ax_regierungsbezirk (
	schluesselgesamt character varying NOT NULL,
	bezeichnung character varying NOT NULL,
	administrativefunktion ax_administrative_funktion[],
	schluessel ax_regierungsbezirk_schluessel NOT NULL
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_regierungsbezirk IS 'FeatureType: "AX_Regierungsbezirk"';
COMMENT ON COLUMN ax_regierungsbezirk.schluesselgesamt IS 'schluesselGesamt  CharacterString 1';
COMMENT ON COLUMN ax_regierungsbezirk.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_regierungsbezirk.administrativefunktion IS 'administrativeFunktion enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_regierungsbezirk.schluessel IS 'schluessel DataType AX_Regierungsbezirk_Schluessel 1';
CREATE TABLE IF NOT EXISTS ax_gemeindeteil (
	schluessel ax_gemeindekennzeichen NOT NULL,
	schluesselgesamt character varying NOT NULL,
	bezeichnung character varying NOT NULL,
	administrativefunktion ax_administrative_funktion[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_gemeindeteil IS 'FeatureType: "AX_Gemeindeteil"';
COMMENT ON COLUMN ax_gemeindeteil.schluessel IS 'schluessel DataType AX_Gemeindekennzeichen 1';
COMMENT ON COLUMN ax_gemeindeteil.schluesselgesamt IS 'schluesselGesamt  CharacterString 1';
COMMENT ON COLUMN ax_gemeindeteil.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_gemeindeteil.administrativefunktion IS 'administrativeFunktion enumeration AX_Administrative_Funktion 0..*';
CREATE TABLE IF NOT EXISTS ax_lagebezeichnungkatalogeintrag (
	schluessel ax_verschluesseltelagebezeichnung NOT NULL,
	kennung character varying,
	schluesselgesamt character varying NOT NULL,
	bezeichnung character varying NOT NULL,
	administrativefunktion ax_administrative_funktion[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_lagebezeichnungkatalogeintrag IS 'FeatureType: "AX_LagebezeichnungKatalogeintrag"';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.schluessel IS 'schluessel DataType AX_VerschluesselteLagebezeichnung 1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.kennung IS 'kennung  CharacterString 0..1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.schluesselgesamt IS 'schluesselGesamt  CharacterString 1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.administrativefunktion IS 'administrativeFunktion enumeration AX_Administrative_Funktion 0..*';
CREATE TABLE IF NOT EXISTS ax_gemarkung (
	schluesselgesamt character varying NOT NULL,
	bezeichnung character varying NOT NULL,
	administrativefunktion ax_administrative_funktion[],
	schluessel ax_gemarkung_schluessel NOT NULL,
	istamtsbezirkvon ax_dienststelle_schluessel[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_gemarkung IS 'FeatureType: "AX_Gemarkung"';
COMMENT ON COLUMN ax_gemarkung.schluesselgesamt IS 'schluesselGesamt  CharacterString 1';
COMMENT ON COLUMN ax_gemarkung.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_gemarkung.administrativefunktion IS 'administrativeFunktion enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_gemarkung.schluessel IS 'schluessel DataType AX_Gemarkung_Schluessel 1';
COMMENT ON COLUMN ax_gemarkung.istamtsbezirkvon IS 'istAmtsbezirkVon DataType AX_Dienststelle_Schluessel 0..*';
CREATE TABLE IF NOT EXISTS ax_dienststelle (
	schluessel ax_dienststelle_schluessel NOT NULL,
	stellenart ax_behoerde,
	kennung character varying,
	schluesselgesamt character varying NOT NULL,
	bezeichnung character varying NOT NULL,
	administrativefunktion ax_administrative_funktion[],
	hat text
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_dienststelle IS 'FeatureType: "AX_Dienststelle"';
COMMENT ON COLUMN ax_dienststelle.schluessel IS 'schluessel DataType AX_Dienststelle_Schluessel 1';
COMMENT ON COLUMN ax_dienststelle.stellenart IS 'stellenart enumeration AX_Behoerde 0..1';
COMMENT ON COLUMN ax_dienststelle.kennung IS 'kennung  CharacterString 0..1';
COMMENT ON COLUMN ax_dienststelle.schluesselgesamt IS 'schluesselGesamt  CharacterString 1';
COMMENT ON COLUMN ax_dienststelle.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_dienststelle.administrativefunktion IS 'administrativeFunktion enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_dienststelle.hat IS 'Assoziation zu: FeatureType AX_Anschrift (ax_anschrift) 0..1';
CREATE TABLE IF NOT EXISTS ax_verband (
	art ax_art_verband,
	enthaelt ax_gemeindekennzeichen[] NOT NULL,
	schluesselgesamt character varying NOT NULL,
	bezeichnung character varying NOT NULL,
	administrativefunktion ax_administrative_funktion[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_verband IS 'FeatureType: "AX_Verband"';
COMMENT ON COLUMN ax_verband.art IS 'art enumeration AX_Art_Verband 0..1';
COMMENT ON COLUMN ax_verband.enthaelt IS 'enthaelt DataType AX_Gemeindekennzeichen 1..*';
COMMENT ON COLUMN ax_verband.schluesselgesamt IS 'schluesselGesamt  CharacterString 1';
COMMENT ON COLUMN ax_verband.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_verband.administrativefunktion IS 'administrativeFunktion enumeration AX_Administrative_Funktion 0..*';
CREATE TABLE IF NOT EXISTS ax_nationalstaat (
	schluessel character varying NOT NULL,
	schluesselgesamt character varying NOT NULL,
	bezeichnung character varying NOT NULL,
	administrativefunktion ax_administrative_funktion[]
) INHERITS (aa_nreo) WITH OIDS;

COMMENT ON TABLE ax_nationalstaat IS 'FeatureType: "AX_Nationalstaat"';
COMMENT ON COLUMN ax_nationalstaat.schluessel IS 'schluessel  CharacterString 1';
COMMENT ON COLUMN ax_nationalstaat.schluesselgesamt IS 'schluesselGesamt  CharacterString 1';
COMMENT ON COLUMN ax_nationalstaat.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_nationalstaat.administrativefunktion IS 'administrativeFunktion enumeration AX_Administrative_Funktion 0..*';
CREATE TABLE IF NOT EXISTS aa_zuso (
	bestehtaus text[]
) INHERITS (aa_objekt) WITH OIDS;

COMMENT ON TABLE aa_zuso IS 'FeatureType: "AA_ZUSO"';
COMMENT ON COLUMN aa_zuso.bestehtaus IS 'Assoziation zu: FeatureType AA_Objekt (aa_objekt) 0..*';
CREATE TABLE IF NOT EXISTS ax_besondererbauwerkspunkt (
	punktkennung character varying,
	zustaendigestelle ax_dienststelle_schluessel,
	sonstigeeigenschaft character varying[]
) INHERITS (aa_zuso) WITH OIDS;

COMMENT ON TABLE ax_besondererbauwerkspunkt IS 'FeatureType: "AX_BesondererBauwerkspunkt"';
COMMENT ON COLUMN ax_besondererbauwerkspunkt.punktkennung IS 'punktkennung  CharacterString 0..1';
COMMENT ON COLUMN ax_besondererbauwerkspunkt.zustaendigestelle IS 'zustaendigeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_besondererbauwerkspunkt.sonstigeeigenschaft IS 'sonstigeEigenschaft  CharacterString 0..*';
CREATE TABLE IF NOT EXISTS ax_netzknoten (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bezeichnung character varying NOT NULL,
	inverszu_gehoertzubauwerk text[]
) INHERITS (aa_zuso) WITH OIDS;

COMMENT ON TABLE ax_netzknoten IS 'FeatureType: "AX_Netzknoten"';
COMMENT ON COLUMN ax_netzknoten.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_netzknoten.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_netzknoten.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_festpunkt (
	punktkennung character varying NOT NULL,
	gemeinde ax_gemeindekennzeichen NOT NULL,
	gemarkung ax_gemarkung_schluessel,
	katasteramt ax_dienststelle_schluessel,
	land ax_bundesland_schluessel NOT NULL,
	relativehoehe double precision,
	darstellungshinweis boolean,
	frueherepunktnummer character varying[],
	internebemerkungen character varying[],
	nutzerspezifischebemerkungen character varying[],
	namelagebeschreibung character varying,
	punktvermarkung ax_marke NOT NULL
) INHERITS (aa_zuso) WITH OIDS;

COMMENT ON TABLE ax_festpunkt IS 'FeatureType: "AX_Festpunkt"';
COMMENT ON COLUMN ax_festpunkt.punktkennung IS 'punktkennung  CharacterString 1';
COMMENT ON COLUMN ax_festpunkt.gemeinde IS 'gemeinde DataType AX_Gemeindekennzeichen 1';
COMMENT ON COLUMN ax_festpunkt.gemarkung IS 'gemarkung DataType AX_Gemarkung_Schluessel 0..1';
COMMENT ON COLUMN ax_festpunkt.katasteramt IS 'katasteramt DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_festpunkt.land IS 'land DataType AX_Bundesland_Schluessel 1';
COMMENT ON COLUMN ax_festpunkt.relativehoehe IS 'relativeHoehe  Length 0..1';
COMMENT ON COLUMN ax_festpunkt.darstellungshinweis IS 'darstellungshinweis  Boolean 0..1';
COMMENT ON COLUMN ax_festpunkt.frueherepunktnummer IS 'frueherePunktnummer  CharacterString 0..*';
COMMENT ON COLUMN ax_festpunkt.internebemerkungen IS 'interneBemerkungen  CharacterString 0..*';
COMMENT ON COLUMN ax_festpunkt.nutzerspezifischebemerkungen IS 'nutzerspezifischeBemerkungen  CharacterString 0..*';
COMMENT ON COLUMN ax_festpunkt.namelagebeschreibung IS 'nameLagebeschreibung  CharacterString 0..1';
COMMENT ON COLUMN ax_festpunkt.punktvermarkung IS 'punktvermarkung enumeration AX_Marke 1';
CREATE TABLE IF NOT EXISTS ax_referenzstationspunkt (
	funktion ax_funktion_referenzstationspunkt,
	beginn timestamp without time zone,
	ende timestamp without time zone,
	gnssempfaenger ax_gnssempfaenger,
	gnssantenne ax_gnssantenne NOT NULL,
	offsetl1 ax_offsetkomponenten_referenzstationspunkt NOT NULL,
	offsetl2 ax_offsetkomponenten_referenzstationspunkt NOT NULL,
	phasenzentrumsvariationl1 ax_phasenzentrumsvariation_referenzstationspunkt,
	phasenzentrumsvariationl2 ax_phasenzentrumsvariation_referenzstationspunkt,
	isdnnummer character varying,
	tcpipnummer character varying,
	funkfrequenz double precision,
	qualitaetsangaben ax_dqfestpunkt,
	istidentischmitlfp text,
	istidentischmithfp text,
	unterschiedlicherbezugspunktmitsfp text
) INHERITS (ax_festpunkt) WITH OIDS;

COMMENT ON TABLE ax_referenzstationspunkt IS 'FeatureType: "AX_Referenzstationspunkt"';
COMMENT ON COLUMN ax_referenzstationspunkt.funktion IS 'funktion enumeration AX_Funktion_Referenzstationspunkt 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.beginn IS 'beginn  DateTime 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.ende IS 'ende  DateTime 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.gnssempfaenger IS 'gnssEmpfaenger DataType AX_GNSSEmpfaenger 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.gnssantenne IS 'gnssAntenne DataType AX_GNSSAntenne 1';
COMMENT ON COLUMN ax_referenzstationspunkt.offsetl1 IS 'offsetL1 DataType AX_Offsetkomponenten_Referenzstationspunkt 1';
COMMENT ON COLUMN ax_referenzstationspunkt.offsetl2 IS 'offsetL2 DataType AX_Offsetkomponenten_Referenzstationspunkt 1';
COMMENT ON COLUMN ax_referenzstationspunkt.phasenzentrumsvariationl1 IS 'phasenzentrumsvariationL1 DataType AX_Phasenzentrumsvariation_Referenzstationspunkt 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.phasenzentrumsvariationl2 IS 'phasenzentrumsvariationL2 DataType AX_Phasenzentrumsvariation_Referenzstationspunkt 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.isdnnummer IS 'isdnNummer  CharacterString 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.tcpipnummer IS 'tcpipNummer  CharacterString 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.funkfrequenz IS 'funkfrequenz  Real 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQFestpunkt 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.istidentischmitlfp IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.istidentischmithfp IS 'Assoziation zu: FeatureType AX_Hoehenfestpunkt (ax_hoehenfestpunkt) 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.unterschiedlicherbezugspunktmitsfp IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..1';
CREATE TABLE IF NOT EXISTS ax_lagefestpunkt (
	pfeilerhoehe ax_pfeilerhoehe_lagefestpunkt,
	klassifikation ax_klassifikation_lagefestpunkt,
	funktion ax_funktion_lagefestpunkt,
	qualitaetsangaben ax_dqfestpunkt,
	istidentischmitrsp text,
	istexzentrumzu text,
	istzentrumzu text[],
	unterschiedlicherbezugspunktmithfp text,
	istidentischmithfp text,
	unterschiedlicherbezugspunktmitsfp text,
	istidentischmitsfp text,
	istidentischmitgrenzpunkt text,
	unterschiedlicherbezugspunktmitgrenzpunkt text,
	istidentischmitap text,
	unterschiedlicherbezugspunktmitap text,
	unterschiedlicherbezugspunktmitsvp text,
	istidentischmitsvp text
) INHERITS (ax_festpunkt) WITH OIDS;

COMMENT ON TABLE ax_lagefestpunkt IS 'FeatureType: "AX_Lagefestpunkt"';
COMMENT ON COLUMN ax_lagefestpunkt.pfeilerhoehe IS 'pfeilerhoehe DataType AX_Pfeilerhoehe_Lagefestpunkt 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.klassifikation IS 'klassifikation DataType AX_Klassifikation_Lagefestpunkt 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.funktion IS 'funktion enumeration AX_Funktion_Lagefestpunkt 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQFestpunkt 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.istidentischmitrsp IS 'Assoziation zu: FeatureType AX_Referenzstationspunkt (ax_referenzstationspunkt) 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.istexzentrumzu IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.istzentrumzu IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..*';
COMMENT ON COLUMN ax_lagefestpunkt.unterschiedlicherbezugspunktmithfp IS 'Assoziation zu: FeatureType AX_Hoehenfestpunkt (ax_hoehenfestpunkt) 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.istidentischmithfp IS 'Assoziation zu: FeatureType AX_Hoehenfestpunkt (ax_hoehenfestpunkt) 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.unterschiedlicherbezugspunktmitsfp IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.istidentischmitsfp IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.istidentischmitgrenzpunkt IS 'Assoziation zu: FeatureType AX_Grenzpunkt (ax_grenzpunkt) 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.unterschiedlicherbezugspunktmitgrenzpunkt IS 'Assoziation zu: FeatureType AX_Grenzpunkt (ax_grenzpunkt) 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.istidentischmitap IS 'Assoziation zu: FeatureType AX_Aufnahmepunkt (ax_aufnahmepunkt) 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.unterschiedlicherbezugspunktmitap IS 'Assoziation zu: FeatureType AX_Aufnahmepunkt (ax_aufnahmepunkt) 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.unterschiedlicherbezugspunktmitsvp IS 'Assoziation zu: FeatureType AX_SonstigerVermessungspunkt (ax_sonstigervermessungspunkt) 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.istidentischmitsvp IS 'Assoziation zu: FeatureType AX_SonstigerVermessungspunkt (ax_sonstigervermessungspunkt) 0..1';
CREATE TABLE IF NOT EXISTS ax_hoehenfestpunkt (
	ordnung ax_ordnung_hoehenfestpunkt,
	qualitaetsangaben ax_dqhoehenfestpunkt,
	nivlinie character varying[],
	istidentischmitrsp text,
	unterschiedlicherbezugspunktmitlfp text,
	istidentischmitlfp text,
	istidentischmitsfp text,
	unterschiedlicherbezugspunktmitsfp text,
	unterschiedlicherbezugspunktmitap text,
	unterschiedlicherbezugspunktmitsvp text,
	unterschiedlicherbezugspunktmitsp text
) INHERITS (ax_festpunkt) WITH OIDS;

COMMENT ON TABLE ax_hoehenfestpunkt IS 'FeatureType: "AX_Hoehenfestpunkt"';
COMMENT ON COLUMN ax_hoehenfestpunkt.ordnung IS 'ordnung enumeration AX_Ordnung_Hoehenfestpunkt 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQHoehenfestpunkt 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.nivlinie IS 'nivlinie  CharacterString 0..*';
COMMENT ON COLUMN ax_hoehenfestpunkt.istidentischmitrsp IS 'Assoziation zu: FeatureType AX_Referenzstationspunkt (ax_referenzstationspunkt) 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.unterschiedlicherbezugspunktmitlfp IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.istidentischmitlfp IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.istidentischmitsfp IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.unterschiedlicherbezugspunktmitsfp IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.unterschiedlicherbezugspunktmitap IS 'Assoziation zu: FeatureType AX_Aufnahmepunkt (ax_aufnahmepunkt) 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.unterschiedlicherbezugspunktmitsvp IS 'Assoziation zu: FeatureType AX_SonstigerVermessungspunkt (ax_sonstigervermessungspunkt) 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.unterschiedlicherbezugspunktmitsp IS 'Assoziation zu: FeatureType AX_Sicherungspunkt (ax_sicherungspunkt) 0..1';
CREATE TABLE IF NOT EXISTS ax_schwerefestpunkt (
	ordnung ax_ordnung_schwerefestpunkt,
	funktion ax_funktion_schwerefestpunkt,
	qualitaetsangaben ax_dqfestpunkt,
	unterschiedlicherbezugspunktmitrsp text,
	unterschiedlicherbezugspunktmitlfp text,
	istidentischmitlfp text,
	istidentischmithfp text,
	unterschiedlicherbezugspunktmithfp text,
	istzentrumzu  text[],
	istexzentrumzu  text,
	istidentischmitgrenzpunkt text,
	istidentischmitap text,
	istidentischmitsvp text,
	istidentischmitsp text
) INHERITS (ax_festpunkt) WITH OIDS;

COMMENT ON TABLE ax_schwerefestpunkt IS 'FeatureType: "AX_Schwerefestpunkt"';
COMMENT ON COLUMN ax_schwerefestpunkt.ordnung IS 'ordnung enumeration AX_Ordnung_Schwerefestpunkt 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.funktion IS 'funktion enumeration AX_Funktion_Schwerefestpunkt 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQFestpunkt 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.unterschiedlicherbezugspunktmitrsp IS 'Assoziation zu: FeatureType AX_Referenzstationspunkt (ax_referenzstationspunkt) 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.unterschiedlicherbezugspunktmitlfp IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.istidentischmitlfp IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.istidentischmithfp IS 'Assoziation zu: FeatureType AX_Hoehenfestpunkt (ax_hoehenfestpunkt) 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.unterschiedlicherbezugspunktmithfp IS 'Assoziation zu: FeatureType AX_Hoehenfestpunkt (ax_hoehenfestpunkt) 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.istzentrumzu  IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..*';
COMMENT ON COLUMN ax_schwerefestpunkt.istexzentrumzu  IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.istidentischmitgrenzpunkt IS 'Assoziation zu: FeatureType AX_Grenzpunkt (ax_grenzpunkt) 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.istidentischmitap IS 'Assoziation zu: FeatureType AX_Aufnahmepunkt (ax_aufnahmepunkt) 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.istidentischmitsvp IS 'Assoziation zu: FeatureType AX_SonstigerVermessungspunkt (ax_sonstigervermessungspunkt) 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.istidentischmitsp IS 'Assoziation zu: FeatureType AX_Sicherungspunkt (ax_sicherungspunkt) 0..1';
CREATE TABLE IF NOT EXISTS ax_grenzpunkt (
	punktkennung character varying,
	zustaendigestelle ax_dienststelle_schluessel,
	abmarkung_marke ax_marke NOT NULL,
	bemerkungzurabmarkung ax_bemerkungzurabmarkung_grenzpunkt,
	relativehoehe double precision,
	zwischenmarke boolean,
	besonderepunktnummer character varying,
	ausgesetzteabmarkung ax_dienststelle_schluessel,
	festgestelltergrenzpunkt boolean,
	sonstigeeigenschaft character varying[],
	gruendederausgesetztenabmarkung ax_gruendederausgesetztenabmarkung_grenzpunkt,
	horizontfreiheit ax_horizontfreiheit_grenzpunkt,
	zeitpunktderentstehung character varying,
	gehoertzulfp text[],
	inverszu_unterschiedlicherbezugspunktmitgrenzpunkt text[],
	beziehtsichaufsfp text[],
	inverszu_zeigtauf  text[],
	zeigtauf  text
) INHERITS (aa_zuso) WITH OIDS;

COMMENT ON TABLE ax_grenzpunkt IS 'FeatureType: "AX_Grenzpunkt"';
COMMENT ON COLUMN ax_grenzpunkt.punktkennung IS 'punktkennung  CharacterString 0..1';
COMMENT ON COLUMN ax_grenzpunkt.zustaendigestelle IS 'zustaendigeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_grenzpunkt.abmarkung_marke IS 'abmarkung_Marke enumeration AX_Marke 1';
COMMENT ON COLUMN ax_grenzpunkt.bemerkungzurabmarkung IS 'bemerkungZurAbmarkung enumeration AX_BemerkungZurAbmarkung_Grenzpunkt 0..1';
COMMENT ON COLUMN ax_grenzpunkt.relativehoehe IS 'relativeHoehe  Length 0..1';
COMMENT ON COLUMN ax_grenzpunkt.zwischenmarke IS 'zwischenmarke  Boolean 0..1';
COMMENT ON COLUMN ax_grenzpunkt.besonderepunktnummer IS 'besonderePunktnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_grenzpunkt.ausgesetzteabmarkung IS 'ausgesetzteAbmarkung DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_grenzpunkt.festgestelltergrenzpunkt IS 'festgestellterGrenzpunkt  Boolean 0..1';
COMMENT ON COLUMN ax_grenzpunkt.sonstigeeigenschaft IS 'sonstigeEigenschaft  CharacterString 0..*';
COMMENT ON COLUMN ax_grenzpunkt.gruendederausgesetztenabmarkung IS 'gruendeDerAusgesetztenAbmarkung enumeration AX_GruendeDerAusgesetztenAbmarkung_Grenzpunkt 0..1';
COMMENT ON COLUMN ax_grenzpunkt.horizontfreiheit IS 'horizontfreiheit enumeration AX_Horizontfreiheit_Grenzpunkt 0..1';
COMMENT ON COLUMN ax_grenzpunkt.zeitpunktderentstehung IS 'zeitpunktDerEntstehung  CharacterString 0..1';
COMMENT ON COLUMN ax_grenzpunkt.gehoertzulfp IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..*';
COMMENT ON COLUMN ax_grenzpunkt.inverszu_unterschiedlicherbezugspunktmitgrenzpunkt IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..*';
COMMENT ON COLUMN ax_grenzpunkt.beziehtsichaufsfp IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..*';
COMMENT ON COLUMN ax_grenzpunkt.inverszu_zeigtauf  IS 'Assoziation zu: FeatureType AX_Grenzpunkt (ax_grenzpunkt) 0..*';
COMMENT ON COLUMN ax_grenzpunkt.zeigtauf  IS 'Assoziation zu: FeatureType AX_Grenzpunkt (ax_grenzpunkt) 0..1';
CREATE TABLE IF NOT EXISTS ax_netzpunkt (
	punktkennung character varying,
	zustaendigestelle ax_dienststelle_schluessel,
	sonstigeeigenschaft character varying[],
	horizontfreiheit ax_horizontfreiheit_netzpunkt,
	relativehoehe double precision,
	vermarkung_marke ax_marke NOT NULL
) INHERITS (aa_zuso) WITH OIDS;

COMMENT ON TABLE ax_netzpunkt IS 'FeatureType: "AX_Netzpunkt"';
COMMENT ON COLUMN ax_netzpunkt.punktkennung IS 'punktkennung  CharacterString 0..1';
COMMENT ON COLUMN ax_netzpunkt.zustaendigestelle IS 'zustaendigeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_netzpunkt.sonstigeeigenschaft IS 'sonstigeEigenschaft  CharacterString 0..*';
COMMENT ON COLUMN ax_netzpunkt.horizontfreiheit IS 'horizontfreiheit enumeration AX_Horizontfreiheit_Netzpunkt 0..1';
COMMENT ON COLUMN ax_netzpunkt.relativehoehe IS 'relativeHoehe  Length 0..1';
COMMENT ON COLUMN ax_netzpunkt.vermarkung_marke IS 'vermarkung_Marke enumeration AX_Marke 1';
CREATE TABLE IF NOT EXISTS ax_aufnahmepunkt (
	gehoertzu text[],
	beziehtsichauf text[],
	haengtan text[],
	hatidentitaet text[],
	hat text[]
) INHERITS (ax_netzpunkt) WITH OIDS;

COMMENT ON TABLE ax_aufnahmepunkt IS 'FeatureType: "AX_Aufnahmepunkt"';
COMMENT ON COLUMN ax_aufnahmepunkt.gehoertzu IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..*';
COMMENT ON COLUMN ax_aufnahmepunkt.beziehtsichauf IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..*';
COMMENT ON COLUMN ax_aufnahmepunkt.haengtan IS 'Assoziation zu: FeatureType AX_Hoehenfestpunkt (ax_hoehenfestpunkt) 0..*';
COMMENT ON COLUMN ax_aufnahmepunkt.hatidentitaet IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..*';
COMMENT ON COLUMN ax_aufnahmepunkt.hat IS 'Assoziation zu: FeatureType AX_Sicherungspunkt (ax_sicherungspunkt) 0..*';
CREATE TABLE IF NOT EXISTS ax_sonstigervermessungspunkt (
	art character varying,
	beziehtsichauf text[],
	verbundenmit text[],
	inverszu_unterschiedlicherbezugspunktmitsvp text[],
	gehoertzu text[],
	hat text[]
) INHERITS (ax_netzpunkt) WITH OIDS;

COMMENT ON TABLE ax_sonstigervermessungspunkt IS 'FeatureType: "AX_SonstigerVermessungspunkt"';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.art IS 'art  CharacterString 0..1';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.beziehtsichauf IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..*';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.verbundenmit IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..*';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.inverszu_unterschiedlicherbezugspunktmitsvp IS 'Assoziation zu: FeatureType AX_Hoehenfestpunkt (ax_hoehenfestpunkt) 0..*';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.gehoertzu IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..*';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.hat IS 'Assoziation zu: FeatureType AX_Sicherungspunkt (ax_sicherungspunkt) 0..*';
CREATE TABLE IF NOT EXISTS ax_sicherungspunkt (
	inverszu_unterschiedlicherbezugspunktmitsp text[],
	hat text[],
	gehoertzu text,
	beziehtsichauf text
) INHERITS (ax_netzpunkt) WITH OIDS;

COMMENT ON TABLE ax_sicherungspunkt IS 'FeatureType: "AX_Sicherungspunkt"';
COMMENT ON COLUMN ax_sicherungspunkt.inverszu_unterschiedlicherbezugspunktmitsp IS 'Assoziation zu: FeatureType AX_Hoehenfestpunkt (ax_hoehenfestpunkt) 0..*';
COMMENT ON COLUMN ax_sicherungspunkt.hat IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..*';
COMMENT ON COLUMN ax_sicherungspunkt.gehoertzu IS 'Assoziation zu: FeatureType AX_Aufnahmepunkt (ax_aufnahmepunkt) 0..1';
COMMENT ON COLUMN ax_sicherungspunkt.beziehtsichauf IS 'Assoziation zu: FeatureType AX_SonstigerVermessungspunkt (ax_sonstigervermessungspunkt) 0..1';
CREATE TABLE IF NOT EXISTS ax_besonderergebaeudepunkt (
	punktkennung character varying,
	art ax_art_gebaeudepunkt,
	zustaendigestelle ax_dienststelle_schluessel,
	sonstigeeigenschaft character varying[]
) INHERITS (aa_zuso) WITH OIDS;

COMMENT ON TABLE ax_besonderergebaeudepunkt IS 'FeatureType: "AX_BesondererGebaeudepunkt"';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.punktkennung IS 'punktkennung  CharacterString 0..1';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.art IS 'art enumeration AX_Art_Gebaeudepunkt 0..1';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.zustaendigestelle IS 'zustaendigeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.sonstigeeigenschaft IS 'sonstigeEigenschaft  CharacterString 0..*';
CREATE TABLE IF NOT EXISTS ax_wirtschaftlicheeinheit (

) INHERITS (aa_zuso) WITH OIDS;

COMMENT ON TABLE ax_wirtschaftlicheeinheit IS 'FeatureType: "AX_WirtschaftlicheEinheit"';
CREATE TABLE IF NOT EXISTS ax_verwaltungsgemeinschaft (
	bezeichnungart ax_bezeichnung_verwaltungsgemeinschaft,
	schluessel ax_verwaltungsgemeinschaft_schluessel NOT NULL,
	schluesselgesamt character varying NOT NULL,
	bezeichnung character varying NOT NULL,
	administrativefunktion ax_administrative_funktion[]
) INHERITS (aa_zuso) WITH OIDS;

COMMENT ON TABLE ax_verwaltungsgemeinschaft IS 'FeatureType: "AX_Verwaltungsgemeinschaft"';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.bezeichnungart IS 'bezeichnungArt enumeration AX_Bezeichnung_Verwaltungsgemeinschaft 0..1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.schluessel IS 'schluessel DataType AX_Verwaltungsgemeinschaft_Schluessel 1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.schluesselgesamt IS 'schluesselGesamt  CharacterString 1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.administrativefunktion IS 'administrativeFunktion enumeration AX_Administrative_Funktion 0..*';
CREATE TABLE IF NOT EXISTS ax_schutzgebietnachnaturumweltoderbodenschutzrecht (
	artderfestlegung ax_artderfestlegung_schutzgebietnachnaturumweltoderbodensc NOT NULL,
	ausfuehrendestelle ax_dienststelle_schluessel,
	name character varying,
	nummerdesschutzgebietes character varying,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (aa_zuso) WITH OIDS;

COMMENT ON TABLE ax_schutzgebietnachnaturumweltoderbodenschutzrecht IS 'FeatureType: "AX_SchutzgebietNachNaturUmweltOderBodenschutzrecht"';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.artderfestlegung IS 'artDerFestlegung enumeration AX_ArtDerFestlegung_SchutzgebietNachNaturUmweltOderBodenschutzrecht 1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.ausfuehrendestelle IS 'ausfuehrendeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.nummerdesschutzgebietes IS 'nummerDesSchutzgebietes  CharacterString 0..1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_schutzgebietnachwasserrecht (
	artderfestlegung ax_artderfestlegung_schutzgebietnachwasserrecht NOT NULL,
	ausfuehrendestelle ax_dienststelle_schluessel,
	funktion ax_funktion_schutzgebietnachwasserrecht,
	name character varying,
	nummerdesschutzgebietes character varying,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (aa_zuso) WITH OIDS;

COMMENT ON TABLE ax_schutzgebietnachwasserrecht IS 'FeatureType: "AX_SchutzgebietNachWasserrecht"';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.artderfestlegung IS 'artDerFestlegung enumeration AX_ArtDerFestlegung_SchutzgebietNachWasserrecht 1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.ausfuehrendestelle IS 'ausfuehrendeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.funktion IS 'funktion enumeration AX_Funktion_SchutzgebietNachWasserrecht 0..1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.nummerdesschutzgebietes IS 'nummerDesSchutzgebietes  CharacterString 0..1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_boeschungkliff (
	zustand ax_zustand_boeschungkliff,
	objekthoehe double precision,
	name character varying,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (aa_zuso) WITH OIDS;

COMMENT ON TABLE ax_boeschungkliff IS 'FeatureType: "AX_BoeschungKliff"';
COMMENT ON COLUMN ax_boeschungkliff.zustand IS 'zustand enumeration AX_Zustand_BoeschungKliff 0..1';
COMMENT ON COLUMN ax_boeschungkliff.objekthoehe IS 'objekthoehe  Length 0..1';
COMMENT ON COLUMN ax_boeschungkliff.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_boeschungkliff.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_besonderertopographischerpunkt (
	punktkennung character varying,
	zustaendigestelle ax_dienststelle_schluessel,
	sonstigeeigenschaft character varying[]
) INHERITS (aa_zuso) WITH OIDS;

COMMENT ON TABLE ax_besonderertopographischerpunkt IS 'FeatureType: "AX_BesondererTopographischerPunkt"';
COMMENT ON COLUMN ax_besonderertopographischerpunkt.punktkennung IS 'punktkennung  CharacterString 0..1';
COMMENT ON COLUMN ax_besonderertopographischerpunkt.zustaendigestelle IS 'zustaendigeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_besonderertopographischerpunkt.sonstigeeigenschaft IS 'sonstigeEigenschaft  CharacterString 0..*';
CREATE TABLE IF NOT EXISTS ax_kanal (
	name character varying,
	widmung ax_widmung_kanal,
	gewaesserkennzahl character varying,
	identnummer character varying,
	schifffahrtskategorie ax_schifffahrtskategorie_kanal,
	zweitname character varying
) INHERITS (aa_zuso) WITH OIDS;

COMMENT ON TABLE ax_kanal IS 'FeatureType: "AX_Kanal"';
COMMENT ON COLUMN ax_kanal.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_kanal.widmung IS 'widmung enumeration AX_Widmung_Kanal 0..1';
COMMENT ON COLUMN ax_kanal.gewaesserkennzahl IS 'gewaesserkennzahl  CharacterString 0..1';
COMMENT ON COLUMN ax_kanal.identnummer IS 'identnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_kanal.schifffahrtskategorie IS 'schifffahrtskategorie enumeration AX_Schifffahrtskategorie_Kanal 0..1';
COMMENT ON COLUMN ax_kanal.zweitname IS 'zweitname  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_wasserlauf (
	name character varying,
	gewaesserkennzahl character varying,
	identnummer character varying,
	schifffahrtskategorie ax_schifffahrtskategorie,
	widmung ax_widmung_wasserlauf,
	zweitname character varying
) INHERITS (aa_zuso) WITH OIDS;

COMMENT ON TABLE ax_wasserlauf IS 'FeatureType: "AX_Wasserlauf"';
COMMENT ON COLUMN ax_wasserlauf.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_wasserlauf.gewaesserkennzahl IS 'gewaesserkennzahl  CharacterString 0..1';
COMMENT ON COLUMN ax_wasserlauf.identnummer IS 'identnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_wasserlauf.schifffahrtskategorie IS 'schifffahrtskategorie enumeration AX_Schifffahrtskategorie 0..1';
COMMENT ON COLUMN ax_wasserlauf.widmung IS 'widmung enumeration AX_Widmung_Wasserlauf 0..1';
COMMENT ON COLUMN ax_wasserlauf.zweitname IS 'zweitname  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_strasse (
	fahrbahntrennung ax_fahrbahntrennung_strasse,
	internationalebedeutung ax_internationalebedeutung_strasse,
	bezeichnung character varying[],
	name character varying,
	widmung ax_widmung_strasse NOT NULL,
	strassenschluessel character varying[],
	zweitname character varying
) INHERITS (aa_zuso) WITH OIDS;

COMMENT ON TABLE ax_strasse IS 'FeatureType: "AX_Strasse"';
COMMENT ON COLUMN ax_strasse.fahrbahntrennung IS 'fahrbahntrennung enumeration AX_Fahrbahntrennung_Strasse 0..1';
COMMENT ON COLUMN ax_strasse.internationalebedeutung IS 'internationaleBedeutung enumeration AX_InternationaleBedeutung_Strasse 0..1';
COMMENT ON COLUMN ax_strasse.bezeichnung IS 'bezeichnung  CharacterString 0..*';
COMMENT ON COLUMN ax_strasse.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_strasse.widmung IS 'widmung enumeration AX_Widmung_Strasse 1';
COMMENT ON COLUMN ax_strasse.strassenschluessel IS 'strassenschluessel  CharacterString 0..*';
COMMENT ON COLUMN ax_strasse.zweitname IS 'zweitname  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS aa_reo (
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[]
) INHERITS (aa_objekt) WITH OIDS;

COMMENT ON TABLE aa_reo IS 'FeatureType: "AA_REO"';
COMMENT ON COLUMN aa_reo.istabgeleitetaus IS 'Assoziation zu: FeatureType AA_REO (aa_reo) 0..*';
COMMENT ON COLUMN aa_reo.traegtbeizu IS 'Assoziation zu: FeatureType AA_REO (aa_reo) 0..*';
COMMENT ON COLUMN aa_reo.hatdirektunten IS 'Assoziation zu: FeatureType AA_REO (aa_reo) 0..*';
COMMENT ON COLUMN aa_reo.inverszu_hatdirektunten IS 'Assoziation zu: FeatureType AA_REO (aa_reo) 0..*';
CREATE TABLE IF NOT EXISTS au_objektmitunabhaengigergeometrie (

) INHERITS (aa_reo) WITH OIDS;

COMMENT ON TABLE au_objektmitunabhaengigergeometrie IS 'FeatureType: "AU_ObjektMitUnabhaengigerGeometrie"';
CREATE TABLE IF NOT EXISTS au_flaechenobjekt (
	position geometry NOT NULL
) INHERITS (au_objektmitunabhaengigergeometrie) WITH OIDS;

COMMENT ON TABLE au_flaechenobjekt IS 'FeatureType: "AU_Flaechenobjekt"';
COMMENT ON COLUMN au_flaechenobjekt.position IS 'position  GM_Object 1';
CREATE TABLE IF NOT EXISTS ap_fpo (
	signaturnummer character varying,
	darstellungsprioritaet integer,
	art character varying,
	dientzurdarstellungvon text[]
) INHERITS (au_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ap_fpo IS 'FeatureType: "AP_FPO"';
COMMENT ON COLUMN ap_fpo.signaturnummer IS 'signaturnummer  CharacterString 0..1';
COMMENT ON COLUMN ap_fpo.darstellungsprioritaet IS 'darstellungsprioritaet  Integer 0..1';
COMMENT ON COLUMN ap_fpo.art IS 'art  CharacterString 0..1';
COMMENT ON COLUMN ap_fpo.dientzurdarstellungvon IS 'Assoziation zu: FeatureType AA_Objekt (aa_objekt) 0..*';
CREATE TABLE IF NOT EXISTS aa_antragsgebiet (
	inverszu_gebiet text[]
) INHERITS (au_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE aa_antragsgebiet IS 'FeatureType: "AA_Antragsgebiet"';
COMMENT ON COLUMN aa_antragsgebiet.inverszu_gebiet IS 'Assoziation zu: FeatureType AA_Antrag (aa_antrag) 0..*';
CREATE TABLE IF NOT EXISTS ax_polder (
	qualitaetsangaben ax_dqmitdatenerhebung,
	name character varying,
	artdespolders ax_artdespolders,
	funktion ax_funktion_polder,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_polder IS 'FeatureType: "AX_Polder"';
COMMENT ON COLUMN ax_polder.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_polder.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_polder.artdespolders IS 'artDesPolders enumeration AX_ArtDesPolders 0..1';
COMMENT ON COLUMN ax_polder.funktion IS 'funktion enumeration AX_Funktion_Polder 0..1';
COMMENT ON COLUMN ax_polder.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_historischesflurstueck (
	gemarkung ax_gemarkung_schluessel NOT NULL,
	flurstuecksnummer ax_flurstuecksnummer NOT NULL,
	flurstueckskennzeichen character varying NOT NULL,
	nachfolgerflurstueckskennzeichen character varying[],
	buchung ax_buchung_historischesflurstueck[],
	zeitpunktderhistorisierung date,
	amtlicheflaeche double precision NOT NULL,
	flurnummer integer,
	flurstuecksfolge character varying,
	abweichenderrechtszustand boolean,
	zweifelhafterflurstuecksnachweis boolean,
	rechtsbehelfsverfahren boolean,
	objektkoordinaten geometry(POINT),
	sonstigeeigenschaften ax_sonstigeeigenschaften_flurstueck[],
	zeitpunktderentstehung date,
	gemeindezugehoerigkeit ax_gemeindekennzeichen
) INHERITS (au_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_historischesflurstueck IS 'FeatureType: "AX_HistorischesFlurstueck"';
COMMENT ON COLUMN ax_historischesflurstueck.gemarkung IS 'gemarkung DataType AX_Gemarkung_Schluessel 1';
COMMENT ON COLUMN ax_historischesflurstueck.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_historischesflurstueck.flurstueckskennzeichen IS 'flurstueckskennzeichen  CharacterString 1';
COMMENT ON COLUMN ax_historischesflurstueck.nachfolgerflurstueckskennzeichen IS 'nachfolgerFlurstueckskennzeichen  CharacterString 0..*';
COMMENT ON COLUMN ax_historischesflurstueck.buchung IS 'buchung DataType AX_Buchung_HistorischesFlurstueck 0..*';
COMMENT ON COLUMN ax_historischesflurstueck.zeitpunktderhistorisierung IS 'zeitpunktDerHistorisierung  Date 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.amtlicheflaeche IS 'amtlicheFlaeche  Area 1';
COMMENT ON COLUMN ax_historischesflurstueck.flurnummer IS 'flurnummer  Integer 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.flurstuecksfolge IS 'flurstuecksfolge  CharacterString 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.abweichenderrechtszustand IS 'abweichenderRechtszustand  Boolean 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.zweifelhafterflurstuecksnachweis IS 'zweifelhafterFlurstuecksnachweis  Boolean 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.rechtsbehelfsverfahren IS 'rechtsbehelfsverfahren  Boolean 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.objektkoordinaten IS 'objektkoordinaten  GM_Point 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.sonstigeeigenschaften IS 'sonstigeEigenschaften DataType AX_SonstigeEigenschaften_Flurstueck 0..*';
COMMENT ON COLUMN ax_historischesflurstueck.zeitpunktderentstehung IS 'zeitpunktDerEntstehung  Date 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.gemeindezugehoerigkeit IS 'gemeindezugehoerigkeit DataType AX_Gemeindekennzeichen 0..1';
CREATE TABLE IF NOT EXISTS ax_kondominium (

) INHERITS (au_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_kondominium IS 'FeatureType: "AX_Kondominium"';
CREATE TABLE IF NOT EXISTS ax_baublock (
	baublockbezeichnung character varying NOT NULL,
	art ax_art_baublock
) INHERITS (au_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_baublock IS 'FeatureType: "AX_Baublock"';
COMMENT ON COLUMN ax_baublock.baublockbezeichnung IS 'baublockbezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_baublock.art IS 'art enumeration AX_Art_Baublock 0..1';
CREATE TABLE IF NOT EXISTS ax_aussparungsflaeche (
	artderaussparung ax_artderaussparung NOT NULL
) INHERITS (au_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_aussparungsflaeche IS 'FeatureType: "AX_Aussparungsflaeche"';
COMMENT ON COLUMN ax_aussparungsflaeche.artderaussparung IS 'artDerAussparung enumeration AX_ArtDerAussparung 1';
CREATE TABLE IF NOT EXISTS ax_soll (
	name character varying,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (au_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_soll IS 'FeatureType: "AX_Soll"';
COMMENT ON COLUMN ax_soll.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_soll.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_duene (
	name character varying,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (au_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_duene IS 'FeatureType: "AX_Duene"';
COMMENT ON COLUMN ax_duene.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_duene.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS au_objekt (
	position geometry NOT NULL
) INHERITS (au_objektmitunabhaengigergeometrie) WITH OIDS;

COMMENT ON TABLE au_objekt IS 'FeatureType: "AU_Objekt"';
COMMENT ON COLUMN au_objekt.position IS 'position  GM_Object 1';
CREATE TABLE IF NOT EXISTS ax_transportanlage (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bauwerksfunktion ax_bauwerksfunktion_transportanlage NOT NULL,
	produkt ax_produkt_transportanlage,
	lagezurerdoberflaeche ax_lagezurerdoberflaeche_transportanlage,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_transportanlage IS 'FeatureType: "AX_Transportanlage"';
COMMENT ON COLUMN ax_transportanlage.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_transportanlage.bauwerksfunktion IS 'bauwerksfunktion enumeration AX_Bauwerksfunktion_Transportanlage 1';
COMMENT ON COLUMN ax_transportanlage.produkt IS 'produkt enumeration AX_Produkt_Transportanlage 0..1';
COMMENT ON COLUMN ax_transportanlage.lagezurerdoberflaeche IS 'lageZurErdoberflaeche enumeration AX_LageZurErdoberflaeche_Transportanlage 0..1';
COMMENT ON COLUMN ax_transportanlage.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_wegpfadsteig (
	qualitaetsangaben ax_dqmitdatenerhebung,
	art ax_art_wegpfadsteig,
	name character varying,
	markierung ax_markierung_wegpfadsteig,
	zweitname character varying,
	befestigung ax_befestigung_wegpfadsteig,
	breitedesverkehrsweges integer,
	bezeichnung character varying,
	strassenschluessel character varying,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_wegpfadsteig IS 'FeatureType: "AX_WegPfadSteig"';
COMMENT ON COLUMN ax_wegpfadsteig.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_wegpfadsteig.art IS 'art enumeration AX_Art_WegPfadSteig 0..1';
COMMENT ON COLUMN ax_wegpfadsteig.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_wegpfadsteig.markierung IS 'markierung enumeration AX_Markierung_WegPfadSteig 0..1';
COMMENT ON COLUMN ax_wegpfadsteig.zweitname IS 'zweitname  CharacterString 0..1';
COMMENT ON COLUMN ax_wegpfadsteig.befestigung IS 'befestigung enumeration AX_Befestigung_WegPfadSteig 0..1';
COMMENT ON COLUMN ax_wegpfadsteig.breitedesverkehrsweges IS 'breiteDesVerkehrsweges  Integer 0..1';
COMMENT ON COLUMN ax_wegpfadsteig.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_wegpfadsteig.strassenschluessel IS 'strassenschluessel  CharacterString 0..1';
COMMENT ON COLUMN ax_wegpfadsteig.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_gleis (
	qualitaetsangaben ax_dqmitdatenerhebung,
	art ax_art_gleis,
	bahnkategorie ax_bahnkategorie_gleis[],
	lagezuroberflaeche ax_lagezuroberflaeche_gleis,
	name character varying,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_gleis IS 'FeatureType: "AX_Gleis"';
COMMENT ON COLUMN ax_gleis.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_gleis.art IS 'art enumeration AX_Art_Gleis 0..1';
COMMENT ON COLUMN ax_gleis.bahnkategorie IS 'bahnkategorie enumeration AX_Bahnkategorie_Gleis 0..*';
COMMENT ON COLUMN ax_gleis.lagezuroberflaeche IS 'lageZurOberflaeche enumeration AX_LageZurOberflaeche_Gleis 0..1';
COMMENT ON COLUMN ax_gleis.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_gleis.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_bahnverkehrsanlage (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bahnhofskategorie ax_bahnhofskategorie_bahnverkehrsanlage NOT NULL,
	name character varying,
	bezeichnung character varying,
	zustand ax_zustand_bahnverkehrsanlage,
	bahnkategorie ax_bahnkategorie_gleis[],
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_bahnverkehrsanlage IS 'FeatureType: "AX_Bahnverkehrsanlage"';
COMMENT ON COLUMN ax_bahnverkehrsanlage.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.bahnhofskategorie IS 'bahnhofskategorie enumeration AX_Bahnhofskategorie_Bahnverkehrsanlage 1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.zustand IS 'zustand enumeration AX_Zustand_Bahnverkehrsanlage 0..1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.bahnkategorie IS 'bahnkategorie enumeration AX_Bahnkategorie_Gleis 0..*';
COMMENT ON COLUMN ax_bahnverkehrsanlage.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_strassenverkehrsanlage (
	qualitaetsangaben ax_dqmitdatenerhebung,
	art ax_art_strassenverkehrsanlage NOT NULL,
	bezeichnung character varying[],
	name character varying,
	strassenschluessel character varying,
	zweitname character varying,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_strassenverkehrsanlage IS 'FeatureType: "AX_Strassenverkehrsanlage"';
COMMENT ON COLUMN ax_strassenverkehrsanlage.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.art IS 'art enumeration AX_Art_Strassenverkehrsanlage 1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.bezeichnung IS 'bezeichnung  CharacterString 0..*';
COMMENT ON COLUMN ax_strassenverkehrsanlage.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.strassenschluessel IS 'strassenschluessel  CharacterString 0..1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.zweitname IS 'zweitname  CharacterString 0..1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_einrichtungenfuerdenschiffsverkehr (
	qualitaetsangaben ax_dqmitdatenerhebung,
	art ax_art_einrichtungenfuerdenschiffsverkehr NOT NULL,
	bezeichnung character varying,
	kilometerangabe double precision,
	name character varying,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_einrichtungenfuerdenschiffsverkehr IS 'FeatureType: "AX_EinrichtungenFuerDenSchiffsverkehr"';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.art IS 'art enumeration AX_Art_EinrichtungenFuerDenSchiffsverkehr 1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.kilometerangabe IS 'kilometerangabe  Distance 0..1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_flugverkehrsanlage (
	qualitaetsangaben ax_dqmitdatenerhebung,
	art ax_art_flugverkehrsanlage NOT NULL,
	oberflaechenmaterial ax_oberflaechenmaterial_flugverkehrsanlage,
	name character varying,
	breitedesobjekts double precision,
	bezeichnung character varying,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_flugverkehrsanlage IS 'FeatureType: "AX_Flugverkehrsanlage"';
COMMENT ON COLUMN ax_flugverkehrsanlage.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_flugverkehrsanlage.art IS 'art enumeration AX_Art_Flugverkehrsanlage 1';
COMMENT ON COLUMN ax_flugverkehrsanlage.oberflaechenmaterial IS 'oberflaechenmaterial enumeration AX_Oberflaechenmaterial_Flugverkehrsanlage 0..1';
COMMENT ON COLUMN ax_flugverkehrsanlage.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_flugverkehrsanlage.breitedesobjekts IS 'breiteDesObjekts  Length 0..1';
COMMENT ON COLUMN ax_flugverkehrsanlage.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_flugverkehrsanlage.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_hafen (
	qualitaetsangaben ax_dqmitdatenerhebung,
	hafenkategorie ax_hafenkategorie_hafen,
	name character varying,
	nutzung ax_nutzung_hafen,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_hafen IS 'FeatureType: "AX_Hafen"';
COMMENT ON COLUMN ax_hafen.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_hafen.hafenkategorie IS 'hafenkategorie enumeration AX_Hafenkategorie_Hafen 0..1';
COMMENT ON COLUMN ax_hafen.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_hafen.nutzung IS 'nutzung enumeration AX_Nutzung_Hafen 0..1';
COMMENT ON COLUMN ax_hafen.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_testgelaende (
	qualitaetsangaben ax_dqmitdatenerhebung,
	name character varying,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_testgelaende IS 'FeatureType: "AX_Testgelaende"';
COMMENT ON COLUMN ax_testgelaende.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_testgelaende.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_testgelaende.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_schleuse (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bezeichnung character varying,
	konstruktionsmerkmalbauart ax_konstruktionsmerkmalbauart_schleuse,
	name character varying,
	zustand ax_zustand_schleuse,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_schleuse IS 'FeatureType: "AX_Schleuse"';
COMMENT ON COLUMN ax_schleuse.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_schleuse.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_schleuse.konstruktionsmerkmalbauart IS 'konstruktionsmerkmalBauart enumeration AX_KonstruktionsmerkmalBauart_Schleuse 0..1';
COMMENT ON COLUMN ax_schleuse.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_schleuse.zustand IS 'zustand enumeration AX_Zustand_Schleuse 0..1';
COMMENT ON COLUMN ax_schleuse.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_ortslage (
	qualitaetsangaben ax_dqmitdatenerhebung,
	name character varying,
	zweitname character varying,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_ortslage IS 'FeatureType: "AX_Ortslage"';
COMMENT ON COLUMN ax_ortslage.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_ortslage.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_ortslage.zweitname IS 'zweitname  CharacterString 0..1';
COMMENT ON COLUMN ax_ortslage.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_grenzuebergang (
	qualitaetsangaben ax_dqmitdatenerhebung,
	name character varying,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_grenzuebergang IS 'FeatureType: "AX_Grenzuebergang"';
COMMENT ON COLUMN ax_grenzuebergang.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_grenzuebergang.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_grenzuebergang.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_gewaessermerkmal (
	qualitaetsangaben ax_dqmitdatenerhebung,
	art ax_art_gewaessermerkmal NOT NULL,
	name character varying,
	bezeichnung character varying,
	objekthoehe double precision,
	hydrologischesmerkmal ax_hydrologischesmerkmal_gewaessermerkmal,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_gewaessermerkmal IS 'FeatureType: "AX_Gewaessermerkmal"';
COMMENT ON COLUMN ax_gewaessermerkmal.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_gewaessermerkmal.art IS 'art enumeration AX_Art_Gewaessermerkmal 1';
COMMENT ON COLUMN ax_gewaessermerkmal.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_gewaessermerkmal.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_gewaessermerkmal.objekthoehe IS 'objekthoehe  Length 0..1';
COMMENT ON COLUMN ax_gewaessermerkmal.hydrologischesmerkmal IS 'hydrologischesMerkmal enumeration AX_HydrologischesMerkmal_Gewaessermerkmal 0..1';
COMMENT ON COLUMN ax_gewaessermerkmal.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_untergeordnetesgewaesser (
	qualitaetsangaben ax_dqmitdatenerhebung,
	name character varying,
	funktion ax_funktion_untergeordnetesgewaesser,
	lagezurerdoberflaeche ax_lagezurerdoberflaeche_untergeordnetesgewaesser,
	hydrologischesmerkmal ax_hydrologischesmerkmal_untergeordnetesgewaesser,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_untergeordnetesgewaesser IS 'FeatureType: "AX_UntergeordnetesGewaesser"';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.funktion IS 'funktion enumeration AX_Funktion_UntergeordnetesGewaesser 0..1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.lagezurerdoberflaeche IS 'lageZurErdoberflaeche enumeration AX_LageZurErdoberflaeche_UntergeordnetesGewaesser 0..1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.hydrologischesmerkmal IS 'hydrologischesMerkmal enumeration AX_HydrologischesMerkmal_UntergeordnetesGewaesser 0..1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_vegetationsmerkmal (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bewuchs ax_bewuchs_vegetationsmerkmal,
	name character varying,
	bezeichnung character varying,
	zustand ax_zustand_vegetationsmerkmal,
	breitedesobjekts double precision,
	funktion ax_funktion_vegetationsmerkmal,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_vegetationsmerkmal IS 'FeatureType: "AX_Vegetationsmerkmal"';
COMMENT ON COLUMN ax_vegetationsmerkmal.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_vegetationsmerkmal.bewuchs IS 'bewuchs enumeration AX_Bewuchs_Vegetationsmerkmal 0..1';
COMMENT ON COLUMN ax_vegetationsmerkmal.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_vegetationsmerkmal.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_vegetationsmerkmal.zustand IS 'zustand enumeration AX_Zustand_Vegetationsmerkmal 0..1';
COMMENT ON COLUMN ax_vegetationsmerkmal.breitedesobjekts IS 'breiteDesObjekts  Length 0..1';
COMMENT ON COLUMN ax_vegetationsmerkmal.funktion IS 'funktion enumeration AX_Funktion_Vegetationsmerkmal 0..1';
COMMENT ON COLUMN ax_vegetationsmerkmal.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_musterlandesmusterundvergleichsstueck (
	merkmal ax_merkmal_musterlandesmusterundvergleichsstueck NOT NULL,
	nummer character varying,
	kulturart ax_kulturart_musterlandesmusterundvergleichsstueck,
	bodenart ax_bodenart_musterlandesmusterundvergleichsstueck,
	zustandsstufeoderbodenstufe ax_zustandsstufeoderbodenstufe_musterlandesmusterundvergle,
	entstehungsartoderklimastufewasserverhaeltnisse ax_entstehungsartoderklimastufewasserverhaeltnisse_musterl[],
	bodenzahlodergruenlandgrundzahl character varying,
	ackerzahlodergruenlandzahl character varying,
	sonstigeangaben ax_sonstigeangaben_musterlandesmusterundvergleichsstueck[],
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_musterlandesmusterundvergleichsstueck IS 'FeatureType: "AX_MusterLandesmusterUndVergleichsstueck"';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.merkmal IS 'merkmal enumeration AX_Merkmal_MusterLandesmusterUndVergleichsstueck 1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.nummer IS 'nummer  CharacterString 0..1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.kulturart IS 'kulturart enumeration AX_Kulturart_MusterLandesmusterUndVergleichsstueck 0..1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.bodenart IS 'bodenart enumeration AX_Bodenart_MusterLandesmusterUndVergleichsstueck 0..1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.zustandsstufeoderbodenstufe IS 'zustandsstufeOderBodenstufe enumeration AX_ZustandsstufeOderBodenstufe_MusterLandesmusterUndVergleichsstueck 0..1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.entstehungsartoderklimastufewasserverhaeltnisse IS 'entstehungsartOderKlimastufeWasserverhaeltnisse enumeration AX_EntstehungsartOderKlimastufeWasserverhaeltnisse_MusterLandesmusterUndVergleichsstueck 0..*';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.bodenzahlodergruenlandgrundzahl IS 'bodenzahlOderGruenlandgrundzahl  CharacterString 0..1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.ackerzahlodergruenlandzahl IS 'ackerzahlOderGruenlandzahl  CharacterString 0..1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.sonstigeangaben IS 'sonstigeAngaben enumeration AX_SonstigeAngaben_MusterLandesmusterUndVergleichsstueck 0..*';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_insel (
	name character varying
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_insel IS 'FeatureType: "AX_Insel"';
COMMENT ON COLUMN ax_insel.name IS 'name  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_gewann (
	name character varying NOT NULL
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_gewann IS 'FeatureType: "AX_Gewann"';
COMMENT ON COLUMN ax_gewann.name IS 'name  CharacterString 1';
CREATE TABLE IF NOT EXISTS ax_kleinraeumigerlandschaftsteil (
	landschaftstyp ax_landschaftstyp NOT NULL,
	name character varying NOT NULL
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_kleinraeumigerlandschaftsteil IS 'FeatureType: "AX_KleinraeumigerLandschaftsteil"';
COMMENT ON COLUMN ax_kleinraeumigerlandschaftsteil.landschaftstyp IS 'landschaftstyp enumeration AX_Landschaftstyp 1';
COMMENT ON COLUMN ax_kleinraeumigerlandschaftsteil.name IS 'name  CharacterString 1';
CREATE TABLE IF NOT EXISTS ax_landschaft (
	landschaftstyp ax_landschaftstyp NOT NULL,
	name character varying NOT NULL
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_landschaft IS 'FeatureType: "AX_Landschaft"';
COMMENT ON COLUMN ax_landschaft.landschaftstyp IS 'landschaftstyp enumeration AX_Landschaftstyp 1';
COMMENT ON COLUMN ax_landschaft.name IS 'name  CharacterString 1';
CREATE TABLE IF NOT EXISTS ax_felsenfelsblockfelsnadel (
	objekthoehe double precision,
	name character varying,
	bezeichnung character varying,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (au_objekt) WITH OIDS;

COMMENT ON TABLE ax_felsenfelsblockfelsnadel IS 'FeatureType: "AX_FelsenFelsblockFelsnadel"';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.objekthoehe IS 'objekthoehe  Length 0..1';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS au_kontinuierlicheslinienobjekt (
	position geometry(LINESTRING) NOT NULL
) INHERITS (au_objektmitunabhaengigergeometrie) WITH OIDS;

COMMENT ON TABLE au_kontinuierlicheslinienobjekt IS 'FeatureType: "AU_KontinuierlichesLinienobjekt"';
COMMENT ON COLUMN au_kontinuierlicheslinienobjekt.position IS 'position  GM_Curve 1';
CREATE TABLE IF NOT EXISTS ap_lto (
	schriftinhalt character varying,
	fontsperrung double precision NOT NULL,
	skalierung double precision NOT NULL,
	horizontaleausrichtung ap_horizontaleausrichtung NOT NULL,
	vertikaleausrichtung ap_vertikaleausrichtung NOT NULL,
	signaturnummer character varying,
	darstellungsprioritaet integer,
	art character varying,
	dientzurdarstellungvon text[],
	hat text
) INHERITS (au_kontinuierlicheslinienobjekt) WITH OIDS;

COMMENT ON TABLE ap_lto IS 'FeatureType: "AP_LTO"';
COMMENT ON COLUMN ap_lto.schriftinhalt IS 'schriftinhalt  CharacterString 0..1';
COMMENT ON COLUMN ap_lto.fontsperrung IS 'fontSperrung  Real 1';
COMMENT ON COLUMN ap_lto.skalierung IS 'skalierung  Real 1';
COMMENT ON COLUMN ap_lto.horizontaleausrichtung IS 'horizontaleAusrichtung enumeration AP_HorizontaleAusrichtung 1';
COMMENT ON COLUMN ap_lto.vertikaleausrichtung IS 'vertikaleAusrichtung enumeration AP_VertikaleAusrichtung 1';
COMMENT ON COLUMN ap_lto.signaturnummer IS 'signaturnummer  CharacterString 0..1';
COMMENT ON COLUMN ap_lto.darstellungsprioritaet IS 'darstellungsprioritaet  Integer 0..1';
COMMENT ON COLUMN ap_lto.art IS 'art  CharacterString 0..1';
COMMENT ON COLUMN ap_lto.dientzurdarstellungvon IS 'Assoziation zu: FeatureType AA_Objekt (aa_objekt) 0..*';
COMMENT ON COLUMN ap_lto.hat IS 'Assoziation zu: FeatureType AP_LPO (ap_lpo) 0..1';
CREATE TABLE IF NOT EXISTS ax_leitung (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bauwerksfunktion ax_bauwerksfunktion_leitung NOT NULL,
	spannungsebene integer,
	name character varying,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_kontinuierlicheslinienobjekt) WITH OIDS;

COMMENT ON TABLE ax_leitung IS 'FeatureType: "AX_Leitung"';
COMMENT ON COLUMN ax_leitung.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_leitung.bauwerksfunktion IS 'bauwerksfunktion enumeration AX_Bauwerksfunktion_Leitung 1';
COMMENT ON COLUMN ax_leitung.spannungsebene IS 'spannungsebene  Integer 0..1';
COMMENT ON COLUMN ax_leitung.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_leitung.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_abschnitt (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bezeichnung character varying NOT NULL,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_kontinuierlicheslinienobjekt) WITH OIDS;

COMMENT ON TABLE ax_abschnitt IS 'FeatureType: "AX_Abschnitt"';
COMMENT ON COLUMN ax_abschnitt.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_abschnitt.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_abschnitt.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_ast (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bezeichnung character varying NOT NULL,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_kontinuierlicheslinienobjekt) WITH OIDS;

COMMENT ON TABLE ax_ast IS 'FeatureType: "AX_Ast"';
COMMENT ON COLUMN ax_ast.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_ast.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_ast.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS au_linienobjekt (
	position geometry(MULTILINESTRING) NOT NULL
) INHERITS (au_objektmitunabhaengigergeometrie) WITH OIDS;

COMMENT ON TABLE au_linienobjekt IS 'FeatureType: "AU_Linienobjekt"';
COMMENT ON COLUMN au_linienobjekt.position IS 'position  GM_MultiCurve 1';
CREATE TABLE IF NOT EXISTS ap_lpo (
	signaturnummer character varying,
	darstellungsprioritaet integer,
	art character varying,
	dientzurdarstellungvon text[],
	inverszu_hat_ap_lto text,
	inverszu_hat_ap_pto text
) INHERITS (au_linienobjekt) WITH OIDS;

COMMENT ON TABLE ap_lpo IS 'FeatureType: "AP_LPO"';
COMMENT ON COLUMN ap_lpo.signaturnummer IS 'signaturnummer  CharacterString 0..1';
COMMENT ON COLUMN ap_lpo.darstellungsprioritaet IS 'darstellungsprioritaet  Integer 0..1';
COMMENT ON COLUMN ap_lpo.art IS 'art  CharacterString 0..1';
COMMENT ON COLUMN ap_lpo.dientzurdarstellungvon IS 'Assoziation zu: FeatureType AA_Objekt (aa_objekt) 0..*';
COMMENT ON COLUMN ap_lpo.inverszu_hat_ap_lto IS 'Assoziation zu: FeatureType AP_LTO (ap_lto) 0..1';
COMMENT ON COLUMN ap_lpo.inverszu_hat_ap_pto IS 'Assoziation zu: FeatureType AP_PTO (ap_pto) 0..1';
CREATE TABLE IF NOT EXISTS ax_seilbahnschwebebahn (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bahnkategorie ax_bahnkategorie_seilbahnschwebebahn NOT NULL,
	name character varying,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_linienobjekt) WITH OIDS;

COMMENT ON TABLE ax_seilbahnschwebebahn IS 'FeatureType: "AX_SeilbahnSchwebebahn"';
COMMENT ON COLUMN ax_seilbahnschwebebahn.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_seilbahnschwebebahn.bahnkategorie IS 'bahnkategorie enumeration AX_Bahnkategorie_SeilbahnSchwebebahn 1';
COMMENT ON COLUMN ax_seilbahnschwebebahn.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_seilbahnschwebebahn.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_gebaeudeausgestaltung (
	darstellung ax_darstellung_gebaeudeausgestaltung NOT NULL,
	zeigtauf text NOT NULL
) INHERITS (au_linienobjekt) WITH OIDS;

COMMENT ON TABLE ax_gebaeudeausgestaltung IS 'FeatureType: "AX_Gebaeudeausgestaltung"';
COMMENT ON COLUMN ax_gebaeudeausgestaltung.darstellung IS 'darstellung enumeration AX_Darstellung_Gebaeudeausgestaltung 1';
COMMENT ON COLUMN ax_gebaeudeausgestaltung.zeigtauf IS 'Assoziation zu: FeatureType AX_Gebaeude (ax_gebaeude) 1';
CREATE TABLE IF NOT EXISTS ax_topographischelinie (
	liniendarstellung ax_liniendarstellung_topographischelinie NOT NULL,
	sonstigeeigenschaft character varying
) INHERITS (au_linienobjekt) WITH OIDS;

COMMENT ON TABLE ax_topographischelinie IS 'FeatureType: "AX_TopographischeLinie"';
COMMENT ON COLUMN ax_topographischelinie.liniendarstellung IS 'liniendarstellung enumeration AX_Liniendarstellung_TopographischeLinie 1';
COMMENT ON COLUMN ax_topographischelinie.sonstigeeigenschaft IS 'sonstigeEigenschaft  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_geripplinie (
	artdergeripplinie ax_artdergeripplinie,
	erfassung ax_erfassung_dgm NOT NULL,
	hoehengenauigkeit text
) INHERITS (au_linienobjekt) WITH OIDS;

COMMENT ON TABLE ax_geripplinie IS 'FeatureType: "AX_Geripplinie"';
COMMENT ON COLUMN ax_geripplinie.artdergeripplinie IS 'artDerGeripplinie enumeration AX_ArtDerGeripplinie 0..1';
COMMENT ON COLUMN ax_geripplinie.erfassung IS 'erfassung DataType AX_Erfassung_DGM 1';
COMMENT ON COLUMN ax_geripplinie.hoehengenauigkeit IS 'hoehengenauigkeit  DQ_AbsoluteExternalPositionalAccuracy 0..1';
CREATE TABLE IF NOT EXISTS ax_gewaesserbegrenzung (
	besondereartdergewaesserbegrenzung ax_besondereartdergewaesserbegrenzung,
	ursprung ax_ursprung,
	erfassunggewaesserbegrenzung ax_erfassunggewaesserbegrenzung NOT NULL,
	hoehengenauigkeit text
) INHERITS (au_linienobjekt) WITH OIDS;

COMMENT ON TABLE ax_gewaesserbegrenzung IS 'FeatureType: "AX_Gewaesserbegrenzung"';
COMMENT ON COLUMN ax_gewaesserbegrenzung.besondereartdergewaesserbegrenzung IS 'besondereArtDerGewaesserbegrenzung enumeration AX_BesondereArtDerGewaesserbegrenzung 0..1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.ursprung IS 'ursprung enumeration AX_Ursprung 0..1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.erfassunggewaesserbegrenzung IS 'erfassungGewaesserbegrenzung DataType AX_ErfassungGewaesserbegrenzung 1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.hoehengenauigkeit IS 'hoehengenauigkeit  DQ_AbsoluteExternalPositionalAccuracy 0..1';
CREATE TABLE IF NOT EXISTS ax_strukturierterfasstegelaendepunkte (
	artderstrukturierung ax_artderstrukturierung NOT NULL,
	erfassungstrukturiertegelaendepunkte ax_erfassungstrukturiertegelaendepunkte NOT NULL,
	aktualisierungsdatum date,
	hoehengenauigkeit text,
	punktabstand double precision
) INHERITS (au_linienobjekt) WITH OIDS;

COMMENT ON TABLE ax_strukturierterfasstegelaendepunkte IS 'FeatureType: "AX_StrukturiertErfassteGelaendepunkte"';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.artderstrukturierung IS 'artDerStrukturierung enumeration AX_ArtDerStrukturierung 1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.erfassungstrukturiertegelaendepunkte IS 'erfassungStrukturierteGelaendepunkte DataType AX_ErfassungStrukturierteGelaendepunkte 1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.aktualisierungsdatum IS 'aktualisierungsdatum  Date 0..1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.hoehengenauigkeit IS 'hoehengenauigkeit  DQ_AbsoluteExternalPositionalAccuracy 0..1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.punktabstand IS 'punktabstand  Length 0..1';
CREATE TABLE IF NOT EXISTS ax_einschnitt (
	funktion ax_funktion_einschnitt,
	tiefevoneinschnitt double precision
) INHERITS (au_linienobjekt) WITH OIDS;

COMMENT ON TABLE ax_einschnitt IS 'FeatureType: "AX_Einschnitt"';
COMMENT ON COLUMN ax_einschnitt.funktion IS 'funktion enumeration AX_Funktion_Einschnitt 0..1';
COMMENT ON COLUMN ax_einschnitt.tiefevoneinschnitt IS 'tiefeVonEinschnitt  Length 0..1';
CREATE TABLE IF NOT EXISTS ax_hoehenlinie (
	hoehevonhoehenlinie double precision NOT NULL,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (au_linienobjekt) WITH OIDS;

COMMENT ON TABLE ax_hoehenlinie IS 'FeatureType: "AX_Hoehenlinie"';
COMMENT ON COLUMN ax_hoehenlinie.hoehevonhoehenlinie IS 'hoeheVonHoehenlinie  Length 1';
COMMENT ON COLUMN ax_hoehenlinie.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_abgeleitetehoehenlinie (
	hoehe double precision NOT NULL,
	aktualitaetsstand date NOT NULL,
	berechnungsdatum date NOT NULL,
	berechnungsmethodehoehenlinie ax_berechnungsmethodehoehenlinie NOT NULL,
	verwendeteobjekte ax_verwendeteobjekte[]
) INHERITS (au_linienobjekt) WITH OIDS;

COMMENT ON TABLE ax_abgeleitetehoehenlinie IS 'FeatureType: "AX_AbgeleiteteHoehenlinie"';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.hoehe IS 'hoehe  Length 1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.aktualitaetsstand IS 'aktualitaetsstand  Date 1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.berechnungsdatum IS 'berechnungsdatum  Date 1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.berechnungsmethodehoehenlinie IS 'berechnungsmethodeHoehenlinie enumeration AX_BerechnungsmethodeHoehenlinie 1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.verwendeteobjekte IS 'verwendeteObjekte enumeration AX_VerwendeteObjekte 0..*';
CREATE TABLE IF NOT EXISTS au_punktobjekt (
	position geometry(POINT) NOT NULL
) INHERITS (au_objektmitunabhaengigergeometrie) WITH OIDS;

COMMENT ON TABLE au_punktobjekt IS 'FeatureType: "AU_Punktobjekt"';
COMMENT ON COLUMN au_punktobjekt.position IS 'position  GM_Point 1';
CREATE TABLE IF NOT EXISTS ap_pto (
	drehwinkel double precision,
	schriftinhalt character varying,
	fontsperrung double precision NOT NULL,
	skalierung double precision NOT NULL,
	horizontaleausrichtung ap_horizontaleausrichtung NOT NULL,
	vertikaleausrichtung ap_vertikaleausrichtung NOT NULL,
	signaturnummer character varying,
	darstellungsprioritaet integer,
	art character varying,
	dientzurdarstellungvon text[],
	hat text
) INHERITS (au_punktobjekt) WITH OIDS;

COMMENT ON TABLE ap_pto IS 'FeatureType: "AP_PTO"';
COMMENT ON COLUMN ap_pto.drehwinkel IS 'drehwinkel  Angle 0..1';
COMMENT ON COLUMN ap_pto.schriftinhalt IS 'schriftinhalt  CharacterString 0..1';
COMMENT ON COLUMN ap_pto.fontsperrung IS 'fontSperrung  Real 1';
COMMENT ON COLUMN ap_pto.skalierung IS 'skalierung  Real 1';
COMMENT ON COLUMN ap_pto.horizontaleausrichtung IS 'horizontaleAusrichtung enumeration AP_HorizontaleAusrichtung 1';
COMMENT ON COLUMN ap_pto.vertikaleausrichtung IS 'vertikaleAusrichtung enumeration AP_VertikaleAusrichtung 1';
COMMENT ON COLUMN ap_pto.signaturnummer IS 'signaturnummer  CharacterString 0..1';
COMMENT ON COLUMN ap_pto.darstellungsprioritaet IS 'darstellungsprioritaet  Integer 0..1';
COMMENT ON COLUMN ap_pto.art IS 'art  CharacterString 0..1';
COMMENT ON COLUMN ap_pto.dientzurdarstellungvon IS 'Assoziation zu: FeatureType AA_Objekt (aa_objekt) 0..*';
COMMENT ON COLUMN ap_pto.hat IS 'Assoziation zu: FeatureType AP_LPO (ap_lpo) 0..1';
CREATE TABLE IF NOT EXISTS ax_heilquellegasquelle (
	qualitaetsangaben ax_dqmitdatenerhebung,
	art ax_art_heilquellegasquelle NOT NULL,
	hydrologischesmerkmal ax_hydrologischesmerkmal_heilquellegasquelle,
	name character varying,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_punktobjekt) WITH OIDS;

COMMENT ON TABLE ax_heilquellegasquelle IS 'FeatureType: "AX_HeilquelleGasquelle"';
COMMENT ON COLUMN ax_heilquellegasquelle.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_heilquellegasquelle.art IS 'art enumeration AX_Art_HeilquelleGasquelle 1';
COMMENT ON COLUMN ax_heilquellegasquelle.hydrologischesmerkmal IS 'hydrologischesMerkmal enumeration AX_HydrologischesMerkmal_HeilquelleGasquelle 0..1';
COMMENT ON COLUMN ax_heilquellegasquelle.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_heilquellegasquelle.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_wasserspiegelhoehe (
	qualitaetsangaben ax_dqmitdatenerhebung,
	hoehedeswasserspiegels double precision NOT NULL,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_punktobjekt) WITH OIDS;

COMMENT ON TABLE ax_wasserspiegelhoehe IS 'FeatureType: "AX_Wasserspiegelhoehe"';
COMMENT ON COLUMN ax_wasserspiegelhoehe.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_wasserspiegelhoehe.hoehedeswasserspiegels IS 'hoeheDesWasserspiegels  Length 1';
COMMENT ON COLUMN ax_wasserspiegelhoehe.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_nullpunkt (
	qualitaetsangaben ax_dqmitdatenerhebung,
	artdesnullpunktes ax_artdesnullpunktes_nullpunkt NOT NULL,
	bezeichnung character varying NOT NULL,
	inverszu_gehoertzubauwerk text[]
) INHERITS (au_punktobjekt) WITH OIDS;

COMMENT ON TABLE ax_nullpunkt IS 'FeatureType: "AX_Nullpunkt"';
COMMENT ON COLUMN ax_nullpunkt.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_nullpunkt.artdesnullpunktes IS 'artDesNullpunktes enumeration AX_ArtDesNullpunktes_Nullpunkt 1';
COMMENT ON COLUMN ax_nullpunkt.bezeichnung IS 'bezeichnung  CharacterString 1';
COMMENT ON COLUMN ax_nullpunkt.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_punktortau (
	kartendarstellung boolean,
	koordinatenstatus ax_koordinatenstatus_punktort,
	ueberpruefungsdatum date,
	hinweise character varying,
	qualitaetsangaben ax_dqpunktort
) INHERITS (au_punktobjekt) WITH OIDS;

COMMENT ON TABLE ax_punktortau IS 'FeatureType: "AX_PunktortAU"';
COMMENT ON COLUMN ax_punktortau.kartendarstellung IS 'kartendarstellung  Boolean 0..1';
COMMENT ON COLUMN ax_punktortau.koordinatenstatus IS 'koordinatenstatus enumeration AX_Koordinatenstatus_Punktort 0..1';
COMMENT ON COLUMN ax_punktortau.ueberpruefungsdatum IS 'ueberpruefungsdatum  Date 0..1';
COMMENT ON COLUMN ax_punktortau.hinweise IS 'hinweise  CharacterString 0..1';
COMMENT ON COLUMN ax_punktortau.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQPunktort 0..1';
CREATE TABLE IF NOT EXISTS ax_georeferenziertegebaeudeadresse (
	datensatznummer character varying,
	qualitaetsangaben ax_qualitaet_hauskoordinate NOT NULL,
	land character varying NOT NULL,
	regierungsbezirk character varying NOT NULL,
	kreis character varying NOT NULL,
	gemeinde character varying NOT NULL,
	ortsteil character varying NOT NULL,
	strassenschluessel character varying NOT NULL,
	hausnummer character varying NOT NULL,
	adressierungszusatz character varying,
	postalischeadresse ax_post,
	hatauch text NOT NULL
) INHERITS (au_punktobjekt) WITH OIDS;

COMMENT ON TABLE ax_georeferenziertegebaeudeadresse IS 'FeatureType: "AX_GeoreferenzierteGebaeudeadresse"';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.datensatznummer IS 'datensatznummer  CharacterString 0..1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.qualitaetsangaben IS 'qualitaetsangaben enumeration AX_Qualitaet_Hauskoordinate 1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.land IS 'land  CharacterString 1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.regierungsbezirk IS 'regierungsbezirk  CharacterString 1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.kreis IS 'kreis  CharacterString 1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.gemeinde IS 'gemeinde  CharacterString 1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.ortsteil IS 'ortsteil  CharacterString 1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.strassenschluessel IS 'strassenschluessel  CharacterString 1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.hausnummer IS 'hausnummer  CharacterString 1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.adressierungszusatz IS 'adressierungszusatz  CharacterString 0..1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.postalischeadresse IS 'postalischeAdresse DataType AX_Post 0..1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.hatauch IS 'Assoziation zu: FeatureType AX_LagebezeichnungMitHausnummer (ax_lagebezeichnungmithausnummer) 1';
CREATE TABLE IF NOT EXISTS ax_grablochderbodenschaetzung (
	bedeutung ax_bedeutung_grablochderbodenschaetzung[] NOT NULL,
	ingemarkung ax_gemarkung_schluessel,
	kennziffer ax_kennziffergrabloch NOT NULL,
	bodenzahlodergruenlandgrundzahl character varying,
	qualitaetsangaben ax_dqmitdatenerhebung,
	gehoertzu text
) INHERITS (au_punktobjekt) WITH OIDS;

COMMENT ON TABLE ax_grablochderbodenschaetzung IS 'FeatureType: "AX_GrablochDerBodenschaetzung"';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.bedeutung IS 'bedeutung enumeration AX_Bedeutung_GrablochDerBodenschaetzung 1..*';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.ingemarkung IS 'inGemarkung DataType AX_Gemarkung_Schluessel 0..1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.kennziffer IS 'kennziffer DataType AX_KennzifferGrabloch 1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.bodenzahlodergruenlandgrundzahl IS 'bodenzahlOderGruenlandgrundzahl  CharacterString 0..1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.gehoertzu IS 'Assoziation zu: FeatureType AX_Tagesabschnitt (ax_tagesabschnitt) 0..1';
CREATE TABLE IF NOT EXISTS ax_wohnplatz (
	bezeichnung character varying[],
	name character varying NOT NULL,
	zweitname character varying,
	einwohnerzahl character varying
) INHERITS (au_punktobjekt) WITH OIDS;

COMMENT ON TABLE ax_wohnplatz IS 'FeatureType: "AX_Wohnplatz"';
COMMENT ON COLUMN ax_wohnplatz.bezeichnung IS 'bezeichnung  CharacterString 0..*';
COMMENT ON COLUMN ax_wohnplatz.name IS 'name  CharacterString 1';
COMMENT ON COLUMN ax_wohnplatz.zweitname IS 'zweitname  CharacterString 0..1';
COMMENT ON COLUMN ax_wohnplatz.einwohnerzahl IS 'einwohnerzahl  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_markantergelaendepunkt (
	artdesmarkantenpunktes ax_artdesmarkantengelaendepunktes,
	erfassungmarkantergelaendepunkt ax_erfassungmarkantergelaendepunkt NOT NULL,
	hoehengenauigkeit text
) INHERITS (au_punktobjekt) WITH OIDS;

COMMENT ON TABLE ax_markantergelaendepunkt IS 'FeatureType: "AX_MarkanterGelaendepunkt"';
COMMENT ON COLUMN ax_markantergelaendepunkt.artdesmarkantenpunktes IS 'artDesMarkantenPunktes enumeration AX_ArtDesMarkantenGelaendepunktes 0..1';
COMMENT ON COLUMN ax_markantergelaendepunkt.erfassungmarkantergelaendepunkt IS 'erfassungMarkanterGelaendepunkt DataType AX_ErfassungMarkanterGelaendepunkt 1';
COMMENT ON COLUMN ax_markantergelaendepunkt.hoehengenauigkeit IS 'hoehengenauigkeit  DQ_AbsoluteExternalPositionalAccuracy 0..1';
CREATE TABLE IF NOT EXISTS ax_besondererhoehenpunkt (
	besonderebedeutung ax_besonderebedeutung NOT NULL,
	erfassungbesondererhoehenpunkt ax_erfassung_dgmbesondererhoehenpunkt,
	hoehengenauigkeit text
) INHERITS (au_punktobjekt) WITH OIDS;

COMMENT ON TABLE ax_besondererhoehenpunkt IS 'FeatureType: "AX_BesondererHoehenpunkt"';
COMMENT ON COLUMN ax_besondererhoehenpunkt.besonderebedeutung IS 'besondereBedeutung enumeration AX_BesondereBedeutung 1';
COMMENT ON COLUMN ax_besondererhoehenpunkt.erfassungbesondererhoehenpunkt IS 'erfassungBesondererHoehenpunkt DataType AX_Erfassung_DGMBesondererHoehenpunkt 0..1';
COMMENT ON COLUMN ax_besondererhoehenpunkt.hoehengenauigkeit IS 'hoehengenauigkeit  DQ_AbsoluteExternalPositionalAccuracy 0..1';
CREATE TABLE IF NOT EXISTS ax_hoehleneingang (
	name character varying,
	zustand ax_zustand_hoehleneingang,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (au_punktobjekt) WITH OIDS;

COMMENT ON TABLE ax_hoehleneingang IS 'FeatureType: "AX_Hoehleneingang"';
COMMENT ON COLUMN ax_hoehleneingang.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_hoehleneingang.zustand IS 'zustand enumeration AX_Zustand_Hoehleneingang 0..1';
COMMENT ON COLUMN ax_hoehleneingang.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS au_punkthaufenobjekt (
	position geometry(MULTIPOINT) NOT NULL
) INHERITS (au_objektmitunabhaengigergeometrie) WITH OIDS;

COMMENT ON TABLE au_punkthaufenobjekt IS 'FeatureType: "AU_Punkthaufenobjekt"';
COMMENT ON COLUMN au_punkthaufenobjekt.position IS 'position  GM_MultiPoint 1';
CREATE TABLE IF NOT EXISTS ap_ppo (
	drehwinkel double precision,
	skalierung double precision,
	signaturnummer character varying,
	darstellungsprioritaet integer,
	art character varying,
	dientzurdarstellungvon text[]
) INHERITS (au_punkthaufenobjekt) WITH OIDS;

COMMENT ON TABLE ap_ppo IS 'FeatureType: "AP_PPO"';
COMMENT ON COLUMN ap_ppo.drehwinkel IS 'drehwinkel  Angle 0..1';
COMMENT ON COLUMN ap_ppo.skalierung IS 'skalierung  Real 0..1';
COMMENT ON COLUMN ap_ppo.signaturnummer IS 'signaturnummer  CharacterString 0..1';
COMMENT ON COLUMN ap_ppo.darstellungsprioritaet IS 'darstellungsprioritaet  Integer 0..1';
COMMENT ON COLUMN ap_ppo.art IS 'art  CharacterString 0..1';
COMMENT ON COLUMN ap_ppo.dientzurdarstellungvon IS 'Assoziation zu: FeatureType AA_Objekt (aa_objekt) 0..*';
CREATE TABLE IF NOT EXISTS ag_objektmitgemeinsamergeometrie (

) INHERITS (aa_reo) WITH OIDS;

COMMENT ON TABLE ag_objektmitgemeinsamergeometrie IS 'FeatureType: "AG_ObjektMitGemeinsamerGeometrie"';
CREATE TABLE IF NOT EXISTS ag_linienobjekt (
	position geometry(MULTILINESTRING) NOT NULL
) INHERITS (ag_objektmitgemeinsamergeometrie) WITH OIDS;

COMMENT ON TABLE ag_linienobjekt IS 'FeatureType: "AG_Linienobjekt"';
COMMENT ON COLUMN ag_linienobjekt.position IS 'position  GM_CompositeCurve 1';
CREATE TABLE IF NOT EXISTS ax_sickerstrecke (
	qualitaetsangaben ax_dqmitdatenerhebung,
	name character varying,
	zweitname character varying,
	gewaesserkennzahl character varying,
	inverszu_gehoertzubauwerk text[]
) INHERITS (ag_linienobjekt) WITH OIDS;

COMMENT ON TABLE ax_sickerstrecke IS 'FeatureType: "AX_Sickerstrecke"';
COMMENT ON COLUMN ax_sickerstrecke.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_sickerstrecke.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_sickerstrecke.zweitname IS 'zweitname  CharacterString 0..1';
COMMENT ON COLUMN ax_sickerstrecke.gewaesserkennzahl IS 'gewaesserkennzahl  CharacterString 0..1';
COMMENT ON COLUMN ax_sickerstrecke.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_firstlinie (

) INHERITS (ag_linienobjekt) WITH OIDS;

COMMENT ON TABLE ax_firstlinie IS 'FeatureType: "AX_Firstlinie"';
CREATE TABLE IF NOT EXISTS ax_besonderegebaeudelinie (
	beschaffenheit ax_beschaffenheit_besonderegebaeudelinie[] NOT NULL
) INHERITS (ag_linienobjekt) WITH OIDS;

COMMENT ON TABLE ax_besonderegebaeudelinie IS 'FeatureType: "AX_BesondereGebaeudelinie"';
COMMENT ON COLUMN ax_besonderegebaeudelinie.beschaffenheit IS 'beschaffenheit enumeration AX_Beschaffenheit_BesondereGebaeudelinie 1..*';
CREATE TABLE IF NOT EXISTS ax_gelaendekante (
	artdergelaendekante ax_artdergelaendekante NOT NULL,
	ursprung ax_ursprung,
	erfassung ax_erfassung_dgm,
	hoehengenauigkeit text
) INHERITS (ag_linienobjekt) WITH OIDS;

COMMENT ON TABLE ax_gelaendekante IS 'FeatureType: "AX_Gelaendekante"';
COMMENT ON COLUMN ax_gelaendekante.artdergelaendekante IS 'artDerGelaendekante enumeration AX_ArtDerGelaendekante 1';
COMMENT ON COLUMN ax_gelaendekante.ursprung IS 'ursprung enumeration AX_Ursprung 0..1';
COMMENT ON COLUMN ax_gelaendekante.erfassung IS 'erfassung DataType AX_Erfassung_DGM 0..1';
COMMENT ON COLUMN ax_gelaendekante.hoehengenauigkeit IS 'hoehengenauigkeit  DQ_AbsoluteExternalPositionalAccuracy 0..1';
CREATE TABLE IF NOT EXISTS ag_objekt (
	position geometry NOT NULL
) INHERITS (ag_objektmitgemeinsamergeometrie) WITH OIDS;

COMMENT ON TABLE ag_objekt IS 'FeatureType: "AG_Objekt"';
COMMENT ON COLUMN ag_objekt.position IS 'position  GM_Object 1';
CREATE TABLE IF NOT EXISTS ax_sonstigesbauwerkodersonstigeeinrichtung (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bauwerksfunktion ax_bauwerksfunktion_sonstigesbauwerkodersonstigeeinrichtun NOT NULL,
	name character varying,
	objekthoehe double precision,
	hydrologischesmerkmal ax_hydrologischesmerkmal_sonstigesbauwerkodersonstigeeinri,
	funktion ax_funktion_bauwerk,
	bezeichnung character varying,
	gehoertzubauwerk_ax_sonstigesbauwerkodersonstigeeinrichtun text,
	inverszu_gehoertzubauwerk text[],
	gehoertzubauwerk_ax_bauwerkoderanlagefuersportfreizeitunde text,
	gehoertzubauwerk_ax_leitung text,
	gehoertzubauwerk_ax_bauwerkoderanlagefuerindustrieundgewer text,
	gehoertzubauwerk_ax_einrichtunginoeffentlichenbereichen text,
	gehoertzubauwerk_ax_heilquellegasquelle text,
	gehoertzubauwerk_ax_historischesbauwerkoderhistorischeeinr text,
	gehoertzubauwerk_ax_turm text,
	gehoertzubauwerk_ax_vorratsbehaelterspeicherbauwerk text,
	gehoertzubauwerk_ax_transportanlage text,
	gehoertzubauwerk_ax_wegpfadsteig text,
	gehoertzubauwerk_ax_gleis text,
	gehoertzubauwerk_ax_bahnverkehrsanlage text,
	gehoertzubauwerk_ax_bauwerkimgewaesserbereich text,
	gehoertzubauwerk_ax_strassenverkehrsanlage text,
	gehoertzubauwerk_ax_seilbahnschwebebahn text,
	gehoertzubauwerk_ax_einrichtungenfuerdenschiffsverkehr text,
	gehoertzubauwerk_ax_bauwerkimverkehrsbereich text,
	gehoertzubauwerk_ax_flugverkehrsanlage text,
	gehoertzubauwerk_ax_gewaesserstationierungsachse text,
	gehoertzubauwerk_ax_sickerstrecke text,
	gehoertzubauwerk_ax_schifffahrtsliniefaehrverkehr text,
	gehoertzubauwerk_ax_wasserspiegelhoehe text,
	gehoertzubauwerk_ax_abschnitt text,
	gehoertzubauwerk_ax_ast text,
	gehoertzubauwerk_ax_netzknoten text,
	gehoertzubauwerk_ax_nullpunkt text,
	gehoertzubauwerk_ax_hafen text,
	gehoertzubauwerk_ax_testgelaende text,
	gehoertzubauwerk_ax_schleuse text,
	gehoertzubauwerk_ax_ortslage text,
	gehoertzubauwerk_ax_grenzuebergang text,
	gehoertzubauwerk_ax_polder text,
	gehoertzubauwerk_ax_gewaessermerkmal text,
	gehoertzubauwerk_ax_untergeordnetesgewaesser text,
	gehoertzubauwerk_ax_vegetationsmerkmal text,
	gehoertzu text
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_sonstigesbauwerkodersonstigeeinrichtung IS 'FeatureType: "AX_SonstigesBauwerkOderSonstigeEinrichtung"';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.bauwerksfunktion IS 'bauwerksfunktion enumeration AX_Bauwerksfunktion_SonstigesBauwerkOderSonstigeEinrichtung 1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.objekthoehe IS 'objekthoehe  Length 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.hydrologischesmerkmal IS 'hydrologischesMerkmal enumeration AX_HydrologischesMerkmal_SonstigesBauwerkOderSonstigeEinrichtung 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.funktion IS 'funktion enumeration AX_Funktion_Bauwerk 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_sonstigesbauwerkodersonstigeeinrichtun IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_bauwerkoderanlagefuersportfreizeitunde IS 'Assoziation zu: FeatureType AX_BauwerkOderAnlageFuerSportFreizeitUndErholung (ax_bauwerkoderanlagefuersportfreizeitunderholung) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_leitung IS 'Assoziation zu: FeatureType AX_Leitung (ax_leitung) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_bauwerkoderanlagefuerindustrieundgewer IS 'Assoziation zu: FeatureType AX_BauwerkOderAnlageFuerIndustrieUndGewerbe (ax_bauwerkoderanlagefuerindustrieundgewerbe) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_einrichtunginoeffentlichenbereichen IS 'Assoziation zu: FeatureType AX_EinrichtungInOeffentlichenBereichen (ax_einrichtunginoeffentlichenbereichen) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_heilquellegasquelle IS 'Assoziation zu: FeatureType AX_HeilquelleGasquelle (ax_heilquellegasquelle) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_historischesbauwerkoderhistorischeeinr IS 'Assoziation zu: FeatureType AX_HistorischesBauwerkOderHistorischeEinrichtung (ax_historischesbauwerkoderhistorischeeinrichtung) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_turm IS 'Assoziation zu: FeatureType AX_Turm (ax_turm) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_vorratsbehaelterspeicherbauwerk IS 'Assoziation zu: FeatureType AX_VorratsbehaelterSpeicherbauwerk (ax_vorratsbehaelterspeicherbauwerk) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_transportanlage IS 'Assoziation zu: FeatureType AX_Transportanlage (ax_transportanlage) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_wegpfadsteig IS 'Assoziation zu: FeatureType AX_WegPfadSteig (ax_wegpfadsteig) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_gleis IS 'Assoziation zu: FeatureType AX_Gleis (ax_gleis) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_bahnverkehrsanlage IS 'Assoziation zu: FeatureType AX_Bahnverkehrsanlage (ax_bahnverkehrsanlage) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_bauwerkimgewaesserbereich IS 'Assoziation zu: FeatureType AX_BauwerkImGewaesserbereich (ax_bauwerkimgewaesserbereich) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_strassenverkehrsanlage IS 'Assoziation zu: FeatureType AX_Strassenverkehrsanlage (ax_strassenverkehrsanlage) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_seilbahnschwebebahn IS 'Assoziation zu: FeatureType AX_SeilbahnSchwebebahn (ax_seilbahnschwebebahn) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_einrichtungenfuerdenschiffsverkehr IS 'Assoziation zu: FeatureType AX_EinrichtungenFuerDenSchiffsverkehr (ax_einrichtungenfuerdenschiffsverkehr) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_bauwerkimverkehrsbereich IS 'Assoziation zu: FeatureType AX_BauwerkImVerkehrsbereich (ax_bauwerkimverkehrsbereich) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_flugverkehrsanlage IS 'Assoziation zu: FeatureType AX_Flugverkehrsanlage (ax_flugverkehrsanlage) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_gewaesserstationierungsachse IS 'Assoziation zu: FeatureType AX_Gewaesserstationierungsachse (ax_gewaesserstationierungsachse) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_sickerstrecke IS 'Assoziation zu: FeatureType AX_Sickerstrecke (ax_sickerstrecke) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_schifffahrtsliniefaehrverkehr IS 'Assoziation zu: FeatureType AX_SchifffahrtslinieFaehrverkehr (ax_schifffahrtsliniefaehrverkehr) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_wasserspiegelhoehe IS 'Assoziation zu: FeatureType AX_Wasserspiegelhoehe (ax_wasserspiegelhoehe) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_abschnitt IS 'Assoziation zu: FeatureType AX_Abschnitt (ax_abschnitt) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_ast IS 'Assoziation zu: FeatureType AX_Ast (ax_ast) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_netzknoten IS 'Assoziation zu: FeatureType AX_Netzknoten (ax_netzknoten) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_nullpunkt IS 'Assoziation zu: FeatureType AX_Nullpunkt (ax_nullpunkt) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_hafen IS 'Assoziation zu: FeatureType AX_Hafen (ax_hafen) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_testgelaende IS 'Assoziation zu: FeatureType AX_Testgelaende (ax_testgelaende) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_schleuse IS 'Assoziation zu: FeatureType AX_Schleuse (ax_schleuse) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_ortslage IS 'Assoziation zu: FeatureType AX_Ortslage (ax_ortslage) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_grenzuebergang IS 'Assoziation zu: FeatureType AX_Grenzuebergang (ax_grenzuebergang) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_polder IS 'Assoziation zu: FeatureType AX_Polder (ax_polder) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_gewaessermerkmal IS 'Assoziation zu: FeatureType AX_Gewaessermerkmal (ax_gewaessermerkmal) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_untergeordnetesgewaesser IS 'Assoziation zu: FeatureType AX_UntergeordnetesGewaesser (ax_untergeordnetesgewaesser) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk_ax_vegetationsmerkmal IS 'Assoziation zu: FeatureType AX_Vegetationsmerkmal (ax_vegetationsmerkmal) 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzu IS 'Assoziation zu: FeatureType AX_Gebaeude (ax_gebaeude) 0..1';
CREATE TABLE IF NOT EXISTS ax_bauwerkoderanlagefuersportfreizeitunderholung (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bauwerksfunktion ax_bauwerksfunktion_bauwerkoderanlagefuersportfreizeitunde NOT NULL,
	name character varying,
	sportart ax_sportart_bauwerkoderanlagefuersportfreizeitunderholung,
	breitedesobjekts double precision,
	inverszu_gehoertzubauwerk text[]
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_bauwerkoderanlagefuersportfreizeitunderholung IS 'FeatureType: "AX_BauwerkOderAnlageFuerSportFreizeitUndErholung"';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.bauwerksfunktion IS 'bauwerksfunktion enumeration AX_Bauwerksfunktion_BauwerkOderAnlageFuerSportFreizeitUndErholung 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.sportart IS 'sportart enumeration AX_Sportart_BauwerkOderAnlageFuerSportFreizeitUndErholung 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.breitedesobjekts IS 'breiteDesObjekts  Length 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_bauwerkoderanlagefuerindustrieundgewerbe (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bauwerksfunktion ax_bauwerksfunktion_bauwerkoderanlagefuerindustrieundgewer NOT NULL,
	name character varying,
	bezeichnung character varying,
	objekthoehe double precision,
	zustand ax_zustand_bauwerkoderanlagefuerindustrieundgewerbe,
	inverszu_gehoertzubauwerk text[]
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_bauwerkoderanlagefuerindustrieundgewerbe IS 'FeatureType: "AX_BauwerkOderAnlageFuerIndustrieUndGewerbe"';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.bauwerksfunktion IS 'bauwerksfunktion enumeration AX_Bauwerksfunktion_BauwerkOderAnlageFuerIndustrieUndGewerbe 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.objekthoehe IS 'objekthoehe  Length 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.zustand IS 'zustand enumeration AX_Zustand_BauwerkOderAnlageFuerIndustrieUndGewerbe 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_einrichtunginoeffentlichenbereichen (
	qualitaetsangaben ax_dqmitdatenerhebung,
	art ax_art_einrichtunginoeffentlichenbereichen NOT NULL,
	kilometerangabe double precision,
	inverszu_gehoertzubauwerk text[]
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_einrichtunginoeffentlichenbereichen IS 'FeatureType: "AX_EinrichtungInOeffentlichenBereichen"';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.art IS 'art enumeration AX_Art_EinrichtungInOeffentlichenBereichen 1';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.kilometerangabe IS 'kilometerangabe  Distance 0..1';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_historischesbauwerkoderhistorischeeinrichtung (
	qualitaetsangaben ax_dqmitdatenerhebung,
	archaeologischertyp ax_archaeologischertyp_historischesbauwerkoderhistorischee NOT NULL,
	name character varying,
	inverszu_gehoertzubauwerk text[]
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_historischesbauwerkoderhistorischeeinrichtung IS 'FeatureType: "AX_HistorischesBauwerkOderHistorischeEinrichtung"';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.archaeologischertyp IS 'archaeologischerTyp enumeration AX_ArchaeologischerTyp_HistorischesBauwerkOderHistorischeEinrichtung 1';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_turm (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bauwerksfunktion ax_bauwerksfunktion_turm[] NOT NULL,
	objekthoehe double precision,
	name character varying,
	zustand ax_zustand_turm,
	inverszu_gehoertzubauwerk text[],
	zeigtauf text[]
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_turm IS 'FeatureType: "AX_Turm"';
COMMENT ON COLUMN ax_turm.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_turm.bauwerksfunktion IS 'bauwerksfunktion enumeration AX_Bauwerksfunktion_Turm 1..*';
COMMENT ON COLUMN ax_turm.objekthoehe IS 'objekthoehe  Length 0..1';
COMMENT ON COLUMN ax_turm.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_turm.zustand IS 'zustand enumeration AX_Zustand_Turm 0..1';
COMMENT ON COLUMN ax_turm.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
COMMENT ON COLUMN ax_turm.zeigtauf IS 'Assoziation zu: FeatureType AX_LagebezeichnungMitHausnummer (ax_lagebezeichnungmithausnummer) 0..*';
CREATE TABLE IF NOT EXISTS ax_vorratsbehaelterspeicherbauwerk (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bauwerksfunktion ax_bauwerksfunktion_vorratsbehaelterspeicherbauwerk,
	name character varying,
	objekthoehe double precision,
	speicherinhalt ax_speicherinhalt_vorratsbehaelterspeicherbauwerk,
	lagezurerdoberflaeche ax_lagezurerdoberflaeche_vorratsbehaelterspeicherbauwerk,
	inverszu_gehoertzubauwerk text[]
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_vorratsbehaelterspeicherbauwerk IS 'FeatureType: "AX_VorratsbehaelterSpeicherbauwerk"';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.bauwerksfunktion IS 'bauwerksfunktion enumeration AX_Bauwerksfunktion_VorratsbehaelterSpeicherbauwerk 0..1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.objekthoehe IS 'objekthoehe  Length 0..1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.speicherinhalt IS 'speicherinhalt enumeration AX_Speicherinhalt_VorratsbehaelterSpeicherbauwerk 0..1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.lagezurerdoberflaeche IS 'lageZurErdoberflaeche enumeration AX_LageZurErdoberflaeche_VorratsbehaelterSpeicherbauwerk 0..1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_bauwerkimgewaesserbereich (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bauwerksfunktion ax_bauwerksfunktion_bauwerkimgewaesserbereich NOT NULL,
	name character varying,
	bezeichnung character varying,
	zustand ax_zustand_bauwerkimgewaesserbereich,
	inverszu_gehoertzubauwerk text[]
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_bauwerkimgewaesserbereich IS 'FeatureType: "AX_BauwerkImGewaesserbereich"';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.bauwerksfunktion IS 'bauwerksfunktion enumeration AX_Bauwerksfunktion_BauwerkImGewaesserbereich 1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.zustand IS 'zustand enumeration AX_Zustand_BauwerkImGewaesserbereich 0..1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_bauwerkimverkehrsbereich (
	qualitaetsangaben ax_dqmitdatenerhebung,
	bauwerksfunktion ax_bauwerksfunktion_bauwerkimverkehrsbereich NOT NULL,
	name character varying,
	bezeichnung character varying,
	zustand ax_zustand_bauwerkimverkehrsbereich,
	durchfahrtshoehe double precision,
	breitedesobjekts double precision,
	inverszu_gehoertzubauwerk text[]
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_bauwerkimverkehrsbereich IS 'FeatureType: "AX_BauwerkImVerkehrsbereich"';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.bauwerksfunktion IS 'bauwerksfunktion enumeration AX_Bauwerksfunktion_BauwerkImVerkehrsbereich 1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.zustand IS 'zustand enumeration AX_Zustand_BauwerkImVerkehrsbereich 0..1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.durchfahrtshoehe IS 'durchfahrtshoehe  Length 0..1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.breitedesobjekts IS 'breiteDesObjekts  Length 0..1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_schifffahrtsliniefaehrverkehr (
	qualitaetsangaben ax_dqmitdatenerhebung,
	art ax_art_schifffahrtsliniefaehrverkehr[],
	name character varying,
	inverszu_gehoertzubauwerk text[]
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_schifffahrtsliniefaehrverkehr IS 'FeatureType: "AX_SchifffahrtslinieFaehrverkehr"';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.art IS 'art enumeration AX_Art_SchifffahrtslinieFaehrverkehr 0..*';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_gebaeude (
	gebaeudefunktion ax_gebaeudefunktion NOT NULL,
	weiteregebaeudefunktion ax_weitere_gebaeudefunktion[],
	name character varying[],
	nutzung ax_nutzung_gebaeude[],
	bauweise ax_bauweise_gebaeude,
	anzahlderoberirdischengeschosse integer,
	anzahlderunterirdischengeschosse integer,
	hochhaus boolean,
	objekthoehe double precision,
	dachform ax_dachform,
	zustand ax_zustand_gebaeude,
	geschossflaeche double precision,
	grundflaeche double precision,
	umbauterraum double precision,
	baujahr integer[],
	lagezurerdoberflaeche ax_lagezurerdoberflaeche_gebaeude,
	dachart character varying,
	dachgeschossausbau ax_dachgeschossausbau_gebaeude,
	gebaeudekennzeichen character varying,
	qualitaetsangaben ax_dqmitdatenerhebung,
	inverszu_gehoertzu text[],
	gehoert text[],
	zeigtauf text[],
	hat text,
	haengtzusammenmit text,
	gehoertzu  text,
	inverszu_zeigtauf text[]
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_gebaeude IS 'FeatureType: "AX_Gebaeude"';
COMMENT ON COLUMN ax_gebaeude.gebaeudefunktion IS 'gebaeudefunktion enumeration AX_Gebaeudefunktion 1';
COMMENT ON COLUMN ax_gebaeude.weiteregebaeudefunktion IS 'weitereGebaeudefunktion enumeration AX_Weitere_Gebaeudefunktion 0..*';
COMMENT ON COLUMN ax_gebaeude.name IS 'name  CharacterString 0..*';
COMMENT ON COLUMN ax_gebaeude.nutzung IS 'nutzung DataType AX_Nutzung_Gebaeude 0..*';
COMMENT ON COLUMN ax_gebaeude.bauweise IS 'bauweise enumeration AX_Bauweise_Gebaeude 0..1';
COMMENT ON COLUMN ax_gebaeude.anzahlderoberirdischengeschosse IS 'anzahlDerOberirdischenGeschosse  Integer 0..1';
COMMENT ON COLUMN ax_gebaeude.anzahlderunterirdischengeschosse IS 'anzahlDerUnterirdischenGeschosse  Integer 0..1';
COMMENT ON COLUMN ax_gebaeude.hochhaus IS 'hochhaus  Boolean 0..1';
COMMENT ON COLUMN ax_gebaeude.objekthoehe IS 'objekthoehe  Length 0..1';
COMMENT ON COLUMN ax_gebaeude.dachform IS 'dachform enumeration AX_Dachform 0..1';
COMMENT ON COLUMN ax_gebaeude.zustand IS 'zustand enumeration AX_Zustand_Gebaeude 0..1';
COMMENT ON COLUMN ax_gebaeude.geschossflaeche IS 'geschossflaeche  Area 0..1';
COMMENT ON COLUMN ax_gebaeude.grundflaeche IS 'grundflaeche  Area 0..1';
COMMENT ON COLUMN ax_gebaeude.umbauterraum IS 'umbauterRaum  Volume 0..1';
COMMENT ON COLUMN ax_gebaeude.baujahr IS 'baujahr  Integer 0..*';
COMMENT ON COLUMN ax_gebaeude.lagezurerdoberflaeche IS 'lageZurErdoberflaeche enumeration AX_LageZurErdoberflaeche_Gebaeude 0..1';
COMMENT ON COLUMN ax_gebaeude.dachart IS 'dachart  CharacterString 0..1';
COMMENT ON COLUMN ax_gebaeude.dachgeschossausbau IS 'dachgeschossausbau enumeration AX_Dachgeschossausbau_Gebaeude 0..1';
COMMENT ON COLUMN ax_gebaeude.gebaeudekennzeichen IS 'gebaeudekennzeichen  CharacterString 0..1';
COMMENT ON COLUMN ax_gebaeude.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_gebaeude.inverszu_gehoertzu IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
COMMENT ON COLUMN ax_gebaeude.gehoert IS 'Assoziation zu: FeatureType AX_Person (ax_person) 0..*';
COMMENT ON COLUMN ax_gebaeude.zeigtauf IS 'Assoziation zu: FeatureType AX_LagebezeichnungMitHausnummer (ax_lagebezeichnungmithausnummer) 0..*';
COMMENT ON COLUMN ax_gebaeude.hat IS 'Assoziation zu: FeatureType AX_LagebezeichnungMitPseudonummer (ax_lagebezeichnungmitpseudonummer) 0..1';
COMMENT ON COLUMN ax_gebaeude.haengtzusammenmit IS 'Assoziation zu: FeatureType AX_Gebaeude (ax_gebaeude) 0..1';
COMMENT ON COLUMN ax_gebaeude.gehoertzu  IS 'Assoziation zu: FeatureType AX_Gebaeude (ax_gebaeude) 0..1';
COMMENT ON COLUMN ax_gebaeude.inverszu_zeigtauf IS 'Assoziation zu: FeatureType AX_Gebaeudeausgestaltung (ax_gebaeudeausgestaltung) 0..*';
CREATE TABLE IF NOT EXISTS ax_anderefestlegungnachstrassenrecht (
	artderfestlegung ax_artderfestlegung_anderefestlegungnachstrassenrecht NOT NULL,
	ausfuehrendestelle ax_dienststelle_schluessel,
	nummer character varying,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_anderefestlegungnachstrassenrecht IS 'FeatureType: "AX_AndereFestlegungNachStrassenrecht"';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.artderfestlegung IS 'artDerFestlegung enumeration AX_ArtDerFestlegung_AndereFestlegungNachStrassenrecht 1';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.ausfuehrendestelle IS 'ausfuehrendeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.nummer IS 'nummer  CharacterString 0..1';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_naturumweltoderbodenschutzrecht (
	artderfestlegung ax_artderfestlegung_naturumweltoderbodenschutzrecht NOT NULL,
	ausfuehrendestelle ax_dienststelle_schluessel,
	name character varying,
	bezeichnung character varying,
	zustand ax_zustand_naturumweltoderbodenschutzrecht,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_naturumweltoderbodenschutzrecht IS 'FeatureType: "AX_NaturUmweltOderBodenschutzrecht"';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.artderfestlegung IS 'artDerFestlegung enumeration AX_ArtDerFestlegung_NaturUmweltOderBodenschutzrecht 1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.ausfuehrendestelle IS 'ausfuehrendeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.zustand IS 'zustand enumeration AX_Zustand_NaturUmweltOderBodenschutzrecht 0..1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_klassifizierungnachstrassenrecht (
	artderfestlegung ax_artderfestlegung_klassifizierungnachstrassenrecht NOT NULL,
	bezeichnung character varying,
	ausfuehrendestelle ax_dienststelle_schluessel,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_klassifizierungnachstrassenrecht IS 'FeatureType: "AX_KlassifizierungNachStrassenrecht"';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.artderfestlegung IS 'artDerFestlegung enumeration AX_ArtDerFestlegung_KlassifizierungNachStrassenrecht 1';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.ausfuehrendestelle IS 'ausfuehrendeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_sonstigesrecht (
	artderfestlegung ax_artderfestlegung_sonstigesrecht NOT NULL,
	ausfuehrendestelle ax_dienststelle_schluessel,
	name character varying,
	bezeichnung character varying,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_sonstigesrecht IS 'FeatureType: "AX_SonstigesRecht"';
COMMENT ON COLUMN ax_sonstigesrecht.artderfestlegung IS 'artDerFestlegung enumeration AX_ArtDerFestlegung_SonstigesRecht 1';
COMMENT ON COLUMN ax_sonstigesrecht.ausfuehrendestelle IS 'ausfuehrendeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_sonstigesrecht.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_sonstigesrecht.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_sonstigesrecht.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_denkmalschutzrecht (
	artderfestlegung ax_artderfestlegung_denkmalschutzrecht NOT NULL,
	ausfuehrendestelle ax_dienststelle_schluessel,
	name character varying,
	bezeichnung character varying,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_denkmalschutzrecht IS 'FeatureType: "AX_Denkmalschutzrecht"';
COMMENT ON COLUMN ax_denkmalschutzrecht.artderfestlegung IS 'artDerFestlegung enumeration AX_ArtDerFestlegung_Denkmalschutzrecht 1';
COMMENT ON COLUMN ax_denkmalschutzrecht.ausfuehrendestelle IS 'ausfuehrendeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_denkmalschutzrecht.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_denkmalschutzrecht.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_denkmalschutzrecht.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_dammwalldeich (
	art ax_art_dammwalldeich,
	funktion ax_funktion_dammwalldeich,
	bezeichnung character varying,
	objekthoehe double precision,
	name character varying,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (ag_objekt) WITH OIDS;

COMMENT ON TABLE ax_dammwalldeich IS 'FeatureType: "AX_DammWallDeich"';
COMMENT ON COLUMN ax_dammwalldeich.art IS 'art enumeration AX_Art_DammWallDeich 0..1';
COMMENT ON COLUMN ax_dammwalldeich.funktion IS 'funktion enumeration AX_Funktion_DammWallDeich 0..1';
COMMENT ON COLUMN ax_dammwalldeich.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_dammwalldeich.objekthoehe IS 'objekthoehe  Length 0..1';
COMMENT ON COLUMN ax_dammwalldeich.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_dammwalldeich.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ag_punktobjekt (
	position geometry(POINT) NOT NULL
) INHERITS (ag_objektmitgemeinsamergeometrie) WITH OIDS;

COMMENT ON TABLE ag_punktobjekt IS 'FeatureType: "AG_Punktobjekt"';
COMMENT ON COLUMN ag_punktobjekt.position IS 'position  GM_Point 1';
CREATE TABLE IF NOT EXISTS ax_punktortag (
	kartendarstellung boolean,
	koordinatenstatus ax_koordinatenstatus_punktort,
	ueberpruefungsdatum date,
	hinweise character varying,
	qualitaetsangaben ax_dqpunktort
) INHERITS (ag_punktobjekt) WITH OIDS;

COMMENT ON TABLE ax_punktortag IS 'FeatureType: "AX_PunktortAG"';
COMMENT ON COLUMN ax_punktortag.kartendarstellung IS 'kartendarstellung  Boolean 0..1';
COMMENT ON COLUMN ax_punktortag.koordinatenstatus IS 'koordinatenstatus enumeration AX_Koordinatenstatus_Punktort 0..1';
COMMENT ON COLUMN ax_punktortag.ueberpruefungsdatum IS 'ueberpruefungsdatum  Date 0..1';
COMMENT ON COLUMN ax_punktortag.hinweise IS 'hinweise  CharacterString 0..1';
COMMENT ON COLUMN ax_punktortag.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQPunktort 0..1';
CREATE TABLE IF NOT EXISTS ag_flaechenobjekt (
	position geometry NOT NULL
) INHERITS (ag_objektmitgemeinsamergeometrie) WITH OIDS;

COMMENT ON TABLE ag_flaechenobjekt IS 'FeatureType: "AG_Flaechenobjekt"';
COMMENT ON COLUMN ag_flaechenobjekt.position IS 'position  GM_Object 1';
CREATE TABLE IF NOT EXISTS ax_bauteil (
	bauart ax_bauart_bauteil NOT NULL,
	lagezurerdoberflaeche ax_lagezurerdoberflaeche_bauteil,
	durchfahrtshoehe double precision,
	dachform ax_dachform,
	anzahlderoberirdischengeschosse integer,
	baujahr integer[]
) INHERITS (ag_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_bauteil IS 'FeatureType: "AX_Bauteil"';
COMMENT ON COLUMN ax_bauteil.bauart IS 'bauart enumeration AX_Bauart_Bauteil 1';
COMMENT ON COLUMN ax_bauteil.lagezurerdoberflaeche IS 'lageZurErdoberflaeche enumeration AX_LageZurErdoberflaeche_Bauteil 0..1';
COMMENT ON COLUMN ax_bauteil.durchfahrtshoehe IS 'durchfahrtshoehe  Length 0..1';
COMMENT ON COLUMN ax_bauteil.dachform IS 'dachform enumeration AX_Dachform 0..1';
COMMENT ON COLUMN ax_bauteil.anzahlderoberirdischengeschosse IS 'anzahlDerOberirdischenGeschosse  Integer 0..1';
COMMENT ON COLUMN ax_bauteil.baujahr IS 'baujahr  Integer 0..*';
CREATE TABLE IF NOT EXISTS ax_tagesabschnitt (
	tagesabschnittsnummer character varying NOT NULL,
	inverszu_gehoertzu text[]
) INHERITS (ag_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_tagesabschnitt IS 'FeatureType: "AX_Tagesabschnitt"';
COMMENT ON COLUMN ax_tagesabschnitt.tagesabschnittsnummer IS 'tagesabschnittsnummer  CharacterString 1';
COMMENT ON COLUMN ax_tagesabschnitt.inverszu_gehoertzu IS 'Assoziation zu: FeatureType AX_GrablochDerBodenschaetzung (ax_grablochderbodenschaetzung) 0..*';
CREATE TABLE IF NOT EXISTS ax_bewertung (
	klassifizierung ax_klassifizierung_bewertung NOT NULL,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (ag_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_bewertung IS 'FeatureType: "AX_Bewertung"';
COMMENT ON COLUMN ax_bewertung.klassifizierung IS 'klassifizierung enumeration AX_Klassifizierung_Bewertung 1';
COMMENT ON COLUMN ax_bewertung.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_anderefestlegungnachwasserrecht (
	artderfestlegung ax_artderfestlegung_anderefestlegungnachwasserrecht NOT NULL,
	ausfuehrendestelle ax_dienststelle_schluessel,
	nummer character varying,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (ag_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_anderefestlegungnachwasserrecht IS 'FeatureType: "AX_AndereFestlegungNachWasserrecht"';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.artderfestlegung IS 'artDerFestlegung enumeration AX_ArtDerFestlegung_AndereFestlegungNachWasserrecht 1';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.ausfuehrendestelle IS 'ausfuehrendeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.nummer IS 'nummer  CharacterString 0..1';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_klassifizierungnachwasserrecht (
	artderfestlegung ax_artderfestlegung_klassifizierungnachwasserrecht NOT NULL,
	ausfuehrendestelle ax_dienststelle_schluessel,
	bezeichnung character varying,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (ag_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_klassifizierungnachwasserrecht IS 'FeatureType: "AX_KlassifizierungNachWasserrecht"';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.artderfestlegung IS 'artDerFestlegung enumeration AX_ArtDerFestlegung_KlassifizierungNachWasserrecht 1';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.ausfuehrendestelle IS 'ausfuehrendeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_forstrecht (
	artderfestlegung ax_artderfestlegung_forstrecht NOT NULL,
	besonderefunktion ax_besonderefunktion_forstrecht,
	ausfuehrendestelle ax_dienststelle_schluessel,
	bezeichnung character varying,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (ag_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_forstrecht IS 'FeatureType: "AX_Forstrecht"';
COMMENT ON COLUMN ax_forstrecht.artderfestlegung IS 'artDerFestlegung enumeration AX_ArtDerFestlegung_Forstrecht 1';
COMMENT ON COLUMN ax_forstrecht.besonderefunktion IS 'besondereFunktion enumeration AX_BesondereFunktion_Forstrecht 0..1';
COMMENT ON COLUMN ax_forstrecht.ausfuehrendestelle IS 'ausfuehrendeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_forstrecht.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_forstrecht.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_bauraumoderbodenordnungsrecht (
	artderfestlegung ax_artderfestlegung_bauraumoderbodenordnungsrecht NOT NULL,
	ausfuehrendestelle ax_dienststelle_schluessel,
	name character varying,
	bezeichnung character varying,
	veraenderungohneruecksprache boolean,
	datumanordnung date,
	datumbesitzeinweisung date,
	datumrechtskraeftig date,
	datumabgabe date,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (ag_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_bauraumoderbodenordnungsrecht IS 'FeatureType: "AX_BauRaumOderBodenordnungsrecht"';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.artderfestlegung IS 'artDerFestlegung enumeration AX_ArtDerFestlegung_BauRaumOderBodenordnungsrecht 1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.ausfuehrendestelle IS 'ausfuehrendeStelle DataType AX_Dienststelle_Schluessel 0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.veraenderungohneruecksprache IS 'veraenderungOhneRuecksprache  Boolean 0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.datumanordnung IS 'datumAnordnung  Date 0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.datumbesitzeinweisung IS 'datumBesitzeinweisung  Date 0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.datumrechtskraeftig IS 'datumrechtskraeftig  Date 0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.datumabgabe IS 'datumAbgabe  Date 0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_schutzzone (
	zone ax_zone_schutzzone NOT NULL,
	rechtszustand ax_rechtszustand_schutzzone,
	nummerderschutzzone character varying
) INHERITS (ag_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_schutzzone IS 'FeatureType: "AX_Schutzzone"';
COMMENT ON COLUMN ax_schutzzone.zone IS 'zone enumeration AX_Zone_Schutzzone 1';
COMMENT ON COLUMN ax_schutzzone.rechtszustand IS 'rechtszustand enumeration AX_Rechtszustand_Schutzzone 0..1';
COMMENT ON COLUMN ax_schutzzone.nummerderschutzzone IS 'nummerDerSchutzzone  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_boeschungsflaeche (

) INHERITS (ag_flaechenobjekt) WITH OIDS;

COMMENT ON TABLE ax_boeschungsflaeche IS 'FeatureType: "AX_Boeschungsflaeche"';
CREATE TABLE IF NOT EXISTS ta_multisurfacecomponent (

) INHERITS (ag_objektmitgemeinsamergeometrie) WITH OIDS;

COMMENT ON TABLE ta_multisurfacecomponent IS 'FeatureType: "TA_MultiSurfaceComponent"';
CREATE TABLE IF NOT EXISTS ax_flurstueck (
	zustaendigestelle ax_dienststelle_schluessel[],
	gemarkung ax_gemarkung_schluessel NOT NULL,
	flurstuecksnummer ax_flurstuecksnummer NOT NULL,
	flurstueckskennzeichen character varying NOT NULL,
	amtlicheflaeche double precision NOT NULL,
	flurnummer integer,
	flurstuecksfolge character varying,
	abweichenderrechtszustand boolean,
	zweifelhafterflurstuecksnachweis boolean,
	rechtsbehelfsverfahren boolean,
	objektkoordinaten geometry(POINT),
	sonstigeeigenschaften ax_sonstigeeigenschaften_flurstueck[],
	zeitpunktderentstehung date,
	gemeindezugehoerigkeit ax_gemeindekennzeichen,
	inverszu_verweistauf text[],
	istgebucht text NOT NULL,
	inverszu_beziehtsichauf text[],
	beziehtsichaufflurstueck text[],
	gehoertanteiligzu  text[],
	zeigtauf text[],
	weistauf text[]
) INHERITS (ta_multisurfacecomponent) WITH OIDS;

COMMENT ON TABLE ax_flurstueck IS 'FeatureType: "AX_Flurstueck"';
COMMENT ON COLUMN ax_flurstueck.zustaendigestelle IS 'zustaendigeStelle DataType AX_Dienststelle_Schluessel 0..*';
COMMENT ON COLUMN ax_flurstueck.gemarkung IS 'gemarkung DataType AX_Gemarkung_Schluessel 1';
COMMENT ON COLUMN ax_flurstueck.flurstuecksnummer IS 'flurstuecksnummer DataType AX_Flurstuecksnummer 1';
COMMENT ON COLUMN ax_flurstueck.flurstueckskennzeichen IS 'flurstueckskennzeichen  CharacterString 1';
COMMENT ON COLUMN ax_flurstueck.amtlicheflaeche IS 'amtlicheFlaeche  Area 1';
COMMENT ON COLUMN ax_flurstueck.flurnummer IS 'flurnummer  Integer 0..1';
COMMENT ON COLUMN ax_flurstueck.flurstuecksfolge IS 'flurstuecksfolge  CharacterString 0..1';
COMMENT ON COLUMN ax_flurstueck.abweichenderrechtszustand IS 'abweichenderRechtszustand  Boolean 0..1';
COMMENT ON COLUMN ax_flurstueck.zweifelhafterflurstuecksnachweis IS 'zweifelhafterFlurstuecksnachweis  Boolean 0..1';
COMMENT ON COLUMN ax_flurstueck.rechtsbehelfsverfahren IS 'rechtsbehelfsverfahren  Boolean 0..1';
COMMENT ON COLUMN ax_flurstueck.objektkoordinaten IS 'objektkoordinaten  GM_Point 0..1';
COMMENT ON COLUMN ax_flurstueck.sonstigeeigenschaften IS 'sonstigeEigenschaften DataType AX_SonstigeEigenschaften_Flurstueck 0..*';
COMMENT ON COLUMN ax_flurstueck.zeitpunktderentstehung IS 'zeitpunktDerEntstehung  Date 0..1';
COMMENT ON COLUMN ax_flurstueck.gemeindezugehoerigkeit IS 'gemeindezugehoerigkeit DataType AX_Gemeindekennzeichen 0..1';
COMMENT ON COLUMN ax_flurstueck.inverszu_verweistauf IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';
COMMENT ON COLUMN ax_flurstueck.istgebucht IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 1';
COMMENT ON COLUMN ax_flurstueck.inverszu_beziehtsichauf IS 'Assoziation zu: FeatureType AX_Vertretung (ax_vertretung) 0..*';
COMMENT ON COLUMN ax_flurstueck.beziehtsichaufflurstueck IS 'Assoziation zu: FeatureType AX_Flurstueck (ax_flurstueck) 0..*';
COMMENT ON COLUMN ax_flurstueck.gehoertanteiligzu  IS 'Assoziation zu: FeatureType AX_Flurstueck (ax_flurstueck) 0..*';
COMMENT ON COLUMN ax_flurstueck.zeigtauf IS 'Assoziation zu: FeatureType AX_LagebezeichnungOhneHausnummer (ax_lagebezeichnungohnehausnummer) 0..*';
COMMENT ON COLUMN ax_flurstueck.weistauf IS 'Assoziation zu: FeatureType AX_LagebezeichnungMitHausnummer (ax_lagebezeichnungmithausnummer) 0..*';
CREATE TABLE IF NOT EXISTS ax_gebiet (
	schluesselgesamt character varying NOT NULL
) INHERITS (ta_multisurfacecomponent) WITH OIDS;

COMMENT ON TABLE ax_gebiet IS 'FeatureType: "AX_Gebiet"';
COMMENT ON COLUMN ax_gebiet.schluesselgesamt IS 'schluesselGesamt  CharacterString 1';
CREATE TABLE IF NOT EXISTS ax_gebiet_kreis (
	kreis ax_kreis_schluessel NOT NULL
) INHERITS (ax_gebiet) WITH OIDS;

COMMENT ON TABLE ax_gebiet_kreis IS 'FeatureType: "AX_Gebiet_Kreis"';
COMMENT ON COLUMN ax_gebiet_kreis.kreis IS 'kreis DataType AX_Kreis_Schluessel 1';
CREATE TABLE IF NOT EXISTS ax_gebiet_bundesland (
	land ax_bundesland_schluessel NOT NULL
) INHERITS (ax_gebiet) WITH OIDS;

COMMENT ON TABLE ax_gebiet_bundesland IS 'FeatureType: "AX_Gebiet_Bundesland"';
COMMENT ON COLUMN ax_gebiet_bundesland.land IS 'land DataType AX_Bundesland_Schluessel 1';
CREATE TABLE IF NOT EXISTS ax_gebiet_regierungsbezirk (
	regierungsbezirk ax_regierungsbezirk_schluessel NOT NULL
) INHERITS (ax_gebiet) WITH OIDS;

COMMENT ON TABLE ax_gebiet_regierungsbezirk IS 'FeatureType: "AX_Gebiet_Regierungsbezirk"';
COMMENT ON COLUMN ax_gebiet_regierungsbezirk.regierungsbezirk IS 'regierungsbezirk DataType AX_Regierungsbezirk_Schluessel 1';
CREATE TABLE IF NOT EXISTS ax_gebiet_nationalstaat (
	nationalstaat character varying NOT NULL
) INHERITS (ax_gebiet) WITH OIDS;

COMMENT ON TABLE ax_gebiet_nationalstaat IS 'FeatureType: "AX_Gebiet_Nationalstaat"';
COMMENT ON COLUMN ax_gebiet_nationalstaat.nationalstaat IS 'nationalstaat  CharacterString 1';
CREATE TABLE IF NOT EXISTS ax_kommunalesgebiet (
	gemeindekennzeichen ax_gemeindekennzeichen NOT NULL,
	gemeindeflaeche double precision
) INHERITS (ax_gebiet) WITH OIDS;

COMMENT ON TABLE ax_kommunalesgebiet IS 'FeatureType: "AX_KommunalesGebiet"';
COMMENT ON COLUMN ax_kommunalesgebiet.gemeindekennzeichen IS 'gemeindekennzeichen DataType AX_Gemeindekennzeichen 1';
COMMENT ON COLUMN ax_kommunalesgebiet.gemeindeflaeche IS 'gemeindeflaeche  Area 0..1';
CREATE TABLE IF NOT EXISTS ax_gebiet_verwaltungsgemeinschaft (
	verwaltungsgemeinschaft ax_verwaltungsgemeinschaft_schluessel NOT NULL,
	artderverbandsgemeinde ax_art_verbandsgemeinde NOT NULL
) INHERITS (ax_gebiet) WITH OIDS;

COMMENT ON TABLE ax_gebiet_verwaltungsgemeinschaft IS 'FeatureType: "AX_Gebiet_Verwaltungsgemeinschaft"';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.verwaltungsgemeinschaft IS 'verwaltungsgemeinschaft DataType AX_Verwaltungsgemeinschaft_Schluessel 1';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.artderverbandsgemeinde IS 'artDerVerbandsgemeinde enumeration AX_Art_Verbandsgemeinde 1';
CREATE TABLE IF NOT EXISTS ax_bodenschaetzung (
	kulturart ax_kulturart_bodenschaetzung NOT NULL,
	bodenart ax_bodenart_bodenschaetzung NOT NULL,
	zustandsstufeoderbodenstufe ax_zustandsstufeoderbodenstufe_bodenschaetzung,
	entstehungsartoderklimastufewasserverhaeltnisse ax_entstehungsartoderklimastufewasserverhaeltnisse_bodensc[],
	bodenzahlodergruenlandgrundzahl character varying,
	ackerzahlodergruenlandzahl character varying,
	sonstigeangaben ax_sonstigeangaben_bodenschaetzung[],
	jahreszahl integer,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (ta_multisurfacecomponent) WITH OIDS;

COMMENT ON TABLE ax_bodenschaetzung IS 'FeatureType: "AX_Bodenschaetzung"';
COMMENT ON COLUMN ax_bodenschaetzung.kulturart IS 'kulturart enumeration AX_Kulturart_Bodenschaetzung 1';
COMMENT ON COLUMN ax_bodenschaetzung.bodenart IS 'bodenart enumeration AX_Bodenart_Bodenschaetzung 1';
COMMENT ON COLUMN ax_bodenschaetzung.zustandsstufeoderbodenstufe IS 'zustandsstufeOderBodenstufe enumeration AX_ZustandsstufeOderBodenstufe_Bodenschaetzung 0..1';
COMMENT ON COLUMN ax_bodenschaetzung.entstehungsartoderklimastufewasserverhaeltnisse IS 'entstehungsartOderKlimastufeWasserverhaeltnisse enumeration AX_EntstehungsartOderKlimastufeWasserverhaeltnisse_Bodenschaetzung 0..*';
COMMENT ON COLUMN ax_bodenschaetzung.bodenzahlodergruenlandgrundzahl IS 'bodenzahlOderGruenlandgrundzahl  CharacterString 0..1';
COMMENT ON COLUMN ax_bodenschaetzung.ackerzahlodergruenlandzahl IS 'ackerzahlOderGruenlandzahl  CharacterString 0..1';
COMMENT ON COLUMN ax_bodenschaetzung.sonstigeangaben IS 'sonstigeAngaben enumeration AX_SonstigeAngaben_Bodenschaetzung 0..*';
COMMENT ON COLUMN ax_bodenschaetzung.jahreszahl IS 'jahreszahl  Integer 0..1';
COMMENT ON COLUMN ax_bodenschaetzung.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ta_curvecomponent (

) INHERITS (ag_objektmitgemeinsamergeometrie) WITH OIDS;

COMMENT ON TABLE ta_curvecomponent IS 'FeatureType: "TA_CurveComponent"';
CREATE TABLE IF NOT EXISTS ax_gewaesserstationierungsachse (
	qualitaetsangaben ax_dqmitdatenerhebung,
	artdergewaesserachse ax_artdergewaesserachse,
	name character varying,
	gewaesserkennzahl character varying,
	zweitname character varying,
	identnummer character varying,
	fliessrichtung boolean NOT NULL,
	inverszu_gehoertzubauwerk text[]
) INHERITS (ta_curvecomponent) WITH OIDS;

COMMENT ON TABLE ax_gewaesserstationierungsachse IS 'FeatureType: "AX_Gewaesserstationierungsachse"';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.artdergewaesserachse IS 'artDerGewaesserachse enumeration AX_ArtDerGewaesserachse 0..1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.gewaesserkennzahl IS 'gewaesserkennzahl  CharacterString 0..1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.zweitname IS 'zweitname  CharacterString 0..1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.identnummer IS 'identnummer  CharacterString 0..1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.fliessrichtung IS 'fliessrichtung  Boolean 1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
CREATE TABLE IF NOT EXISTS ax_besondereflurstuecksgrenze (
	artderflurstuecksgrenze ax_artderflurstuecksgrenze_besondereflurstuecksgrenze[] NOT NULL
) INHERITS (ta_curvecomponent) WITH OIDS;

COMMENT ON TABLE ax_besondereflurstuecksgrenze IS 'FeatureType: "AX_BesondereFlurstuecksgrenze"';
COMMENT ON COLUMN ax_besondereflurstuecksgrenze.artderflurstuecksgrenze IS 'artDerFlurstuecksgrenze enumeration AX_ArtDerFlurstuecksgrenze_BesondereFlurstuecksgrenze 1..*';
CREATE TABLE IF NOT EXISTS ax_gebietsgrenze (
	artdergebietsgrenze ax_artdergebietsgrenze_gebietsgrenze[] NOT NULL
) INHERITS (ta_curvecomponent) WITH OIDS;

COMMENT ON TABLE ax_gebietsgrenze IS 'FeatureType: "AX_Gebietsgrenze"';
COMMENT ON COLUMN ax_gebietsgrenze.artdergebietsgrenze IS 'artDerGebietsgrenze enumeration AX_ArtDerGebietsgrenze_Gebietsgrenze 1..*';
CREATE TABLE IF NOT EXISTS ax_gewaesserachse (
	breitedesgewaessers integer,
	hydrologischesmerkmal ax_hydrologischesmerkmal_gewaesserachse,
	funktion ax_funktion_gewaesserachse,
	zustand ax_zustand_kanal,
	fliessrichtung boolean NOT NULL
) INHERITS (ta_curvecomponent) WITH OIDS;

COMMENT ON TABLE ax_gewaesserachse IS 'FeatureType: "AX_Gewaesserachse"';
COMMENT ON COLUMN ax_gewaesserachse.breitedesgewaessers IS 'breiteDesGewaessers  Integer 0..1';
COMMENT ON COLUMN ax_gewaesserachse.hydrologischesmerkmal IS 'hydrologischesMerkmal enumeration AX_HydrologischesMerkmal_Gewaesserachse 0..1';
COMMENT ON COLUMN ax_gewaesserachse.funktion IS 'funktion enumeration AX_Funktion_Gewaesserachse 0..1';
COMMENT ON COLUMN ax_gewaesserachse.zustand IS 'zustand enumeration AX_Zustand_Kanal 0..1';
COMMENT ON COLUMN ax_gewaesserachse.fliessrichtung IS 'fliessrichtung  Boolean 1';
CREATE TABLE IF NOT EXISTS ax_strassenachse (
	verkehrsbedeutunginneroertlich ax_verkehrsbedeutunginneroertlich,
	verkehrsbedeutungueberoertlich ax_verkehrsbedeutungueberoertlich,
	besonderefahrstreifen ax_besonderefahrstreifen,
	breitederfahrbahn double precision,
	breitedesverkehrsweges integer,
	funktion ax_funktion_strassenachse,
	anzahlderfahrstreifen integer,
	zustand ax_zustand,
	oberflaechenmaterial ax_oberflaechenmaterial_strasse
) INHERITS (ta_curvecomponent) WITH OIDS;

COMMENT ON TABLE ax_strassenachse IS 'FeatureType: "AX_Strassenachse"';
COMMENT ON COLUMN ax_strassenachse.verkehrsbedeutunginneroertlich IS 'verkehrsbedeutungInneroertlich enumeration AX_VerkehrsbedeutungInneroertlich 0..1';
COMMENT ON COLUMN ax_strassenachse.verkehrsbedeutungueberoertlich IS 'verkehrsbedeutungUeberoertlich enumeration AX_VerkehrsbedeutungUeberoertlich 0..1';
COMMENT ON COLUMN ax_strassenachse.besonderefahrstreifen IS 'besondereFahrstreifen enumeration AX_BesondereFahrstreifen 0..1';
COMMENT ON COLUMN ax_strassenachse.breitederfahrbahn IS 'breiteDerFahrbahn  Length 0..1';
COMMENT ON COLUMN ax_strassenachse.breitedesverkehrsweges IS 'breiteDesVerkehrsweges  Integer 0..1';
COMMENT ON COLUMN ax_strassenachse.funktion IS 'funktion enumeration AX_Funktion_Strassenachse 0..1';
COMMENT ON COLUMN ax_strassenachse.anzahlderfahrstreifen IS 'anzahlDerFahrstreifen  Integer 0..1';
COMMENT ON COLUMN ax_strassenachse.zustand IS 'zustand enumeration AX_Zustand 0..1';
COMMENT ON COLUMN ax_strassenachse.oberflaechenmaterial IS 'oberflaechenmaterial enumeration AX_Oberflaechenmaterial_Strasse 0..1';
CREATE TABLE IF NOT EXISTS ax_bahnstrecke (
	bahnkategorie ax_bahnkategorie[] NOT NULL,
	elektrifizierung ax_elektrifizierung NOT NULL,
	anzahlderstreckengleise ax_anzahlderstreckengleise NOT NULL,
	nummerderbahnstrecke character varying[],
	name character varying,
	zweitname character varying,
	spurweite ax_spurweite NOT NULL,
	zustand ax_zustand
) INHERITS (ta_curvecomponent) WITH OIDS;

COMMENT ON TABLE ax_bahnstrecke IS 'FeatureType: "AX_Bahnstrecke"';
COMMENT ON COLUMN ax_bahnstrecke.bahnkategorie IS 'bahnkategorie enumeration AX_Bahnkategorie 1..*';
COMMENT ON COLUMN ax_bahnstrecke.elektrifizierung IS 'elektrifizierung enumeration AX_Elektrifizierung 1';
COMMENT ON COLUMN ax_bahnstrecke.anzahlderstreckengleise IS 'anzahlDerStreckengleise enumeration AX_AnzahlDerStreckengleise 1';
COMMENT ON COLUMN ax_bahnstrecke.nummerderbahnstrecke IS 'nummerDerBahnstrecke  CharacterString 0..*';
COMMENT ON COLUMN ax_bahnstrecke.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_bahnstrecke.zweitname IS 'zweitname  CharacterString 0..1';
COMMENT ON COLUMN ax_bahnstrecke.spurweite IS 'spurweite enumeration AX_Spurweite 1';
COMMENT ON COLUMN ax_bahnstrecke.zustand IS 'zustand enumeration AX_Zustand 0..1';
CREATE TABLE IF NOT EXISTS ax_fahrwegachse (
	befestigung ax_befestigung_fahrwegachse,
	breitedesverkehrsweges integer,
	markierung ax_markierung_wegachse,
	name character varying,
	funktion ax_funktion_wegachse NOT NULL,
	strassenschluessel character varying,
	zweitname character varying
) INHERITS (ta_curvecomponent) WITH OIDS;

COMMENT ON TABLE ax_fahrwegachse IS 'FeatureType: "AX_Fahrwegachse"';
COMMENT ON COLUMN ax_fahrwegachse.befestigung IS 'befestigung enumeration AX_Befestigung_Fahrwegachse 0..1';
COMMENT ON COLUMN ax_fahrwegachse.breitedesverkehrsweges IS 'breiteDesVerkehrsweges  Integer 0..1';
COMMENT ON COLUMN ax_fahrwegachse.markierung IS 'markierung enumeration AX_Markierung_Wegachse 0..1';
COMMENT ON COLUMN ax_fahrwegachse.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_fahrwegachse.funktion IS 'funktion enumeration AX_Funktion_Wegachse 1';
COMMENT ON COLUMN ax_fahrwegachse.strassenschluessel IS 'strassenschluessel  CharacterString 0..1';
COMMENT ON COLUMN ax_fahrwegachse.zweitname IS 'zweitname  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_fahrbahnachse (
	besonderefahrstreifen ax_besonderefahrstreifen,
	breitederfahrbahn double precision,
	funktion ax_funktion_fahrbahnachse,
	anzahlderfahrstreifen integer,
	zustand ax_zustand,
	oberflaechenmaterial ax_oberflaechenmaterial_strasse
) INHERITS (ta_curvecomponent) WITH OIDS;

COMMENT ON TABLE ax_fahrbahnachse IS 'FeatureType: "AX_Fahrbahnachse"';
COMMENT ON COLUMN ax_fahrbahnachse.besonderefahrstreifen IS 'besondereFahrstreifen enumeration AX_BesondereFahrstreifen 0..1';
COMMENT ON COLUMN ax_fahrbahnachse.breitederfahrbahn IS 'breiteDerFahrbahn  Length 0..1';
COMMENT ON COLUMN ax_fahrbahnachse.funktion IS 'funktion enumeration AX_Funktion_Fahrbahnachse 0..1';
COMMENT ON COLUMN ax_fahrbahnachse.anzahlderfahrstreifen IS 'anzahlDerFahrstreifen  Integer 0..1';
COMMENT ON COLUMN ax_fahrbahnachse.zustand IS 'zustand enumeration AX_Zustand 0..1';
COMMENT ON COLUMN ax_fahrbahnachse.oberflaechenmaterial IS 'oberflaechenmaterial enumeration AX_Oberflaechenmaterial_Strasse 0..1';
CREATE TABLE IF NOT EXISTS ta_pointcomponent (

) INHERITS (ag_objektmitgemeinsamergeometrie) WITH OIDS;

COMMENT ON TABLE ta_pointcomponent IS 'FeatureType: "TA_PointComponent"';
CREATE TABLE IF NOT EXISTS ax_punktortta (
	kartendarstellung boolean,
	koordinatenstatus ax_koordinatenstatus_punktort,
	ueberpruefungsdatum date,
	hinweise character varying,
	qualitaetsangaben ax_dqpunktort
) INHERITS (ta_pointcomponent) WITH OIDS;

COMMENT ON TABLE ax_punktortta IS 'FeatureType: "AX_PunktortTA"';
COMMENT ON COLUMN ax_punktortta.kartendarstellung IS 'kartendarstellung  Boolean 0..1';
COMMENT ON COLUMN ax_punktortta.koordinatenstatus IS 'koordinatenstatus enumeration AX_Koordinatenstatus_Punktort 0..1';
COMMENT ON COLUMN ax_punktortta.ueberpruefungsdatum IS 'ueberpruefungsdatum  Date 0..1';
COMMENT ON COLUMN ax_punktortta.hinweise IS 'hinweise  CharacterString 0..1';
COMMENT ON COLUMN ax_punktortta.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQPunktort 0..1';
CREATE TABLE IF NOT EXISTS ta_surfacecomponent (

) INHERITS (ag_objektmitgemeinsamergeometrie) WITH OIDS;

COMMENT ON TABLE ta_surfacecomponent IS 'FeatureType: "TA_SurfaceComponent"';
CREATE TABLE IF NOT EXISTS ax_tatsaechlichenutzung (
	datumderletztenueberpruefung timestamp without time zone,
	qualitaetsangaben ax_dqmitdatenerhebung
) INHERITS (ta_surfacecomponent) WITH OIDS;

COMMENT ON TABLE ax_tatsaechlichenutzung IS 'FeatureType: "AX_TatsaechlicheNutzung"';
COMMENT ON COLUMN ax_tatsaechlichenutzung.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung  DateTime 0..1';
COMMENT ON COLUMN ax_tatsaechlichenutzung.qualitaetsangaben IS 'qualitaetsangaben DataType AX_DQMitDatenerhebung 0..1';
CREATE TABLE IF NOT EXISTS ax_stehendesgewaesser (
	funktion ax_funktion_stehendesgewaesser,
	name ax_lagebezeichnung,
	gewaesserkennziffer character varying,
	hydrologischesmerkmal ax_hydrologischesmerkmal_stehendesgewaesser,
	widmung ax_widmung_stehendesgewaesser,
	schifffahrtskategorie ax_schifffahrtskategorie,
	bezeichnung character varying
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_stehendesgewaesser IS 'FeatureType: "AX_StehendesGewaesser"';
COMMENT ON COLUMN ax_stehendesgewaesser.funktion IS 'funktion enumeration AX_Funktion_StehendesGewaesser 0..1';
COMMENT ON COLUMN ax_stehendesgewaesser.name IS 'name union AX_Lagebezeichnung 0..1';
COMMENT ON COLUMN ax_stehendesgewaesser.gewaesserkennziffer IS 'gewaesserkennziffer  CharacterString 0..1';
COMMENT ON COLUMN ax_stehendesgewaesser.hydrologischesmerkmal IS 'hydrologischesMerkmal enumeration AX_HydrologischesMerkmal_StehendesGewaesser 0..1';
COMMENT ON COLUMN ax_stehendesgewaesser.widmung IS 'widmung enumeration AX_Widmung_StehendesGewaesser 0..1';
COMMENT ON COLUMN ax_stehendesgewaesser.schifffahrtskategorie IS 'schifffahrtskategorie enumeration AX_Schifffahrtskategorie 0..1';
COMMENT ON COLUMN ax_stehendesgewaesser.bezeichnung IS 'bezeichnung  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_meer (
	funktion ax_funktion_meer,
	name ax_lagebezeichnung,
	bezeichnung character varying,
	tidemerkmal ax_tidemerkmal_meer,
	zweitname character varying[]
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_meer IS 'FeatureType: "AX_Meer"';
COMMENT ON COLUMN ax_meer.funktion IS 'funktion enumeration AX_Funktion_Meer 0..1';
COMMENT ON COLUMN ax_meer.name IS 'name union AX_Lagebezeichnung 0..1';
COMMENT ON COLUMN ax_meer.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_meer.tidemerkmal IS 'tidemerkmal enumeration AX_Tidemerkmal_Meer 0..1';
COMMENT ON COLUMN ax_meer.zweitname IS 'zweitname  CharacterString 0..*';
CREATE TABLE IF NOT EXISTS ax_fliessgewaesser (
	funktion ax_funktion_fliessgewaesser,
	name ax_lagebezeichnung,
	zustand ax_zustand_kanal,
	hydrologischesmerkmal ax_hydrologischesmerkmal_fliessgewaesser
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_fliessgewaesser IS 'FeatureType: "AX_Fliessgewaesser"';
COMMENT ON COLUMN ax_fliessgewaesser.funktion IS 'funktion enumeration AX_Funktion_Fliessgewaesser 0..1';
COMMENT ON COLUMN ax_fliessgewaesser.name IS 'name union AX_Lagebezeichnung 0..1';
COMMENT ON COLUMN ax_fliessgewaesser.zustand IS 'zustand enumeration AX_Zustand_Kanal 0..1';
COMMENT ON COLUMN ax_fliessgewaesser.hydrologischesmerkmal IS 'hydrologischesMerkmal enumeration AX_HydrologischesMerkmal_Fliessgewaesser 0..1';
CREATE TABLE IF NOT EXISTS ax_hafenbecken (
	funktion ax_funktion_hafenbecken,
	name ax_lagebezeichnung,
	nutzung ax_nutzung_hafenbecken
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_hafenbecken IS 'FeatureType: "AX_Hafenbecken"';
COMMENT ON COLUMN ax_hafenbecken.funktion IS 'funktion enumeration AX_Funktion_Hafenbecken 0..1';
COMMENT ON COLUMN ax_hafenbecken.name IS 'name union AX_Lagebezeichnung 0..1';
COMMENT ON COLUMN ax_hafenbecken.nutzung IS 'nutzung enumeration AX_Nutzung_Hafenbecken 0..1';
CREATE TABLE IF NOT EXISTS ax_bergbaubetrieb (
	name character varying,
	bezeichnung character varying,
	abbaugut ax_abbaugut_bergbaubetrieb,
	zustand ax_zustand_bergbaubetrieb
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_bergbaubetrieb IS 'FeatureType: "AX_Bergbaubetrieb"';
COMMENT ON COLUMN ax_bergbaubetrieb.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_bergbaubetrieb.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_bergbaubetrieb.abbaugut IS 'abbaugut enumeration AX_Abbaugut_Bergbaubetrieb 0..1';
COMMENT ON COLUMN ax_bergbaubetrieb.zustand IS 'zustand enumeration AX_Zustand_Bergbaubetrieb 0..1';
CREATE TABLE IF NOT EXISTS ax_friedhof (
	funktion ax_funktion_friedhof,
	name character varying,
	zustand ax_zustand_friedhof
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_friedhof IS 'FeatureType: "AX_Friedhof"';
COMMENT ON COLUMN ax_friedhof.funktion IS 'funktion enumeration AX_Funktion_Friedhof 0..1';
COMMENT ON COLUMN ax_friedhof.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_friedhof.zustand IS 'zustand enumeration AX_Zustand_Friedhof 0..1';
CREATE TABLE IF NOT EXISTS ax_flaechegemischternutzung (
	artderbebauung ax_artderbebauung_flaechegemischternutzung,
	funktion ax_funktion_flaechegemischternutzung,
	name character varying,
	zustand ax_zustand_flaechegemischternutzung
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_flaechegemischternutzung IS 'FeatureType: "AX_FlaecheGemischterNutzung"';
COMMENT ON COLUMN ax_flaechegemischternutzung.artderbebauung IS 'artDerBebauung enumeration AX_ArtDerBebauung_FlaecheGemischterNutzung 0..1';
COMMENT ON COLUMN ax_flaechegemischternutzung.funktion IS 'funktion enumeration AX_Funktion_FlaecheGemischterNutzung 0..1';
COMMENT ON COLUMN ax_flaechegemischternutzung.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_flaechegemischternutzung.zustand IS 'zustand enumeration AX_Zustand_FlaecheGemischterNutzung 0..1';
CREATE TABLE IF NOT EXISTS ax_wohnbauflaeche (
	artderbebauung ax_artderbebauung_wohnbauflaeche,
	name character varying,
	zustand ax_zustand_wohnbauflaeche,
	zweitname character varying
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_wohnbauflaeche IS 'FeatureType: "AX_Wohnbauflaeche"';
COMMENT ON COLUMN ax_wohnbauflaeche.artderbebauung IS 'artDerBebauung enumeration AX_ArtDerBebauung_Wohnbauflaeche 0..1';
COMMENT ON COLUMN ax_wohnbauflaeche.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_wohnbauflaeche.zustand IS 'zustand enumeration AX_Zustand_Wohnbauflaeche 0..1';
COMMENT ON COLUMN ax_wohnbauflaeche.zweitname IS 'zweitname  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_flaechebesondererfunktionalerpraegung (
	funktion ax_funktion_flaechebesondererfunktionalerpraegung,
	artderbebauung ax_artderbebauung_flaechebesondererfunktionalerpraegung,
	name character varying,
	zustand ax_zustand_flaechebesondererfunktionalerpraegung
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_flaechebesondererfunktionalerpraegung IS 'FeatureType: "AX_FlaecheBesondererFunktionalerPraegung"';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.funktion IS 'funktion enumeration AX_Funktion_FlaecheBesondererFunktionalerPraegung 0..1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.artderbebauung IS 'artDerBebauung enumeration AX_ArtDerBebauung_FlaecheBesondererFunktionalerPraegung 0..1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.zustand IS 'zustand enumeration AX_Zustand_FlaecheBesondererFunktionalerPraegung 0..1';
CREATE TABLE IF NOT EXISTS ax_industrieundgewerbeflaeche (
	funktion ax_funktion_industrieundgewerbeflaeche,
	name character varying,
	bezeichnung character varying,
	foerdergut ax_foerdergut_industrieundgewerbeflaeche,
	lagergut ax_lagergut_industrieundgewerbeflaeche,
	primaerenergie ax_primaerenergie_industrieundgewerbeflaeche,
	zustand ax_zustand_industrieundgewerbeflaeche
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_industrieundgewerbeflaeche IS 'FeatureType: "AX_IndustrieUndGewerbeflaeche"';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.funktion IS 'funktion enumeration AX_Funktion_IndustrieUndGewerbeflaeche 0..1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.foerdergut IS 'foerdergut enumeration AX_Foerdergut_IndustrieUndGewerbeflaeche 0..1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.lagergut IS 'lagergut enumeration AX_Lagergut_IndustrieUndGewerbeflaeche 0..1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.primaerenergie IS 'primaerenergie enumeration AX_Primaerenergie_IndustrieUndGewerbeflaeche 0..1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.zustand IS 'zustand enumeration AX_Zustand_IndustrieUndGewerbeflaeche 0..1';
CREATE TABLE IF NOT EXISTS ax_siedlungsflaeche (
	artderbebauung ax_artderbebauung_siedlungsflaeche,
	name character varying
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_siedlungsflaeche IS 'FeatureType: "AX_Siedlungsflaeche"';
COMMENT ON COLUMN ax_siedlungsflaeche.artderbebauung IS 'artDerBebauung enumeration AX_ArtDerBebauung_Siedlungsflaeche 0..1';
COMMENT ON COLUMN ax_siedlungsflaeche.name IS 'name  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_tagebaugrubesteinbruch (
	name character varying,
	abbaugut ax_abbaugut_tagebaugrubesteinbruch,
	zustand ax_zustand_tagebaugrubesteinbruch,
	bezeichnung character varying
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_tagebaugrubesteinbruch IS 'FeatureType: "AX_TagebauGrubeSteinbruch"';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.abbaugut IS 'abbaugut enumeration AX_Abbaugut_TagebauGrubeSteinbruch 0..1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.zustand IS 'zustand enumeration AX_Zustand_TagebauGrubeSteinbruch 0..1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.bezeichnung IS 'bezeichnung  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_sportfreizeitunderholungsflaeche (
	funktion ax_funktion_sportfreizeitunderholungsflaeche,
	name character varying,
	zustand ax_zustand_sportfreizeitunderholungsflaeche,
	bezeichnung character varying[]
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_sportfreizeitunderholungsflaeche IS 'FeatureType: "AX_SportFreizeitUndErholungsflaeche"';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.funktion IS 'funktion enumeration AX_Funktion_SportFreizeitUndErholungsflaeche 0..1';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.zustand IS 'zustand enumeration AX_Zustand_SportFreizeitUndErholungsflaeche 0..1';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.bezeichnung IS 'bezeichnung  CharacterString 0..*';
CREATE TABLE IF NOT EXISTS ax_halde (
	name character varying,
	lagergut ax_lagergut_halde,
	zustand ax_zustand_halde
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_halde IS 'FeatureType: "AX_Halde"';
COMMENT ON COLUMN ax_halde.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_halde.lagergut IS 'lagergut enumeration AX_Lagergut_Halde 0..1';
COMMENT ON COLUMN ax_halde.zustand IS 'zustand enumeration AX_Zustand_Halde 0..1';
CREATE TABLE IF NOT EXISTS ax_flaechezurzeitunbestimmbar (

) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_flaechezurzeitunbestimmbar IS 'FeatureType: "AX_FlaecheZurZeitUnbestimmbar"';
CREATE TABLE IF NOT EXISTS ax_sumpf (
	name character varying
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_sumpf IS 'FeatureType: "AX_Sumpf"';
COMMENT ON COLUMN ax_sumpf.name IS 'name  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_unlandvegetationsloseflaeche (
	oberflaechenmaterial ax_oberflaechenmaterial_unlandvegetationsloseflaeche,
	name character varying,
	funktion ax_funktion_unlandvegetationsloseflaeche
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_unlandvegetationsloseflaeche IS 'FeatureType: "AX_UnlandVegetationsloseFlaeche"';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.oberflaechenmaterial IS 'oberflaechenmaterial enumeration AX_Oberflaechenmaterial_UnlandVegetationsloseFlaeche 0..1';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.funktion IS 'funktion enumeration AX_Funktion_UnlandVegetationsloseFlaeche 0..1';
CREATE TABLE IF NOT EXISTS ax_gehoelz (
	vegetationsmerkmal ax_vegetationsmerkmal_gehoelz,
	name character varying,
	funktion ax_funktion_gehoelz
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_gehoelz IS 'FeatureType: "AX_Gehoelz"';
COMMENT ON COLUMN ax_gehoelz.vegetationsmerkmal IS 'vegetationsmerkmal enumeration AX_Vegetationsmerkmal_Gehoelz 0..1';
COMMENT ON COLUMN ax_gehoelz.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_gehoelz.funktion IS 'funktion enumeration AX_Funktion_Gehoelz 0..1';
CREATE TABLE IF NOT EXISTS ax_wald (
	vegetationsmerkmal ax_vegetationsmerkmal_wald,
	name character varying,
	bezeichnung character varying
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_wald IS 'FeatureType: "AX_Wald"';
COMMENT ON COLUMN ax_wald.vegetationsmerkmal IS 'vegetationsmerkmal enumeration AX_Vegetationsmerkmal_Wald 0..1';
COMMENT ON COLUMN ax_wald.name IS 'name  CharacterString 0..1';
COMMENT ON COLUMN ax_wald.bezeichnung IS 'bezeichnung  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_heide (
	name character varying
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_heide IS 'FeatureType: "AX_Heide"';
COMMENT ON COLUMN ax_heide.name IS 'name  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_moor (
	name character varying
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_moor IS 'FeatureType: "AX_Moor"';
COMMENT ON COLUMN ax_moor.name IS 'name  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_landwirtschaft (
	vegetationsmerkmal ax_vegetationsmerkmal_landwirtschaft,
	name character varying
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_landwirtschaft IS 'FeatureType: "AX_Landwirtschaft"';
COMMENT ON COLUMN ax_landwirtschaft.vegetationsmerkmal IS 'vegetationsmerkmal enumeration AX_Vegetationsmerkmal_Landwirtschaft 0..1';
COMMENT ON COLUMN ax_landwirtschaft.name IS 'name  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_bahnverkehr (
	funktion ax_funktion_bahnverkehr,
	bahnkategorie ax_bahnkategorie[],
	bezeichnung ax_lagebezeichnung,
	nummerderbahnstrecke character varying,
	zweitname character varying,
	zustand ax_zustand_bahnverkehr
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_bahnverkehr IS 'FeatureType: "AX_Bahnverkehr"';
COMMENT ON COLUMN ax_bahnverkehr.funktion IS 'funktion enumeration AX_Funktion_Bahnverkehr 0..1';
COMMENT ON COLUMN ax_bahnverkehr.bahnkategorie IS 'bahnkategorie enumeration AX_Bahnkategorie 0..*';
COMMENT ON COLUMN ax_bahnverkehr.bezeichnung IS 'bezeichnung union AX_Lagebezeichnung 0..1';
COMMENT ON COLUMN ax_bahnverkehr.nummerderbahnstrecke IS 'nummerDerBahnstrecke  CharacterString 0..1';
COMMENT ON COLUMN ax_bahnverkehr.zweitname IS 'zweitname  CharacterString 0..1';
COMMENT ON COLUMN ax_bahnverkehr.zustand IS 'zustand enumeration AX_Zustand_Bahnverkehr 0..1';
CREATE TABLE IF NOT EXISTS ax_weg (
	funktion ax_funktion_weg,
	name ax_lagebezeichnung,
	bezeichnung character varying
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_weg IS 'FeatureType: "AX_Weg"';
COMMENT ON COLUMN ax_weg.funktion IS 'funktion enumeration AX_Funktion_Weg 0..1';
COMMENT ON COLUMN ax_weg.name IS 'name union AX_Lagebezeichnung 0..1';
COMMENT ON COLUMN ax_weg.bezeichnung IS 'bezeichnung  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_schiffsverkehr (
	funktion ax_funktion_schiffsverkehr,
	name ax_lagebezeichnung,
	zustand ax_zustand_schiffsverkehr
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_schiffsverkehr IS 'FeatureType: "AX_Schiffsverkehr"';
COMMENT ON COLUMN ax_schiffsverkehr.funktion IS 'funktion enumeration AX_Funktion_Schiffsverkehr 0..1';
COMMENT ON COLUMN ax_schiffsverkehr.name IS 'name union AX_Lagebezeichnung 0..1';
COMMENT ON COLUMN ax_schiffsverkehr.zustand IS 'zustand enumeration AX_Zustand_Schiffsverkehr 0..1';
CREATE TABLE IF NOT EXISTS ax_flugverkehr (
	funktion ax_funktion_flugverkehr,
	art ax_art_flugverkehr,
	name ax_lagebezeichnung,
	bezeichnung character varying,
	nutzung ax_nutzung_flugverkehr,
	zustand ax_zustand_flugverkehr
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_flugverkehr IS 'FeatureType: "AX_Flugverkehr"';
COMMENT ON COLUMN ax_flugverkehr.funktion IS 'funktion enumeration AX_Funktion_Flugverkehr 0..1';
COMMENT ON COLUMN ax_flugverkehr.art IS 'art enumeration AX_Art_Flugverkehr 0..1';
COMMENT ON COLUMN ax_flugverkehr.name IS 'name union AX_Lagebezeichnung 0..1';
COMMENT ON COLUMN ax_flugverkehr.bezeichnung IS 'bezeichnung  CharacterString 0..1';
COMMENT ON COLUMN ax_flugverkehr.nutzung IS 'nutzung enumeration AX_Nutzung_Flugverkehr 0..1';
COMMENT ON COLUMN ax_flugverkehr.zustand IS 'zustand enumeration AX_Zustand_Flugverkehr 0..1';
CREATE TABLE IF NOT EXISTS ax_platz (
	funktion ax_funktion_platz,
	name ax_lagebezeichnung,
	strassenschluessel character varying,
	zweitname character varying
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_platz IS 'FeatureType: "AX_Platz"';
COMMENT ON COLUMN ax_platz.funktion IS 'funktion enumeration AX_Funktion_Platz 0..1';
COMMENT ON COLUMN ax_platz.name IS 'name union AX_Lagebezeichnung 0..1';
COMMENT ON COLUMN ax_platz.strassenschluessel IS 'strassenschluessel  CharacterString 0..1';
COMMENT ON COLUMN ax_platz.zweitname IS 'zweitname  CharacterString 0..1';
CREATE TABLE IF NOT EXISTS ax_strassenverkehr (
	funktion ax_funktion_strasse,
	name ax_lagebezeichnung,
	zweitname character varying,
	zustand ax_zustand_strasse
) INHERITS (ax_tatsaechlichenutzung) WITH OIDS;

COMMENT ON TABLE ax_strassenverkehr IS 'FeatureType: "AX_Strassenverkehr"';
COMMENT ON COLUMN ax_strassenverkehr.funktion IS 'funktion enumeration AX_Funktion_Strasse 0..1';
COMMENT ON COLUMN ax_strassenverkehr.name IS 'name union AX_Lagebezeichnung 0..1';
COMMENT ON COLUMN ax_strassenverkehr.zweitname IS 'zweitname  CharacterString 0..1';
COMMENT ON COLUMN ax_strassenverkehr.zustand IS 'zustand enumeration AX_Zustand_Strasse 0..1';
CREATE TABLE IF NOT EXISTS aa_reo_3d (
	levelofdetail aa_levelofdetail NOT NULL,
	detailliert  text,
	generalisiert  text
) INHERITS (aa_objekt) WITH OIDS;

COMMENT ON TABLE aa_reo_3d IS 'FeatureType: "AA_REO_3D"';
COMMENT ON COLUMN aa_reo_3d.levelofdetail IS 'levelOfDetail codeList AA_LevelOfDetail 1';
COMMENT ON COLUMN aa_reo_3d.detailliert  IS 'Assoziation zu: FeatureType AA_REO_3D (aa_reo_3d) 0..1';
COMMENT ON COLUMN aa_reo_3d.generalisiert  IS 'Assoziation zu: FeatureType AA_REO_3D (aa_reo_3d) 0..1';
CREATE TABLE IF NOT EXISTS ta_component_3d (

) INHERITS (aa_reo_3d) WITH OIDS;

COMMENT ON TABLE ta_component_3d IS 'FeatureType: "TA_Component_3D"';
CREATE TABLE IF NOT EXISTS ta_compositesolidcomponent_3d (

) INHERITS (ta_component_3d) WITH OIDS;

COMMENT ON TABLE ta_compositesolidcomponent_3d IS 'FeatureType: "TA_CompositeSolidComponent_3D"';
CREATE TABLE IF NOT EXISTS ta_surfacecomponent_3d (

) INHERITS (ta_component_3d) WITH OIDS;

COMMENT ON TABLE ta_surfacecomponent_3d IS 'FeatureType: "TA_SurfaceComponent_3D"';
CREATE TABLE IF NOT EXISTS ta_curvecomponent_3d (

) INHERITS (ta_component_3d) WITH OIDS;

COMMENT ON TABLE ta_curvecomponent_3d IS 'FeatureType: "TA_CurveComponent_3D"';
CREATE TABLE IF NOT EXISTS ta_pointcomponent_3d (

) INHERITS (ta_component_3d) WITH OIDS;

COMMENT ON TABLE ta_pointcomponent_3d IS 'FeatureType: "TA_PointComponent_3D"';
CREATE TABLE IF NOT EXISTS au_objektmitunabhaengigergeometrie_3d (

) INHERITS (aa_reo_3d) WITH OIDS;

COMMENT ON TABLE au_objektmitunabhaengigergeometrie_3d IS 'FeatureType: "AU_ObjektMitUnabhaengigerGeometrie_3D"';
CREATE TABLE IF NOT EXISTS au_trianguliertesoberflaechenobjekt_3d (
	position geometry(MULTIPOLYGON) NOT NULL
) INHERITS (au_objektmitunabhaengigergeometrie_3d) WITH OIDS;

COMMENT ON TABLE au_trianguliertesoberflaechenobjekt_3d IS 'FeatureType: "AU_TrianguliertesOberflaechenObjekt_3D"';
COMMENT ON COLUMN au_trianguliertesoberflaechenobjekt_3d.position IS 'position  GM_TriangulatedSurface 1';
CREATE TABLE IF NOT EXISTS au_mehrfachflaechenobjekt_3d (
	position geometry NOT NULL
) INHERITS (au_objektmitunabhaengigergeometrie_3d) WITH OIDS;

COMMENT ON TABLE au_mehrfachflaechenobjekt_3d IS 'FeatureType: "AU_MehrfachFlaechenObjekt_3D"';
COMMENT ON COLUMN au_mehrfachflaechenobjekt_3d.position IS 'position  GM_Object 1';
CREATE TABLE IF NOT EXISTS au_mehrfachlinienobjekt_3d (
	position geometry NOT NULL
) INHERITS (au_objektmitunabhaengigergeometrie_3d) WITH OIDS;

COMMENT ON TABLE au_mehrfachlinienobjekt_3d IS 'FeatureType: "AU_MehrfachLinienObjekt_3D"';
COMMENT ON COLUMN au_mehrfachlinienobjekt_3d.position IS 'position  GM_Object 1';
CREATE TABLE IF NOT EXISTS au_umringobjekt_3d (
	position geometry(MULTILINESTRING) NOT NULL
) INHERITS (au_objektmitunabhaengigergeometrie_3d) WITH OIDS;

COMMENT ON TABLE au_umringobjekt_3d IS 'FeatureType: "AU_UmringObjekt_3D"';
COMMENT ON COLUMN au_umringobjekt_3d.position IS 'position  GM_MultiCurve 1';
CREATE TABLE IF NOT EXISTS au_punktobjekt_3d (
	position geometry(POINT) NOT NULL
) INHERITS (au_objektmitunabhaengigergeometrie_3d) WITH OIDS;

COMMENT ON TABLE au_punktobjekt_3d IS 'FeatureType: "AU_Punktobjekt_3D"';
COMMENT ON COLUMN au_punktobjekt_3d.position IS 'position  GM_Point 1';
CREATE TABLE IF NOT EXISTS ap_kpo_3d (
	dateityp ap_dateityp_3d,
	referenzzumfremdobjekt character varying,
	transformationsmatrix ap_transformationsmatrix_3d,
	signaturnummer character varying,
	darstellungsprioritaet integer,
	art character varying,
	dientzurdarstellungvon text[]
) INHERITS (au_punktobjekt_3d) WITH OIDS;

COMMENT ON TABLE ap_kpo_3d IS 'FeatureType: "AP_KPO_3D"';
COMMENT ON COLUMN ap_kpo_3d.dateityp IS 'dateiTyp enumeration AP_DateiTyp_3D 0..1';
COMMENT ON COLUMN ap_kpo_3d.referenzzumfremdobjekt IS 'referenzZumFremdobjekt  URI 0..1';
COMMENT ON COLUMN ap_kpo_3d.transformationsmatrix IS 'transformationsMatrix DataType AP_TransformationsMatrix_3D 0..1';
COMMENT ON COLUMN ap_kpo_3d.signaturnummer IS 'signaturnummer  CharacterString 0..1';
COMMENT ON COLUMN ap_kpo_3d.darstellungsprioritaet IS 'darstellungsprioritaet  Integer 0..1';
COMMENT ON COLUMN ap_kpo_3d.art IS 'art  CharacterString 0..1';
COMMENT ON COLUMN ap_kpo_3d.dientzurdarstellungvon IS 'Assoziation zu: FeatureType AA_Objekt (aa_objekt) 0..*';
CREATE TABLE IF NOT EXISTS au_punkthaufenobjekt_3d (
	position geometry(MULTIPOINT) NOT NULL
) INHERITS (au_objektmitunabhaengigergeometrie_3d) WITH OIDS;

COMMENT ON TABLE au_punkthaufenobjekt_3d IS 'FeatureType: "AU_PunkthaufenObjekt_3D"';
COMMENT ON COLUMN au_punkthaufenobjekt_3d.position IS 'position  GM_MultiPoint 1';
CREATE TABLE IF NOT EXISTS au_koerperobjekt_3d (
	position geometry(MULTIPOLYGON) NOT NULL
) INHERITS (au_objektmitunabhaengigergeometrie_3d) WITH OIDS;

COMMENT ON TABLE au_koerperobjekt_3d IS 'FeatureType: "AU_KoerperObjekt_3D"';
COMMENT ON COLUMN au_koerperobjekt_3d.position IS 'position  GM_Solid 1';
CREATE TABLE IF NOT EXISTS au_geometrieobjekt_3d (
	position geometry NOT NULL
) INHERITS (au_objektmitunabhaengigergeometrie_3d) WITH OIDS;

COMMENT ON TABLE au_geometrieobjekt_3d IS 'FeatureType: "AU_GeometrieObjekt_3D"';
COMMENT ON COLUMN au_geometrieobjekt_3d.position IS 'position  GM_Object 1';

CREATE TABLE IF NOT EXISTS aa_reo_zu_aa_reo (
	aa_reo_1_gml_id text,
	aa_reo_2_gml_id text,
	PRIMARY KEY (aa_reo_1_gml_id, aa_reo_2_gml_id)
);
COMMENT ON TABLE aa_reo_zu_aa_reo IS 'Association AA_REO _zu_ AA_REO';
COMMENT ON COLUMN aa_reo_zu_aa_reo.aa_reo_1_gml_id IS 'istAbgeleitetAus';
COMMENT ON COLUMN aa_reo_zu_aa_reo.aa_reo_2_gml_id IS 'traegtBeiZu';

CREATE TABLE IF NOT EXISTS aa_reo_zu_aa_reo_zu_ (
	aa_reo_1_gml_id text,
	aa_reo_2_gml_id text,
	PRIMARY KEY (aa_reo_1_gml_id, aa_reo_2_gml_id)
);
COMMENT ON TABLE aa_reo_zu_aa_reo_zu_ IS 'Association AA_REO _zu_ AA_REO';
COMMENT ON COLUMN aa_reo_zu_aa_reo_zu_.aa_reo_1_gml_id IS 'hatDirektUnten';
COMMENT ON COLUMN aa_reo_zu_aa_reo_zu_.aa_reo_2_gml_id IS 'inversZu_hatDirektUnten';

CREATE TABLE IF NOT EXISTS ap_lto_zu_aa_objekt (
	ap_lto_gml_id text,
	aa_objekt_gml_id text,
	PRIMARY KEY (ap_lto_gml_id, aa_objekt_gml_id)
);
COMMENT ON TABLE ap_lto_zu_aa_objekt IS 'Association AP_LTO _zu_ AA_Objekt';
COMMENT ON COLUMN ap_lto_zu_aa_objekt.ap_lto_gml_id IS 'dientZurDarstellungVon';
COMMENT ON COLUMN ap_lto_zu_aa_objekt.aa_objekt_gml_id IS 'inversZu_dientZurDarstellungVon_AP_LTO';

CREATE TABLE IF NOT EXISTS ap_lpo_zu_aa_objekt (
	ap_lpo_gml_id text,
	aa_objekt_gml_id text,
	PRIMARY KEY (ap_lpo_gml_id, aa_objekt_gml_id)
);
COMMENT ON TABLE ap_lpo_zu_aa_objekt IS 'Association AP_LPO _zu_ AA_Objekt';
COMMENT ON COLUMN ap_lpo_zu_aa_objekt.ap_lpo_gml_id IS 'dientZurDarstellungVon';
COMMENT ON COLUMN ap_lpo_zu_aa_objekt.aa_objekt_gml_id IS 'inversZu_dientZurDarstellungVon_AP_LPO';

CREATE TABLE IF NOT EXISTS ap_kpo_3d_zu_aa_objekt (
	ap_kpo_3d_gml_id text,
	aa_objekt_gml_id text,
	PRIMARY KEY (ap_kpo_3d_gml_id, aa_objekt_gml_id)
);
COMMENT ON TABLE ap_kpo_3d_zu_aa_objekt IS 'Association AP_KPO_3D _zu_ AA_Objekt';
COMMENT ON COLUMN ap_kpo_3d_zu_aa_objekt.ap_kpo_3d_gml_id IS 'dientZurDarstellungVon';
COMMENT ON COLUMN ap_kpo_3d_zu_aa_objekt.aa_objekt_gml_id IS 'inversZu_dientZurDarstellungVon_AP_KPO_3D';

CREATE TABLE IF NOT EXISTS ap_ppo_zu_aa_objekt (
	ap_ppo_gml_id text,
	aa_objekt_gml_id text,
	PRIMARY KEY (ap_ppo_gml_id, aa_objekt_gml_id)
);
COMMENT ON TABLE ap_ppo_zu_aa_objekt IS 'Association AP_PPO _zu_ AA_Objekt';
COMMENT ON COLUMN ap_ppo_zu_aa_objekt.ap_ppo_gml_id IS 'dientZurDarstellungVon';
COMMENT ON COLUMN ap_ppo_zu_aa_objekt.aa_objekt_gml_id IS 'inversZu_dientZurDarstellungVon_AP_PPO';

CREATE TABLE IF NOT EXISTS ap_darstellung_zu_aa_objekt (
	ap_darstellung_gml_id text,
	aa_objekt_gml_id text,
	PRIMARY KEY (ap_darstellung_gml_id, aa_objekt_gml_id)
);
COMMENT ON TABLE ap_darstellung_zu_aa_objekt IS 'Association AP_Darstellung _zu_ AA_Objekt';
COMMENT ON COLUMN ap_darstellung_zu_aa_objekt.ap_darstellung_gml_id IS 'dientZurDarstellungVon';
COMMENT ON COLUMN ap_darstellung_zu_aa_objekt.aa_objekt_gml_id IS 'inversZu_dientZurDarstellungVon_AP_Darstellung';

CREATE TABLE IF NOT EXISTS ap_fpo_zu_aa_objekt (
	ap_fpo_gml_id text,
	aa_objekt_gml_id text,
	PRIMARY KEY (ap_fpo_gml_id, aa_objekt_gml_id)
);
COMMENT ON TABLE ap_fpo_zu_aa_objekt IS 'Association AP_FPO _zu_ AA_Objekt';
COMMENT ON COLUMN ap_fpo_zu_aa_objekt.ap_fpo_gml_id IS 'dientZurDarstellungVon';
COMMENT ON COLUMN ap_fpo_zu_aa_objekt.aa_objekt_gml_id IS 'inversZu_dientZurDarstellungVon_AP_FPO';

CREATE TABLE IF NOT EXISTS ap_pto_zu_aa_objekt (
	ap_pto_gml_id text,
	aa_objekt_gml_id text,
	PRIMARY KEY (ap_pto_gml_id, aa_objekt_gml_id)
);
COMMENT ON TABLE ap_pto_zu_aa_objekt IS 'Association AP_PTO _zu_ AA_Objekt';
COMMENT ON COLUMN ap_pto_zu_aa_objekt.ap_pto_gml_id IS 'dientZurDarstellungVon';
COMMENT ON COLUMN ap_pto_zu_aa_objekt.aa_objekt_gml_id IS 'inversZu_dientZurDarstellungVon_AP_PTO';

CREATE TABLE IF NOT EXISTS aa_zuso_zu_aa_objekt (
	aa_zuso_gml_id text,
	aa_objekt_gml_id text,
	PRIMARY KEY (aa_zuso_gml_id, aa_objekt_gml_id)
);
COMMENT ON TABLE aa_zuso_zu_aa_objekt IS 'Association AA_ZUSO _zu_ AA_Objekt';
COMMENT ON COLUMN aa_zuso_zu_aa_objekt.aa_zuso_gml_id IS 'bestehtAus';
COMMENT ON COLUMN aa_zuso_zu_aa_objekt.aa_objekt_gml_id IS 'istTeilVon';

CREATE TABLE IF NOT EXISTS ax_flurstueck_zu_ax_vertretung (
	ax_flurstueck_gml_id text,
	ax_vertretung_gml_id text,
	PRIMARY KEY (ax_flurstueck_gml_id, ax_vertretung_gml_id)
);
COMMENT ON TABLE ax_flurstueck_zu_ax_vertretung IS 'Association AX_Flurstueck _zu_ AX_Vertretung';
COMMENT ON COLUMN ax_flurstueck_zu_ax_vertretung.ax_flurstueck_gml_id IS 'inversZu_beziehtSichAuf';
COMMENT ON COLUMN ax_flurstueck_zu_ax_vertretung.ax_vertretung_gml_id IS 'beziehtSichAuf';

CREATE TABLE IF NOT EXISTS ax_buchungsblatt_zu_ax_buchungsstelle (
	ax_buchungsblatt_gml_id text,
	ax_buchungsstelle_gml_id text,
	PRIMARY KEY (ax_buchungsblatt_gml_id, ax_buchungsstelle_gml_id)
);
COMMENT ON TABLE ax_buchungsblatt_zu_ax_buchungsstelle IS 'Association AX_Buchungsblatt _zu_ AX_Buchungsstelle';
COMMENT ON COLUMN ax_buchungsblatt_zu_ax_buchungsstelle.ax_buchungsblatt_gml_id IS 'inversZu_beziehtSichAuf';
COMMENT ON COLUMN ax_buchungsblatt_zu_ax_buchungsstelle.ax_buchungsstelle_gml_id IS 'beziehtSichAuf';

CREATE TABLE IF NOT EXISTS ax_flurstueck_zu_ax_buchungsstelle (
	ax_flurstueck_gml_id text,
	ax_buchungsstelle_gml_id text,
	PRIMARY KEY (ax_flurstueck_gml_id, ax_buchungsstelle_gml_id)
);
COMMENT ON TABLE ax_flurstueck_zu_ax_buchungsstelle IS 'Association AX_Flurstueck _zu_ AX_Buchungsstelle';
COMMENT ON COLUMN ax_flurstueck_zu_ax_buchungsstelle.ax_flurstueck_gml_id IS 'inversZu_verweistAuf';
COMMENT ON COLUMN ax_flurstueck_zu_ax_buchungsstelle.ax_buchungsstelle_gml_id IS 'verweistAuf';

CREATE TABLE IF NOT EXISTS ax_buchungsstelle_zu_ax_buchungsstelle (
	ax_buchungsstelle_1_gml_id text,
	ax_buchungsstelle_2_gml_id text,
	PRIMARY KEY (ax_buchungsstelle_1_gml_id, ax_buchungsstelle_2_gml_id)
);
COMMENT ON TABLE ax_buchungsstelle_zu_ax_buchungsstelle IS 'Association AX_Buchungsstelle _zu_ AX_Buchungsstelle';
COMMENT ON COLUMN ax_buchungsstelle_zu_ax_buchungsstelle.ax_buchungsstelle_1_gml_id IS 'inversZu_an';
COMMENT ON COLUMN ax_buchungsstelle_zu_ax_buchungsstelle.ax_buchungsstelle_2_gml_id IS 'an';

CREATE TABLE IF NOT EXISTS ax_buchungsstelle_zu_ax_buchungsstelle_zu_ (
	ax_buchungsstelle_1_gml_id text,
	ax_buchungsstelle_2_gml_id text,
	PRIMARY KEY (ax_buchungsstelle_1_gml_id, ax_buchungsstelle_2_gml_id)
);
COMMENT ON TABLE ax_buchungsstelle_zu_ax_buchungsstelle_zu_ IS 'Association AX_Buchungsstelle _zu_ AX_Buchungsstelle';
COMMENT ON COLUMN ax_buchungsstelle_zu_ax_buchungsstelle_zu_.ax_buchungsstelle_1_gml_id IS 'inversZu_durch';
COMMENT ON COLUMN ax_buchungsstelle_zu_ax_buchungsstelle_zu_.ax_buchungsstelle_2_gml_id IS 'durch';

CREATE TABLE IF NOT EXISTS ax_buchungsstelle_zu_ax_buchungsstelle_zu__zu_ (
	ax_buchungsstelle_1_gml_id text,
	ax_buchungsstelle_2_gml_id text,
	PRIMARY KEY (ax_buchungsstelle_1_gml_id, ax_buchungsstelle_2_gml_id)
);
COMMENT ON TABLE ax_buchungsstelle_zu_ax_buchungsstelle_zu__zu_ IS 'Association AX_Buchungsstelle _zu_ AX_Buchungsstelle';
COMMENT ON COLUMN ax_buchungsstelle_zu_ax_buchungsstelle_zu__zu_.ax_buchungsstelle_1_gml_id IS 'inversZu_zu';
COMMENT ON COLUMN ax_buchungsstelle_zu_ax_buchungsstelle_zu__zu_.ax_buchungsstelle_2_gml_id IS 'zu';

CREATE TABLE IF NOT EXISTS ax_buchungsstelle_zu_ax_buchungsstelle_zu__zu__zu_ (
	ax_buchungsstelle_1_gml_id text,
	ax_buchungsstelle_2_gml_id text,
	PRIMARY KEY (ax_buchungsstelle_1_gml_id, ax_buchungsstelle_2_gml_id)
);
COMMENT ON TABLE ax_buchungsstelle_zu_ax_buchungsstelle_zu__zu__zu_ IS 'Association AX_Buchungsstelle _zu_ AX_Buchungsstelle';
COMMENT ON COLUMN ax_buchungsstelle_zu_ax_buchungsstelle_zu__zu__zu_.ax_buchungsstelle_1_gml_id IS 'inversZu_hatVorgaenger';
COMMENT ON COLUMN ax_buchungsstelle_zu_ax_buchungsstelle_zu__zu__zu_.ax_buchungsstelle_2_gml_id IS 'hatVorgaenger';

CREATE TABLE IF NOT EXISTS ax_namensnummer_zu_ax_namensnummer (
	ax_namensnummer_1_gml_id text,
	ax_namensnummer_2_gml_id text,
	PRIMARY KEY (ax_namensnummer_1_gml_id, ax_namensnummer_2_gml_id)
);
COMMENT ON TABLE ax_namensnummer_zu_ax_namensnummer IS 'Association AX_Namensnummer _zu_ AX_Namensnummer';
COMMENT ON COLUMN ax_namensnummer_zu_ax_namensnummer.ax_namensnummer_1_gml_id IS 'inversZu_hatVorgaenger ';
COMMENT ON COLUMN ax_namensnummer_zu_ax_namensnummer.ax_namensnummer_2_gml_id IS 'hatVorgaenger ';

CREATE TABLE IF NOT EXISTS ax_vertretung_zu_ax_person (
	ax_vertretung_gml_id text,
	ax_person_gml_id text,
	PRIMARY KEY (ax_vertretung_gml_id, ax_person_gml_id)
);
COMMENT ON TABLE ax_vertretung_zu_ax_person IS 'Association AX_Vertretung _zu_ AX_Person';
COMMENT ON COLUMN ax_vertretung_zu_ax_person.ax_vertretung_gml_id IS 'vertritt';
COMMENT ON COLUMN ax_vertretung_zu_ax_person.ax_person_gml_id IS 'wirdVertretenVon';

CREATE TABLE IF NOT EXISTS ax_anschrift_zu_ax_person (
	ax_anschrift_gml_id text,
	ax_person_gml_id text,
	PRIMARY KEY (ax_anschrift_gml_id, ax_person_gml_id)
);
COMMENT ON TABLE ax_anschrift_zu_ax_person IS 'Association AX_Anschrift _zu_ AX_Person';
COMMENT ON COLUMN ax_anschrift_zu_ax_person.ax_anschrift_gml_id IS 'gehoertZu';
COMMENT ON COLUMN ax_anschrift_zu_ax_person.ax_person_gml_id IS 'hat';

CREATE TABLE IF NOT EXISTS ax_personengruppe_zu_ax_person (
	ax_personengruppe_gml_id text,
	ax_person_gml_id text,
	PRIMARY KEY (ax_personengruppe_gml_id, ax_person_gml_id)
);
COMMENT ON TABLE ax_personengruppe_zu_ax_person IS 'Association AX_Personengruppe _zu_ AX_Person';
COMMENT ON COLUMN ax_personengruppe_zu_ax_person.ax_personengruppe_gml_id IS 'bestehtAus';
COMMENT ON COLUMN ax_personengruppe_zu_ax_person.ax_person_gml_id IS 'gehoertZu';

CREATE TABLE IF NOT EXISTS ax_lagebezeichnungohnehausnummer_zu_ax_flurstueck (
	ax_lagebezeichnungohnehausnummer_gml_id text,
	ax_flurstueck_gml_id text,
	PRIMARY KEY (ax_lagebezeichnungohnehausnummer_gml_id, ax_flurstueck_gml_id)
);
COMMENT ON TABLE ax_lagebezeichnungohnehausnummer_zu_ax_flurstueck IS 'Association AX_LagebezeichnungOhneHausnummer _zu_ AX_Flurstueck';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer_zu_ax_flurstueck.ax_lagebezeichnungohnehausnummer_gml_id IS 'gehoertZu';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer_zu_ax_flurstueck.ax_flurstueck_gml_id IS 'zeigtAuf';

CREATE TABLE IF NOT EXISTS ax_lagebezeichnungmithausnummer_zu_ax_flurstueck (
	ax_lagebezeichnungmithausnummer_gml_id text,
	ax_flurstueck_gml_id text,
	PRIMARY KEY (ax_lagebezeichnungmithausnummer_gml_id, ax_flurstueck_gml_id)
);
COMMENT ON TABLE ax_lagebezeichnungmithausnummer_zu_ax_flurstueck IS 'Association AX_LagebezeichnungMitHausnummer _zu_ AX_Flurstueck';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer_zu_ax_flurstueck.ax_lagebezeichnungmithausnummer_gml_id IS 'gehoertZu';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer_zu_ax_flurstueck.ax_flurstueck_gml_id IS 'weistAuf';

CREATE TABLE IF NOT EXISTS ax_flurstueck_zu_ax_flurstueck (
	ax_flurstueck_1_gml_id text,
	ax_flurstueck_2_gml_id text,
	PRIMARY KEY (ax_flurstueck_1_gml_id, ax_flurstueck_2_gml_id)
);
COMMENT ON TABLE ax_flurstueck_zu_ax_flurstueck IS 'Association AX_Flurstueck _zu_ AX_Flurstueck';
COMMENT ON COLUMN ax_flurstueck_zu_ax_flurstueck.ax_flurstueck_1_gml_id IS 'beziehtSichAufFlurstueck';
COMMENT ON COLUMN ax_flurstueck_zu_ax_flurstueck.ax_flurstueck_2_gml_id IS 'gehoertAnteiligZu ';

CREATE TABLE IF NOT EXISTS ax_lagebezeichnungohnehausnummer_zu_ax_historischesflurstueckoh (
	ax_lagebezeichnungohnehausnummer_gml_id text,
	ax_historischesflurstueckohneraumbezug_gml_id text,
	PRIMARY KEY (ax_lagebezeichnungohnehausnummer_gml_id, ax_historischesflurstueckohneraumbezug_gml_id)
);
COMMENT ON TABLE ax_lagebezeichnungohnehausnummer_zu_ax_historischesflurstueckoh IS 'Association AX_LagebezeichnungOhneHausnummer _zu_ AX_HistorischesFlurstueckOhneRaumbezug';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer_zu_ax_historischesflurstueckoh.ax_lagebezeichnungohnehausnummer_gml_id IS 'beschreibt';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer_zu_ax_historischesflurstueckoh.ax_historischesflurstueckohneraumbezug_gml_id IS 'zeigtAuf';
ALTER TABLE ax_lagebezeichnungohnehausnummer_zu_ax_historischesflurstueckoh ADD COLUMN ax_lagebezeichnungohnehausnummer_zu_ax_historischesflurstueckoh character varying(255);
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer_zu_ax_historischesflurstueckoh.ax_lagebezeichnungohnehausnummer_zu_ax_historischesflurstueckoh
IS 'ax_lagebezeichnungohnehausnummer_zu_ax_historischesflurstueckohneraumbezug';


CREATE TABLE IF NOT EXISTS ax_lagebezeichnungmithausnummer_zu_ax_historischesflurstueckohn (
	ax_lagebezeichnungmithausnummer_gml_id text,
	ax_historischesflurstueckohneraumbezug_gml_id text,
	PRIMARY KEY (ax_lagebezeichnungmithausnummer_gml_id, ax_historischesflurstueckohneraumbezug_gml_id)
);
COMMENT ON TABLE ax_lagebezeichnungmithausnummer_zu_ax_historischesflurstueckohn IS 'Association AX_LagebezeichnungMitHausnummer _zu_ AX_HistorischesFlurstueckOhneRaumbezug';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer_zu_ax_historischesflurstueckohn.ax_lagebezeichnungmithausnummer_gml_id IS 'hat';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer_zu_ax_historischesflurstueckohn.ax_historischesflurstueckohneraumbezug_gml_id IS 'weistAuf';
ALTER TABLE ax_lagebezeichnungmithausnummer_zu_ax_historischesflurstueckohn ADD COLUMN ax_lagebezeichnungmithausnummer_zu_ax_historischesflurstueckohn character varying(255);
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer_zu_ax_historischesflurstueckohn.ax_lagebezeichnungmithausnummer_zu_ax_historischesflurstueckohn
IS 'ax_lagebezeichnungmithausnummer_zu_ax_historischesflurstueckohneraumbezug';


CREATE TABLE IF NOT EXISTS ax_historischesflurstueckohneraumbezug_zu_ax_historischesflurst (
	ax_historischesflurstueckohneraumbezug_1_gml_id text,
	ax_historischesflurstueckohneraumbezug_2_gml_id text,
	PRIMARY KEY (ax_historischesflurstueckohneraumbezug_1_gml_id, ax_historischesflurstueckohneraumbezug_2_gml_id)
);
COMMENT ON TABLE ax_historischesflurstueckohneraumbezug_zu_ax_historischesflurst IS 'Association AX_HistorischesFlurstueckOhneRaumbezug _zu_ AX_HistorischesFlurstueckOhneRaumbezug';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug_zu_ax_historischesflurst.ax_historischesflurstueckohneraumbezug_1_gml_id IS 'inversZu_gehoertAnteiligZu ';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug_zu_ax_historischesflurst.ax_historischesflurstueckohneraumbezug_2_gml_id IS 'gehoertAnteiligZu ';
ALTER TABLE ax_historischesflurstueckohneraumbezug_zu_ax_historischesflurst ADD COLUMN ax_historischesflurstueckohneraumbezug_zu_ax_historischesflurst character varying(255);
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug_zu_ax_historischesflurst.ax_historischesflurstueckohneraumbezug_zu_ax_historischesflurst
IS 'ax_historischesflurstueckohneraumbezug_zu_ax_historischesflurstueckohneraumbezug';


CREATE TABLE IF NOT EXISTS ax_person_zu_ax_gebaeude (
	ax_person_gml_id text,
	ax_gebaeude_gml_id text,
	PRIMARY KEY (ax_person_gml_id, ax_gebaeude_gml_id)
);
COMMENT ON TABLE ax_person_zu_ax_gebaeude IS 'Association AX_Person _zu_ AX_Gebaeude';
COMMENT ON COLUMN ax_person_zu_ax_gebaeude.ax_person_gml_id IS 'besitzt';
COMMENT ON COLUMN ax_person_zu_ax_gebaeude.ax_gebaeude_gml_id IS 'gehoert';