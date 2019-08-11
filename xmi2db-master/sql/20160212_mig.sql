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
   FROM schema_name.uml_classes
     LEFT JOIN schema_name.uml_attributes ON uml_attributes.uml_class_id = uml_classes.id;
