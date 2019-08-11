-- Version vom 17.10.2016
DROP SCHEMA IF EXISTS aaa_ogr CASCADE;
CREATE SCHEMA aaa_ogr;
COMMENT ON SCHEMA aaa_ogr IS 'Version vom 17.10.2016';
SET search_path = aaa_ogr, public;


CREATE TABLE IF NOT EXISTS aa_advstandardmodell (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT aa_advstandardmodell_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE aa_advstandardmodell IS 'Alias: "AA_AdVStandardModell", UML-Typ: Enumeration';
INSERT INTO aa_advstandardmodell (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS aa_nas_ausgabeform (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT aa_nas_ausgabeform_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE aa_nas_ausgabeform IS 'Alias: "AA_NAS_Ausgabeform", UML-Typ: Enumeration';
INSERT INTO aa_nas_ausgabeform (wert,beschreibung) VALUES 
('application/xml', NULL),
('application/zip', NULL),
('application/gzip', NULL);

CREATE TABLE IF NOT EXISTS nas_filter_capabilities (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT nas_filter_capabilities_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE nas_filter_capabilities IS 'Alias: "NAS_Filter_Capabilities", UML-Typ: Enumeration';
INSERT INTO nas_filter_capabilities (wert,beschreibung) VALUES 
('transparentXlinks', NULL),
('multiplePropertyValues', NULL),
('XlinkPropertyName', NULL),
('XlinkPropertyPath', NULL),
('XlinkPropertyPath_leafOnly', NULL),
('PropertyIsOfType', NULL);

CREATE TABLE IF NOT EXISTS aa_themendimension (
	wert integer,
	beschreibung character varying,
	CONSTRAINT aa_themendimension_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE aa_themendimension IS 'Alias: "AA_Themendimension", UML-Typ: Enumeration';
INSERT INTO aa_themendimension (wert,beschreibung) VALUES 
('1000', 'Punkt-Linien-Thema (Dimension 1)'),
('2000', 'Topologiethema (Dimension 2)');

CREATE TABLE IF NOT EXISTS aa_art_themendefinition (
	wert integer,
	beschreibung character varying,
	CONSTRAINT aa_art_themendefinition_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE aa_art_themendefinition IS 'Alias: "AA_Art_Themendefinition", UML-Typ: Enumeration';
INSERT INTO aa_art_themendefinition (wert,beschreibung) VALUES 
('1000', 'alleObjekte'),
('2000', 'anwenderdefiniert');

CREATE TABLE IF NOT EXISTS operation (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT operation_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE operation IS 'Alias: "Operation", UML-Typ: Enumeration';
INSERT INTO operation (wert,beschreibung) VALUES 
('Insert', NULL),
('Replace', NULL),
('Delete', NULL),
('Query', NULL),
('Lock', NULL),
('Unlock', NULL),
('Reserve', NULL);

CREATE TABLE IF NOT EXISTS ap_horizontaleausrichtung (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT ap_horizontaleausrichtung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ap_horizontaleausrichtung IS 'Alias: "AP_HorizontaleAusrichtung", UML-Typ: Enumeration';
INSERT INTO ap_horizontaleausrichtung (wert,beschreibung) VALUES 
('linksbündig', NULL),
('rechtsbündig', NULL),
('zentrisch', NULL);

CREATE TABLE IF NOT EXISTS ap_vertikaleausrichtung (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT ap_vertikaleausrichtung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ap_vertikaleausrichtung IS 'Alias: "AP_VertikaleAusrichtung", UML-Typ: Enumeration';
INSERT INTO ap_vertikaleausrichtung (wert,beschreibung) VALUES 
('Basis', NULL),
('Mitte', NULL),
('oben', NULL);

CREATE TABLE IF NOT EXISTS ap_dateityp_3d (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ap_dateityp_3d_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ap_dateityp_3d IS 'Alias: "AP_DateiTyp_3D", UML-Typ: Enumeration';
INSERT INTO ap_dateityp_3d (wert,beschreibung) VALUES 
('1000', 'VRML97'),
('2000', '3DSmax'),
('3000', 'autocad DXF'),
('4000', 'autocad DWG'),
('5000', 'shockwave3D'),
('6000', 'X3D'),
('9990', 'unbekannt');

CREATE TABLE IF NOT EXISTS ax_artdesnullpunktes_nullpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artdesnullpunktes_nullpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artdesnullpunktes_nullpunkt IS 'Alias: "AX_ArtDesNullpunktes_Nullpunkt", UML-Typ: Enumeration';
INSERT INTO ax_artdesnullpunktes_nullpunkt (wert,beschreibung) VALUES 
('1000', 'Zentraler Nullpunkt'),
('2000', 'Nullpunkt'),
('3000', 'Fiktiver Nullpunkt');

CREATE TABLE IF NOT EXISTS ax_li_processstep_mitdatenerhebung_description (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT ax_li_processstep_mitdatenerhebung_description_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_li_processstep_mitdatenerhebung_description IS 'Alias: "AX_LI_ProcessStep_MitDatenerhebung_Description", UML-Typ: Enumeration';
INSERT INTO ax_li_processstep_mitdatenerhebung_description (wert,beschreibung) VALUES 
('Erhebung', NULL);

CREATE TABLE IF NOT EXISTS ax_datenerhebung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_datenerhebung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_datenerhebung IS 'Alias: "AX_Datenerhebung", UML-Typ: Enumeration';
INSERT INTO ax_datenerhebung (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_sportart_bauwerkoderanlagefuersportfreizeitunderholung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_sportart_bauwerkoderanlagefuersportfreizeitunderholung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_sportart_bauwerkoderanlagefuersportfreizeitunderholung IS 'Alias: "AX_Sportart_BauwerkOderAnlageFuerSportFreizeitUndErholung", UML-Typ: Enumeration';
INSERT INTO ax_sportart_bauwerkoderanlagefuersportfreizeitunderholung (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_lagezurerdoberflaeche_transportanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_lagezurerdoberflaeche_transportanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_lagezurerdoberflaeche_transportanlage IS 'Alias: "AX_LageZurErdoberflaeche_Transportanlage", UML-Typ: Enumeration';
INSERT INTO ax_lagezurerdoberflaeche_transportanlage (wert,beschreibung) VALUES 
('1200', 'Unter der Erdoberfläche'),
('1400', 'Aufgeständert'),
('1700', 'Unter der Wasseroberfläche');

CREATE TABLE IF NOT EXISTS ax_produkt_transportanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_produkt_transportanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_produkt_transportanlage IS 'Alias: "AX_Produkt_Transportanlage", UML-Typ: Enumeration';
INSERT INTO ax_produkt_transportanlage (wert,beschreibung) VALUES 
('1110', 'Erdöl'),
('1120', 'Gas'),
('1130', 'Wasser'),
('1131', 'Trinkwasser'),
('1132', 'Brauchwasser'),
('1133', 'Abwasser'),
('1140', 'Fernwärme');

CREATE TABLE IF NOT EXISTS ax_bauwerksfunktion_turm (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bauwerksfunktion_turm_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bauwerksfunktion_turm IS 'Alias: "AX_Bauwerksfunktion_Turm", UML-Typ: Enumeration';
INSERT INTO ax_bauwerksfunktion_turm (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_hydrologischesmerkmal_sonstigesbauwerkodersonstigeeinri (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_hydrologischesmerkmal_sonstigesbauwerkodersonstigeeinri_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_hydrologischesmerkmal_sonstigesbauwerkodersonstigeeinri IS 'Alias: "AX_HydrologischesMerkmal_SonstigesBauwerkOderSonstigeEinrichtung", UML-Typ: Enumeration';
INSERT INTO ax_hydrologischesmerkmal_sonstigesbauwerkodersonstigeeinri (wert,beschreibung) VALUES 
('1000', 'Ständig Wasser führend'),
('2000', 'Nicht ständig Wasser führend'),
('3000', 'Trocken, versiegt');

CREATE TABLE IF NOT EXISTS ax_zustand_turm (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_turm_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_turm IS 'Alias: "AX_Zustand_Turm", UML-Typ: Enumeration';
INSERT INTO ax_zustand_turm (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('2200', 'Verfallen, zerstört');

CREATE TABLE IF NOT EXISTS ax_art_heilquellegasquelle (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_heilquellegasquelle_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_heilquellegasquelle IS 'Alias: "AX_Art_HeilquelleGasquelle", UML-Typ: Enumeration';
INSERT INTO ax_art_heilquellegasquelle (wert,beschreibung) VALUES 
('4010', 'Heilquelle'),
('4020', 'Gasquelle, Mofette');

CREATE TABLE IF NOT EXISTS ax_bauwerksfunktion_transportanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bauwerksfunktion_transportanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bauwerksfunktion_transportanlage IS 'Alias: "AX_Bauwerksfunktion_Transportanlage", UML-Typ: Enumeration';
INSERT INTO ax_bauwerksfunktion_transportanlage (wert,beschreibung) VALUES 
('1101', 'Rohrleitung, Pipeline'),
('1102', 'Förderband, Bandstraße'),
('1103', 'Pumpe');

CREATE TABLE IF NOT EXISTS ax_lagezurerdoberflaeche_vorratsbehaelterspeicherbauwerk (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_lagezurerdoberflaeche_vorratsbehaelterspeicherbauwerk_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_lagezurerdoberflaeche_vorratsbehaelterspeicherbauwerk IS 'Alias: "AX_LageZurErdoberflaeche_VorratsbehaelterSpeicherbauwerk", UML-Typ: Enumeration';
INSERT INTO ax_lagezurerdoberflaeche_vorratsbehaelterspeicherbauwerk (wert,beschreibung) VALUES 
('1200', 'Unter der Erdoberfläche'),
('1400', 'Aufgeständert');

CREATE TABLE IF NOT EXISTS ax_speicherinhalt_vorratsbehaelterspeicherbauwerk (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_speicherinhalt_vorratsbehaelterspeicherbauwerk_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_speicherinhalt_vorratsbehaelterspeicherbauwerk IS 'Alias: "AX_Speicherinhalt_VorratsbehaelterSpeicherbauwerk", UML-Typ: Enumeration';
INSERT INTO ax_speicherinhalt_vorratsbehaelterspeicherbauwerk (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_bauwerksfunktion_bauwerkoderanlagefuerindustrieundgewer (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bauwerksfunktion_bauwerkoderanlagefuerindustrieundgewer_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bauwerksfunktion_bauwerkoderanlagefuerindustrieundgewer IS 'Alias: "AX_Bauwerksfunktion_BauwerkOderAnlageFuerIndustrieUndGewerbe", UML-Typ: Enumeration';
INSERT INTO ax_bauwerksfunktion_bauwerkoderanlagefuerindustrieundgewer (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_art_einrichtunginoeffentlichenbereichen (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_einrichtunginoeffentlichenbereichen_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_einrichtunginoeffentlichenbereichen IS 'Alias: "AX_Art_EinrichtungInOeffentlichenBereichen", UML-Typ: Enumeration';
INSERT INTO ax_art_einrichtunginoeffentlichenbereichen (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_bauwerksfunktion_bauwerkoderanlagefuersportfreizeitunde (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bauwerksfunktion_bauwerkoderanlagefuersportfreizeitunde_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bauwerksfunktion_bauwerkoderanlagefuersportfreizeitunde IS 'Alias: "AX_Bauwerksfunktion_BauwerkOderAnlageFuerSportFreizeitUndErholung", UML-Typ: Enumeration';
INSERT INTO ax_bauwerksfunktion_bauwerkoderanlagefuersportfreizeitunde (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_archaeologischertyp_historischesbauwerkoderhistorischee (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_archaeologischertyp_historischesbauwerkoderhistorischee_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_archaeologischertyp_historischesbauwerkoderhistorischee IS 'Alias: "AX_ArchaeologischerTyp_HistorischesBauwerkOderHistorischeEinrichtung", UML-Typ: Enumeration';
INSERT INTO ax_archaeologischertyp_historischesbauwerkoderhistorischee (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_hydrologischesmerkmal_heilquellegasquelle (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_hydrologischesmerkmal_heilquellegasquelle_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_hydrologischesmerkmal_heilquellegasquelle IS 'Alias: "AX_HydrologischesMerkmal_HeilquelleGasquelle", UML-Typ: Enumeration';
INSERT INTO ax_hydrologischesmerkmal_heilquellegasquelle (wert,beschreibung) VALUES 
('4000', 'Ständig schüttend'),
('5000', 'Nicht ständig schüttend');

CREATE TABLE IF NOT EXISTS ax_zustand_bauwerkoderanlagefuerindustrieundgewerbe (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_bauwerkoderanlagefuerindustrieundgewerbe_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_bauwerkoderanlagefuerindustrieundgewerbe IS 'Alias: "AX_Zustand_BauwerkOderAnlageFuerIndustrieUndGewerbe", UML-Typ: Enumeration';
INSERT INTO ax_zustand_bauwerkoderanlagefuerindustrieundgewerbe (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('2200', 'Verfallen, zerstört'),
('4100', 'Offen'),
('4200', 'Verschlossen');

CREATE TABLE IF NOT EXISTS ax_bauwerksfunktion_sonstigesbauwerkodersonstigeeinrichtun (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bauwerksfunktion_sonstigesbauwerkodersonstigeeinrichtun_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bauwerksfunktion_sonstigesbauwerkodersonstigeeinrichtun IS 'Alias: "AX_Bauwerksfunktion_SonstigesBauwerkOderSonstigeEinrichtung", UML-Typ: Enumeration';
INSERT INTO ax_bauwerksfunktion_sonstigesbauwerkodersonstigeeinrichtun (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_funktion_bauwerk (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_bauwerk_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_bauwerk IS 'Alias: "AX_Funktion_Bauwerk", UML-Typ: Enumeration';
INSERT INTO ax_funktion_bauwerk (wert,beschreibung) VALUES 
('1000', 'Hochwasser-, Sturmflutschutz'),
('2000', 'Lärmschutz');

CREATE TABLE IF NOT EXISTS ax_bauwerksfunktion_leitung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bauwerksfunktion_leitung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bauwerksfunktion_leitung IS 'Alias: "AX_Bauwerksfunktion_Leitung", UML-Typ: Enumeration';
INSERT INTO ax_bauwerksfunktion_leitung (wert,beschreibung) VALUES 
('1110', 'Freileitung'),
('1111', 'Erdkabel');

CREATE TABLE IF NOT EXISTS ax_bauwerksfunktion_vorratsbehaelterspeicherbauwerk (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bauwerksfunktion_vorratsbehaelterspeicherbauwerk_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bauwerksfunktion_vorratsbehaelterspeicherbauwerk IS 'Alias: "AX_Bauwerksfunktion_VorratsbehaelterSpeicherbauwerk", UML-Typ: Enumeration';
INSERT INTO ax_bauwerksfunktion_vorratsbehaelterspeicherbauwerk (wert,beschreibung) VALUES 
('1201', 'Silo'),
('1202', 'Fülltrichter'),
('1203', 'Bunker'),
('1204', 'Getreideheber'),
('1205', 'Tank'),
('1206', 'Gasometer'),
('9999', 'Sonstiges');

CREATE TABLE IF NOT EXISTS ax_befestigung_wegpfadsteig (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_befestigung_wegpfadsteig_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_befestigung_wegpfadsteig IS 'Alias: "AX_Befestigung_WegPfadSteig", UML-Typ: Enumeration';
INSERT INTO ax_befestigung_wegpfadsteig (wert,beschreibung) VALUES 
('1000', 'Befestigt'),
('2000', 'Unbefestigt');

CREATE TABLE IF NOT EXISTS ax_oberflaechenmaterial_flugverkehrsanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_oberflaechenmaterial_flugverkehrsanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_oberflaechenmaterial_flugverkehrsanlage IS 'Alias: "AX_Oberflaechenmaterial_Flugverkehrsanlage", UML-Typ: Enumeration';
INSERT INTO ax_oberflaechenmaterial_flugverkehrsanlage (wert,beschreibung) VALUES 
('1210', 'Gras, Rasen'),
('1220', 'Beton'),
('1230', 'Bitumen, Asphalt');

CREATE TABLE IF NOT EXISTS ax_art_gleis (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_gleis_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_gleis IS 'Alias: "AX_Art_Gleis", UML-Typ: Enumeration';
INSERT INTO ax_art_gleis (wert,beschreibung) VALUES 
('1200', 'Drehscheibe');

CREATE TABLE IF NOT EXISTS ax_bahnkategorie_gleis (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bahnkategorie_gleis_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bahnkategorie_gleis IS 'Alias: "AX_Bahnkategorie_Gleis", UML-Typ: Enumeration';
INSERT INTO ax_bahnkategorie_gleis (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_art_strassenverkehrsanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_strassenverkehrsanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_strassenverkehrsanlage IS 'Alias: "AX_Art_Strassenverkehrsanlage", UML-Typ: Enumeration';
INSERT INTO ax_art_strassenverkehrsanlage (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_markierung_wegpfadsteig (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_markierung_wegpfadsteig_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_markierung_wegpfadsteig IS 'Alias: "AX_Markierung_WegPfadSteig", UML-Typ: Enumeration';
INSERT INTO ax_markierung_wegpfadsteig (wert,beschreibung) VALUES 
('1401', 'Gekennzeichneter Wanderweg'),
('1402', 'Gekennzeichneter Radwanderweg'),
('1403', 'Gekennzeichnete Skaterstrecke');

CREATE TABLE IF NOT EXISTS ax_bahnhofskategorie_bahnverkehrsanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bahnhofskategorie_bahnverkehrsanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bahnhofskategorie_bahnverkehrsanlage IS 'Alias: "AX_Bahnhofskategorie_Bahnverkehrsanlage", UML-Typ: Enumeration';
INSERT INTO ax_bahnhofskategorie_bahnverkehrsanlage (wert,beschreibung) VALUES 
('1010', 'Bahnhof'),
('1020', 'Haltestelle'),
('1030', 'Haltepunkt');

CREATE TABLE IF NOT EXISTS ax_bahnkategorie_seilbahnschwebebahn (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bahnkategorie_seilbahnschwebebahn_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bahnkategorie_seilbahnschwebebahn IS 'Alias: "AX_Bahnkategorie_SeilbahnSchwebebahn", UML-Typ: Enumeration';
INSERT INTO ax_bahnkategorie_seilbahnschwebebahn (wert,beschreibung) VALUES 
('2100', 'Luftseilbahn, Großkabinenbahn'),
('2200', 'Kabinenbahn, Umlaufseilbahn'),
('2300', 'Sessellift'),
('2400', 'Ski-, Schlepplift'),
('2500', 'Schwebebahn'),
('2600', 'Materialseilbahn');

CREATE TABLE IF NOT EXISTS ax_zustand_bahnverkehrsanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_bahnverkehrsanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_bahnverkehrsanlage IS 'Alias: "AX_Zustand_Bahnverkehrsanlage", UML-Typ: Enumeration';
INSERT INTO ax_zustand_bahnverkehrsanlage (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');

CREATE TABLE IF NOT EXISTS ax_zustand_bauwerkimgewaesserbereich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_bauwerkimgewaesserbereich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_bauwerkimgewaesserbereich IS 'Alias: "AX_Zustand_BauwerkImGewaesserbereich", UML-Typ: Enumeration';
INSERT INTO ax_zustand_bauwerkimgewaesserbereich (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');

CREATE TABLE IF NOT EXISTS ax_art_wegpfadsteig (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_wegpfadsteig_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_wegpfadsteig IS 'Alias: "AX_Art_WegPfadSteig", UML-Typ: Enumeration';
INSERT INTO ax_art_wegpfadsteig (wert,beschreibung) VALUES 
('1103', 'Fußweg'),
('1105', 'Karren- und Ziehweg'),
('1106', 'Radweg'),
('1107', 'Reitweg'),
('1108', 'Wattenweg'),
('1109', '(Kletter-)Steig im Gebirge'),
('1110', 'Rad- und Fußweg'),
('1111', 'Skaterstrecke');

CREATE TABLE IF NOT EXISTS ax_lagezuroberflaeche_gleis (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_lagezuroberflaeche_gleis_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_lagezuroberflaeche_gleis IS 'Alias: "AX_LageZurOberflaeche_Gleis", UML-Typ: Enumeration';
INSERT INTO ax_lagezuroberflaeche_gleis (wert,beschreibung) VALUES 
('1200', 'Unter der Erdoberfläche'),
('1400', 'Aufgeständert');

CREATE TABLE IF NOT EXISTS ax_art_flugverkehrsanlage (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_flugverkehrsanlage_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_flugverkehrsanlage IS 'Alias: "AX_Art_Flugverkehrsanlage", UML-Typ: Enumeration';
INSERT INTO ax_art_flugverkehrsanlage (wert,beschreibung) VALUES 
('1310', 'Startbahn, Landebahn'),
('1320', 'Zurollbahn, Taxiway'),
('1330', 'Vorfeld'),
('5520', 'Verkehrslandeplatz'),
('5531', 'Hubschrauberlandeplatz'),
('5540', 'Landeplatz, Sonderlandeplatz'),
('5550', 'Segelfluggelände');

CREATE TABLE IF NOT EXISTS ax_bauwerksfunktion_bauwerkimverkehrsbereich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bauwerksfunktion_bauwerkimverkehrsbereich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bauwerksfunktion_bauwerkimverkehrsbereich IS 'Alias: "AX_Bauwerksfunktion_BauwerkImVerkehrsbereich", UML-Typ: Enumeration';
INSERT INTO ax_bauwerksfunktion_bauwerkimverkehrsbereich (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_bauwerksfunktion_bauwerkimgewaesserbereich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bauwerksfunktion_bauwerkimgewaesserbereich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bauwerksfunktion_bauwerkimgewaesserbereich IS 'Alias: "AX_Bauwerksfunktion_BauwerkImGewaesserbereich", UML-Typ: Enumeration';
INSERT INTO ax_bauwerksfunktion_bauwerkimgewaesserbereich (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_art_einrichtungenfuerdenschiffsverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_einrichtungenfuerdenschiffsverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_einrichtungenfuerdenschiffsverkehr IS 'Alias: "AX_Art_EinrichtungenFuerDenSchiffsverkehr", UML-Typ: Enumeration';
INSERT INTO ax_art_einrichtungenfuerdenschiffsverkehr (wert,beschreibung) VALUES 
('1410', 'Bake'),
('1420', 'Leuchtfeuer'),
('1430', 'Kilometerstein'),
('1440', 'Tafel an Gewässern'),
('1450', 'Pricke'),
('1460', 'Anleger'),
('9999', 'Sonstiges');

CREATE TABLE IF NOT EXISTS ax_zustand_bauwerkimverkehrsbereich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_bauwerkimverkehrsbereich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_bauwerkimverkehrsbereich IS 'Alias: "AX_Zustand_BauwerkImVerkehrsbereich", UML-Typ: Enumeration';
INSERT INTO ax_zustand_bauwerkimverkehrsbereich (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen');

CREATE TABLE IF NOT EXISTS ax_artdergewaesserachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artdergewaesserachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artdergewaesserachse IS 'Alias: "AX_ArtDerGewaesserachse", UML-Typ: Enumeration';
INSERT INTO ax_artdergewaesserachse (wert,beschreibung) VALUES 
('1000', 'Gewässerachse der WSV'),
('2000', 'Genäherte Mittellinie in Gewässern'),
('3001', 'Fiktive Verbindung in Fließgewässern'),
('3002', 'Fiktive Verbindung in Seen und Teichen');

CREATE TABLE IF NOT EXISTS ax_art_schifffahrtsliniefaehrverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_schifffahrtsliniefaehrverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_schifffahrtsliniefaehrverkehr IS 'Alias: "AX_Art_SchifffahrtslinieFaehrverkehr", UML-Typ: Enumeration';
INSERT INTO ax_art_schifffahrtsliniefaehrverkehr (wert,beschreibung) VALUES 
('1710', 'Autofährverkehr'),
('1720', 'Eisenbahnfährverkehr'),
('1730', 'Personenfährverkehr'),
('1740', 'Linienverkehr');

CREATE TABLE IF NOT EXISTS ax_zustand_schleuse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_schleuse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_schleuse IS 'Alias: "AX_Zustand_Schleuse", UML-Typ: Enumeration';
INSERT INTO ax_zustand_schleuse (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen');

CREATE TABLE IF NOT EXISTS ax_nutzung_hafen (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_nutzung_hafen_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_nutzung_hafen IS 'Alias: "AX_Nutzung_Hafen", UML-Typ: Enumeration';
INSERT INTO ax_nutzung_hafen (wert,beschreibung) VALUES 
('1000', 'Zivil'),
('2000', 'Militärisch'),
('3000', 'Teils zivil, teils militärisch');

CREATE TABLE IF NOT EXISTS ax_konstruktionsmerkmalbauart_schleuse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_konstruktionsmerkmalbauart_schleuse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_konstruktionsmerkmalbauart_schleuse IS 'Alias: "AX_KonstruktionsmerkmalBauart_Schleuse", UML-Typ: Enumeration';
INSERT INTO ax_konstruktionsmerkmalbauart_schleuse (wert,beschreibung) VALUES 
('1010', 'Schiffshebewerk'),
('1020', 'Kammerschleuse');

CREATE TABLE IF NOT EXISTS ax_hafenkategorie_hafen (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_hafenkategorie_hafen_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_hafenkategorie_hafen IS 'Alias: "AX_Hafenkategorie_Hafen", UML-Typ: Enumeration';
INSERT INTO ax_hafenkategorie_hafen (wert,beschreibung) VALUES 
('1010', 'Containerhafen'),
('1020', 'Ölhafen'),
('1030', 'Fischereihafen'),
('1040', 'Sporthafen, Yachthafen'),
('1050', 'Fährhafen'),
('1060', 'Stückguthafen'),
('1070', 'Hafen für Massengüter');

CREATE TABLE IF NOT EXISTS ax_art_gewaessermerkmal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_gewaessermerkmal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_gewaessermerkmal IS 'Alias: "AX_Art_Gewaessermerkmal", UML-Typ: Enumeration';
INSERT INTO ax_art_gewaessermerkmal (wert,beschreibung) VALUES 
('1610', 'Quelle'),
('1620', 'Wasserfall'),
('1630', 'Stromschnelle'),
('1640', 'Sandbank'),
('1650', 'Watt'),
('1660', 'Priel'),
('9999', 'Sonstiges');

CREATE TABLE IF NOT EXISTS ax_hydrologischesmerkmal_untergeordnetesgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_hydrologischesmerkmal_untergeordnetesgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_hydrologischesmerkmal_untergeordnetesgewaesser IS 'Alias: "AX_HydrologischesMerkmal_UntergeordnetesGewaesser", UML-Typ: Enumeration';
INSERT INTO ax_hydrologischesmerkmal_untergeordnetesgewaesser (wert,beschreibung) VALUES 
('2000', 'Nicht ständig Wasser führend'),
('3000', 'Trocken, versiegt');

CREATE TABLE IF NOT EXISTS ax_lagezurerdoberflaeche_untergeordnetesgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_lagezurerdoberflaeche_untergeordnetesgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_lagezurerdoberflaeche_untergeordnetesgewaesser IS 'Alias: "AX_LageZurErdoberflaeche_UntergeordnetesGewaesser", UML-Typ: Enumeration';
INSERT INTO ax_lagezurerdoberflaeche_untergeordnetesgewaesser (wert,beschreibung) VALUES 
('1800', 'Verrohrt, unterirdisch, bedeckt'),
('1810', 'Verdolt');

CREATE TABLE IF NOT EXISTS ax_artdespolders (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artdespolders_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artdespolders IS 'Alias: "AX_ArtDesPolders", UML-Typ: Enumeration';
INSERT INTO ax_artdespolders (wert,beschreibung) VALUES 
('1000', 'Sommerpolder'),
('2000', 'Entlastungspolder'),
('3000', 'Flutungspolder');

CREATE TABLE IF NOT EXISTS ax_funktion_polder (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT ax_funktion_polder_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_polder IS 'Alias: "AX_Funktion_Polder", UML-Typ: Enumeration';
INSERT INTO ax_funktion_polder (wert,beschreibung) VALUES 
(' 7410', 'Gesteuert = 7410'),
(' 7420', 'Ungesteuert = 7420');

CREATE TABLE IF NOT EXISTS ax_funktion_untergeordnetesgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_untergeordnetesgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_untergeordnetesgewaesser IS 'Alias: "AX_Funktion_UntergeordnetesGewaesser", UML-Typ: Enumeration';
INSERT INTO ax_funktion_untergeordnetesgewaesser (wert,beschreibung) VALUES 
('1010', 'Graben'),
('1011', 'Grabenkante, rechts'),
('1012', 'Grabenkante, links'),
('1013', 'Grabenmitte'),
('1020', 'Fleet'),
('1030', 'Bach'),
('1040', 'Teich');

CREATE TABLE IF NOT EXISTS ax_hydrologischesmerkmal_gewaessermerkmal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_hydrologischesmerkmal_gewaessermerkmal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_hydrologischesmerkmal_gewaessermerkmal IS 'Alias: "AX_HydrologischesMerkmal_Gewaessermerkmal", UML-Typ: Enumeration';
INSERT INTO ax_hydrologischesmerkmal_gewaessermerkmal (wert,beschreibung) VALUES 
('2000', 'Nicht ständig Wasser führend');

CREATE TABLE IF NOT EXISTS ax_funktion_vegetationsmerkmal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_vegetationsmerkmal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_vegetationsmerkmal IS 'Alias: "AX_Funktion_Vegetationsmerkmal", UML-Typ: Enumeration';
INSERT INTO ax_funktion_vegetationsmerkmal (wert,beschreibung) VALUES 
('1000', 'Windschutz');

CREATE TABLE IF NOT EXISTS ax_zustand_vegetationsmerkmal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_vegetationsmerkmal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_vegetationsmerkmal IS 'Alias: "AX_Zustand_Vegetationsmerkmal", UML-Typ: Enumeration';
INSERT INTO ax_zustand_vegetationsmerkmal (wert,beschreibung) VALUES 
('5000', 'Nass');

CREATE TABLE IF NOT EXISTS ax_bewuchs_vegetationsmerkmal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bewuchs_vegetationsmerkmal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bewuchs_vegetationsmerkmal IS 'Alias: "AX_Bewuchs_Vegetationsmerkmal", UML-Typ: Enumeration';
INSERT INTO ax_bewuchs_vegetationsmerkmal (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_eigentuemerart_namensnummer (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_eigentuemerart_namensnummer_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_eigentuemerart_namensnummer IS 'Alias: "AX_Eigentuemerart_Namensnummer", UML-Typ: Enumeration';
INSERT INTO ax_eigentuemerart_namensnummer (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_li_processstep_ohnedatenerhebung_description (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT ax_li_processstep_ohnedatenerhebung_description_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_li_processstep_ohnedatenerhebung_description IS 'Alias: "AX_LI_ProcessStep_OhneDatenerhebung_Description", UML-Typ: Enumeration';
INSERT INTO ax_li_processstep_ohnedatenerhebung_description (wert,beschreibung) VALUES 
('Erhebung', NULL);

CREATE TABLE IF NOT EXISTS ax_blattart_buchungsblatt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_blattart_buchungsblatt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_blattart_buchungsblatt IS 'Alias: "AX_Blattart_Buchungsblatt", UML-Typ: Enumeration';
INSERT INTO ax_blattart_buchungsblatt (wert,beschreibung) VALUES 
('1000', 'Grundbuchblatt'),
('2000', 'Katasterblatt'),
('3000', 'Pseudoblatt'),
('4000', 'Erwerberblatt'),
('5000', 'Fiktives Blatt');

CREATE TABLE IF NOT EXISTS ax_anrede_person (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_anrede_person_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_anrede_person IS 'Alias: "AX_Anrede_Person", UML-Typ: Enumeration';
INSERT INTO ax_anrede_person (wert,beschreibung) VALUES 
('1000', 'Frau'),
('2000', 'Herr'),
('3000', 'Firma');

CREATE TABLE IF NOT EXISTS ax_artderrechtsgemeinschaft_namensnummer (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderrechtsgemeinschaft_namensnummer_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderrechtsgemeinschaft_namensnummer IS 'Alias: "AX_ArtDerRechtsgemeinschaft_Namensnummer", UML-Typ: Enumeration';
INSERT INTO ax_artderrechtsgemeinschaft_namensnummer (wert,beschreibung) VALUES 
('1000', 'Erbengemeinschaft'),
('2000', 'Gütergemeinschaft'),
('3000', 'BGB-Gesellschaft'),
('9999', 'Sonstiges');

CREATE TABLE IF NOT EXISTS ax_buchungsart_buchungsstelle (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_buchungsart_buchungsstelle_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_buchungsart_buchungsstelle IS 'Alias: "AX_Buchungsart_Buchungsstelle", UML-Typ: Enumeration';
INSERT INTO ax_buchungsart_buchungsstelle (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_klassifikation_hierarchiestufe3d_lagefestpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_klassifikation_hierarchiestufe3d_lagefestpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_klassifikation_hierarchiestufe3d_lagefestpunkt IS 'Alias: "AX_Klassifikation_Hierarchiestufe3D_Lagefestpunkt", UML-Typ: Enumeration';
INSERT INTO ax_klassifikation_hierarchiestufe3d_lagefestpunkt (wert,beschreibung) VALUES 
('1000', 'Hierarchiestufe A'),
('2000', 'Hierarchiestufe B'),
('3000', 'Hierarchiestufe C'),
('4000', 'Hierarchiestufe D'),
('5000', 'Hierarchiestufe E'),
('9998', 'Nach Quellenlage nicht zu spezifizieren');

CREATE TABLE IF NOT EXISTS ax_punktstabilitaet (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_punktstabilitaet_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_punktstabilitaet IS 'Alias: "AX_Punktstabilitaet", UML-Typ: Enumeration';
INSERT INTO ax_punktstabilitaet (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_punktstabilitaet_hoehenfestpunkt_geologischestabilitaet (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_punktstabilitaet_hoehenfestpunkt_geologischestabilitaet_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_punktstabilitaet_hoehenfestpunkt_geologischestabilitaet IS 'Alias: "AX_Punktstabilitaet_Hoehenfestpunkt_GeologischeStabilitaet", UML-Typ: Enumeration';
INSERT INTO ax_punktstabilitaet_hoehenfestpunkt_geologischestabilitaet (wert,beschreibung) VALUES 
('1000', 'sehr gute geologische Stabilität'),
('2000', 'gute geologische Stabilität'),
('3000', 'befriedigende geologische Stabilität'),
('4000', 'ausreichende geologische Stabilität'),
('5000', 'mangelhafte geologische Stabilität'),
('9998', 'geologische Stabilität nicht untersucht');

CREATE TABLE IF NOT EXISTS ax_klassifikation_ordnung_lagefestpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_klassifikation_ordnung_lagefestpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_klassifikation_ordnung_lagefestpunkt IS 'Alias: "AX_Klassifikation_Ordnung_Lagefestpunkt", UML-Typ: Enumeration';
INSERT INTO ax_klassifikation_ordnung_lagefestpunkt (wert,beschreibung) VALUES 
('1000', 'TP (1) - Hauptdreieckspunkt, Zwischenpunkt 1. Ordnung'),
('2000', 'TP (2) - Trigonometrischer Punkt 2. Ordnung'),
('3000', 'TP (3) - Trigonometrischer Punkt 3. Ordnung'),
('4000', 'TP (4) - Trigonometrischer Punkt 4. Ordnung'),
('5000', 'TP (5) - Trigonometrischer Punkt 5. Ordnung'),
('6000', 'ÜL - Übergeordneter Lagefestpunkt (Berlin)'),
('9000', 'LFP, der nur eine interne Bedeutung hat'),
('9998', 'Nach Quellenlage nicht zu spezifieren'),
('9999', 'Sonstiges');

CREATE TABLE IF NOT EXISTS ax_punktstabilitaet_hoehenfestpunkt_guetedesvermarkungstra (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_punktstabilitaet_hoehenfestpunkt_guetedesvermarkungstra_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_punktstabilitaet_hoehenfestpunkt_guetedesvermarkungstra IS 'Alias: "AX_Punktstabilitaet_Hoehenfestpunkt_GueteDesVermarkungstraegers", UML-Typ: Enumeration';
INSERT INTO ax_punktstabilitaet_hoehenfestpunkt_guetedesvermarkungstra (wert,beschreibung) VALUES 
('1000', 'sehr gut'),
('2000', 'gut'),
('3000', 'befriedigend'),
('4000', 'ausreichend'),
('5000', 'unzureichend'),
('9998', 'nicht bekannt');

CREATE TABLE IF NOT EXISTS ax_ordnung_schwerefestpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_ordnung_schwerefestpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_ordnung_schwerefestpunkt IS 'Alias: "AX_Ordnung_Schwerefestpunkt", UML-Typ: Enumeration';
INSERT INTO ax_ordnung_schwerefestpunkt (wert,beschreibung) VALUES 
('0500', 'SFP(0) - Schweregrundnetzpunkt'),
('1000', 'SFP(1) - Schwerefestpunkt 1.Ordnung, Hauptschwerenetzpunkt'),
('2000', 'SFP(2) - Schwerefestpunkt 2.Ordnung'),
('3000', 'SFP(3) - Schwerefestpunkt 3.Ordnung'),
('4000', 'SFP(4) - Schwerefestpunkt 4. Ordnung'),
('9000', 'SFP, der nur eine interne Bedeutung hat'),
('9998', 'nach Quellenlage nicht zu spezifizieren');

CREATE TABLE IF NOT EXISTS ax_funktion_referenzstationspunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_referenzstationspunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_referenzstationspunkt IS 'Alias: "AX_Funktion_Referenzstationspunkt", UML-Typ: Enumeration';
INSERT INTO ax_funktion_referenzstationspunkt (wert,beschreibung) VALUES 
('1000', 'Zentrum'),
('2000', 'Exzentrum');

CREATE TABLE IF NOT EXISTS ax_funktion_lagefestpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_lagefestpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_lagefestpunkt IS 'Alias: "AX_Funktion_Lagefestpunkt", UML-Typ: Enumeration';
INSERT INTO ax_funktion_lagefestpunkt (wert,beschreibung) VALUES 
('1000', 'Zentrum'),
('2000', 'Exzentrum, Stationspunkt, Nebenstand'),
('3000', 'Zwillingspunkt, Orientierungspunkt'),
('4000', 'Versicherungspunkt');

CREATE TABLE IF NOT EXISTS ax_skizzenart_skizze (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_skizzenart_skizze_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_skizzenart_skizze IS 'Alias: "AX_Skizzenart_Skizze", UML-Typ: Enumeration';
INSERT INTO ax_skizzenart_skizze (wert,beschreibung) VALUES 
('1000', 'Lage-/Einmessungsskizze/Ansicht für die Standardausgabe'),
('2000', 'sonstige Lageskizze'),
('2100', 'sonstige Einmessungsskizze'),
('2200', 'sonstige Ansichtszeichnung oder Foto'),
('2300', 'Randzeichnung'),
('3000', 'Ausschnitt aus der Punktübersicht'),
('3100', 'Luftbildausschnitt mit Punkteintrag'),
('4000', 'Diagramm, Tabelle');

CREATE TABLE IF NOT EXISTS ax_funktion_schwerefestpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_schwerefestpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_schwerefestpunkt IS 'Alias: "AX_Funktion_Schwerefestpunkt", UML-Typ: Enumeration';
INSERT INTO ax_funktion_schwerefestpunkt (wert,beschreibung) VALUES 
('1000', 'Zentrum'),
('2000', 'Exzentrum');

CREATE TABLE IF NOT EXISTS ax_punktstabilitaet_hoehenfestpunkt_hoehenstabilitaetauswi (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_punktstabilitaet_hoehenfestpunkt_hoehenstabilitaetauswi_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_punktstabilitaet_hoehenfestpunkt_hoehenstabilitaetauswi IS 'Alias: "AX_Punktstabilitaet_Hoehenfestpunkt_HoehenstabilitaetAusWiederholungsmessungen", UML-Typ: Enumeration';
INSERT INTO ax_punktstabilitaet_hoehenfestpunkt_hoehenstabilitaetauswi (wert,beschreibung) VALUES 
('1000', 'sehr gut'),
('2000', 'gut'),
('3000', 'befriedigend'),
('4000', 'bedenklich'),
('5000', 'unzureichend'),
('9998', 'nicht bekannt');

CREATE TABLE IF NOT EXISTS ax_punktstabilitaet_hoehenfestpunkt_guetedesbaugrundes (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_punktstabilitaet_hoehenfestpunkt_guetedesbaugrundes_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_punktstabilitaet_hoehenfestpunkt_guetedesbaugrundes IS 'Alias: "AX_Punktstabilitaet_Hoehenfestpunkt_GueteDesBaugrundes", UML-Typ: Enumeration';
INSERT INTO ax_punktstabilitaet_hoehenfestpunkt_guetedesbaugrundes (wert,beschreibung) VALUES 
('1000', 'sehr gute Stabilität des Baugrundes'),
('2000', 'gute Stabilität des Baugrundes'),
('3000', 'befriedigende Güte des Baugrundes'),
('4000', 'ausreichende Güte des Baugrundes'),
('5000', 'mangelhafte Güte des Baugrundes'),
('9998', 'Güte des Baugrundes nicht untersucht');

CREATE TABLE IF NOT EXISTS ax_punktstabilitaet_hoehenfestpunkt_grundwasserschwankung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_punktstabilitaet_hoehenfestpunkt_grundwasserschwankung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_punktstabilitaet_hoehenfestpunkt_grundwasserschwankung IS 'Alias: "AX_Punktstabilitaet_Hoehenfestpunkt_Grundwasserschwankung", UML-Typ: Enumeration';
INSERT INTO ax_punktstabilitaet_hoehenfestpunkt_grundwasserschwankung (wert,beschreibung) VALUES 
('1000', 'sehr geringe Grundwasserschwankung (kleiner gleich 0,5 m)'),
('2000', 'geringe Grundwasserschwankung (groesser 0,5 m und kleiner gleich 2 m)'),
('3000', 'mäßige Grundwasserschwankung (groesser 2 m und kleiner gleich 5 m)'),
('4000', 'starke Grundwasserschwankung (groesser 5m und kleiner gleich 10 m)'),
('5000', 'sehr starke Grundwasserschwankung (groesser 10 m)'),
('9998', 'Grundwasserschwankung nicht ermittelt');

CREATE TABLE IF NOT EXISTS ax_punktstabilitaet_hoehenfestpunkt_topographieundumwelt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_punktstabilitaet_hoehenfestpunkt_topographieundumwelt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_punktstabilitaet_hoehenfestpunkt_topographieundumwelt IS 'Alias: "AX_Punktstabilitaet_Hoehenfestpunkt_TopographieUndUmwelt", UML-Typ: Enumeration';
INSERT INTO ax_punktstabilitaet_hoehenfestpunkt_topographieundumwelt (wert,beschreibung) VALUES 
('1000', 'keine Topographie- und Umwelteinflüsse'),
('2000', 'geringe Topographie- und Umwelteinflüsse'),
('3000', 'mäßige Topographie- und Umwelteinflüsse'),
('4000', 'starke Topographie- und Umwelteinflüsse'),
('5000', 'sehr starke Topographie- und Umwelteinflüsse'),
('9998', 'Topographie- und Umwelteinflüsse nicht untersucht');

CREATE TABLE IF NOT EXISTS ax_klassifikation_wertigkeit_lagefestpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_klassifikation_wertigkeit_lagefestpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_klassifikation_wertigkeit_lagefestpunkt IS 'Alias: "AX_Klassifikation_Wertigkeit_Lagefestpunkt", UML-Typ: Enumeration';
INSERT INTO ax_klassifikation_wertigkeit_lagefestpunkt (wert,beschreibung) VALUES 
('1000', 'Fundamentalpunkt (Punkt auf dem die Position (3D), die schwerebezogene Höhe und die Schwere hoch genau bestimmt worden sind)'),
('2000', 'Übergeordneter Festpunkt'),
('3000', 'Geodätischer Grundnetzpunkt'),
('4000', 'Gebrauchsfestpunkt'),
('5000', 'Untergeordneter Festpunkt'),
('9998', 'Nach Quellenlage nicht zu spezifizieren'),
('9999', 'Sonstiges');

CREATE TABLE IF NOT EXISTS ax_gnsstauglichkeit (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_gnsstauglichkeit_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_gnsstauglichkeit IS 'Alias: "AX_GNSSTauglichkeit", UML-Typ: Enumeration';
INSERT INTO ax_gnsstauglichkeit (wert,beschreibung) VALUES 
('1000', 'weitgehende Horizontfreiheit, Mehrwegeffekte nicht wahrscheinlich'),
('1001', 'sehr gute Satelliten-Empfangseigenschaften nachgewiesen'),
('3000', 'eingeschränkte Horizontfreiheit'),
('3001', 'eingeschränkte Horizontfreiheit, Tauglichkeit nachgewiesen'),
('3100', 'Mehrwegeffekte möglich'),
('3101', 'Mehrwegeffekte nachgewiesen'),
('5000', 'Festpunkt nicht geeignet für Satellitenmessverfahren'),
('9998', 'GNSS-Tauglichkeit nicht untersucht');

CREATE TABLE IF NOT EXISTS ax_punktstabilitaet_hoehenfestpunkt_grundwasserstand (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_punktstabilitaet_hoehenfestpunkt_grundwasserstand_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_punktstabilitaet_hoehenfestpunkt_grundwasserstand IS 'Alias: "AX_Punktstabilitaet_Hoehenfestpunkt_Grundwasserstand", UML-Typ: Enumeration';
INSERT INTO ax_punktstabilitaet_hoehenfestpunkt_grundwasserstand (wert,beschreibung) VALUES 
('1000', 'Grundwasserstand sehr tief (groesser 10 m)'),
('2000', 'Grundwasserstand tief (groesser 5 m und kleiner gleich 10 m)'),
('3000', 'Grundwasserstand normal (groesser 2 m und kleiner gleich 5 m)'),
('4000', 'Grundwasserstand hoch (groesser 0,5 m und kleiner gleich 2 m)'),
('5000', 'Grundwasserstand sehr hoch (kleiner gleich 0,5 m)'),
('9000', 'Grundwasserstand abgesenkt'),
('9998', 'Grundwasserstand nicht ermittelt');

CREATE TABLE IF NOT EXISTS ax_punktstabilitaet_hoehenfestpunkt_vermutetehoehenstabili (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_punktstabilitaet_hoehenfestpunkt_vermutetehoehenstabili_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_punktstabilitaet_hoehenfestpunkt_vermutetehoehenstabili IS 'Alias: "AX_Punktstabilitaet_Hoehenfestpunkt_VermuteteHoehenstabilitaet", UML-Typ: Enumeration';
INSERT INTO ax_punktstabilitaet_hoehenfestpunkt_vermutetehoehenstabili (wert,beschreibung) VALUES 
('1000', 'sehr gut'),
('2000', 'gut'),
('3000', 'befriedigend'),
('4000', 'ausreichend'),
('5000', 'mangelhaft'),
('9998', 'nicht bekannt');

CREATE TABLE IF NOT EXISTS ax_ordnung_hoehenfestpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_ordnung_hoehenfestpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_ordnung_hoehenfestpunkt IS 'Alias: "AX_Ordnung_Hoehenfestpunkt", UML-Typ: Enumeration';
INSERT INTO ax_ordnung_hoehenfestpunkt (wert,beschreibung) VALUES 
('1000', 'NivP(1) - Haupthöhenpunkt, Zwischenlinienpunkt 1.Ordnung'),
('1001', 'NivP(1) - Netzverdichtung GPS (Niedersachsen)'),
('2000', 'NivP(2) - Nivellementpunkt 2. Ordnung'),
('3000', 'NivP(3) - Nivellementpunkt 3. Ordnung'),
('3001', 'NivP(3) - nivellitisch bestimmter Bodenpunkt für Referenzstation'),
('4000', 'NivP(4) - Nivellementpunkt 4. Ordnung'),
('6000', 'ÜH - Übergeordneter Höhenfestpunkt (Berlin)'),
('9000', 'Höhenfestpunkt, der nur eine interne Bedeutung hat'),
('9998', 'Nach Quellenlage nicht zu spezifizieren');

CREATE TABLE IF NOT EXISTS ax_horizontfreiheit_grenzpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_horizontfreiheit_grenzpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_horizontfreiheit_grenzpunkt IS 'Alias: "AX_Horizontfreiheit_Grenzpunkt", UML-Typ: Enumeration';
INSERT INTO ax_horizontfreiheit_grenzpunkt (wert,beschreibung) VALUES 
('1000', 'Uneingeschränkt'),
('2000', 'Eingeschränkt'),
('3000', 'Nicht geeignet');

CREATE TABLE IF NOT EXISTS ax_gruendederausgesetztenabmarkung_grenzpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_gruendederausgesetztenabmarkung_grenzpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_gruendederausgesetztenabmarkung_grenzpunkt IS 'Alias: "AX_GruendeDerAusgesetztenAbmarkung_Grenzpunkt", UML-Typ: Enumeration';
INSERT INTO ax_gruendederausgesetztenabmarkung_grenzpunkt (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_bemerkungzurabmarkung_grenzpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bemerkungzurabmarkung_grenzpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bemerkungzurabmarkung_grenzpunkt IS 'Alias: "AX_BemerkungZurAbmarkung_Grenzpunkt", UML-Typ: Enumeration';
INSERT INTO ax_bemerkungzurabmarkung_grenzpunkt (wert,beschreibung) VALUES 
('1000', 'Abmarkung unterirdisch gesichert'),
('2000', 'Abmarkung exzentrisch gesichert'),
('3000', 'Abmarkung unterirdisch und exzentrisch gesichert'),
('4000', 'Ohne unterirdische oder exzentrische Sicherung');

CREATE TABLE IF NOT EXISTS ax_artderflurstuecksgrenze_besondereflurstuecksgrenze (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderflurstuecksgrenze_besondereflurstuecksgrenze_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderflurstuecksgrenze_besondereflurstuecksgrenze IS 'Alias: "AX_ArtDerFlurstuecksgrenze_BesondereFlurstuecksgrenze", UML-Typ: Enumeration';
INSERT INTO ax_artderflurstuecksgrenze_besondereflurstuecksgrenze (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_horizontfreiheit_netzpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_horizontfreiheit_netzpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_horizontfreiheit_netzpunkt IS 'Alias: "AX_Horizontfreiheit_Netzpunkt", UML-Typ: Enumeration';
INSERT INTO ax_horizontfreiheit_netzpunkt (wert,beschreibung) VALUES 
('1000', 'Uneingeschränkt'),
('2000', 'Eingeschränkt'),
('3000', 'Nicht geeignet');

CREATE TABLE IF NOT EXISTS ax_marke (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_marke_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_marke IS 'Alias: "AX_Marke", UML-Typ: Enumeration';
INSERT INTO ax_marke (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_genauigkeitsstufe_punktort (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_genauigkeitsstufe_punktort_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_genauigkeitsstufe_punktort IS 'Alias: "AX_Genauigkeitsstufe_Punktort", UML-Typ: Enumeration';
INSERT INTO ax_genauigkeitsstufe_punktort (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_messmethode_schwere (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_messmethode_schwere_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_messmethode_schwere IS 'Alias: "AX_Messmethode_Schwere", UML-Typ: Enumeration';
INSERT INTO ax_messmethode_schwere (wert,beschreibung) VALUES 
('1000', 'Aus Absolutgravimetermessung ermittelt'),
('2000', 'Aus Relativgravimetermessung ermittelt');

CREATE TABLE IF NOT EXISTS ax_koordinatenstatus_punktort (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_koordinatenstatus_punktort_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_koordinatenstatus_punktort IS 'Alias: "AX_Koordinatenstatus_Punktort", UML-Typ: Enumeration';
INSERT INTO ax_koordinatenstatus_punktort (wert,beschreibung) VALUES 
('1000', 'Amtliche Koordinaten bzw. amtliche Höhe'),
('2000', 'Weitere gültige Koordinaten bzw. weitere gültige Höhe'),
('3000', 'Vorläufige Koordinaten bzw. vorläufige Höhe'),
('4000', 'Zu keiner Zeit gültig gewesene Koordinaten bzw. Höhe'),
('5000', 'Historische (nicht mehr gültige)  Koordinaten bzw. Höhe'),
('5100', 'Koordinaten bzw. Höhe, die sich als fehlerhaft herausgestellt haben');

CREATE TABLE IF NOT EXISTS ax_datenerhebung_schwere (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_datenerhebung_schwere_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_datenerhebung_schwere IS 'Alias: "AX_Datenerhebung_Schwere", UML-Typ: Enumeration';
INSERT INTO ax_datenerhebung_schwere (wert,beschreibung) VALUES 
('1000', 'Schwerewert direkt gemessen oder mittels Freiluftreduktion über geringe Entfernung abgeleitet (Höhenunterschied bis 1 m, Horizontalabstand bis 5 m)'),
('2000', 'Schwerewert mittels Freiluftreduktion über größere Entfernung abgeleitet'),
('3000', 'Schwerewert mittels Interpolation unter Verwendung einfacher Bougueranomalien ermittelt'),
('3100', 'Schwerewert im System DHSN 96 durch Abschlag ( -19 10-8 m s-2 ) aus Schwerewert im System DHSN 82 ermittelt (alte Bundesländer)'),
('3200', 'Schwerewert DHSN 96 durch Transformation aus System 71 ermittelt (neue Bundesländer)'),
('4000', 'Schwerewert durch andere Methode ermittelt'),
('9998', 'Methode der Datenerhebung Schwere unbekannt');

CREATE TABLE IF NOT EXISTS ax_vertrauenswuerdigkeit_schwere (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_vertrauenswuerdigkeit_schwere_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_vertrauenswuerdigkeit_schwere IS 'Alias: "AX_Vertrauenswuerdigkeit_Schwere", UML-Typ: Enumeration';
INSERT INTO ax_vertrauenswuerdigkeit_schwere (wert,beschreibung) VALUES 
('1100', 'Vertrauenswürdigkeitsstufe Ausgleichung'),
('1300', 'Vertrauenswürdigkeitsstufe ohne Ausgleichung kontrolliert'),
('1400', 'Vertrauenswürdigkeitsstufe unkontrolliert');

CREATE TABLE IF NOT EXISTS ax_schwereanomalie_schwere_art (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_schwereanomalie_schwere_art_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_schwereanomalie_schwere_art IS 'Alias: "AX_Schwereanomalie_Schwere_Art", UML-Typ: Enumeration';
INSERT INTO ax_schwereanomalie_schwere_art (wert,beschreibung) VALUES 
('1000', 'Geländereduktion (Reliefkorrektion)'),
('2000', 'Freiluftanomalie im System Potsdam 1909 - Normalschwere nach Helmert 1901 - Breite auf dem Krassowski-Ellipsoid'),
('3000', 'Freiluftanomalie im System Potsdam 1909 mit Geländereduktion (Fayeanomalie) - Normalschwere nach Helmert 1901 - Breite auf dem Krassowski-Ellipsoid'),
('3100', 'Freiluftanomalie nach Molodenski: Schwere (im System DHSN 96) im Oberflächenpunkt minus Normalschwere (Formel des GRS 80) im Telluroidpunkt'),
('4000', 'Bougueranomalie im System Potsdam 1909 mit Geländereduktion - Normalschwere nach Helmert 1901 - Breite auf dem Krassowski-Ellipsoid'),
('5000', 'Bougueranomalie im System DHSN 82 mit Freiluft- und Plattenreduktion - Normalschwere im GRS 80'),
('6000', 'Bougueranomalie im System DHSN 96 mit Freiluft- und Plattenreduktion - Normalschwere im GRS 80'),
('9998', 'Art der Anomalie bzw. Reduktion unbekannt');

CREATE TABLE IF NOT EXISTS ax_vertrauenswuerdigkeit_punktort (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_vertrauenswuerdigkeit_punktort_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_vertrauenswuerdigkeit_punktort IS 'Alias: "AX_Vertrauenswuerdigkeit_Punktort", UML-Typ: Enumeration';
INSERT INTO ax_vertrauenswuerdigkeit_punktort (wert,beschreibung) VALUES 
('1100', 'Vertrauenswürdigkeitsstufe Ausgleichung'),
('1200', 'Vertrauenswürdigkeitsstufe Berechnung'),
('1300', 'Vertrauenswürdigkeitsstufe Bestimmungsverfahren'),
('1400', 'Vertrauenswürdigkeitsstufe ohne Kontrollen');

CREATE TABLE IF NOT EXISTS ax_schwerestatus_schwere (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_schwerestatus_schwere_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_schwerestatus_schwere IS 'Alias: "AX_Schwerestatus_Schwere", UML-Typ: Enumeration';
INSERT INTO ax_schwerestatus_schwere (wert,beschreibung) VALUES 
('1000', 'amtlicher Schwerewert (gültiger Wert im amtlichen Schweresystem)'),
('2000', 'weiterer gültiger Schwerewert (nicht im amtlichen Schweresystem)'),
('3000', 'vorläufiger Schwerewert'),
('4000', 'zu keiner Zeit gültig gewesener Schwerewert'),
('5000', 'historischer (nicht mehr gültiger) Schwerewert'),
('5100', 'Schwerewert, der sich als fehlerhaft herausgestellt hat');

CREATE TABLE IF NOT EXISTS ax_li_processstep_punktort_description (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT ax_li_processstep_punktort_description_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_li_processstep_punktort_description IS 'Alias: "AX_LI_ProcessStep_Punktort_Description", UML-Typ: Enumeration';
INSERT INTO ax_li_processstep_punktort_description (wert,beschreibung) VALUES 
('Erhebung', NULL),
('Berechnung', NULL);

CREATE TABLE IF NOT EXISTS ax_genauigkeitsstufe_schwere (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_genauigkeitsstufe_schwere_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_genauigkeitsstufe_schwere IS 'Alias: "AX_Genauigkeitsstufe_Schwere", UML-Typ: Enumeration';
INSERT INTO ax_genauigkeitsstufe_schwere (wert,beschreibung) VALUES 
('1000', 'Standardabweichung S kleiner 20 10-8m s-2'),
('2000', 'Standardabweichung S kleiner gleich 100 10-8m s-2'),
('3000', 'Standardabweichung S groesser 100 10-8m s-2'),
('4000', 'Als Schwereanschlusspunkt ungeeignet');

CREATE TABLE IF NOT EXISTS ax_datenerhebung_punktort (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_datenerhebung_punktort_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_datenerhebung_punktort IS 'Alias: "AX_Datenerhebung_Punktort", UML-Typ: Enumeration';
INSERT INTO ax_datenerhebung_punktort (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_schweresystem_schwere (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_schweresystem_schwere_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_schweresystem_schwere IS 'Alias: "AX_Schweresystem_Schwere", UML-Typ: Enumeration';
INSERT INTO ax_schweresystem_schwere (wert,beschreibung) VALUES 
('1000', 'Schwerewert im System des DHSN 82 (System der Landesvermessung)'),
('1100', 'Schwerewert im System des DSGN 62 (auch als DSN 62 bezeichnet)'),
('1200', 'Schwerewert im System des SGN der DDR (auch als System 71 bezeichnet)'),
('1300', 'Schwerewert im System des DHSN 96 (System der Landesvermessung)'),
('4000', 'Schwerewert im System des ISGN 71 (wissenschaftliches System)'),
('4010', 'Schwerewert im System des DSGN 76 (wissenschaftliches System)'),
('4020', 'Schwerewert im System des DSGN 94 (wissenschaftliches System)'),
('6000', 'Potsdamer Schweresystem 1909'),
('6100', 'Schweresystem der Geophysikalischen Reichsaufnahme 1934 - 1943');

CREATE TABLE IF NOT EXISTS ax_blattart_historischesflurstueck (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_blattart_historischesflurstueck_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_blattart_historischesflurstueck IS 'Alias: "AX_Blattart_HistorischesFlurstueck", UML-Typ: Enumeration';
INSERT INTO ax_blattart_historischesflurstueck (wert,beschreibung) VALUES 
('1000', 'Grundbuchblatt'),
('2000', 'Katasterblatt');

CREATE TABLE IF NOT EXISTS ax_qualitaet_hauskoordinate (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_qualitaet_hauskoordinate_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_qualitaet_hauskoordinate IS 'Alias: "AX_Qualitaet_Hauskoordinate", UML-Typ: Enumeration';
INSERT INTO ax_qualitaet_hauskoordinate (wert,beschreibung) VALUES 
('1000', 'gebaeudeumring (A)'),
('2000', 'innerhalbFlurstueck (B)'),
('3000', 'interpoliert (C)');

CREATE TABLE IF NOT EXISTS ax_art_punktkennung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_punktkennung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_punktkennung IS 'Alias: "AX_Art_Punktkennung", UML-Typ: Enumeration';
INSERT INTO ax_art_punktkennung (wert,beschreibung) VALUES 
('1000', 'Punktkennung - allgemein'),
('1100', 'Punktkennung - Grenzpunkt'),
('1200', 'Punktkennung - Besonderer Gebäudepunkt'),
('1300', 'Punktkennung - Besonderer topographischer Punkt'),
('1400', 'Punktkennung - Aufnahmepunkt'),
('1500', 'Punktkennung - Sicherungspunkt'),
('1600', 'Punktkennung - Sonstiger Vermessungspunkt'),
('1700', 'Punktkennung - Besonderer Bauwerkspunkt');

CREATE TABLE IF NOT EXISTS ax_art_reservierung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_reservierung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_reservierung IS 'Alias: "AX_Art_Reservierung", UML-Typ: Enumeration';
INSERT INTO ax_art_reservierung (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_art_adressat_auszug (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_adressat_auszug_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_adressat_auszug IS 'Alias: "AX_Art_Adressat_Auszug", UML-Typ: Enumeration';
INSERT INTO ax_art_adressat_auszug (wert,beschreibung) VALUES 
('1000', 'Privat'),
('2000', 'Notar'),
('3000', 'Grundbuchamt'),
('4000', 'Finanzamt'),
('5000', 'Bauaufsichtsbehörde'),
('6000', 'Weitere Beteiligte');

CREATE TABLE IF NOT EXISTS ax_lagezurerdoberflaeche_bauteil (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_lagezurerdoberflaeche_bauteil_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_lagezurerdoberflaeche_bauteil IS 'Alias: "AX_LageZurErdoberflaeche_Bauteil", UML-Typ: Enumeration';
INSERT INTO ax_lagezurerdoberflaeche_bauteil (wert,beschreibung) VALUES 
('1200', 'Unter der Erdoberfläche'),
('1400', 'Aufgeständert');

CREATE TABLE IF NOT EXISTS ax_lagezurerdoberflaeche_gebaeude (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_lagezurerdoberflaeche_gebaeude_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_lagezurerdoberflaeche_gebaeude IS 'Alias: "AX_LageZurErdoberflaeche_Gebaeude", UML-Typ: Enumeration';
INSERT INTO ax_lagezurerdoberflaeche_gebaeude (wert,beschreibung) VALUES 
('1200', 'Unter der Erdoberfläche'),
('1400', 'Aufgeständert');

CREATE TABLE IF NOT EXISTS ax_zustand_gebaeude (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_gebaeude_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_gebaeude IS 'Alias: "AX_Zustand_Gebaeude", UML-Typ: Enumeration';
INSERT INTO ax_zustand_gebaeude (wert,beschreibung) VALUES 
('1000', 'In behelfsmäßigem Zustand'),
('2000', 'In ungenutztem Zustand'),
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('2200', 'Verfallen, zerstört'),
('2300', 'Teilweise zerstört'),
('3000', 'Geplant und beantragt'),
('4000', 'Im Bau');

CREATE TABLE IF NOT EXISTS ax_dachgeschossausbau_gebaeude (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_dachgeschossausbau_gebaeude_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_dachgeschossausbau_gebaeude IS 'Alias: "AX_Dachgeschossausbau_Gebaeude", UML-Typ: Enumeration';
INSERT INTO ax_dachgeschossausbau_gebaeude (wert,beschreibung) VALUES 
('1000', 'Nicht ausbaufähig'),
('2000', 'Ausbaufähig'),
('3000', 'Ausgebaut'),
('4000', 'Ausbaufähigkeit unklar');

CREATE TABLE IF NOT EXISTS ax_dachform (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_dachform_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_dachform IS 'Alias: "AX_Dachform", UML-Typ: Enumeration';
INSERT INTO ax_dachform (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_bauweise_gebaeude (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bauweise_gebaeude_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bauweise_gebaeude IS 'Alias: "AX_Bauweise_Gebaeude", UML-Typ: Enumeration';
INSERT INTO ax_bauweise_gebaeude (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_gebaeudefunktion (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_gebaeudefunktion_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_gebaeudefunktion IS 'Alias: "AX_Gebaeudefunktion", UML-Typ: Enumeration';
INSERT INTO ax_gebaeudefunktion (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_art_gebaeudepunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_gebaeudepunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_gebaeudepunkt IS 'Alias: "AX_Art_Gebaeudepunkt", UML-Typ: Enumeration';
INSERT INTO ax_art_gebaeudepunkt (wert,beschreibung) VALUES 
('1100', 'First'),
('1200', 'Traufe'),
('2100', 'Eingang'),
('2200', 'Lichtschacht');

CREATE TABLE IF NOT EXISTS ax_weitere_gebaeudefunktion (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_weitere_gebaeudefunktion_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_weitere_gebaeudefunktion IS 'Alias: "AX_Weitere_Gebaeudefunktion", UML-Typ: Enumeration';
INSERT INTO ax_weitere_gebaeudefunktion (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_beschaffenheit_besonderegebaeudelinie (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_beschaffenheit_besonderegebaeudelinie_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_beschaffenheit_besonderegebaeudelinie IS 'Alias: "AX_Beschaffenheit_BesondereGebaeudelinie", UML-Typ: Enumeration';
INSERT INTO ax_beschaffenheit_besonderegebaeudelinie (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_bauart_bauteil (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bauart_bauteil_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bauart_bauteil IS 'Alias: "AX_Bauart_Bauteil", UML-Typ: Enumeration';
INSERT INTO ax_bauart_bauteil (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_nutzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_nutzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_nutzung IS 'Alias: "AX_Nutzung", UML-Typ: Enumeration';
INSERT INTO ax_nutzung (wert,beschreibung) VALUES 
('1000', 'Zivil'),
('1100', 'Privat'),
('1200', 'Öffentlich'),
('1300', 'Religiös'),
('2000', 'Militärisch');

CREATE TABLE IF NOT EXISTS ax_art_verbandsgemeinde (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_verbandsgemeinde_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_verbandsgemeinde IS 'Alias: "AX_Art_Verbandsgemeinde", UML-Typ: Enumeration';
INSERT INTO ax_art_verbandsgemeinde (wert,beschreibung) VALUES 
('1000', 'Samtgemeinde'),
('2000', 'Verbandsgemeinde'),
('3000', 'Amt');

CREATE TABLE IF NOT EXISTS ax_art_baublock (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_baublock_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_baublock IS 'Alias: "AX_Art_Baublock", UML-Typ: Enumeration';
INSERT INTO ax_art_baublock (wert,beschreibung) VALUES 
('1000', 'Nettobaublockfläche'),
('2000', 'Bruttobaublockfläche');

CREATE TABLE IF NOT EXISTS ax_artdergebietsgrenze_gebietsgrenze (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artdergebietsgrenze_gebietsgrenze_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artdergebietsgrenze_gebietsgrenze IS 'Alias: "AX_ArtDerGebietsgrenze_Gebietsgrenze", UML-Typ: Enumeration';
INSERT INTO ax_artdergebietsgrenze_gebietsgrenze (wert,beschreibung) VALUES 
('7101', 'Grenze der Bundesrepublik Deutschland'),
('7102', 'Grenze des Bundeslandes'),
('7103', 'Grenze des Regierungsbezirks'),
('7104', 'Grenze des Kreises/Region'),
('7105', 'Grenze der Verwaltungsgemeinschaft'),
('7106', 'Grenze der Gemeinde'),
('7107', 'Grenze des Gemeindeteils');

CREATE TABLE IF NOT EXISTS ax_sonstigeangaben_bodenschaetzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_sonstigeangaben_bodenschaetzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_sonstigeangaben_bodenschaetzung IS 'Alias: "AX_SonstigeAngaben_Bodenschaetzung", UML-Typ: Enumeration';
INSERT INTO ax_sonstigeangaben_bodenschaetzung (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_kulturart_musterlandesmusterundvergleichsstueck (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_kulturart_musterlandesmusterundvergleichsstueck_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_kulturart_musterlandesmusterundvergleichsstueck IS 'Alias: "AX_Kulturart_MusterLandesmusterUndVergleichsstueck", UML-Typ: Enumeration';
INSERT INTO ax_kulturart_musterlandesmusterundvergleichsstueck (wert,beschreibung) VALUES 
('1000', 'Ackerland (A)'),
('2000', 'Acker-Grünland (AGr)'),
('3000', 'Grünland (Gr)'),
('4000', 'Grünland-Acker (GrA)');

CREATE TABLE IF NOT EXISTS ax_entstehungsartoderklimastufewasserverhaeltnisse_bodensc (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_entstehungsartoderklimastufewasserverhaeltnisse_bodensc_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_entstehungsartoderklimastufewasserverhaeltnisse_bodensc IS 'Alias: "AX_EntstehungsartOderKlimastufeWasserverhaeltnisse_Bodenschaetzung", UML-Typ: Enumeration';
INSERT INTO ax_entstehungsartoderklimastufewasserverhaeltnisse_bodensc (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_sonstigeangaben_musterlandesmusterundvergleichsstueck (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_sonstigeangaben_musterlandesmusterundvergleichsstueck_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_sonstigeangaben_musterlandesmusterundvergleichsstueck IS 'Alias: "AX_SonstigeAngaben_MusterLandesmusterUndVergleichsstueck", UML-Typ: Enumeration';
INSERT INTO ax_sonstigeangaben_musterlandesmusterundvergleichsstueck (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_kulturart_bodenschaetzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_kulturart_bodenschaetzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_kulturart_bodenschaetzung IS 'Alias: "AX_Kulturart_Bodenschaetzung", UML-Typ: Enumeration';
INSERT INTO ax_kulturart_bodenschaetzung (wert,beschreibung) VALUES 
('1000', 'Ackerland (A)'),
('2000', 'Acker-Grünland (AGr)'),
('3000', 'Grünland (Gr)'),
('4000', 'Grünland-Acker (GrA)');

CREATE TABLE IF NOT EXISTS ax_klassifizierung_bewertung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_klassifizierung_bewertung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_klassifizierung_bewertung IS 'Alias: "AX_Klassifizierung_Bewertung", UML-Typ: Enumeration';
INSERT INTO ax_klassifizierung_bewertung (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_merkmal_musterlandesmusterundvergleichsstueck (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_merkmal_musterlandesmusterundvergleichsstueck_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_merkmal_musterlandesmusterundvergleichsstueck IS 'Alias: "AX_Merkmal_MusterLandesmusterUndVergleichsstueck", UML-Typ: Enumeration';
INSERT INTO ax_merkmal_musterlandesmusterundvergleichsstueck (wert,beschreibung) VALUES 
('1000', 'Musterstück (M)'),
('2000', 'Landesmusterstück (L)'),
('3000', 'Vergleichsstück (V)');

CREATE TABLE IF NOT EXISTS ax_zustandsstufeoderbodenstufe_bodenschaetzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustandsstufeoderbodenstufe_bodenschaetzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustandsstufeoderbodenstufe_bodenschaetzung IS 'Alias: "AX_ZustandsstufeOderBodenstufe_Bodenschaetzung", UML-Typ: Enumeration';
INSERT INTO ax_zustandsstufeoderbodenstufe_bodenschaetzung (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_bedeutung_grablochderbodenschaetzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bedeutung_grablochderbodenschaetzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bedeutung_grablochderbodenschaetzung IS 'Alias: "AX_Bedeutung_GrablochDerBodenschaetzung", UML-Typ: Enumeration';
INSERT INTO ax_bedeutung_grablochderbodenschaetzung (wert,beschreibung) VALUES 
('1100', 'Grabloch, bestimmend, lagerichtig (innerhalb der Fläche)'),
('1200', 'Grabloch, bestimmend, lagerichtig (außerhalb des Abschnitts)'),
('1300', 'Grabloch, nicht lagerichtig, im Abschnitt nicht vorhanden'),
('2000', 'Grabloch für Muster-, Landesmuster-, Vergleichsstück'),
('3000', 'Grabloch, nicht bestimmend');

CREATE TABLE IF NOT EXISTS ax_zustandsstufeoderbodenstufe_musterlandesmusterundvergle (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustandsstufeoderbodenstufe_musterlandesmusterundvergle_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustandsstufeoderbodenstufe_musterlandesmusterundvergle IS 'Alias: "AX_ZustandsstufeOderBodenstufe_MusterLandesmusterUndVergleichsstueck", UML-Typ: Enumeration';
INSERT INTO ax_zustandsstufeoderbodenstufe_musterlandesmusterundvergle (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_entstehungsartoderklimastufewasserverhaeltnisse_musterl (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_entstehungsartoderklimastufewasserverhaeltnisse_musterl_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_entstehungsartoderklimastufewasserverhaeltnisse_musterl IS 'Alias: "AX_EntstehungsartOderKlimastufeWasserverhaeltnisse_MusterLandesmusterUndVergleichsstueck", UML-Typ: Enumeration';
INSERT INTO ax_entstehungsartoderklimastufewasserverhaeltnisse_musterl (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_bodenart_bodenschaetzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bodenart_bodenschaetzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bodenart_bodenschaetzung IS 'Alias: "AX_Bodenart_Bodenschaetzung", UML-Typ: Enumeration';
INSERT INTO ax_bodenart_bodenschaetzung (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_bodenart_musterlandesmusterundvergleichsstueck (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bodenart_musterlandesmusterundvergleichsstueck_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bodenart_musterlandesmusterundvergleichsstueck IS 'Alias: "AX_Bodenart_MusterLandesmusterUndVergleichsstueck", UML-Typ: Enumeration';
INSERT INTO ax_bodenart_musterlandesmusterundvergleichsstueck (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_landschaftstyp (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_landschaftstyp_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_landschaftstyp IS 'Alias: "AX_Landschaftstyp", UML-Typ: Enumeration';
INSERT INTO ax_landschaftstyp (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_art_verband (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_verband_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_verband IS 'Alias: "AX_Art_Verband", UML-Typ: Enumeration';
INSERT INTO ax_art_verband (wert,beschreibung) VALUES 
('1000', 'Planungsverband'),
('2000', 'Region'),
('9999', 'Sonstiges');

CREATE TABLE IF NOT EXISTS ax_behoerde (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_behoerde_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_behoerde IS 'Alias: "AX_Behoerde", UML-Typ: Enumeration';
INSERT INTO ax_behoerde (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_administrative_funktion (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_administrative_funktion_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_administrative_funktion IS 'Alias: "AX_Administrative_Funktion", UML-Typ: Enumeration';
INSERT INTO ax_administrative_funktion (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_bezeichnung_verwaltungsgemeinschaft (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bezeichnung_verwaltungsgemeinschaft_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bezeichnung_verwaltungsgemeinschaft IS 'Alias: "AX_Bezeichnung_Verwaltungsgemeinschaft", UML-Typ: Enumeration';
INSERT INTO ax_bezeichnung_verwaltungsgemeinschaft (wert,beschreibung) VALUES 
('1000', 'Samtgemeinde'),
('2000', 'Verbandsgemeinde'),
('3000', 'Amt'),
('9999', 'Sonstiges');

CREATE TABLE IF NOT EXISTS ax_funktion_schutzgebietnachwasserrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_schutzgebietnachwasserrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_schutzgebietnachwasserrecht IS 'Alias: "AX_Funktion_SchutzgebietNachWasserrecht", UML-Typ: Enumeration';
INSERT INTO ax_funktion_schutzgebietnachwasserrecht (wert,beschreibung) VALUES 
('2111', 'Öffentliche Wasserversorgung'),
('2112', 'Grundwasseranreicherung'),
('2113', 'Verhütung von schädlichem Abfluss');

CREATE TABLE IF NOT EXISTS ax_artderfestlegung_schutzgebietnachnaturumweltoderbodensc (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderfestlegung_schutzgebietnachnaturumweltoderbodensc_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderfestlegung_schutzgebietnachnaturumweltoderbodensc IS 'Alias: "AX_ArtDerFestlegung_SchutzgebietNachNaturUmweltOderBodenschutzrecht", UML-Typ: Enumeration';
INSERT INTO ax_artderfestlegung_schutzgebietnachnaturumweltoderbodensc (wert,beschreibung) VALUES 
('1670', 'Nationalpark'),
('1680', 'Lärmschutzbereich'),
('1690', 'Biosphärenreservat');

CREATE TABLE IF NOT EXISTS ax_artderfestlegung_anderefestlegungnachstrassenrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderfestlegung_anderefestlegungnachstrassenrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderfestlegung_anderefestlegungnachstrassenrecht IS 'Alias: "AX_ArtDerFestlegung_AndereFestlegungNachStrassenrecht", UML-Typ: Enumeration';
INSERT INTO ax_artderfestlegung_anderefestlegungnachstrassenrecht (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_artderfestlegung_schutzgebietnachwasserrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderfestlegung_schutzgebietnachwasserrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderfestlegung_schutzgebietnachwasserrecht IS 'Alias: "AX_ArtDerFestlegung_SchutzgebietNachWasserrecht", UML-Typ: Enumeration';
INSERT INTO ax_artderfestlegung_schutzgebietnachwasserrecht (wert,beschreibung) VALUES 
('1510', 'Wasserschutzgebiet'),
('1520', 'Heilquellenschutzgebiet');

CREATE TABLE IF NOT EXISTS ax_besonderefunktion_forstrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_besonderefunktion_forstrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_besonderefunktion_forstrecht IS 'Alias: "AX_BesondereFunktion_Forstrecht", UML-Typ: Enumeration';
INSERT INTO ax_besonderefunktion_forstrecht (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_zone_schutzzone (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zone_schutzzone_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zone_schutzzone IS 'Alias: "AX_Zone_Schutzzone", UML-Typ: Enumeration';
INSERT INTO ax_zone_schutzzone (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_artderfestlegung_klassifizierungnachstrassenrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderfestlegung_klassifizierungnachstrassenrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderfestlegung_klassifizierungnachstrassenrecht IS 'Alias: "AX_ArtDerFestlegung_KlassifizierungNachStrassenrecht", UML-Typ: Enumeration';
INSERT INTO ax_artderfestlegung_klassifizierungnachstrassenrecht (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_artderfestlegung_denkmalschutzrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderfestlegung_denkmalschutzrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderfestlegung_denkmalschutzrecht IS 'Alias: "AX_ArtDerFestlegung_Denkmalschutzrecht", UML-Typ: Enumeration';
INSERT INTO ax_artderfestlegung_denkmalschutzrecht (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_artderfestlegung_klassifizierungnachwasserrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderfestlegung_klassifizierungnachwasserrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderfestlegung_klassifizierungnachwasserrecht IS 'Alias: "AX_ArtDerFestlegung_KlassifizierungNachWasserrecht", UML-Typ: Enumeration';
INSERT INTO ax_artderfestlegung_klassifizierungnachwasserrecht (wert,beschreibung) VALUES 
('1300', 'Klassifizierung nach Bundes- oder Landeswassergesetz'),
('1310', 'Gewässer I. Ordnung - Bundeswasserstraße'),
('1320', 'Gewässer I. Ordnung - nach Landesrecht'),
('1330', 'Gewässer II. Ordnung'),
('1340', 'Gewässer III. Ordnung');

CREATE TABLE IF NOT EXISTS ax_rechtszustand_schutzzone (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_rechtszustand_schutzzone_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_rechtszustand_schutzzone IS 'Alias: "AX_Rechtszustand_Schutzzone", UML-Typ: Enumeration';
INSERT INTO ax_rechtszustand_schutzzone (wert,beschreibung) VALUES 
('1000', 'Amtlich festgestellt'),
('2000', 'Im Verfahren befindlich'),
('3000', 'In Planung');

CREATE TABLE IF NOT EXISTS ax_artderfestlegung_bauraumoderbodenordnungsrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderfestlegung_bauraumoderbodenordnungsrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderfestlegung_bauraumoderbodenordnungsrecht IS 'Alias: "AX_ArtDerFestlegung_BauRaumOderBodenordnungsrecht", UML-Typ: Enumeration';
INSERT INTO ax_artderfestlegung_bauraumoderbodenordnungsrecht (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_artderfestlegung_anderefestlegungnachwasserrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderfestlegung_anderefestlegungnachwasserrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderfestlegung_anderefestlegungnachwasserrecht IS 'Alias: "AX_ArtDerFestlegung_AndereFestlegungNachWasserrecht", UML-Typ: Enumeration';
INSERT INTO ax_artderfestlegung_anderefestlegungnachwasserrecht (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_artderfestlegung_forstrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderfestlegung_forstrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderfestlegung_forstrecht IS 'Alias: "AX_ArtDerFestlegung_Forstrecht", UML-Typ: Enumeration';
INSERT INTO ax_artderfestlegung_forstrecht (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_zustand_naturumweltoderbodenschutzrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_naturumweltoderbodenschutzrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_naturumweltoderbodenschutzrecht IS 'Alias: "AX_Zustand_NaturUmweltOderBodenschutzrecht", UML-Typ: Enumeration';
INSERT INTO ax_zustand_naturumweltoderbodenschutzrecht (wert,beschreibung) VALUES 
('1000', 'Amtlich festgestellt'),
('2000', 'Einstweilig sicher gestellt');

CREATE TABLE IF NOT EXISTS ax_artderfestlegung_sonstigesrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderfestlegung_sonstigesrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderfestlegung_sonstigesrecht IS 'Alias: "AX_ArtDerFestlegung_SonstigesRecht", UML-Typ: Enumeration';
INSERT INTO ax_artderfestlegung_sonstigesrecht (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_artderfestlegung_naturumweltoderbodenschutzrecht (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderfestlegung_naturumweltoderbodenschutzrecht_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderfestlegung_naturumweltoderbodenschutzrecht IS 'Alias: "AX_ArtDerFestlegung_NaturUmweltOderBodenschutzrecht", UML-Typ: Enumeration';
INSERT INTO ax_artderfestlegung_naturumweltoderbodenschutzrecht (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_liniendarstellung_topographischelinie (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_liniendarstellung_topographischelinie_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_liniendarstellung_topographischelinie IS 'Alias: "AX_Liniendarstellung_TopographischeLinie", UML-Typ: Enumeration';
INSERT INTO ax_liniendarstellung_topographischelinie (wert,beschreibung) VALUES 
('1000', 'Durchgezogen'),
('2000', 'Lang gestrichelt'),
('3000', 'Kurz gestrichelt');

CREATE TABLE IF NOT EXISTS ax_darstellung_gebaeudeausgestaltung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_darstellung_gebaeudeausgestaltung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_darstellung_gebaeudeausgestaltung IS 'Alias: "AX_Darstellung_Gebaeudeausgestaltung", UML-Typ: Enumeration';
INSERT INTO ax_darstellung_gebaeudeausgestaltung (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_datenformat_benutzer (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_datenformat_benutzer_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_datenformat_benutzer IS 'Alias: "AX_Datenformat_Benutzer", UML-Typ: Enumeration';
INSERT INTO ax_datenformat_benutzer (wert,beschreibung) VALUES 
('1000', 'NAS'),
('2000', 'DXF'),
('3000', 'TIFF'),
('4000', 'GeoTIFF');

CREATE TABLE IF NOT EXISTS ax_art_bereichzeitlich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_bereichzeitlich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_bereichzeitlich IS 'Alias: "AX_Art_BereichZeitlich", UML-Typ: Enumeration';
INSERT INTO ax_art_bereichzeitlich (wert,beschreibung) VALUES 
('1000', 'Stichtagsbezogen ohne Historie'),
('1100', 'Stichtagsbezogen mit Historie'),
('3000', 'Fallbezogen ohne Historie'),
('3100', 'Fallbezogen mit Historie');

CREATE TABLE IF NOT EXISTS ax_letzteabgabeart (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_letzteabgabeart_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_letzteabgabeart IS 'Alias: "AX_LetzteAbgabeArt", UML-Typ: Enumeration';
INSERT INTO ax_letzteabgabeart (wert,beschreibung) VALUES 
('1000', 'Zeitintervall'),
('1100', 'NBA auf Abruf'),
('2000', 'Wiederholungslauf'),
('2100', 'Aufholungslauf auf Abruf'),
('2200', 'Aufholungslauf bis Intervallende');

CREATE TABLE IF NOT EXISTS ax_ausgabemedium_benutzer (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_ausgabemedium_benutzer_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_ausgabemedium_benutzer IS 'Alias: "AX_Ausgabemedium_Benutzer", UML-Typ: Enumeration';
INSERT INTO ax_ausgabemedium_benutzer (wert,beschreibung) VALUES 
('1000', 'Analog'),
('2000', 'CD-R'),
('3000', 'DVD'),
('4000', 'E-Mail');

CREATE TABLE IF NOT EXISTS ax_identifikation (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_identifikation_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_identifikation IS 'Alias: "AX_Identifikation", UML-Typ: Enumeration';
INSERT INTO ax_identifikation (wert,beschreibung) VALUES 
('5400', 'Sicher'),
('5410', 'Unsicher');

CREATE TABLE IF NOT EXISTS ax_dqerfassungsmethodemarkantergelaendepunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_dqerfassungsmethodemarkantergelaendepunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_dqerfassungsmethodemarkantergelaendepunkt IS 'Alias: "AX_DQErfassungsmethodeMarkanterGelaendepunkt", UML-Typ: Enumeration';
INSERT INTO ax_dqerfassungsmethodemarkantergelaendepunkt (wert,beschreibung) VALUES 
('5000', 'Terrestrische Aufnahme'),
('5010', 'Interaktive photogrammetrische Datenerfassung'),
('5020', 'Laserscanning'),
('5030', 'Digitalisierung analoger Vorlagen');

CREATE TABLE IF NOT EXISTS ax_dqerfassungsmethodestrukturiertegelaendepunkte (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_dqerfassungsmethodestrukturiertegelaendepunkte_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_dqerfassungsmethodestrukturiertegelaendepunkte IS 'Alias: "AX_DQErfassungsmethodeStrukturierteGelaendepunkte", UML-Typ: Enumeration';
INSERT INTO ax_dqerfassungsmethodestrukturiertegelaendepunkte (wert,beschreibung) VALUES 
('5000', 'Terrestrische Aufnahme'),
('5010', 'Interaktive photogrammetrische Datenerfassung'),
('5030', 'Digitalisierung analoger Vorlagen');

CREATE TABLE IF NOT EXISTS ax_dqerfassungsmethode (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_dqerfassungsmethode_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_dqerfassungsmethode IS 'Alias: "AX_DQErfassungsmethode", UML-Typ: Enumeration';
INSERT INTO ax_dqerfassungsmethode (wert,beschreibung) VALUES 
('5000', 'Terrestrische Aufnahme'),
('5010', 'Interaktive photogrammetrische Datenerfassung'),
('5020', 'Laserscanning'),
('5030', 'Digitalisierung analoger Vorlagen'),
('5040', 'Bildkorrelation'),
('5050', 'IfSAR');

CREATE TABLE IF NOT EXISTS ax_besonderebedeutung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_besonderebedeutung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_besonderebedeutung IS 'Alias: "AX_BesondereBedeutung", UML-Typ: Enumeration';
INSERT INTO ax_besonderebedeutung (wert,beschreibung) VALUES 
('1600', 'Höhenpunkt auf Wasserfläche'),
('1610', 'Wegepunkt');

CREATE TABLE IF NOT EXISTS ax_dqerfassungsmethodebesondererhoehenpunkt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_dqerfassungsmethodebesondererhoehenpunkt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_dqerfassungsmethodebesondererhoehenpunkt IS 'Alias: "AX_DQErfassungsmethodeBesondererHoehenpunkt", UML-Typ: Enumeration';
INSERT INTO ax_dqerfassungsmethodebesondererhoehenpunkt (wert,beschreibung) VALUES 
('5000', 'Terrestrische Aufnahme'),
('5010', 'Interaktive photogrammetrische Aufnahme'),
('5020', 'Laserscanning'),
('5030', 'Digitalisierung analoger Vorlagen'),
('5060', 'Amtliche Festlegung');

CREATE TABLE IF NOT EXISTS ax_artdergeripplinie (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artdergeripplinie_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artdergeripplinie IS 'Alias: "AX_ArtDerGeripplinie", UML-Typ: Enumeration';
INSERT INTO ax_artdergeripplinie (wert,beschreibung) VALUES 
('1300', 'Muldenlinie'),
('1310', 'Wasserführende Muldenlinie'),
('1320', 'Rückenlinie');

CREATE TABLE IF NOT EXISTS ax_artdergelaendekante (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artdergelaendekante_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artdergelaendekante IS 'Alias: "AX_ArtDerGelaendekante", UML-Typ: Enumeration';
INSERT INTO ax_artdergelaendekante (wert,beschreibung) VALUES 
('1200', 'Allgemeine Geländekante'),
('1210', 'Steilrand, Kliffkante'),
('1220', 'Böschungsoberkante'),
('1230', 'Böschungsunterkante'),
('1240', 'Sonstige Begrenzungskante');

CREATE TABLE IF NOT EXISTS ax_artderstrukturierung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderstrukturierung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderstrukturierung IS 'Alias: "AX_ArtDerStrukturierung", UML-Typ: Enumeration';
INSERT INTO ax_artderstrukturierung (wert,beschreibung) VALUES 
('1700', 'Höhenlinien'),
('1710', 'Dynamisch gemessene Profile');

CREATE TABLE IF NOT EXISTS ax_dqerfassungsmethodegewaesserbegrenzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_dqerfassungsmethodegewaesserbegrenzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_dqerfassungsmethodegewaesserbegrenzung IS 'Alias: "AX_DQErfassungsmethodeGewaesserbegrenzung", UML-Typ: Enumeration';
INSERT INTO ax_dqerfassungsmethodegewaesserbegrenzung (wert,beschreibung) VALUES 
('5000', 'Terrestrische Aufnahme'),
('5010', 'Interaktive photogrammetrische Datenerfassung'),
('5020', 'Laserscanning'),
('5030', 'Digitalisierung analoger Vorlagen'),
('5040', 'Bildkorrelation'),
('5050', 'IfSAR'),
('5060', 'Amtliche Festlegung');

CREATE TABLE IF NOT EXISTS ax_artdernichtgelaendepunkte (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artdernichtgelaendepunkte_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artdernichtgelaendepunkte IS 'Alias: "AX_ArtDerNichtGelaendepunkte", UML-Typ: Enumeration';
INSERT INTO ax_artdernichtgelaendepunkte (wert,beschreibung) VALUES 
('1000', 'Brückenpunkte'),
('1010', 'Gebäudepunkte'),
('1020', 'Vegetationspunkte');

CREATE TABLE IF NOT EXISTS ax_artdesmarkantengelaendepunktes (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artdesmarkantengelaendepunktes_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artdesmarkantengelaendepunktes IS 'Alias: "AX_ArtDesMarkantenGelaendepunktes", UML-Typ: Enumeration';
INSERT INTO ax_artdesmarkantengelaendepunktes (wert,beschreibung) VALUES 
('1400', 'Kuppenpunkt'),
('1410', 'Kesselpunkt'),
('1420', 'Sattelpunkt');

CREATE TABLE IF NOT EXISTS ax_artderaussparung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderaussparung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderaussparung IS 'Alias: "AX_ArtDerAussparung", UML-Typ: Enumeration';
INSERT INTO ax_artderaussparung (wert,beschreibung) VALUES 
('1500', 'DGM-Aussparung'),
('1510', 'Kartographische Aussparung');

CREATE TABLE IF NOT EXISTS ax_besondereartdergewaesserbegrenzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_besondereartdergewaesserbegrenzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_besondereartdergewaesserbegrenzung IS 'Alias: "AX_BesondereArtDerGewaesserbegrenzung", UML-Typ: Enumeration';
INSERT INTO ax_besondereartdergewaesserbegrenzung (wert,beschreibung) VALUES 
('1350', 'Gleichzeitig Böschungsunterkante');

CREATE TABLE IF NOT EXISTS ax_ursprung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_ursprung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_ursprung IS 'Alias: "AX_Ursprung", UML-Typ: Enumeration';
INSERT INTO ax_ursprung (wert,beschreibung) VALUES 
('1100', 'Natürlich entstanden'),
('1110', 'Künstlich entstanden');

CREATE TABLE IF NOT EXISTS ax_funktion_dammwalldeich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_dammwalldeich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_dammwalldeich IS 'Alias: "AX_Funktion_DammWallDeich", UML-Typ: Enumeration';
INSERT INTO ax_funktion_dammwalldeich (wert,beschreibung) VALUES 
('3001', 'Hochwasserschutz, Sturmflutschutz'),
('3002', 'Verkehrsführung'),
('3003', 'Hochwasserschutz, Sturmflutschutz zugleich Verkehrsführung'),
('3004', 'Lärmschutz');

CREATE TABLE IF NOT EXISTS ax_art_dammwalldeich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_dammwalldeich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_dammwalldeich IS 'Alias: "AX_Art_DammWallDeich", UML-Typ: Enumeration';
INSERT INTO ax_art_dammwalldeich (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_funktion_einschnitt (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_einschnitt_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_einschnitt IS 'Alias: "AX_Funktion_Einschnitt", UML-Typ: Enumeration';
INSERT INTO ax_funktion_einschnitt (wert,beschreibung) VALUES 
('3002', 'Verkehrsführung');

CREATE TABLE IF NOT EXISTS ax_zustand_boeschungkliff (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_boeschungkliff_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_boeschungkliff IS 'Alias: "AX_Zustand_BoeschungKliff", UML-Typ: Enumeration';
INSERT INTO ax_zustand_boeschungkliff (wert,beschreibung) VALUES 
('2400', 'Befestigt'),
('2500', 'Unbefestigt');

CREATE TABLE IF NOT EXISTS ax_zustand_hoehleneingang (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_hoehleneingang_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_hoehleneingang IS 'Alias: "AX_Zustand_Hoehleneingang", UML-Typ: Enumeration';
INSERT INTO ax_zustand_hoehleneingang (wert,beschreibung) VALUES 
('2200', 'Verfallen, zerstört'),
('4100', 'Offen'),
('4200', 'Verschlossen');

CREATE TABLE IF NOT EXISTS ax_berechnungsmethode (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_berechnungsmethode_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_berechnungsmethode IS 'Alias: "AX_Berechnungsmethode", UML-Typ: Enumeration';
INSERT INTO ax_berechnungsmethode (wert,beschreibung) VALUES 
('5300', 'Einfache Mittelbildung'),
('5310', 'Gewichtete Mittelbildung'),
('5320', 'Gleitende Schrägebene'),
('5330', 'Prädiktion'),
('5340', 'Polynomasatz'),
('5350', 'Finite Elemente'),
('5360', 'Dreiecksvermaschung');

CREATE TABLE IF NOT EXISTS ax_verwendeteobjekte (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_verwendeteobjekte_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_verwendeteobjekte IS 'Alias: "AX_VerwendeteObjekte", UML-Typ: Enumeration';
INSERT INTO ax_verwendeteobjekte (wert,beschreibung) VALUES 
('5111', 'Geländepunkte'),
('5121', 'Geländekanten'),
('5122', 'Gewässerbegrenzung'),
('5123', 'Geripplinien'),
('5124', 'Markante Geländepunkte'),
('5131', 'Aussparungsflächen'),
('5211', 'DGM-Gitter');

CREATE TABLE IF NOT EXISTS ax_berechnungsmethodehoehenlinie (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_berechnungsmethodehoehenlinie_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_berechnungsmethodehoehenlinie IS 'Alias: "AX_BerechnungsmethodeHoehenlinie", UML-Typ: Enumeration';
INSERT INTO ax_berechnungsmethodehoehenlinie (wert,beschreibung) VALUES 
('5211', 'Aus sekundärem DGM-Gitter'),
('5360', 'Über Dreiecksvermaschung abgeleitet');

CREATE TABLE IF NOT EXISTS ax_dqerfassungsmethodesekundaeresdgm (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_dqerfassungsmethodesekundaeresdgm_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_dqerfassungsmethodesekundaeresdgm IS 'Alias: "AX_DQErfassungsmethodeSekundaeresDGM", UML-Typ: Enumeration';
INSERT INTO ax_dqerfassungsmethodesekundaeresdgm (wert,beschreibung) VALUES 
('5000', 'Terrestrische Aufnahme'),
('5010', 'Interaktive photogrammetrische Aufnahme'),
('5020', 'Laserscanning'),
('5030', 'Digitalisierung analoger Vorlagen'),
('5040', 'Bildkorrelation'),
('5050', 'IfSAR'),
('5060', 'Amtliche Festlegung');

CREATE TABLE IF NOT EXISTS ax_zustand_kanal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_kanal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_kanal IS 'Alias: "AX_Zustand_Kanal", UML-Typ: Enumeration';
INSERT INTO ax_zustand_kanal (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');

CREATE TABLE IF NOT EXISTS ax_funktion_stehendesgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_stehendesgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_stehendesgewaesser IS 'Alias: "AX_Funktion_StehendesGewaesser", UML-Typ: Enumeration';
INSERT INTO ax_funktion_stehendesgewaesser (wert,beschreibung) VALUES 
('8620', 'Teich'),
('8630', 'Stausee'),
('8610', 'See'),
('8631', 'Speicherbecken'),
('8640', 'Baggersee'),
('9999', 'Sonstiges');

CREATE TABLE IF NOT EXISTS ax_schifffahrtskategorie (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_schifffahrtskategorie_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_schifffahrtskategorie IS 'Alias: "AX_Schifffahrtskategorie", UML-Typ: Enumeration';
INSERT INTO ax_schifffahrtskategorie (wert,beschreibung) VALUES 
('1000', 'Binnenwasserstraße'),
('2000', 'Seewasserstraße'),
('3000', 'Landesgewässer mit Verkehrsordnung');

CREATE TABLE IF NOT EXISTS ax_hydrologischesmerkmal_fliessgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_hydrologischesmerkmal_fliessgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_hydrologischesmerkmal_fliessgewaesser IS 'Alias: "AX_HydrologischesMerkmal_Fliessgewaesser", UML-Typ: Enumeration';
INSERT INTO ax_hydrologischesmerkmal_fliessgewaesser (wert,beschreibung) VALUES 
('2000', 'Nicht ständig Wasser führend');

CREATE TABLE IF NOT EXISTS ax_schifffahrtskategorie_kanal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_schifffahrtskategorie_kanal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_schifffahrtskategorie_kanal IS 'Alias: "AX_Schifffahrtskategorie_Kanal", UML-Typ: Enumeration';
INSERT INTO ax_schifffahrtskategorie_kanal (wert,beschreibung) VALUES 
('1000', 'Binnenwasserstraße'),
('2000', 'Seewasserstraße'),
('3000', 'Landesgewässer mit Verkehrsordnung');

CREATE TABLE IF NOT EXISTS ax_funktion_fliessgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_fliessgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_fliessgewaesser IS 'Alias: "AX_Funktion_Fliessgewaesser", UML-Typ: Enumeration';
INSERT INTO ax_funktion_fliessgewaesser (wert,beschreibung) VALUES 
('8200', 'Fluss'),
('8210', 'Altwasser'),
('8220', 'Altarm'),
('8230', 'Flussmündungstrichter'),
('8300', 'Kanal'),
('8400', 'Graben'),
('8410', 'Fleet'),
('8500', 'Bach');

CREATE TABLE IF NOT EXISTS ax_widmung_wasserlauf (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_widmung_wasserlauf_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_widmung_wasserlauf IS 'Alias: "AX_Widmung_Wasserlauf", UML-Typ: Enumeration';
INSERT INTO ax_widmung_wasserlauf (wert,beschreibung) VALUES 
('1310', 'Gewässer I. Ordnung - Bundeswasserstraße'),
('1320', 'Gewässer I. Ordnung - nach Landesrecht'),
('1330', 'Gewässer II. Ordnung'),
('1340', 'Gewässer III. Ordnung');

CREATE TABLE IF NOT EXISTS ax_funktion_meer (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_meer_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_meer IS 'Alias: "AX_Funktion_Meer", UML-Typ: Enumeration';
INSERT INTO ax_funktion_meer (wert,beschreibung) VALUES 
('8710', 'Küstengewässer');

CREATE TABLE IF NOT EXISTS ax_hydrologischesmerkmal_gewaesserachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_hydrologischesmerkmal_gewaesserachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_hydrologischesmerkmal_gewaesserachse IS 'Alias: "AX_HydrologischesMerkmal_Gewaesserachse", UML-Typ: Enumeration';
INSERT INTO ax_hydrologischesmerkmal_gewaesserachse (wert,beschreibung) VALUES 
('2000', 'Nicht ständig Wasser führend'),
('3000', 'Trocken, versiegt');

CREATE TABLE IF NOT EXISTS ax_tidemerkmal_meer (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_tidemerkmal_meer_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_tidemerkmal_meer IS 'Alias: "AX_Tidemerkmal_Meer", UML-Typ: Enumeration';
INSERT INTO ax_tidemerkmal_meer (wert,beschreibung) VALUES 
('1000', 'Mit Tideeinfluss');

CREATE TABLE IF NOT EXISTS ax_nutzung_hafenbecken (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_nutzung_hafenbecken_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_nutzung_hafenbecken IS 'Alias: "AX_Nutzung_Hafenbecken", UML-Typ: Enumeration';
INSERT INTO ax_nutzung_hafenbecken (wert,beschreibung) VALUES 
('1000', 'Zivil'),
('2000', 'Militärisch'),
('3000', 'Teils zivil, teils militärisch');

CREATE TABLE IF NOT EXISTS ax_hydrologischesmerkmal_stehendesgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_hydrologischesmerkmal_stehendesgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_hydrologischesmerkmal_stehendesgewaesser IS 'Alias: "AX_HydrologischesMerkmal_StehendesGewaesser", UML-Typ: Enumeration';
INSERT INTO ax_hydrologischesmerkmal_stehendesgewaesser (wert,beschreibung) VALUES 
('2000', 'Nicht ständig Wasser führend');

CREATE TABLE IF NOT EXISTS ax_widmung_stehendesgewaesser (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_widmung_stehendesgewaesser_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_widmung_stehendesgewaesser IS 'Alias: "AX_Widmung_StehendesGewaesser", UML-Typ: Enumeration';
INSERT INTO ax_widmung_stehendesgewaesser (wert,beschreibung) VALUES 
('1310', 'Gewässer I. Ordnung - Bundeswasserstraße'),
('1320', 'Gewässer I. Ordnung - nach Landesrecht'),
('1330', 'Gewässer II. Ordnung'),
('1340', 'Gewässer III. Ordnung');

CREATE TABLE IF NOT EXISTS ax_funktion_gewaesserachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_gewaesserachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_gewaesserachse IS 'Alias: "AX_Funktion_Gewaesserachse", UML-Typ: Enumeration';
INSERT INTO ax_funktion_gewaesserachse (wert,beschreibung) VALUES 
('8300', 'Kanal');

CREATE TABLE IF NOT EXISTS ax_funktion_hafenbecken (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_hafenbecken_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_hafenbecken IS 'Alias: "AX_Funktion_Hafenbecken", UML-Typ: Enumeration';
INSERT INTO ax_funktion_hafenbecken (wert,beschreibung) VALUES 
('8810', 'Sportboothafenbecken');

CREATE TABLE IF NOT EXISTS ax_widmung_kanal (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_widmung_kanal_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_widmung_kanal IS 'Alias: "AX_Widmung_Kanal", UML-Typ: Enumeration';
INSERT INTO ax_widmung_kanal (wert,beschreibung) VALUES 
('1310', 'Gewässer I. Ordnung - Bundeswasserstraße'),
('1320', 'Gewässer I. Ordnung - nach Landesrecht'),
('1330', 'Gewässer II. Ordnung'),
('1340', 'Gewässer III. Ordnung');

CREATE TABLE IF NOT EXISTS ax_zustand_wohnbauflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_wohnbauflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_wohnbauflaeche IS 'Alias: "AX_Zustand_Wohnbauflaeche", UML-Typ: Enumeration';
INSERT INTO ax_zustand_wohnbauflaeche (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');

CREATE TABLE IF NOT EXISTS ax_artderbebauung_wohnbauflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderbebauung_wohnbauflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderbebauung_wohnbauflaeche IS 'Alias: "AX_ArtDerBebauung_Wohnbauflaeche", UML-Typ: Enumeration';
INSERT INTO ax_artderbebauung_wohnbauflaeche (wert,beschreibung) VALUES 
('1000', 'Offen'),
('2000', 'Geschlossen');

CREATE TABLE IF NOT EXISTS ax_zustand_flaechebesondererfunktionalerpraegung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_flaechebesondererfunktionalerpraegung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_flaechebesondererfunktionalerpraegung IS 'Alias: "AX_Zustand_FlaecheBesondererFunktionalerPraegung", UML-Typ: Enumeration';
INSERT INTO ax_zustand_flaechebesondererfunktionalerpraegung (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');

CREATE TABLE IF NOT EXISTS ax_funktion_flaechegemischternutzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_flaechegemischternutzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_flaechegemischternutzung IS 'Alias: "AX_Funktion_FlaecheGemischterNutzung", UML-Typ: Enumeration';
INSERT INTO ax_funktion_flaechegemischternutzung (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_foerdergut_industrieundgewerbeflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_foerdergut_industrieundgewerbeflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_foerdergut_industrieundgewerbeflaeche IS 'Alias: "AX_Foerdergut_IndustrieUndGewerbeflaeche", UML-Typ: Enumeration';
INSERT INTO ax_foerdergut_industrieundgewerbeflaeche (wert,beschreibung) VALUES 
('1000', 'Erdöl'),
('2000', 'Erdgas'),
('3000', 'Sole, Lauge'),
('4000', 'Kohlensäure'),
('5000', 'Erdwärme');

CREATE TABLE IF NOT EXISTS ax_artderbebauung_flaechegemischternutzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderbebauung_flaechegemischternutzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderbebauung_flaechegemischternutzung IS 'Alias: "AX_ArtDerBebauung_FlaecheGemischterNutzung", UML-Typ: Enumeration';
INSERT INTO ax_artderbebauung_flaechegemischternutzung (wert,beschreibung) VALUES 
('1000', 'Offen'),
('2000', 'Geschlossen');

CREATE TABLE IF NOT EXISTS ax_zustand_sportfreizeitunderholungsflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_sportfreizeitunderholungsflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_sportfreizeitunderholungsflaeche IS 'Alias: "AX_Zustand_SportFreizeitUndErholungsflaeche", UML-Typ: Enumeration';
INSERT INTO ax_zustand_sportfreizeitunderholungsflaeche (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');

CREATE TABLE IF NOT EXISTS ax_funktion_flaechebesondererfunktionalerpraegung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_flaechebesondererfunktionalerpraegung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_flaechebesondererfunktionalerpraegung IS 'Alias: "AX_Funktion_FlaecheBesondererFunktionalerPraegung", UML-Typ: Enumeration';
INSERT INTO ax_funktion_flaechebesondererfunktionalerpraegung (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_funktion_sportfreizeitunderholungsflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_sportfreizeitunderholungsflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_sportfreizeitunderholungsflaeche IS 'Alias: "AX_Funktion_SportFreizeitUndErholungsflaeche", UML-Typ: Enumeration';
INSERT INTO ax_funktion_sportfreizeitunderholungsflaeche (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_lagergut_industrieundgewerbeflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_lagergut_industrieundgewerbeflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_lagergut_industrieundgewerbeflaeche IS 'Alias: "AX_Lagergut_IndustrieUndGewerbeflaeche", UML-Typ: Enumeration';
INSERT INTO ax_lagergut_industrieundgewerbeflaeche (wert,beschreibung) VALUES 
('7000', 'Abraum'),
('1000', 'Baustoffe'),
('4000', 'Erde'),
('2000', 'Kohle'),
('3000', 'Öl'),
('6000', 'Schlacke'),
('8000', 'Schrott, Altmaterial'),
('5000', 'Schutt'),
('9999', 'Sonstiges');

CREATE TABLE IF NOT EXISTS ax_zustand_halde (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_halde_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_halde IS 'Alias: "AX_Zustand_Halde", UML-Typ: Enumeration';
INSERT INTO ax_zustand_halde (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');

CREATE TABLE IF NOT EXISTS ax_zustand_bergbaubetrieb (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_bergbaubetrieb_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_bergbaubetrieb IS 'Alias: "AX_Zustand_Bergbaubetrieb", UML-Typ: Enumeration';
INSERT INTO ax_zustand_bergbaubetrieb (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');

CREATE TABLE IF NOT EXISTS ax_abbaugut_tagebaugrubesteinbruch (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_abbaugut_tagebaugrubesteinbruch_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_abbaugut_tagebaugrubesteinbruch IS 'Alias: "AX_Abbaugut_TagebauGrubeSteinbruch", UML-Typ: Enumeration';
INSERT INTO ax_abbaugut_tagebaugrubesteinbruch (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_primaerenergie_industrieundgewerbeflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_primaerenergie_industrieundgewerbeflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_primaerenergie_industrieundgewerbeflaeche IS 'Alias: "AX_Primaerenergie_IndustrieUndGewerbeflaeche", UML-Typ: Enumeration';
INSERT INTO ax_primaerenergie_industrieundgewerbeflaeche (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_abbaugut_bergbaubetrieb (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_abbaugut_bergbaubetrieb_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_abbaugut_bergbaubetrieb IS 'Alias: "AX_Abbaugut_Bergbaubetrieb", UML-Typ: Enumeration';
INSERT INTO ax_abbaugut_bergbaubetrieb (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_zustand_flaechegemischternutzung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_flaechegemischternutzung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_flaechegemischternutzung IS 'Alias: "AX_Zustand_FlaecheGemischterNutzung", UML-Typ: Enumeration';
INSERT INTO ax_zustand_flaechegemischternutzung (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');

CREATE TABLE IF NOT EXISTS ax_zustand_industrieundgewerbeflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_industrieundgewerbeflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_industrieundgewerbeflaeche IS 'Alias: "AX_Zustand_IndustrieUndGewerbeflaeche", UML-Typ: Enumeration';
INSERT INTO ax_zustand_industrieundgewerbeflaeche (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');

CREATE TABLE IF NOT EXISTS ax_funktion_friedhof (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_friedhof_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_friedhof IS 'Alias: "AX_Funktion_Friedhof", UML-Typ: Enumeration';
INSERT INTO ax_funktion_friedhof (wert,beschreibung) VALUES 
('9401', 'Gebäude- und Freifläche Friedhof'),
('9402', 'Friedhof (ohne Gebäude)'),
('9403', 'Friedhof (Park)'),
('9404', 'Historischer Friedhof');

CREATE TABLE IF NOT EXISTS ax_zustand_friedhof (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_friedhof_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_friedhof IS 'Alias: "AX_Zustand_Friedhof", UML-Typ: Enumeration';
INSERT INTO ax_zustand_friedhof (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');

CREATE TABLE IF NOT EXISTS ax_lagergut_halde (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_lagergut_halde_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_lagergut_halde IS 'Alias: "AX_Lagergut_Halde", UML-Typ: Enumeration';
INSERT INTO ax_lagergut_halde (wert,beschreibung) VALUES 
('1000', 'Baustoffe'),
('2000', 'Kohle'),
('4000', 'Erde'),
('5000', 'Schutt'),
('6000', 'Schlacke'),
('7000', 'Abraum'),
('8000', 'Schrott, Altmaterial'),
('9999', 'Sonstiges');

CREATE TABLE IF NOT EXISTS ax_funktion_industrieundgewerbeflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_industrieundgewerbeflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_industrieundgewerbeflaeche IS 'Alias: "AX_Funktion_IndustrieUndGewerbeflaeche", UML-Typ: Enumeration';
INSERT INTO ax_funktion_industrieundgewerbeflaeche (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_zustand_tagebaugrubesteinbruch (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_tagebaugrubesteinbruch_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_tagebaugrubesteinbruch IS 'Alias: "AX_Zustand_TagebauGrubeSteinbruch", UML-Typ: Enumeration';
INSERT INTO ax_zustand_tagebaugrubesteinbruch (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('8000', 'Erweiterung, Neuansiedlung');

CREATE TABLE IF NOT EXISTS ax_artderbebauung_siedlungsflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderbebauung_siedlungsflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderbebauung_siedlungsflaeche IS 'Alias: "AX_ArtDerBebauung_Siedlungsflaeche", UML-Typ: Enumeration';
INSERT INTO ax_artderbebauung_siedlungsflaeche (wert,beschreibung) VALUES 
('1000', 'Offen'),
('2000', 'Geschlossen');

CREATE TABLE IF NOT EXISTS ax_artderbebauung_flaechebesondererfunktionalerpraegung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_artderbebauung_flaechebesondererfunktionalerpraegung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_artderbebauung_flaechebesondererfunktionalerpraegung IS 'Alias: "AX_ArtDerBebauung_FlaecheBesondererFunktionalerPraegung", UML-Typ: Enumeration';
INSERT INTO ax_artderbebauung_flaechebesondererfunktionalerpraegung (wert,beschreibung) VALUES 
('1000', 'Offen'),
('2000', 'Geschlossen');

CREATE TABLE IF NOT EXISTS ax_vegetationsmerkmal_gehoelz (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_vegetationsmerkmal_gehoelz_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_vegetationsmerkmal_gehoelz IS 'Alias: "AX_Vegetationsmerkmal_Gehoelz", UML-Typ: Enumeration';
INSERT INTO ax_vegetationsmerkmal_gehoelz (wert,beschreibung) VALUES 
('1400', 'Latschenkiefer');

CREATE TABLE IF NOT EXISTS ax_vegetationsmerkmal_wald (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_vegetationsmerkmal_wald_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_vegetationsmerkmal_wald IS 'Alias: "AX_Vegetationsmerkmal_Wald", UML-Typ: Enumeration';
INSERT INTO ax_vegetationsmerkmal_wald (wert,beschreibung) VALUES 
('1100', 'Laubholz'),
('1200', 'Nadelholz'),
('1300', 'Laub- und Nadelholz'),
('1310', 'Laubwald mit Nadelholz'),
('1320', 'Nadelwald mit Laubholz');

CREATE TABLE IF NOT EXISTS ax_vegetationsmerkmal_landwirtschaft (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_vegetationsmerkmal_landwirtschaft_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_vegetationsmerkmal_landwirtschaft IS 'Alias: "AX_Vegetationsmerkmal_Landwirtschaft", UML-Typ: Enumeration';
INSERT INTO ax_vegetationsmerkmal_landwirtschaft (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_oberflaechenmaterial_unlandvegetationsloseflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_oberflaechenmaterial_unlandvegetationsloseflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_oberflaechenmaterial_unlandvegetationsloseflaeche IS 'Alias: "AX_Oberflaechenmaterial_UnlandVegetationsloseFlaeche", UML-Typ: Enumeration';
INSERT INTO ax_oberflaechenmaterial_unlandvegetationsloseflaeche (wert,beschreibung) VALUES 
('1010', 'Fels'),
('1020', 'Steine, Schotter'),
('1030', 'Geröll'),
('1040', 'Sand'),
('1110', 'Schnee'),
('1120', 'Eis, Firn');

CREATE TABLE IF NOT EXISTS ax_funktion_unlandvegetationsloseflaeche (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_unlandvegetationsloseflaeche_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_unlandvegetationsloseflaeche IS 'Alias: "AX_Funktion_UnlandVegetationsloseFlaeche", UML-Typ: Enumeration';
INSERT INTO ax_funktion_unlandvegetationsloseflaeche (wert,beschreibung) VALUES 
('1000', 'Vegetationslose Fläche'),
('1100', 'Gewässerbegleitfläche'),
('1110', 'Bebaute Gewässerbegleitfläche'),
('1120', 'Unbebaute Gewässerbegleitfläche'),
('1200', 'Sukzessionsfläche'),
('1300', 'Naturnahe Fläche');

CREATE TABLE IF NOT EXISTS ax_funktion_gehoelz (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_gehoelz_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_gehoelz IS 'Alias: "AX_Funktion_Gehoelz", UML-Typ: Enumeration';
INSERT INTO ax_funktion_gehoelz (wert,beschreibung) VALUES 
('1000', 'Windschutz');

CREATE TABLE IF NOT EXISTS ax_bahnkategorie (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_bahnkategorie_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_bahnkategorie IS 'Alias: "AX_Bahnkategorie", UML-Typ: Enumeration';
INSERT INTO ax_bahnkategorie (wert,beschreibung) VALUES 
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

CREATE TABLE IF NOT EXISTS ax_funktion_weg (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_weg_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_weg IS 'Alias: "AX_Funktion_Weg", UML-Typ: Enumeration';
INSERT INTO ax_funktion_weg (wert,beschreibung) VALUES 
('5210', 'Fahrweg'),
('5211', 'Hauptwirtschaftsweg'),
('5212', 'Wirtschaftsweg'),
('5220', 'Fußweg'),
('5230', 'Gang'),
('5240', 'Radweg'),
('5250', 'Rad- und Fußweg'),
('5260', 'Reitweg'),
('9999', 'Sonstiges');

CREATE TABLE IF NOT EXISTS ax_funktion_bahnverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_bahnverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_bahnverkehr IS 'Alias: "AX_Funktion_Bahnverkehr", UML-Typ: Enumeration';
INSERT INTO ax_funktion_bahnverkehr (wert,beschreibung) VALUES 
('2321', 'Gebäude- und Freifläche zu Verkehrsanlagen, Schiene'),
('2322', 'Verkehrsbegleitfläche Bahnverkehr');

CREATE TABLE IF NOT EXISTS ax_verkehrsbedeutunginneroertlich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_verkehrsbedeutunginneroertlich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_verkehrsbedeutunginneroertlich IS 'Alias: "AX_VerkehrsbedeutungInneroertlich", UML-Typ: Enumeration';
INSERT INTO ax_verkehrsbedeutunginneroertlich (wert,beschreibung) VALUES 
('1000', 'Durchgangsverkehr'),
('2000', 'Ortsverkehr'),
('2001', 'Sammelverkehr'),
('2002', 'Anliegerverkehr');

CREATE TABLE IF NOT EXISTS ax_internationalebedeutung_strasse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_internationalebedeutung_strasse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_internationalebedeutung_strasse IS 'Alias: "AX_InternationaleBedeutung_Strasse", UML-Typ: Enumeration';
INSERT INTO ax_internationalebedeutung_strasse (wert,beschreibung) VALUES 
('2001', 'Europastraße');

CREATE TABLE IF NOT EXISTS ax_besonderefahrstreifen (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_besonderefahrstreifen_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_besonderefahrstreifen IS 'Alias: "AX_BesondereFahrstreifen", UML-Typ: Enumeration';
INSERT INTO ax_besonderefahrstreifen (wert,beschreibung) VALUES 
('1000', 'Mit Radweg'),
('2000', 'Mit Fußweg'),
('3000', 'Mit Rad- und Fußweg');

CREATE TABLE IF NOT EXISTS ax_zustand_bahnverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_bahnverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_bahnverkehr IS 'Alias: "AX_Zustand_Bahnverkehr", UML-Typ: Enumeration';
INSERT INTO ax_zustand_bahnverkehr (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');

CREATE TABLE IF NOT EXISTS ax_befestigung_fahrwegachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_befestigung_fahrwegachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_befestigung_fahrwegachse IS 'Alias: "AX_Befestigung_Fahrwegachse", UML-Typ: Enumeration';
INSERT INTO ax_befestigung_fahrwegachse (wert,beschreibung) VALUES 
('1000', 'Befestigt'),
('2000', 'Unbefestigt');

CREATE TABLE IF NOT EXISTS ax_spurweite (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_spurweite_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_spurweite IS 'Alias: "AX_Spurweite", UML-Typ: Enumeration';
INSERT INTO ax_spurweite (wert,beschreibung) VALUES 
('1000', 'Normalspur (Regelspur, Vollspur)'),
('2000', 'Schmalspur'),
('3000', 'Breitspur');

CREATE TABLE IF NOT EXISTS ax_zustand_schiffsverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_schiffsverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_schiffsverkehr IS 'Alias: "AX_Zustand_Schiffsverkehr", UML-Typ: Enumeration';
INSERT INTO ax_zustand_schiffsverkehr (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');

CREATE TABLE IF NOT EXISTS ax_funktion_platz (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_platz_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_platz IS 'Alias: "AX_Funktion_Platz", UML-Typ: Enumeration';
INSERT INTO ax_funktion_platz (wert,beschreibung) VALUES 
('5130', 'Fußgängerzone'),
('5310', 'Parkplatz'),
('5320', 'Rastplatz'),
('5330', 'Raststätte'),
('5340', 'Marktplatz'),
('5350', 'Festplatz');

CREATE TABLE IF NOT EXISTS ax_art_flugverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_art_flugverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_art_flugverkehr IS 'Alias: "AX_Art_Flugverkehr", UML-Typ: Enumeration';
INSERT INTO ax_art_flugverkehr (wert,beschreibung) VALUES 
('5510', 'Flughafen'),
('5511', 'Internationaler Flughafen'),
('5512', 'Regionalflughafen'),
('5520', 'Verkehrslandeplatz'),
('5530', 'Hubschrauberflugplatz'),
('5540', 'Landeplatz, Sonderlandeplatz'),
('5550', 'Segelfluggelände');

CREATE TABLE IF NOT EXISTS ax_elektrifizierung (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_elektrifizierung_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_elektrifizierung IS 'Alias: "AX_Elektrifizierung", UML-Typ: Enumeration';
INSERT INTO ax_elektrifizierung (wert,beschreibung) VALUES 
('1000', 'Elektrifiziert'),
('2000', 'Nicht elektrifiziert');

CREATE TABLE IF NOT EXISTS ax_zustand (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand IS 'Alias: "AX_Zustand", UML-Typ: Enumeration';
INSERT INTO ax_zustand (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');

CREATE TABLE IF NOT EXISTS ax_fahrbahntrennung_strasse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_fahrbahntrennung_strasse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_fahrbahntrennung_strasse IS 'Alias: "AX_Fahrbahntrennung_Strasse", UML-Typ: Enumeration';
INSERT INTO ax_fahrbahntrennung_strasse (wert,beschreibung) VALUES 
('2000', 'Getrennt');

CREATE TABLE IF NOT EXISTS ax_funktion_fahrbahnachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_fahrbahnachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_fahrbahnachse IS 'Alias: "AX_Funktion_Fahrbahnachse", UML-Typ: Enumeration';
INSERT INTO ax_funktion_fahrbahnachse (wert,beschreibung) VALUES 
('1808', 'Fußgängerzone');

CREATE TABLE IF NOT EXISTS ax_oberflaechenmaterial_strasse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_oberflaechenmaterial_strasse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_oberflaechenmaterial_strasse IS 'Alias: "AX_Oberflaechenmaterial_Strasse", UML-Typ: Enumeration';
INSERT INTO ax_oberflaechenmaterial_strasse (wert,beschreibung) VALUES 
('1220', 'Beton'),
('1230', 'Bitumen, Asphalt'),
('1240', 'Pflaster'),
('1250', 'Gestein, zerkleinert');

CREATE TABLE IF NOT EXISTS ax_funktion_flugverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_flugverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_flugverkehr IS 'Alias: "AX_Funktion_Flugverkehr", UML-Typ: Enumeration';
INSERT INTO ax_funktion_flugverkehr (wert,beschreibung) VALUES 
('5501', 'Gebäude- und Freifläche zu Verkehrsanlagen, Luftfahrt');

CREATE TABLE IF NOT EXISTS ax_funktion_wegachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_wegachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_wegachse IS 'Alias: "AX_Funktion_Wegachse", UML-Typ: Enumeration';
INSERT INTO ax_funktion_wegachse (wert,beschreibung) VALUES 
('5211', 'Hauptwirtschaftsweg'),
('5212', 'Wirtschaftsweg');

CREATE TABLE IF NOT EXISTS ax_zustand_strasse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_strasse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_strasse IS 'Alias: "AX_Zustand_Strasse", UML-Typ: Enumeration';
INSERT INTO ax_zustand_strasse (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');

CREATE TABLE IF NOT EXISTS ax_markierung_wegachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_markierung_wegachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_markierung_wegachse IS 'Alias: "AX_Markierung_Wegachse", UML-Typ: Enumeration';
INSERT INTO ax_markierung_wegachse (wert,beschreibung) VALUES 
('1401', 'Gekennzeichneter Wanderweg'),
('1402', 'Gekennzeichneter Rad(wander)weg'),
('1403', 'Gekennzeichnete Skaterstrecke');

CREATE TABLE IF NOT EXISTS ax_zustand_flugverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_zustand_flugverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_zustand_flugverkehr IS 'Alias: "AX_Zustand_Flugverkehr", UML-Typ: Enumeration';
INSERT INTO ax_zustand_flugverkehr (wert,beschreibung) VALUES 
('2100', 'Außer Betrieb, stillgelegt, verlassen'),
('4000', 'Im Bau');

CREATE TABLE IF NOT EXISTS ax_funktion_strassenachse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_strassenachse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_strassenachse IS 'Alias: "AX_Funktion_Strassenachse", UML-Typ: Enumeration';
INSERT INTO ax_funktion_strassenachse (wert,beschreibung) VALUES 
('1808', 'Fußgängerzone');

CREATE TABLE IF NOT EXISTS ax_verkehrsbedeutungueberoertlich (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_verkehrsbedeutungueberoertlich_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_verkehrsbedeutungueberoertlich IS 'Alias: "AX_VerkehrsbedeutungUeberoertlich", UML-Typ: Enumeration';
INSERT INTO ax_verkehrsbedeutungueberoertlich (wert,beschreibung) VALUES 
('1000', 'Überörtlicher Verkehr'),
('1001', 'Fernverkehr'),
('1002', 'Regionalverkehr'),
('1003', 'Nahverkehr, zwischenörtlicher Verkehr');

CREATE TABLE IF NOT EXISTS ax_nutzung_flugverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_nutzung_flugverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_nutzung_flugverkehr IS 'Alias: "AX_Nutzung_Flugverkehr", UML-Typ: Enumeration';
INSERT INTO ax_nutzung_flugverkehr (wert,beschreibung) VALUES 
('1000', 'Zivil'),
('2000', 'Militärisch'),
('3000', 'Teils zivil, teils militärisch');

CREATE TABLE IF NOT EXISTS ax_funktion_schiffsverkehr (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_schiffsverkehr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_schiffsverkehr IS 'Alias: "AX_Funktion_Schiffsverkehr", UML-Typ: Enumeration';
INSERT INTO ax_funktion_schiffsverkehr (wert,beschreibung) VALUES 
('2341', 'Gebäude und Freifläche zu Verkehrsanlagen, Schifffahrt'),
('5610', 'Hafenanlage (Landfläche)'),
('5620', 'Schleuse (Landfläche)'),
('5630', 'Anlegestelle'),
('5640', 'Fähranlage');

CREATE TABLE IF NOT EXISTS ax_funktion_strasse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_funktion_strasse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktion_strasse IS 'Alias: "AX_Funktion_Strasse", UML-Typ: Enumeration';
INSERT INTO ax_funktion_strasse (wert,beschreibung) VALUES 
('2311', 'Gebäude- und Freifläche zu Verkehrsanlagen, Straße'),
('2312', 'Verkehrsbegleitfläche Straße'),
('2313', 'Straßenentwässerungsanlage'),
('5130', 'Fußgängerzone');

CREATE TABLE IF NOT EXISTS ax_widmung_strasse (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_widmung_strasse_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_widmung_strasse IS 'Alias: "AX_Widmung_Strasse", UML-Typ: Enumeration';
INSERT INTO ax_widmung_strasse (wert,beschreibung) VALUES 
('1301', 'Bundesautobahn'),
('1303', 'Bundesstraße'),
('1305', 'Landesstraße, Staatsstraße'),
('1306', 'Kreisstraße'),
('1307', 'Gemeindestraße'),
('9997', 'Attribut trifft nicht zu'),
('9999', 'Sonstiges');

CREATE TABLE IF NOT EXISTS ax_anzahlderstreckengleise (
	wert integer,
	beschreibung character varying,
	CONSTRAINT ax_anzahlderstreckengleise_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_anzahlderstreckengleise IS 'Alias: "AX_AnzahlDerStreckengleise", UML-Typ: Enumeration';
INSERT INTO ax_anzahlderstreckengleise (wert,beschreibung) VALUES 
('1000', 'Eingleisig'),
('2000', 'Zweigleisig');

CREATE TABLE IF NOT EXISTS ax_funktionoa_k_tngr_all (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT ax_funktionoa_k_tngr_all_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktionoa_k_tngr_all IS 'Alias: "AX_FunktionOA_K_TNGR_all", UML-Typ: Enumeration';
INSERT INTO ax_funktionoa_k_tngr_all (wert,beschreibung) VALUES 
('Heide', NULL),
('Moor', NULL),
('Sumpf', NULL),
('Wohnbaufläche', NULL),
('Industrie- und Gewerbefläche', NULL),
('Halde', NULL),
('Bergbaubetrieb', NULL),
('Tagebau, Grube, Steinbruch', NULL),
('Fläche gemischter Nutzung', NULL),
('Fläche besonderer funktionaler Prägung', NULL),
('Sport-, Freizeit- und Erholungsfläche', NULL),
('Friedhof', NULL),
('Straßenverkehr', NULL),
('Platz', NULL),
('Weg', NULL),
('Bahnverkehr', NULL),
('Flugverkehr', NULL),
('Schiffsverkehr', NULL),
('Landwirtschaft', NULL),
('Wald', NULL),
('Gehölz', NULL),
('UnlandVegetationslose Fläche', NULL),
('Fließgewässer', NULL),
('Stehendes Gewässer', NULL),
('Meer', NULL),
('Hafenbecken', NULL);

CREATE TABLE IF NOT EXISTS ax_klassifizierunggr_k_bewgr (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT ax_klassifizierunggr_k_bewgr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_klassifizierunggr_k_bewgr IS 'Alias: "AX_KlassifizierungGr_K_BEWGR", UML-Typ: Enumeration';
INSERT INTO ax_klassifizierunggr_k_bewgr (wert,beschreibung) VALUES 
('Landwirtschaftliche Nutzung', NULL),
('Forstwirtschaftliche Nutzung', NULL),
('Weinbauliche Nutzung', NULL),
('Gärtnerische Nutzung', NULL),
('Sonstige Land- und forstwirtschaftliche Nutzung', NULL),
('Andere Nutzung', NULL),
('Nebenflächen des Betriebs der Land- und Forstwirtschaft', NULL),
('Straßenflächen', NULL),
('Gewässerflächen', NULL),
('Waldflächen', NULL),
('Noch nicht klassifiziert', NULL);

CREATE TABLE IF NOT EXISTS ax_funktionoa_k_tnfl (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT ax_funktionoa_k_tnfl_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktionoa_k_tnfl IS 'Alias: "AX_FunktionOA_K_TNFL", UML-Typ: Enumeration';
INSERT INTO ax_funktionoa_k_tnfl (wert,beschreibung) VALUES 
('Halde', NULL),
('Wohnbaufläche', NULL),
('Industrie- und Gewerbefläche', NULL),
('Industrie und Gewerbe', NULL),
('Handel und Dienstleistungen', NULL),
('Versorgungsanlage', NULL),
('Entsorgung', NULL),
('Bergbaubetrieb', NULL),
('Tagebau, Grube, Steinbruch', NULL),
('Fläche gemischter Nutzung', NULL),
('Fläche besonderer funktionaler Prägung', NULL),
('Sport-, Freizeit- und Erholungsfläche', NULL),
('Grünanlage', NULL),
('Friedhof', NULL),
('Straßenverkehr', NULL),
('Platz', NULL),
('Weg', NULL),
('Bahnverkehr', NULL),
('Flugverkehr', NULL),
('Schiffsverkehr', NULL),
('Landwirtschaft', NULL),
('Wald', NULL),
('Gehölz', NULL),
('Heide', NULL),
('Moor', NULL),
('Sumpf', NULL),
('UnlandVegetationslose Fläche', NULL),
('Fließgewässer', NULL),
('StehendesGewässer', NULL),
('Meer', NULL),
('Hafenbecken', NULL);

CREATE TABLE IF NOT EXISTS ax_klassifizierungobg_k_bewfl (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT ax_klassifizierungobg_k_bewfl_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_klassifizierungobg_k_bewfl IS 'Alias: "AX_KlassifizierungOBG_K_BEWFL", UML-Typ: Enumeration';
INSERT INTO ax_klassifizierungobg_k_bewfl (wert,beschreibung) VALUES 
('Ackerland', NULL),
('Ackerland-Grünland', NULL),
('Acherland-Hackrain', NULL),
('Grünland', NULL),
('Grünland-Acker', NULL),
('Grünland-Hackrain', NULL),
('Wiese', NULL),
('Streuwiese', NULL),
('Hutung', NULL),
('Hopfen', NULL),
('Spargel', NULL),
('Holzung', NULL),
('Weingarten (allgemein)', NULL),
('Weingarten 1', NULL),
('Weingarten 2', NULL),
('Weingarten 3', NULL),
('Weingarten 4', NULL),
('Weingarten 5', NULL),
('Weingarten 6', NULL),
('Weingarten 7', NULL),
('Gartenland', NULL),
('Obstplantage', NULL),
('Baumschule', NULL),
('Anbaufläche unter Glas', NULL),
('Kleingarten', NULL),
('Weihnachtsbaumkultur', NULL),
('Saatzucht', NULL),
('Teichwirtschaft', NULL),
('Abbauland der Land- und Forstwirtschaft', NULL),
('Geringstland', NULL),
('Unland', NULL),
('Nebenflächen des Betriebs der Land- und Forstwirtschaft', NULL);

CREATE TABLE IF NOT EXISTS ax_funktionoa_k_tngrerweitert_all (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT ax_funktionoa_k_tngrerweitert_all_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktionoa_k_tngrerweitert_all IS 'Alias: "AX_FunktionOA_K_TNGRerweitert_all", UML-Typ: Enumeration';
INSERT INTO ax_funktionoa_k_tngrerweitert_all (wert,beschreibung) VALUES 
('Reitplatz', NULL),
('Wohnbaufläche', NULL),
('Industrie- und Gewerbefläche', NULL),
('Industrie und Gewerbe', NULL),
('Gebäude- und Freifläche Industrie und Gewerbe', NULL),
('Produktion', NULL),
('Handwerk', NULL),
('Tankstelle', NULL),
('Lagerplatz', NULL),
('Transport', NULL),
('Forschung', NULL),
('Grundstoff', NULL),
('Betriebliche Sozialeinrichtungen', NULL),
('Werft', NULL),
('Handel und Dienstleistung', NULL),
('Verwaltung, freie Berufe', NULL),
('Bank, Kredit', NULL),
('Versicherung', NULL),
('Handel', NULL),
('Ausstellung, Messe', NULL),
('Beherbergung', NULL),
('Restauration', NULL),
('Vergnügen', NULL),
('Gärtnerei', NULL),
('Versorgungsanlage', NULL),
('Gebäude- und Freifläche Versorgungsanlage', NULL),
('Betriebsfläche Versorgungsanlage', NULL),
('Förderanlage', NULL),
('Wasserwerk', NULL),
('Gebäude- und Freifläche Versorgungsanlage, Wasser', NULL),
('Betriebsfläche Versorgungsanlage, Wasser', NULL),
('Kraftwerk', NULL),
('Gebäude- und Freifläche Versorgungsanlage, Elektrizität', NULL),
('Betriebsfläche Versorgungsanlage, Elektrizität', NULL),
('Umspannstation', NULL),
('Raffinerie', NULL),
('Gebäude- und Freifläche Versorgungsanlage, Öl', NULL),
('Betriebsfläche Versorgungsanlage, Öl', NULL),
('Gaswerk', NULL),
('Gebäude- und Freifläche Versorgungsanlage, Gas', NULL),
('Betriebsfläche Versorgungsanlage, Gas', NULL),
('Heizwerk', NULL),
('Gebäude- und Freifläche Versorgungsanlage, Wärme', NULL),
('Betriebsfläche Versorgungsanlage, Wärme', NULL),
('Funk- und Fernmeldeanlage', NULL),
('Gebäude- und Freifläche Versorgungsanlage, Funk- und Fernmeldewesen', NULL),
('Betriebsfläche Versorgungsanlage, Funkt- und Fernmeldewesen', NULL),
('Entsorgung', NULL),
('Gebäude- und Freifläche Entsorgungsanlage', NULL),
('Betriebsfläche Entsorgungsanlage', NULL),
('Kläranlage, Klärwerk', NULL),
('Gebäude- und Freifläche Entsorgungsanlage, Abwasserbeseitigung', NULL),
('Betriebsfläche Entsorgungsanlage, Abwasserbeseitigung', NULL),
('Abfallbehandlungsanlage', NULL),
('Gebäude- und Freifläche Entsorgungsanlage, Abfallbeseitigung', NULL),
('Betriebsfläche Entsorguingsanlage, Abfallbeseitigung', NULL),
('Betriebsfläche Entsorgungsanlage, Schlamm', NULL),
('Deponie (oberirdisch)', NULL),
('Deponie (untertägig)', NULL),
('Halde', NULL),
('Bergbaubetrieb', NULL),
('Tagebau, Grube, Steinbruch', NULL),
('Fläche gemischter Nutzung', NULL),
('Gebäude- und Freifläche, Mischnutzung mit Wohnen', NULL),
('Wohnen mit Öffentlich', NULL),
('Wohnen mit Handel und Dienstleistungen', NULL),
('Wohnen mit Gewerbe und Industrie', NULL),
('Öffentlich mit Wohnen', NULL),
('Handel und Dienstleistungen mit Wohnen', NULL),
('Gewerbe und Industrie mit Wohnen', NULL),
('Gebäude- und Freifläche Land- und Forstwirtschaft', NULL),
('Wohnen', NULL),
('Betrieb', NULL),
('Wohnen und Betrieb', NULL),
('Landwirtschaftliche Betriebsfläche', NULL),
('Fortswirtschaftliche Betriebsfläche', NULL),
('Fläche besonderer funktionaler Prägung', NULL),
('Öffentliche Zwecke', NULL),
('Verwaltung', NULL),
('Bildung und Forschung', NULL),
('Kultur', NULL),
('Religiöse Einrichtung', NULL),
('Gesundheit, Kur', NULL),
('Soziales', NULL),
('Sicherheit und Ordnung', NULL),
('Parken', NULL),
('Historische Anlage', NULL),
('Burg-, Festungsanlage', NULL),
('Schlossanlage', NULL),
('Sport-, Freizeit- und Erholungsfläche', NULL),
('Sportanlage', NULL),
('Gebäude- und Freifläche Sport, Freizeit und Erholung', NULL),
('Gebäude- und Freifläche Erholung, Sport', NULL),
('Golfplatz', NULL),
('Sportplatz', NULL),
('Rennbahn', NULL),
('Schießanlage', NULL),
('Eis-, Rollschuhbahn', NULL),
('Tennisplatz', NULL),
('Freizeitanlage', NULL),
('Zoo', NULL),
('Gebäude- und Freifläche Erholung, Zoologie', NULL),
('Safaripark, Wildpark', NULL),
('Freizeitpark', NULL),
('Freilichttheater', NULL),
('Freilichtmuseum', NULL),
('Autokino, Freilichtkino', NULL),
('Verkehrsübungsplatz', NULL),
('Hundeübungsplatz', NULL),
('Modellflugplatz', NULL),
('Erholungsfläche', NULL),
('Gebäude- und Freifläche Erholung', NULL),
('Wochenend- und Ferienhausfläche', NULL),
('Schwimmbad, Freibad', NULL),
('Gebäude- und Freifläche Erholung, Bad', NULL),
('Campingplatz', NULL),
('Gebäude- und Freifläche Erholung, Camping', NULL),
('Grünanlage', NULL),
('Grünfläche', NULL),
('Park', NULL),
('Botanischer Garten', NULL),
('Gebäude- und Freifläche Erholung, Botanik', NULL),
('Kleingarten', NULL),
('Wochenendplatz', NULL),
('Garten', NULL),
('Spielplatz, Bolzplatz', NULL),
('Sonstiges (Sport-, Freizeit- und Erholungsfläche)', NULL),
('Friedhof', NULL),
('Gebäude- und Freifläche Friedhof', NULL),
('Friedhof (ohne Geb äude)', NULL),
('Friedhof (Park)', NULL),
('Historischer Friedhof', NULL),
('Straßenverkehr', NULL),
('Gebäude- und Freifläche zu Verkehrsanlagen, Straße', NULL),
('Verkehrsbegleitfläche Straße', NULL),
('Straßenentwässerungsanlage', NULL),
('Fußgängerzone (Straßenverkehr)', NULL),
('Weg', NULL),
('Fahrweg', NULL),
('Hauptwirtschaftsweg', NULL),
('Wirtschaftsweg', NULL),
('Fußweg', NULL),
('Gang', NULL),
('Radweg', NULL),
('Rad- und Fußweg', NULL),
('Reitweg', NULL),
('Sonstiges (Weg)', NULL),
('Platz', NULL),
('Fußgängerzone (Platz)', NULL),
('Parkplatz', NULL),
('Rastplatz', NULL),
('Raststätte', NULL),
('Marktplatz', NULL),
('Festplatz', NULL),
('Bahnverkehr', NULL),
('Gebäude- und Freifläche zu Verkehrtsanlagen, Schiene', NULL),
('Verkehrsbegleitfläche Bahnverkehr', NULL),
('Flugverkehr', NULL),
('Gebäude- und Freifläche zu Verkehrsanlagen, Luftfahrt', NULL),
('Schiffsverkehr', NULL),
('Gebäude- und Freifläche zu Verkehrsanlagen, Schifffahrt', NULL),
('Hafenanlage (Landfläche)', NULL),
('Schleuse (Landfläche)', NULL),
('Anlegestelle', NULL),
('Fähranlage', NULL),
('Landwirtschaft', NULL),
('Ackerland', NULL),
('Streuobstacker', NULL),
('Hopfen', NULL),
('Spargel', NULL),
('Grünland', NULL),
('Streuobstwiese', NULL),
('Gartenland', NULL),
('Baumschule', NULL),
('Weingarten', NULL),
('Obstplantage', NULL),
('Obstbaumplantage', NULL),
('Obststrauchplantage', NULL),
('Brachland', NULL),
('Wald', NULL),
('Laubholz', NULL),
('Nadelholz', NULL),
('Laub- und Nadelholz', NULL),
('Laubwald mit Nadelholz', NULL),
('Nadelwald mit Laubholz', NULL),
('Gehölz', NULL),
('Latschenkiefer', NULL),
('Windschutz', NULL),
('Heide', NULL),
('Moor', NULL),
('Sumpf', NULL),
('UnlandVegetationslose Fläche', NULL),
('Vegetationslose Fläche', NULL),
('Gewässerbegleitfläche', NULL),
('Bebaute Gewässerbegleitfläche', NULL),
('Unbebaute Gewässerbegleitfläche', NULL),
('Sukzessionsfläche', NULL),
('Fließgewässer', NULL),
('Fluss', NULL),
('Altwasser', NULL),
('Altarm', NULL),
('Flussmündungstrichter', NULL),
('Kanal', NULL),
('Graben', NULL),
('Fleet', NULL),
('Bach', NULL),
('Hafenbecken', NULL),
('Sporthafenbecken', NULL),
('Stehendes Gewässer', NULL),
('See', NULL),
('Teich', NULL),
('Stausee', NULL),
('Speicherbecken', NULL),
('Baggersee', NULL),
('Meer', NULL),
('Küstengewässer', NULL);

CREATE TABLE IF NOT EXISTS ax_funktionhgr_k_tnhgr (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT ax_funktionhgr_k_tnhgr_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_funktionhgr_k_tnhgr IS 'Alias: "AX_FunktionHGr_K_TNHGR", UML-Typ: Enumeration';
INSERT INTO ax_funktionhgr_k_tnhgr (wert,beschreibung) VALUES 
('Siedlung', NULL),
('Verkehr', NULL),
('Vegetation', NULL),
('Gewässer', NULL);

CREATE TABLE IF NOT EXISTS ax_wirtschaftsart (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT ax_wirtschaftsart_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_wirtschaftsart IS 'Alias: "AX_Wirtschaftsart", UML-Typ: Enumeration';
INSERT INTO ax_wirtschaftsart (wert,beschreibung) VALUES 
('Gebäude- und Freifläche', NULL),
('Betriebsfläche', NULL),
('Erholungsfläche', NULL),
('Verkehrsfläche', NULL),
('Landwirtschaftsfläche', NULL),
('Waldfläche', NULL),
('Wasserfläche', NULL),
('Übungsgelände', NULL),
('Historische Anlage', NULL),
('Friedhof', NULL),
('Unland', NULL);

CREATE TABLE IF NOT EXISTS ax_punktart_k_punkte (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT ax_punktart_k_punkte_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_punktart_k_punkte IS 'Alias: "AX_Punktart_K_PUNKTE", UML-Typ: Enumeration';
INSERT INTO ax_punktart_k_punkte (wert,beschreibung) VALUES 
('Aufnahmepunkt', NULL),
('Sicherungspunkt', NULL),
('Vermessungspunkt', NULL),
('Gebäudepunkt', NULL),
('Bauwerkspunkt', NULL),
('Topographischer Punkt', NULL),
('Lagefestpunkt', NULL);

CREATE TABLE IF NOT EXISTS ax_k_zeile_punktart (
	wert character varying,
	beschreibung character varying,
	CONSTRAINT ax_k_zeile_punktart_pkey PRIMARY KEY (wert)
) WITH OIDS;

COMMENT ON TABLE ax_k_zeile_punktart IS 'Alias: "AX_K_ZEILE_Punktart", UML-Typ: Enumeration';
INSERT INTO ax_k_zeile_punktart (wert,beschreibung) VALUES 
('Grenzpunkt', NULL),
('Besonderer Gebäudepunkt', NULL),
('Besonderer topographischer Punkt', NULL),
('Aufnahmepunkt', NULL),
('Sicherungspunkt', NULL),
('Sonstiger Vermessungspunkt', NULL),
('Besonderer Bauwerkspunkt', NULL);

CREATE TABLE IF NOT EXISTS ax_benutzer (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	art text,
	direkt boolean NOT NULL,
	email character varying NOT NULL,
	http character varying NOT NULL,
	manuell text NOT NULL,
	ausgabemasstab double precision,
	ausgabemedium character varying,
	datenformat character varying,
	formatangabe text,
	letzteabgabeart integer,
	letzteabgabezugriff timestamp without time zone,
	nbaquittierungerhalten timestamp without time zone,
	nbauebernahmeerfolgreich boolean,
	profilkennung text NOT NULL,
	vorletzteabgabezugriff timestamp without time zone,
	zahlungsweise text,
	zeitlicheberechtigung date,
	inverszu_wer text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	ist text NOT NULL,
	gehoertzu text NOT NULL,
CONSTRAINT ax_benutzer_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_benutzer IS 'FeatureType: "AX_Benutzer"';
COMMENT ON COLUMN ax_benutzer.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_benutzer.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_benutzer.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_benutzer.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_benutzer.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_benutzer.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_benutzer.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_benutzer.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_benutzer.art IS 'art    0..1';
COMMENT ON COLUMN ax_benutzer.direkt IS 'empfaenger AA_Empfaenger|direkt  Boolean 1';
COMMENT ON COLUMN ax_benutzer.email IS 'empfaenger AA_Empfaenger|email  URI 1';
COMMENT ON COLUMN ax_benutzer.http IS 'empfaenger AA_Empfaenger|http  URI 1';
COMMENT ON COLUMN ax_benutzer.manuell IS 'empfaenger AA_Empfaenger|manuell   1';
COMMENT ON COLUMN ax_benutzer.ausgabemasstab IS 'folgeverarbeitung AX_FOLGEVA|ausgabemasstab  Real 0..1';
COMMENT ON COLUMN ax_benutzer.ausgabemedium IS 'folgeverarbeitung AX_FOLGEVA|ausgabemedium enumeration AX_Ausgabemedium_Benutzer 0..1';
COMMENT ON COLUMN ax_benutzer.datenformat IS 'folgeverarbeitung AX_FOLGEVA|datenformat enumeration AX_Datenformat_Benutzer 0..1';
COMMENT ON COLUMN ax_benutzer.formatangabe IS 'folgeverarbeitung AX_FOLGEVA|formatangabe   0..1';
COMMENT ON COLUMN ax_benutzer.letzteabgabeart IS 'letzteAbgabeArt  enumeration AX_LetzteAbgabeArt 0..1';
COMMENT ON COLUMN ax_benutzer.letzteabgabezugriff IS 'letzteAbgabeZugriff   DateTime 0..1';
COMMENT ON COLUMN ax_benutzer.nbaquittierungerhalten IS 'nBAQuittierungErhalten   DateTime 0..1';
COMMENT ON COLUMN ax_benutzer.nbauebernahmeerfolgreich IS 'nBAUebernahmeErfolgreich   Boolean 0..1';
COMMENT ON COLUMN ax_benutzer.profilkennung IS 'profilkennung    1';
COMMENT ON COLUMN ax_benutzer.vorletzteabgabezugriff IS 'vorletzteAbgabeZugriff   DateTime 0..1';
COMMENT ON COLUMN ax_benutzer.zahlungsweise IS 'zahlungsweise    0..1';
COMMENT ON COLUMN ax_benutzer.zeitlicheberechtigung IS 'zeitlicheBerechtigung   Date 0..1';
COMMENT ON COLUMN ax_benutzer.ist IS 'Assoziation zu: FeatureType AX_Person (ax_person) 1';
COMMENT ON COLUMN ax_benutzer.gehoertzu IS 'Assoziation zu: FeatureType AX_Benutzergruppe (ax_benutzergruppe) 1';

CREATE TABLE IF NOT EXISTS ax_benutzergruppemitzugriffskontrolle (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	bezeichnung text NOT NULL,
	koordinatenreferenzsystem character varying,
	land text NOT NULL,
	stelle text NOT NULL,
	selektionskriterien text[] NOT NULL,
	zugriffhistorie boolean NOT NULL,
	zugriffsartfortfuehrungsanlass text[],
	zugriffsartproduktkennungbenutzung text[],
	zugriffsartproduktkennungfuehrung text[],
	bestehtaus text[],
	inverszu_bearbeitbardurch text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_benutzergruppemitzugriffskontrolle_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_benutzergruppemitzugriffskontrolle IS 'FeatureType: "AX_BenutzergruppeMitZugriffskontrolle"';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.bezeichnung IS 'bezeichnung    1';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.koordinatenreferenzsystem IS 'koordinatenreferenzsystem   SC_CRS 0..1';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.land IS 'zustaendigeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.stelle IS 'zustaendigeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.selektionskriterien IS 'selektionskriterien    1..*';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.zugriffhistorie IS 'zugriffHistorie   Boolean 1';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.zugriffsartfortfuehrungsanlass IS 'zugriffsartFortfuehrungsanlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.zugriffsartproduktkennungbenutzung IS 'zugriffsartProduktkennungBenutzung  codelist AA_Anlassart_Benutzungsauftrag 0..*';
COMMENT ON COLUMN ax_benutzergruppemitzugriffskontrolle.zugriffsartproduktkennungfuehrung IS 'zugriffsartProduktkennungFuehrung  codelist AA_Anlassart 0..*';

CREATE TABLE IF NOT EXISTS ax_benutzergruppenba (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	bezeichnung text NOT NULL,
	koordinatenreferenzsystem character varying,
	land text NOT NULL,
	stelle text NOT NULL,
	bereichzeitlich_art character varying,
	ersterstichtag date,
	intervall date,
	seitenlaenge integer,
	quittierung boolean,
	selektionskriterien text[] NOT NULL,
	bestehtaus text[],
	inverszu_bearbeitbardurch text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_benutzergruppenba_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_benutzergruppenba IS 'FeatureType: "AX_BenutzergruppeNBA"';
COMMENT ON COLUMN ax_benutzergruppenba.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_benutzergruppenba.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_benutzergruppenba.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_benutzergruppenba.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_benutzergruppenba.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_benutzergruppenba.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_benutzergruppenba.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_benutzergruppenba.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_benutzergruppenba.bezeichnung IS 'bezeichnung    1';
COMMENT ON COLUMN ax_benutzergruppenba.koordinatenreferenzsystem IS 'koordinatenreferenzsystem   SC_CRS 0..1';
COMMENT ON COLUMN ax_benutzergruppenba.land IS 'zustaendigeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_benutzergruppenba.stelle IS 'zustaendigeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_benutzergruppenba.bereichzeitlich_art IS 'bereichZeitlich AX_BereichZeitlich|art enumeration AX_Art_BereichZeitlich 1';
COMMENT ON COLUMN ax_benutzergruppenba.ersterstichtag IS 'bereichZeitlich AX_BereichZeitlich|ersterStichtag  Date 1';
COMMENT ON COLUMN ax_benutzergruppenba.intervall IS 'bereichZeitlich AX_BereichZeitlich|intervall  TM_Duration 1';
COMMENT ON COLUMN ax_benutzergruppenba.seitenlaenge IS 'portionierungsparameter AX_Portionierungsparameter|seitenlaenge  Integer 1';
COMMENT ON COLUMN ax_benutzergruppenba.quittierung IS 'quittierung   Boolean 0..1';
COMMENT ON COLUMN ax_benutzergruppenba.selektionskriterien IS 'selektionskriterien    1..*';

CREATE TABLE IF NOT EXISTS ap_darstellung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	art character varying,
	darstellungsprioritaet integer,
	positionierungsregel text,
	signaturnummer character varying,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	dientzurdarstellungvon text[],
CONSTRAINT ap_darstellung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ap_darstellung IS 'FeatureType: "AP_Darstellung"';
COMMENT ON COLUMN ap_darstellung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ap_darstellung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ap_darstellung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ap_darstellung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ap_darstellung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ap_darstellung.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ap_darstellung.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ap_darstellung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ap_darstellung.art IS 'art   CharacterString 0..1';
COMMENT ON COLUMN ap_darstellung.darstellungsprioritaet IS 'darstellungsprioritaet   Integer 0..1';
COMMENT ON COLUMN ap_darstellung.positionierungsregel IS 'positionierungsregel    0..1';
COMMENT ON COLUMN ap_darstellung.signaturnummer IS 'signaturnummer   CharacterString 0..1';
COMMENT ON COLUMN ap_darstellung.dientzurdarstellungvon IS 'Assoziation zu: FeatureType AA_Objekt (aa_objekt) 0..*';

CREATE TABLE IF NOT EXISTS aa_projektsteuerung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	anlassdesprozesses text[] NOT NULL,
	art text NOT NULL,
	parameterwert text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_verweistauf text,
	enthaelt text[] NOT NULL,
CONSTRAINT aa_projektsteuerung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE aa_projektsteuerung IS 'FeatureType: "AA_Projektsteuerung"';
COMMENT ON COLUMN aa_projektsteuerung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN aa_projektsteuerung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN aa_projektsteuerung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN aa_projektsteuerung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN aa_projektsteuerung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN aa_projektsteuerung.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN aa_projektsteuerung.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN aa_projektsteuerung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN aa_projektsteuerung.anlassdesprozesses IS 'anlassDesProzesses  codelist AA_Anlassart 1..*';
COMMENT ON COLUMN aa_projektsteuerung.art IS 'art   GenericName 1';
COMMENT ON COLUMN aa_projektsteuerung.parameterwert IS 'gebuehren AA_Gebuehrenangaben|parameterWert   1';
COMMENT ON COLUMN aa_projektsteuerung.inverszu_verweistauf IS 'Assoziation zu: FeatureType AA_Antrag (aa_antrag) 0..1';
COMMENT ON COLUMN aa_projektsteuerung.enthaelt IS 'Assoziation zu: FeatureType AA_Vorgang (aa_vorgang) 1..*';

CREATE TABLE IF NOT EXISTS aa_meilenstein (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	abgeschlossen boolean,
	begonnen boolean,
	bemerkung text,
	erfolgreich boolean,
	kategorie text,
	wannabgeschlossen timestamp without time zone,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	wer text,
	vonantrag text[],
	vonaktivitaet text[],
	vonvorgang text[],
CONSTRAINT aa_meilenstein_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE aa_meilenstein IS 'FeatureType: "AA_Meilenstein"';
COMMENT ON COLUMN aa_meilenstein.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN aa_meilenstein.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN aa_meilenstein.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN aa_meilenstein.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN aa_meilenstein.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN aa_meilenstein.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN aa_meilenstein.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN aa_meilenstein.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN aa_meilenstein.abgeschlossen IS 'abgeschlossen   Boolean 0..1';
COMMENT ON COLUMN aa_meilenstein.begonnen IS 'begonnen   Boolean 0..1';
COMMENT ON COLUMN aa_meilenstein.bemerkung IS 'bemerkung    0..1';
COMMENT ON COLUMN aa_meilenstein.erfolgreich IS 'erfolgreich   Boolean 0..1';
COMMENT ON COLUMN aa_meilenstein.kategorie IS 'kategorie  codelist AA_BesondereMeilensteinkategorie 0..1';
COMMENT ON COLUMN aa_meilenstein.wannabgeschlossen IS 'wannAbgeschlossen   DateTime 0..1';
COMMENT ON COLUMN aa_meilenstein.wer IS 'Assoziation zu: FeatureType AA_Benutzer (aa_benutzer) 0..1';
COMMENT ON COLUMN aa_meilenstein.vonantrag IS 'Assoziation zu: FeatureType AA_Antrag (aa_antrag) 0..*';
COMMENT ON COLUMN aa_meilenstein.vonaktivitaet IS 'Assoziation zu: FeatureType AA_Aktivitaet (aa_aktivitaet) 0..*';
COMMENT ON COLUMN aa_meilenstein.vonvorgang IS 'Assoziation zu: FeatureType AA_Vorgang (aa_vorgang) 0..*';

CREATE TABLE IF NOT EXISTS aa_antrag (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	antragunterbrochen boolean NOT NULL,
	art text NOT NULL,
	erlaeuterungzumstatus text,
	kennzeichen text NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	verweistauf text[] NOT NULL,
	bearbeitungsstatus text,
	gebiet text,
CONSTRAINT aa_antrag_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE aa_antrag IS 'FeatureType: "AA_Antrag"';
COMMENT ON COLUMN aa_antrag.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN aa_antrag.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN aa_antrag.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN aa_antrag.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN aa_antrag.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN aa_antrag.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN aa_antrag.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN aa_antrag.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN aa_antrag.antragunterbrochen IS 'antragUnterbrochen   Boolean 1';
COMMENT ON COLUMN aa_antrag.art IS 'art   GenericName 1';
COMMENT ON COLUMN aa_antrag.erlaeuterungzumstatus IS 'erlaeuterungZumStatus    0..1';
COMMENT ON COLUMN aa_antrag.kennzeichen IS 'kennzeichen    1';
COMMENT ON COLUMN aa_antrag.verweistauf IS 'Assoziation zu: FeatureType AA_Projektsteuerung (aa_projektsteuerung) 1..*';
COMMENT ON COLUMN aa_antrag.bearbeitungsstatus IS 'Assoziation zu: FeatureType AA_Meilenstein (aa_meilenstein) 0..1';
COMMENT ON COLUMN aa_antrag.gebiet IS 'Assoziation zu: FeatureType AA_Antragsgebiet (aa_antragsgebiet) 0..1';

CREATE TABLE IF NOT EXISTS aa_aktivitaet (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	art text NOT NULL,
	erlaeuterung text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	status text NOT NULL,
	inverszu_enthaelt text,
CONSTRAINT aa_aktivitaet_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE aa_aktivitaet IS 'FeatureType: "AA_Aktivitaet"';
COMMENT ON COLUMN aa_aktivitaet.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN aa_aktivitaet.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN aa_aktivitaet.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN aa_aktivitaet.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN aa_aktivitaet.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN aa_aktivitaet.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN aa_aktivitaet.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN aa_aktivitaet.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN aa_aktivitaet.art IS 'art   GenericName 1';
COMMENT ON COLUMN aa_aktivitaet.erlaeuterung IS 'erlaeuterung    0..1';
COMMENT ON COLUMN aa_aktivitaet.status IS 'Assoziation zu: FeatureType AA_Meilenstein (aa_meilenstein) 1';
COMMENT ON COLUMN aa_aktivitaet.inverszu_enthaelt IS 'Assoziation zu: FeatureType AA_Vorgang (aa_vorgang) 0..1';

CREATE TABLE IF NOT EXISTS aa_vorgang (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	art text NOT NULL,
	erlaeuterung text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	bearbeitbardurch text NOT NULL,
	inverszu_enthaelt text,
	status text NOT NULL,
	enthaelt text[],
	synchronisiertmit text,
	inverszu_synchronisiertmit text,
CONSTRAINT aa_vorgang_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE aa_vorgang IS 'FeatureType: "AA_Vorgang"';
COMMENT ON COLUMN aa_vorgang.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN aa_vorgang.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN aa_vorgang.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN aa_vorgang.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN aa_vorgang.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN aa_vorgang.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN aa_vorgang.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN aa_vorgang.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN aa_vorgang.art IS 'art   GenericName 1';
COMMENT ON COLUMN aa_vorgang.erlaeuterung IS 'erlaeuterung    0..1';
COMMENT ON COLUMN aa_vorgang.bearbeitbardurch IS 'Assoziation zu: FeatureType AA_Benutzergruppe (aa_benutzergruppe) 1';
COMMENT ON COLUMN aa_vorgang.inverszu_enthaelt IS 'Assoziation zu: FeatureType AA_Projektsteuerung (aa_projektsteuerung) 0..1';
COMMENT ON COLUMN aa_vorgang.status IS 'Assoziation zu: FeatureType AA_Meilenstein (aa_meilenstein) 1';
COMMENT ON COLUMN aa_vorgang.enthaelt IS 'Assoziation zu: FeatureType AA_Aktivitaet (aa_aktivitaet) 0..*';
COMMENT ON COLUMN aa_vorgang.synchronisiertmit IS 'Assoziation zu: FeatureType AA_Vorgang (aa_vorgang) 0..1';
COMMENT ON COLUMN aa_vorgang.inverszu_synchronisiertmit IS 'Assoziation zu: FeatureType AA_Vorgang (aa_vorgang) 0..1';

CREATE TABLE IF NOT EXISTS ax_person (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	akademischergrad text,
	anrede integer,
	beruf text,
	geburtsdatum date,
	geburtsname text,
	haushaltsstellelandesgrundbesitz text,
	nachnameoderfirma text NOT NULL,
	namensbestandteil text,
	herkunft text,
	sonstigeeigenschaften text,
	vorname text,
	wohnortodersitz text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_zeigtauf text[],
	zeigtauf text,
	weistauf text[],
	hat text[],
	benennt text[],
	gehoertzu text[],
	wirdvertretenvon text[],
	uebtaus text[],
	besitzt text[],
	inverszu_ist text[],
CONSTRAINT ax_person_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_person IS 'FeatureType: "AX_Person"';
COMMENT ON COLUMN ax_person.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_person.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_person.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_person.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_person.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_person.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_person.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_person.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_person.akademischergrad IS 'akademischerGrad    0..1';
COMMENT ON COLUMN ax_person.anrede IS 'anrede  enumeration AX_Anrede_Person 0..1';
COMMENT ON COLUMN ax_person.beruf IS 'beruf    0..1';
COMMENT ON COLUMN ax_person.geburtsdatum IS 'geburtsdatum   Date 0..1';
COMMENT ON COLUMN ax_person.geburtsname IS 'geburtsname    0..1';
COMMENT ON COLUMN ax_person.haushaltsstellelandesgrundbesitz IS 'haushaltsstelleLandesgrundbesitz    0..1';
COMMENT ON COLUMN ax_person.nachnameoderfirma IS 'nachnameOderFirma    1';
COMMENT ON COLUMN ax_person.namensbestandteil IS 'namensbestandteil    0..1';
COMMENT ON COLUMN ax_person.herkunft IS 'qualitaetsangaben AX_DQOhneDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_person.sonstigeeigenschaften IS 'sonstigeEigenschaften    0..1';
COMMENT ON COLUMN ax_person.vorname IS 'vorname    0..1';
COMMENT ON COLUMN ax_person.wohnortodersitz IS 'wohnortOderSitz    0..1';
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
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	nenner double precision,
	zaehler double precision,
	artderrechtsgemeinschaft integer,
	beschriebderrechtsgemeinschaft text,
	eigentuemerart integer,
	laufendenummernachdin1421 text,
	nummer text,
	strichblattnummer integer,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	benennt text,
	inverszu_bestehtausrechtsverhaeltnissenzu  text[],
	bestehtausrechtsverhaeltnissenzu  text,
	inverszu_hatvorgaenger  text[],
	hatvorgaenger  text[],
	istbestandteilvon text NOT NULL,
CONSTRAINT ax_namensnummer_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_namensnummer IS 'FeatureType: "AX_Namensnummer"';
COMMENT ON COLUMN ax_namensnummer.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_namensnummer.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_namensnummer.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_namensnummer.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_namensnummer.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_namensnummer.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_namensnummer.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_namensnummer.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_namensnummer.nenner IS 'anteil AX_Anteil|nenner  Real 1';
COMMENT ON COLUMN ax_namensnummer.zaehler IS 'anteil AX_Anteil|zaehler  Real 1';
COMMENT ON COLUMN ax_namensnummer.artderrechtsgemeinschaft IS 'artDerRechtsgemeinschaft  enumeration AX_ArtDerRechtsgemeinschaft_Namensnummer 0..1';
COMMENT ON COLUMN ax_namensnummer.beschriebderrechtsgemeinschaft IS 'beschriebDerRechtsgemeinschaft    0..1';
COMMENT ON COLUMN ax_namensnummer.eigentuemerart IS 'eigentuemerart  enumeration AX_Eigentuemerart_Namensnummer 0..1';
COMMENT ON COLUMN ax_namensnummer.laufendenummernachdin1421 IS 'laufendeNummerNachDIN1421    0..1';
COMMENT ON COLUMN ax_namensnummer.nummer IS 'nummer    0..1';
COMMENT ON COLUMN ax_namensnummer.strichblattnummer IS 'strichblattnummer   Integer 0..1';
COMMENT ON COLUMN ax_namensnummer.benennt IS 'Assoziation zu: FeatureType AX_Person (ax_person) 0..1';
COMMENT ON COLUMN ax_namensnummer.inverszu_bestehtausrechtsverhaeltnissenzu  IS 'Assoziation zu: FeatureType AX_Namensnummer (ax_namensnummer) 0..*';
COMMENT ON COLUMN ax_namensnummer.bestehtausrechtsverhaeltnissenzu  IS 'Assoziation zu: FeatureType AX_Namensnummer (ax_namensnummer) 0..1';
COMMENT ON COLUMN ax_namensnummer.inverszu_hatvorgaenger  IS 'Assoziation zu: FeatureType AX_Namensnummer (ax_namensnummer) 0..*';
COMMENT ON COLUMN ax_namensnummer.hatvorgaenger  IS 'Assoziation zu: FeatureType AX_Namensnummer (ax_namensnummer) 0..*';
COMMENT ON COLUMN ax_namensnummer.istbestandteilvon IS 'Assoziation zu: FeatureType AX_Buchungsblatt (ax_buchungsblatt) 1';

CREATE TABLE IF NOT EXISTS ax_anschrift (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	bestimmungsland text,
	fax text[],
	hausnummer text,
	ort_amtlichesortsnamensverzeichnis text,
	ort_post text NOT NULL,
	ortsteil text,
	postfach text,
	postleitzahlpostfach text,
	postleitzahlpostzustellung text,
	herkunft text,
	strasse text,
	telefon text[],
	weitereadressen text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	gehoertzu text[],
	beziehtsichauf text[],
CONSTRAINT ax_anschrift_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_anschrift IS 'FeatureType: "AX_Anschrift"';
COMMENT ON COLUMN ax_anschrift.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_anschrift.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_anschrift.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_anschrift.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_anschrift.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_anschrift.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_anschrift.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_anschrift.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_anschrift.bestimmungsland IS 'bestimmungsland    0..1';
COMMENT ON COLUMN ax_anschrift.fax IS 'fax    0..*';
COMMENT ON COLUMN ax_anschrift.hausnummer IS 'hausnummer    0..1';
COMMENT ON COLUMN ax_anschrift.ort_amtlichesortsnamensverzeichnis IS 'ort_AmtlichesOrtsnamensverzeichnis    0..1';
COMMENT ON COLUMN ax_anschrift.ort_post IS 'ort_Post    1';
COMMENT ON COLUMN ax_anschrift.ortsteil IS 'ortsteil    0..1';
COMMENT ON COLUMN ax_anschrift.postfach IS 'postfach    0..1';
COMMENT ON COLUMN ax_anschrift.postleitzahlpostfach IS 'postleitzahlPostfach    0..1';
COMMENT ON COLUMN ax_anschrift.postleitzahlpostzustellung IS 'postleitzahlPostzustellung    0..1';
COMMENT ON COLUMN ax_anschrift.herkunft IS 'qualitaetsangaben AX_DQOhneDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_anschrift.strasse IS 'strasse    0..1';
COMMENT ON COLUMN ax_anschrift.telefon IS 'telefon    0..*';
COMMENT ON COLUMN ax_anschrift.weitereadressen IS 'weitereAdressen    0..*';
COMMENT ON COLUMN ax_anschrift.gehoertzu IS 'Assoziation zu: FeatureType AX_Person (ax_person) 0..*';
COMMENT ON COLUMN ax_anschrift.beziehtsichauf IS 'Assoziation zu: FeatureType AX_Dienststelle (ax_dienststelle) 0..*';

CREATE TABLE IF NOT EXISTS ax_verwaltung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	beginnderbestellung date,
	bestellungsbeschluss text,
	endederbestellung date,
	grundakt text,
	notariat text,
	herkunft text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	haengtan text NOT NULL,
	beziehtsichauf text[],
CONSTRAINT ax_verwaltung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_verwaltung IS 'FeatureType: "AX_Verwaltung"';
COMMENT ON COLUMN ax_verwaltung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_verwaltung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_verwaltung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_verwaltung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_verwaltung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_verwaltung.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_verwaltung.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_verwaltung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_verwaltung.beginnderbestellung IS 'beginnDerBestellung   Date 0..1';
COMMENT ON COLUMN ax_verwaltung.bestellungsbeschluss IS 'bestellungsbeschluss    0..1';
COMMENT ON COLUMN ax_verwaltung.endederbestellung IS 'endeDerBestellung   Date 0..1';
COMMENT ON COLUMN ax_verwaltung.grundakt IS 'grundakt    0..1';
COMMENT ON COLUMN ax_verwaltung.notariat IS 'notariat    0..1';
COMMENT ON COLUMN ax_verwaltung.herkunft IS 'qualitaetsangaben AX_DQOhneDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_verwaltung.haengtan IS 'Assoziation zu: FeatureType AX_Person (ax_person) 1';
COMMENT ON COLUMN ax_verwaltung.beziehtsichauf IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';

CREATE TABLE IF NOT EXISTS ax_buchungsstelle (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	nenner double precision,
	zaehler double precision,
	beschreibungdessondereigentums text,
	beschreibungdesumfangsderbuchung text,
	buchungsart integer NOT NULL,
	buchungstext text,
	laufendenummer text NOT NULL,
	nummerimaufteilungsplan text,
	zeitpunktdereintragung date,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
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
	inverszu_istgebucht text[],
CONSTRAINT ax_buchungsstelle_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_buchungsstelle IS 'FeatureType: "AX_Buchungsstelle"';
COMMENT ON COLUMN ax_buchungsstelle.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_buchungsstelle.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_buchungsstelle.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_buchungsstelle.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_buchungsstelle.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_buchungsstelle.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_buchungsstelle.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_buchungsstelle.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_buchungsstelle.nenner IS 'anteil AX_Anteil|nenner  Real 1';
COMMENT ON COLUMN ax_buchungsstelle.zaehler IS 'anteil AX_Anteil|zaehler  Real 1';
COMMENT ON COLUMN ax_buchungsstelle.beschreibungdessondereigentums IS 'beschreibungDesSondereigentums    0..1';
COMMENT ON COLUMN ax_buchungsstelle.beschreibungdesumfangsderbuchung IS 'beschreibungDesUmfangsDerBuchung    0..1';
COMMENT ON COLUMN ax_buchungsstelle.buchungsart IS 'buchungsart  enumeration AX_Buchungsart_Buchungsstelle 1';
COMMENT ON COLUMN ax_buchungsstelle.buchungstext IS 'buchungstext    0..1';
COMMENT ON COLUMN ax_buchungsstelle.laufendenummer IS 'laufendeNummer    1';
COMMENT ON COLUMN ax_buchungsstelle.nummerimaufteilungsplan IS 'nummerImAufteilungsplan    0..1';
COMMENT ON COLUMN ax_buchungsstelle.zeitpunktdereintragung IS 'zeitpunktDerEintragung   Date 0..1';
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
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	namederpersonengruppe text NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	bestehtaus text[],
CONSTRAINT ax_personengruppe_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_personengruppe IS 'FeatureType: "AX_Personengruppe"';
COMMENT ON COLUMN ax_personengruppe.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_personengruppe.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_personengruppe.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_personengruppe.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_personengruppe.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_personengruppe.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_personengruppe.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_personengruppe.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_personengruppe.namederpersonengruppe IS 'nameDerPersonengruppe    1';
COMMENT ON COLUMN ax_personengruppe.bestehtaus IS 'Assoziation zu: FeatureType AX_Person (ax_person) 0..*';

CREATE TABLE IF NOT EXISTS ax_buchungsblatt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	blattart integer NOT NULL,
	bezirk text NOT NULL,
	land text NOT NULL,
	buchungsblattkennzeichen text NOT NULL,
	buchungsblattnummermitbuchstabenerweiterung text NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_istbestandteilvon text[],
	bestehtaus text[],
	inverszu_beziehtsichauf text[],
CONSTRAINT ax_buchungsblatt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_buchungsblatt IS 'FeatureType: "AX_Buchungsblatt"';
COMMENT ON COLUMN ax_buchungsblatt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_buchungsblatt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_buchungsblatt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_buchungsblatt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_buchungsblatt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_buchungsblatt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_buchungsblatt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_buchungsblatt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_buchungsblatt.blattart IS 'blattart  enumeration AX_Blattart_Buchungsblatt 1';
COMMENT ON COLUMN ax_buchungsblatt.bezirk IS 'buchungsblattbezirk AX_Buchungsblattbezirk_Schluessel|bezirk   1';
COMMENT ON COLUMN ax_buchungsblatt.land IS 'buchungsblattbezirk AX_Buchungsblattbezirk_Schluessel|land   1';
COMMENT ON COLUMN ax_buchungsblatt.buchungsblattkennzeichen IS 'buchungsblattkennzeichen    1';
COMMENT ON COLUMN ax_buchungsblatt.buchungsblattnummermitbuchstabenerweiterung IS 'buchungsblattnummerMitBuchstabenerweiterung    1';
COMMENT ON COLUMN ax_buchungsblatt.inverszu_istbestandteilvon IS 'Assoziation zu: FeatureType AX_Namensnummer (ax_namensnummer) 0..*';
COMMENT ON COLUMN ax_buchungsblatt.bestehtaus IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';
COMMENT ON COLUMN ax_buchungsblatt.inverszu_beziehtsichauf IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';

CREATE TABLE IF NOT EXISTS ax_vertretung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	angabenzurvertretung text,
	artdervertretung text[],
	beginndervertretung date,
	endedervertretung date,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	vertritt text[],
	haengtan text NOT NULL,
	beziehtsichauf text[],
CONSTRAINT ax_vertretung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_vertretung IS 'FeatureType: "AX_Vertretung"';
COMMENT ON COLUMN ax_vertretung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_vertretung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_vertretung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_vertretung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_vertretung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_vertretung.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_vertretung.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_vertretung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_vertretung.angabenzurvertretung IS 'angabenZurVertretung    0..1';
COMMENT ON COLUMN ax_vertretung.artdervertretung IS 'artDerVertretung    0..*';
COMMENT ON COLUMN ax_vertretung.beginndervertretung IS 'beginnDerVertretung   Date 0..1';
COMMENT ON COLUMN ax_vertretung.endedervertretung IS 'endeDerVertretung   Date 0..1';
COMMENT ON COLUMN ax_vertretung.vertritt IS 'Assoziation zu: FeatureType AX_Person (ax_person) 0..*';
COMMENT ON COLUMN ax_vertretung.haengtan IS 'Assoziation zu: FeatureType AX_Person (ax_person) 1';
COMMENT ON COLUMN ax_vertretung.beziehtsichauf IS 'Assoziation zu: FeatureType AX_Flurstueck (ax_flurstueck) 0..*';

CREATE TABLE IF NOT EXISTS ax_skizze (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	bemerkungen text,
	skizzenart integer,
	skizzenname character varying NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_skizze_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_skizze IS 'FeatureType: "AX_Skizze"';
COMMENT ON COLUMN ax_skizze.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_skizze.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_skizze.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_skizze.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_skizze.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_skizze.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_skizze.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_skizze.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_skizze.bemerkungen IS 'bemerkungen    0..1';
COMMENT ON COLUMN ax_skizze.skizzenart IS 'skizzenart  enumeration AX_Skizzenart_Skizze 0..1';
COMMENT ON COLUMN ax_skizze.skizzenname IS 'skizzenname   URI 1';

CREATE TABLE IF NOT EXISTS ax_schwere (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	aufstellhoehe double precision,
	hinweise text,
	bestimmungsdatum date,
	datenerhebung character varying,
	genauigkeitsstufe character varying,
	genauigkeitswert integer,
	messmethode character varying,
	vertrauenswuerdigkeit character varying,
	schwereanomalie_art character varying[],
	wert character varying[],
	schwerestatus integer,
	schweresystem integer NOT NULL,
	schwerewert double precision NOT NULL,
	ueberpruefungsdatum date,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_schwere_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_schwere IS 'FeatureType: "AX_Schwere"';
COMMENT ON COLUMN ax_schwere.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_schwere.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_schwere.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_schwere.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_schwere.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_schwere.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_schwere.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_schwere.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_schwere.aufstellhoehe IS 'aufstellhoehe   Distance 0..1';
COMMENT ON COLUMN ax_schwere.hinweise IS 'hinweise    0..1';
COMMENT ON COLUMN ax_schwere.bestimmungsdatum IS 'qualitaetsangaben AX_DQSchwere|bestimmungsdatum  Date 0..1';
COMMENT ON COLUMN ax_schwere.datenerhebung IS 'qualitaetsangaben AX_DQSchwere|datenerhebung enumeration AX_Datenerhebung_Schwere 0..1';
COMMENT ON COLUMN ax_schwere.genauigkeitsstufe IS 'qualitaetsangaben AX_DQSchwere|genauigkeitsstufe enumeration AX_Genauigkeitsstufe_Schwere 0..1';
COMMENT ON COLUMN ax_schwere.genauigkeitswert IS 'qualitaetsangaben AX_DQSchwere|genauigkeitswert  Integer 0..1';
COMMENT ON COLUMN ax_schwere.messmethode IS 'qualitaetsangaben AX_DQSchwere|messmethode enumeration AX_Messmethode_Schwere 0..1';
COMMENT ON COLUMN ax_schwere.vertrauenswuerdigkeit IS 'qualitaetsangaben AX_DQSchwere|vertrauenswuerdigkeit enumeration AX_Vertrauenswuerdigkeit_Schwere 0..1';
COMMENT ON COLUMN ax_schwere.schwereanomalie_art IS 'schwereanomalie AX_Schwereanomalie_Schwere|art enumeration AX_Schwereanomalie_Schwere_Art 1';
COMMENT ON COLUMN ax_schwere.wert IS 'schwereanomalie AX_Schwereanomalie_Schwere|wert  Measure 1';
COMMENT ON COLUMN ax_schwere.schwerestatus IS 'schwerestatus  enumeration AX_Schwerestatus_Schwere 0..1';
COMMENT ON COLUMN ax_schwere.schweresystem IS 'schweresystem  enumeration AX_Schweresystem_Schwere 1';
COMMENT ON COLUMN ax_schwere.schwerewert IS 'schwerewert   Real 1';
COMMENT ON COLUMN ax_schwere.ueberpruefungsdatum IS 'ueberpruefungsdatum   Date 0..1';

CREATE TABLE IF NOT EXISTS ax_historischesflurstueckalb (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	amtlicheflaeche double precision NOT NULL,
	blattart character varying[],
	buchungsart text[],
	bezirk text[],
	buchungsblattbezirk_land text[],
	buchungsblattkennzeichen text[],
	buchungsblattnummermitbuchstabenerweiterung text[],
	laufendenummerderbuchungsstelle text[],
	flurnummer integer,
	flurstuecksfolge text,
	flurstueckskennzeichen text NOT NULL,
	nenner text,
	zaehler text NOT NULL,
	fortfuehrungsart text,
	gemarkungsnummer text NOT NULL,
	gemarkung_land text NOT NULL,
	laufendenummerderfortfuehrung text,
	nachfolgerflurstueckskennzeichen text[],
	objektkoordinaten geometry(POINT),
	vorgaengerflurstueckskennzeichen text[],
	zeitpunktderentstehungdesbezugsflurstuecks date,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_historischesflurstueckalb_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_historischesflurstueckalb IS 'FeatureType: "AX_HistorischesFlurstueckALB"';
COMMENT ON COLUMN ax_historischesflurstueckalb.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_historischesflurstueckalb.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_historischesflurstueckalb.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_historischesflurstueckalb.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_historischesflurstueckalb.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_historischesflurstueckalb.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_historischesflurstueckalb.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_historischesflurstueckalb.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_historischesflurstueckalb.amtlicheflaeche IS 'amtlicheFlaeche   Area 1';
COMMENT ON COLUMN ax_historischesflurstueckalb.blattart IS 'buchung AX_Buchung_HistorischesFlurstueck|blattart enumeration AX_Blattart_HistorischesFlurstueck 1';
COMMENT ON COLUMN ax_historischesflurstueckalb.buchungsart IS 'buchung AX_Buchung_HistorischesFlurstueck|buchungsart   1';
COMMENT ON COLUMN ax_historischesflurstueckalb.bezirk IS 'buchung AX_Buchung_HistorischesFlurstueck|buchungsblattbezirk|AX_Buchungsblattbezirk_Schluessel|bezirk   1';
COMMENT ON COLUMN ax_historischesflurstueckalb.buchungsblattbezirk_land IS 'buchung AX_Buchung_HistorischesFlurstueck|buchungsblattbezirk|AX_Buchungsblattbezirk_Schluessel|land   1';
COMMENT ON COLUMN ax_historischesflurstueckalb.buchungsblattkennzeichen IS 'buchung AX_Buchung_HistorischesFlurstueck|buchungsblattkennzeichen   1';
COMMENT ON COLUMN ax_historischesflurstueckalb.buchungsblattnummermitbuchstabenerweiterung IS 'buchung AX_Buchung_HistorischesFlurstueck|buchungsblattnummerMitBuchstabenerweiterung   1';
COMMENT ON COLUMN ax_historischesflurstueckalb.laufendenummerderbuchungsstelle IS 'buchung AX_Buchung_HistorischesFlurstueck|laufendeNummerDerBuchungsstelle   1';
COMMENT ON COLUMN ax_historischesflurstueckalb.flurnummer IS 'flurnummer   Integer 0..1';
COMMENT ON COLUMN ax_historischesflurstueckalb.flurstuecksfolge IS 'flurstuecksfolge    0..1';
COMMENT ON COLUMN ax_historischesflurstueckalb.flurstueckskennzeichen IS 'flurstueckskennzeichen    1';
COMMENT ON COLUMN ax_historischesflurstueckalb.nenner IS 'flurstuecksnummer AX_Flurstuecksnummer|nenner   0..1';
COMMENT ON COLUMN ax_historischesflurstueckalb.zaehler IS 'flurstuecksnummer AX_Flurstuecksnummer|zaehler   1';
COMMENT ON COLUMN ax_historischesflurstueckalb.fortfuehrungsart IS 'fortfuehrungsart    0..1';
COMMENT ON COLUMN ax_historischesflurstueckalb.gemarkungsnummer IS 'gemarkung AX_Gemarkung_Schluessel|gemarkungsnummer   1';
COMMENT ON COLUMN ax_historischesflurstueckalb.gemarkung_land IS 'gemarkung AX_Gemarkung_Schluessel|land   1';
COMMENT ON COLUMN ax_historischesflurstueckalb.laufendenummerderfortfuehrung IS 'laufendeNummerDerFortfuehrung    0..1';
COMMENT ON COLUMN ax_historischesflurstueckalb.nachfolgerflurstueckskennzeichen IS 'nachfolgerFlurstueckskennzeichen    0..*';
COMMENT ON COLUMN ax_historischesflurstueckalb.objektkoordinaten IS 'objektkoordinaten   GM_Point 0..1';
COMMENT ON COLUMN ax_historischesflurstueckalb.vorgaengerflurstueckskennzeichen IS 'vorgaengerFlurstueckskennzeichen    0..*';
COMMENT ON COLUMN ax_historischesflurstueckalb.zeitpunktderentstehungdesbezugsflurstuecks IS 'zeitpunktDerEntstehungDesBezugsflurstuecks   Date 0..1';

CREATE TABLE IF NOT EXISTS ax_historischesflurstueckohneraumbezug (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	abweichenderrechtszustand boolean,
	amtlicheflaeche double precision NOT NULL,
	flurnummer integer,
	flurstuecksfolge character varying,
	flurstueckskennzeichen character varying NOT NULL,
	nenner text,
	zaehler text NOT NULL,
	gemarkungsnummer text NOT NULL,
	gemarkung_land text NOT NULL,
	gemeinde text,
	gemeindeteil text,
	kreis text,
	gemeindezugehoerigkeit_land text,
	regierungsbezirk text,
	nachfolgerflurstueckskennzeichen text[],
	objektkoordinaten geometry(POINT),
	rechtsbehelfsverfahren boolean,
	angabenzumabschnittbemerkung text[],
	angabenzumabschnittflurstueck text[],
	angabenzumabschnittnummeraktenzeichen text[],
	angabenzumabschnittstelle text[],
	flaechedesabschnitts double precision[],
	kennungschluessel text[],
	vorgaengerflurstueckskennzeichen text[],
	zeitpunktderentstehung date,
	zweifelhafterflurstuecksnachweis boolean,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	istgebucht text,
	inverszu_gehoertanteiligzu  text[],
	gehoertanteiligzu  text[],
	zeigtauf text[],
	weistauf text[],
CONSTRAINT ax_historischesflurstueckohneraumbezug_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_historischesflurstueckohneraumbezug IS 'FeatureType: "AX_HistorischesFlurstueckOhneRaumbezug"';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.abweichenderrechtszustand IS 'abweichenderRechtszustand   Boolean 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.amtlicheflaeche IS 'amtlicheFlaeche   Area 1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.flurnummer IS 'flurnummer   Integer 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.flurstuecksfolge IS 'flurstuecksfolge   CharacterString 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.flurstueckskennzeichen IS 'flurstueckskennzeichen   CharacterString 1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.nenner IS 'flurstuecksnummer AX_Flurstuecksnummer|nenner   0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.zaehler IS 'flurstuecksnummer AX_Flurstuecksnummer|zaehler   1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.gemarkungsnummer IS 'gemarkung AX_Gemarkung_Schluessel|gemarkungsnummer   1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.gemarkung_land IS 'gemarkung AX_Gemarkung_Schluessel|land   1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.gemeinde IS 'gemeindezugehoerigkeit AX_Gemeindekennzeichen|gemeinde   1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.gemeindeteil IS 'gemeindezugehoerigkeit AX_Gemeindekennzeichen|gemeindeteil   0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.kreis IS 'gemeindezugehoerigkeit AX_Gemeindekennzeichen|kreis   1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.gemeindezugehoerigkeit_land IS 'gemeindezugehoerigkeit AX_Gemeindekennzeichen|land   1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.regierungsbezirk IS 'gemeindezugehoerigkeit AX_Gemeindekennzeichen|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.nachfolgerflurstueckskennzeichen IS 'nachfolgerFlurstueckskennzeichen    0..*';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.objektkoordinaten IS 'objektkoordinaten   GM_Point 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.rechtsbehelfsverfahren IS 'rechtsbehelfsverfahren   Boolean 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.angabenzumabschnittbemerkung IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|angabenZumAbschnittBemerkung   0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.angabenzumabschnittflurstueck IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|angabenZumAbschnittFlurstueck   0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.angabenzumabschnittnummeraktenzeichen IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|angabenZumAbschnittNummerAktenzeichen   0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.angabenzumabschnittstelle IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|angabenZumAbschnittStelle   0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.flaechedesabschnitts IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|flaecheDesAbschnitts  Area 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.kennungschluessel IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|kennungSchluessel   0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.vorgaengerflurstueckskennzeichen IS 'vorgaengerFlurstueckskennzeichen    0..*';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.zeitpunktderentstehung IS 'zeitpunktDerEntstehung   Date 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.zweifelhafterflurstuecksnachweis IS 'zweifelhafterFlurstuecksnachweis   Boolean 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.istgebucht IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..1';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.inverszu_gehoertanteiligzu  IS 'Assoziation zu: FeatureType AX_HistorischesFlurstueckOhneRaumbezug (ax_historischesflurstueckohneraumbezug) 0..*';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.gehoertanteiligzu  IS 'Assoziation zu: FeatureType AX_HistorischesFlurstueckOhneRaumbezug (ax_historischesflurstueckohneraumbezug) 0..*';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.zeigtauf IS 'Assoziation zu: FeatureType AX_LagebezeichnungOhneHausnummer (ax_lagebezeichnungohnehausnummer) 0..*';
COMMENT ON COLUMN ax_historischesflurstueckohneraumbezug.weistauf IS 'Assoziation zu: FeatureType AX_LagebezeichnungMitHausnummer (ax_lagebezeichnungmithausnummer) 0..*';

CREATE TABLE IF NOT EXISTS ax_lagebezeichnungohnehausnummer (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	unverschluesselt text NOT NULL,
	gemeinde text NOT NULL,
	kreis text NOT NULL,
	lage text NOT NULL,
	land text NOT NULL,
	regierungsbezirk text,
	ortsteil text,
	zusatzzurlagebezeichnung text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	gehoertzu text[],
	beschreibt text[],
CONSTRAINT ax_lagebezeichnungohnehausnummer_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_lagebezeichnungohnehausnummer IS 'FeatureType: "AX_LagebezeichnungOhneHausnummer"';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.unverschluesselt IS 'lagebezeichnung AX_Lagebezeichnung|unverschluesselt   1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.gemeinde IS 'lagebezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|gemeinde   1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.kreis IS 'lagebezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|kreis   1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.lage IS 'lagebezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|lage   1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.land IS 'lagebezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|land   1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.regierungsbezirk IS 'lagebezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.ortsteil IS 'ortsteil    0..1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.zusatzzurlagebezeichnung IS 'zusatzZurLagebezeichnung    0..1';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.gehoertzu IS 'Assoziation zu: FeatureType AX_Flurstueck (ax_flurstueck) 0..*';
COMMENT ON COLUMN ax_lagebezeichnungohnehausnummer.beschreibt IS 'Assoziation zu: FeatureType AX_HistorischesFlurstueckOhneRaumbezug (ax_historischesflurstueckohneraumbezug) 0..*';

CREATE TABLE IF NOT EXISTS ax_lagebezeichnungmithausnummer (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	unverschluesselt text NOT NULL,
	gemeinde text NOT NULL,
	kreis text NOT NULL,
	lage text NOT NULL,
	land text NOT NULL,
	regierungsbezirk text,
	hausnummer text NOT NULL,
	ortsteil text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	weistzum text,
	gehoertzu text[],
	hat text[],
	beziehtsichauchauf text,
	beziehtsichauf text,
CONSTRAINT ax_lagebezeichnungmithausnummer_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_lagebezeichnungmithausnummer IS 'FeatureType: "AX_LagebezeichnungMitHausnummer"';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.unverschluesselt IS 'lagebezeichnung AX_Lagebezeichnung|unverschluesselt   1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.gemeinde IS 'lagebezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|gemeinde   1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.kreis IS 'lagebezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|kreis   1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.lage IS 'lagebezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|lage   1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.land IS 'lagebezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|land   1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.regierungsbezirk IS 'lagebezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.hausnummer IS 'hausnummer    1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.ortsteil IS 'ortsteil    0..1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.weistzum IS 'Assoziation zu: FeatureType AX_Turm (ax_turm) 0..1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.gehoertzu IS 'Assoziation zu: FeatureType AX_Flurstueck (ax_flurstueck) 0..*';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.hat IS 'Assoziation zu: FeatureType AX_HistorischesFlurstueckOhneRaumbezug (ax_historischesflurstueckohneraumbezug) 0..*';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.beziehtsichauchauf IS 'Assoziation zu: FeatureType AX_GeoreferenzierteGebaeudeadresse (ax_georeferenziertegebaeudeadresse) 0..1';
COMMENT ON COLUMN ax_lagebezeichnungmithausnummer.beziehtsichauf IS 'Assoziation zu: FeatureType AX_Gebaeude (ax_gebaeude) 0..1';

CREATE TABLE IF NOT EXISTS ax_lagebezeichnungmitpseudonummer (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	unverschluesselt text NOT NULL,
	gemeinde text NOT NULL,
	kreis text NOT NULL,
	lage text NOT NULL,
	land text NOT NULL,
	regierungsbezirk text,
	laufendenummer text,
	ortsteil text,
	pseudonummer text NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	gehoertzu text,
CONSTRAINT ax_lagebezeichnungmitpseudonummer_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_lagebezeichnungmitpseudonummer IS 'FeatureType: "AX_LagebezeichnungMitPseudonummer"';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.unverschluesselt IS 'lagebezeichnung AX_Lagebezeichnung|unverschluesselt   1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.gemeinde IS 'lagebezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|gemeinde   1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.kreis IS 'lagebezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|kreis   1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.lage IS 'lagebezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|lage   1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.land IS 'lagebezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|land   1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.regierungsbezirk IS 'lagebezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.laufendenummer IS 'laufendeNummer    0..1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.ortsteil IS 'ortsteil    0..1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.pseudonummer IS 'pseudonummer    1';
COMMENT ON COLUMN ax_lagebezeichnungmitpseudonummer.gehoertzu IS 'Assoziation zu: FeatureType AX_Gebaeude (ax_gebaeude) 0..1';

CREATE TABLE IF NOT EXISTS ax_reservierung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	ablaufderreservierung date,
	antragsnummer text,
	art integer NOT NULL,
	auftragsnummer text,
	bezirk text,
	buchungsblattbezirk_land text,
	gemarkung text,
	gemarkungsteilflur text,
	flur_land text,
	gemarkungsnummer text,
	gemarkung_land text,
	nummer text NOT NULL,
	nummerierungsbezirk text,
	vermessungsstelle_land text NOT NULL,
	stelle text NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_reservierung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_reservierung IS 'FeatureType: "AX_Reservierung"';
COMMENT ON COLUMN ax_reservierung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_reservierung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_reservierung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_reservierung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_reservierung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_reservierung.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_reservierung.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_reservierung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_reservierung.ablaufderreservierung IS 'ablaufDerReservierung   Date 0..1';
COMMENT ON COLUMN ax_reservierung.antragsnummer IS 'antragsnummer    0..1';
COMMENT ON COLUMN ax_reservierung.art IS 'art  enumeration AX_Art_Reservierung 1';
COMMENT ON COLUMN ax_reservierung.auftragsnummer IS 'auftragsnummer    0..1';
COMMENT ON COLUMN ax_reservierung.bezirk IS 'gebietskennung AX_Reservierungsauftrag_Gebietskennung|buchungsblattbezirk|AX_Buchungsblattbezirk_Schluessel|bezirk   1';
COMMENT ON COLUMN ax_reservierung.buchungsblattbezirk_land IS 'gebietskennung AX_Reservierungsauftrag_Gebietskennung|buchungsblattbezirk|AX_Buchungsblattbezirk_Schluessel|land   1';
COMMENT ON COLUMN ax_reservierung.gemarkung IS 'gebietskennung AX_Reservierungsauftrag_Gebietskennung|flur|AX_GemarkungsteilFlur_Schluessel|gemarkung   1';
COMMENT ON COLUMN ax_reservierung.gemarkungsteilflur IS 'gebietskennung AX_Reservierungsauftrag_Gebietskennung|flur|AX_GemarkungsteilFlur_Schluessel|gemarkungsteilFlur   1';
COMMENT ON COLUMN ax_reservierung.flur_land IS 'gebietskennung AX_Reservierungsauftrag_Gebietskennung|flur|AX_GemarkungsteilFlur_Schluessel|land   1';
COMMENT ON COLUMN ax_reservierung.gemarkungsnummer IS 'gebietskennung AX_Reservierungsauftrag_Gebietskennung|gemarkung|AX_Gemarkung_Schluessel|gemarkungsnummer   1';
COMMENT ON COLUMN ax_reservierung.gemarkung_land IS 'gebietskennung AX_Reservierungsauftrag_Gebietskennung|gemarkung|AX_Gemarkung_Schluessel|land   1';
COMMENT ON COLUMN ax_reservierung.nummer IS 'nummer    1';
COMMENT ON COLUMN ax_reservierung.nummerierungsbezirk IS 'nummerierungsbezirk    0..1';
COMMENT ON COLUMN ax_reservierung.vermessungsstelle_land IS 'vermessungsstelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_reservierung.stelle IS 'vermessungsstelle AX_Dienststelle_Schluessel|stelle   1';

CREATE TABLE IF NOT EXISTS ax_punktkennunguntergegangen (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	art integer,
	punktkennung text NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_punktkennunguntergegangen_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_punktkennunguntergegangen IS 'FeatureType: "AX_PunktkennungUntergegangen"';
COMMENT ON COLUMN ax_punktkennunguntergegangen.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_punktkennunguntergegangen.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_punktkennunguntergegangen.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_punktkennunguntergegangen.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_punktkennunguntergegangen.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_punktkennunguntergegangen.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_punktkennunguntergegangen.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_punktkennunguntergegangen.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_punktkennunguntergegangen.art IS 'art  enumeration AX_Art_Punktkennung 0..1';
COMMENT ON COLUMN ax_punktkennunguntergegangen.punktkennung IS 'punktkennung    1';

CREATE TABLE IF NOT EXISTS ax_punktkennungvergleichend (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	antragsnummer text NOT NULL,
	art integer,
	endgueltigepunktkennung text NOT NULL,
	vorlaeufigepunktkennung text NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_punktkennungvergleichend_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_punktkennungvergleichend IS 'FeatureType: "AX_PunktkennungVergleichend"';
COMMENT ON COLUMN ax_punktkennungvergleichend.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_punktkennungvergleichend.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_punktkennungvergleichend.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_punktkennungvergleichend.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_punktkennungvergleichend.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_punktkennungvergleichend.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_punktkennungvergleichend.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_punktkennungvergleichend.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_punktkennungvergleichend.antragsnummer IS 'antragsnummer    1';
COMMENT ON COLUMN ax_punktkennungvergleichend.art IS 'art  enumeration AX_Art_Punktkennung 0..1';
COMMENT ON COLUMN ax_punktkennungvergleichend.endgueltigepunktkennung IS 'endgueltigePunktkennung    1';
COMMENT ON COLUMN ax_punktkennungvergleichend.vorlaeufigepunktkennung IS 'vorlaeufigePunktkennung    1';

CREATE TABLE IF NOT EXISTS ax_fortfuehrungsnachweisdeckblatt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	fachdatenobjekt_uri character varying[],
	plzort text,
	strassehausnummer text,
	telefon text,
	artderausgabe text,
	datumderausgabe text,
	dienststelle text,
	dienststellenlogo_uri character varying,
	enthaeltewp_uri character varying,
	adressat text[],
	auszugfuer_art character varying[],
	datum date[],
	bekanntgabeanbeteiligteam date,
	bemerkung text,
	eignungspruefungam date,
	eignungspruefungvon text,
	erstelltam date,
	erstelltvon text,
	fnnummer_gemarkungsnummer text NOT NULL,
	fnnummer_land text NOT NULL,
	laufendenummer text NOT NULL,
	fortfuehrungsentscheidungam date,
	fortfuehrungsentscheidungvon text,
	fortfuehrungsfallnummernbereich text,
	fortfuehrungsmitteilungenerzeugt date,
	grundbuchmitteilungfuerfinanzamt text,
	ingemarkung_gemarkungsnummer text NOT NULL,
	ingemarkung_land text NOT NULL,
	titel text NOT NULL,
	verwaltungsaktjn text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	beziehtsichauf text[] NOT NULL,
CONSTRAINT ax_fortfuehrungsnachweisdeckblatt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_fortfuehrungsnachweisdeckblatt IS 'FeatureType: "AX_FortfuehrungsnachweisDeckblatt"';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.fachdatenobjekt_uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.plzort IS 'ausgabekopf AX_K_AUSGKOPF_Standard|anschriftDienststelle|AX_K_ANSCHRIFT|plzOrt   1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.strassehausnummer IS 'ausgabekopf AX_K_AUSGKOPF_Standard|anschriftDienststelle|AX_K_ANSCHRIFT|strasseHausnummer   1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.telefon IS 'ausgabekopf AX_K_AUSGKOPF_Standard|anschriftDienststelle|AX_K_ANSCHRIFT|telefon   0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.artderausgabe IS 'ausgabekopf AX_K_AUSGKOPF_Standard|artDerAusgabe   1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.datumderausgabe IS 'ausgabekopf AX_K_AUSGKOPF_Standard|datumDerAusgabe   1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.dienststelle IS 'ausgabekopf AX_K_AUSGKOPF_Standard|dienststelle   0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.dienststellenlogo_uri IS 'ausgabekopf AX_K_AUSGKOPF_Standard|dienststellenlogo|AX_Dienststellenlogo|uri  URI 1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.enthaeltewp_uri IS 'ausgabekopf AX_K_AUSGKOPF_Standard|enthaeltEWP|AX_Landeswappen|uri  URI 1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.adressat IS 'auszugFuer AX_Auszug|adressat   1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.auszugfuer_art IS 'auszugFuer AX_Auszug|art enumeration AX_Art_Adressat_Auszug 1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.datum IS 'auszugFuer AX_Auszug|datum  Date 1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.bekanntgabeanbeteiligteam IS 'bekanntgabeAnBeteiligteAm   Date 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.bemerkung IS 'bemerkung    0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.eignungspruefungam IS 'eignungspruefungAm   Date 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.eignungspruefungvon IS 'eignungspruefungVon    0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.erstelltam IS 'erstelltAm   Date 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.erstelltvon IS 'erstelltVon    0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.fnnummer_gemarkungsnummer IS 'fNNummer AX_Fortfuehrungsnummer|gemarkungsnummer   1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.fnnummer_land IS 'fNNummer AX_Fortfuehrungsnummer|land   1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.laufendenummer IS 'fNNummer AX_Fortfuehrungsnummer|laufendeNummer   1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.fortfuehrungsentscheidungam IS 'fortfuehrungsentscheidungAm   Date 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.fortfuehrungsentscheidungvon IS 'fortfuehrungsentscheidungVon    0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.fortfuehrungsfallnummernbereich IS 'fortfuehrungsfallNummernbereich    0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.fortfuehrungsmitteilungenerzeugt IS 'fortfuehrungsmitteilungenErzeugt   Date 0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.grundbuchmitteilungfuerfinanzamt IS 'grundbuchmitteilungFuerFinanzamt    0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.ingemarkung_gemarkungsnummer IS 'inGemarkung AX_Gemarkung_Schluessel|gemarkungsnummer   1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.ingemarkung_land IS 'inGemarkung AX_Gemarkung_Schluessel|land   1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.titel IS 'titel    1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.verwaltungsaktjn IS 'verwaltungsaktJN    0..1';
COMMENT ON COLUMN ax_fortfuehrungsnachweisdeckblatt.beziehtsichauf IS 'Assoziation zu: FeatureType AX_Fortfuehrungsfall (ax_fortfuehrungsfall) 1..*';

CREATE TABLE IF NOT EXISTS ax_fortfuehrungsfall (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	fachdatenobjekt_uri character varying[],
	anmerkungfuerdennotar text,
	anzahlderfortfuehrungsmitteilungen integer,
	bemerkung text,
	fortfuehrungsfallnummer integer NOT NULL,
	fortfuehrungsmitteilunganeigentuemerantragsteller text,
	laufendenummer text,
	ueberschriftimfortfuehrungsnachweis text[] NOT NULL,
	plzort text,
	strassehausnummer text,
	telefon text,
	artderausgabe text,
	datumderausgabe text,
	dienststelle text,
	dienststellenlogo_uri character varying,
	enthaeltewp_uri character varying,
	verweistauf_uri character varying,
	zeigtaufaltesflurstueck text[],
	zeigtaufneuesflurstueck text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_beziehtsichauf text,
CONSTRAINT ax_fortfuehrungsfall_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_fortfuehrungsfall IS 'FeatureType: "AX_Fortfuehrungsfall"';
COMMENT ON COLUMN ax_fortfuehrungsfall.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_fortfuehrungsfall.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_fortfuehrungsfall.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_fortfuehrungsfall.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_fortfuehrungsfall.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_fortfuehrungsfall.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_fortfuehrungsfall.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_fortfuehrungsfall.fachdatenobjekt_uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_fortfuehrungsfall.anmerkungfuerdennotar IS 'anmerkungFuerDenNotar    0..1';
COMMENT ON COLUMN ax_fortfuehrungsfall.anzahlderfortfuehrungsmitteilungen IS 'anzahlDerFortfuehrungsmitteilungen   Integer 0..1';
COMMENT ON COLUMN ax_fortfuehrungsfall.bemerkung IS 'bemerkung    0..1';
COMMENT ON COLUMN ax_fortfuehrungsfall.fortfuehrungsfallnummer IS 'fortfuehrungsfallnummer   Integer 1';
COMMENT ON COLUMN ax_fortfuehrungsfall.fortfuehrungsmitteilunganeigentuemerantragsteller IS 'fortfuehrungsmitteilungAnEigentuemerAntragsteller    0..1';
COMMENT ON COLUMN ax_fortfuehrungsfall.laufendenummer IS 'laufendeNummer    0..1';
COMMENT ON COLUMN ax_fortfuehrungsfall.ueberschriftimfortfuehrungsnachweis IS 'ueberschriftImFortfuehrungsnachweis  codelist AA_Anlassart 1..*';
COMMENT ON COLUMN ax_fortfuehrungsfall.plzort IS 'verweistAuf AX_FGraphik|ausgabekopf|AX_K_AUSGKOPF_Standard|anschriftDienststelle|AX_K_ANSCHRIFT|plzOrt   1';
COMMENT ON COLUMN ax_fortfuehrungsfall.strassehausnummer IS 'verweistAuf AX_FGraphik|ausgabekopf|AX_K_AUSGKOPF_Standard|anschriftDienststelle|AX_K_ANSCHRIFT|strasseHausnummer   1';
COMMENT ON COLUMN ax_fortfuehrungsfall.telefon IS 'verweistAuf AX_FGraphik|ausgabekopf|AX_K_AUSGKOPF_Standard|anschriftDienststelle|AX_K_ANSCHRIFT|telefon   0..1';
COMMENT ON COLUMN ax_fortfuehrungsfall.artderausgabe IS 'verweistAuf AX_FGraphik|ausgabekopf|AX_K_AUSGKOPF_Standard|artDerAusgabe   1';
COMMENT ON COLUMN ax_fortfuehrungsfall.datumderausgabe IS 'verweistAuf AX_FGraphik|ausgabekopf|AX_K_AUSGKOPF_Standard|datumDerAusgabe   1';
COMMENT ON COLUMN ax_fortfuehrungsfall.dienststelle IS 'verweistAuf AX_FGraphik|ausgabekopf|AX_K_AUSGKOPF_Standard|dienststelle   0..1';
COMMENT ON COLUMN ax_fortfuehrungsfall.dienststellenlogo_uri IS 'verweistAuf AX_FGraphik|ausgabekopf|AX_K_AUSGKOPF_Standard|dienststellenlogo|AX_Dienststellenlogo|uri  URI 1';
COMMENT ON COLUMN ax_fortfuehrungsfall.enthaeltewp_uri IS 'verweistAuf AX_FGraphik|ausgabekopf|AX_K_AUSGKOPF_Standard|enthaeltEWP|AX_Landeswappen|uri  URI 1';
COMMENT ON COLUMN ax_fortfuehrungsfall.verweistauf_uri IS 'verweistAuf AX_FGraphik|uri  URI 1';
COMMENT ON COLUMN ax_fortfuehrungsfall.zeigtaufaltesflurstueck IS 'zeigtAufAltesFlurstueck    0..*';
COMMENT ON COLUMN ax_fortfuehrungsfall.zeigtaufneuesflurstueck IS 'zeigtAufNeuesFlurstueck    0..*';
COMMENT ON COLUMN ax_fortfuehrungsfall.inverszu_beziehtsichauf IS 'Assoziation zu: FeatureType AX_FortfuehrungsnachweisDeckblatt (ax_fortfuehrungsnachweisdeckblatt) 0..1';

CREATE TABLE IF NOT EXISTS ax_gemeinde (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	administrativefunktion integer[],
	bezeichnung character varying NOT NULL,
	gemeinde text NOT NULL,
	gemeindeteil text,
	kreis text NOT NULL,
	gemeindekennzeichen_land text NOT NULL,
	regierungsbezirk text,
	istamtsbezirkvon_land text[],
	stelle text[],
	schluesselgesamt character varying NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_gemeinde_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gemeinde IS 'FeatureType: "AX_Gemeinde"';
COMMENT ON COLUMN ax_gemeinde.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gemeinde.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gemeinde.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gemeinde.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gemeinde.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gemeinde.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gemeinde.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gemeinde.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gemeinde.administrativefunktion IS 'administrativeFunktion  enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_gemeinde.bezeichnung IS 'bezeichnung   CharacterString 1';
COMMENT ON COLUMN ax_gemeinde.gemeinde IS 'gemeindekennzeichen AX_Gemeindekennzeichen|gemeinde   1';
COMMENT ON COLUMN ax_gemeinde.gemeindeteil IS 'gemeindekennzeichen AX_Gemeindekennzeichen|gemeindeteil   0..1';
COMMENT ON COLUMN ax_gemeinde.kreis IS 'gemeindekennzeichen AX_Gemeindekennzeichen|kreis   1';
COMMENT ON COLUMN ax_gemeinde.gemeindekennzeichen_land IS 'gemeindekennzeichen AX_Gemeindekennzeichen|land   1';
COMMENT ON COLUMN ax_gemeinde.regierungsbezirk IS 'gemeindekennzeichen AX_Gemeindekennzeichen|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_gemeinde.istamtsbezirkvon_land IS 'istAmtsbezirkVon AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_gemeinde.stelle IS 'istAmtsbezirkVon AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_gemeinde.schluesselgesamt IS 'schluesselGesamt   CharacterString 1';

CREATE TABLE IF NOT EXISTS ax_buchungsblattbezirk (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	administrativefunktion integer[],
	bezeichnung character varying NOT NULL,
	gehoertzu_land text,
	stelle text,
	bezirk text NOT NULL,
	schluessel_land text NOT NULL,
	schluesselgesamt character varying NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_buchungsblattbezirk_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_buchungsblattbezirk IS 'FeatureType: "AX_Buchungsblattbezirk"';
COMMENT ON COLUMN ax_buchungsblattbezirk.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_buchungsblattbezirk.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_buchungsblattbezirk.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_buchungsblattbezirk.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_buchungsblattbezirk.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_buchungsblattbezirk.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_buchungsblattbezirk.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_buchungsblattbezirk.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_buchungsblattbezirk.administrativefunktion IS 'administrativeFunktion  enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_buchungsblattbezirk.bezeichnung IS 'bezeichnung   CharacterString 1';
COMMENT ON COLUMN ax_buchungsblattbezirk.gehoertzu_land IS 'gehoertZu AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_buchungsblattbezirk.stelle IS 'gehoertZu AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_buchungsblattbezirk.bezirk IS 'schluessel AX_Buchungsblattbezirk_Schluessel|bezirk   1';
COMMENT ON COLUMN ax_buchungsblattbezirk.schluessel_land IS 'schluessel AX_Buchungsblattbezirk_Schluessel|land   1';
COMMENT ON COLUMN ax_buchungsblattbezirk.schluesselgesamt IS 'schluesselGesamt   CharacterString 1';

CREATE TABLE IF NOT EXISTS ax_gemarkungsteilflur (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	administrativefunktion integer[],
	bezeichnung character varying NOT NULL,
	gehoertzu_land text[],
	stelle text[],
	gemarkung text NOT NULL,
	gemarkungsteilflur text NOT NULL,
	schluessel_land text NOT NULL,
	schluesselgesamt character varying NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_gemarkungsteilflur_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gemarkungsteilflur IS 'FeatureType: "AX_GemarkungsteilFlur"';
COMMENT ON COLUMN ax_gemarkungsteilflur.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gemarkungsteilflur.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gemarkungsteilflur.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gemarkungsteilflur.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gemarkungsteilflur.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gemarkungsteilflur.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gemarkungsteilflur.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gemarkungsteilflur.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gemarkungsteilflur.administrativefunktion IS 'administrativeFunktion  enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_gemarkungsteilflur.bezeichnung IS 'bezeichnung   CharacterString 1';
COMMENT ON COLUMN ax_gemarkungsteilflur.gehoertzu_land IS 'gehoertZu AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_gemarkungsteilflur.stelle IS 'gehoertZu AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_gemarkungsteilflur.gemarkung IS 'schluessel AX_GemarkungsteilFlur_Schluessel|gemarkung   1';
COMMENT ON COLUMN ax_gemarkungsteilflur.gemarkungsteilflur IS 'schluessel AX_GemarkungsteilFlur_Schluessel|gemarkungsteilFlur   1';
COMMENT ON COLUMN ax_gemarkungsteilflur.schluessel_land IS 'schluessel AX_GemarkungsteilFlur_Schluessel|land   1';
COMMENT ON COLUMN ax_gemarkungsteilflur.schluesselgesamt IS 'schluesselGesamt   CharacterString 1';

CREATE TABLE IF NOT EXISTS ax_kreisregion (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	administrativefunktion integer[],
	bezeichnung character varying NOT NULL,
	istamtsbezirkvon_land text[],
	stelle text[],
	kreis text NOT NULL,
	schluessel_land text NOT NULL,
	regierungsbezirk text,
	schluesselgesamt character varying NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_kreisregion_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_kreisregion IS 'FeatureType: "AX_KreisRegion"';
COMMENT ON COLUMN ax_kreisregion.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_kreisregion.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_kreisregion.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_kreisregion.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_kreisregion.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_kreisregion.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_kreisregion.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_kreisregion.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_kreisregion.administrativefunktion IS 'administrativeFunktion  enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_kreisregion.bezeichnung IS 'bezeichnung   CharacterString 1';
COMMENT ON COLUMN ax_kreisregion.istamtsbezirkvon_land IS 'istAmtsbezirkVon AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_kreisregion.stelle IS 'istAmtsbezirkVon AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_kreisregion.kreis IS 'schluessel AX_Kreis_Schluessel|kreis   1';
COMMENT ON COLUMN ax_kreisregion.schluessel_land IS 'schluessel AX_Kreis_Schluessel|land   1';
COMMENT ON COLUMN ax_kreisregion.regierungsbezirk IS 'schluessel AX_Kreis_Schluessel|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_kreisregion.schluesselgesamt IS 'schluesselGesamt   CharacterString 1';

CREATE TABLE IF NOT EXISTS ax_bundesland (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	administrativefunktion integer[],
	bezeichnung character varying NOT NULL,
	istamtsbezirkvon_land text[],
	stelle text[],
	schluessel_land text NOT NULL,
	schluesselgesamt character varying NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_bundesland_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_bundesland IS 'FeatureType: "AX_Bundesland"';
COMMENT ON COLUMN ax_bundesland.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_bundesland.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_bundesland.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_bundesland.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_bundesland.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_bundesland.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_bundesland.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_bundesland.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_bundesland.administrativefunktion IS 'administrativeFunktion  enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_bundesland.bezeichnung IS 'bezeichnung   CharacterString 1';
COMMENT ON COLUMN ax_bundesland.istamtsbezirkvon_land IS 'istAmtsbezirkVon AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_bundesland.stelle IS 'istAmtsbezirkVon AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_bundesland.schluessel_land IS 'schluessel AX_Bundesland_Schluessel|land   1';
COMMENT ON COLUMN ax_bundesland.schluesselgesamt IS 'schluesselGesamt   CharacterString 1';

CREATE TABLE IF NOT EXISTS ax_regierungsbezirk (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	administrativefunktion integer[],
	bezeichnung character varying NOT NULL,
	land text NOT NULL,
	regierungsbezirk text NOT NULL,
	schluesselgesamt character varying NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_regierungsbezirk_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_regierungsbezirk IS 'FeatureType: "AX_Regierungsbezirk"';
COMMENT ON COLUMN ax_regierungsbezirk.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_regierungsbezirk.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_regierungsbezirk.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_regierungsbezirk.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_regierungsbezirk.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_regierungsbezirk.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_regierungsbezirk.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_regierungsbezirk.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_regierungsbezirk.administrativefunktion IS 'administrativeFunktion  enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_regierungsbezirk.bezeichnung IS 'bezeichnung   CharacterString 1';
COMMENT ON COLUMN ax_regierungsbezirk.land IS 'schluessel AX_Regierungsbezirk_Schluessel|land   1';
COMMENT ON COLUMN ax_regierungsbezirk.regierungsbezirk IS 'schluessel AX_Regierungsbezirk_Schluessel|regierungsbezirk   1';
COMMENT ON COLUMN ax_regierungsbezirk.schluesselgesamt IS 'schluesselGesamt   CharacterString 1';

CREATE TABLE IF NOT EXISTS ax_gemeindeteil (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	administrativefunktion integer[],
	bezeichnung character varying NOT NULL,
	gemeinde text NOT NULL,
	gemeindeteil text,
	kreis text NOT NULL,
	land text NOT NULL,
	regierungsbezirk text,
	schluesselgesamt character varying NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_gemeindeteil_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gemeindeteil IS 'FeatureType: "AX_Gemeindeteil"';
COMMENT ON COLUMN ax_gemeindeteil.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gemeindeteil.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gemeindeteil.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gemeindeteil.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gemeindeteil.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gemeindeteil.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gemeindeteil.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gemeindeteil.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gemeindeteil.administrativefunktion IS 'administrativeFunktion  enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_gemeindeteil.bezeichnung IS 'bezeichnung   CharacterString 1';
COMMENT ON COLUMN ax_gemeindeteil.gemeinde IS 'schluessel AX_Gemeindekennzeichen|gemeinde   1';
COMMENT ON COLUMN ax_gemeindeteil.gemeindeteil IS 'schluessel AX_Gemeindekennzeichen|gemeindeteil   0..1';
COMMENT ON COLUMN ax_gemeindeteil.kreis IS 'schluessel AX_Gemeindekennzeichen|kreis   1';
COMMENT ON COLUMN ax_gemeindeteil.land IS 'schluessel AX_Gemeindekennzeichen|land   1';
COMMENT ON COLUMN ax_gemeindeteil.regierungsbezirk IS 'schluessel AX_Gemeindekennzeichen|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_gemeindeteil.schluesselgesamt IS 'schluesselGesamt   CharacterString 1';

CREATE TABLE IF NOT EXISTS ax_lagebezeichnungkatalogeintrag (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	administrativefunktion integer[],
	bezeichnung character varying NOT NULL,
	kennung text,
	gemeinde text NOT NULL,
	kreis text NOT NULL,
	lage text NOT NULL,
	land text NOT NULL,
	regierungsbezirk text,
	schluesselgesamt character varying NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_lagebezeichnungkatalogeintrag_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_lagebezeichnungkatalogeintrag IS 'FeatureType: "AX_LagebezeichnungKatalogeintrag"';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.administrativefunktion IS 'administrativeFunktion  enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.bezeichnung IS 'bezeichnung   CharacterString 1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.kennung IS 'kennung    0..1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.gemeinde IS 'schluessel AX_VerschluesselteLagebezeichnung|gemeinde   1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.kreis IS 'schluessel AX_VerschluesselteLagebezeichnung|kreis   1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.lage IS 'schluessel AX_VerschluesselteLagebezeichnung|lage   1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.land IS 'schluessel AX_VerschluesselteLagebezeichnung|land   1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.regierungsbezirk IS 'schluessel AX_VerschluesselteLagebezeichnung|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_lagebezeichnungkatalogeintrag.schluesselgesamt IS 'schluesselGesamt   CharacterString 1';

CREATE TABLE IF NOT EXISTS ax_gemarkung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	administrativefunktion integer[],
	bezeichnung character varying NOT NULL,
	istamtsbezirkvon_land text[],
	stelle text[],
	gemarkungsnummer text NOT NULL,
	schluessel_land text NOT NULL,
	schluesselgesamt character varying NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_gemarkung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gemarkung IS 'FeatureType: "AX_Gemarkung"';
COMMENT ON COLUMN ax_gemarkung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gemarkung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gemarkung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gemarkung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gemarkung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gemarkung.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gemarkung.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gemarkung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gemarkung.administrativefunktion IS 'administrativeFunktion  enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_gemarkung.bezeichnung IS 'bezeichnung   CharacterString 1';
COMMENT ON COLUMN ax_gemarkung.istamtsbezirkvon_land IS 'istAmtsbezirkVon AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_gemarkung.stelle IS 'istAmtsbezirkVon AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_gemarkung.gemarkungsnummer IS 'schluessel AX_Gemarkung_Schluessel|gemarkungsnummer   1';
COMMENT ON COLUMN ax_gemarkung.schluessel_land IS 'schluessel AX_Gemarkung_Schluessel|land   1';
COMMENT ON COLUMN ax_gemarkung.schluesselgesamt IS 'schluesselGesamt   CharacterString 1';

CREATE TABLE IF NOT EXISTS ax_dienststelle (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	administrativefunktion integer[],
	bezeichnung character varying NOT NULL,
	kennung text,
	land text NOT NULL,
	stelle text NOT NULL,
	schluesselgesamt character varying NOT NULL,
	stellenart integer,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	hat text,
CONSTRAINT ax_dienststelle_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_dienststelle IS 'FeatureType: "AX_Dienststelle"';
COMMENT ON COLUMN ax_dienststelle.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_dienststelle.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_dienststelle.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_dienststelle.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_dienststelle.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_dienststelle.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_dienststelle.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_dienststelle.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_dienststelle.administrativefunktion IS 'administrativeFunktion  enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_dienststelle.bezeichnung IS 'bezeichnung   CharacterString 1';
COMMENT ON COLUMN ax_dienststelle.kennung IS 'kennung    0..1';
COMMENT ON COLUMN ax_dienststelle.land IS 'schluessel AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_dienststelle.stelle IS 'schluessel AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_dienststelle.schluesselgesamt IS 'schluesselGesamt   CharacterString 1';
COMMENT ON COLUMN ax_dienststelle.stellenart IS 'stellenart  enumeration AX_Behoerde 0..1';
COMMENT ON COLUMN ax_dienststelle.hat IS 'Assoziation zu: FeatureType AX_Anschrift (ax_anschrift) 0..1';

CREATE TABLE IF NOT EXISTS ax_verband (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	administrativefunktion integer[],
	art integer,
	bezeichnung character varying NOT NULL,
	gemeinde text[] NOT NULL,
	gemeindeteil text[],
	kreis text[] NOT NULL,
	land text[] NOT NULL,
	regierungsbezirk text[],
	schluesselgesamt character varying NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_verband_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_verband IS 'FeatureType: "AX_Verband"';
COMMENT ON COLUMN ax_verband.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_verband.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_verband.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_verband.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_verband.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_verband.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_verband.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_verband.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_verband.administrativefunktion IS 'administrativeFunktion  enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_verband.art IS 'art  enumeration AX_Art_Verband 0..1';
COMMENT ON COLUMN ax_verband.bezeichnung IS 'bezeichnung   CharacterString 1';
COMMENT ON COLUMN ax_verband.gemeinde IS 'enthaelt AX_Gemeindekennzeichen|gemeinde   1';
COMMENT ON COLUMN ax_verband.gemeindeteil IS 'enthaelt AX_Gemeindekennzeichen|gemeindeteil   0..1';
COMMENT ON COLUMN ax_verband.kreis IS 'enthaelt AX_Gemeindekennzeichen|kreis   1';
COMMENT ON COLUMN ax_verband.land IS 'enthaelt AX_Gemeindekennzeichen|land   1';
COMMENT ON COLUMN ax_verband.regierungsbezirk IS 'enthaelt AX_Gemeindekennzeichen|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_verband.schluesselgesamt IS 'schluesselGesamt   CharacterString 1';

CREATE TABLE IF NOT EXISTS ax_nationalstaat (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	administrativefunktion integer[],
	bezeichnung character varying NOT NULL,
	schluessel text NOT NULL,
	schluesselgesamt character varying NOT NULL,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_nationalstaat_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_nationalstaat IS 'FeatureType: "AX_Nationalstaat"';
COMMENT ON COLUMN ax_nationalstaat.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_nationalstaat.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_nationalstaat.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_nationalstaat.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_nationalstaat.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_nationalstaat.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_nationalstaat.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_nationalstaat.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_nationalstaat.administrativefunktion IS 'administrativeFunktion  enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_nationalstaat.bezeichnung IS 'bezeichnung   CharacterString 1';
COMMENT ON COLUMN ax_nationalstaat.schluessel IS 'schluessel    1';
COMMENT ON COLUMN ax_nationalstaat.schluesselgesamt IS 'schluesselGesamt   CharacterString 1';

CREATE TABLE IF NOT EXISTS ax_besondererbauwerkspunkt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	punktkennung text,
	sonstigeeigenschaft text[],
	land text,
	stelle text,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_besondererbauwerkspunkt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_besondererbauwerkspunkt IS 'FeatureType: "AX_BesondererBauwerkspunkt"';
COMMENT ON COLUMN ax_besondererbauwerkspunkt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_besondererbauwerkspunkt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_besondererbauwerkspunkt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_besondererbauwerkspunkt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_besondererbauwerkspunkt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_besondererbauwerkspunkt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_besondererbauwerkspunkt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_besondererbauwerkspunkt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_besondererbauwerkspunkt.punktkennung IS 'punktkennung    0..1';
COMMENT ON COLUMN ax_besondererbauwerkspunkt.sonstigeeigenschaft IS 'sonstigeEigenschaft    0..*';
COMMENT ON COLUMN ax_besondererbauwerkspunkt.land IS 'zustaendigeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_besondererbauwerkspunkt.stelle IS 'zustaendigeStelle AX_Dienststelle_Schluessel|stelle   1';

CREATE TABLE IF NOT EXISTS ax_netzknoten (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	bezeichnung text NOT NULL,
	herkunft text,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_netzknoten_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_netzknoten IS 'FeatureType: "AX_Netzknoten"';
COMMENT ON COLUMN ax_netzknoten.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_netzknoten.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_netzknoten.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_netzknoten.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_netzknoten.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_netzknoten.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_netzknoten.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_netzknoten.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_netzknoten.bezeichnung IS 'bezeichnung    1';
COMMENT ON COLUMN ax_netzknoten.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_netzknoten.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_referenzstationspunkt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	darstellungshinweis boolean,
	frueherepunktnummer text[],
	gemarkungsnummer text,
	gemarkung_land text,
	gemeinde text NOT NULL,
	gemeindeteil text,
	kreis text NOT NULL,
	gemeinde_land text NOT NULL,
	regierungsbezirk text,
	internebemerkungen text[],
	katasteramt_land text,
	stelle text,
	land_land text NOT NULL,
	namelagebeschreibung text,
	nutzerspezifischebemerkungen text[],
	punktkennung text NOT NULL,
	punktvermarkung integer NOT NULL,
	relativehoehe double precision,
	beginn timestamp without time zone,
	ende timestamp without time zone,
	funkfrequenz double precision,
	funktion integer,
	gnssantenne_abbaudatum text,
	antennenhoehe double precision NOT NULL,
	antennenreferenzpunkt text NOT NULL,
	gnssantenne_aufbaudatum text NOT NULL,
	azimutaleabweichung double precision NOT NULL,
	gnssantennenundradometyp text NOT NULL,
	hoehenoffsetl1 double precision NOT NULL,
	hoehenoffsetl2 double precision NOT NULL,
	gnssantenne_seriennummer text NOT NULL,
	gnssantenne_zusaetzlicheinformationen text,
	gnssempfaenger_abbaudatum text,
	gnssempfaenger_aufbaudatum text,
	firmwareversion text,
	gnssempfaengertyp text,
	gnssempfaenger_seriennummer text,
	gnssempfaenger_zusaetzlicheinformationen text,
	isdnnummer text,
	offsetl1_east double precision NOT NULL,
	offsetl1_height double precision NOT NULL,
	offsetl1_north double precision NOT NULL,
	offsetl2_east double precision NOT NULL,
	offsetl2_height double precision NOT NULL,
	offsetl2_north double precision NOT NULL,
	phasenzentrumsvariationl1_zeile character varying[],
	phasenzentrumsvariationl2_zeile character varying[],
	befund text,
	gnsstauglichkeit character varying,
	punktstabilitaet character varying,
	ueberwachungsdatum date,
	tcpipnummer text,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	istidentischmitlfp text,
	istidentischmithfp text,
	unterschiedlicherbezugspunktmitsfp text,
CONSTRAINT ax_referenzstationspunkt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_referenzstationspunkt IS 'FeatureType: "AX_Referenzstationspunkt"';
COMMENT ON COLUMN ax_referenzstationspunkt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_referenzstationspunkt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_referenzstationspunkt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_referenzstationspunkt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_referenzstationspunkt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_referenzstationspunkt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_referenzstationspunkt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_referenzstationspunkt.darstellungshinweis IS 'darstellungshinweis   Boolean 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.frueherepunktnummer IS 'frueherePunktnummer    0..*';
COMMENT ON COLUMN ax_referenzstationspunkt.gemarkungsnummer IS 'gemarkung AX_Gemarkung_Schluessel|gemarkungsnummer   1';
COMMENT ON COLUMN ax_referenzstationspunkt.gemarkung_land IS 'gemarkung AX_Gemarkung_Schluessel|land   1';
COMMENT ON COLUMN ax_referenzstationspunkt.gemeinde IS 'gemeinde AX_Gemeindekennzeichen|gemeinde   1';
COMMENT ON COLUMN ax_referenzstationspunkt.gemeindeteil IS 'gemeinde AX_Gemeindekennzeichen|gemeindeteil   0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.kreis IS 'gemeinde AX_Gemeindekennzeichen|kreis   1';
COMMENT ON COLUMN ax_referenzstationspunkt.gemeinde_land IS 'gemeinde AX_Gemeindekennzeichen|land   1';
COMMENT ON COLUMN ax_referenzstationspunkt.regierungsbezirk IS 'gemeinde AX_Gemeindekennzeichen|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.internebemerkungen IS 'interneBemerkungen    0..*';
COMMENT ON COLUMN ax_referenzstationspunkt.katasteramt_land IS 'katasteramt AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_referenzstationspunkt.stelle IS 'katasteramt AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_referenzstationspunkt.land_land IS 'land AX_Bundesland_Schluessel|land   1';
COMMENT ON COLUMN ax_referenzstationspunkt.namelagebeschreibung IS 'nameLagebeschreibung    0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.nutzerspezifischebemerkungen IS 'nutzerspezifischeBemerkungen    0..*';
COMMENT ON COLUMN ax_referenzstationspunkt.punktkennung IS 'punktkennung    1';
COMMENT ON COLUMN ax_referenzstationspunkt.punktvermarkung IS 'punktvermarkung  enumeration AX_Marke 1';
COMMENT ON COLUMN ax_referenzstationspunkt.relativehoehe IS 'relativeHoehe   Length 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.beginn IS 'beginn   DateTime 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.ende IS 'ende   DateTime 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.funkfrequenz IS 'funkfrequenz   Real 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.funktion IS 'funktion  enumeration AX_Funktion_Referenzstationspunkt 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.gnssantenne_abbaudatum IS 'gnssAntenne AX_GNSSAntenne|abbaudatum   0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.antennenhoehe IS 'gnssAntenne AX_GNSSAntenne|antennenhoehe  Distance 1';
COMMENT ON COLUMN ax_referenzstationspunkt.antennenreferenzpunkt IS 'gnssAntenne AX_GNSSAntenne|antennenreferenzpunkt   1';
COMMENT ON COLUMN ax_referenzstationspunkt.gnssantenne_aufbaudatum IS 'gnssAntenne AX_GNSSAntenne|aufbaudatum   1';
COMMENT ON COLUMN ax_referenzstationspunkt.azimutaleabweichung IS 'gnssAntenne AX_GNSSAntenne|azimutaleAbweichung  Angle 1';
COMMENT ON COLUMN ax_referenzstationspunkt.gnssantennenundradometyp IS 'gnssAntenne AX_GNSSAntenne|gnssAntennenUndRadomeTyp   1';
COMMENT ON COLUMN ax_referenzstationspunkt.hoehenoffsetl1 IS 'gnssAntenne AX_GNSSAntenne|hoehenoffsetL1  Distance 1';
COMMENT ON COLUMN ax_referenzstationspunkt.hoehenoffsetl2 IS 'gnssAntenne AX_GNSSAntenne|hoehenoffsetL2  Distance 1';
COMMENT ON COLUMN ax_referenzstationspunkt.gnssantenne_seriennummer IS 'gnssAntenne AX_GNSSAntenne|seriennummer   1';
COMMENT ON COLUMN ax_referenzstationspunkt.gnssantenne_zusaetzlicheinformationen IS 'gnssAntenne AX_GNSSAntenne|zusaetzlicheInformationen   0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.gnssempfaenger_abbaudatum IS 'gnssEmpfaenger AX_GNSSEmpfaenger|abbaudatum   0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.gnssempfaenger_aufbaudatum IS 'gnssEmpfaenger AX_GNSSEmpfaenger|aufbaudatum   0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.firmwareversion IS 'gnssEmpfaenger AX_GNSSEmpfaenger|firmwareversion   0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.gnssempfaengertyp IS 'gnssEmpfaenger AX_GNSSEmpfaenger|gnssEmpfaengertyp   0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.gnssempfaenger_seriennummer IS 'gnssEmpfaenger AX_GNSSEmpfaenger|seriennummer   0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.gnssempfaenger_zusaetzlicheinformationen IS 'gnssEmpfaenger AX_GNSSEmpfaenger|zusaetzlicheInformationen   0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.isdnnummer IS 'isdnNummer    0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.offsetl1_east IS 'offsetL1 AX_Offsetkomponenten_Referenzstationspunkt|east  Distance 1';
COMMENT ON COLUMN ax_referenzstationspunkt.offsetl1_height IS 'offsetL1 AX_Offsetkomponenten_Referenzstationspunkt|height  Distance 1';
COMMENT ON COLUMN ax_referenzstationspunkt.offsetl1_north IS 'offsetL1 AX_Offsetkomponenten_Referenzstationspunkt|north  Distance 1';
COMMENT ON COLUMN ax_referenzstationspunkt.offsetl2_east IS 'offsetL2 AX_Offsetkomponenten_Referenzstationspunkt|east  Distance 1';
COMMENT ON COLUMN ax_referenzstationspunkt.offsetl2_height IS 'offsetL2 AX_Offsetkomponenten_Referenzstationspunkt|height  Distance 1';
COMMENT ON COLUMN ax_referenzstationspunkt.offsetl2_north IS 'offsetL2 AX_Offsetkomponenten_Referenzstationspunkt|north  Distance 1';
COMMENT ON COLUMN ax_referenzstationspunkt.phasenzentrumsvariationl1_zeile IS 'phasenzentrumsvariationL1 AX_Phasenzentrumsvariation_Referenzstationspunkt|zeile  doubleList *';
COMMENT ON COLUMN ax_referenzstationspunkt.phasenzentrumsvariationl2_zeile IS 'phasenzentrumsvariationL2 AX_Phasenzentrumsvariation_Referenzstationspunkt|zeile  doubleList *';
COMMENT ON COLUMN ax_referenzstationspunkt.befund IS 'qualitaetsangaben AX_DQFestpunkt|befund   0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.gnsstauglichkeit IS 'qualitaetsangaben AX_DQFestpunkt|gnssTauglichkeit enumeration AX_GNSSTauglichkeit 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.punktstabilitaet IS 'qualitaetsangaben AX_DQFestpunkt|punktstabilitaet enumeration AX_Punktstabilitaet 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.ueberwachungsdatum IS 'qualitaetsangaben AX_DQFestpunkt|ueberwachungsdatum  Date 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.tcpipnummer IS 'tcpipNummer    0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.istidentischmitlfp IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.istidentischmithfp IS 'Assoziation zu: FeatureType AX_Hoehenfestpunkt (ax_hoehenfestpunkt) 0..1';
COMMENT ON COLUMN ax_referenzstationspunkt.unterschiedlicherbezugspunktmitsfp IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..1';

CREATE TABLE IF NOT EXISTS ax_lagefestpunkt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	darstellungshinweis boolean,
	frueherepunktnummer text[],
	gemarkungsnummer text,
	gemarkung_land text,
	gemeinde text NOT NULL,
	gemeindeteil text,
	kreis text NOT NULL,
	gemeinde_land text NOT NULL,
	regierungsbezirk text,
	internebemerkungen text[],
	katasteramt_land text,
	stelle text,
	land_land text NOT NULL,
	namelagebeschreibung text,
	nutzerspezifischebemerkungen text[],
	punktkennung text NOT NULL,
	punktvermarkung integer NOT NULL,
	relativehoehe double precision,
	funktion integer,
	hierarchiestufe3d character varying,
	ordnung character varying,
	wertigkeit character varying,
	abstand double precision,
	messung date,
	befund text,
	gnsstauglichkeit character varying,
	punktstabilitaet character varying,
	ueberwachungsdatum date,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
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
	istidentischmitsvp text,
CONSTRAINT ax_lagefestpunkt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_lagefestpunkt IS 'FeatureType: "AX_Lagefestpunkt"';
COMMENT ON COLUMN ax_lagefestpunkt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_lagefestpunkt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_lagefestpunkt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_lagefestpunkt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_lagefestpunkt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_lagefestpunkt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_lagefestpunkt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_lagefestpunkt.darstellungshinweis IS 'darstellungshinweis   Boolean 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.frueherepunktnummer IS 'frueherePunktnummer    0..*';
COMMENT ON COLUMN ax_lagefestpunkt.gemarkungsnummer IS 'gemarkung AX_Gemarkung_Schluessel|gemarkungsnummer   1';
COMMENT ON COLUMN ax_lagefestpunkt.gemarkung_land IS 'gemarkung AX_Gemarkung_Schluessel|land   1';
COMMENT ON COLUMN ax_lagefestpunkt.gemeinde IS 'gemeinde AX_Gemeindekennzeichen|gemeinde   1';
COMMENT ON COLUMN ax_lagefestpunkt.gemeindeteil IS 'gemeinde AX_Gemeindekennzeichen|gemeindeteil   0..1';
COMMENT ON COLUMN ax_lagefestpunkt.kreis IS 'gemeinde AX_Gemeindekennzeichen|kreis   1';
COMMENT ON COLUMN ax_lagefestpunkt.gemeinde_land IS 'gemeinde AX_Gemeindekennzeichen|land   1';
COMMENT ON COLUMN ax_lagefestpunkt.regierungsbezirk IS 'gemeinde AX_Gemeindekennzeichen|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_lagefestpunkt.internebemerkungen IS 'interneBemerkungen    0..*';
COMMENT ON COLUMN ax_lagefestpunkt.katasteramt_land IS 'katasteramt AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_lagefestpunkt.stelle IS 'katasteramt AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_lagefestpunkt.land_land IS 'land AX_Bundesland_Schluessel|land   1';
COMMENT ON COLUMN ax_lagefestpunkt.namelagebeschreibung IS 'nameLagebeschreibung    0..1';
COMMENT ON COLUMN ax_lagefestpunkt.nutzerspezifischebemerkungen IS 'nutzerspezifischeBemerkungen    0..*';
COMMENT ON COLUMN ax_lagefestpunkt.punktkennung IS 'punktkennung    1';
COMMENT ON COLUMN ax_lagefestpunkt.punktvermarkung IS 'punktvermarkung  enumeration AX_Marke 1';
COMMENT ON COLUMN ax_lagefestpunkt.relativehoehe IS 'relativeHoehe   Length 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.funktion IS 'funktion  enumeration AX_Funktion_Lagefestpunkt 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.hierarchiestufe3d IS 'klassifikation AX_Klassifikation_Lagefestpunkt|hierarchiestufe3D enumeration AX_Klassifikation_Hierarchiestufe3D_Lagefestpunkt 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.ordnung IS 'klassifikation AX_Klassifikation_Lagefestpunkt|ordnung enumeration AX_Klassifikation_Ordnung_Lagefestpunkt 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.wertigkeit IS 'klassifikation AX_Klassifikation_Lagefestpunkt|wertigkeit enumeration AX_Klassifikation_Wertigkeit_Lagefestpunkt 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.abstand IS 'pfeilerhoehe AX_Pfeilerhoehe_Lagefestpunkt|abstand  Distance 1';
COMMENT ON COLUMN ax_lagefestpunkt.messung IS 'pfeilerhoehe AX_Pfeilerhoehe_Lagefestpunkt|messung  Date 1';
COMMENT ON COLUMN ax_lagefestpunkt.befund IS 'qualitaetsangaben AX_DQFestpunkt|befund   0..1';
COMMENT ON COLUMN ax_lagefestpunkt.gnsstauglichkeit IS 'qualitaetsangaben AX_DQFestpunkt|gnssTauglichkeit enumeration AX_GNSSTauglichkeit 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.punktstabilitaet IS 'qualitaetsangaben AX_DQFestpunkt|punktstabilitaet enumeration AX_Punktstabilitaet 0..1';
COMMENT ON COLUMN ax_lagefestpunkt.ueberwachungsdatum IS 'qualitaetsangaben AX_DQFestpunkt|ueberwachungsdatum  Date 0..1';
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
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	darstellungshinweis boolean,
	frueherepunktnummer text[],
	gemarkungsnummer text,
	gemarkung_land text,
	gemeinde text NOT NULL,
	gemeindeteil text,
	kreis text NOT NULL,
	gemeinde_land text NOT NULL,
	regierungsbezirk text,
	internebemerkungen text[],
	katasteramt_land text,
	stelle text,
	land_land text NOT NULL,
	namelagebeschreibung text,
	nutzerspezifischebemerkungen text[],
	punktkennung text NOT NULL,
	punktvermarkung integer NOT NULL,
	relativehoehe double precision,
	nivlinie text[],
	ordnung integer,
	befund text,
	gnsstauglichkeit character varying,
	geologischestabilitaet character varying,
	grundwasserschwankung character varying,
	grundwasserstand character varying,
	guetedesbaugrundes character varying,
	guetedesvermarkungstraegers character varying,
	hoehenstabilitaetauswiederholungsmessungen character varying,
	topographieundumwelt character varying,
	vermutetehoehenstabilitaet character varying,
	ueberwachungsdatum date,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	istidentischmitrsp text,
	unterschiedlicherbezugspunktmitlfp text,
	istidentischmitlfp text,
	istidentischmitsfp text,
	unterschiedlicherbezugspunktmitsfp text,
	unterschiedlicherbezugspunktmitap text,
	unterschiedlicherbezugspunktmitsvp text,
	unterschiedlicherbezugspunktmitsp text,
CONSTRAINT ax_hoehenfestpunkt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_hoehenfestpunkt IS 'FeatureType: "AX_Hoehenfestpunkt"';
COMMENT ON COLUMN ax_hoehenfestpunkt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_hoehenfestpunkt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_hoehenfestpunkt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_hoehenfestpunkt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_hoehenfestpunkt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_hoehenfestpunkt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_hoehenfestpunkt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_hoehenfestpunkt.darstellungshinweis IS 'darstellungshinweis   Boolean 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.frueherepunktnummer IS 'frueherePunktnummer    0..*';
COMMENT ON COLUMN ax_hoehenfestpunkt.gemarkungsnummer IS 'gemarkung AX_Gemarkung_Schluessel|gemarkungsnummer   1';
COMMENT ON COLUMN ax_hoehenfestpunkt.gemarkung_land IS 'gemarkung AX_Gemarkung_Schluessel|land   1';
COMMENT ON COLUMN ax_hoehenfestpunkt.gemeinde IS 'gemeinde AX_Gemeindekennzeichen|gemeinde   1';
COMMENT ON COLUMN ax_hoehenfestpunkt.gemeindeteil IS 'gemeinde AX_Gemeindekennzeichen|gemeindeteil   0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.kreis IS 'gemeinde AX_Gemeindekennzeichen|kreis   1';
COMMENT ON COLUMN ax_hoehenfestpunkt.gemeinde_land IS 'gemeinde AX_Gemeindekennzeichen|land   1';
COMMENT ON COLUMN ax_hoehenfestpunkt.regierungsbezirk IS 'gemeinde AX_Gemeindekennzeichen|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.internebemerkungen IS 'interneBemerkungen    0..*';
COMMENT ON COLUMN ax_hoehenfestpunkt.katasteramt_land IS 'katasteramt AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_hoehenfestpunkt.stelle IS 'katasteramt AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_hoehenfestpunkt.land_land IS 'land AX_Bundesland_Schluessel|land   1';
COMMENT ON COLUMN ax_hoehenfestpunkt.namelagebeschreibung IS 'nameLagebeschreibung    0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.nutzerspezifischebemerkungen IS 'nutzerspezifischeBemerkungen    0..*';
COMMENT ON COLUMN ax_hoehenfestpunkt.punktkennung IS 'punktkennung    1';
COMMENT ON COLUMN ax_hoehenfestpunkt.punktvermarkung IS 'punktvermarkung  enumeration AX_Marke 1';
COMMENT ON COLUMN ax_hoehenfestpunkt.relativehoehe IS 'relativeHoehe   Length 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.nivlinie IS 'nivlinie    0..*';
COMMENT ON COLUMN ax_hoehenfestpunkt.ordnung IS 'ordnung  enumeration AX_Ordnung_Hoehenfestpunkt 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.befund IS 'qualitaetsangaben AX_DQHoehenfestpunkt|befund   0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.gnsstauglichkeit IS 'qualitaetsangaben AX_DQHoehenfestpunkt|gnssTauglichkeit enumeration AX_GNSSTauglichkeit 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.geologischestabilitaet IS 'qualitaetsangaben AX_DQHoehenfestpunkt|punktstabilitaet|AX_Punktstabilitaet_Hoehenfestpunkt|geologischeStabilitaet enumeration AX_Punktstabilitaet_Hoehenfestpunkt_GeologischeStabilitaet 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.grundwasserschwankung IS 'qualitaetsangaben AX_DQHoehenfestpunkt|punktstabilitaet|AX_Punktstabilitaet_Hoehenfestpunkt|grundwasserschwankung enumeration AX_Punktstabilitaet_Hoehenfestpunkt_Grundwasserschwankung 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.grundwasserstand IS 'qualitaetsangaben AX_DQHoehenfestpunkt|punktstabilitaet|AX_Punktstabilitaet_Hoehenfestpunkt|grundwasserstand enumeration AX_Punktstabilitaet_Hoehenfestpunkt_Grundwasserstand 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.guetedesbaugrundes IS 'qualitaetsangaben AX_DQHoehenfestpunkt|punktstabilitaet|AX_Punktstabilitaet_Hoehenfestpunkt|gueteDesBaugrundes enumeration AX_Punktstabilitaet_Hoehenfestpunkt_GueteDesBaugrundes 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.guetedesvermarkungstraegers IS 'qualitaetsangaben AX_DQHoehenfestpunkt|punktstabilitaet|AX_Punktstabilitaet_Hoehenfestpunkt|gueteDesVermarkungstraegers enumeration AX_Punktstabilitaet_Hoehenfestpunkt_GueteDesVermarkungstraegers 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.hoehenstabilitaetauswiederholungsmessungen IS 'qualitaetsangaben AX_DQHoehenfestpunkt|punktstabilitaet|AX_Punktstabilitaet_Hoehenfestpunkt|hoehenstabilitaetAusWiederholungsmessungen enumeration AX_Punktstabilitaet_Hoehenfestpunkt_HoehenstabilitaetAusWiederholungsmessungen 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.topographieundumwelt IS 'qualitaetsangaben AX_DQHoehenfestpunkt|punktstabilitaet|AX_Punktstabilitaet_Hoehenfestpunkt|topographieUndUmwelt enumeration AX_Punktstabilitaet_Hoehenfestpunkt_TopographieUndUmwelt 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.vermutetehoehenstabilitaet IS 'qualitaetsangaben AX_DQHoehenfestpunkt|punktstabilitaet|AX_Punktstabilitaet_Hoehenfestpunkt|vermuteteHoehenstabilitaet enumeration AX_Punktstabilitaet_Hoehenfestpunkt_VermuteteHoehenstabilitaet 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.ueberwachungsdatum IS 'qualitaetsangaben AX_DQHoehenfestpunkt|ueberwachungsdatum  Date 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.istidentischmitrsp IS 'Assoziation zu: FeatureType AX_Referenzstationspunkt (ax_referenzstationspunkt) 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.unterschiedlicherbezugspunktmitlfp IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.istidentischmitlfp IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.istidentischmitsfp IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.unterschiedlicherbezugspunktmitsfp IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.unterschiedlicherbezugspunktmitap IS 'Assoziation zu: FeatureType AX_Aufnahmepunkt (ax_aufnahmepunkt) 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.unterschiedlicherbezugspunktmitsvp IS 'Assoziation zu: FeatureType AX_SonstigerVermessungspunkt (ax_sonstigervermessungspunkt) 0..1';
COMMENT ON COLUMN ax_hoehenfestpunkt.unterschiedlicherbezugspunktmitsp IS 'Assoziation zu: FeatureType AX_Sicherungspunkt (ax_sicherungspunkt) 0..1';

CREATE TABLE IF NOT EXISTS ax_schwerefestpunkt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	darstellungshinweis boolean,
	frueherepunktnummer text[],
	gemarkungsnummer text,
	gemarkung_land text,
	gemeinde text NOT NULL,
	gemeindeteil text,
	kreis text NOT NULL,
	gemeinde_land text NOT NULL,
	regierungsbezirk text,
	internebemerkungen text[],
	katasteramt_land text,
	stelle text,
	land_land text NOT NULL,
	namelagebeschreibung text,
	nutzerspezifischebemerkungen text[],
	punktkennung text NOT NULL,
	punktvermarkung integer NOT NULL,
	relativehoehe double precision,
	funktion integer,
	ordnung integer,
	befund text,
	gnsstauglichkeit character varying,
	punktstabilitaet character varying,
	ueberwachungsdatum date,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
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
	istidentischmitsp text,
CONSTRAINT ax_schwerefestpunkt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_schwerefestpunkt IS 'FeatureType: "AX_Schwerefestpunkt"';
COMMENT ON COLUMN ax_schwerefestpunkt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_schwerefestpunkt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_schwerefestpunkt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_schwerefestpunkt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_schwerefestpunkt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_schwerefestpunkt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_schwerefestpunkt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_schwerefestpunkt.darstellungshinweis IS 'darstellungshinweis   Boolean 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.frueherepunktnummer IS 'frueherePunktnummer    0..*';
COMMENT ON COLUMN ax_schwerefestpunkt.gemarkungsnummer IS 'gemarkung AX_Gemarkung_Schluessel|gemarkungsnummer   1';
COMMENT ON COLUMN ax_schwerefestpunkt.gemarkung_land IS 'gemarkung AX_Gemarkung_Schluessel|land   1';
COMMENT ON COLUMN ax_schwerefestpunkt.gemeinde IS 'gemeinde AX_Gemeindekennzeichen|gemeinde   1';
COMMENT ON COLUMN ax_schwerefestpunkt.gemeindeteil IS 'gemeinde AX_Gemeindekennzeichen|gemeindeteil   0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.kreis IS 'gemeinde AX_Gemeindekennzeichen|kreis   1';
COMMENT ON COLUMN ax_schwerefestpunkt.gemeinde_land IS 'gemeinde AX_Gemeindekennzeichen|land   1';
COMMENT ON COLUMN ax_schwerefestpunkt.regierungsbezirk IS 'gemeinde AX_Gemeindekennzeichen|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.internebemerkungen IS 'interneBemerkungen    0..*';
COMMENT ON COLUMN ax_schwerefestpunkt.katasteramt_land IS 'katasteramt AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_schwerefestpunkt.stelle IS 'katasteramt AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_schwerefestpunkt.land_land IS 'land AX_Bundesland_Schluessel|land   1';
COMMENT ON COLUMN ax_schwerefestpunkt.namelagebeschreibung IS 'nameLagebeschreibung    0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.nutzerspezifischebemerkungen IS 'nutzerspezifischeBemerkungen    0..*';
COMMENT ON COLUMN ax_schwerefestpunkt.punktkennung IS 'punktkennung    1';
COMMENT ON COLUMN ax_schwerefestpunkt.punktvermarkung IS 'punktvermarkung  enumeration AX_Marke 1';
COMMENT ON COLUMN ax_schwerefestpunkt.relativehoehe IS 'relativeHoehe   Length 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.funktion IS 'funktion  enumeration AX_Funktion_Schwerefestpunkt 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.ordnung IS 'ordnung  enumeration AX_Ordnung_Schwerefestpunkt 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.befund IS 'qualitaetsangaben AX_DQFestpunkt|befund   0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.gnsstauglichkeit IS 'qualitaetsangaben AX_DQFestpunkt|gnssTauglichkeit enumeration AX_GNSSTauglichkeit 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.punktstabilitaet IS 'qualitaetsangaben AX_DQFestpunkt|punktstabilitaet enumeration AX_Punktstabilitaet 0..1';
COMMENT ON COLUMN ax_schwerefestpunkt.ueberwachungsdatum IS 'qualitaetsangaben AX_DQFestpunkt|ueberwachungsdatum  Date 0..1';
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
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	abmarkung_marke integer NOT NULL,
	ausgesetzteabmarkung_land text,
	ausgesetzteabmarkung_stelle text,
	bemerkungzurabmarkung integer,
	besonderepunktnummer text,
	festgestelltergrenzpunkt boolean,
	gruendederausgesetztenabmarkung integer,
	horizontfreiheit integer,
	punktkennung text,
	relativehoehe double precision,
	sonstigeeigenschaft text[],
	zeitpunktderentstehung text,
	zustaendigestelle_land text,
	zustaendigestelle_stelle text,
	zwischenmarke boolean,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	gehoertzulfp text[],
	inverszu_unterschiedlicherbezugspunktmitgrenzpunkt text[],
	beziehtsichaufsfp text[],
	inverszu_zeigtauf  text[],
	zeigtauf  text,
CONSTRAINT ax_grenzpunkt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_grenzpunkt IS 'FeatureType: "AX_Grenzpunkt"';
COMMENT ON COLUMN ax_grenzpunkt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_grenzpunkt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_grenzpunkt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_grenzpunkt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_grenzpunkt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_grenzpunkt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_grenzpunkt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_grenzpunkt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_grenzpunkt.abmarkung_marke IS 'abmarkung_Marke  enumeration AX_Marke 1';
COMMENT ON COLUMN ax_grenzpunkt.ausgesetzteabmarkung_land IS 'ausgesetzteAbmarkung AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_grenzpunkt.ausgesetzteabmarkung_stelle IS 'ausgesetzteAbmarkung AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_grenzpunkt.bemerkungzurabmarkung IS 'bemerkungZurAbmarkung  enumeration AX_BemerkungZurAbmarkung_Grenzpunkt 0..1';
COMMENT ON COLUMN ax_grenzpunkt.besonderepunktnummer IS 'besonderePunktnummer    0..1';
COMMENT ON COLUMN ax_grenzpunkt.festgestelltergrenzpunkt IS 'festgestellterGrenzpunkt   Boolean 0..1';
COMMENT ON COLUMN ax_grenzpunkt.gruendederausgesetztenabmarkung IS 'gruendeDerAusgesetztenAbmarkung  enumeration AX_GruendeDerAusgesetztenAbmarkung_Grenzpunkt 0..1';
COMMENT ON COLUMN ax_grenzpunkt.horizontfreiheit IS 'horizontfreiheit  enumeration AX_Horizontfreiheit_Grenzpunkt 0..1';
COMMENT ON COLUMN ax_grenzpunkt.punktkennung IS 'punktkennung    0..1';
COMMENT ON COLUMN ax_grenzpunkt.relativehoehe IS 'relativeHoehe   Length 0..1';
COMMENT ON COLUMN ax_grenzpunkt.sonstigeeigenschaft IS 'sonstigeEigenschaft    0..*';
COMMENT ON COLUMN ax_grenzpunkt.zeitpunktderentstehung IS 'zeitpunktDerEntstehung    0..1';
COMMENT ON COLUMN ax_grenzpunkt.zustaendigestelle_land IS 'zustaendigeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_grenzpunkt.zustaendigestelle_stelle IS 'zustaendigeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_grenzpunkt.zwischenmarke IS 'zwischenmarke   Boolean 0..1';
COMMENT ON COLUMN ax_grenzpunkt.gehoertzulfp IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..*';
COMMENT ON COLUMN ax_grenzpunkt.inverszu_unterschiedlicherbezugspunktmitgrenzpunkt IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..*';
COMMENT ON COLUMN ax_grenzpunkt.beziehtsichaufsfp IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..*';
COMMENT ON COLUMN ax_grenzpunkt.inverszu_zeigtauf  IS 'Assoziation zu: FeatureType AX_Grenzpunkt (ax_grenzpunkt) 0..*';
COMMENT ON COLUMN ax_grenzpunkt.zeigtauf  IS 'Assoziation zu: FeatureType AX_Grenzpunkt (ax_grenzpunkt) 0..1';

CREATE TABLE IF NOT EXISTS ax_aufnahmepunkt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	horizontfreiheit integer,
	punktkennung text,
	relativehoehe double precision,
	sonstigeeigenschaft text[],
	vermarkung_marke integer NOT NULL,
	land text,
	stelle text,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	gehoertzu text[],
	beziehtsichauf text[],
	haengtan text[],
	hatidentitaet text[],
	hat text[],
CONSTRAINT ax_aufnahmepunkt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_aufnahmepunkt IS 'FeatureType: "AX_Aufnahmepunkt"';
COMMENT ON COLUMN ax_aufnahmepunkt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_aufnahmepunkt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_aufnahmepunkt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_aufnahmepunkt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_aufnahmepunkt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_aufnahmepunkt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_aufnahmepunkt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_aufnahmepunkt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_aufnahmepunkt.horizontfreiheit IS 'horizontfreiheit  enumeration AX_Horizontfreiheit_Netzpunkt 0..1';
COMMENT ON COLUMN ax_aufnahmepunkt.punktkennung IS 'punktkennung    0..1';
COMMENT ON COLUMN ax_aufnahmepunkt.relativehoehe IS 'relativeHoehe   Length 0..1';
COMMENT ON COLUMN ax_aufnahmepunkt.sonstigeeigenschaft IS 'sonstigeEigenschaft    0..*';
COMMENT ON COLUMN ax_aufnahmepunkt.vermarkung_marke IS 'vermarkung_Marke  enumeration AX_Marke 1';
COMMENT ON COLUMN ax_aufnahmepunkt.land IS 'zustaendigeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_aufnahmepunkt.stelle IS 'zustaendigeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_aufnahmepunkt.gehoertzu IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..*';
COMMENT ON COLUMN ax_aufnahmepunkt.beziehtsichauf IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..*';
COMMENT ON COLUMN ax_aufnahmepunkt.haengtan IS 'Assoziation zu: FeatureType AX_Hoehenfestpunkt (ax_hoehenfestpunkt) 0..*';
COMMENT ON COLUMN ax_aufnahmepunkt.hatidentitaet IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..*';
COMMENT ON COLUMN ax_aufnahmepunkt.hat IS 'Assoziation zu: FeatureType AX_Sicherungspunkt (ax_sicherungspunkt) 0..*';

CREATE TABLE IF NOT EXISTS ax_sonstigervermessungspunkt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	horizontfreiheit integer,
	punktkennung text,
	relativehoehe double precision,
	sonstigeeigenschaft text[],
	vermarkung_marke integer NOT NULL,
	land text,
	stelle text,
	art text,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	beziehtsichauf text[],
	verbundenmit text[],
	inverszu_unterschiedlicherbezugspunktmitsvp text[],
	gehoertzu text[],
	hat text[],
CONSTRAINT ax_sonstigervermessungspunkt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_sonstigervermessungspunkt IS 'FeatureType: "AX_SonstigerVermessungspunkt"';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.horizontfreiheit IS 'horizontfreiheit  enumeration AX_Horizontfreiheit_Netzpunkt 0..1';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.punktkennung IS 'punktkennung    0..1';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.relativehoehe IS 'relativeHoehe   Length 0..1';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.sonstigeeigenschaft IS 'sonstigeEigenschaft    0..*';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.vermarkung_marke IS 'vermarkung_Marke  enumeration AX_Marke 1';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.land IS 'zustaendigeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.stelle IS 'zustaendigeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.art IS 'art    0..1';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.beziehtsichauf IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..*';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.verbundenmit IS 'Assoziation zu: FeatureType AX_Lagefestpunkt (ax_lagefestpunkt) 0..*';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.inverszu_unterschiedlicherbezugspunktmitsvp IS 'Assoziation zu: FeatureType AX_Hoehenfestpunkt (ax_hoehenfestpunkt) 0..*';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.gehoertzu IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..*';
COMMENT ON COLUMN ax_sonstigervermessungspunkt.hat IS 'Assoziation zu: FeatureType AX_Sicherungspunkt (ax_sicherungspunkt) 0..*';

CREATE TABLE IF NOT EXISTS ax_sicherungspunkt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	horizontfreiheit integer,
	punktkennung text,
	relativehoehe double precision,
	sonstigeeigenschaft text[],
	vermarkung_marke integer NOT NULL,
	land text,
	stelle text,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_unterschiedlicherbezugspunktmitsp text[],
	hat text[],
	gehoertzu text,
	beziehtsichauf text,
CONSTRAINT ax_sicherungspunkt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_sicherungspunkt IS 'FeatureType: "AX_Sicherungspunkt"';
COMMENT ON COLUMN ax_sicherungspunkt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_sicherungspunkt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_sicherungspunkt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_sicherungspunkt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_sicherungspunkt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_sicherungspunkt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_sicherungspunkt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_sicherungspunkt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_sicherungspunkt.horizontfreiheit IS 'horizontfreiheit  enumeration AX_Horizontfreiheit_Netzpunkt 0..1';
COMMENT ON COLUMN ax_sicherungspunkt.punktkennung IS 'punktkennung    0..1';
COMMENT ON COLUMN ax_sicherungspunkt.relativehoehe IS 'relativeHoehe   Length 0..1';
COMMENT ON COLUMN ax_sicherungspunkt.sonstigeeigenschaft IS 'sonstigeEigenschaft    0..*';
COMMENT ON COLUMN ax_sicherungspunkt.vermarkung_marke IS 'vermarkung_Marke  enumeration AX_Marke 1';
COMMENT ON COLUMN ax_sicherungspunkt.land IS 'zustaendigeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_sicherungspunkt.stelle IS 'zustaendigeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_sicherungspunkt.inverszu_unterschiedlicherbezugspunktmitsp IS 'Assoziation zu: FeatureType AX_Hoehenfestpunkt (ax_hoehenfestpunkt) 0..*';
COMMENT ON COLUMN ax_sicherungspunkt.hat IS 'Assoziation zu: FeatureType AX_Schwerefestpunkt (ax_schwerefestpunkt) 0..*';
COMMENT ON COLUMN ax_sicherungspunkt.gehoertzu IS 'Assoziation zu: FeatureType AX_Aufnahmepunkt (ax_aufnahmepunkt) 0..1';
COMMENT ON COLUMN ax_sicherungspunkt.beziehtsichauf IS 'Assoziation zu: FeatureType AX_SonstigerVermessungspunkt (ax_sonstigervermessungspunkt) 0..1';

CREATE TABLE IF NOT EXISTS ax_besonderergebaeudepunkt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	art integer,
	punktkennung text,
	sonstigeeigenschaft text[],
	land text,
	stelle text,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_besonderergebaeudepunkt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_besonderergebaeudepunkt IS 'FeatureType: "AX_BesondererGebaeudepunkt"';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.art IS 'art  enumeration AX_Art_Gebaeudepunkt 0..1';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.punktkennung IS 'punktkennung    0..1';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.sonstigeeigenschaft IS 'sonstigeEigenschaft    0..*';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.land IS 'zustaendigeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_besonderergebaeudepunkt.stelle IS 'zustaendigeStelle AX_Dienststelle_Schluessel|stelle   1';

CREATE TABLE IF NOT EXISTS ax_wirtschaftlicheeinheit (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_wirtschaftlicheeinheit_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_wirtschaftlicheeinheit IS 'FeatureType: "AX_WirtschaftlicheEinheit"';
COMMENT ON COLUMN ax_wirtschaftlicheeinheit.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_wirtschaftlicheeinheit.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_wirtschaftlicheeinheit.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_wirtschaftlicheeinheit.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_wirtschaftlicheeinheit.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_wirtschaftlicheeinheit.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_wirtschaftlicheeinheit.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_wirtschaftlicheeinheit.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';

CREATE TABLE IF NOT EXISTS ax_verwaltungsgemeinschaft (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	administrativefunktion integer[],
	bezeichnung character varying NOT NULL,
	bezeichnungart integer,
	kreis text NOT NULL,
	land text NOT NULL,
	regierungsbezirk text,
	verwaltungsgemeinschaft text NOT NULL,
	schluesselgesamt character varying NOT NULL,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_verwaltungsgemeinschaft_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_verwaltungsgemeinschaft IS 'FeatureType: "AX_Verwaltungsgemeinschaft"';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.administrativefunktion IS 'administrativeFunktion  enumeration AX_Administrative_Funktion 0..*';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.bezeichnung IS 'bezeichnung   CharacterString 1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.bezeichnungart IS 'bezeichnungArt  enumeration AX_Bezeichnung_Verwaltungsgemeinschaft 0..1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.kreis IS 'schluessel AX_Verwaltungsgemeinschaft_Schluessel|kreis   1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.land IS 'schluessel AX_Verwaltungsgemeinschaft_Schluessel|land   1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.regierungsbezirk IS 'schluessel AX_Verwaltungsgemeinschaft_Schluessel|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.verwaltungsgemeinschaft IS 'schluessel AX_Verwaltungsgemeinschaft_Schluessel|verwaltungsgemeinschaft   1';
COMMENT ON COLUMN ax_verwaltungsgemeinschaft.schluesselgesamt IS 'schluesselGesamt   CharacterString 1';

CREATE TABLE IF NOT EXISTS ax_schutzgebietnachnaturumweltoderbodenschutzrecht (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	artderfestlegung integer NOT NULL,
	land text,
	stelle text,
	name text,
	nummerdesschutzgebietes text,
	herkunft text,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_schutzgebietnachnaturumweltoderbodenschutzrecht_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_schutzgebietnachnaturumweltoderbodenschutzrecht IS 'FeatureType: "AX_SchutzgebietNachNaturUmweltOderBodenschutzrecht"';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.artderfestlegung IS 'artDerFestlegung  enumeration AX_ArtDerFestlegung_SchutzgebietNachNaturUmweltOderBodenschutzrecht 1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.land IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.stelle IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.name IS 'name    0..1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.nummerdesschutzgebietes IS 'nummerDesSchutzgebietes    0..1';
COMMENT ON COLUMN ax_schutzgebietnachnaturumweltoderbodenschutzrecht.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ax_schutzgebietnachwasserrecht (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	artderfestlegung integer NOT NULL,
	land text,
	stelle text,
	funktion integer,
	name text,
	nummerdesschutzgebietes text,
	herkunft text,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_schutzgebietnachwasserrecht_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_schutzgebietnachwasserrecht IS 'FeatureType: "AX_SchutzgebietNachWasserrecht"';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.artderfestlegung IS 'artDerFestlegung  enumeration AX_ArtDerFestlegung_SchutzgebietNachWasserrecht 1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.land IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.stelle IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.funktion IS 'funktion  enumeration AX_Funktion_SchutzgebietNachWasserrecht 0..1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.name IS 'name    0..1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.nummerdesschutzgebietes IS 'nummerDesSchutzgebietes    0..1';
COMMENT ON COLUMN ax_schutzgebietnachwasserrecht.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ax_boeschungkliff (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	name text,
	objekthoehe double precision,
	herkunft text,
	zustand integer,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_boeschungkliff_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_boeschungkliff IS 'FeatureType: "AX_BoeschungKliff"';
COMMENT ON COLUMN ax_boeschungkliff.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_boeschungkliff.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_boeschungkliff.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_boeschungkliff.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_boeschungkliff.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_boeschungkliff.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_boeschungkliff.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_boeschungkliff.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_boeschungkliff.name IS 'name    0..1';
COMMENT ON COLUMN ax_boeschungkliff.objekthoehe IS 'objekthoehe   Length 0..1';
COMMENT ON COLUMN ax_boeschungkliff.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_boeschungkliff.zustand IS 'zustand  enumeration AX_Zustand_BoeschungKliff 0..1';

CREATE TABLE IF NOT EXISTS ax_besonderertopographischerpunkt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	punktkennung text,
	sonstigeeigenschaft text[],
	land text,
	stelle text,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_besonderertopographischerpunkt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_besonderertopographischerpunkt IS 'FeatureType: "AX_BesondererTopographischerPunkt"';
COMMENT ON COLUMN ax_besonderertopographischerpunkt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_besonderertopographischerpunkt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_besonderertopographischerpunkt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_besonderertopographischerpunkt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_besonderertopographischerpunkt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_besonderertopographischerpunkt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_besonderertopographischerpunkt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_besonderertopographischerpunkt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_besonderertopographischerpunkt.punktkennung IS 'punktkennung    0..1';
COMMENT ON COLUMN ax_besonderertopographischerpunkt.sonstigeeigenschaft IS 'sonstigeEigenschaft    0..*';
COMMENT ON COLUMN ax_besonderertopographischerpunkt.land IS 'zustaendigeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_besonderertopographischerpunkt.stelle IS 'zustaendigeStelle AX_Dienststelle_Schluessel|stelle   1';

CREATE TABLE IF NOT EXISTS ax_kanal (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	gewaesserkennzahl text,
	identnummer text,
	name text,
	schifffahrtskategorie integer,
	widmung integer,
	zweitname text,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_kanal_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_kanal IS 'FeatureType: "AX_Kanal"';
COMMENT ON COLUMN ax_kanal.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_kanal.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_kanal.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_kanal.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_kanal.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_kanal.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_kanal.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_kanal.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_kanal.gewaesserkennzahl IS 'gewaesserkennzahl    0..1';
COMMENT ON COLUMN ax_kanal.identnummer IS 'identnummer    0..1';
COMMENT ON COLUMN ax_kanal.name IS 'name    0..1';
COMMENT ON COLUMN ax_kanal.schifffahrtskategorie IS 'schifffahrtskategorie  enumeration AX_Schifffahrtskategorie_Kanal 0..1';
COMMENT ON COLUMN ax_kanal.widmung IS 'widmung  enumeration AX_Widmung_Kanal 0..1';
COMMENT ON COLUMN ax_kanal.zweitname IS 'zweitname    0..1';

CREATE TABLE IF NOT EXISTS ax_wasserlauf (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	gewaesserkennzahl text,
	identnummer text,
	name text,
	schifffahrtskategorie integer,
	widmung integer,
	zweitname text,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_wasserlauf_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_wasserlauf IS 'FeatureType: "AX_Wasserlauf"';
COMMENT ON COLUMN ax_wasserlauf.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_wasserlauf.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_wasserlauf.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_wasserlauf.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_wasserlauf.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_wasserlauf.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_wasserlauf.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_wasserlauf.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_wasserlauf.gewaesserkennzahl IS 'gewaesserkennzahl    0..1';
COMMENT ON COLUMN ax_wasserlauf.identnummer IS 'identnummer    0..1';
COMMENT ON COLUMN ax_wasserlauf.name IS 'name    0..1';
COMMENT ON COLUMN ax_wasserlauf.schifffahrtskategorie IS 'schifffahrtskategorie  enumeration AX_Schifffahrtskategorie 0..1';
COMMENT ON COLUMN ax_wasserlauf.widmung IS 'widmung  enumeration AX_Widmung_Wasserlauf 0..1';
COMMENT ON COLUMN ax_wasserlauf.zweitname IS 'zweitname    0..1';

CREATE TABLE IF NOT EXISTS ax_strasse (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	bezeichnung text[],
	fahrbahntrennung integer,
	internationalebedeutung integer,
	name text,
	strassenschluessel text[],
	widmung integer NOT NULL,
	zweitname text,
	bestehtaus text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_strasse_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_strasse IS 'FeatureType: "AX_Strasse"';
COMMENT ON COLUMN ax_strasse.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_strasse.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_strasse.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_strasse.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_strasse.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_strasse.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_strasse.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_strasse.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_strasse.bezeichnung IS 'bezeichnung    0..*';
COMMENT ON COLUMN ax_strasse.fahrbahntrennung IS 'fahrbahntrennung  enumeration AX_Fahrbahntrennung_Strasse 0..1';
COMMENT ON COLUMN ax_strasse.internationalebedeutung IS 'internationaleBedeutung  enumeration AX_InternationaleBedeutung_Strasse 0..1';
COMMENT ON COLUMN ax_strasse.name IS 'name    0..1';
COMMENT ON COLUMN ax_strasse.strassenschluessel IS 'strassenschluessel    0..*';
COMMENT ON COLUMN ax_strasse.widmung IS 'widmung  enumeration AX_Widmung_Strasse 1';
COMMENT ON COLUMN ax_strasse.zweitname IS 'zweitname    0..1';

CREATE TABLE IF NOT EXISTS ap_fpo (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	art character varying,
	darstellungsprioritaet integer,
	signaturnummer character varying,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	dientzurdarstellungvon text[],
CONSTRAINT ap_fpo_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ap_fpo IS 'FeatureType: "AP_FPO"';
COMMENT ON COLUMN ap_fpo.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ap_fpo.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ap_fpo.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ap_fpo.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ap_fpo.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ap_fpo.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ap_fpo.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ap_fpo.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ap_fpo.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ap_fpo.art IS 'art   CharacterString 0..1';
COMMENT ON COLUMN ap_fpo.darstellungsprioritaet IS 'darstellungsprioritaet   Integer 0..1';
COMMENT ON COLUMN ap_fpo.signaturnummer IS 'signaturnummer   CharacterString 0..1';
COMMENT ON COLUMN ap_fpo.dientzurdarstellungvon IS 'Assoziation zu: FeatureType AA_Objekt (aa_objekt) 0..*';

CREATE TABLE IF NOT EXISTS aa_antragsgebiet (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gebiet text[],
CONSTRAINT aa_antragsgebiet_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE aa_antragsgebiet IS 'FeatureType: "AA_Antragsgebiet"';
COMMENT ON COLUMN aa_antragsgebiet.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN aa_antragsgebiet.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN aa_antragsgebiet.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN aa_antragsgebiet.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN aa_antragsgebiet.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN aa_antragsgebiet.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN aa_antragsgebiet.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN aa_antragsgebiet.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN aa_antragsgebiet.position IS 'position   GM_Object 1';
COMMENT ON COLUMN aa_antragsgebiet.inverszu_gebiet IS 'Assoziation zu: FeatureType AA_Antrag (aa_antrag) 0..*';

CREATE TABLE IF NOT EXISTS ax_polder (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	artdespolders integer,
	funktion character varying,
	name text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_polder_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_polder IS 'FeatureType: "AX_Polder"';
COMMENT ON COLUMN ax_polder.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_polder.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_polder.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_polder.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_polder.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_polder.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_polder.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_polder.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_polder.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_polder.artdespolders IS 'artDesPolders  enumeration AX_ArtDesPolders 0..1';
COMMENT ON COLUMN ax_polder.funktion IS 'funktion  enumeration AX_Funktion_Polder 0..1';
COMMENT ON COLUMN ax_polder.name IS 'name    0..1';
COMMENT ON COLUMN ax_polder.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_polder.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_historischesflurstueck (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	abweichenderrechtszustand boolean,
	amtlicheflaeche double precision NOT NULL,
	blattart character varying[],
	buchungsart text[],
	bezirk text[],
	buchungsblattbezirk_land text[],
	buchungsblattkennzeichen text[],
	buchungsblattnummermitbuchstabenerweiterung text[],
	laufendenummerderbuchungsstelle text[],
	flurnummer integer,
	flurstuecksfolge character varying,
	flurstueckskennzeichen character varying NOT NULL,
	nenner text,
	zaehler text NOT NULL,
	gemarkungsnummer text NOT NULL,
	gemarkung_land text NOT NULL,
	gemeinde text,
	gemeindeteil text,
	kreis text,
	gemeindezugehoerigkeit_land text,
	regierungsbezirk text,
	nachfolgerflurstueckskennzeichen text[],
	objektkoordinaten geometry(POINT),
	rechtsbehelfsverfahren boolean,
	angabenzumabschnittbemerkung text[],
	angabenzumabschnittflurstueck text[],
	angabenzumabschnittnummeraktenzeichen text[],
	angabenzumabschnittstelle text[],
	flaechedesabschnitts double precision[],
	kennungschluessel text[],
	zeitpunktderentstehung date,
	zeitpunktderhistorisierung date,
	zweifelhafterflurstuecksnachweis boolean,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_historischesflurstueck_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_historischesflurstueck IS 'FeatureType: "AX_HistorischesFlurstueck"';
COMMENT ON COLUMN ax_historischesflurstueck.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_historischesflurstueck.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_historischesflurstueck.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_historischesflurstueck.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_historischesflurstueck.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_historischesflurstueck.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_historischesflurstueck.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_historischesflurstueck.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_historischesflurstueck.abweichenderrechtszustand IS 'abweichenderRechtszustand   Boolean 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.amtlicheflaeche IS 'amtlicheFlaeche   Area 1';
COMMENT ON COLUMN ax_historischesflurstueck.blattart IS 'buchung AX_Buchung_HistorischesFlurstueck|blattart enumeration AX_Blattart_HistorischesFlurstueck 1';
COMMENT ON COLUMN ax_historischesflurstueck.buchungsart IS 'buchung AX_Buchung_HistorischesFlurstueck|buchungsart   1';
COMMENT ON COLUMN ax_historischesflurstueck.bezirk IS 'buchung AX_Buchung_HistorischesFlurstueck|buchungsblattbezirk|AX_Buchungsblattbezirk_Schluessel|bezirk   1';
COMMENT ON COLUMN ax_historischesflurstueck.buchungsblattbezirk_land IS 'buchung AX_Buchung_HistorischesFlurstueck|buchungsblattbezirk|AX_Buchungsblattbezirk_Schluessel|land   1';
COMMENT ON COLUMN ax_historischesflurstueck.buchungsblattkennzeichen IS 'buchung AX_Buchung_HistorischesFlurstueck|buchungsblattkennzeichen   1';
COMMENT ON COLUMN ax_historischesflurstueck.buchungsblattnummermitbuchstabenerweiterung IS 'buchung AX_Buchung_HistorischesFlurstueck|buchungsblattnummerMitBuchstabenerweiterung   1';
COMMENT ON COLUMN ax_historischesflurstueck.laufendenummerderbuchungsstelle IS 'buchung AX_Buchung_HistorischesFlurstueck|laufendeNummerDerBuchungsstelle   1';
COMMENT ON COLUMN ax_historischesflurstueck.flurnummer IS 'flurnummer   Integer 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.flurstuecksfolge IS 'flurstuecksfolge   CharacterString 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.flurstueckskennzeichen IS 'flurstueckskennzeichen   CharacterString 1';
COMMENT ON COLUMN ax_historischesflurstueck.nenner IS 'flurstuecksnummer AX_Flurstuecksnummer|nenner   0..1';
COMMENT ON COLUMN ax_historischesflurstueck.zaehler IS 'flurstuecksnummer AX_Flurstuecksnummer|zaehler   1';
COMMENT ON COLUMN ax_historischesflurstueck.gemarkungsnummer IS 'gemarkung AX_Gemarkung_Schluessel|gemarkungsnummer   1';
COMMENT ON COLUMN ax_historischesflurstueck.gemarkung_land IS 'gemarkung AX_Gemarkung_Schluessel|land   1';
COMMENT ON COLUMN ax_historischesflurstueck.gemeinde IS 'gemeindezugehoerigkeit AX_Gemeindekennzeichen|gemeinde   1';
COMMENT ON COLUMN ax_historischesflurstueck.gemeindeteil IS 'gemeindezugehoerigkeit AX_Gemeindekennzeichen|gemeindeteil   0..1';
COMMENT ON COLUMN ax_historischesflurstueck.kreis IS 'gemeindezugehoerigkeit AX_Gemeindekennzeichen|kreis   1';
COMMENT ON COLUMN ax_historischesflurstueck.gemeindezugehoerigkeit_land IS 'gemeindezugehoerigkeit AX_Gemeindekennzeichen|land   1';
COMMENT ON COLUMN ax_historischesflurstueck.regierungsbezirk IS 'gemeindezugehoerigkeit AX_Gemeindekennzeichen|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_historischesflurstueck.nachfolgerflurstueckskennzeichen IS 'nachfolgerFlurstueckskennzeichen    0..*';
COMMENT ON COLUMN ax_historischesflurstueck.objektkoordinaten IS 'objektkoordinaten   GM_Point 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.rechtsbehelfsverfahren IS 'rechtsbehelfsverfahren   Boolean 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.angabenzumabschnittbemerkung IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|angabenZumAbschnittBemerkung   0..1';
COMMENT ON COLUMN ax_historischesflurstueck.angabenzumabschnittflurstueck IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|angabenZumAbschnittFlurstueck   0..1';
COMMENT ON COLUMN ax_historischesflurstueck.angabenzumabschnittnummeraktenzeichen IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|angabenZumAbschnittNummerAktenzeichen   0..1';
COMMENT ON COLUMN ax_historischesflurstueck.angabenzumabschnittstelle IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|angabenZumAbschnittStelle   0..1';
COMMENT ON COLUMN ax_historischesflurstueck.flaechedesabschnitts IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|flaecheDesAbschnitts  Area 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.kennungschluessel IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|kennungSchluessel   0..1';
COMMENT ON COLUMN ax_historischesflurstueck.zeitpunktderentstehung IS 'zeitpunktDerEntstehung   Date 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.zeitpunktderhistorisierung IS 'zeitpunktDerHistorisierung   Date 0..1';
COMMENT ON COLUMN ax_historischesflurstueck.zweifelhafterflurstuecksnachweis IS 'zweifelhafterFlurstuecksnachweis   Boolean 0..1';

CREATE TABLE IF NOT EXISTS ax_kondominium (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_kondominium_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_kondominium IS 'FeatureType: "AX_Kondominium"';
COMMENT ON COLUMN ax_kondominium.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_kondominium.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_kondominium.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_kondominium.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_kondominium.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_kondominium.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_kondominium.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_kondominium.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_kondominium.position IS 'position   GM_Object 1';

CREATE TABLE IF NOT EXISTS ax_baublock (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	art integer,
	baublockbezeichnung text NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_baublock_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_baublock IS 'FeatureType: "AX_Baublock"';
COMMENT ON COLUMN ax_baublock.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_baublock.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_baublock.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_baublock.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_baublock.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_baublock.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_baublock.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_baublock.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_baublock.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_baublock.art IS 'art  enumeration AX_Art_Baublock 0..1';
COMMENT ON COLUMN ax_baublock.baublockbezeichnung IS 'baublockbezeichnung    1';

CREATE TABLE IF NOT EXISTS ax_aussparungsflaeche (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	artderaussparung integer NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_aussparungsflaeche_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_aussparungsflaeche IS 'FeatureType: "AX_Aussparungsflaeche"';
COMMENT ON COLUMN ax_aussparungsflaeche.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_aussparungsflaeche.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_aussparungsflaeche.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_aussparungsflaeche.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_aussparungsflaeche.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_aussparungsflaeche.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_aussparungsflaeche.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_aussparungsflaeche.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_aussparungsflaeche.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_aussparungsflaeche.artderaussparung IS 'artDerAussparung  enumeration AX_ArtDerAussparung 1';

CREATE TABLE IF NOT EXISTS ax_soll (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	name text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_soll_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_soll IS 'FeatureType: "AX_Soll"';
COMMENT ON COLUMN ax_soll.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_soll.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_soll.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_soll.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_soll.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_soll.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_soll.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_soll.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_soll.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_soll.name IS 'name    0..1';
COMMENT ON COLUMN ax_soll.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ax_duene (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	name text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_duene_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_duene IS 'FeatureType: "AX_Duene"';
COMMENT ON COLUMN ax_duene.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_duene.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_duene.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_duene.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_duene.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_duene.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_duene.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_duene.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_duene.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_duene.name IS 'name    0..1';
COMMENT ON COLUMN ax_duene.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ax_transportanlage (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	bauwerksfunktion integer NOT NULL,
	lagezurerdoberflaeche integer,
	produkt integer,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_transportanlage_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_transportanlage IS 'FeatureType: "AX_Transportanlage"';
COMMENT ON COLUMN ax_transportanlage.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_transportanlage.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_transportanlage.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_transportanlage.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_transportanlage.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_transportanlage.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_transportanlage.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_transportanlage.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_transportanlage.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_transportanlage.bauwerksfunktion IS 'bauwerksfunktion  enumeration AX_Bauwerksfunktion_Transportanlage 1';
COMMENT ON COLUMN ax_transportanlage.lagezurerdoberflaeche IS 'lageZurErdoberflaeche  enumeration AX_LageZurErdoberflaeche_Transportanlage 0..1';
COMMENT ON COLUMN ax_transportanlage.produkt IS 'produkt  enumeration AX_Produkt_Transportanlage 0..1';
COMMENT ON COLUMN ax_transportanlage.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_transportanlage.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_wegpfadsteig (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	art integer,
	befestigung integer,
	bezeichnung text,
	breitedesverkehrsweges integer,
	markierung integer,
	name text,
	herkunft text,
	strassenschluessel text,
	zweitname text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_wegpfadsteig_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_wegpfadsteig IS 'FeatureType: "AX_WegPfadSteig"';
COMMENT ON COLUMN ax_wegpfadsteig.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_wegpfadsteig.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_wegpfadsteig.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_wegpfadsteig.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_wegpfadsteig.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_wegpfadsteig.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_wegpfadsteig.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_wegpfadsteig.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_wegpfadsteig.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_wegpfadsteig.art IS 'art  enumeration AX_Art_WegPfadSteig 0..1';
COMMENT ON COLUMN ax_wegpfadsteig.befestigung IS 'befestigung  enumeration AX_Befestigung_WegPfadSteig 0..1';
COMMENT ON COLUMN ax_wegpfadsteig.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_wegpfadsteig.breitedesverkehrsweges IS 'breiteDesVerkehrsweges   Integer 0..1';
COMMENT ON COLUMN ax_wegpfadsteig.markierung IS 'markierung  enumeration AX_Markierung_WegPfadSteig 0..1';
COMMENT ON COLUMN ax_wegpfadsteig.name IS 'name    0..1';
COMMENT ON COLUMN ax_wegpfadsteig.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_wegpfadsteig.strassenschluessel IS 'strassenschluessel    0..1';
COMMENT ON COLUMN ax_wegpfadsteig.zweitname IS 'zweitname    0..1';
COMMENT ON COLUMN ax_wegpfadsteig.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_gleis (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	art integer,
	bahnkategorie integer[],
	lagezuroberflaeche integer,
	name text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_gleis_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gleis IS 'FeatureType: "AX_Gleis"';
COMMENT ON COLUMN ax_gleis.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gleis.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gleis.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gleis.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gleis.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gleis.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gleis.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gleis.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gleis.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_gleis.art IS 'art  enumeration AX_Art_Gleis 0..1';
COMMENT ON COLUMN ax_gleis.bahnkategorie IS 'bahnkategorie  enumeration AX_Bahnkategorie_Gleis 0..*';
COMMENT ON COLUMN ax_gleis.lagezuroberflaeche IS 'lageZurOberflaeche  enumeration AX_LageZurOberflaeche_Gleis 0..1';
COMMENT ON COLUMN ax_gleis.name IS 'name    0..1';
COMMENT ON COLUMN ax_gleis.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_gleis.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_bahnverkehrsanlage (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	bahnhofskategorie integer NOT NULL,
	bahnkategorie integer[],
	bezeichnung text,
	name text,
	herkunft text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_bahnverkehrsanlage_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_bahnverkehrsanlage IS 'FeatureType: "AX_Bahnverkehrsanlage"';
COMMENT ON COLUMN ax_bahnverkehrsanlage.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_bahnverkehrsanlage.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.bahnhofskategorie IS 'bahnhofskategorie  enumeration AX_Bahnhofskategorie_Bahnverkehrsanlage 1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.bahnkategorie IS 'bahnkategorie  enumeration AX_Bahnkategorie_Gleis 0..*';
COMMENT ON COLUMN ax_bahnverkehrsanlage.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.name IS 'name    0..1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.zustand IS 'zustand  enumeration AX_Zustand_Bahnverkehrsanlage 0..1';
COMMENT ON COLUMN ax_bahnverkehrsanlage.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_strassenverkehrsanlage (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	art integer NOT NULL,
	bezeichnung text[],
	name text,
	herkunft text,
	strassenschluessel text,
	zweitname text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_strassenverkehrsanlage_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_strassenverkehrsanlage IS 'FeatureType: "AX_Strassenverkehrsanlage"';
COMMENT ON COLUMN ax_strassenverkehrsanlage.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_strassenverkehrsanlage.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.art IS 'art  enumeration AX_Art_Strassenverkehrsanlage 1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.bezeichnung IS 'bezeichnung    0..*';
COMMENT ON COLUMN ax_strassenverkehrsanlage.name IS 'name    0..1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.strassenschluessel IS 'strassenschluessel    0..1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.zweitname IS 'zweitname    0..1';
COMMENT ON COLUMN ax_strassenverkehrsanlage.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_einrichtungenfuerdenschiffsverkehr (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	art integer NOT NULL,
	bezeichnung text,
	kilometerangabe double precision,
	name text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_einrichtungenfuerdenschiffsverkehr_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_einrichtungenfuerdenschiffsverkehr IS 'FeatureType: "AX_EinrichtungenFuerDenSchiffsverkehr"';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.art IS 'art  enumeration AX_Art_EinrichtungenFuerDenSchiffsverkehr 1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.kilometerangabe IS 'kilometerangabe   Distance 0..1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.name IS 'name    0..1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_einrichtungenfuerdenschiffsverkehr.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_flugverkehrsanlage (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	art integer NOT NULL,
	bezeichnung text,
	breitedesobjekts double precision,
	name text,
	oberflaechenmaterial integer,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_flugverkehrsanlage_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_flugverkehrsanlage IS 'FeatureType: "AX_Flugverkehrsanlage"';
COMMENT ON COLUMN ax_flugverkehrsanlage.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_flugverkehrsanlage.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_flugverkehrsanlage.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_flugverkehrsanlage.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_flugverkehrsanlage.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_flugverkehrsanlage.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_flugverkehrsanlage.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_flugverkehrsanlage.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_flugverkehrsanlage.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_flugverkehrsanlage.art IS 'art  enumeration AX_Art_Flugverkehrsanlage 1';
COMMENT ON COLUMN ax_flugverkehrsanlage.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_flugverkehrsanlage.breitedesobjekts IS 'breiteDesObjekts   Length 0..1';
COMMENT ON COLUMN ax_flugverkehrsanlage.name IS 'name    0..1';
COMMENT ON COLUMN ax_flugverkehrsanlage.oberflaechenmaterial IS 'oberflaechenmaterial  enumeration AX_Oberflaechenmaterial_Flugverkehrsanlage 0..1';
COMMENT ON COLUMN ax_flugverkehrsanlage.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_flugverkehrsanlage.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_hafen (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	hafenkategorie integer,
	name text,
	nutzung integer,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_hafen_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_hafen IS 'FeatureType: "AX_Hafen"';
COMMENT ON COLUMN ax_hafen.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_hafen.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_hafen.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_hafen.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_hafen.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_hafen.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_hafen.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_hafen.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_hafen.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_hafen.hafenkategorie IS 'hafenkategorie  enumeration AX_Hafenkategorie_Hafen 0..1';
COMMENT ON COLUMN ax_hafen.name IS 'name    0..1';
COMMENT ON COLUMN ax_hafen.nutzung IS 'nutzung  enumeration AX_Nutzung_Hafen 0..1';
COMMENT ON COLUMN ax_hafen.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_hafen.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_testgelaende (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	name text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_testgelaende_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_testgelaende IS 'FeatureType: "AX_Testgelaende"';
COMMENT ON COLUMN ax_testgelaende.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_testgelaende.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_testgelaende.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_testgelaende.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_testgelaende.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_testgelaende.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_testgelaende.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_testgelaende.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_testgelaende.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_testgelaende.name IS 'name    0..1';
COMMENT ON COLUMN ax_testgelaende.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_testgelaende.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_schleuse (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	bezeichnung text,
	konstruktionsmerkmalbauart integer,
	name text,
	herkunft text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_schleuse_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_schleuse IS 'FeatureType: "AX_Schleuse"';
COMMENT ON COLUMN ax_schleuse.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_schleuse.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_schleuse.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_schleuse.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_schleuse.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_schleuse.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_schleuse.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_schleuse.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_schleuse.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_schleuse.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_schleuse.konstruktionsmerkmalbauart IS 'konstruktionsmerkmalBauart  enumeration AX_KonstruktionsmerkmalBauart_Schleuse 0..1';
COMMENT ON COLUMN ax_schleuse.name IS 'name    0..1';
COMMENT ON COLUMN ax_schleuse.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_schleuse.zustand IS 'zustand  enumeration AX_Zustand_Schleuse 0..1';
COMMENT ON COLUMN ax_schleuse.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_ortslage (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	name text,
	herkunft text,
	zweitname text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_ortslage_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_ortslage IS 'FeatureType: "AX_Ortslage"';
COMMENT ON COLUMN ax_ortslage.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_ortslage.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_ortslage.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_ortslage.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_ortslage.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_ortslage.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_ortslage.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_ortslage.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_ortslage.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_ortslage.name IS 'name    0..1';
COMMENT ON COLUMN ax_ortslage.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_ortslage.zweitname IS 'zweitname    0..1';
COMMENT ON COLUMN ax_ortslage.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_grenzuebergang (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	name text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_grenzuebergang_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_grenzuebergang IS 'FeatureType: "AX_Grenzuebergang"';
COMMENT ON COLUMN ax_grenzuebergang.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_grenzuebergang.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_grenzuebergang.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_grenzuebergang.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_grenzuebergang.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_grenzuebergang.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_grenzuebergang.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_grenzuebergang.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_grenzuebergang.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_grenzuebergang.name IS 'name    0..1';
COMMENT ON COLUMN ax_grenzuebergang.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_grenzuebergang.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_gewaessermerkmal (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	art integer NOT NULL,
	bezeichnung text,
	hydrologischesmerkmal integer,
	name text,
	objekthoehe double precision,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_gewaessermerkmal_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gewaessermerkmal IS 'FeatureType: "AX_Gewaessermerkmal"';
COMMENT ON COLUMN ax_gewaessermerkmal.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gewaessermerkmal.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gewaessermerkmal.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gewaessermerkmal.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gewaessermerkmal.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gewaessermerkmal.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gewaessermerkmal.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gewaessermerkmal.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gewaessermerkmal.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_gewaessermerkmal.art IS 'art  enumeration AX_Art_Gewaessermerkmal 1';
COMMENT ON COLUMN ax_gewaessermerkmal.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_gewaessermerkmal.hydrologischesmerkmal IS 'hydrologischesMerkmal  enumeration AX_HydrologischesMerkmal_Gewaessermerkmal 0..1';
COMMENT ON COLUMN ax_gewaessermerkmal.name IS 'name    0..1';
COMMENT ON COLUMN ax_gewaessermerkmal.objekthoehe IS 'objekthoehe   Length 0..1';
COMMENT ON COLUMN ax_gewaessermerkmal.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_gewaessermerkmal.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_untergeordnetesgewaesser (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	funktion integer,
	hydrologischesmerkmal integer,
	lagezurerdoberflaeche integer,
	name text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_untergeordnetesgewaesser_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_untergeordnetesgewaesser IS 'FeatureType: "AX_UntergeordnetesGewaesser"';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.funktion IS 'funktion  enumeration AX_Funktion_UntergeordnetesGewaesser 0..1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.hydrologischesmerkmal IS 'hydrologischesMerkmal  enumeration AX_HydrologischesMerkmal_UntergeordnetesGewaesser 0..1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.lagezurerdoberflaeche IS 'lageZurErdoberflaeche  enumeration AX_LageZurErdoberflaeche_UntergeordnetesGewaesser 0..1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.name IS 'name    0..1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_untergeordnetesgewaesser.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_vegetationsmerkmal (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	bewuchs integer,
	bezeichnung text,
	breitedesobjekts double precision,
	funktion integer,
	name text,
	herkunft text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_vegetationsmerkmal_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_vegetationsmerkmal IS 'FeatureType: "AX_Vegetationsmerkmal"';
COMMENT ON COLUMN ax_vegetationsmerkmal.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_vegetationsmerkmal.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_vegetationsmerkmal.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_vegetationsmerkmal.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_vegetationsmerkmal.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_vegetationsmerkmal.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_vegetationsmerkmal.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_vegetationsmerkmal.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_vegetationsmerkmal.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_vegetationsmerkmal.bewuchs IS 'bewuchs  enumeration AX_Bewuchs_Vegetationsmerkmal 0..1';
COMMENT ON COLUMN ax_vegetationsmerkmal.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_vegetationsmerkmal.breitedesobjekts IS 'breiteDesObjekts   Length 0..1';
COMMENT ON COLUMN ax_vegetationsmerkmal.funktion IS 'funktion  enumeration AX_Funktion_Vegetationsmerkmal 0..1';
COMMENT ON COLUMN ax_vegetationsmerkmal.name IS 'name    0..1';
COMMENT ON COLUMN ax_vegetationsmerkmal.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_vegetationsmerkmal.zustand IS 'zustand  enumeration AX_Zustand_Vegetationsmerkmal 0..1';
COMMENT ON COLUMN ax_vegetationsmerkmal.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_musterlandesmusterundvergleichsstueck (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	ackerzahlodergruenlandzahl text,
	bodenart integer,
	bodenzahlodergruenlandgrundzahl text,
	entstehungsartoderklimastufewasserverhaeltnisse integer[],
	kulturart integer,
	merkmal integer NOT NULL,
	nummer text,
	herkunft text,
	sonstigeangaben integer[],
	zustandsstufeoderbodenstufe integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_musterlandesmusterundvergleichsstueck_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_musterlandesmusterundvergleichsstueck IS 'FeatureType: "AX_MusterLandesmusterUndVergleichsstueck"';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.ackerzahlodergruenlandzahl IS 'ackerzahlOderGruenlandzahl    0..1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.bodenart IS 'bodenart  enumeration AX_Bodenart_MusterLandesmusterUndVergleichsstueck 0..1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.bodenzahlodergruenlandgrundzahl IS 'bodenzahlOderGruenlandgrundzahl    0..1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.entstehungsartoderklimastufewasserverhaeltnisse IS 'entstehungsartOderKlimastufeWasserverhaeltnisse  enumeration AX_EntstehungsartOderKlimastufeWasserverhaeltnisse_MusterLandesmusterUndVergleichsstueck 0..*';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.kulturart IS 'kulturart  enumeration AX_Kulturart_MusterLandesmusterUndVergleichsstueck 0..1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.merkmal IS 'merkmal  enumeration AX_Merkmal_MusterLandesmusterUndVergleichsstueck 1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.nummer IS 'nummer    0..1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.sonstigeangaben IS 'sonstigeAngaben  enumeration AX_SonstigeAngaben_MusterLandesmusterUndVergleichsstueck 0..*';
COMMENT ON COLUMN ax_musterlandesmusterundvergleichsstueck.zustandsstufeoderbodenstufe IS 'zustandsstufeOderBodenstufe  enumeration AX_ZustandsstufeOderBodenstufe_MusterLandesmusterUndVergleichsstueck 0..1';

CREATE TABLE IF NOT EXISTS ax_insel (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	name text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_insel_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_insel IS 'FeatureType: "AX_Insel"';
COMMENT ON COLUMN ax_insel.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_insel.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_insel.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_insel.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_insel.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_insel.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_insel.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_insel.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_insel.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_insel.name IS 'name    0..1';

CREATE TABLE IF NOT EXISTS ax_gewann (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	name text NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_gewann_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gewann IS 'FeatureType: "AX_Gewann"';
COMMENT ON COLUMN ax_gewann.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gewann.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gewann.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gewann.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gewann.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gewann.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gewann.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gewann.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gewann.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_gewann.name IS 'name    1';

CREATE TABLE IF NOT EXISTS ax_kleinraeumigerlandschaftsteil (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	landschaftstyp integer NOT NULL,
	name text NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_kleinraeumigerlandschaftsteil_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_kleinraeumigerlandschaftsteil IS 'FeatureType: "AX_KleinraeumigerLandschaftsteil"';
COMMENT ON COLUMN ax_kleinraeumigerlandschaftsteil.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_kleinraeumigerlandschaftsteil.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_kleinraeumigerlandschaftsteil.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_kleinraeumigerlandschaftsteil.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_kleinraeumigerlandschaftsteil.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_kleinraeumigerlandschaftsteil.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_kleinraeumigerlandschaftsteil.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_kleinraeumigerlandschaftsteil.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_kleinraeumigerlandschaftsteil.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_kleinraeumigerlandschaftsteil.landschaftstyp IS 'landschaftstyp  enumeration AX_Landschaftstyp 1';
COMMENT ON COLUMN ax_kleinraeumigerlandschaftsteil.name IS 'name    1';

CREATE TABLE IF NOT EXISTS ax_landschaft (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	landschaftstyp integer NOT NULL,
	name text NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_landschaft_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_landschaft IS 'FeatureType: "AX_Landschaft"';
COMMENT ON COLUMN ax_landschaft.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_landschaft.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_landschaft.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_landschaft.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_landschaft.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_landschaft.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_landschaft.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_landschaft.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_landschaft.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_landschaft.landschaftstyp IS 'landschaftstyp  enumeration AX_Landschaftstyp 1';
COMMENT ON COLUMN ax_landschaft.name IS 'name    1';

CREATE TABLE IF NOT EXISTS ax_felsenfelsblockfelsnadel (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	bezeichnung text,
	name text,
	objekthoehe double precision,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_felsenfelsblockfelsnadel_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_felsenfelsblockfelsnadel IS 'FeatureType: "AX_FelsenFelsblockFelsnadel"';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.name IS 'name    0..1';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.objekthoehe IS 'objekthoehe   Length 0..1';
COMMENT ON COLUMN ax_felsenfelsblockfelsnadel.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ap_lto (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	position geometry(LINESTRING) NOT NULL,
	art character varying,
	darstellungsprioritaet integer,
	fontsperrung double precision NOT NULL,
	horizontaleausrichtung character varying NOT NULL,
	schriftinhalt character varying,
	signaturnummer character varying,
	skalierung double precision NOT NULL,
	vertikaleausrichtung character varying NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	dientzurdarstellungvon text[],
	hat text,
CONSTRAINT ap_lto_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ap_lto IS 'FeatureType: "AP_LTO"';
COMMENT ON COLUMN ap_lto.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ap_lto.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ap_lto.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ap_lto.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ap_lto.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ap_lto.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ap_lto.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ap_lto.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ap_lto.position IS 'position   GM_Curve 1';
COMMENT ON COLUMN ap_lto.art IS 'art   CharacterString 0..1';
COMMENT ON COLUMN ap_lto.darstellungsprioritaet IS 'darstellungsprioritaet   Integer 0..1';
COMMENT ON COLUMN ap_lto.fontsperrung IS 'fontSperrung   Real 1';
COMMENT ON COLUMN ap_lto.horizontaleausrichtung IS 'horizontaleAusrichtung  enumeration AP_HorizontaleAusrichtung 1';
COMMENT ON COLUMN ap_lto.schriftinhalt IS 'schriftinhalt   CharacterString 0..1';
COMMENT ON COLUMN ap_lto.signaturnummer IS 'signaturnummer   CharacterString 0..1';
COMMENT ON COLUMN ap_lto.skalierung IS 'skalierung   Real 1';
COMMENT ON COLUMN ap_lto.vertikaleausrichtung IS 'vertikaleAusrichtung  enumeration AP_VertikaleAusrichtung 1';
COMMENT ON COLUMN ap_lto.dientzurdarstellungvon IS 'Assoziation zu: FeatureType AA_Objekt (aa_objekt) 0..*';
COMMENT ON COLUMN ap_lto.hat IS 'Assoziation zu: FeatureType AP_LPO (ap_lpo) 0..1';

CREATE TABLE IF NOT EXISTS ax_leitung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(LINESTRING) NOT NULL,
	bauwerksfunktion integer NOT NULL,
	name text,
	herkunft text,
	spannungsebene integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_leitung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_leitung IS 'FeatureType: "AX_Leitung"';
COMMENT ON COLUMN ax_leitung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_leitung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_leitung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_leitung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_leitung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_leitung.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_leitung.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_leitung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_leitung.position IS 'position   GM_Curve 1';
COMMENT ON COLUMN ax_leitung.bauwerksfunktion IS 'bauwerksfunktion  enumeration AX_Bauwerksfunktion_Leitung 1';
COMMENT ON COLUMN ax_leitung.name IS 'name    0..1';
COMMENT ON COLUMN ax_leitung.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_leitung.spannungsebene IS 'spannungsebene   Integer 0..1';
COMMENT ON COLUMN ax_leitung.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_abschnitt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(LINESTRING) NOT NULL,
	bezeichnung text NOT NULL,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_abschnitt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_abschnitt IS 'FeatureType: "AX_Abschnitt"';
COMMENT ON COLUMN ax_abschnitt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_abschnitt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_abschnitt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_abschnitt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_abschnitt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_abschnitt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_abschnitt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_abschnitt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_abschnitt.position IS 'position   GM_Curve 1';
COMMENT ON COLUMN ax_abschnitt.bezeichnung IS 'bezeichnung    1';
COMMENT ON COLUMN ax_abschnitt.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_abschnitt.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_ast (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(LINESTRING) NOT NULL,
	bezeichnung text NOT NULL,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_ast_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_ast IS 'FeatureType: "AX_Ast"';
COMMENT ON COLUMN ax_ast.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_ast.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_ast.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_ast.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_ast.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_ast.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_ast.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_ast.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_ast.position IS 'position   GM_Curve 1';
COMMENT ON COLUMN ax_ast.bezeichnung IS 'bezeichnung    1';
COMMENT ON COLUMN ax_ast.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_ast.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ap_lpo (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	position geometry(MULTILINESTRING) NOT NULL,
	art character varying,
	darstellungsprioritaet integer,
	signaturnummer character varying,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	dientzurdarstellungvon text[],
	inverszu_hat_ap_lto text,
	inverszu_hat_ap_pto text,
CONSTRAINT ap_lpo_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ap_lpo IS 'FeatureType: "AP_LPO"';
COMMENT ON COLUMN ap_lpo.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ap_lpo.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ap_lpo.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ap_lpo.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ap_lpo.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ap_lpo.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ap_lpo.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ap_lpo.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ap_lpo.position IS 'position   GM_MultiCurve 1';
COMMENT ON COLUMN ap_lpo.art IS 'art   CharacterString 0..1';
COMMENT ON COLUMN ap_lpo.darstellungsprioritaet IS 'darstellungsprioritaet   Integer 0..1';
COMMENT ON COLUMN ap_lpo.signaturnummer IS 'signaturnummer   CharacterString 0..1';
COMMENT ON COLUMN ap_lpo.dientzurdarstellungvon IS 'Assoziation zu: FeatureType AA_Objekt (aa_objekt) 0..*';
COMMENT ON COLUMN ap_lpo.inverszu_hat_ap_lto IS 'Assoziation zu: FeatureType AP_LTO (ap_lto) 0..1';
COMMENT ON COLUMN ap_lpo.inverszu_hat_ap_pto IS 'Assoziation zu: FeatureType AP_PTO (ap_pto) 0..1';

CREATE TABLE IF NOT EXISTS ax_seilbahnschwebebahn (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(MULTILINESTRING) NOT NULL,
	bahnkategorie integer NOT NULL,
	name text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_seilbahnschwebebahn_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_seilbahnschwebebahn IS 'FeatureType: "AX_SeilbahnSchwebebahn"';
COMMENT ON COLUMN ax_seilbahnschwebebahn.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_seilbahnschwebebahn.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_seilbahnschwebebahn.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_seilbahnschwebebahn.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_seilbahnschwebebahn.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_seilbahnschwebebahn.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_seilbahnschwebebahn.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_seilbahnschwebebahn.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_seilbahnschwebebahn.position IS 'position   GM_MultiCurve 1';
COMMENT ON COLUMN ax_seilbahnschwebebahn.bahnkategorie IS 'bahnkategorie  enumeration AX_Bahnkategorie_SeilbahnSchwebebahn 1';
COMMENT ON COLUMN ax_seilbahnschwebebahn.name IS 'name    0..1';
COMMENT ON COLUMN ax_seilbahnschwebebahn.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_seilbahnschwebebahn.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_gebaeudeausgestaltung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(MULTILINESTRING) NOT NULL,
	darstellung integer NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	zeigtauf text NOT NULL,
CONSTRAINT ax_gebaeudeausgestaltung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gebaeudeausgestaltung IS 'FeatureType: "AX_Gebaeudeausgestaltung"';
COMMENT ON COLUMN ax_gebaeudeausgestaltung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gebaeudeausgestaltung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gebaeudeausgestaltung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gebaeudeausgestaltung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gebaeudeausgestaltung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gebaeudeausgestaltung.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gebaeudeausgestaltung.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gebaeudeausgestaltung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gebaeudeausgestaltung.position IS 'position   GM_MultiCurve 1';
COMMENT ON COLUMN ax_gebaeudeausgestaltung.darstellung IS 'darstellung  enumeration AX_Darstellung_Gebaeudeausgestaltung 1';
COMMENT ON COLUMN ax_gebaeudeausgestaltung.zeigtauf IS 'Assoziation zu: FeatureType AX_Gebaeude (ax_gebaeude) 1';

CREATE TABLE IF NOT EXISTS ax_topographischelinie (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(MULTILINESTRING) NOT NULL,
	liniendarstellung integer NOT NULL,
	sonstigeeigenschaft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_topographischelinie_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_topographischelinie IS 'FeatureType: "AX_TopographischeLinie"';
COMMENT ON COLUMN ax_topographischelinie.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_topographischelinie.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_topographischelinie.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_topographischelinie.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_topographischelinie.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_topographischelinie.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_topographischelinie.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_topographischelinie.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_topographischelinie.position IS 'position   GM_MultiCurve 1';
COMMENT ON COLUMN ax_topographischelinie.liniendarstellung IS 'liniendarstellung  enumeration AX_Liniendarstellung_TopographischeLinie 1';
COMMENT ON COLUMN ax_topographischelinie.sonstigeeigenschaft IS 'sonstigeEigenschaft    0..1';

CREATE TABLE IF NOT EXISTS ax_geripplinie (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(MULTILINESTRING) NOT NULL,
	artdergeripplinie integer,
	datetime timestamp without time zone,
	description character varying NOT NULL,
	identifikation character varying NOT NULL,
	hoehengenauigkeit text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_geripplinie_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_geripplinie IS 'FeatureType: "AX_Geripplinie"';
COMMENT ON COLUMN ax_geripplinie.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_geripplinie.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_geripplinie.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_geripplinie.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_geripplinie.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_geripplinie.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_geripplinie.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_geripplinie.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_geripplinie.position IS 'position   GM_MultiCurve 1';
COMMENT ON COLUMN ax_geripplinie.artdergeripplinie IS 'artDerGeripplinie  enumeration AX_ArtDerGeripplinie 0..1';
COMMENT ON COLUMN ax_geripplinie.datetime IS 'erfassung AX_Erfassung_DGM|dateTime  DateTime 0..1';
COMMENT ON COLUMN ax_geripplinie.description IS 'erfassung AX_Erfassung_DGM|description enumeration AX_DQErfassungsmethode 1';
COMMENT ON COLUMN ax_geripplinie.identifikation IS 'erfassung AX_Erfassung_DGM|identifikation enumeration AX_Identifikation 1';
COMMENT ON COLUMN ax_geripplinie.hoehengenauigkeit IS 'hoehengenauigkeit   DQ_AbsoluteExternalPositionalAccuracy 0..1';

CREATE TABLE IF NOT EXISTS ax_gewaesserbegrenzung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(MULTILINESTRING) NOT NULL,
	besondereartdergewaesserbegrenzung integer,
	datetime timestamp without time zone,
	description character varying NOT NULL,
	identifikation character varying NOT NULL,
	hoehengenauigkeit text,
	ursprung integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_gewaesserbegrenzung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gewaesserbegrenzung IS 'FeatureType: "AX_Gewaesserbegrenzung"';
COMMENT ON COLUMN ax_gewaesserbegrenzung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gewaesserbegrenzung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.position IS 'position   GM_MultiCurve 1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.besondereartdergewaesserbegrenzung IS 'besondereArtDerGewaesserbegrenzung  enumeration AX_BesondereArtDerGewaesserbegrenzung 0..1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.datetime IS 'erfassungGewaesserbegrenzung AX_ErfassungGewaesserbegrenzung|dateTime  DateTime 0..1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.description IS 'erfassungGewaesserbegrenzung AX_ErfassungGewaesserbegrenzung|description enumeration AX_DQErfassungsmethodeGewaesserbegrenzung 1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.identifikation IS 'erfassungGewaesserbegrenzung AX_ErfassungGewaesserbegrenzung|identifikation enumeration AX_Identifikation 1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.hoehengenauigkeit IS 'hoehengenauigkeit   DQ_AbsoluteExternalPositionalAccuracy 0..1';
COMMENT ON COLUMN ax_gewaesserbegrenzung.ursprung IS 'ursprung  enumeration AX_Ursprung 0..1';

CREATE TABLE IF NOT EXISTS ax_strukturierterfasstegelaendepunkte (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(MULTILINESTRING) NOT NULL,
	aktualisierungsdatum date,
	artderstrukturierung integer NOT NULL,
	datetime timestamp without time zone,
	description character varying NOT NULL,
	hoehengenauigkeit text,
	punktabstand double precision,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_strukturierterfasstegelaendepunkte_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_strukturierterfasstegelaendepunkte IS 'FeatureType: "AX_StrukturiertErfassteGelaendepunkte"';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.position IS 'position   GM_MultiCurve 1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.aktualisierungsdatum IS 'aktualisierungsdatum   Date 0..1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.artderstrukturierung IS 'artDerStrukturierung  enumeration AX_ArtDerStrukturierung 1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.datetime IS 'erfassungStrukturierteGelaendepunkte AX_ErfassungStrukturierteGelaendepunkte|dateTime  DateTime 0..1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.description IS 'erfassungStrukturierteGelaendepunkte AX_ErfassungStrukturierteGelaendepunkte|description enumeration AX_DQErfassungsmethodeStrukturierteGelaendepunkte 1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.hoehengenauigkeit IS 'hoehengenauigkeit   DQ_AbsoluteExternalPositionalAccuracy 0..1';
COMMENT ON COLUMN ax_strukturierterfasstegelaendepunkte.punktabstand IS 'punktabstand   Length 0..1';

CREATE TABLE IF NOT EXISTS ax_einschnitt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(MULTILINESTRING) NOT NULL,
	funktion integer,
	tiefevoneinschnitt double precision,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_einschnitt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_einschnitt IS 'FeatureType: "AX_Einschnitt"';
COMMENT ON COLUMN ax_einschnitt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_einschnitt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_einschnitt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_einschnitt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_einschnitt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_einschnitt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_einschnitt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_einschnitt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_einschnitt.position IS 'position   GM_MultiCurve 1';
COMMENT ON COLUMN ax_einschnitt.funktion IS 'funktion  enumeration AX_Funktion_Einschnitt 0..1';
COMMENT ON COLUMN ax_einschnitt.tiefevoneinschnitt IS 'tiefeVonEinschnitt   Length 0..1';

CREATE TABLE IF NOT EXISTS ax_hoehenlinie (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(MULTILINESTRING) NOT NULL,
	hoehevonhoehenlinie double precision NOT NULL,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_hoehenlinie_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_hoehenlinie IS 'FeatureType: "AX_Hoehenlinie"';
COMMENT ON COLUMN ax_hoehenlinie.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_hoehenlinie.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_hoehenlinie.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_hoehenlinie.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_hoehenlinie.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_hoehenlinie.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_hoehenlinie.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_hoehenlinie.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_hoehenlinie.position IS 'position   GM_MultiCurve 1';
COMMENT ON COLUMN ax_hoehenlinie.hoehevonhoehenlinie IS 'hoeheVonHoehenlinie   Length 1';
COMMENT ON COLUMN ax_hoehenlinie.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ax_abgeleitetehoehenlinie (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(MULTILINESTRING) NOT NULL,
	aktualitaetsstand date NOT NULL,
	berechnungsdatum date NOT NULL,
	berechnungsmethodehoehenlinie integer NOT NULL,
	hoehe double precision NOT NULL,
	verwendeteobjekte integer[],
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_abgeleitetehoehenlinie_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_abgeleitetehoehenlinie IS 'FeatureType: "AX_AbgeleiteteHoehenlinie"';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.position IS 'position   GM_MultiCurve 1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.aktualitaetsstand IS 'aktualitaetsstand   Date 1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.berechnungsdatum IS 'berechnungsdatum   Date 1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.berechnungsmethodehoehenlinie IS 'berechnungsmethodeHoehenlinie  enumeration AX_BerechnungsmethodeHoehenlinie 1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.hoehe IS 'hoehe   Length 1';
COMMENT ON COLUMN ax_abgeleitetehoehenlinie.verwendeteobjekte IS 'verwendeteObjekte  enumeration AX_VerwendeteObjekte 0..*';

CREATE TABLE IF NOT EXISTS ap_pto (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	position geometry(POINT) NOT NULL,
	art character varying,
	darstellungsprioritaet integer,
	drehwinkel double precision,
	fontsperrung double precision NOT NULL,
	horizontaleausrichtung character varying NOT NULL,
	schriftinhalt character varying,
	signaturnummer character varying,
	skalierung double precision NOT NULL,
	vertikaleausrichtung character varying NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	dientzurdarstellungvon text[],
	hat text,
CONSTRAINT ap_pto_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ap_pto IS 'FeatureType: "AP_PTO"';
COMMENT ON COLUMN ap_pto.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ap_pto.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ap_pto.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ap_pto.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ap_pto.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ap_pto.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ap_pto.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ap_pto.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ap_pto.position IS 'position   GM_Point 1';
COMMENT ON COLUMN ap_pto.art IS 'art   CharacterString 0..1';
COMMENT ON COLUMN ap_pto.darstellungsprioritaet IS 'darstellungsprioritaet   Integer 0..1';
COMMENT ON COLUMN ap_pto.drehwinkel IS 'drehwinkel   Angle 0..1';
COMMENT ON COLUMN ap_pto.fontsperrung IS 'fontSperrung   Real 1';
COMMENT ON COLUMN ap_pto.horizontaleausrichtung IS 'horizontaleAusrichtung  enumeration AP_HorizontaleAusrichtung 1';
COMMENT ON COLUMN ap_pto.schriftinhalt IS 'schriftinhalt   CharacterString 0..1';
COMMENT ON COLUMN ap_pto.signaturnummer IS 'signaturnummer   CharacterString 0..1';
COMMENT ON COLUMN ap_pto.skalierung IS 'skalierung   Real 1';
COMMENT ON COLUMN ap_pto.vertikaleausrichtung IS 'vertikaleAusrichtung  enumeration AP_VertikaleAusrichtung 1';
COMMENT ON COLUMN ap_pto.dientzurdarstellungvon IS 'Assoziation zu: FeatureType AA_Objekt (aa_objekt) 0..*';
COMMENT ON COLUMN ap_pto.hat IS 'Assoziation zu: FeatureType AP_LPO (ap_lpo) 0..1';

CREATE TABLE IF NOT EXISTS ax_heilquellegasquelle (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POINT) NOT NULL,
	art integer NOT NULL,
	hydrologischesmerkmal integer,
	name text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_heilquellegasquelle_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_heilquellegasquelle IS 'FeatureType: "AX_HeilquelleGasquelle"';
COMMENT ON COLUMN ax_heilquellegasquelle.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_heilquellegasquelle.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_heilquellegasquelle.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_heilquellegasquelle.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_heilquellegasquelle.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_heilquellegasquelle.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_heilquellegasquelle.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_heilquellegasquelle.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_heilquellegasquelle.position IS 'position   GM_Point 1';
COMMENT ON COLUMN ax_heilquellegasquelle.art IS 'art  enumeration AX_Art_HeilquelleGasquelle 1';
COMMENT ON COLUMN ax_heilquellegasquelle.hydrologischesmerkmal IS 'hydrologischesMerkmal  enumeration AX_HydrologischesMerkmal_HeilquelleGasquelle 0..1';
COMMENT ON COLUMN ax_heilquellegasquelle.name IS 'name    0..1';
COMMENT ON COLUMN ax_heilquellegasquelle.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_heilquellegasquelle.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_wasserspiegelhoehe (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POINT) NOT NULL,
	hoehedeswasserspiegels double precision NOT NULL,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_wasserspiegelhoehe_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_wasserspiegelhoehe IS 'FeatureType: "AX_Wasserspiegelhoehe"';
COMMENT ON COLUMN ax_wasserspiegelhoehe.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_wasserspiegelhoehe.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_wasserspiegelhoehe.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_wasserspiegelhoehe.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_wasserspiegelhoehe.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_wasserspiegelhoehe.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_wasserspiegelhoehe.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_wasserspiegelhoehe.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_wasserspiegelhoehe.position IS 'position   GM_Point 1';
COMMENT ON COLUMN ax_wasserspiegelhoehe.hoehedeswasserspiegels IS 'hoeheDesWasserspiegels   Length 1';
COMMENT ON COLUMN ax_wasserspiegelhoehe.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_wasserspiegelhoehe.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_nullpunkt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POINT) NOT NULL,
	artdesnullpunktes integer NOT NULL,
	bezeichnung text NOT NULL,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_nullpunkt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_nullpunkt IS 'FeatureType: "AX_Nullpunkt"';
COMMENT ON COLUMN ax_nullpunkt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_nullpunkt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_nullpunkt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_nullpunkt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_nullpunkt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_nullpunkt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_nullpunkt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_nullpunkt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_nullpunkt.position IS 'position   GM_Point 1';
COMMENT ON COLUMN ax_nullpunkt.artdesnullpunktes IS 'artDesNullpunktes  enumeration AX_ArtDesNullpunktes_Nullpunkt 1';
COMMENT ON COLUMN ax_nullpunkt.bezeichnung IS 'bezeichnung    1';
COMMENT ON COLUMN ax_nullpunkt.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_nullpunkt.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_punktortau (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POINT) NOT NULL,
	hinweise character varying,
	kartendarstellung boolean,
	koordinatenstatus integer,
	genauigkeitsstufe character varying,
	genauigkeitswert text,
	herkunft text,
	lagezuverlaessigkeit boolean,
	vertrauenswuerdigkeit character varying,
	ueberpruefungsdatum date,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_punktortau_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_punktortau IS 'FeatureType: "AX_PunktortAU"';
COMMENT ON COLUMN ax_punktortau.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_punktortau.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_punktortau.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_punktortau.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_punktortau.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_punktortau.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_punktortau.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_punktortau.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_punktortau.position IS 'position   GM_Point 1';
COMMENT ON COLUMN ax_punktortau.hinweise IS 'hinweise   CharacterString 0..1';
COMMENT ON COLUMN ax_punktortau.kartendarstellung IS 'kartendarstellung   Boolean 0..1';
COMMENT ON COLUMN ax_punktortau.koordinatenstatus IS 'koordinatenstatus  enumeration AX_Koordinatenstatus_Punktort 0..1';
COMMENT ON COLUMN ax_punktortau.genauigkeitsstufe IS 'qualitaetsangaben AX_DQPunktort|genauigkeitsstufe enumeration AX_Genauigkeitsstufe_Punktort 0..1';
COMMENT ON COLUMN ax_punktortau.genauigkeitswert IS 'qualitaetsangaben AX_DQPunktort|genauigkeitswert  DQ_RelativeInternalPositionalAccuracy 0..1';
COMMENT ON COLUMN ax_punktortau.herkunft IS 'qualitaetsangaben AX_DQPunktort|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_punktortau.lagezuverlaessigkeit IS 'qualitaetsangaben AX_DQPunktort|lagezuverlaessigkeit  Boolean 0..1';
COMMENT ON COLUMN ax_punktortau.vertrauenswuerdigkeit IS 'qualitaetsangaben AX_DQPunktort|vertrauenswuerdigkeit enumeration AX_Vertrauenswuerdigkeit_Punktort 0..1';
COMMENT ON COLUMN ax_punktortau.ueberpruefungsdatum IS 'ueberpruefungsdatum   Date 0..1';

CREATE TABLE IF NOT EXISTS ax_georeferenziertegebaeudeadresse (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POINT) NOT NULL,
	adressierungszusatz text,
	datensatznummer text,
	gemeinde text NOT NULL,
	hausnummer text NOT NULL,
	kreis text NOT NULL,
	land text NOT NULL,
	ortsteil text NOT NULL,
	ortsnamepost text,
	postleitzahl text,
	strassenname text,
	zusatzortsname text,
	qualitaetsangaben integer NOT NULL,
	regierungsbezirk text NOT NULL,
	strassenschluessel text NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	hatauch text NOT NULL,
CONSTRAINT ax_georeferenziertegebaeudeadresse_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_georeferenziertegebaeudeadresse IS 'FeatureType: "AX_GeoreferenzierteGebaeudeadresse"';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.position IS 'position   GM_Point 1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.adressierungszusatz IS 'adressierungszusatz    0..1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.datensatznummer IS 'datensatznummer    0..1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.gemeinde IS 'gemeinde    1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.hausnummer IS 'hausnummer    1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.kreis IS 'kreis    1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.land IS 'land    1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.ortsteil IS 'ortsteil    1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.ortsnamepost IS 'postalischeAdresse AX_Post|ortsnamePost   1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.postleitzahl IS 'postalischeAdresse AX_Post|postleitzahl   1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.strassenname IS 'postalischeAdresse AX_Post|strassenname   1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.zusatzortsname IS 'postalischeAdresse AX_Post|zusatzOrtsname   0..1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.qualitaetsangaben IS 'qualitaetsangaben  enumeration AX_Qualitaet_Hauskoordinate 1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.regierungsbezirk IS 'regierungsbezirk    1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.strassenschluessel IS 'strassenschluessel    1';
COMMENT ON COLUMN ax_georeferenziertegebaeudeadresse.hatauch IS 'Assoziation zu: FeatureType AX_LagebezeichnungMitHausnummer (ax_lagebezeichnungmithausnummer) 1';

CREATE TABLE IF NOT EXISTS ax_grablochderbodenschaetzung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POINT) NOT NULL,
	bedeutung integer[] NOT NULL,
	bodenzahlodergruenlandgrundzahl text,
	ingemarkung_gemarkungsnummer text,
	ingemarkung_land text,
	kennziffer_gemarkungsnummer text,
	kennziffer_land text,
	nummerdesgrablochs text NOT NULL,
	nummerierungsbezirk text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	gehoertzu text,
CONSTRAINT ax_grablochderbodenschaetzung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_grablochderbodenschaetzung IS 'FeatureType: "AX_GrablochDerBodenschaetzung"';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.position IS 'position   GM_Point 1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.bedeutung IS 'bedeutung  enumeration AX_Bedeutung_GrablochDerBodenschaetzung 1..*';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.bodenzahlodergruenlandgrundzahl IS 'bodenzahlOderGruenlandgrundzahl    0..1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.ingemarkung_gemarkungsnummer IS 'inGemarkung AX_Gemarkung_Schluessel|gemarkungsnummer   1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.ingemarkung_land IS 'inGemarkung AX_Gemarkung_Schluessel|land   1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.kennziffer_gemarkungsnummer IS 'kennziffer AX_KennzifferGrabloch|gemarkungsnummer   0..1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.kennziffer_land IS 'kennziffer AX_KennzifferGrabloch|land   0..1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.nummerdesgrablochs IS 'kennziffer AX_KennzifferGrabloch|nummerDesGrablochs   1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.nummerierungsbezirk IS 'kennziffer AX_KennzifferGrabloch|nummerierungsbezirk   0..1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_grablochderbodenschaetzung.gehoertzu IS 'Assoziation zu: FeatureType AX_Tagesabschnitt (ax_tagesabschnitt) 0..1';

CREATE TABLE IF NOT EXISTS ax_wohnplatz (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POINT) NOT NULL,
	bezeichnung text[],
	einwohnerzahl text,
	name text NOT NULL,
	zweitname text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_wohnplatz_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_wohnplatz IS 'FeatureType: "AX_Wohnplatz"';
COMMENT ON COLUMN ax_wohnplatz.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_wohnplatz.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_wohnplatz.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_wohnplatz.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_wohnplatz.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_wohnplatz.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_wohnplatz.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_wohnplatz.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_wohnplatz.position IS 'position   GM_Point 1';
COMMENT ON COLUMN ax_wohnplatz.bezeichnung IS 'bezeichnung    0..*';
COMMENT ON COLUMN ax_wohnplatz.einwohnerzahl IS 'einwohnerzahl    0..1';
COMMENT ON COLUMN ax_wohnplatz.name IS 'name    1';
COMMENT ON COLUMN ax_wohnplatz.zweitname IS 'zweitname    0..1';

CREATE TABLE IF NOT EXISTS ax_markantergelaendepunkt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POINT) NOT NULL,
	artdesmarkantenpunktes integer,
	datetime timestamp without time zone,
	description character varying NOT NULL,
	hoehengenauigkeit text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_markantergelaendepunkt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_markantergelaendepunkt IS 'FeatureType: "AX_MarkanterGelaendepunkt"';
COMMENT ON COLUMN ax_markantergelaendepunkt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_markantergelaendepunkt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_markantergelaendepunkt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_markantergelaendepunkt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_markantergelaendepunkt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_markantergelaendepunkt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_markantergelaendepunkt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_markantergelaendepunkt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_markantergelaendepunkt.position IS 'position   GM_Point 1';
COMMENT ON COLUMN ax_markantergelaendepunkt.artdesmarkantenpunktes IS 'artDesMarkantenPunktes  enumeration AX_ArtDesMarkantenGelaendepunktes 0..1';
COMMENT ON COLUMN ax_markantergelaendepunkt.datetime IS 'erfassungMarkanterGelaendepunkt AX_ErfassungMarkanterGelaendepunkt|dateTime  DateTime 0..1';
COMMENT ON COLUMN ax_markantergelaendepunkt.description IS 'erfassungMarkanterGelaendepunkt AX_ErfassungMarkanterGelaendepunkt|description enumeration AX_DQErfassungsmethodeMarkanterGelaendepunkt 1';
COMMENT ON COLUMN ax_markantergelaendepunkt.hoehengenauigkeit IS 'hoehengenauigkeit   DQ_AbsoluteExternalPositionalAccuracy 0..1';

CREATE TABLE IF NOT EXISTS ax_besondererhoehenpunkt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POINT) NOT NULL,
	besonderebedeutung integer NOT NULL,
	datetime timestamp without time zone,
	description character varying,
	hoehengenauigkeit text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_besondererhoehenpunkt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_besondererhoehenpunkt IS 'FeatureType: "AX_BesondererHoehenpunkt"';
COMMENT ON COLUMN ax_besondererhoehenpunkt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_besondererhoehenpunkt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_besondererhoehenpunkt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_besondererhoehenpunkt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_besondererhoehenpunkt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_besondererhoehenpunkt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_besondererhoehenpunkt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_besondererhoehenpunkt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_besondererhoehenpunkt.position IS 'position   GM_Point 1';
COMMENT ON COLUMN ax_besondererhoehenpunkt.besonderebedeutung IS 'besondereBedeutung  enumeration AX_BesondereBedeutung 1';
COMMENT ON COLUMN ax_besondererhoehenpunkt.datetime IS 'erfassungBesondererHoehenpunkt AX_Erfassung_DGMBesondererHoehenpunkt|dateTime  DateTime 0..1';
COMMENT ON COLUMN ax_besondererhoehenpunkt.description IS 'erfassungBesondererHoehenpunkt AX_Erfassung_DGMBesondererHoehenpunkt|description enumeration AX_DQErfassungsmethodeBesondererHoehenpunkt 1';
COMMENT ON COLUMN ax_besondererhoehenpunkt.hoehengenauigkeit IS 'hoehengenauigkeit   DQ_AbsoluteExternalPositionalAccuracy 0..1';

CREATE TABLE IF NOT EXISTS ax_hoehleneingang (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POINT) NOT NULL,
	name text,
	herkunft text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_hoehleneingang_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_hoehleneingang IS 'FeatureType: "AX_Hoehleneingang"';
COMMENT ON COLUMN ax_hoehleneingang.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_hoehleneingang.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_hoehleneingang.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_hoehleneingang.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_hoehleneingang.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_hoehleneingang.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_hoehleneingang.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_hoehleneingang.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_hoehleneingang.position IS 'position   GM_Point 1';
COMMENT ON COLUMN ax_hoehleneingang.name IS 'name    0..1';
COMMENT ON COLUMN ax_hoehleneingang.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_hoehleneingang.zustand IS 'zustand  enumeration AX_Zustand_Hoehleneingang 0..1';

CREATE TABLE IF NOT EXISTS ap_ppo (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	position geometry(MULTIPOINT) NOT NULL,
	art character varying,
	darstellungsprioritaet integer,
	drehwinkel double precision,
	signaturnummer character varying,
	skalierung double precision,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	dientzurdarstellungvon text[],
CONSTRAINT ap_ppo_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ap_ppo IS 'FeatureType: "AP_PPO"';
COMMENT ON COLUMN ap_ppo.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ap_ppo.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ap_ppo.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ap_ppo.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ap_ppo.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ap_ppo.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ap_ppo.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ap_ppo.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ap_ppo.position IS 'position   GM_MultiPoint 1';
COMMENT ON COLUMN ap_ppo.art IS 'art   CharacterString 0..1';
COMMENT ON COLUMN ap_ppo.darstellungsprioritaet IS 'darstellungsprioritaet   Integer 0..1';
COMMENT ON COLUMN ap_ppo.drehwinkel IS 'drehwinkel   Angle 0..1';
COMMENT ON COLUMN ap_ppo.signaturnummer IS 'signaturnummer   CharacterString 0..1';
COMMENT ON COLUMN ap_ppo.skalierung IS 'skalierung   Real 0..1';
COMMENT ON COLUMN ap_ppo.dientzurdarstellungvon IS 'Assoziation zu: FeatureType AA_Objekt (aa_objekt) 0..*';

CREATE TABLE IF NOT EXISTS ax_sickerstrecke (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(MULTILINESTRING) NOT NULL,
	gewaesserkennzahl text,
	name text,
	herkunft text,
	zweitname text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_sickerstrecke_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_sickerstrecke IS 'FeatureType: "AX_Sickerstrecke"';
COMMENT ON COLUMN ax_sickerstrecke.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_sickerstrecke.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_sickerstrecke.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_sickerstrecke.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_sickerstrecke.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_sickerstrecke.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_sickerstrecke.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_sickerstrecke.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_sickerstrecke.position IS 'position   GM_CompositeCurve 1';
COMMENT ON COLUMN ax_sickerstrecke.gewaesserkennzahl IS 'gewaesserkennzahl    0..1';
COMMENT ON COLUMN ax_sickerstrecke.name IS 'name    0..1';
COMMENT ON COLUMN ax_sickerstrecke.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_sickerstrecke.zweitname IS 'zweitname    0..1';
COMMENT ON COLUMN ax_sickerstrecke.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_firstlinie (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(MULTILINESTRING) NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_firstlinie_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_firstlinie IS 'FeatureType: "AX_Firstlinie"';
COMMENT ON COLUMN ax_firstlinie.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_firstlinie.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_firstlinie.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_firstlinie.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_firstlinie.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_firstlinie.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_firstlinie.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_firstlinie.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_firstlinie.position IS 'position   GM_CompositeCurve 1';

CREATE TABLE IF NOT EXISTS ax_besonderegebaeudelinie (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(MULTILINESTRING) NOT NULL,
	beschaffenheit integer[] NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_besonderegebaeudelinie_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_besonderegebaeudelinie IS 'FeatureType: "AX_BesondereGebaeudelinie"';
COMMENT ON COLUMN ax_besonderegebaeudelinie.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_besonderegebaeudelinie.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_besonderegebaeudelinie.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_besonderegebaeudelinie.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_besonderegebaeudelinie.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_besonderegebaeudelinie.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_besonderegebaeudelinie.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_besonderegebaeudelinie.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_besonderegebaeudelinie.position IS 'position   GM_CompositeCurve 1';
COMMENT ON COLUMN ax_besonderegebaeudelinie.beschaffenheit IS 'beschaffenheit  enumeration AX_Beschaffenheit_BesondereGebaeudelinie 1..*';

CREATE TABLE IF NOT EXISTS ax_gelaendekante (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(MULTILINESTRING) NOT NULL,
	artdergelaendekante integer NOT NULL,
	datetime timestamp without time zone,
	description character varying,
	identifikation character varying,
	hoehengenauigkeit text,
	ursprung integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_gelaendekante_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gelaendekante IS 'FeatureType: "AX_Gelaendekante"';
COMMENT ON COLUMN ax_gelaendekante.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gelaendekante.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gelaendekante.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gelaendekante.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gelaendekante.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gelaendekante.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gelaendekante.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gelaendekante.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gelaendekante.position IS 'position   GM_CompositeCurve 1';
COMMENT ON COLUMN ax_gelaendekante.artdergelaendekante IS 'artDerGelaendekante  enumeration AX_ArtDerGelaendekante 1';
COMMENT ON COLUMN ax_gelaendekante.datetime IS 'erfassung AX_Erfassung_DGM|dateTime  DateTime 0..1';
COMMENT ON COLUMN ax_gelaendekante.description IS 'erfassung AX_Erfassung_DGM|description enumeration AX_DQErfassungsmethode 1';
COMMENT ON COLUMN ax_gelaendekante.identifikation IS 'erfassung AX_Erfassung_DGM|identifikation enumeration AX_Identifikation 1';
COMMENT ON COLUMN ax_gelaendekante.hoehengenauigkeit IS 'hoehengenauigkeit   DQ_AbsoluteExternalPositionalAccuracy 0..1';
COMMENT ON COLUMN ax_gelaendekante.ursprung IS 'ursprung  enumeration AX_Ursprung 0..1';

CREATE TABLE IF NOT EXISTS ax_sonstigesbauwerkodersonstigeeinrichtung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	bauwerksfunktion integer NOT NULL,
	bezeichnung text,
	funktion integer,
	hydrologischesmerkmal integer,
	name text,
	objekthoehe double precision,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
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
	gehoertzu text,
CONSTRAINT ax_sonstigesbauwerkodersonstigeeinrichtung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_sonstigesbauwerkodersonstigeeinrichtung IS 'FeatureType: "AX_SonstigesBauwerkOderSonstigeEinrichtung"';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.bauwerksfunktion IS 'bauwerksfunktion  enumeration AX_Bauwerksfunktion_SonstigesBauwerkOderSonstigeEinrichtung 1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.funktion IS 'funktion  enumeration AX_Funktion_Bauwerk 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.hydrologischesmerkmal IS 'hydrologischesMerkmal  enumeration AX_HydrologischesMerkmal_SonstigesBauwerkOderSonstigeEinrichtung 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.name IS 'name    0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.objekthoehe IS 'objekthoehe   Length 0..1';
COMMENT ON COLUMN ax_sonstigesbauwerkodersonstigeeinrichtung.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
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
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	bauwerksfunktion integer NOT NULL,
	breitedesobjekts double precision,
	name text,
	herkunft text,
	sportart integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_bauwerkoderanlagefuersportfreizeitunderholung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_bauwerkoderanlagefuersportfreizeitunderholung IS 'FeatureType: "AX_BauwerkOderAnlageFuerSportFreizeitUndErholung"';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.bauwerksfunktion IS 'bauwerksfunktion  enumeration AX_Bauwerksfunktion_BauwerkOderAnlageFuerSportFreizeitUndErholung 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.breitedesobjekts IS 'breiteDesObjekts   Length 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.name IS 'name    0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.sportart IS 'sportart  enumeration AX_Sportart_BauwerkOderAnlageFuerSportFreizeitUndErholung 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuersportfreizeitunderholung.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_bauwerkoderanlagefuerindustrieundgewerbe (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	bauwerksfunktion integer NOT NULL,
	bezeichnung text,
	name text,
	objekthoehe double precision,
	herkunft text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_bauwerkoderanlagefuerindustrieundgewerbe_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_bauwerkoderanlagefuerindustrieundgewerbe IS 'FeatureType: "AX_BauwerkOderAnlageFuerIndustrieUndGewerbe"';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.bauwerksfunktion IS 'bauwerksfunktion  enumeration AX_Bauwerksfunktion_BauwerkOderAnlageFuerIndustrieUndGewerbe 1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.name IS 'name    0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.objekthoehe IS 'objekthoehe   Length 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.zustand IS 'zustand  enumeration AX_Zustand_BauwerkOderAnlageFuerIndustrieUndGewerbe 0..1';
COMMENT ON COLUMN ax_bauwerkoderanlagefuerindustrieundgewerbe.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_einrichtunginoeffentlichenbereichen (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	art integer NOT NULL,
	kilometerangabe double precision,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_einrichtunginoeffentlichenbereichen_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_einrichtunginoeffentlichenbereichen IS 'FeatureType: "AX_EinrichtungInOeffentlichenBereichen"';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.art IS 'art  enumeration AX_Art_EinrichtungInOeffentlichenBereichen 1';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.kilometerangabe IS 'kilometerangabe   Distance 0..1';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_einrichtunginoeffentlichenbereichen.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_historischesbauwerkoderhistorischeeinrichtung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	archaeologischertyp integer NOT NULL,
	name text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_historischesbauwerkoderhistorischeeinrichtung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_historischesbauwerkoderhistorischeeinrichtung IS 'FeatureType: "AX_HistorischesBauwerkOderHistorischeEinrichtung"';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.archaeologischertyp IS 'archaeologischerTyp  enumeration AX_ArchaeologischerTyp_HistorischesBauwerkOderHistorischeEinrichtung 1';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.name IS 'name    0..1';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_historischesbauwerkoderhistorischeeinrichtung.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_turm (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	bauwerksfunktion integer[] NOT NULL,
	name text,
	objekthoehe double precision,
	herkunft text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
	zeigtauf text[],
CONSTRAINT ax_turm_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_turm IS 'FeatureType: "AX_Turm"';
COMMENT ON COLUMN ax_turm.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_turm.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_turm.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_turm.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_turm.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_turm.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_turm.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_turm.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_turm.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_turm.bauwerksfunktion IS 'bauwerksfunktion  enumeration AX_Bauwerksfunktion_Turm 1..*';
COMMENT ON COLUMN ax_turm.name IS 'name    0..1';
COMMENT ON COLUMN ax_turm.objekthoehe IS 'objekthoehe   Length 0..1';
COMMENT ON COLUMN ax_turm.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_turm.zustand IS 'zustand  enumeration AX_Zustand_Turm 0..1';
COMMENT ON COLUMN ax_turm.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
COMMENT ON COLUMN ax_turm.zeigtauf IS 'Assoziation zu: FeatureType AX_LagebezeichnungMitHausnummer (ax_lagebezeichnungmithausnummer) 0..*';

CREATE TABLE IF NOT EXISTS ax_vorratsbehaelterspeicherbauwerk (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	bauwerksfunktion integer,
	lagezurerdoberflaeche integer,
	name text,
	objekthoehe double precision,
	herkunft text,
	speicherinhalt integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_vorratsbehaelterspeicherbauwerk_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_vorratsbehaelterspeicherbauwerk IS 'FeatureType: "AX_VorratsbehaelterSpeicherbauwerk"';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.bauwerksfunktion IS 'bauwerksfunktion  enumeration AX_Bauwerksfunktion_VorratsbehaelterSpeicherbauwerk 0..1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.lagezurerdoberflaeche IS 'lageZurErdoberflaeche  enumeration AX_LageZurErdoberflaeche_VorratsbehaelterSpeicherbauwerk 0..1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.name IS 'name    0..1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.objekthoehe IS 'objekthoehe   Length 0..1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.speicherinhalt IS 'speicherinhalt  enumeration AX_Speicherinhalt_VorratsbehaelterSpeicherbauwerk 0..1';
COMMENT ON COLUMN ax_vorratsbehaelterspeicherbauwerk.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_bauwerkimgewaesserbereich (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	bauwerksfunktion integer NOT NULL,
	bezeichnung text,
	name text,
	herkunft text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_bauwerkimgewaesserbereich_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_bauwerkimgewaesserbereich IS 'FeatureType: "AX_BauwerkImGewaesserbereich"';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.bauwerksfunktion IS 'bauwerksfunktion  enumeration AX_Bauwerksfunktion_BauwerkImGewaesserbereich 1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.name IS 'name    0..1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.zustand IS 'zustand  enumeration AX_Zustand_BauwerkImGewaesserbereich 0..1';
COMMENT ON COLUMN ax_bauwerkimgewaesserbereich.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_bauwerkimverkehrsbereich (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	bauwerksfunktion integer NOT NULL,
	bezeichnung text,
	breitedesobjekts double precision,
	durchfahrtshoehe double precision,
	name text,
	herkunft text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_bauwerkimverkehrsbereich_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_bauwerkimverkehrsbereich IS 'FeatureType: "AX_BauwerkImVerkehrsbereich"';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.bauwerksfunktion IS 'bauwerksfunktion  enumeration AX_Bauwerksfunktion_BauwerkImVerkehrsbereich 1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.breitedesobjekts IS 'breiteDesObjekts   Length 0..1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.durchfahrtshoehe IS 'durchfahrtshoehe   Length 0..1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.name IS 'name    0..1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.zustand IS 'zustand  enumeration AX_Zustand_BauwerkImVerkehrsbereich 0..1';
COMMENT ON COLUMN ax_bauwerkimverkehrsbereich.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_schifffahrtsliniefaehrverkehr (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	art integer[],
	name text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_schifffahrtsliniefaehrverkehr_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_schifffahrtsliniefaehrverkehr IS 'FeatureType: "AX_SchifffahrtslinieFaehrverkehr"';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.art IS 'art  enumeration AX_Art_SchifffahrtslinieFaehrverkehr 0..*';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.name IS 'name    0..1';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_schifffahrtsliniefaehrverkehr.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_gebaeude (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	anzahlderoberirdischengeschosse integer,
	anzahlderunterirdischengeschosse integer,
	baujahr integer[],
	bauweise integer,
	dachart text,
	dachform integer,
	dachgeschossausbau integer,
	gebaeudefunktion integer NOT NULL,
	gebaeudekennzeichen text,
	geschossflaeche double precision,
	grundflaeche double precision,
	hochhaus boolean,
	lagezurerdoberflaeche integer,
	name text[],
	anteil integer[],
	nutzung character varying[],
	objekthoehe double precision,
	herkunft text,
	umbauterraum double precision,
	weiteregebaeudefunktion integer[],
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzu text[],
	gehoert text[],
	zeigtauf text[],
	hat text,
	haengtzusammenmit text,
	gehoertzu  text,
	inverszu_zeigtauf text[],
CONSTRAINT ax_gebaeude_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gebaeude IS 'FeatureType: "AX_Gebaeude"';
COMMENT ON COLUMN ax_gebaeude.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gebaeude.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gebaeude.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gebaeude.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gebaeude.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gebaeude.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gebaeude.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gebaeude.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gebaeude.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_gebaeude.anzahlderoberirdischengeschosse IS 'anzahlDerOberirdischenGeschosse   Integer 0..1';
COMMENT ON COLUMN ax_gebaeude.anzahlderunterirdischengeschosse IS 'anzahlDerUnterirdischenGeschosse   Integer 0..1';
COMMENT ON COLUMN ax_gebaeude.baujahr IS 'baujahr   Integer 0..*';
COMMENT ON COLUMN ax_gebaeude.bauweise IS 'bauweise  enumeration AX_Bauweise_Gebaeude 0..1';
COMMENT ON COLUMN ax_gebaeude.dachart IS 'dachart    0..1';
COMMENT ON COLUMN ax_gebaeude.dachform IS 'dachform  enumeration AX_Dachform 0..1';
COMMENT ON COLUMN ax_gebaeude.dachgeschossausbau IS 'dachgeschossausbau  enumeration AX_Dachgeschossausbau_Gebaeude 0..1';
COMMENT ON COLUMN ax_gebaeude.gebaeudefunktion IS 'gebaeudefunktion  enumeration AX_Gebaeudefunktion 1';
COMMENT ON COLUMN ax_gebaeude.gebaeudekennzeichen IS 'gebaeudekennzeichen    0..1';
COMMENT ON COLUMN ax_gebaeude.geschossflaeche IS 'geschossflaeche   Area 0..1';
COMMENT ON COLUMN ax_gebaeude.grundflaeche IS 'grundflaeche   Area 0..1';
COMMENT ON COLUMN ax_gebaeude.hochhaus IS 'hochhaus   Boolean 0..1';
COMMENT ON COLUMN ax_gebaeude.lagezurerdoberflaeche IS 'lageZurErdoberflaeche  enumeration AX_LageZurErdoberflaeche_Gebaeude 0..1';
COMMENT ON COLUMN ax_gebaeude.name IS 'name    0..*';
COMMENT ON COLUMN ax_gebaeude.anteil IS 'nutzung AX_Nutzung_Gebaeude|anteil  Integer 0..1';
COMMENT ON COLUMN ax_gebaeude.nutzung IS 'nutzung AX_Nutzung_Gebaeude|nutzung enumeration AX_Nutzung 1';
COMMENT ON COLUMN ax_gebaeude.objekthoehe IS 'objekthoehe   Length 0..1';
COMMENT ON COLUMN ax_gebaeude.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_gebaeude.umbauterraum IS 'umbauterRaum   Volume 0..1';
COMMENT ON COLUMN ax_gebaeude.weiteregebaeudefunktion IS 'weitereGebaeudefunktion  enumeration AX_Weitere_Gebaeudefunktion 0..*';
COMMENT ON COLUMN ax_gebaeude.zustand IS 'zustand  enumeration AX_Zustand_Gebaeude 0..1';
COMMENT ON COLUMN ax_gebaeude.inverszu_gehoertzu IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';
COMMENT ON COLUMN ax_gebaeude.gehoert IS 'Assoziation zu: FeatureType AX_Person (ax_person) 0..*';
COMMENT ON COLUMN ax_gebaeude.zeigtauf IS 'Assoziation zu: FeatureType AX_LagebezeichnungMitHausnummer (ax_lagebezeichnungmithausnummer) 0..*';
COMMENT ON COLUMN ax_gebaeude.hat IS 'Assoziation zu: FeatureType AX_LagebezeichnungMitPseudonummer (ax_lagebezeichnungmitpseudonummer) 0..1';
COMMENT ON COLUMN ax_gebaeude.haengtzusammenmit IS 'Assoziation zu: FeatureType AX_Gebaeude (ax_gebaeude) 0..1';
COMMENT ON COLUMN ax_gebaeude.gehoertzu  IS 'Assoziation zu: FeatureType AX_Gebaeude (ax_gebaeude) 0..1';
COMMENT ON COLUMN ax_gebaeude.inverszu_zeigtauf IS 'Assoziation zu: FeatureType AX_Gebaeudeausgestaltung (ax_gebaeudeausgestaltung) 0..*';

CREATE TABLE IF NOT EXISTS ax_anderefestlegungnachstrassenrecht (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	artderfestlegung integer NOT NULL,
	land text,
	stelle text,
	nummer text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_anderefestlegungnachstrassenrecht_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_anderefestlegungnachstrassenrecht IS 'FeatureType: "AX_AndereFestlegungNachStrassenrecht"';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.artderfestlegung IS 'artDerFestlegung  enumeration AX_ArtDerFestlegung_AndereFestlegungNachStrassenrecht 1';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.land IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.stelle IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.nummer IS 'nummer    0..1';
COMMENT ON COLUMN ax_anderefestlegungnachstrassenrecht.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ax_naturumweltoderbodenschutzrecht (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	artderfestlegung integer NOT NULL,
	land text,
	stelle text,
	bezeichnung text,
	name text,
	herkunft text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_naturumweltoderbodenschutzrecht_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_naturumweltoderbodenschutzrecht IS 'FeatureType: "AX_NaturUmweltOderBodenschutzrecht"';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.artderfestlegung IS 'artDerFestlegung  enumeration AX_ArtDerFestlegung_NaturUmweltOderBodenschutzrecht 1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.land IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.stelle IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.name IS 'name    0..1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_naturumweltoderbodenschutzrecht.zustand IS 'zustand  enumeration AX_Zustand_NaturUmweltOderBodenschutzrecht 0..1';

CREATE TABLE IF NOT EXISTS ax_klassifizierungnachstrassenrecht (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	artderfestlegung integer NOT NULL,
	land text,
	stelle text,
	bezeichnung text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_klassifizierungnachstrassenrecht_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_klassifizierungnachstrassenrecht IS 'FeatureType: "AX_KlassifizierungNachStrassenrecht"';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.artderfestlegung IS 'artDerFestlegung  enumeration AX_ArtDerFestlegung_KlassifizierungNachStrassenrecht 1';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.land IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.stelle IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_klassifizierungnachstrassenrecht.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ax_sonstigesrecht (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	artderfestlegung integer NOT NULL,
	land text,
	stelle text,
	bezeichnung text,
	name text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_sonstigesrecht_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_sonstigesrecht IS 'FeatureType: "AX_SonstigesRecht"';
COMMENT ON COLUMN ax_sonstigesrecht.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_sonstigesrecht.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_sonstigesrecht.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_sonstigesrecht.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_sonstigesrecht.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_sonstigesrecht.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_sonstigesrecht.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_sonstigesrecht.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_sonstigesrecht.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_sonstigesrecht.artderfestlegung IS 'artDerFestlegung  enumeration AX_ArtDerFestlegung_SonstigesRecht 1';
COMMENT ON COLUMN ax_sonstigesrecht.land IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_sonstigesrecht.stelle IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_sonstigesrecht.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_sonstigesrecht.name IS 'name    0..1';
COMMENT ON COLUMN ax_sonstigesrecht.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ax_denkmalschutzrecht (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	artderfestlegung integer NOT NULL,
	land text,
	stelle text,
	bezeichnung text,
	name text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_denkmalschutzrecht_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_denkmalschutzrecht IS 'FeatureType: "AX_Denkmalschutzrecht"';
COMMENT ON COLUMN ax_denkmalschutzrecht.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_denkmalschutzrecht.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_denkmalschutzrecht.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_denkmalschutzrecht.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_denkmalschutzrecht.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_denkmalschutzrecht.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_denkmalschutzrecht.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_denkmalschutzrecht.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_denkmalschutzrecht.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_denkmalschutzrecht.artderfestlegung IS 'artDerFestlegung  enumeration AX_ArtDerFestlegung_Denkmalschutzrecht 1';
COMMENT ON COLUMN ax_denkmalschutzrecht.land IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_denkmalschutzrecht.stelle IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_denkmalschutzrecht.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_denkmalschutzrecht.name IS 'name    0..1';
COMMENT ON COLUMN ax_denkmalschutzrecht.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ax_dammwalldeich (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	art integer,
	bezeichnung text,
	funktion integer,
	name text,
	objekthoehe double precision,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_dammwalldeich_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_dammwalldeich IS 'FeatureType: "AX_DammWallDeich"';
COMMENT ON COLUMN ax_dammwalldeich.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_dammwalldeich.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_dammwalldeich.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_dammwalldeich.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_dammwalldeich.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_dammwalldeich.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_dammwalldeich.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_dammwalldeich.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_dammwalldeich.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_dammwalldeich.art IS 'art  enumeration AX_Art_DammWallDeich 0..1';
COMMENT ON COLUMN ax_dammwalldeich.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_dammwalldeich.funktion IS 'funktion  enumeration AX_Funktion_DammWallDeich 0..1';
COMMENT ON COLUMN ax_dammwalldeich.name IS 'name    0..1';
COMMENT ON COLUMN ax_dammwalldeich.objekthoehe IS 'objekthoehe   Length 0..1';
COMMENT ON COLUMN ax_dammwalldeich.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ax_punktortag (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POINT) NOT NULL,
	hinweise character varying,
	kartendarstellung boolean,
	koordinatenstatus integer,
	genauigkeitsstufe character varying,
	genauigkeitswert text,
	herkunft text,
	lagezuverlaessigkeit boolean,
	vertrauenswuerdigkeit character varying,
	ueberpruefungsdatum date,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_punktortag_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_punktortag IS 'FeatureType: "AX_PunktortAG"';
COMMENT ON COLUMN ax_punktortag.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_punktortag.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_punktortag.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_punktortag.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_punktortag.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_punktortag.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_punktortag.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_punktortag.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_punktortag.position IS 'position   GM_Point 1';
COMMENT ON COLUMN ax_punktortag.hinweise IS 'hinweise   CharacterString 0..1';
COMMENT ON COLUMN ax_punktortag.kartendarstellung IS 'kartendarstellung   Boolean 0..1';
COMMENT ON COLUMN ax_punktortag.koordinatenstatus IS 'koordinatenstatus  enumeration AX_Koordinatenstatus_Punktort 0..1';
COMMENT ON COLUMN ax_punktortag.genauigkeitsstufe IS 'qualitaetsangaben AX_DQPunktort|genauigkeitsstufe enumeration AX_Genauigkeitsstufe_Punktort 0..1';
COMMENT ON COLUMN ax_punktortag.genauigkeitswert IS 'qualitaetsangaben AX_DQPunktort|genauigkeitswert  DQ_RelativeInternalPositionalAccuracy 0..1';
COMMENT ON COLUMN ax_punktortag.herkunft IS 'qualitaetsangaben AX_DQPunktort|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_punktortag.lagezuverlaessigkeit IS 'qualitaetsangaben AX_DQPunktort|lagezuverlaessigkeit  Boolean 0..1';
COMMENT ON COLUMN ax_punktortag.vertrauenswuerdigkeit IS 'qualitaetsangaben AX_DQPunktort|vertrauenswuerdigkeit enumeration AX_Vertrauenswuerdigkeit_Punktort 0..1';
COMMENT ON COLUMN ax_punktortag.ueberpruefungsdatum IS 'ueberpruefungsdatum   Date 0..1';

CREATE TABLE IF NOT EXISTS ax_bauteil (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	anzahlderoberirdischengeschosse integer,
	bauart integer NOT NULL,
	baujahr integer[],
	dachform integer,
	durchfahrtshoehe double precision,
	lagezurerdoberflaeche integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_bauteil_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_bauteil IS 'FeatureType: "AX_Bauteil"';
COMMENT ON COLUMN ax_bauteil.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_bauteil.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_bauteil.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_bauteil.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_bauteil.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_bauteil.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_bauteil.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_bauteil.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_bauteil.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_bauteil.anzahlderoberirdischengeschosse IS 'anzahlDerOberirdischenGeschosse   Integer 0..1';
COMMENT ON COLUMN ax_bauteil.bauart IS 'bauart  enumeration AX_Bauart_Bauteil 1';
COMMENT ON COLUMN ax_bauteil.baujahr IS 'baujahr   Integer 0..*';
COMMENT ON COLUMN ax_bauteil.dachform IS 'dachform  enumeration AX_Dachform 0..1';
COMMENT ON COLUMN ax_bauteil.durchfahrtshoehe IS 'durchfahrtshoehe   Length 0..1';
COMMENT ON COLUMN ax_bauteil.lagezurerdoberflaeche IS 'lageZurErdoberflaeche  enumeration AX_LageZurErdoberflaeche_Bauteil 0..1';

CREATE TABLE IF NOT EXISTS ax_tagesabschnitt (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	tagesabschnittsnummer text NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzu text[],
CONSTRAINT ax_tagesabschnitt_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_tagesabschnitt IS 'FeatureType: "AX_Tagesabschnitt"';
COMMENT ON COLUMN ax_tagesabschnitt.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_tagesabschnitt.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_tagesabschnitt.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_tagesabschnitt.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_tagesabschnitt.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_tagesabschnitt.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_tagesabschnitt.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_tagesabschnitt.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_tagesabschnitt.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_tagesabschnitt.tagesabschnittsnummer IS 'tagesabschnittsnummer    1';
COMMENT ON COLUMN ax_tagesabschnitt.inverszu_gehoertzu IS 'Assoziation zu: FeatureType AX_GrablochDerBodenschaetzung (ax_grablochderbodenschaetzung) 0..*';

CREATE TABLE IF NOT EXISTS ax_bewertung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	klassifizierung integer NOT NULL,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_bewertung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_bewertung IS 'FeatureType: "AX_Bewertung"';
COMMENT ON COLUMN ax_bewertung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_bewertung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_bewertung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_bewertung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_bewertung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_bewertung.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_bewertung.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_bewertung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_bewertung.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_bewertung.klassifizierung IS 'klassifizierung  enumeration AX_Klassifizierung_Bewertung 1';
COMMENT ON COLUMN ax_bewertung.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ax_anderefestlegungnachwasserrecht (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	artderfestlegung integer NOT NULL,
	land text,
	stelle text,
	nummer text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_anderefestlegungnachwasserrecht_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_anderefestlegungnachwasserrecht IS 'FeatureType: "AX_AndereFestlegungNachWasserrecht"';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.artderfestlegung IS 'artDerFestlegung  enumeration AX_ArtDerFestlegung_AndereFestlegungNachWasserrecht 1';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.land IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.stelle IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.nummer IS 'nummer    0..1';
COMMENT ON COLUMN ax_anderefestlegungnachwasserrecht.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ax_klassifizierungnachwasserrecht (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	artderfestlegung integer NOT NULL,
	land text,
	stelle text,
	bezeichnung text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_klassifizierungnachwasserrecht_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_klassifizierungnachwasserrecht IS 'FeatureType: "AX_KlassifizierungNachWasserrecht"';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.artderfestlegung IS 'artDerFestlegung  enumeration AX_ArtDerFestlegung_KlassifizierungNachWasserrecht 1';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.land IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.stelle IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_klassifizierungnachwasserrecht.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ax_forstrecht (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	artderfestlegung integer NOT NULL,
	land text,
	stelle text,
	besonderefunktion integer,
	bezeichnung text,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_forstrecht_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_forstrecht IS 'FeatureType: "AX_Forstrecht"';
COMMENT ON COLUMN ax_forstrecht.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_forstrecht.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_forstrecht.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_forstrecht.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_forstrecht.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_forstrecht.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_forstrecht.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_forstrecht.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_forstrecht.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_forstrecht.artderfestlegung IS 'artDerFestlegung  enumeration AX_ArtDerFestlegung_Forstrecht 1';
COMMENT ON COLUMN ax_forstrecht.land IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_forstrecht.stelle IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_forstrecht.besonderefunktion IS 'besondereFunktion  enumeration AX_BesondereFunktion_Forstrecht 0..1';
COMMENT ON COLUMN ax_forstrecht.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_forstrecht.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ax_bauraumoderbodenordnungsrecht (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry NOT NULL,
	artderfestlegung integer NOT NULL,
	land text,
	stelle text,
	bezeichnung text,
	datumabgabe date,
	datumanordnung date,
	datumbesitzeinweisung date,
	datumrechtskraeftig date,
	name text,
	herkunft text,
	veraenderungohneruecksprache boolean,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_bauraumoderbodenordnungsrecht_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_bauraumoderbodenordnungsrecht IS 'FeatureType: "AX_BauRaumOderBodenordnungsrecht"';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.artderfestlegung IS 'artDerFestlegung  enumeration AX_ArtDerFestlegung_BauRaumOderBodenordnungsrecht 1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.land IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.stelle IS 'ausfuehrendeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.datumabgabe IS 'datumAbgabe   Date 0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.datumanordnung IS 'datumAnordnung   Date 0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.datumbesitzeinweisung IS 'datumBesitzeinweisung   Date 0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.datumrechtskraeftig IS 'datumrechtskraeftig   Date 0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.name IS 'name    0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_bauraumoderbodenordnungsrecht.veraenderungohneruecksprache IS 'veraenderungOhneRuecksprache   Boolean 0..1';

CREATE TABLE IF NOT EXISTS ax_schutzzone (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	nummerderschutzzone text,
	rechtszustand integer,
	zone integer NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_schutzzone_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_schutzzone IS 'FeatureType: "AX_Schutzzone"';
COMMENT ON COLUMN ax_schutzzone.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_schutzzone.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_schutzzone.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_schutzzone.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_schutzzone.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_schutzzone.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_schutzzone.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_schutzzone.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_schutzzone.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_schutzzone.nummerderschutzzone IS 'nummerDerSchutzzone    0..1';
COMMENT ON COLUMN ax_schutzzone.rechtszustand IS 'rechtszustand  enumeration AX_Rechtszustand_Schutzzone 0..1';
COMMENT ON COLUMN ax_schutzzone.zone IS 'zone  enumeration AX_Zone_Schutzzone 1';

CREATE TABLE IF NOT EXISTS ax_boeschungsflaeche (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_boeschungsflaeche_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_boeschungsflaeche IS 'FeatureType: "AX_Boeschungsflaeche"';
COMMENT ON COLUMN ax_boeschungsflaeche.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_boeschungsflaeche.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_boeschungsflaeche.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_boeschungsflaeche.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_boeschungsflaeche.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_boeschungsflaeche.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_boeschungsflaeche.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_boeschungsflaeche.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_boeschungsflaeche.position IS 'position   GM_Object 1';

CREATE TABLE IF NOT EXISTS ax_flurstueck (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	abweichenderrechtszustand boolean,
	amtlicheflaeche double precision NOT NULL,
	flurnummer integer,
	flurstuecksfolge character varying,
	flurstueckskennzeichen character varying NOT NULL,
	nenner text,
	zaehler text NOT NULL,
	gemarkungsnummer text NOT NULL,
	gemarkung_land text NOT NULL,
	gemeinde text,
	gemeindeteil text,
	kreis text,
	gemeindezugehoerigkeit_land text,
	regierungsbezirk text,
	objektkoordinaten geometry(POINT),
	rechtsbehelfsverfahren boolean,
	angabenzumabschnittbemerkung text[],
	angabenzumabschnittflurstueck text[],
	angabenzumabschnittnummeraktenzeichen text[],
	angabenzumabschnittstelle text[],
	flaechedesabschnitts double precision[],
	kennungschluessel text[],
	zeitpunktderentstehung date,
	zustaendigestelle_land text[],
	stelle text[],
	zweifelhafterflurstuecksnachweis boolean,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_verweistauf text[],
	istgebucht text NOT NULL,
	inverszu_beziehtsichauf text[],
	beziehtsichaufflurstueck text[],
	gehoertanteiligzu  text[],
	zeigtauf text[],
	weistauf text[],
CONSTRAINT ax_flurstueck_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_flurstueck IS 'FeatureType: "AX_Flurstueck"';
COMMENT ON COLUMN ax_flurstueck.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_flurstueck.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_flurstueck.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_flurstueck.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_flurstueck.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_flurstueck.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_flurstueck.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_flurstueck.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_flurstueck.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_flurstueck.abweichenderrechtszustand IS 'abweichenderRechtszustand   Boolean 0..1';
COMMENT ON COLUMN ax_flurstueck.amtlicheflaeche IS 'amtlicheFlaeche   Area 1';
COMMENT ON COLUMN ax_flurstueck.flurnummer IS 'flurnummer   Integer 0..1';
COMMENT ON COLUMN ax_flurstueck.flurstuecksfolge IS 'flurstuecksfolge   CharacterString 0..1';
COMMENT ON COLUMN ax_flurstueck.flurstueckskennzeichen IS 'flurstueckskennzeichen   CharacterString 1';
COMMENT ON COLUMN ax_flurstueck.nenner IS 'flurstuecksnummer AX_Flurstuecksnummer|nenner   0..1';
COMMENT ON COLUMN ax_flurstueck.zaehler IS 'flurstuecksnummer AX_Flurstuecksnummer|zaehler   1';
COMMENT ON COLUMN ax_flurstueck.gemarkungsnummer IS 'gemarkung AX_Gemarkung_Schluessel|gemarkungsnummer   1';
COMMENT ON COLUMN ax_flurstueck.gemarkung_land IS 'gemarkung AX_Gemarkung_Schluessel|land   1';
COMMENT ON COLUMN ax_flurstueck.gemeinde IS 'gemeindezugehoerigkeit AX_Gemeindekennzeichen|gemeinde   1';
COMMENT ON COLUMN ax_flurstueck.gemeindeteil IS 'gemeindezugehoerigkeit AX_Gemeindekennzeichen|gemeindeteil   0..1';
COMMENT ON COLUMN ax_flurstueck.kreis IS 'gemeindezugehoerigkeit AX_Gemeindekennzeichen|kreis   1';
COMMENT ON COLUMN ax_flurstueck.gemeindezugehoerigkeit_land IS 'gemeindezugehoerigkeit AX_Gemeindekennzeichen|land   1';
COMMENT ON COLUMN ax_flurstueck.regierungsbezirk IS 'gemeindezugehoerigkeit AX_Gemeindekennzeichen|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_flurstueck.objektkoordinaten IS 'objektkoordinaten   GM_Point 0..1';
COMMENT ON COLUMN ax_flurstueck.rechtsbehelfsverfahren IS 'rechtsbehelfsverfahren   Boolean 0..1';
COMMENT ON COLUMN ax_flurstueck.angabenzumabschnittbemerkung IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|angabenZumAbschnittBemerkung   0..1';
COMMENT ON COLUMN ax_flurstueck.angabenzumabschnittflurstueck IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|angabenZumAbschnittFlurstueck   0..1';
COMMENT ON COLUMN ax_flurstueck.angabenzumabschnittnummeraktenzeichen IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|angabenZumAbschnittNummerAktenzeichen   0..1';
COMMENT ON COLUMN ax_flurstueck.angabenzumabschnittstelle IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|angabenZumAbschnittStelle   0..1';
COMMENT ON COLUMN ax_flurstueck.flaechedesabschnitts IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|flaecheDesAbschnitts  Area 0..1';
COMMENT ON COLUMN ax_flurstueck.kennungschluessel IS 'sonstigeEigenschaften AX_SonstigeEigenschaften_Flurstueck|kennungSchluessel   0..1';
COMMENT ON COLUMN ax_flurstueck.zeitpunktderentstehung IS 'zeitpunktDerEntstehung   Date 0..1';
COMMENT ON COLUMN ax_flurstueck.zustaendigestelle_land IS 'zustaendigeStelle AX_Dienststelle_Schluessel|land   1';
COMMENT ON COLUMN ax_flurstueck.stelle IS 'zustaendigeStelle AX_Dienststelle_Schluessel|stelle   1';
COMMENT ON COLUMN ax_flurstueck.zweifelhafterflurstuecksnachweis IS 'zweifelhafterFlurstuecksnachweis   Boolean 0..1';
COMMENT ON COLUMN ax_flurstueck.inverszu_verweistauf IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 0..*';
COMMENT ON COLUMN ax_flurstueck.istgebucht IS 'Assoziation zu: FeatureType AX_Buchungsstelle (ax_buchungsstelle) 1';
COMMENT ON COLUMN ax_flurstueck.inverszu_beziehtsichauf IS 'Assoziation zu: FeatureType AX_Vertretung (ax_vertretung) 0..*';
COMMENT ON COLUMN ax_flurstueck.beziehtsichaufflurstueck IS 'Assoziation zu: FeatureType AX_Flurstueck (ax_flurstueck) 0..*';
COMMENT ON COLUMN ax_flurstueck.gehoertanteiligzu  IS 'Assoziation zu: FeatureType AX_Flurstueck (ax_flurstueck) 0..*';
COMMENT ON COLUMN ax_flurstueck.zeigtauf IS 'Assoziation zu: FeatureType AX_LagebezeichnungOhneHausnummer (ax_lagebezeichnungohnehausnummer) 0..*';
COMMENT ON COLUMN ax_flurstueck.weistauf IS 'Assoziation zu: FeatureType AX_LagebezeichnungMitHausnummer (ax_lagebezeichnungmithausnummer) 0..*';

CREATE TABLE IF NOT EXISTS ax_gebiet_kreis (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	schluesselgesamt text NOT NULL,
	kreis text NOT NULL,
	land text NOT NULL,
	regierungsbezirk text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_gebiet_kreis_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gebiet_kreis IS 'FeatureType: "AX_Gebiet_Kreis"';
COMMENT ON COLUMN ax_gebiet_kreis.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gebiet_kreis.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gebiet_kreis.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gebiet_kreis.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gebiet_kreis.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gebiet_kreis.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gebiet_kreis.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gebiet_kreis.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gebiet_kreis.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_gebiet_kreis.schluesselgesamt IS 'schluesselGesamt    1';
COMMENT ON COLUMN ax_gebiet_kreis.kreis IS 'kreis AX_Kreis_Schluessel|kreis   1';
COMMENT ON COLUMN ax_gebiet_kreis.land IS 'kreis AX_Kreis_Schluessel|land   1';
COMMENT ON COLUMN ax_gebiet_kreis.regierungsbezirk IS 'kreis AX_Kreis_Schluessel|regierungsbezirk   0..1';

CREATE TABLE IF NOT EXISTS ax_gebiet_bundesland (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	schluesselgesamt text NOT NULL,
	land text NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_gebiet_bundesland_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gebiet_bundesland IS 'FeatureType: "AX_Gebiet_Bundesland"';
COMMENT ON COLUMN ax_gebiet_bundesland.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gebiet_bundesland.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gebiet_bundesland.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gebiet_bundesland.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gebiet_bundesland.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gebiet_bundesland.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gebiet_bundesland.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gebiet_bundesland.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gebiet_bundesland.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_gebiet_bundesland.schluesselgesamt IS 'schluesselGesamt    1';
COMMENT ON COLUMN ax_gebiet_bundesland.land IS 'land AX_Bundesland_Schluessel|land   1';

CREATE TABLE IF NOT EXISTS ax_gebiet_regierungsbezirk (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	schluesselgesamt text NOT NULL,
	land text NOT NULL,
	regierungsbezirk text NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_gebiet_regierungsbezirk_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gebiet_regierungsbezirk IS 'FeatureType: "AX_Gebiet_Regierungsbezirk"';
COMMENT ON COLUMN ax_gebiet_regierungsbezirk.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gebiet_regierungsbezirk.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gebiet_regierungsbezirk.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gebiet_regierungsbezirk.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gebiet_regierungsbezirk.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gebiet_regierungsbezirk.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gebiet_regierungsbezirk.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gebiet_regierungsbezirk.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gebiet_regierungsbezirk.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_gebiet_regierungsbezirk.schluesselgesamt IS 'schluesselGesamt    1';
COMMENT ON COLUMN ax_gebiet_regierungsbezirk.land IS 'regierungsbezirk AX_Regierungsbezirk_Schluessel|land   1';
COMMENT ON COLUMN ax_gebiet_regierungsbezirk.regierungsbezirk IS 'regierungsbezirk AX_Regierungsbezirk_Schluessel|regierungsbezirk   1';

CREATE TABLE IF NOT EXISTS ax_gebiet_nationalstaat (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	schluesselgesamt text NOT NULL,
	nationalstaat text NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_gebiet_nationalstaat_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gebiet_nationalstaat IS 'FeatureType: "AX_Gebiet_Nationalstaat"';
COMMENT ON COLUMN ax_gebiet_nationalstaat.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gebiet_nationalstaat.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gebiet_nationalstaat.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gebiet_nationalstaat.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gebiet_nationalstaat.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gebiet_nationalstaat.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gebiet_nationalstaat.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gebiet_nationalstaat.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gebiet_nationalstaat.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_gebiet_nationalstaat.schluesselgesamt IS 'schluesselGesamt    1';
COMMENT ON COLUMN ax_gebiet_nationalstaat.nationalstaat IS 'nationalstaat    1';

CREATE TABLE IF NOT EXISTS ax_kommunalesgebiet (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	schluesselgesamt text NOT NULL,
	gemeindeflaeche double precision,
	gemeinde text NOT NULL,
	gemeindeteil text,
	kreis text NOT NULL,
	land text NOT NULL,
	regierungsbezirk text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_kommunalesgebiet_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_kommunalesgebiet IS 'FeatureType: "AX_KommunalesGebiet"';
COMMENT ON COLUMN ax_kommunalesgebiet.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_kommunalesgebiet.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_kommunalesgebiet.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_kommunalesgebiet.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_kommunalesgebiet.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_kommunalesgebiet.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_kommunalesgebiet.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_kommunalesgebiet.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_kommunalesgebiet.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_kommunalesgebiet.schluesselgesamt IS 'schluesselGesamt    1';
COMMENT ON COLUMN ax_kommunalesgebiet.gemeindeflaeche IS 'gemeindeflaeche   Area 0..1';
COMMENT ON COLUMN ax_kommunalesgebiet.gemeinde IS 'gemeindekennzeichen AX_Gemeindekennzeichen|gemeinde   1';
COMMENT ON COLUMN ax_kommunalesgebiet.gemeindeteil IS 'gemeindekennzeichen AX_Gemeindekennzeichen|gemeindeteil   0..1';
COMMENT ON COLUMN ax_kommunalesgebiet.kreis IS 'gemeindekennzeichen AX_Gemeindekennzeichen|kreis   1';
COMMENT ON COLUMN ax_kommunalesgebiet.land IS 'gemeindekennzeichen AX_Gemeindekennzeichen|land   1';
COMMENT ON COLUMN ax_kommunalesgebiet.regierungsbezirk IS 'gemeindekennzeichen AX_Gemeindekennzeichen|regierungsbezirk   0..1';

CREATE TABLE IF NOT EXISTS ax_gebiet_verwaltungsgemeinschaft (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	schluesselgesamt text NOT NULL,
	artderverbandsgemeinde integer NOT NULL,
	kreis text NOT NULL,
	land text NOT NULL,
	regierungsbezirk text,
	verwaltungsgemeinschaft text NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_gebiet_verwaltungsgemeinschaft_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gebiet_verwaltungsgemeinschaft IS 'FeatureType: "AX_Gebiet_Verwaltungsgemeinschaft"';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.schluesselgesamt IS 'schluesselGesamt    1';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.artderverbandsgemeinde IS 'artDerVerbandsgemeinde  enumeration AX_Art_Verbandsgemeinde 1';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.kreis IS 'verwaltungsgemeinschaft AX_Verwaltungsgemeinschaft_Schluessel|kreis   1';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.land IS 'verwaltungsgemeinschaft AX_Verwaltungsgemeinschaft_Schluessel|land   1';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.regierungsbezirk IS 'verwaltungsgemeinschaft AX_Verwaltungsgemeinschaft_Schluessel|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_gebiet_verwaltungsgemeinschaft.verwaltungsgemeinschaft IS 'verwaltungsgemeinschaft AX_Verwaltungsgemeinschaft_Schluessel|verwaltungsgemeinschaft   1';

CREATE TABLE IF NOT EXISTS ax_bodenschaetzung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry NOT NULL,
	ackerzahlodergruenlandzahl text,
	bodenart integer NOT NULL,
	bodenzahlodergruenlandgrundzahl text,
	entstehungsartoderklimastufewasserverhaeltnisse integer[],
	jahreszahl integer,
	kulturart integer NOT NULL,
	herkunft text,
	sonstigeangaben integer[],
	zustandsstufeoderbodenstufe integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_bodenschaetzung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_bodenschaetzung IS 'FeatureType: "AX_Bodenschaetzung"';
COMMENT ON COLUMN ax_bodenschaetzung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_bodenschaetzung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_bodenschaetzung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_bodenschaetzung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_bodenschaetzung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_bodenschaetzung.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_bodenschaetzung.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_bodenschaetzung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_bodenschaetzung.position IS 'position   GM_Object 1';
COMMENT ON COLUMN ax_bodenschaetzung.ackerzahlodergruenlandzahl IS 'ackerzahlOderGruenlandzahl    0..1';
COMMENT ON COLUMN ax_bodenschaetzung.bodenart IS 'bodenart  enumeration AX_Bodenart_Bodenschaetzung 1';
COMMENT ON COLUMN ax_bodenschaetzung.bodenzahlodergruenlandgrundzahl IS 'bodenzahlOderGruenlandgrundzahl    0..1';
COMMENT ON COLUMN ax_bodenschaetzung.entstehungsartoderklimastufewasserverhaeltnisse IS 'entstehungsartOderKlimastufeWasserverhaeltnisse  enumeration AX_EntstehungsartOderKlimastufeWasserverhaeltnisse_Bodenschaetzung 0..*';
COMMENT ON COLUMN ax_bodenschaetzung.jahreszahl IS 'jahreszahl   Integer 0..1';
COMMENT ON COLUMN ax_bodenschaetzung.kulturart IS 'kulturart  enumeration AX_Kulturart_Bodenschaetzung 1';
COMMENT ON COLUMN ax_bodenschaetzung.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_bodenschaetzung.sonstigeangaben IS 'sonstigeAngaben  enumeration AX_SonstigeAngaben_Bodenschaetzung 0..*';
COMMENT ON COLUMN ax_bodenschaetzung.zustandsstufeoderbodenstufe IS 'zustandsstufeOderBodenstufe  enumeration AX_ZustandsstufeOderBodenstufe_Bodenschaetzung 0..1';

CREATE TABLE IF NOT EXISTS ax_gewaesserstationierungsachse (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(LINESTRING) NOT NULL,
	artdergewaesserachse integer,
	fliessrichtung boolean NOT NULL,
	gewaesserkennzahl text,
	identnummer text,
	name text,
	herkunft text,
	zweitname text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	inverszu_gehoertzubauwerk text[],
CONSTRAINT ax_gewaesserstationierungsachse_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gewaesserstationierungsachse IS 'FeatureType: "AX_Gewaesserstationierungsachse"';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.position IS 'position   GM_Curve 1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.artdergewaesserachse IS 'artDerGewaesserachse  enumeration AX_ArtDerGewaesserachse 0..1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.fliessrichtung IS 'fliessrichtung   Boolean 1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.gewaesserkennzahl IS 'gewaesserkennzahl    0..1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.identnummer IS 'identnummer    0..1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.name IS 'name    0..1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.zweitname IS 'zweitname    0..1';
COMMENT ON COLUMN ax_gewaesserstationierungsachse.inverszu_gehoertzubauwerk IS 'Assoziation zu: FeatureType AX_SonstigesBauwerkOderSonstigeEinrichtung (ax_sonstigesbauwerkodersonstigeeinrichtung) 0..*';

CREATE TABLE IF NOT EXISTS ax_besondereflurstuecksgrenze (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(LINESTRING) NOT NULL,
	artderflurstuecksgrenze integer[] NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_besondereflurstuecksgrenze_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_besondereflurstuecksgrenze IS 'FeatureType: "AX_BesondereFlurstuecksgrenze"';
COMMENT ON COLUMN ax_besondereflurstuecksgrenze.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_besondereflurstuecksgrenze.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_besondereflurstuecksgrenze.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_besondereflurstuecksgrenze.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_besondereflurstuecksgrenze.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_besondereflurstuecksgrenze.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_besondereflurstuecksgrenze.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_besondereflurstuecksgrenze.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_besondereflurstuecksgrenze.position IS 'position   GM_Curve 1';
COMMENT ON COLUMN ax_besondereflurstuecksgrenze.artderflurstuecksgrenze IS 'artDerFlurstuecksgrenze  enumeration AX_ArtDerFlurstuecksgrenze_BesondereFlurstuecksgrenze 1..*';

CREATE TABLE IF NOT EXISTS ax_gebietsgrenze (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(LINESTRING) NOT NULL,
	artdergebietsgrenze integer[] NOT NULL,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_gebietsgrenze_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gebietsgrenze IS 'FeatureType: "AX_Gebietsgrenze"';
COMMENT ON COLUMN ax_gebietsgrenze.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gebietsgrenze.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gebietsgrenze.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gebietsgrenze.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gebietsgrenze.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gebietsgrenze.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gebietsgrenze.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gebietsgrenze.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gebietsgrenze.position IS 'position   GM_Curve 1';
COMMENT ON COLUMN ax_gebietsgrenze.artdergebietsgrenze IS 'artDerGebietsgrenze  enumeration AX_ArtDerGebietsgrenze_Gebietsgrenze 1..*';

CREATE TABLE IF NOT EXISTS ax_gewaesserachse (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(LINESTRING) NOT NULL,
	breitedesgewaessers integer,
	fliessrichtung boolean NOT NULL,
	funktion integer,
	hydrologischesmerkmal integer,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_gewaesserachse_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gewaesserachse IS 'FeatureType: "AX_Gewaesserachse"';
COMMENT ON COLUMN ax_gewaesserachse.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gewaesserachse.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gewaesserachse.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gewaesserachse.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gewaesserachse.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gewaesserachse.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gewaesserachse.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gewaesserachse.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gewaesserachse.position IS 'position   GM_Curve 1';
COMMENT ON COLUMN ax_gewaesserachse.breitedesgewaessers IS 'breiteDesGewaessers   Integer 0..1';
COMMENT ON COLUMN ax_gewaesserachse.fliessrichtung IS 'fliessrichtung   Boolean 1';
COMMENT ON COLUMN ax_gewaesserachse.funktion IS 'funktion  enumeration AX_Funktion_Gewaesserachse 0..1';
COMMENT ON COLUMN ax_gewaesserachse.hydrologischesmerkmal IS 'hydrologischesMerkmal  enumeration AX_HydrologischesMerkmal_Gewaesserachse 0..1';
COMMENT ON COLUMN ax_gewaesserachse.zustand IS 'zustand  enumeration AX_Zustand_Kanal 0..1';

CREATE TABLE IF NOT EXISTS ax_strassenachse (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(LINESTRING) NOT NULL,
	anzahlderfahrstreifen integer,
	besonderefahrstreifen integer,
	breitederfahrbahn double precision,
	breitedesverkehrsweges integer,
	funktion integer,
	oberflaechenmaterial integer,
	verkehrsbedeutunginneroertlich integer,
	verkehrsbedeutungueberoertlich integer,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_strassenachse_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_strassenachse IS 'FeatureType: "AX_Strassenachse"';
COMMENT ON COLUMN ax_strassenachse.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_strassenachse.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_strassenachse.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_strassenachse.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_strassenachse.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_strassenachse.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_strassenachse.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_strassenachse.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_strassenachse.position IS 'position   GM_Curve 1';
COMMENT ON COLUMN ax_strassenachse.anzahlderfahrstreifen IS 'anzahlDerFahrstreifen   Integer 0..1';
COMMENT ON COLUMN ax_strassenachse.besonderefahrstreifen IS 'besondereFahrstreifen  enumeration AX_BesondereFahrstreifen 0..1';
COMMENT ON COLUMN ax_strassenachse.breitederfahrbahn IS 'breiteDerFahrbahn   Length 0..1';
COMMENT ON COLUMN ax_strassenachse.breitedesverkehrsweges IS 'breiteDesVerkehrsweges   Integer 0..1';
COMMENT ON COLUMN ax_strassenachse.funktion IS 'funktion  enumeration AX_Funktion_Strassenachse 0..1';
COMMENT ON COLUMN ax_strassenachse.oberflaechenmaterial IS 'oberflaechenmaterial  enumeration AX_Oberflaechenmaterial_Strasse 0..1';
COMMENT ON COLUMN ax_strassenachse.verkehrsbedeutunginneroertlich IS 'verkehrsbedeutungInneroertlich  enumeration AX_VerkehrsbedeutungInneroertlich 0..1';
COMMENT ON COLUMN ax_strassenachse.verkehrsbedeutungueberoertlich IS 'verkehrsbedeutungUeberoertlich  enumeration AX_VerkehrsbedeutungUeberoertlich 0..1';
COMMENT ON COLUMN ax_strassenachse.zustand IS 'zustand  enumeration AX_Zustand 0..1';

CREATE TABLE IF NOT EXISTS ax_bahnstrecke (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(LINESTRING) NOT NULL,
	anzahlderstreckengleise integer NOT NULL,
	bahnkategorie integer[] NOT NULL,
	elektrifizierung integer NOT NULL,
	name text,
	nummerderbahnstrecke text[],
	spurweite integer NOT NULL,
	zustand integer,
	zweitname text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_bahnstrecke_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_bahnstrecke IS 'FeatureType: "AX_Bahnstrecke"';
COMMENT ON COLUMN ax_bahnstrecke.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_bahnstrecke.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_bahnstrecke.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_bahnstrecke.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_bahnstrecke.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_bahnstrecke.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_bahnstrecke.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_bahnstrecke.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_bahnstrecke.position IS 'position   GM_Curve 1';
COMMENT ON COLUMN ax_bahnstrecke.anzahlderstreckengleise IS 'anzahlDerStreckengleise  enumeration AX_AnzahlDerStreckengleise 1';
COMMENT ON COLUMN ax_bahnstrecke.bahnkategorie IS 'bahnkategorie  enumeration AX_Bahnkategorie 1..*';
COMMENT ON COLUMN ax_bahnstrecke.elektrifizierung IS 'elektrifizierung  enumeration AX_Elektrifizierung 1';
COMMENT ON COLUMN ax_bahnstrecke.name IS 'name    0..1';
COMMENT ON COLUMN ax_bahnstrecke.nummerderbahnstrecke IS 'nummerDerBahnstrecke    0..*';
COMMENT ON COLUMN ax_bahnstrecke.spurweite IS 'spurweite  enumeration AX_Spurweite 1';
COMMENT ON COLUMN ax_bahnstrecke.zustand IS 'zustand  enumeration AX_Zustand 0..1';
COMMENT ON COLUMN ax_bahnstrecke.zweitname IS 'zweitname    0..1';

CREATE TABLE IF NOT EXISTS ax_fahrwegachse (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(LINESTRING) NOT NULL,
	befestigung integer,
	breitedesverkehrsweges integer,
	funktion integer NOT NULL,
	markierung integer,
	name text,
	strassenschluessel text,
	zweitname text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_fahrwegachse_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_fahrwegachse IS 'FeatureType: "AX_Fahrwegachse"';
COMMENT ON COLUMN ax_fahrwegachse.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_fahrwegachse.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_fahrwegachse.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_fahrwegachse.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_fahrwegachse.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_fahrwegachse.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_fahrwegachse.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_fahrwegachse.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_fahrwegachse.position IS 'position   GM_Curve 1';
COMMENT ON COLUMN ax_fahrwegachse.befestigung IS 'befestigung  enumeration AX_Befestigung_Fahrwegachse 0..1';
COMMENT ON COLUMN ax_fahrwegachse.breitedesverkehrsweges IS 'breiteDesVerkehrsweges   Integer 0..1';
COMMENT ON COLUMN ax_fahrwegachse.funktion IS 'funktion  enumeration AX_Funktion_Wegachse 1';
COMMENT ON COLUMN ax_fahrwegachse.markierung IS 'markierung  enumeration AX_Markierung_Wegachse 0..1';
COMMENT ON COLUMN ax_fahrwegachse.name IS 'name    0..1';
COMMENT ON COLUMN ax_fahrwegachse.strassenschluessel IS 'strassenschluessel    0..1';
COMMENT ON COLUMN ax_fahrwegachse.zweitname IS 'zweitname    0..1';

CREATE TABLE IF NOT EXISTS ax_fahrbahnachse (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(LINESTRING) NOT NULL,
	anzahlderfahrstreifen integer,
	besonderefahrstreifen integer,
	breitederfahrbahn double precision,
	funktion integer,
	oberflaechenmaterial integer,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_fahrbahnachse_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_fahrbahnachse IS 'FeatureType: "AX_Fahrbahnachse"';
COMMENT ON COLUMN ax_fahrbahnachse.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_fahrbahnachse.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_fahrbahnachse.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_fahrbahnachse.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_fahrbahnachse.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_fahrbahnachse.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_fahrbahnachse.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_fahrbahnachse.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_fahrbahnachse.position IS 'position   GM_Curve 1';
COMMENT ON COLUMN ax_fahrbahnachse.anzahlderfahrstreifen IS 'anzahlDerFahrstreifen   Integer 0..1';
COMMENT ON COLUMN ax_fahrbahnachse.besonderefahrstreifen IS 'besondereFahrstreifen  enumeration AX_BesondereFahrstreifen 0..1';
COMMENT ON COLUMN ax_fahrbahnachse.breitederfahrbahn IS 'breiteDerFahrbahn   Length 0..1';
COMMENT ON COLUMN ax_fahrbahnachse.funktion IS 'funktion  enumeration AX_Funktion_Fahrbahnachse 0..1';
COMMENT ON COLUMN ax_fahrbahnachse.oberflaechenmaterial IS 'oberflaechenmaterial  enumeration AX_Oberflaechenmaterial_Strasse 0..1';
COMMENT ON COLUMN ax_fahrbahnachse.zustand IS 'zustand  enumeration AX_Zustand 0..1';

CREATE TABLE IF NOT EXISTS ax_punktortta (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POINT) NOT NULL,
	hinweise character varying,
	kartendarstellung boolean,
	koordinatenstatus integer,
	genauigkeitsstufe character varying,
	genauigkeitswert text,
	herkunft text,
	lagezuverlaessigkeit boolean,
	vertrauenswuerdigkeit character varying,
	ueberpruefungsdatum date,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_punktortta_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_punktortta IS 'FeatureType: "AX_PunktortTA"';
COMMENT ON COLUMN ax_punktortta.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_punktortta.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_punktortta.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_punktortta.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_punktortta.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_punktortta.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_punktortta.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_punktortta.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_punktortta.position IS 'position   GM_Point 1';
COMMENT ON COLUMN ax_punktortta.hinweise IS 'hinweise   CharacterString 0..1';
COMMENT ON COLUMN ax_punktortta.kartendarstellung IS 'kartendarstellung   Boolean 0..1';
COMMENT ON COLUMN ax_punktortta.koordinatenstatus IS 'koordinatenstatus  enumeration AX_Koordinatenstatus_Punktort 0..1';
COMMENT ON COLUMN ax_punktortta.genauigkeitsstufe IS 'qualitaetsangaben AX_DQPunktort|genauigkeitsstufe enumeration AX_Genauigkeitsstufe_Punktort 0..1';
COMMENT ON COLUMN ax_punktortta.genauigkeitswert IS 'qualitaetsangaben AX_DQPunktort|genauigkeitswert  DQ_RelativeInternalPositionalAccuracy 0..1';
COMMENT ON COLUMN ax_punktortta.herkunft IS 'qualitaetsangaben AX_DQPunktort|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_punktortta.lagezuverlaessigkeit IS 'qualitaetsangaben AX_DQPunktort|lagezuverlaessigkeit  Boolean 0..1';
COMMENT ON COLUMN ax_punktortta.vertrauenswuerdigkeit IS 'qualitaetsangaben AX_DQPunktort|vertrauenswuerdigkeit enumeration AX_Vertrauenswuerdigkeit_Punktort 0..1';
COMMENT ON COLUMN ax_punktortta.ueberpruefungsdatum IS 'ueberpruefungsdatum   Date 0..1';

CREATE TABLE IF NOT EXISTS ax_stehendesgewaesser (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	bezeichnung text,
	funktion integer,
	gewaesserkennziffer text,
	hydrologischesmerkmal integer,
	unverschluesselt text,
	gemeinde text,
	kreis text,
	lage text,
	land text,
	regierungsbezirk text,
	schifffahrtskategorie integer,
	widmung integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_stehendesgewaesser_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_stehendesgewaesser IS 'FeatureType: "AX_StehendesGewaesser"';
COMMENT ON COLUMN ax_stehendesgewaesser.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_stehendesgewaesser.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_stehendesgewaesser.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_stehendesgewaesser.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_stehendesgewaesser.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_stehendesgewaesser.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_stehendesgewaesser.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_stehendesgewaesser.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_stehendesgewaesser.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_stehendesgewaesser.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_stehendesgewaesser.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_stehendesgewaesser.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_stehendesgewaesser.funktion IS 'funktion  enumeration AX_Funktion_StehendesGewaesser 0..1';
COMMENT ON COLUMN ax_stehendesgewaesser.gewaesserkennziffer IS 'gewaesserkennziffer    0..1';
COMMENT ON COLUMN ax_stehendesgewaesser.hydrologischesmerkmal IS 'hydrologischesMerkmal  enumeration AX_HydrologischesMerkmal_StehendesGewaesser 0..1';
COMMENT ON COLUMN ax_stehendesgewaesser.unverschluesselt IS 'name AX_Lagebezeichnung|unverschluesselt   1';
COMMENT ON COLUMN ax_stehendesgewaesser.gemeinde IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|gemeinde   1';
COMMENT ON COLUMN ax_stehendesgewaesser.kreis IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|kreis   1';
COMMENT ON COLUMN ax_stehendesgewaesser.lage IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|lage   1';
COMMENT ON COLUMN ax_stehendesgewaesser.land IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|land   1';
COMMENT ON COLUMN ax_stehendesgewaesser.regierungsbezirk IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_stehendesgewaesser.schifffahrtskategorie IS 'schifffahrtskategorie  enumeration AX_Schifffahrtskategorie 0..1';
COMMENT ON COLUMN ax_stehendesgewaesser.widmung IS 'widmung  enumeration AX_Widmung_StehendesGewaesser 0..1';

CREATE TABLE IF NOT EXISTS ax_meer (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	bezeichnung text,
	funktion integer,
	unverschluesselt text,
	gemeinde text,
	kreis text,
	lage text,
	land text,
	regierungsbezirk text,
	tidemerkmal integer,
	zweitname text[],
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_meer_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_meer IS 'FeatureType: "AX_Meer"';
COMMENT ON COLUMN ax_meer.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_meer.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_meer.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_meer.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_meer.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_meer.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_meer.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_meer.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_meer.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_meer.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_meer.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_meer.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_meer.funktion IS 'funktion  enumeration AX_Funktion_Meer 0..1';
COMMENT ON COLUMN ax_meer.unverschluesselt IS 'name AX_Lagebezeichnung|unverschluesselt   1';
COMMENT ON COLUMN ax_meer.gemeinde IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|gemeinde   1';
COMMENT ON COLUMN ax_meer.kreis IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|kreis   1';
COMMENT ON COLUMN ax_meer.lage IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|lage   1';
COMMENT ON COLUMN ax_meer.land IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|land   1';
COMMENT ON COLUMN ax_meer.regierungsbezirk IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_meer.tidemerkmal IS 'tidemerkmal  enumeration AX_Tidemerkmal_Meer 0..1';
COMMENT ON COLUMN ax_meer.zweitname IS 'zweitname    0..*';

CREATE TABLE IF NOT EXISTS ax_fliessgewaesser (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	funktion integer,
	hydrologischesmerkmal integer,
	unverschluesselt text,
	gemeinde text,
	kreis text,
	lage text,
	land text,
	regierungsbezirk text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_fliessgewaesser_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_fliessgewaesser IS 'FeatureType: "AX_Fliessgewaesser"';
COMMENT ON COLUMN ax_fliessgewaesser.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_fliessgewaesser.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_fliessgewaesser.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_fliessgewaesser.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_fliessgewaesser.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_fliessgewaesser.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_fliessgewaesser.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_fliessgewaesser.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_fliessgewaesser.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_fliessgewaesser.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_fliessgewaesser.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_fliessgewaesser.funktion IS 'funktion  enumeration AX_Funktion_Fliessgewaesser 0..1';
COMMENT ON COLUMN ax_fliessgewaesser.hydrologischesmerkmal IS 'hydrologischesMerkmal  enumeration AX_HydrologischesMerkmal_Fliessgewaesser 0..1';
COMMENT ON COLUMN ax_fliessgewaesser.unverschluesselt IS 'name AX_Lagebezeichnung|unverschluesselt   1';
COMMENT ON COLUMN ax_fliessgewaesser.gemeinde IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|gemeinde   1';
COMMENT ON COLUMN ax_fliessgewaesser.kreis IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|kreis   1';
COMMENT ON COLUMN ax_fliessgewaesser.lage IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|lage   1';
COMMENT ON COLUMN ax_fliessgewaesser.land IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|land   1';
COMMENT ON COLUMN ax_fliessgewaesser.regierungsbezirk IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_fliessgewaesser.zustand IS 'zustand  enumeration AX_Zustand_Kanal 0..1';

CREATE TABLE IF NOT EXISTS ax_hafenbecken (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	funktion integer,
	unverschluesselt text,
	gemeinde text,
	kreis text,
	lage text,
	land text,
	regierungsbezirk text,
	nutzung integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_hafenbecken_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_hafenbecken IS 'FeatureType: "AX_Hafenbecken"';
COMMENT ON COLUMN ax_hafenbecken.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_hafenbecken.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_hafenbecken.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_hafenbecken.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_hafenbecken.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_hafenbecken.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_hafenbecken.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_hafenbecken.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_hafenbecken.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_hafenbecken.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_hafenbecken.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_hafenbecken.funktion IS 'funktion  enumeration AX_Funktion_Hafenbecken 0..1';
COMMENT ON COLUMN ax_hafenbecken.unverschluesselt IS 'name AX_Lagebezeichnung|unverschluesselt   1';
COMMENT ON COLUMN ax_hafenbecken.gemeinde IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|gemeinde   1';
COMMENT ON COLUMN ax_hafenbecken.kreis IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|kreis   1';
COMMENT ON COLUMN ax_hafenbecken.lage IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|lage   1';
COMMENT ON COLUMN ax_hafenbecken.land IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|land   1';
COMMENT ON COLUMN ax_hafenbecken.regierungsbezirk IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_hafenbecken.nutzung IS 'nutzung  enumeration AX_Nutzung_Hafenbecken 0..1';

CREATE TABLE IF NOT EXISTS ax_bergbaubetrieb (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	abbaugut integer,
	bezeichnung text,
	name text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_bergbaubetrieb_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_bergbaubetrieb IS 'FeatureType: "AX_Bergbaubetrieb"';
COMMENT ON COLUMN ax_bergbaubetrieb.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_bergbaubetrieb.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_bergbaubetrieb.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_bergbaubetrieb.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_bergbaubetrieb.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_bergbaubetrieb.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_bergbaubetrieb.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_bergbaubetrieb.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_bergbaubetrieb.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_bergbaubetrieb.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_bergbaubetrieb.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_bergbaubetrieb.abbaugut IS 'abbaugut  enumeration AX_Abbaugut_Bergbaubetrieb 0..1';
COMMENT ON COLUMN ax_bergbaubetrieb.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_bergbaubetrieb.name IS 'name    0..1';
COMMENT ON COLUMN ax_bergbaubetrieb.zustand IS 'zustand  enumeration AX_Zustand_Bergbaubetrieb 0..1';

CREATE TABLE IF NOT EXISTS ax_friedhof (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	funktion integer,
	name text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_friedhof_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_friedhof IS 'FeatureType: "AX_Friedhof"';
COMMENT ON COLUMN ax_friedhof.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_friedhof.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_friedhof.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_friedhof.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_friedhof.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_friedhof.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_friedhof.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_friedhof.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_friedhof.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_friedhof.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_friedhof.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_friedhof.funktion IS 'funktion  enumeration AX_Funktion_Friedhof 0..1';
COMMENT ON COLUMN ax_friedhof.name IS 'name    0..1';
COMMENT ON COLUMN ax_friedhof.zustand IS 'zustand  enumeration AX_Zustand_Friedhof 0..1';

CREATE TABLE IF NOT EXISTS ax_flaechegemischternutzung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	artderbebauung integer,
	funktion integer,
	name text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_flaechegemischternutzung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_flaechegemischternutzung IS 'FeatureType: "AX_FlaecheGemischterNutzung"';
COMMENT ON COLUMN ax_flaechegemischternutzung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_flaechegemischternutzung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_flaechegemischternutzung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_flaechegemischternutzung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_flaechegemischternutzung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_flaechegemischternutzung.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_flaechegemischternutzung.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_flaechegemischternutzung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_flaechegemischternutzung.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_flaechegemischternutzung.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_flaechegemischternutzung.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_flaechegemischternutzung.artderbebauung IS 'artDerBebauung  enumeration AX_ArtDerBebauung_FlaecheGemischterNutzung 0..1';
COMMENT ON COLUMN ax_flaechegemischternutzung.funktion IS 'funktion  enumeration AX_Funktion_FlaecheGemischterNutzung 0..1';
COMMENT ON COLUMN ax_flaechegemischternutzung.name IS 'name    0..1';
COMMENT ON COLUMN ax_flaechegemischternutzung.zustand IS 'zustand  enumeration AX_Zustand_FlaecheGemischterNutzung 0..1';

CREATE TABLE IF NOT EXISTS ax_wohnbauflaeche (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	artderbebauung integer,
	name text,
	zustand integer,
	zweitname text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_wohnbauflaeche_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_wohnbauflaeche IS 'FeatureType: "AX_Wohnbauflaeche"';
COMMENT ON COLUMN ax_wohnbauflaeche.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_wohnbauflaeche.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_wohnbauflaeche.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_wohnbauflaeche.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_wohnbauflaeche.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_wohnbauflaeche.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_wohnbauflaeche.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_wohnbauflaeche.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_wohnbauflaeche.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_wohnbauflaeche.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_wohnbauflaeche.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_wohnbauflaeche.artderbebauung IS 'artDerBebauung  enumeration AX_ArtDerBebauung_Wohnbauflaeche 0..1';
COMMENT ON COLUMN ax_wohnbauflaeche.name IS 'name    0..1';
COMMENT ON COLUMN ax_wohnbauflaeche.zustand IS 'zustand  enumeration AX_Zustand_Wohnbauflaeche 0..1';
COMMENT ON COLUMN ax_wohnbauflaeche.zweitname IS 'zweitname    0..1';

CREATE TABLE IF NOT EXISTS ax_flaechebesondererfunktionalerpraegung (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	artderbebauung integer,
	funktion integer,
	name text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_flaechebesondererfunktionalerpraegung_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_flaechebesondererfunktionalerpraegung IS 'FeatureType: "AX_FlaecheBesondererFunktionalerPraegung"';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.artderbebauung IS 'artDerBebauung  enumeration AX_ArtDerBebauung_FlaecheBesondererFunktionalerPraegung 0..1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.funktion IS 'funktion  enumeration AX_Funktion_FlaecheBesondererFunktionalerPraegung 0..1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.name IS 'name    0..1';
COMMENT ON COLUMN ax_flaechebesondererfunktionalerpraegung.zustand IS 'zustand  enumeration AX_Zustand_FlaecheBesondererFunktionalerPraegung 0..1';

CREATE TABLE IF NOT EXISTS ax_industrieundgewerbeflaeche (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	bezeichnung text,
	foerdergut integer,
	funktion integer,
	lagergut integer,
	name text,
	primaerenergie integer,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_industrieundgewerbeflaeche_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_industrieundgewerbeflaeche IS 'FeatureType: "AX_IndustrieUndGewerbeflaeche"';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.foerdergut IS 'foerdergut  enumeration AX_Foerdergut_IndustrieUndGewerbeflaeche 0..1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.funktion IS 'funktion  enumeration AX_Funktion_IndustrieUndGewerbeflaeche 0..1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.lagergut IS 'lagergut  enumeration AX_Lagergut_IndustrieUndGewerbeflaeche 0..1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.name IS 'name    0..1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.primaerenergie IS 'primaerenergie  enumeration AX_Primaerenergie_IndustrieUndGewerbeflaeche 0..1';
COMMENT ON COLUMN ax_industrieundgewerbeflaeche.zustand IS 'zustand  enumeration AX_Zustand_IndustrieUndGewerbeflaeche 0..1';

CREATE TABLE IF NOT EXISTS ax_siedlungsflaeche (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	artderbebauung integer,
	name text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_siedlungsflaeche_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_siedlungsflaeche IS 'FeatureType: "AX_Siedlungsflaeche"';
COMMENT ON COLUMN ax_siedlungsflaeche.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_siedlungsflaeche.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_siedlungsflaeche.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_siedlungsflaeche.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_siedlungsflaeche.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_siedlungsflaeche.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_siedlungsflaeche.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_siedlungsflaeche.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_siedlungsflaeche.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_siedlungsflaeche.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_siedlungsflaeche.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_siedlungsflaeche.artderbebauung IS 'artDerBebauung  enumeration AX_ArtDerBebauung_Siedlungsflaeche 0..1';
COMMENT ON COLUMN ax_siedlungsflaeche.name IS 'name    0..1';

CREATE TABLE IF NOT EXISTS ax_tagebaugrubesteinbruch (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	abbaugut integer,
	bezeichnung text,
	name text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_tagebaugrubesteinbruch_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_tagebaugrubesteinbruch IS 'FeatureType: "AX_TagebauGrubeSteinbruch"';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.abbaugut IS 'abbaugut  enumeration AX_Abbaugut_TagebauGrubeSteinbruch 0..1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.name IS 'name    0..1';
COMMENT ON COLUMN ax_tagebaugrubesteinbruch.zustand IS 'zustand  enumeration AX_Zustand_TagebauGrubeSteinbruch 0..1';

CREATE TABLE IF NOT EXISTS ax_sportfreizeitunderholungsflaeche (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	bezeichnung text[],
	funktion integer,
	name text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_sportfreizeitunderholungsflaeche_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_sportfreizeitunderholungsflaeche IS 'FeatureType: "AX_SportFreizeitUndErholungsflaeche"';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.bezeichnung IS 'bezeichnung    0..*';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.funktion IS 'funktion  enumeration AX_Funktion_SportFreizeitUndErholungsflaeche 0..1';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.name IS 'name    0..1';
COMMENT ON COLUMN ax_sportfreizeitunderholungsflaeche.zustand IS 'zustand  enumeration AX_Zustand_SportFreizeitUndErholungsflaeche 0..1';

CREATE TABLE IF NOT EXISTS ax_halde (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	lagergut integer,
	name text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_halde_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_halde IS 'FeatureType: "AX_Halde"';
COMMENT ON COLUMN ax_halde.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_halde.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_halde.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_halde.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_halde.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_halde.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_halde.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_halde.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_halde.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_halde.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_halde.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_halde.lagergut IS 'lagergut  enumeration AX_Lagergut_Halde 0..1';
COMMENT ON COLUMN ax_halde.name IS 'name    0..1';
COMMENT ON COLUMN ax_halde.zustand IS 'zustand  enumeration AX_Zustand_Halde 0..1';

CREATE TABLE IF NOT EXISTS ax_flaechezurzeitunbestimmbar (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_flaechezurzeitunbestimmbar_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_flaechezurzeitunbestimmbar IS 'FeatureType: "AX_FlaecheZurZeitUnbestimmbar"';
COMMENT ON COLUMN ax_flaechezurzeitunbestimmbar.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_flaechezurzeitunbestimmbar.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_flaechezurzeitunbestimmbar.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_flaechezurzeitunbestimmbar.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_flaechezurzeitunbestimmbar.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_flaechezurzeitunbestimmbar.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_flaechezurzeitunbestimmbar.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_flaechezurzeitunbestimmbar.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_flaechezurzeitunbestimmbar.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_flaechezurzeitunbestimmbar.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_flaechezurzeitunbestimmbar.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';

CREATE TABLE IF NOT EXISTS ax_sumpf (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	name text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_sumpf_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_sumpf IS 'FeatureType: "AX_Sumpf"';
COMMENT ON COLUMN ax_sumpf.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_sumpf.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_sumpf.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_sumpf.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_sumpf.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_sumpf.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_sumpf.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_sumpf.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_sumpf.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_sumpf.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_sumpf.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_sumpf.name IS 'name    0..1';

CREATE TABLE IF NOT EXISTS ax_unlandvegetationsloseflaeche (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	funktion integer,
	name text,
	oberflaechenmaterial integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_unlandvegetationsloseflaeche_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_unlandvegetationsloseflaeche IS 'FeatureType: "AX_UnlandVegetationsloseFlaeche"';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.funktion IS 'funktion  enumeration AX_Funktion_UnlandVegetationsloseFlaeche 0..1';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.name IS 'name    0..1';
COMMENT ON COLUMN ax_unlandvegetationsloseflaeche.oberflaechenmaterial IS 'oberflaechenmaterial  enumeration AX_Oberflaechenmaterial_UnlandVegetationsloseFlaeche 0..1';

CREATE TABLE IF NOT EXISTS ax_gehoelz (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	funktion integer,
	name text,
	vegetationsmerkmal integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_gehoelz_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_gehoelz IS 'FeatureType: "AX_Gehoelz"';
COMMENT ON COLUMN ax_gehoelz.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_gehoelz.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_gehoelz.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_gehoelz.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_gehoelz.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_gehoelz.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_gehoelz.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_gehoelz.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_gehoelz.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_gehoelz.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_gehoelz.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_gehoelz.funktion IS 'funktion  enumeration AX_Funktion_Gehoelz 0..1';
COMMENT ON COLUMN ax_gehoelz.name IS 'name    0..1';
COMMENT ON COLUMN ax_gehoelz.vegetationsmerkmal IS 'vegetationsmerkmal  enumeration AX_Vegetationsmerkmal_Gehoelz 0..1';

CREATE TABLE IF NOT EXISTS ax_wald (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	bezeichnung text,
	name text,
	vegetationsmerkmal integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_wald_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_wald IS 'FeatureType: "AX_Wald"';
COMMENT ON COLUMN ax_wald.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_wald.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_wald.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_wald.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_wald.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_wald.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_wald.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_wald.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_wald.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_wald.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_wald.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_wald.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_wald.name IS 'name    0..1';
COMMENT ON COLUMN ax_wald.vegetationsmerkmal IS 'vegetationsmerkmal  enumeration AX_Vegetationsmerkmal_Wald 0..1';

CREATE TABLE IF NOT EXISTS ax_heide (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	name text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_heide_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_heide IS 'FeatureType: "AX_Heide"';
COMMENT ON COLUMN ax_heide.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_heide.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_heide.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_heide.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_heide.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_heide.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_heide.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_heide.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_heide.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_heide.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_heide.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_heide.name IS 'name    0..1';

CREATE TABLE IF NOT EXISTS ax_moor (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	name text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_moor_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_moor IS 'FeatureType: "AX_Moor"';
COMMENT ON COLUMN ax_moor.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_moor.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_moor.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_moor.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_moor.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_moor.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_moor.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_moor.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_moor.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_moor.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_moor.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_moor.name IS 'name    0..1';

CREATE TABLE IF NOT EXISTS ax_landwirtschaft (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	fachdatenobjekt_name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	name text,
	vegetationsmerkmal integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_landwirtschaft_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_landwirtschaft IS 'FeatureType: "AX_Landwirtschaft"';
COMMENT ON COLUMN ax_landwirtschaft.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_landwirtschaft.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_landwirtschaft.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_landwirtschaft.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_landwirtschaft.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_landwirtschaft.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_landwirtschaft.fachdatenobjekt_name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_landwirtschaft.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_landwirtschaft.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_landwirtschaft.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_landwirtschaft.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_landwirtschaft.name IS 'name    0..1';
COMMENT ON COLUMN ax_landwirtschaft.vegetationsmerkmal IS 'vegetationsmerkmal  enumeration AX_Vegetationsmerkmal_Landwirtschaft 0..1';

CREATE TABLE IF NOT EXISTS ax_bahnverkehr (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	bahnkategorie integer[],
	unverschluesselt text,
	gemeinde text,
	kreis text,
	lage text,
	land text,
	regierungsbezirk text,
	funktion integer,
	nummerderbahnstrecke text,
	zustand integer,
	zweitname text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_bahnverkehr_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_bahnverkehr IS 'FeatureType: "AX_Bahnverkehr"';
COMMENT ON COLUMN ax_bahnverkehr.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_bahnverkehr.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_bahnverkehr.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_bahnverkehr.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_bahnverkehr.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_bahnverkehr.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_bahnverkehr.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_bahnverkehr.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_bahnverkehr.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_bahnverkehr.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_bahnverkehr.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_bahnverkehr.bahnkategorie IS 'bahnkategorie  enumeration AX_Bahnkategorie 0..*';
COMMENT ON COLUMN ax_bahnverkehr.unverschluesselt IS 'bezeichnung AX_Lagebezeichnung|unverschluesselt   1';
COMMENT ON COLUMN ax_bahnverkehr.gemeinde IS 'bezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|gemeinde   1';
COMMENT ON COLUMN ax_bahnverkehr.kreis IS 'bezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|kreis   1';
COMMENT ON COLUMN ax_bahnverkehr.lage IS 'bezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|lage   1';
COMMENT ON COLUMN ax_bahnverkehr.land IS 'bezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|land   1';
COMMENT ON COLUMN ax_bahnverkehr.regierungsbezirk IS 'bezeichnung AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_bahnverkehr.funktion IS 'funktion  enumeration AX_Funktion_Bahnverkehr 0..1';
COMMENT ON COLUMN ax_bahnverkehr.nummerderbahnstrecke IS 'nummerDerBahnstrecke    0..1';
COMMENT ON COLUMN ax_bahnverkehr.zustand IS 'zustand  enumeration AX_Zustand_Bahnverkehr 0..1';
COMMENT ON COLUMN ax_bahnverkehr.zweitname IS 'zweitname    0..1';

CREATE TABLE IF NOT EXISTS ax_weg (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	bezeichnung text,
	funktion integer,
	unverschluesselt text,
	gemeinde text,
	kreis text,
	lage text,
	land text,
	regierungsbezirk text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_weg_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_weg IS 'FeatureType: "AX_Weg"';
COMMENT ON COLUMN ax_weg.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_weg.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_weg.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_weg.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_weg.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_weg.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_weg.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_weg.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_weg.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_weg.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_weg.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_weg.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_weg.funktion IS 'funktion  enumeration AX_Funktion_Weg 0..1';
COMMENT ON COLUMN ax_weg.unverschluesselt IS 'name AX_Lagebezeichnung|unverschluesselt   1';
COMMENT ON COLUMN ax_weg.gemeinde IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|gemeinde   1';
COMMENT ON COLUMN ax_weg.kreis IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|kreis   1';
COMMENT ON COLUMN ax_weg.lage IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|lage   1';
COMMENT ON COLUMN ax_weg.land IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|land   1';
COMMENT ON COLUMN ax_weg.regierungsbezirk IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|regierungsbezirk   0..1';

CREATE TABLE IF NOT EXISTS ax_schiffsverkehr (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	funktion integer,
	unverschluesselt text,
	gemeinde text,
	kreis text,
	lage text,
	land text,
	regierungsbezirk text,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_schiffsverkehr_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_schiffsverkehr IS 'FeatureType: "AX_Schiffsverkehr"';
COMMENT ON COLUMN ax_schiffsverkehr.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_schiffsverkehr.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_schiffsverkehr.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_schiffsverkehr.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_schiffsverkehr.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_schiffsverkehr.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_schiffsverkehr.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_schiffsverkehr.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_schiffsverkehr.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_schiffsverkehr.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_schiffsverkehr.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_schiffsverkehr.funktion IS 'funktion  enumeration AX_Funktion_Schiffsverkehr 0..1';
COMMENT ON COLUMN ax_schiffsverkehr.unverschluesselt IS 'name AX_Lagebezeichnung|unverschluesselt   1';
COMMENT ON COLUMN ax_schiffsverkehr.gemeinde IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|gemeinde   1';
COMMENT ON COLUMN ax_schiffsverkehr.kreis IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|kreis   1';
COMMENT ON COLUMN ax_schiffsverkehr.lage IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|lage   1';
COMMENT ON COLUMN ax_schiffsverkehr.land IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|land   1';
COMMENT ON COLUMN ax_schiffsverkehr.regierungsbezirk IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_schiffsverkehr.zustand IS 'zustand  enumeration AX_Zustand_Schiffsverkehr 0..1';

CREATE TABLE IF NOT EXISTS ax_flugverkehr (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	art integer,
	bezeichnung text,
	funktion integer,
	unverschluesselt text,
	gemeinde text,
	kreis text,
	lage text,
	land text,
	regierungsbezirk text,
	nutzung integer,
	zustand integer,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_flugverkehr_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_flugverkehr IS 'FeatureType: "AX_Flugverkehr"';
COMMENT ON COLUMN ax_flugverkehr.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_flugverkehr.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_flugverkehr.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_flugverkehr.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_flugverkehr.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_flugverkehr.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_flugverkehr.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_flugverkehr.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_flugverkehr.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_flugverkehr.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_flugverkehr.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_flugverkehr.art IS 'art  enumeration AX_Art_Flugverkehr 0..1';
COMMENT ON COLUMN ax_flugverkehr.bezeichnung IS 'bezeichnung    0..1';
COMMENT ON COLUMN ax_flugverkehr.funktion IS 'funktion  enumeration AX_Funktion_Flugverkehr 0..1';
COMMENT ON COLUMN ax_flugverkehr.unverschluesselt IS 'name AX_Lagebezeichnung|unverschluesselt   1';
COMMENT ON COLUMN ax_flugverkehr.gemeinde IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|gemeinde   1';
COMMENT ON COLUMN ax_flugverkehr.kreis IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|kreis   1';
COMMENT ON COLUMN ax_flugverkehr.lage IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|lage   1';
COMMENT ON COLUMN ax_flugverkehr.land IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|land   1';
COMMENT ON COLUMN ax_flugverkehr.regierungsbezirk IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_flugverkehr.nutzung IS 'nutzung  enumeration AX_Nutzung_Flugverkehr 0..1';
COMMENT ON COLUMN ax_flugverkehr.zustand IS 'zustand  enumeration AX_Zustand_Flugverkehr 0..1';

CREATE TABLE IF NOT EXISTS ax_platz (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	funktion integer,
	unverschluesselt text,
	gemeinde text,
	kreis text,
	lage text,
	land text,
	regierungsbezirk text,
	strassenschluessel text,
	zweitname text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_platz_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_platz IS 'FeatureType: "AX_Platz"';
COMMENT ON COLUMN ax_platz.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_platz.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_platz.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_platz.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_platz.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_platz.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_platz.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_platz.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_platz.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_platz.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_platz.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_platz.funktion IS 'funktion  enumeration AX_Funktion_Platz 0..1';
COMMENT ON COLUMN ax_platz.unverschluesselt IS 'name AX_Lagebezeichnung|unverschluesselt   1';
COMMENT ON COLUMN ax_platz.gemeinde IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|gemeinde   1';
COMMENT ON COLUMN ax_platz.kreis IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|kreis   1';
COMMENT ON COLUMN ax_platz.lage IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|lage   1';
COMMENT ON COLUMN ax_platz.land IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|land   1';
COMMENT ON COLUMN ax_platz.regierungsbezirk IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_platz.strassenschluessel IS 'strassenschluessel    0..1';
COMMENT ON COLUMN ax_platz.zweitname IS 'zweitname    0..1';

CREATE TABLE IF NOT EXISTS ax_strassenverkehr (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	position geometry(POLYGON) NOT NULL,
	datumderletztenueberpruefung timestamp without time zone,
	herkunft text,
	funktion integer,
	unverschluesselt text,
	gemeinde text,
	kreis text,
	lage text,
	land text,
	regierungsbezirk text,
	zustand integer,
	zweitname text,
	istabgeleitetaus text[],
	traegtbeizu text[],
	hatdirektunten text[],
	inverszu_hatdirektunten text[],
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ax_strassenverkehr_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ax_strassenverkehr IS 'FeatureType: "AX_Strassenverkehr"';
COMMENT ON COLUMN ax_strassenverkehr.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ax_strassenverkehr.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ax_strassenverkehr.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ax_strassenverkehr.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ax_strassenverkehr.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ax_strassenverkehr.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ax_strassenverkehr.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ax_strassenverkehr.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ax_strassenverkehr.position IS 'position   GM_Surface 1';
COMMENT ON COLUMN ax_strassenverkehr.datumderletztenueberpruefung IS 'datumDerLetztenUeberpruefung   DateTime 0..1';
COMMENT ON COLUMN ax_strassenverkehr.herkunft IS 'qualitaetsangaben AX_DQMitDatenerhebung|herkunft  LI_Lineage 0..1';
COMMENT ON COLUMN ax_strassenverkehr.funktion IS 'funktion  enumeration AX_Funktion_Strasse 0..1';
COMMENT ON COLUMN ax_strassenverkehr.unverschluesselt IS 'name AX_Lagebezeichnung|unverschluesselt   1';
COMMENT ON COLUMN ax_strassenverkehr.gemeinde IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|gemeinde   1';
COMMENT ON COLUMN ax_strassenverkehr.kreis IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|kreis   1';
COMMENT ON COLUMN ax_strassenverkehr.lage IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|lage   1';
COMMENT ON COLUMN ax_strassenverkehr.land IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|land   1';
COMMENT ON COLUMN ax_strassenverkehr.regierungsbezirk IS 'name AX_Lagebezeichnung|verschluesselt|AX_VerschluesselteLagebezeichnung|regierungsbezirk   0..1';
COMMENT ON COLUMN ax_strassenverkehr.zustand IS 'zustand  enumeration AX_Zustand_Strasse 0..1';
COMMENT ON COLUMN ax_strassenverkehr.zweitname IS 'zweitname    0..1';

CREATE TABLE IF NOT EXISTS ta_compositesolidcomponent_3d (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	levelofdetail text NOT NULL,
	position geometry(MULTIPOLYGON) NOT NULL,
	detailliert  text,
	generalisiert  text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ta_compositesolidcomponent_3d_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ta_compositesolidcomponent_3d IS 'FeatureType: "TA_CompositeSolidComponent_3D"';
COMMENT ON COLUMN ta_compositesolidcomponent_3d.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ta_compositesolidcomponent_3d.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ta_compositesolidcomponent_3d.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ta_compositesolidcomponent_3d.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ta_compositesolidcomponent_3d.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ta_compositesolidcomponent_3d.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ta_compositesolidcomponent_3d.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ta_compositesolidcomponent_3d.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ta_compositesolidcomponent_3d.levelofdetail IS 'levelOfDetail  codelist AA_LevelOfDetail 1';
COMMENT ON COLUMN ta_compositesolidcomponent_3d.position IS 'position   GM_CompositeSolid 1';

CREATE TABLE IF NOT EXISTS ta_surfacecomponent_3d (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	levelofdetail text NOT NULL,
	position geometry(POLYGON) NOT NULL,
	detailliert  text,
	generalisiert  text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ta_surfacecomponent_3d_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ta_surfacecomponent_3d IS 'FeatureType: "TA_SurfaceComponent_3D"';
COMMENT ON COLUMN ta_surfacecomponent_3d.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ta_surfacecomponent_3d.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ta_surfacecomponent_3d.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ta_surfacecomponent_3d.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ta_surfacecomponent_3d.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ta_surfacecomponent_3d.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ta_surfacecomponent_3d.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ta_surfacecomponent_3d.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ta_surfacecomponent_3d.levelofdetail IS 'levelOfDetail  codelist AA_LevelOfDetail 1';
COMMENT ON COLUMN ta_surfacecomponent_3d.position IS 'position   GM_Surface 1';

CREATE TABLE IF NOT EXISTS ta_curvecomponent_3d (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	levelofdetail text NOT NULL,
	position geometry(LINESTRING) NOT NULL,
	detailliert  text,
	generalisiert  text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ta_curvecomponent_3d_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ta_curvecomponent_3d IS 'FeatureType: "TA_CurveComponent_3D"';
COMMENT ON COLUMN ta_curvecomponent_3d.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ta_curvecomponent_3d.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ta_curvecomponent_3d.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ta_curvecomponent_3d.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ta_curvecomponent_3d.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ta_curvecomponent_3d.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ta_curvecomponent_3d.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ta_curvecomponent_3d.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ta_curvecomponent_3d.levelofdetail IS 'levelOfDetail  codelist AA_LevelOfDetail 1';
COMMENT ON COLUMN ta_curvecomponent_3d.position IS 'position   GM_Curve 1';

CREATE TABLE IF NOT EXISTS ta_pointcomponent_3d (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	levelofdetail text NOT NULL,
	position geometry(POINT) NOT NULL,
	detailliert  text,
	generalisiert  text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT ta_pointcomponent_3d_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ta_pointcomponent_3d IS 'FeatureType: "TA_PointComponent_3D"';
COMMENT ON COLUMN ta_pointcomponent_3d.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ta_pointcomponent_3d.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ta_pointcomponent_3d.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ta_pointcomponent_3d.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ta_pointcomponent_3d.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ta_pointcomponent_3d.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ta_pointcomponent_3d.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ta_pointcomponent_3d.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ta_pointcomponent_3d.levelofdetail IS 'levelOfDetail  codelist AA_LevelOfDetail 1';
COMMENT ON COLUMN ta_pointcomponent_3d.position IS 'position   GM_Point 1';

CREATE TABLE IF NOT EXISTS au_trianguliertesoberflaechenobjekt_3d (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	levelofdetail text NOT NULL,
	position geometry(MULTIPOLYGON) NOT NULL,
	detailliert  text,
	generalisiert  text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT au_trianguliertesoberflaechenobjekt_3d_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE au_trianguliertesoberflaechenobjekt_3d IS 'FeatureType: "AU_TrianguliertesOberflaechenObjekt_3D"';
COMMENT ON COLUMN au_trianguliertesoberflaechenobjekt_3d.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN au_trianguliertesoberflaechenobjekt_3d.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN au_trianguliertesoberflaechenobjekt_3d.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN au_trianguliertesoberflaechenobjekt_3d.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN au_trianguliertesoberflaechenobjekt_3d.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN au_trianguliertesoberflaechenobjekt_3d.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN au_trianguliertesoberflaechenobjekt_3d.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN au_trianguliertesoberflaechenobjekt_3d.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN au_trianguliertesoberflaechenobjekt_3d.levelofdetail IS 'levelOfDetail  codelist AA_LevelOfDetail 1';
COMMENT ON COLUMN au_trianguliertesoberflaechenobjekt_3d.position IS 'position   GM_TriangulatedSurface 1';

CREATE TABLE IF NOT EXISTS au_mehrfachflaechenobjekt_3d (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	levelofdetail text NOT NULL,
	position geometry NOT NULL,
	detailliert  text,
	generalisiert  text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT au_mehrfachflaechenobjekt_3d_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE au_mehrfachflaechenobjekt_3d IS 'FeatureType: "AU_MehrfachFlaechenObjekt_3D"';
COMMENT ON COLUMN au_mehrfachflaechenobjekt_3d.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN au_mehrfachflaechenobjekt_3d.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN au_mehrfachflaechenobjekt_3d.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN au_mehrfachflaechenobjekt_3d.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN au_mehrfachflaechenobjekt_3d.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN au_mehrfachflaechenobjekt_3d.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN au_mehrfachflaechenobjekt_3d.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN au_mehrfachflaechenobjekt_3d.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN au_mehrfachflaechenobjekt_3d.levelofdetail IS 'levelOfDetail  codelist AA_LevelOfDetail 1';
COMMENT ON COLUMN au_mehrfachflaechenobjekt_3d.position IS 'position   GM_Object 1';

CREATE TABLE IF NOT EXISTS au_mehrfachlinienobjekt_3d (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	levelofdetail text NOT NULL,
	position geometry NOT NULL,
	detailliert  text,
	generalisiert  text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT au_mehrfachlinienobjekt_3d_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE au_mehrfachlinienobjekt_3d IS 'FeatureType: "AU_MehrfachLinienObjekt_3D"';
COMMENT ON COLUMN au_mehrfachlinienobjekt_3d.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN au_mehrfachlinienobjekt_3d.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN au_mehrfachlinienobjekt_3d.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN au_mehrfachlinienobjekt_3d.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN au_mehrfachlinienobjekt_3d.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN au_mehrfachlinienobjekt_3d.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN au_mehrfachlinienobjekt_3d.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN au_mehrfachlinienobjekt_3d.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN au_mehrfachlinienobjekt_3d.levelofdetail IS 'levelOfDetail  codelist AA_LevelOfDetail 1';
COMMENT ON COLUMN au_mehrfachlinienobjekt_3d.position IS 'position   GM_Object 1';

CREATE TABLE IF NOT EXISTS au_umringobjekt_3d (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	levelofdetail text NOT NULL,
	position geometry(MULTILINESTRING) NOT NULL,
	detailliert  text,
	generalisiert  text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT au_umringobjekt_3d_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE au_umringobjekt_3d IS 'FeatureType: "AU_UmringObjekt_3D"';
COMMENT ON COLUMN au_umringobjekt_3d.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN au_umringobjekt_3d.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN au_umringobjekt_3d.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN au_umringobjekt_3d.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN au_umringobjekt_3d.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN au_umringobjekt_3d.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN au_umringobjekt_3d.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN au_umringobjekt_3d.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN au_umringobjekt_3d.levelofdetail IS 'levelOfDetail  codelist AA_LevelOfDetail 1';
COMMENT ON COLUMN au_umringobjekt_3d.position IS 'position   GM_MultiCurve 1';

CREATE TABLE IF NOT EXISTS ap_kpo_3d (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	zeigtaufexternes_art character varying[],
	name text[],
	uri character varying[],
	levelofdetail text NOT NULL,
	position geometry(POINT) NOT NULL,
	art character varying,
	darstellungsprioritaet integer,
	dateityp integer,
	referenzzumfremdobjekt character varying,
	signaturnummer character varying,
	parameter double precision[],
	detailliert  text,
	generalisiert  text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
	dientzurdarstellungvon text[],
CONSTRAINT ap_kpo_3d_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE ap_kpo_3d IS 'FeatureType: "AP_KPO_3D"';
COMMENT ON COLUMN ap_kpo_3d.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN ap_kpo_3d.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN ap_kpo_3d.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN ap_kpo_3d.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN ap_kpo_3d.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN ap_kpo_3d.zeigtaufexternes_art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN ap_kpo_3d.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN ap_kpo_3d.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN ap_kpo_3d.levelofdetail IS 'levelOfDetail  codelist AA_LevelOfDetail 1';
COMMENT ON COLUMN ap_kpo_3d.position IS 'position   GM_Point 1';
COMMENT ON COLUMN ap_kpo_3d.art IS 'art   CharacterString 0..1';
COMMENT ON COLUMN ap_kpo_3d.darstellungsprioritaet IS 'darstellungsprioritaet   Integer 0..1';
COMMENT ON COLUMN ap_kpo_3d.dateityp IS 'dateiTyp  enumeration AP_DateiTyp_3D 0..1';
COMMENT ON COLUMN ap_kpo_3d.referenzzumfremdobjekt IS 'referenzZumFremdobjekt   URI 0..1';
COMMENT ON COLUMN ap_kpo_3d.signaturnummer IS 'signaturnummer   CharacterString 0..1';
COMMENT ON COLUMN ap_kpo_3d.parameter IS 'transformationsMatrix AP_TransformationsMatrix_3D|parameter  Real *';
COMMENT ON COLUMN ap_kpo_3d.dientzurdarstellungvon IS 'Assoziation zu: FeatureType AA_Objekt (aa_objekt) 0..*';

CREATE TABLE IF NOT EXISTS au_punkthaufenobjekt_3d (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	levelofdetail text NOT NULL,
	position geometry(MULTIPOINT) NOT NULL,
	detailliert  text,
	generalisiert  text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT au_punkthaufenobjekt_3d_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE au_punkthaufenobjekt_3d IS 'FeatureType: "AU_PunkthaufenObjekt_3D"';
COMMENT ON COLUMN au_punkthaufenobjekt_3d.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN au_punkthaufenobjekt_3d.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN au_punkthaufenobjekt_3d.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN au_punkthaufenobjekt_3d.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN au_punkthaufenobjekt_3d.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN au_punkthaufenobjekt_3d.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN au_punkthaufenobjekt_3d.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN au_punkthaufenobjekt_3d.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN au_punkthaufenobjekt_3d.levelofdetail IS 'levelOfDetail  codelist AA_LevelOfDetail 1';
COMMENT ON COLUMN au_punkthaufenobjekt_3d.position IS 'position   GM_MultiPoint 1';

CREATE TABLE IF NOT EXISTS au_koerperobjekt_3d (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	levelofdetail text NOT NULL,
	position geometry(MULTIPOLYGON) NOT NULL,
	detailliert  text,
	generalisiert  text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT au_koerperobjekt_3d_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE au_koerperobjekt_3d IS 'FeatureType: "AU_KoerperObjekt_3D"';
COMMENT ON COLUMN au_koerperobjekt_3d.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN au_koerperobjekt_3d.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN au_koerperobjekt_3d.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN au_koerperobjekt_3d.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN au_koerperobjekt_3d.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN au_koerperobjekt_3d.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN au_koerperobjekt_3d.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN au_koerperobjekt_3d.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN au_koerperobjekt_3d.levelofdetail IS 'levelOfDetail  codelist AA_LevelOfDetail 1';
COMMENT ON COLUMN au_koerperobjekt_3d.position IS 'position   GM_Solid 1';

CREATE TABLE IF NOT EXISTS au_geometrieobjekt_3d (
	ogc_fid serial NOT NULL,
	identifier character varying,
	gml_id text,
	anlass text[],
	beginnt timestamp without time zone NOT NULL,
	endet timestamp without time zone,
	advstandardmodell character varying[] NOT NULL,
	sonstigesmodell text[] NOT NULL,
	art character varying[],
	name text[],
	uri character varying[],
	levelofdetail text NOT NULL,
	position geometry NOT NULL,
	detailliert  text,
	generalisiert  text,
	istteilvon text[],
	inverszu_dientzurdarstellungvon_ap_lto text[],
	inverszu_dientzurdarstellungvon_ap_pto text[],
	inverszu_dientzurdarstellungvon_ap_ppo text[],
	inverszu_dientzurdarstellungvon_ap_lpo text[],
	inverszu_dientzurdarstellungvon_ap_fpo text[],
	inverszu_dientzurdarstellungvon_ap_darstellung text[],
	inverszu_dientzurdarstellungvon_ap_kpo_3d text[],
CONSTRAINT au_geometrieobjekt_3d_pkey PRIMARY KEY (gml_id)
) WITH OIDS;

COMMENT ON TABLE au_geometrieobjekt_3d IS 'FeatureType: "AU_GeometrieObjekt_3D"';
COMMENT ON COLUMN au_geometrieobjekt_3d.anlass IS 'anlass  codelist AA_Anlassart 0..*';
COMMENT ON COLUMN au_geometrieobjekt_3d.beginnt IS 'lebenszeitintervall AA_Lebenszeitintervall|beginnt  DateTime 1';
COMMENT ON COLUMN au_geometrieobjekt_3d.endet IS 'lebenszeitintervall AA_Lebenszeitintervall|endet  DateTime 0..1';
COMMENT ON COLUMN au_geometrieobjekt_3d.advstandardmodell IS 'modellart AA_Modellart|advStandardModell enumeration AA_AdVStandardModell 1';
COMMENT ON COLUMN au_geometrieobjekt_3d.sonstigesmodell IS 'modellart AA_Modellart|sonstigesModell codelist AA_WeitereModellart 1';
COMMENT ON COLUMN au_geometrieobjekt_3d.art IS 'zeigtAufExternes AA_Fachdatenverbindung|art  URI 1';
COMMENT ON COLUMN au_geometrieobjekt_3d.name IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|name   1';
COMMENT ON COLUMN au_geometrieobjekt_3d.uri IS 'zeigtAufExternes AA_Fachdatenverbindung|fachdatenobjekt|AA_Fachdatenobjekt|uri  URI 1';
COMMENT ON COLUMN au_geometrieobjekt_3d.levelofdetail IS 'levelOfDetail  codelist AA_LevelOfDetail 1';
COMMENT ON COLUMN au_geometrieobjekt_3d.position IS 'position   GM_Object 1';