-- View: schema_name.classes_attributes_types

DROP VIEW schema_name.classes_attributes_types CASCADE;

CREATE OR REPLACE VIEW schema_name.classes_attributes_types AS 
 SELECT t1.class_name,
    t1.atribute_name,
    t1.class_xmi_id,
    t1.class_id,
    t1.attribute_xmi_id,
    t1.attribute_id,
    t1.package_id,
    COALESCE(t2.name, ''::character varying)::text || COALESCE(t4.name, ''::character varying)::text AS datatype,
    t1.attribute_datatype,
    t3.name AS classifier,
    t1.attribute_classifier
   FROM schema_name.classes_attributes t1
     LEFT JOIN schema_name.datatypes t2 ON t1.attribute_datatype::text = t2.xmi_id::text
     LEFT JOIN schema_name.datatypes t4 ON t1.attribute_classifier::text = t4.xmi_id::text
     LEFT JOIN schema_name.uml_classes t3 ON t1.attribute_classifier::text = t3.xmi_id::text;

-- View: schema_name.classes_attributes_types_gen

-- DROP VIEW schema_name.classes_attributes_types_gen;

CREATE OR REPLACE VIEW schema_name.classes_attributes_types_gen AS 
 SELECT generalizations.parent_name AS gen_name,
    classes_attributes_types.class_name,
    generalizations.child_id,
    generalizations.comment,
    classes_attributes_types.atribute_name,
    classes_attributes_types.class_xmi_id,
    classes_attributes_types.class_id,
    classes_attributes_types.attribute_xmi_id,
    classes_attributes_types.attribute_id,
    classes_attributes_types.package_id,
    classes_attributes_types.datatype,
    classes_attributes_types.attribute_datatype,
    classes_attributes_types.classifier,
    classes_attributes_types.attribute_classifier
   FROM schema_name.classes_attributes_types
     LEFT JOIN schema_name.generalizations ON classes_attributes_types.class_xmi_id::text = generalizations.child_id::text;

-- View: schema_name.full_model

-- DROP VIEW schema_name.full_model;

CREATE OR REPLACE VIEW schema_name.full_model AS 
 SELECT "packages_parent-name".parent_package_name,
    "packages_parent-name".name AS package_name,
    classes_attributes_types_gen.gen_name,
    classes_attributes_types_gen.class_name,
    classes_attributes_types_gen.atribute_name,
    classes_attributes_types_gen.datatype,
    classes_attributes_types_gen.classifier,
    classes_attributes_types_gen.comment
   FROM schema_name.classes_attributes_types_gen,
    schema_name."packages_parent-name"
  WHERE classes_attributes_types_gen.package_id = "packages_parent-name".id
  ORDER BY "packages_parent-name".name, classes_attributes_types_gen.class_name;

-- View: schema_name.class_assoziations

-- DROP VIEW schema_name.class_assoziations;

CREATE OR REPLACE VIEW schema_name.class_assoziations AS 
 WITH assoc_ends AS (
         WITH namea AS (
                 SELECT sub.name AS namea,
                    sub.assoc_id,
                    sub.visibility AS visibilitya,
                    sub.aggregation AS aggregationa,
                    sub."isOrdered" AS isordereda,
                    sub."isNavigable" AS isnavigablea,
                    sub.multiplicity_range_lower AS multiplicity_range_lowera,
                    sub.multiplicity_range_upper AS multiplicity_range_uppera,
                    sub."targetScope" AS targetscopea,
                    sub.changeability AS changeabilitya,
                    sub.ordering AS orderinga,
                    sub.participant AS participanta
                   FROM ( SELECT row_number() OVER () AS num,
                            association_ends.name,
                            association_ends.assoc_id,
                            association_ends.visibility,
                            association_ends.aggregation,
                            association_ends."isOrdered",
                            association_ends."isNavigable",
                            association_ends.multiplicity_range_lower,
                            association_ends.multiplicity_range_upper,
                            association_ends."targetScope",
                            association_ends.changeability,
                            association_ends.ordering,
                            association_ends.participant
                           FROM schema_name.association_ends) sub
                  WHERE mod(sub.num, 2::bigint) = 0
                ), nameb AS (
                 SELECT sub.name AS nameb,
                    sub.assoc_id,
                    sub.visibility AS visibilityb,
                    sub.aggregation AS aggregationb,
                    sub."isOrdered" AS isorderedb,
                    sub."isNavigable" AS isnavigableb,
                    sub.multiplicity_range_lower AS multiplicity_range_lowerb,
                    sub.multiplicity_range_upper AS multiplicity_range_upperb,
                    sub."targetScope" AS targetscopeb,
                    sub.changeability AS changeabilityb,
                    sub.ordering AS orderingb,
                    sub.participant AS participantb
                   FROM ( SELECT row_number() OVER () AS num,
                            association_ends.name,
                            association_ends.assoc_id,
                            association_ends.visibility,
                            association_ends.aggregation,
                            association_ends."isOrdered",
                            association_ends."isNavigable",
                            association_ends.multiplicity_range_lower,
                            association_ends.multiplicity_range_upper,
                            association_ends."targetScope",
                            association_ends.changeability,
                            association_ends.ordering,
                            association_ends.participant
                           FROM schema_name.association_ends) sub
                  WHERE mod(sub.num, 2::bigint) = 1
                )
         SELECT namea.namea,
            namea.assoc_id,
            namea.visibilitya,
            namea.aggregationa,
            namea.isordereda,
            namea.isnavigablea,
            namea.multiplicity_range_lowera,
            namea.multiplicity_range_uppera,
            namea.targetscopea,
            namea.changeabilitya,
            namea.orderinga,
            namea.participanta,
            nameb.nameb,
            nameb.assoc_id,
            nameb.visibilityb,
            nameb.aggregationb,
            nameb.isorderedb,
            nameb.isnavigableb,
            nameb.multiplicity_range_lowerb,
            nameb.multiplicity_range_upperb,
            nameb.targetscopeb,
            nameb.changeabilityb,
            nameb.orderingb,
            nameb.participantb
           FROM namea
             JOIN nameb ON namea.assoc_id = nameb.assoc_id
        )
 SELECT assoc_ends.visibilitya AS class1_visibility,
    assoc_ends.aggregationa AS class1_aggregation,
    assoc_ends.isordereda AS class1_isordered,
    assoc_ends.isnavigablea AS class1_isnavigable,
    assoc_ends.multiplicity_range_lowera AS class1_multiplicity_range_lower,
    assoc_ends.multiplicity_range_uppera AS class1_multiplicity_range_upper,
    assoc_ends.targetscopea AS class1_targetscope,
    assoc_ends.changeabilitya AS class1_changeability,
    assoc_ends.orderinga AS class1_ordering,
    assoc_ends.namea AS class1_assoc_name,
    uc1.name AS class1,
    uc2.name AS class2,
    assoc_ends.nameb AS class2_assoc_name,
    assoc_ends.visibilityb AS class2_visibility,
    assoc_ends.aggregationb AS class2_aggregation,
    assoc_ends.isorderedb AS class2_isordered,
    assoc_ends.isnavigableb AS class2_isnavigable,
    assoc_ends.multiplicity_range_lowerb AS class2_multiplicity_range_lower,
    assoc_ends.multiplicity_range_upperb AS class2_multiplicity_range_upper,
    assoc_ends.targetscopeb AS class2_targetscope,
    assoc_ends.changeabilityb AS class2_changeability,
    assoc_ends.orderingb AS class2_ordering
   FROM assoc_ends assoc_ends(namea, assoc_id, visibilitya, aggregationa, isordereda, isnavigablea, multiplicity_range_lowera, multiplicity_range_uppera, targetscopea, changeabilitya, orderinga, participanta, nameb, assoc_id_1, visibilityb, aggregationb, isorderedb, isnavigableb, multiplicity_range_lowerb, multiplicity_range_upperb, targetscopeb, changeabilityb, orderingb, participantb)
     LEFT JOIN schema_name.uml_classes uc1 ON assoc_ends.participanta::text = uc1.xmi_id::text
     LEFT JOIN schema_name.uml_classes uc2 ON assoc_ends.participantb::text = uc2.xmi_id::text;
