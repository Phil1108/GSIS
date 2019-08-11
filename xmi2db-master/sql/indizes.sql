CREATE INDEX ap_lpo_art ON ap_lpo USING btree (art);
CREATE INDEX ap_ppo_art ON ap_ppo USING btree (art);
CREATE INDEX ap_pto_art ON ap_pto USING btree (art);

CREATE INDEX ap_pto_sn ON ap_pto USING btree (signaturnummer);

CREATE INDEX ax_besondereflurstuecksgrenze_adfg ON ax_besondereflurstuecksgrenze USING gin (artderflurstuecksgrenze);
CREATE INDEX ax_besonderegebaeudelinie_bes ON ax_besonderegebaeudelinie USING gin (beschaffenheit);
CREATE INDEX ax_buchungsblatt_lbb ON ax_buchungsblatt USING btree (land,bezirk,buchungsblattnummermitbuchstabenerweiterung);
CREATE INDEX ax_buchungsblattbez_key ON ax_buchungsblattbezirk USING btree (land,bezirk);

CREATE INDEX ax_anderefestlegungnachwasserrecht_afs ON ax_anderefestlegungnachwasserrecht(land,stelle);
CREATE INDEX ax_denkmalschutzrecht_afs ON ax_denkmalschutzrecht(land,stelle);
CREATE INDEX ax_forstrecht_afs ON ax_forstrecht(land,stelle);
CREATE INDEX ax_klassifizierungnachstrassenrecht_afs ON ax_klassifizierungnachstrassenrecht(land,stelle);
CREATE INDEX ax_klassifizierungnachwasserrecht_afs ON ax_klassifizierungnachwasserrecht(land,stelle);
CREATE INDEX ax_naturumweltoderbodenschutzrecht_afs ON ax_naturumweltoderbodenschutzrecht(land,stelle);
CREATE INDEX ax_schutzgebietnachnaturumweltoderbodenschutzrecht_afs ON ax_schutzgebietnachnaturumweltoderbodenschutzrecht(land,stelle);
CREATE INDEX ax_schutzgebietnachwasserrecht_afs ON ax_schutzgebietnachwasserrecht(land,stelle);

CREATE INDEX ax_flurstueck_lgfzn ON ax_flurstueck USING btree (land,gemarkungsnummer,flurnummer,zaehler,nenner);
CREATE INDEX ax_flurstueck_arz ON ax_flurstueck USING btree (abweichenderrechtszustand);
CREATE INDEX ax_flurstueck_kz ON ax_flurstueck USING btree (flurstueckskennzeichen);

CREATE INDEX ax_gemarkung_nr ON ax_gemarkung USING btree (land,gemarkungsnummer);

CREATE INDEX ax_georeferenziertegebaeudeadresse_adr ON ax_georeferenziertegebaeudeadresse USING btree (strassenschluessel,hausnummer,adressierungszusatz);

CREATE INDEX ax_grenzpunkt_abmm ON ax_grenzpunkt USING btree (abmarkung_marke);

CREATE INDEX idx_histfs_kennz ON ax_historischesflurstueck USING btree (flurstueckskennzeichen);

CREATE INDEX idx_histfsalb_kennz ON ax_historischesflurstueckalb USING btree (flurstueckskennzeichen);
CREATE INDEX idx_histfsalb_vor ON ax_historischesflurstueckalb USING gin (vorgaengerflurstueckskennzeichen);
CREATE INDEX idx_histfsalb_nach ON ax_historischesflurstueckalb USING gin (nachfolgerflurstueckskennzeichen);

CREATE INDEX idx_histfsorb_kennz ON ax_historischesflurstueckohneraumbezug USING btree (flurstueckskennzeichen);
CREATE INDEX idx_histfsorb_vor ON ax_historischesflurstueckohneraumbezug USING gin (vorgaengerflurstueckskennzeichen);
CREATE INDEX idx_histfsorb_nach ON ax_historischesflurstueckohneraumbezug USING gin (nachfolgerflurstueckskennzeichen);

CREATE INDEX ax_lagebezeichnungkatalogeintrag_lage ON ax_lagebezeichnungkatalogeintrag USING btree (gemeinde,lage);
CREATE INDEX ax_lagebezeichnungkatalogeintrag_gesa ON ax_lagebezeichnungkatalogeintrag USING btree (schluesselgesamt);
CREATE INDEX ax_lagebezeichnungkatalogeintrag_bez ON ax_lagebezeichnungkatalogeintrag USING btree (bezeichnung);

CREATE INDEX ax_lagebezeichnungmithausnummer_lage ON ax_lagebezeichnungmithausnummer USING btree (gemeinde,lage);

CREATE INDEX ax_lagebezeichnungohnehausnummer_key ON ax_lagebezeichnungohnehausnummer USING btree (land,regierungsbezirk,kreis,gemeinde,lage);
