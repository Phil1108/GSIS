INSERT INTO schema_name.packages (name)
VALUES
	('ISO/TC 211');

INSERT INTO schema_name.packages (name, parent_package_id)
VALUES
	('ISO 19115 All', (SELECT id FROM schema_name.packages WHERE name = 'ISO/TC 211'));

INSERT INTO schema_name.packages (name, parent_package_id)
VALUES
	('ISO 19115:2003 Metadata', (SELECT id FROM schema_name.packages WHERE name = 'ISO 19115 All'));

INSERT INTO schema_name.packages (name, parent_package_id)
VALUES
	('Data quality information', (SELECT id FROM schema_name.packages WHERE name = 'ISO 19115:2003 Metadata')),
	('Citation and responsible party information', (SELECT id FROM schema_name.packages WHERE name = 'ISO 19115:2003 Metadata'));

INSERT INTO schema_name.uml_classes (name, stereotype_id, package_id)
VALUES
	('DQ_AbsoluteExternalPositionalAccuracy', (SELECT xmi_id FROM schema_name.stereotypes WHERE name = 'DataType'), (SELECT id FROM schema_name.packages WHERE name = 'Data quality information')),
	('DQ_RelativeInternalPositionalAccuracy', (SELECT xmi_id FROM schema_name.stereotypes WHERE name = 'DataType'), (SELECT id FROM schema_name.packages WHERE name = 'Data quality information')),
	('LI_Lineage', (SELECT xmi_id FROM schema_name.stereotypes WHERE name = 'DataType'), (SELECT id FROM schema_name.packages WHERE name = 'Data quality information')),
	('LI_ProcessStep', (SELECT xmi_id FROM schema_name.stereotypes WHERE name = 'DataType'), (SELECT id FROM schema_name.packages WHERE name = 'Data quality information')),
	('LI_Source', (SELECT xmi_id FROM schema_name.stereotypes WHERE name = 'DataType'), (SELECT id FROM schema_name.packages WHERE name = 'Data quality information')),
	('CI_ResponsibleParty', (SELECT xmi_id FROM schema_name.stereotypes WHERE name = 'DataType'), (SELECT id FROM schema_name.packages WHERE name = 'Citation and responsible party information')),
	('CI_Contact', (SELECT xmi_id FROM schema_name.stereotypes WHERE name = 'DataType'), (SELECT id FROM schema_name.packages WHERE name = 'Citation and responsible party information')),
	('CI_RoleCode', (SELECT xmi_id FROM schema_name.stereotypes WHERE name = 'enumeration'), (SELECT id FROM schema_name.packages WHERE name = 'Citation and responsible party information'));

INSERT INTO schema_name.uml_attributes (name, uml_class_id)
VALUES
	('resourceProvider', (SELECT id FROM schema_name.uml_classes WHERE name = 'CI_RoleCode')),
	('custodian', (SELECT id FROM schema_name.uml_classes WHERE name = 'CI_RoleCode')),
	('owner', (SELECT id FROM schema_name.uml_classes WHERE name = 'CI_RoleCode')),
	('user', (SELECT id FROM schema_name.uml_classes WHERE name = 'CI_RoleCode')),
	('distributor', (SELECT id FROM schema_name.uml_classes WHERE name = 'CI_RoleCode')),
	('originator', (SELECT id FROM schema_name.uml_classes WHERE name = 'CI_RoleCode')),
	('pointOfContact', (SELECT id FROM schema_name.uml_classes WHERE name = 'CI_RoleCode')),
	('principalInvestigator', (SELECT id FROM schema_name.uml_classes WHERE name = 'CI_RoleCode')),
	('processor', (SELECT id FROM schema_name.uml_classes WHERE name = 'CI_RoleCode')),
	('publisher', (SELECT id FROM schema_name.uml_classes WHERE name = 'CI_RoleCode')),
	('author', (SELECT id FROM schema_name.uml_classes WHERE name = 'CI_RoleCode'));