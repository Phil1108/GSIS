-- View: schema_name.classes_with_attributes

CREATE OR REPLACE VIEW schema_name.classes_with_attributes AS 
	SELECT
		c.id AS class_id,
		c.name AS class_name,
		cs.name AS class_sterotype,
		a.name AS attribute_name, 
		CASE
			WHEN a.datatype::text <> ''::text THEN 'datatype'::text
			ELSE 'classifier'::text
		END AS datatype_type, 
		CASE
			WHEN a.datatype::text <> ''::text THEN ad.name
			ELSE ac.name
		END AS attribute_datatype, 
		CASE
			WHEN a.datatype::text <> ''::text THEN adcs.name
			ELSE acs.name
		END AS attribute_stereotype,
		a.multiplicity_range_lower,
		a.multiplicity_range_upper
	FROM schema_name.uml_classes c
		JOIN schema_name.stereotypes cs ON c.stereotype_id::text = cs.xmi_id::text
		LEFT JOIN schema_name.uml_attributes a ON c.id = a.uml_class_id
		LEFT JOIN schema_name.datatypes ad ON a.datatype::text = ad.xmi_id::text
		LEFT JOIN schema_name.uml_classes ac ON a.classifier::text = ac.xmi_id::text
		LEFT JOIN schema_name.stereotypes acs ON ac.stereotype_id::text = acs.xmi_id::text
		LEFT JOIN schema_name.uml_classes adc ON ad.name::text = adc.name::text
		LEFT JOIN schema_name.stereotypes adcs ON adc.stereotype_id::text = adcs.xmi_id::text;