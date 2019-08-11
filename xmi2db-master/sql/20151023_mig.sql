--
-- Migration @ 15-10-23 | Views for CSV Export
--
 
-- View: schema_name.classes_attributes

-- DROP VIEW schema_name.classes_attributes;

CREATE OR REPLACE VIEW schema_name.classes_attributes AS 
 SELECT uml_classes.name AS class_name,
    uml_attributes.name AS atribute_name,
    uml_classes.xmi_id AS class_xmi_id,
    uml_classes.id AS class_id,
    uml_classes.package_id,
    uml_attributes.xmi_id AS attribute_xmi_id,
    uml_attributes.id AS attribute_id,
    uml_attributes.datatype AS attribute_datatype,
    uml_attributes.classifier AS attribute_classifier
   FROM schema_name.uml_classes,
    schema_name.uml_attributes
  WHERE uml_classes.id = uml_attributes.uml_class_id;

-- View: schema_name.classes_attributes_types

-- DROP VIEW schema_name.classes_attributes_types;

CREATE OR REPLACE VIEW schema_name.classes_attributes_types AS 
 SELECT t1.class_name,
    t1.atribute_name,
    t1.class_xmi_id,
    t1.class_id,
    t1.attribute_xmi_id,
    t1.attribute_id,
    t1.package_id,
    t2.name AS datatype,
    t1.attribute_datatype,
    t3.name AS classifier,
    t1.attribute_classifier
   FROM schema_name.classes_attributes t1
     LEFT JOIN schema_name.datatypes t2 ON t1.attribute_datatype::text = t2.xmi_id::text
     LEFT JOIN schema_name.uml_classes t3 ON t1.attribute_classifier::text = t3.xmi_id::text;

-- View: schema_name.class_children

-- DROP VIEW schema_name.class_children;

CREATE OR REPLACE VIEW schema_name.class_children AS 
 SELECT uml_classes.name AS parent_name,
    class_generalizations.child_id
   FROM schema_name.uml_classes
     LEFT JOIN schema_name.class_generalizations ON class_generalizations.parent_id::text = uml_classes.xmi_id::text;

-- View: schema_name.classes_comments

-- DROP VIEW schema_name.classes_comments;

CREATE OR REPLACE VIEW schema_name.classes_comments AS 
 SELECT comments.id AS comment_id,
    comments.xmi_id AS comment_xmi_id,
    comments."isSpecification" AS "comment_isSpecification",
    comments.body,
    comments.class_id,
    uml_classes.xmi_id,
    uml_classes.name,
    uml_classes.visibility,
    uml_classes."isSpecification",
    uml_classes."isRoot",
    uml_classes."isLeaf",
    uml_classes."isActive",
    uml_classes.package_id,
    uml_classes.model_id,
    uml_classes.created_at,
    uml_classes.updated_at,
    uml_classes."isAbstract",
    uml_classes.id,
    uml_classes.stereotype_id,
    uml_classes.general_id
   FROM schema_name.uml_classes
     LEFT JOIN schema_name.comments ON comments.class_id::text = uml_classes.xmi_id::text;
  
-- View: schema_name.generalizations

-- DROP VIEW schema_name.generalizations;

CREATE OR REPLACE VIEW schema_name.generalizations AS 
 SELECT class_children.parent_name,
    classes_comments.name,
    class_children.child_id,
    classes_comments.package_id,
    classes_comments.body AS comment
   FROM schema_name.classes_comments
     LEFT JOIN schema_name.class_children ON class_children.child_id::text = classes_comments.xmi_id::text;

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

-- View: schema_name."packages_parent-name"

-- DROP VIEW schema_name."packages_parent-name";

CREATE OR REPLACE VIEW schema_name."packages_parent-name" AS 
 WITH RECURSIVE subpackage AS (
         SELECT p.xmi_id,
            p.name,
            p.visibility,
            p."isSpecification",
            p."isRoot",
            p."isLeaf",
            p."isAbstract",
            p.created_at,
            p.updated_at,
            p.model_id,
            p.parent_package_id,
            p.id,
            p.stereotype_id
           FROM schema_name.packages p
        UNION ALL
         SELECT sp.xmi_id,
            sp.name,
            sp.visibility,
            sp."isSpecification",
            sp."isRoot",
            sp."isLeaf",
            sp."isAbstract",
            sp.created_at,
            sp.updated_at,
            sp.model_id,
            sp.parent_package_id,
            sp.id,
            sp.stereotype_id
           FROM schema_name.packages sp
             JOIN subpackage spc ON sp.parent_package_id = spc.id
        )
 SELECT DISTINCT ON (pc.id) pc.xmi_id,
    pc.name,
    pc.visibility,
    pc."isSpecification",
    pc."isRoot",
    pc."isLeaf",
    pc."isAbstract",
    pc.created_at,
    pc.updated_at,
    pc.model_id,
    pc.parent_package_id,
    pc.id,
    pc.stereotype_id,
    parent.name AS parent_package_name
   FROM subpackage pc
     LEFT JOIN schema_name.packages parent ON parent.id = pc.parent_package_id
  ORDER BY pc.id;

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