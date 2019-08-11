#!/usr/bin/perl

use strict;
use warnings;
use DBI;
use Data::UUID;

my $O = "aaa_orig";
my $N = "aaa_xmi2db";
my $ug = Data::UUID->new;

my $dbh = DBI->connect("dbi:Pg:service=xmi2db", undef, undef, { RaiseError=>1, ShowErrorStatement=>1});

open F, ">/tmp/update.sql";  # Migrationskript

print "\nGeänderte Tabellen:";

my @ident;

my $idxsth = $dbh->prepare( "SELECT pg_get_indexdef(i.indexrelid)"
                          . " FROM pg_class c"
                          . " JOIN pg_namespace n ON n.oid=c.relnamespace"
                          . " JOIN pg_index i ON c.oid = i.indrelid"
                          . " WHERE n.nspname=? AND c.relname=?"
			  . " ORDER BY pg_get_indexdef(i.indexrelid)"
                          );

my $attsth = $dbh->prepare( "SELECT"
			  . " a.attname"
			  . ",format_type(a.atttypid, a.atttypmod)"
			  . ",CASE WHEN a.attnotnull THEN ' NOT NULL' ELSE '' END"
			  . " FROM pg_namespace n"
			  . " JOIN pg_class c ON n.oid=c.relnamespace"
			  . " JOIN pg_attribute a ON c.oid=a.attrelid"
			  . " WHERE n.nspname=? AND c.relname=?"
			  . " ORDER BY c.relname,a.attname"
			  );


my $sth = $dbh->prepare("SELECT a.table_name FROM information_schema.tables a JOIN information_schema.tables b ON a.table_name=b.table_name AND b.table_schema='$N' WHERE a.table_schema='$O' ORDER BY a.table_name");
$sth->execute;
while( my($t) = $sth->fetchrow_array ) {
	my @out;

	push @out, "\n  $t:\n";
	print F "\n";

	my $ident = 1;

	$attsth->execute($O, $t);

	my %src;
	while( my($a, $d, $c) = $attsth->fetchrow_array ) {
		$src{$a}{datatype} = $d;
		$src{$a}{notnull} = $c;
	}

	$attsth->execute($N, $t);

	my %dst;
	while( my($a, $d, $c) = $attsth->fetchrow_array ) {
		$dst{$a}{datatype} = $d;
		$dst{$a}{notnull} = $c;
	}

	my %cols;
	my @cols;
	foreach my $c (sort keys %src) {
		next if $c eq "dummy";
		next if exists $cols{$c};
		$cols{$c} = 1;
		push @cols, $c;
	}

	foreach my $c (sort keys %dst) {
		next if $c eq "dummy";
		next if exists $cols{$c};
		$cols{$c} = 1;
		push @cols, $c;
	}

	my %alter;
	my %renamedto;
	for my $c (@cols) {
		if(exists $src{$c}) {
			my $d = $c;

			unless(exists $dst{$c}) {
				# DROP?  RENAME & ALTER?

				if(
					# ax_fortfuehrungsnachweisdeckblatt.gemarkungsnummer: multiple hits fnnummer_gemarkungsnummer, ingemarkung_gemarkungsnummer
					# ax_grablochderbodenschaetzung.gemarkungsnummer: multiple hits ingemarkung_gemarkungsnummer, kennziffer_gemarkungsnummer
					($t eq "ax_fortfuehrungsnachweisdeckblatt" && $c eq "gemarkungsnummer" ) ||
					($t eq "ax_grablochderbodenschaetzung" && $c eq "gemarkungsnummer") ||

					# ax_fortfuehrungsnachweisdeckblatt.land multiple hits fnnummer_land, ingemarkung_land
					# ax_grablochderbodenschaetzung.land: multiple hits ingemarkung_land, kennziffer_land
					($t eq "ax_fortfuehrungsnachweisdeckblatt" && $c eq "land") ||
					($t eq "ax_grablochderbodenschaetzung" && $c eq "land") ||

					# ax_gebaeude.ax_datenerhebung: multiple hits herkunft_source_source_ax_datenerhebung, processstep_ax_datenerhebung
					# ax_hoehleneingang.ax_datenerhebung: multiple hits herkunft_source_source_ax_datenerhebung, processstep_ax_datenerhebung
					($t eq "ax_gebaeude" && $c eq "ax_datenerhebung") ||
					($t eq "ax_hoehleneingang" && $c eq "ax_datenerhebung") ||

					# ax_punktortta.description: multiple hits herkunft_source_source_description, processstep_description, processstep_ax_li_processstep_punktort_description
					($t eq "ax_punktortta" && $c eq "description")
				) {
					push @out, "  ? $t.$c: $src{$c}{datatype}$src{$c}{notnull}\n";
					next;
				}


				my @replace;
				if($t =~ /^ax_fortfuehrungs(fall|nachweisdeckblatt)$/ && $c eq "uri") {
					@replace = qw/zeigtaufexternes_uri/;

				} elsif($t eq "ax_grenzpunkt" && $c eq "land") {
					@replace = qw/zustaendigestelle_land/;

				} elsif($t eq "ax_grenzpunkt" && $c eq "stelle") {
					@replace = qw/zustaendigestelle_stelle/;

				} else {
					my $r = "_${c}\$";
					@replace = grep /$r/, keys %dst;

				}

				if(@replace == 1) {
					# RENAME
					$d = $replace[0];
					print F "\t\tALTER TABLE $t RENAME $c TO $d;\n";
					$renamedto{$d} = 1;
				} else {
					die "$t.$c: multiple hits " . join(", ", @replace) if @replace > 1;

					# FIXME geometry => DropGeometryColumn
					print F "\t\tALTER TABLE $t DROP $c;\n";

					die "$t.$c: drop column?" unless grep "$t.$c", qw/ax_bahnverkehr.bezeichnung ax_bauteil.anzahlderunterirdischengeschosse ax_buchungsblattbezirk.gehoertzu ax_gebaeude.qualitaetsangaben ax_gemarkungsteilflur.gehoertzu ax_gemeinde.istamtsbezirkvon ax_historischesflurstueck.vorgaengerflurstueckskennzeichen ax_historischesflurstueckalb.rechtsbehelfsverfahren ax_historischesflurstueckalb.zweifelhafterflurstuecksnachweis ax_historischesflurstueckalb.zeitpunktderentstehung ax_historischesflurstueckalb.gemeinde ax_historischesflurstueckalb.abweichenderrechtszustand ax_punktortag.ax_datenerhebung_punktort ax_punktortau.ax_datenerhebung_punktort ax_punktortta.ax_datenerhebung_punktort ax_sonstigesbauwerkodersonstigeeinrichtung.gehoertzubauwerk ax_sonstigesrecht.funktion ax_sonstigesrecht.characterstring/;

					push @out, "  - $t.$c: $src{$c}{datatype}$src{$c}{notnull}\n";

					next;
				}
			}

			my $d0 = $src{$c}{datatype};
			my $c0 = $src{$c}{notnull};
			my $d1 = $dst{$d}{datatype};
			my $c1 = $dst{$d}{notnull};

			next if $d0 eq $d1 && $c0 eq $c1 && $c eq $d;

			push @out, "  > $t.$c" . ($c eq $d ? "" : " => $d" ) . ": $d0$c0 => $d1$c1\n";

			if($d0 ne $d1) {
				print F "\t\t-- $t.$c => $d: $d0 => $d1\n";


				my $alter = "\t\tALTER TABLE $t ALTER $d TYPE $d1";

				if(
					($d0 =~ /^geometry\((PointZ?|LineString|Polygon),25832\)$/ && $d1 eq "geometry(Geometry,25832)")
				) {
					print F <<EOF;
		BEGIN
			ALTER TABLE $t DROP CONSTRAINT enforce_geotype_wkb_geometry;
		EXCEPTION WHEN OTHERS THEN
			ALTER TABLE $t RENAME ${c} TO ${c}_;
			PERFORM AddGeometryColumn('$t','$c',find_srid(current_schema()::text,'ax_flurstueck','wkb_geometry'),'GEOMETRY',2);
			UPDATE $t SET $c=${c}_;
			ALTER TABLE $t DROP ${c}_;
			CREATE INDEX ${t}_${c}_idx ON $t USING gist($c);
		END;
EOF
					$alter = "";

				} elsif(
					($d0 =~ /^character\(\d+\)$/ && $d1 eq "character varying") ||
					($d0 =~ /^character\(\d+\)\[\]$/ && $d1 eq "character varying[]") ||
					($d0 =~ /^character varying\[\]$/ && $d1 eq "character(16)[]")
				) {

				} elsif(
					($d0 eq "character(16)" && $d1 eq "character(16)[]") ||
					($d0 eq "character varying" && $d1 eq "character varying[]") ||
					($d0 eq "integer" && $d1 eq "integer[]") ||
					($d0 =~ /^character\(\d+\)$/ && $d1 eq "character varying[]")
				) {
					$alter .= " USING CASE WHEN $d IS NULL THEN NULL ELSE ARRAY[$d] END";

				} elsif(
					($d0 eq "character varying" && $d1 eq "integer")
				) {
					$alter .= " USING ${d}::int";

				} elsif(
					($d0 eq "integer" && $d1 eq "character varying[]")
				) {
					$alter .= " USING CASE WHEN $d IS NULL THEN NULL ELSE ARRAY[${d}::int] END";

				} elsif(
					($d0 eq "character varying" && $d1 eq "double precision")
				) {
					$alter .= " USING ${d}::double precision";

				} elsif(
					($d0 eq "integer" && $d1 eq "character varying")
				) {
					$alter .= " USING ${d}::varchar";

				} elsif( $d0 =~ /^(character varying|character\(10\))$/ && $d1 eq "date") {
					# print STDERR "Date: $t.$c\n";
					$alter .= " USING to_date($d, 'YYYY-dd-mm')";

				} elsif(
					($d0 eq "integer[]" && $d1 eq "character varying[]")
				) {
					$alter  = "\t\tALTER TABLE $t RENAME $d TO ${d}_;\n";
					$alter .= "\t\tALTER TABLE $t ADD $d $d1;\n";
					$alter .= "\t\tUPDATE $t SET $d=ARRAY(SELECT unnest(${d}_)::text);\n";
					$alter .= "\t\tALTER TABLE $t DROP ${d}_";

				} else {
					die "Unbekannte Transformation $d0 => $d1\n";
				}

				print F "$alter;\n" if $alter ne "";
			}

			if($c0 ne $c1) {
				if($c1 eq " NOT NULL") {
					print F "\t\tALTER TABLE $t ALTER $d SET NOT NULL;\n";
				} else {
					print F "\t\tALTER TABLE $t ALTER $d DROP NOT NULL;\n";
				}
			}

		} elsif(exists $dst{$c}) {
			next if exists $renamedto{$c};

			push @out, "  + $t.$c: $dst{$c}{datatype}$dst{$c}{notnull}\n";

			if( $dst{$c}{datatype} eq "geometry(Geometry,25832)") {
				print F "\t\tPERFORM AddGeometryColumn('$t','$c',find_srid(current_schema()::text,'ax_flurstueck','$c'),'GEOMETRY',2);\n";
			} elsif( $dst{$c}{datatype} eq "geometry(Point,25832)") {
				print F "\t\tPERFORM AddGeometryColumn('$t','$c',find_srid(current_schema()::text,'ax_flurstueck','$c'),'POINT',2);\n";
			} else {
				print F "\t\tALTER TABLE $t ADD $c $dst{$c}{datatype}$dst{$c}{notnull};\n";
			}

		} else {
			die "HUH? $t.$c"
		}
	}


	my %srcidx;

	$idxsth->execute($O, $t);
	while( my($idx) = $idxsth->fetchrow_array ) {
		die "CREATE expected: $idx" unless $idx =~ /^CREATE\s+/;
		$idx =~ s/^CREATE\s+//;

		my $unique = 0;
		if($idx =~ /^UNIQUE\s+/) {
			$unique = 1;
			$idx =~ s/^UNIQUE\s+//;
		}

		die "INDEX expected: $idx" unless $idx =~ /^INDEX\s+/;
		$idx =~ s/^INDEX\s+\S+\s+//;

		$idx =~ s/$O\.//;
		$srcidx{$idx} = $unique;
	}

	my %dstidx;

	$idxsth->execute($N, $t);
	while( my($idx) = $idxsth->fetchrow_array ) {
		die "CREATE expected: $idx" unless $idx =~ /^CREATE\s+/;
		$idx =~ s/^CREATE\s+//;

		my $unique = 0;
		if($idx =~ /^UNIQUE\s+/) {
			$unique = 1;
			$idx =~ s/^UNIQUE\s+//;
		}

		die "INDEX expected: $idx" unless $idx =~ /^INDEX\s+/;
		$idx =~ s/^INDEX\s+\S+\s+//;

		$idx =~ s/$N\.//;
		$dstidx{$idx} = $unique;
	}

	foreach my $idx (sort keys %srcidx) {
		next if exists $dstidx{$idx} && exists $srcidx{$idx} && $srcidx{$idx} eq $dstidx{$idx};

		print F "\t\tPERFORM alkis_dropobject(ix.relname)"
		      . " FROM pg_class cl"
		      . " JOIN pg_namespace ns ON ns.oid=cl.relnamespace"
                      . " JOIN pg_index ind ON cl.oid = ind.indrelid"
                      . " JOIN pg_class ix ON ix.oid = ind.indexrelid"
                      . " WHERE ns.nspname=current_schema()"
                      . " AND cl.relname=" . $dbh->quote($t)
		      . " AND pg_get_indexdef(ind.indexrelid) LIKE 'CREATE "
                      . ($srcidx{$idx} ? "UNIQUE " : "")
		      . "INDEX % $idx';\n";

	}

	foreach my $idx (sort keys %dstidx) {
		next if exists $dstidx{$idx} && exists $srcidx{$idx} && $srcidx{$idx} eq $dstidx{$idx};

		my $id = $ug->to_string($ug->create());
		$id =~ s/-/_/g;

		print F "\t\tCREATE " . ($srcidx{$idx} ? "UNIQUE " : "") . "INDEX alkis_$id $idx;\n";
	}


	if(@out == 1) {
		push @ident, $t;
	} else {
		print join("", sort @out);
	}
}
$sth->finish;

print "\nIdentische Tabelle:\n  " . join("\n  ", @ident) . "\n";

print "\nNeue Tabellen:\n";

my @new;

$sth = $dbh->prepare("SELECT table_name FROM information_schema.tables a WHERE a.table_schema=? AND NOT EXISTS (SELECT * FROM information_schema.tables b WHERE a.table_name=b.table_name AND b.table_schema=?) ORDER BY table_name");
$sth->execute($N, $O);
while( my($t) = $sth->fetchrow_array ) {
	print "  $t\n";
	push @new, $t;
}
$sth->finish;

open I, "/tmp/alkis-schema.sql";

my $skip = 1;
my $re = "^CREATE (TABLE\\s+(" . join("|", @new) . ")\\s*\\(|VIEW alkis_wertearten\\()";

while(<I>) {
	if( my $t = /$re/) {
		$skip = 0;
	} elsif(/^CREATE (TABLE|VIEW)/) {
		$skip = 1;
	}

	next if $skip;

	s/^/		/;

	s/SELECT AddGeometryColumn/PERFORM AddGeometryColumn/;
	s/:alkis_epsg/find_srid(current_schema()::text,'ax_flurstueck','wkb_geometry')/;

	print F;
}

close I;

print "\nFehlende Tabellen:\n";

$sth->execute($O, $N);
while( my($t) = $sth->fetchrow_array ) {
	print "  $t\n";
}
$sth->finish;

$dbh->disconnect;
