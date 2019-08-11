  
SET search_path = gml_classes, public;
DROP SCHEMA gml_classes CASCADE;
CREATE SCHEMA gml_classes;
CREATE TABLE IF NOT EXISTS xp_textabschnitt (
  gml_id uuid primary key,
  refText uuid,
  text character varying,
  gesetzlicheGrundlage character varying,
  schluessel character varying
);
COMMENT ON COLUMN xp_textabschnitt.refText IS 'DataType XP_ExterneReferenz';

CREATE TABLE IF NOT EXISTS rp_textabschnitt (rechtscharakter character varying
)
INHERITS (xp_textabschnitt);
COMMENT ON COLUMN rp_textabschnitt.rechtscharakter IS 'Enumeration RP_Rechtscharakter';

CREATE TABLE IF NOT EXISTS xp_plan (
  gml_id uuid primary key,
  refExternalCodeList uuid,
  name character varying,
  nummer character varying,
  internalId character varying,
  beschreibung character varying,
  kommentar character varying,
  technHerstellDatum text,
  genehmigungsDatum text,
  untergangsDatum text,
  aendert uuid[],
  wurdeGeaendertVon uuid[],
  xPlanGMLVersion character varying,
  bezugshoehe double precision,
  raeumlicherGeltungsbereich geometry,
  verfahrensMerkmale uuid[],
  rechtsverbindlich uuid[],
  informell uuid[],
  hatGenerAttribut uuid[],
  refBeschreibung uuid[],
  refBegruendung uuid[],
  refLegende uuid[],
  refRechtsplan uuid[],
  refPlangrundlage uuid[]
);
COMMENT ON COLUMN xp_plan.refExternalCodeList IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_plan.aendert IS 'DataType XP_VerbundenerPlan';
COMMENT ON COLUMN xp_plan.wurdeGeaendertVon IS 'DataType XP_VerbundenerPlan';
COMMENT ON COLUMN xp_plan.raeumlicherGeltungsbereich IS 'Union XP_Flaechengeometrie';
COMMENT ON COLUMN xp_plan.verfahrensMerkmale IS 'DataType XP_VerfahrensMerkmal';
COMMENT ON COLUMN xp_plan.rechtsverbindlich IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_plan.informell IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_plan.hatGenerAttribut IS 'DataType XP_GenerAttribut';
COMMENT ON COLUMN xp_plan.refBeschreibung IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_plan.refBegruendung IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_plan.refLegende IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_plan.refRechtsplan IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_plan.refPlangrundlage IS 'DataType XP_ExterneReferenz';

CREATE TABLE IF NOT EXISTS rp_plan (bundesland character varying[],
  planArt character varying[],
  sonstPlanArt integer,
  planungsregion text,
  teilabschnitt text,
  rechtsstand character varying,
  status integer,
  aufstellungsbeschlussDatum text,
  auslegungStartDatum text,
  auslegungsEndDatum text,
  traegerbeteiligungsStartDatum text,
  traegerbeteiligungsEndDatum text,
  aenderungenBisDatum text,
  entwurfsbeschlussDatum text,
  planbeschlussDatum text,
  datumDesInkrafttretens text,
  refUmweltbericht uuid,
  refSatzung uuid
)
INHERITS (xp_plan);
COMMENT ON COLUMN rp_plan.bundesland IS 'Enumeration XP_Bundeslaender';
COMMENT ON COLUMN rp_plan.planArt IS 'Enumeration RP_Art';
COMMENT ON COLUMN rp_plan.sonstPlanArt IS 'CodeList RP_SonstPlanArt';
COMMENT ON COLUMN rp_plan.rechtsstand IS 'Enumeration RP_Rechtsstand';
COMMENT ON COLUMN rp_plan.status IS 'CodeList RP_Status';
COMMENT ON COLUMN rp_plan.refUmweltbericht IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN rp_plan.refSatzung IS 'DataType XP_ExterneReferenz';

CREATE TABLE IF NOT EXISTS xp_objekt (
  gml_id uuid primary key,
  uuid character varying,
  text character varying,
  rechtsstand character varying,
  gesetzlicheGrundlage integer,
  textSchluessel character varying[],
  textSchluesselBegruendung character varying[],
  gliederung1 character varying,
  gliederung2 character varying,
  ebene text,
  rechtsverbindlich uuid[],
  informell uuid[],
  hatGenerAttribut uuid[],
  hoehenangabe uuid[]
);
COMMENT ON COLUMN xp_objekt.rechtsstand IS 'Enumeration XP_Rechtsstand';
COMMENT ON COLUMN xp_objekt.gesetzlicheGrundlage IS 'CodeList XP_GesetzlicheGrundlage';
COMMENT ON COLUMN xp_objekt.rechtsverbindlich IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_objekt.informell IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_objekt.hatGenerAttribut IS 'DataType XP_GenerAttribut';
COMMENT ON COLUMN xp_objekt.hoehenangabe IS 'DataType XP_Hoehenangabe';

CREATE TABLE IF NOT EXISTS rp_objekt (rechtscharakter character varying,
  konkretisierung character varying
)
INHERITS (xp_objekt);
COMMENT ON COLUMN rp_objekt.rechtscharakter IS 'Enumeration RP_Rechtscharakter';

CREATE TABLE IF NOT EXISTS rp_geometrieobjekt (position geometry
)
INHERITS (rp_objekt);
COMMENT ON COLUMN rp_geometrieobjekt.position IS 'Union XP_VariableGeometrie';

CREATE TABLE IF NOT EXISTS rp_bodenschutz (gebietsTyp character varying[],
  ZweckbestimmungBS text,
  istAusgleichsgebiet text
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_bodenschutz.gebietsTyp IS 'Enumeration RP_GebietsTyp';
COMMENT ON COLUMN rp_bodenschutz.ZweckbestimmungBS IS ' RP_ZweckbestimmungBodenschutz';

CREATE TABLE IF NOT EXISTS rp_forstwirtschaft (gebietsTyp character varying[],
  zweckbestimmungFW character varying
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_forstwirtschaft.gebietsTyp IS 'Enumeration RP_GebietsTyp';
COMMENT ON COLUMN rp_forstwirtschaft.zweckbestimmungFW IS 'Enumeration RP_ZweckbestimmungForstwirtschaft';

CREATE TABLE IF NOT EXISTS rp_freizeiterholung (gebietsTyp character varying[],
  istAusgleichsgebiet text
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_freizeiterholung.gebietsTyp IS 'Enumeration RP_GebietsTyp';

CREATE TABLE IF NOT EXISTS rp_erholung (typET character varying
)
INHERITS (rp_freizeiterholung);
COMMENT ON COLUMN rp_erholung.typET IS 'Enumeration RP_ErholungTypen';

CREATE TABLE IF NOT EXISTS rp_regionalbedeutsamerwanderweg (typRBW character varying
)
INHERITS (rp_freizeiterholung);
COMMENT ON COLUMN rp_regionalbedeutsamerwanderweg.typRBW IS 'Enumeration RP_RegionalBedeutsamerWanderwegTypen';

CREATE TABLE IF NOT EXISTS rp_regionalbedeutsamesportanlage (typRBS character varying
)
INHERITS (rp_freizeiterholung);
COMMENT ON COLUMN rp_regionalbedeutsamesportanlage.typRBS IS 'Enumeration RP_RegionalBedeutsameSportanlageTypen';

CREATE TABLE IF NOT EXISTS rp_tourismus (typTT character varying
)
INHERITS (rp_freizeiterholung);
COMMENT ON COLUMN rp_tourismus.typTT IS 'Enumeration RP_TourismusTypen';

CREATE TABLE IF NOT EXISTS rp_gewaesser (istAusgleichsgebiet text
)
INHERITS (rp_geometrieobjekt);

CREATE TABLE IF NOT EXISTS rp_gruenzuggruenzaesur (gebietsTyp character varying[],
  istAusgleichsgebiet text
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_gruenzuggruenzaesur.gebietsTyp IS 'Enumeration RP_GebietsTyp';

CREATE TABLE IF NOT EXISTS rp_klimaschutz (gebietsTyp character varying[],
  lufttyp text[],
  istAusgleichsgebiet text
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_klimaschutz.gebietsTyp IS 'Enumeration RP_GebietsTyp';
COMMENT ON COLUMN rp_klimaschutz.lufttyp IS ' RP_LuftTypen';

CREATE TABLE IF NOT EXISTS rp_kulturellessachgut (gebietsTyp character varying[],
  istAusgleichsgebiet text
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_kulturellessachgut.gebietsTyp IS 'Enumeration RP_GebietsTyp';

CREATE TABLE IF NOT EXISTS rp_landwirtschaft (gebietsTyp character varying[],
  typLW character varying,
  istAusgleichsgebiet text
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_landwirtschaft.gebietsTyp IS 'Enumeration RP_GebietsTyp';
COMMENT ON COLUMN rp_landwirtschaft.typLW IS 'Enumeration RP_LandwirtschaftTypen';

CREATE TABLE IF NOT EXISTS rp_naturschutzrechtlichesschutzgebiet (besondereZweckbestimmungNSG character varying,
  zweckbestimmung character varying[],
  istAusgleichsgebiet text
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_naturschutzrechtlichesschutzgebiet.besondereZweckbestimmungNSG IS 'Enumeration RP_BesondereZweckbestimmungNSG';
COMMENT ON COLUMN rp_naturschutzrechtlichesschutzgebiet.zweckbestimmung IS 'Enumeration XP_KlassifizSchutzgebietNaturschutzrecht';

CREATE TABLE IF NOT EXISTS rp_naturlandschaft (gebietsTyp character varying[],
  istAusgleichsgebiet text
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_naturlandschaft.gebietsTyp IS 'Enumeration RP_GebietsTyp';

CREATE TABLE IF NOT EXISTS rp_naturschutz (typNS character varying[]
)
INHERITS (rp_naturlandschaft);
COMMENT ON COLUMN rp_naturschutz.typNS IS 'Enumeration RP_NaturschutzTypen';

CREATE TABLE IF NOT EXISTS rp_landschaftsschutz (typLS character varying[]
)
INHERITS (rp_naturlandschaft);
COMMENT ON COLUMN rp_landschaftsschutz.typLS IS 'Enumeration RP_LandschaftsschutzTypen';

CREATE TABLE IF NOT EXISTS rp_rohstoffsicherung (gebietsTyp character varying[],
  abbaugut character varying[],
  istAusgleichsgebiet text
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_rohstoffsicherung.gebietsTyp IS 'Enumeration RP_GebietsTyp';
COMMENT ON COLUMN rp_rohstoffsicherung.abbaugut IS 'Enumeration RP_Rohstoff';

CREATE TABLE IF NOT EXISTS rp_oberflaechennahebodenschaetze (folgenutzung character varying[],
  zeitstufe character varying,
  zeitstufeText character varying,
  folgenutzungText character varying
)
INHERITS (rp_rohstoffsicherung);
COMMENT ON COLUMN rp_oberflaechennahebodenschaetze.folgenutzung IS 'Enumeration RP_TagebauFolgenutzung';
COMMENT ON COLUMN rp_oberflaechennahebodenschaetze.zeitstufe IS 'Enumeration RP_Zeitstufe';

CREATE TABLE IF NOT EXISTS rp_tiefliegenderohstoffe (
)
INHERITS (rp_rohstoffsicherung);

CREATE TABLE IF NOT EXISTS rp_sonstigerfreiraumstruktur (gebietsTyp character varying[],
  istAusgleichsgebiet text
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_sonstigerfreiraumstruktur.gebietsTyp IS 'Enumeration RP_GebietsTyp';

CREATE TABLE IF NOT EXISTS rp_vorbhochwasserschutz (gebietsTyp character varying[],
  zweckbestimmungHWS character varying,
  istAusgleichsgebiet text
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_vorbhochwasserschutz.gebietsTyp IS 'Enumeration RP_GebietsTyp';
COMMENT ON COLUMN rp_vorbhochwasserschutz.zweckbestimmungHWS IS 'Enumeration RP_HochwasserschutzTypen';

CREATE TABLE IF NOT EXISTS rp_wasserschutz (gebietsTyp character varying[],
  zone character varying[],
  ZweckbestimmungWS character varying,
  istAusgleichsgebiet text
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_wasserschutz.gebietsTyp IS 'Enumeration RP_GebietsTyp';
COMMENT ON COLUMN rp_wasserschutz.zone IS 'Enumeration RP_WasserschutzZone';
COMMENT ON COLUMN rp_wasserschutz.ZweckbestimmungWS IS 'Enumeration RP_ZweckbestimmungWasserschutz';

CREATE TABLE IF NOT EXISTS rp_windenergienutzung (gebietsTyp character varying[],
  istAusgleichsgebiet text
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_windenergienutzung.gebietsTyp IS 'Enumeration RP_GebietsTyp';

CREATE TABLE IF NOT EXISTS rp_verkehr (gebietsTyp character varying[],
  typ character varying[],
  status character varying,
  bezeichnung character varying
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_verkehr.gebietsTyp IS 'Enumeration RP_GebietsTyp';
COMMENT ON COLUMN rp_verkehr.typ IS 'Enumeration RP_VerkehrTypen';
COMMENT ON COLUMN rp_verkehr.status IS 'Enumeration RP_VerkehrStatus';

CREATE TABLE IF NOT EXISTS rp_strassenverkehr (strassenverkehrTyp character varying,
  sonstTyp character varying
)
INHERITS (rp_verkehr);
COMMENT ON COLUMN rp_strassenverkehr.strassenverkehrTyp IS 'Enumeration RP_StrassenverkehrTypen';
COMMENT ON COLUMN rp_strassenverkehr.sonstTyp IS 'Enumeration RP_SonstStrassenverkehrTypen';

CREATE TABLE IF NOT EXISTS rp_schienenverkehr (schienenverkehrTyp character varying,
  sonstTyp character varying
)
INHERITS (rp_verkehr);
COMMENT ON COLUMN rp_schienenverkehr.schienenverkehrTyp IS 'Enumeration RP_SchienenverkehrTypen';
COMMENT ON COLUMN rp_schienenverkehr.sonstTyp IS 'Enumeration RP_SonstSchienenverkehrTypen';

CREATE TABLE IF NOT EXISTS rp_luftverkehr (luftverkehrTyp character varying,
  sonstTypen character varying
)
INHERITS (rp_verkehr);
COMMENT ON COLUMN rp_luftverkehr.luftverkehrTyp IS 'Enumeration RP_LuftverkehrTypen';
COMMENT ON COLUMN rp_luftverkehr.sonstTypen IS 'Enumeration RP_SonstLuftverkehrTypen';

CREATE TABLE IF NOT EXISTS rp_wasserverkehr (wasserverkehrTyp character varying,
  sonstTyp character varying
)
INHERITS (rp_verkehr);
COMMENT ON COLUMN rp_wasserverkehr.wasserverkehrTyp IS 'Enumeration RP_WasserverkehrTypen';
COMMENT ON COLUMN rp_wasserverkehr.sonstTyp IS 'Enumeration RP_SonstWasserverkehrTypen';

CREATE TABLE IF NOT EXISTS rp_sonstverkehr (sonstVerkehrTyp character varying
)
INHERITS (rp_verkehr);
COMMENT ON COLUMN rp_sonstverkehr.sonstVerkehrTyp IS 'Enumeration RP_SonstVerkehrTypen';

CREATE TABLE IF NOT EXISTS rp_entsorgung (gebietsTyp character varying[],
  typ character varying,
  typAE character varying,
  typAW character varying
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_entsorgung.gebietsTyp IS 'Enumeration RP_GebietsTyp';
COMMENT ON COLUMN rp_entsorgung.typ IS 'Enumeration RP_EntsorgungTypen';
COMMENT ON COLUMN rp_entsorgung.typAE IS 'Enumeration RP_AbwasserTypen';
COMMENT ON COLUMN rp_entsorgung.typAW IS 'Enumeration RP_AbwasserTypen';

CREATE TABLE IF NOT EXISTS rp_energieversorgung (gebietsTyp character varying[],
  status character varying,
  typ character varying[]
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_energieversorgung.gebietsTyp IS 'Enumeration RP_GebietsTyp';
COMMENT ON COLUMN rp_energieversorgung.status IS 'Enumeration RP_EnergieversorgungsStatus';
COMMENT ON COLUMN rp_energieversorgung.typ IS 'Enumeration RP_EnergieversorgungTypen';

CREATE TABLE IF NOT EXISTS rp_kommunikation (gebietsTyp character varying[]
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_kommunikation.gebietsTyp IS 'Enumeration RP_GebietsTyp';

CREATE TABLE IF NOT EXISTS rp_laermschutzbereich (gebietsTyp character varying[],
  typLS character varying
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_laermschutzbereich.gebietsTyp IS 'Enumeration RP_GebietsTyp';
COMMENT ON COLUMN rp_laermschutzbereich.typLS IS 'Enumeration RP_LaermschutzTypen';

CREATE TABLE IF NOT EXISTS rp_wasserwirtschaft (gebietsTyp character varying[],
  typ character varying[]
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_wasserwirtschaft.gebietsTyp IS 'Enumeration RP_GebietsTyp';
COMMENT ON COLUMN rp_wasserwirtschaft.typ IS 'Enumeration RP_WasserwirtschaftTypen';

CREATE TABLE IF NOT EXISTS rp_sozialeinfrastruktur (gebietsTyp character varying[],
  typ character varying[]
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_sozialeinfrastruktur.gebietsTyp IS 'Enumeration RP_GebietsTyp';
COMMENT ON COLUMN rp_sozialeinfrastruktur.typ IS 'Enumeration RP_SozialeInfrastrukturTypen';

CREATE TABLE IF NOT EXISTS rp_sonstigeinfrastruktur (gebietsTyp character varying[]
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_sonstigeinfrastruktur.gebietsTyp IS 'Enumeration RP_GebietsTyp';

CREATE TABLE IF NOT EXISTS rp_grenze (sonstTyp integer,
  typ character varying[]
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_grenze.sonstTyp IS 'CodeList RP_SonstGrenzeTypen';
COMMENT ON COLUMN rp_grenze.typ IS 'Enumeration XP_GrenzeTypen';

CREATE TABLE IF NOT EXISTS rp_generischesobjekt (zweckbestimmung integer
)
INHERITS (rp_geometrieobjekt);
COMMENT ON COLUMN rp_generischesobjekt.zweckbestimmung IS 'CodeList RP_ZweckbestimmungGenerischeObjekte';

CREATE TABLE IF NOT EXISTS rp_flaechenobjekt (position geometry
)
INHERITS (rp_objekt);
COMMENT ON COLUMN rp_flaechenobjekt.position IS 'Union XP_Flaechengeometrie';

CREATE TABLE IF NOT EXISTS rp_linienobjekt (position geometry
)
INHERITS (rp_objekt);
COMMENT ON COLUMN rp_linienobjekt.position IS 'Union XP_Liniengeometrie';

CREATE TABLE IF NOT EXISTS rp_achse (achsenTyp character varying
)
INHERITS (rp_linienobjekt);
COMMENT ON COLUMN rp_achse.achsenTyp IS 'Enumeration RP_AchsenTypen';

CREATE TABLE IF NOT EXISTS rp_punktobjekt (position geometry
)
INHERITS (rp_objekt);
COMMENT ON COLUMN rp_punktobjekt.position IS 'Union XP_Punktgeometrie';

CREATE TABLE IF NOT EXISTS xp_bereich (
  gml_id uuid primary key,
  geltungsbereich geometry,
  bedeutung character varying,
  erstellungsMasstab text,
  detaillierteBedeutung character varying,
  name character varying,
  nummer text
);
COMMENT ON COLUMN xp_bereich.geltungsbereich IS 'Union XP_Flaechengeometrie';
COMMENT ON COLUMN xp_bereich.bedeutung IS 'Enumeration XP_BedeutungenBereich';

CREATE TABLE IF NOT EXISTS rp_bereich (versionLPLGText character varying,
  versionLPLG text,
  versionBROGText character varying,
  versionBROG text
)
INHERITS (xp_bereich);

CREATE TABLE IF NOT EXISTS rp_sperrgebiet (SperrgebietTyp character varying
)
INHERITS (rp_bereich);
COMMENT ON COLUMN rp_sperrgebiet.SperrgebietTyp IS 'Enumeration RP_SperrgebietTypen';

CREATE TABLE IF NOT EXISTS rp_raumkategorie (typRK character varying[]
)
INHERITS (rp_bereich);
COMMENT ON COLUMN rp_raumkategorie.typRK IS 'Enumeration RP_RaumkategorieTypen';

CREATE TABLE IF NOT EXISTS rp_zentralerort (funktion character varying[]
)
INHERITS (rp_bereich);
COMMENT ON COLUMN rp_zentralerort.funktion IS 'Enumeration RP_ZentralerOrtFunktionen';

CREATE TABLE IF NOT EXISTS rp_sonstigesiedlungsstruktur (gebietsTyp character varying[]
)
INHERITS (rp_bereich);
COMMENT ON COLUMN rp_sonstigesiedlungsstruktur.gebietsTyp IS 'Enumeration RP_GebietsTyp';

CREATE TABLE IF NOT EXISTS rp_gemeindefunktionsiedlungsentwicklung (gebietsTyp character varying[],
  zweckbindungASB character varying[],
  zweckbindungGIB character varying[],
  funktion character varying[]
)
INHERITS (rp_bereich);
COMMENT ON COLUMN rp_gemeindefunktionsiedlungsentwicklung.gebietsTyp IS 'Enumeration RP_GebietsTyp';
COMMENT ON COLUMN rp_gemeindefunktionsiedlungsentwicklung.zweckbindungASB IS 'Enumeration RP_ASB_Zweckbindungen';
COMMENT ON COLUMN rp_gemeindefunktionsiedlungsentwicklung.zweckbindungGIB IS 'Enumeration RP_GIB_Zweckbindungen';
COMMENT ON COLUMN rp_gemeindefunktionsiedlungsentwicklung.funktion IS 'Enumeration RP_Gemeindefunktionen';

CREATE TABLE IF NOT EXISTS xp_abstraktespraesentationsobjekt (
  gml_id uuid primary key,
  stylesheetId integer,
  index text[],
  art character varying[],
  darstellungsprioritaet text
);
COMMENT ON COLUMN xp_abstraktespraesentationsobjekt.stylesheetId IS 'CodeList XP_StylesheetListe';

CREATE TABLE IF NOT EXISTS xp_praesentationsobjekt (
)
INHERITS (xp_abstraktespraesentationsobjekt);

CREATE TABLE IF NOT EXISTS xp_ppo (position geometry,
  skalierung double precision,
  drehwinkel double precision
)
INHERITS (xp_abstraktespraesentationsobjekt);
COMMENT ON COLUMN xp_ppo.position IS 'Union XP_Punktgeometrie';

CREATE TABLE IF NOT EXISTS xp_fpo (position geometry
)
INHERITS (xp_abstraktespraesentationsobjekt);
COMMENT ON COLUMN xp_fpo.position IS 'Union XP_Flaechengeometrie';

CREATE TABLE IF NOT EXISTS xp_lpo (position geometry
)
INHERITS (xp_abstraktespraesentationsobjekt);
COMMENT ON COLUMN xp_lpo.position IS 'Union XP_Liniengeometrie';

CREATE TABLE IF NOT EXISTS xp_tpo (horizontaleAusrichtung character varying,
  vertikaleAusrichtung character varying,
  skalierung double precision,
  fontSperrung double precision,
  schriftinhalt character varying
)
INHERITS (xp_abstraktespraesentationsobjekt);
COMMENT ON COLUMN xp_tpo.horizontaleAusrichtung IS 'Enumeration XP_HorizontaleAusrichtung';
COMMENT ON COLUMN xp_tpo.vertikaleAusrichtung IS 'Enumeration XP_VertikaleAusrichtung';

CREATE TABLE IF NOT EXISTS xp_pto (position geometry,
  drehwinkel double precision
)
INHERITS (xp_tpo);
COMMENT ON COLUMN xp_pto.position IS 'Union XP_Punktgeometrie';

CREATE TABLE IF NOT EXISTS xp_nutzungsschablone (zeilenAnz text,
  spaltenAnz text
)
INHERITS (xp_pto);

CREATE TABLE IF NOT EXISTS xp_lto (position geometry
)
INHERITS (xp_tpo);
COMMENT ON COLUMN xp_lto.position IS 'Union XP_Liniengeometrie';

CREATE TABLE IF NOT EXISTS xp_rasterplanbasis (
  gml_id uuid primary key,
  refLegende uuid[],
  refText uuid,
  refScan uuid[]
);
COMMENT ON COLUMN xp_rasterplanbasis.refLegende IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_rasterplanbasis.refText IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_rasterplanbasis.refScan IS 'DataType XP_ExterneReferenz';

CREATE TABLE IF NOT EXISTS xp_rasterplanaenderung (
  gml_id uuid primary key,
  nameAenderung character varying,
  nummerAenderung text,
  beschreibung character varying,
  refBeschreibung uuid,
  refBegruendung uuid,
  refScan uuid[],
  refText uuid,
  refLegende uuid[],
  geltungsbereichAenderung geometry,
  besonderheiten character varying
);
COMMENT ON COLUMN xp_rasterplanaenderung.refBeschreibung IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_rasterplanaenderung.refBegruendung IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_rasterplanaenderung.refScan IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_rasterplanaenderung.refText IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_rasterplanaenderung.refLegende IS 'DataType XP_ExterneReferenz';
COMMENT ON COLUMN xp_rasterplanaenderung.geltungsbereichAenderung IS 'Union XP_Flaechengeometrie';

CREATE TABLE IF NOT EXISTS rp_rasterplanaenderung (aufstellungsbeschlussDatum text,
  auslegungsStartDatum text,
  auslegungsEndDatum text,
  traegerbeteiligungsStartDatum text,
  traegerbeteiligungsEndDatum text,
  aenderungenBisDatum text,
  entwurfsbeschlussDatum text,
  satzungsbeschlussDatum text,
  datumDesInkrafttretens text
)
INHERITS (xp_rasterplanaenderung);
