<?php
class xmi2db {
  private $root_element;
  private $table;
  private $data;
  private $xmi_file;
  private $basePackage;
  private $progress;

  /**
   * Constructor
   *
   * @param XMI root element
   */
  function xmi2db($schema) {
    $this->root_element = 'XMI.content';
    $this->schema = $schema;
  }

  /**
   * Sets the xmi file to read
   *
   * @param file (can be local or remote http://..)
   */
  function setXMIFile($xmi_file) {
    $this->xmi_file = $xmi_file;
  }

  /**
   * Sets the tables for the sql insert
   *
   * @param the table
   */
  function setTable($table) {
    if(!is_array($table))
      return false;
    $this->table = $table;
  }

  function fillArgoDatatypes() {
    $sql  = "INSERT INTO ".$this->schema.".datatypes VALUES (1, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001158', 'CharacterString', false, false, false, false, '2015-10-02 16:24:03.409462');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (2, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001159', 'Boolean', false, false, false, false, '2015-10-02 16:24:03.41137');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (3, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:000000000000115A', 'Real', false, false, false, false, '2015-10-02 16:24:03.414655');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (4, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:000000000000115B', 'Number', false, false, false, false, '2015-10-02 16:24:03.415232');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (5, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:000000000000115C', 'Decimal', false, false, false, false, '2015-10-02 16:24:03.416677');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (6, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:000000000000115D', 'Date', false, false, false, false, '2015-10-02 16:24:03.417323');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (7, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:000000000000115E', 'Time', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (8, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:000000000000115F', 'DateTime', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (9, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001160', 'Integer', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (10, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001161', 'Vector', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (11, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001162', 'GenericName', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (12, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001163', 'LocalName', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (13, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001164', 'ScopedName', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (14, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001165', 'Length', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (15, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001166', 'Distance', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (16, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001167', 'Angle', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (17, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001168', 'Speed', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (18, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001169', 'Scale', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (19, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:000000000000116A', 'Area', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (20, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:000000000000116B', 'Volume', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (21, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:000000000000116C', 'Measure', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (22, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:000000000000116D', 'Sign', false, false, false, false, '2015-10-02 16:24:03.418176');";
    $sql .= "INSERT INTO ".$this->schema.".datatypes VALUES (23, 'http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:000000000000116E', 'UnitOfMeasure', false, false, false, false, '2015-10-02 16:24:03.418176');";
    echo '<br><b>Hinzufügen der ISO19136 Datatypes.</b>';
    echo '<br>' . $sql;
    pg_query($this->conn, $sql);
  }

  function fillArgoStereotypes() {
    $sql  = "INSERT INTO ".$this->schema.".stereotypes VALUES ('http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001171', 'Application Schema', NULL, false, false, false, false, 'Model', NULL, '2015-10-02 16:24:03.409462', NULL, 1);";
    $sql .= "INSERT INTO ".$this->schema.".stereotypes VALUES ('http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001173', 'DataType', NULL, false, false, false, false, 'Class', NULL, '2015-10-02 16:24:03.41137', NULL, 2);";
    $sql .= "INSERT INTO ".$this->schema.".stereotypes VALUES ('http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001174', 'Enumeration', NULL, false, false, false, false, 'Class', NULL, '2015-10-02 16:24:03.414655', NULL, 3);";
    $sql .= "INSERT INTO ".$this->schema.".stereotypes VALUES ('http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001175', 'CodeList', NULL, false, false, false, false, 'Class', NULL, '2015-10-02 16:24:03.415232', NULL, 4);";
    $sql .= "INSERT INTO ".$this->schema.".stereotypes VALUES ('http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001176', 'Union', NULL, false, false, false, false, 'Class', NULL, '2015-10-02 16:24:03.416677', NULL, 5);";
    $sql .= "INSERT INTO ".$this->schema.".stereotypes VALUES ('http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001177', 'FeatureType', NULL, false, false, false, false, 'Class', NULL, '2015-10-02 16:24:03.417323', NULL, 6);";
    $sql .= "INSERT INTO ".$this->schema.".stereotypes VALUES ('http://argouml.org/user-profiles/ISO19136_Profile.xmi#-117-30-110-24-3c98ba4d:11d6bf2b1c7:-8000:0000000000001178', 'Type', NULL, false, false, false, false, 'Class', NULL, '2015-10-02 16:24:03.418176', NULL, 7);";
    echo '<br><b>Hinzufügen der ISO19136 Stereotypes.</b>';
    echo '<br>' . $sql;
    pg_query($this->conn, $sql);
  }

  function truncateTables() {
    $sql  = "TRUNCATE ".$this->schema.".association_classes;";
    $sql .= "ALTER SEQUENCE ".$this->schema.".association_classes_testid_seq RESTART;";
    $sql .= "TRUNCATE ".$this->schema.".association_ends;";
    $sql .= "ALTER SEQUENCE ".$this->schema.".association_ends_id_seq RESTART;";
    $sql .= "TRUNCATE ".$this->schema.".class_generalizations;";
    $sql .= "ALTER SEQUENCE ".$this->schema.".class_generalizations_id_seq RESTART;";
    $sql .= "TRUNCATE ".$this->schema.".datatypes;";
    $sql .= "ALTER SEQUENCE ".$this->schema.".datatypes_id_seq RESTART;";
    $sql .= "TRUNCATE ".$this->schema.".packages;";
    $sql .= "ALTER SEQUENCE ".$this->schema.".packages_id_seq RESTART;";
    $sql .= "TRUNCATE ".$this->schema.".stereotypes;";
    $sql .= "ALTER SEQUENCE ".$this->schema.".stereotypes_id_seq RESTART;";
    $sql .= "TRUNCATE ".$this->schema.".taggedvalues;";
    $sql .= "ALTER SEQUENCE ".$this->schema.".taggedvalues_id_seq RESTART;";
    $sql .= "TRUNCATE ".$this->schema.".tagdefinitions;";
    $sql .= "ALTER SEQUENCE ".$this->schema.".tagdefinitions_id_seq RESTART;";
    $sql .= "TRUNCATE ".$this->schema.".uml_attributes;";
    $sql .= "ALTER SEQUENCE ".$this->schema.".uml_attributes_id_seq RESTART;";
    $sql .= "TRUNCATE ".$this->schema.".uml_classes;";
    $sql .= "ALTER SEQUENCE ".$this->schema.".uml_classes_id2_seq RESTART;";
    $sql .= "TRUNCATE ".$this->schema.".comments;";
    $sql .= "ALTER SEQUENCE ".$this->schema.".comments_id_seq RESTART;";
    echo '<br><b>Leeren der Datentabellen und zurücksetzen der Autowerte.</b>';
    echo '<br>' . $sql;
    pg_query($this->conn, $sql);
  }

  /**
   * Sets the base package
   *
   * @param the base package
   */
  function setBasePackage($basePackage) {
    $this->basePackage = $basePackage;
  }

  /**
   * Sets the configured packages
   *
   * @param the configured package array
   */
  function setConfiguredPackages($packages_conf) {
    $this->packages_conf = $packages_conf;
  }

  /**
   * Sets the DB connection
   *
   * @param the DB connection
   */
  function setConn($conn) {
    //$this->conn = pg_connect($conn);
    $this->conn = $conn;
  }

  /**
   * Sets the DB schema
   *
   * @param the DB schema
   */
  function setSchema($schema) {
    $this->schema = $schema;
  }

  function openConnection($host = 'localhost', $dbname = 'postgres', $user = 'postgres', $password = 'postgres', $port = 5432) {
    $this->conn = pg_connect(
        "host=" . $host .
        " port=" . $port .
        " dbname=" . $dbname .
        " user=" . $user .
        " password=" . $password
        ) or exit (
          "Es konnte keine Verbindung zum Datenbankserver hergestellt werden."
        );
    return $this->conn;
  }

  function getQueriesForPackages($package) {
    return $package->attributes()->name;
  }

  function getQueriesForStereotypes() {
    //if name="enumeration" getQueriesForStereotypesEnumarations()
    //if name="CodeList" getQueriesForStereotypesCodeList()
  }

  function getQueriesForStereotypesEnumarations() {
  }

  function getQueriesForStereotypesCodeList() {
  }

  /**association_classes
    id   integer
    xmi_id   character varying(255)
    name   character varying(255)
    model_id   integer
    visibility   boolean
    isSpecification   boolean
    isRoot   boolean
    isLeaf   boolean
    isAbstract   boolean
    isActive   boolean
    package_id   integer
    created_at   timestamp without time zone
    updated_at
   */
  function buildQueryForAssociation($association, $packageId) {
    //1. Association mit zugehöriger package_id speichern, ID zurückgeben
    //offen:
    //    model_id
    //    isActive
    //    updated_at
    $sql = "INSERT INTO ".$this->schema.".association_classes (xmi_id, visibility, \"isRoot\", \"isLeaf\", \"isAbstract\", package_id, created_at) VALUES('" . $association['xmi.id'] . "', '" . $association['visibility'] . "', '" . $association['isRoot'] . "', '" . $association['isLeaf'] . "', '" . $association['isAbstract'] . "', '" . $packageId . "', CURRENT_TIMESTAMP) RETURNING id";
    //echo '<br>' . $sql;
    $result = pg_query($this->conn, $sql);
    $row = pg_fetch_row($result);
    //echo '<br>Returned id: ' . $row[0];
    return $row[0];
    //2. AssociationEnds der Association speichern und dabei ID der Association angeben
  }

  /**  association_ends
    id  integer
    assoc_id  integer
    name  character varying
    visibility  character varying
    aggregation  character varying
    isOrdered  boolean
    isNavigable  boolean
    type
    created_at
    multiplicity_range_lower
    multiplicity_range_upper
    participant
   */
  function buildQueryForAssociationEnd($associationEnd, $association_id) {
    //EA: isOrdered, ArgoUML: ordering
    if (isset($associationEnd['isOrdered'])) $isOrdered = "', '" . $associationEnd['isOrdered']. "', '";
    else $isOrdered = "', NULL, '";
    //2. AssociationEnds der Association speichern und dabei ID der Association angeben
    $sql = "INSERT INTO ".$this->schema.".association_ends (assoc_id, name, visibility, aggregation, \"isOrdered\", \"isNavigable\", type, multiplicity_range_lower, multiplicity_range_upper, \"targetScope\", changeability, ordering, participant, created_at) VALUES('" . $association_id . "', '" . $associationEnd['name'] . "', '" . $associationEnd['visibility'] . "', '" . $associationEnd['aggregation'] . $isOrdered . $associationEnd['isNavigable'] . "', '" . $associationEnd['type'] . "', '" . $associationEnd['multiplicity_range_lower'] . "', '" . $associationEnd['multiplicity_range_upper'] . "', '" . $associationEnd['targetScope'] . "', '" . $associationEnd['changeability'] . "', '" . $associationEnd['ordering'] . "', '" . $associationEnd['participant'] . "', CURRENT_TIMESTAMP) RETURNING id";
    //echo '<br>' . $sql;
    $result = pg_query($this->conn, $sql);
    $row = pg_fetch_row($result);
    //echo '<br>Returned id: ' . $row[0];
    return $row[0];
  }

  /** uml_classes
    id   integer
    xmi_id   character varying(255)
    name   character varying(255)
    visibility   character varying(255)
    isSpecification   boolean
    isRoot   boolean
    isLeaf   boolean
    isActive   boolean
    package_id   integer
    model_id   integer
    created_at   timestamp without time zone
    updated_at   timestamp without time zone
    isAbstract
    stereotype_id   character varying
    general_id
   */
  function buildQueryForClass($class, $package_id) {
    //1. Klasse mit zugehöriger package_id speichern, ID zurückgeben
    //offen:
    //    model_id
    //    isActive
    //    updated_at
    $sql = "INSERT INTO ".$this->schema.".uml_classes (xmi_id, name, visibility, \"isSpecification\", \"isRoot\", \"isLeaf\", \"isAbstract\", package_id, stereotype_id, general_id, created_at) VALUES('" . $class['xmi.id'] . "', '" . $class['name'] . "', '" . $class['visibility'] . "', '" . $class['isSpecification'] . "', '" . $class['isRoot'] . "', '" . $class['isLeaf'] . "', '" . $class['isAbstract'] . "', '" . $package_id . "', '" . $class['stereotype_id'] . "', '" . $class['general_id'] . "', CURRENT_TIMESTAMP) RETURNING id";
    //echo '<br>' . $sql;
    $result = pg_query($this->conn, $sql);
    $row = pg_fetch_row($result);
    //echo '<br>Returned id: ' . $row[0];
    return $row[0];
  }

  /** packages
    xmi_id   character varying(255)
    name   character varying(255)
    visibility   character varying(255)
    isSpecification   boolean
    isRoot   boolean
    isLeaf   boolean
    isAbstract   boolean
    created_at   timestamp without time zone
    updated_at   timestamp without time zone
    model_id   integer
    parent_package_id   integer
    id
    stereotype_id   character varying
   */
  function buildQueryForPackage($package, $packageIdTop, $stereotype_id) {
    //1. Package speichern, ID zurückgeben
    //offen:
    //    isSpecification
    //    model_id
    //    updated_at
    $sql = "INSERT INTO ".$this->schema.".packages (xmi_id, name, visibility, \"isRoot\", \"isLeaf\", \"isAbstract\", parent_package_id, stereotype_id, created_at) VALUES('" . $package['xmi.id'] . "', '" . $package['name'] . "', '" . $package['visibility'] . "', '" . $package['isRoot'] . "', '" . $package['isLeaf'] . "', '" . $package['isAbstract'] . "', " . $packageIdTop . ", '" . $stereotype_id . "', CURRENT_TIMESTAMP) RETURNING id";
    //echo '<br>' . $sql;
    $result = pg_query($this->conn, $sql);
    $row = pg_fetch_row($result);
    //echo '<br>Returned id: ' . $row[0];
    return $row[0];
  }

  /** uml_attributes
    xmi_id   character varying(255)   +
    name   character varying(255)   +
    model_id   integer   ?
    uml_class_id   integer   +
    visibility   character varying(255)   +
    isSpecification   boolean   ?
    ownerSpace   character varying(255)   +
    changeability   character varying(255)   +
    targetScope   character varying(255)   +
    ordering   character varying(255)   +
    created_at   timestamp without time zone   +
    updated_at   timestamp without time zone   ?
    id   integer  +
    !!!new:
    datatype (StructuralFeature DataType IDref)
    classifier (StructuralFeature Classifier IDref)
    multiplicity_id (Multiplicity id)
    multiplicity_range_id (MultiplicityRange ID)
    multiplicity_range_lower (MultiplicityRange lower)
    multiplicity_range_upper (MultiplicityRange upper)
    initialvalue_id
    initialvalue_body
   */
  function buildQueryForAttribute($attribute, $class_id) {
    //1. Attribut mit zugehöriger class_id speichern, ID zurückgeben
    //offen: s.o. (?)
    $sql = "INSERT INTO ".$this->schema.".uml_attributes (xmi_id, name, uml_class_id, visibility, \"ownerSpace\", changeability, \"targetScope\", ordering, datatype, classifier, multiplicity_id, multiplicity_range_id, multiplicity_range_lower, multiplicity_range_upper, initialvalue_id, initialvalue_body, created_at) VALUES('" . $attribute['xmi.id'] . "', '" . $attribute['name'] . "', '" . $class_id . "', '" . $attribute['visibility'] . "', '" . $attribute['ownerSpace'] . "', '" . $attribute['changeability'] . "', '" . $attribute['targetScope'] . "', '" . $attribute['ordering'] . "', '" . $attribute['datatype'] . "', '" . $attribute['classifier'] . "', '" . $attribute['multiplicity_id'] . "', '" . $attribute['multiplicity_range_id'] . "', '" . $attribute['multiplicity_range_lower'] . "', '" . $attribute['multiplicity_range_upper'] . "', '" . $attribute['initialvalue_id'] . "', '" . $attribute['initialvalue_body'] . "', CURRENT_TIMESTAMP) RETURNING id";
    //echo '<br>' . $sql;
    $result = pg_query($this->conn, $sql);
    $row = pg_fetch_row($result);
    //echo '<br>Returned id: ' . $row[0];
    return $row[0];

    //2. taggedValue
  }

  /** taggedvalues
    id   integer
    xmi_id   character varying
    isSpecification   character varying
    datavalue   character varying
    type   character varying
    created_at   timestamp without time zone
    attribute_id
    class_id
   */
  function buildQueryForTaggedValue($taggedvalue, $attributeId, $classId) {
    //1. taggedValue mit zugehöriger attributeId speichern (falls gesetzt), ID zurückgeben
    //offen: s.o. (?)
    if (isset($taggedvalue['xmi.id'])) $taggedvalueRef = $taggedvalue['xmi.id'];
    if (isset($taggedvalue['href'])) $taggedvalueRef = $taggedvalue['href'];

    $sql = "INSERT INTO ".$this->schema.".taggedvalues (xmi_id, \"isSpecification\", datavalue, type, attribute_id, class_id, created_at) VALUES('" . $taggedvalueRef . "', '" . $taggedvalue['isSpecification'] . "', '" . $taggedvalue['dataValue'] . "', '" . $taggedvalue['taggedValueType'] . "', " . $attributeId . ", " . $classId . ", CURRENT_TIMESTAMP) RETURNING id";
    //echo '<br>' . $sql;
    $result = pg_query($this->conn, $sql);
    $row = pg_fetch_row($result);
    //echo '<br>Returned id: ' . $row[0];
    return $row[0];
  }

  /** stereotypes
    xmi_id   character varying(255)   +
    name   character varying(255)   +
    model_id   integer   ?
    isSpecification   boolean   +
    isRoot   boolean   +
    isLeaf   boolean   +
    isAbstract   boolean   +
    baseClass   character varying(255)   +
    stereotype_id   integer   ?
    created_at   timestamp without time zone   +
    updated_at   timestamp without time zone   ?
    id+
  */
  function buildQueryForStereotype($stereotype) {
    //1. Stereotype speichern, ID zurückgeben
    //offen: s.o. (?)
    $sql = "INSERT INTO ".$this->schema.".stereotypes (xmi_id, name, \"isSpecification\", \"isRoot\", \"isLeaf\", \"isAbstract\", \"baseClass\", created_at) VALUES('" . $stereotype['xmi.id'] . "', '" . $stereotype['name'] . "', '" . $stereotype['isSpecification'] . "', '" . $stereotype['isRoot'] . "', '" . $stereotype['isLeaf'] . "', '" . $stereotype['isAbstract'] . "', '" . $stereotype['baseClass'] . "', CURRENT_TIMESTAMP) RETURNING id";
    //echo '<br>' . $sql;
    $result = pg_query($this->conn, $sql);
    $row = pg_fetch_row($result);
    //echo '<br>Returned id: ' . $row[0];
    return $row[0];
  }

  /** tagdefinitions
    xmi_id   character varying(255)   +
    name   character varying(255)   +
    isSpecification   boolean   +
    tagType+
    created_at   timestamp without time zone   +
    updated_at   timestamp without time zone   ?
    id+
   */
  function buildQueryForTagDefinition($tagdefinition) {
    //1. TagDefinition speichern, ID zurückgeben
    $sql = "INSERT INTO ".$this->schema.".tagdefinitions (xmi_id, name, \"isSpecification\", \"tagType\", created_at) VALUES('" . $tagdefinition['xmi.id'] . "', '" . $tagdefinition['name'] . "', '" . $tagdefinition['isSpecification'] . "', '" . $tagdefinition['tagType'] . "', CURRENT_TIMESTAMP) RETURNING id";
    //echo '<br>' . $sql;
    $result = pg_query($this->conn, $sql);
    $row = pg_fetch_row($result);
    //echo '<br>Returned id: ' . $row[0];
    return $row[0];
  }

  /** datatypes
    xmi_id   character varying(255)   +
    name   character varying(255)   +
    isRoot   boolean   +
    isLeaf   boolean   +
    isAbstract   boolean   +
    visibility   character varying(255)   +
    created_at   timestamp without time zone   +
    updated_at   timestamp without time zone   ?
    id+
   */
  function buildQueryForDataType($datatype) {
    //1. DataType speichern, ID zurückgeben
    //offen: s.o. (?)
    $sql = "INSERT INTO ".$this->schema.".datatypes (xmi_id, name, \"isRoot\", \"isLeaf\", \"isAbstract\", visibility, created_at) VALUES('" . $datatype['xmi.id'] . "', '" . $datatype['name'] . "', '" . $datatype['isRoot'] . "', '" . $datatype['isLeaf'] . "', '" . $datatype['isAbstract'] . "', '" . $datatype['visibility'] . "', CURRENT_TIMESTAMP) RETURNING id";
    //echo '<br>' . $sql;
    $result = pg_query($this->conn, $sql);
    $row = pg_fetch_row($result);
    //echo '<br>Returned id: ' . $row[0];
    return $row[0];
  }

  /** class_generalizations
    xmi_id   character varying(255)   +
    name   character varying(255)+
    model_id   integer   ?
    isSpecification   boolean +
    package_id   integer
    parent_id   integer
    child_id   integer
    created_at   timestamp without time zone
    updated_at   timestamp without time zone
    id   integer
  */
  function buildQueryForGeneralization($generalization, $package_id) {
    //1. Klasse mit zugehöriger package_id speichern, ID zurückgeben
    //offen:
    //    model_id
    //    isActive
    //    updated_at
    $sql = "INSERT INTO ".$this->schema.".class_generalizations (xmi_id, name, \"isSpecification\", package_id, parent_id, child_id, created_at) VALUES('" . $generalization['xmi.id'] . "', '" . $generalization['name'] . "', '" . $generalization['isSpecification'] . "', '" . $package_id . "', '" . $generalization['parent_id'] . "', '" . $generalization['child_id'] . "', CURRENT_TIMESTAMP) RETURNING id";
    //echo '<br>' . $sql;
    $result = pg_query($this->conn, $sql);
    $row = pg_fetch_row($result);
    //echo '<br>Returned id: ' . $row[0];
    return $row[0];
  }

  /** comments
    id
    xmi_id
    isSpecification
    body
    class_id
    package_id
    created_at   timestamp without time zone
    updated_at   timestamp without time zone
  */
  function buildQueryForComment($comment, $package_id) {
    $sql = "INSERT INTO ".$this->schema.".comments (xmi_id, \"isSpecification\", body, package_id, class_id, created_at) VALUES('" . $comment['xmi.id'] . "', '" . $comment['isSpecification'] . "', '" . $comment['body'] . "', '" . $package_id . "', '" . $comment['class_id'] . "', CURRENT_TIMESTAMP) RETURNING id";
    //echo '<br>' . $sql;
    $result = pg_query($this->conn, $sql);
    $row = pg_fetch_row($result);
    //echo '<br>Returned id: ' . $row[0];
    return $row[0];
  }

  function getAttributeInfos($xml) {
    $infoArray  = array();
    if (isset($xml->attributes()->name)) {
      //echo "name: ".$xml->attributes()->name."<br>";
      $infoArray['name'] = (string) str_replace("'", "", $xml->attributes()->name);
    }
    else $infoArray['name'] = "<undefined>";

    if (isset($xml->attributes()->{'xmi.id'})) {
      //echo "xmi.id: ".$xml->attributes()->{'xmi.id'}."<br>";
      $infoArray['xmi.id'] = (string) $xml->attributes()->{'xmi.id'};
    }
    if (isset($xml->attributes()->isSpecification)) {
      //echo "isSpecification: ".$xml->attributes()->isSpecification."<br>";
      $infoArray['isSpecification'] = (string) $xml->attributes()->isSpecification;
    }
    if (isset($xml->attributes()->isRoot)) {
      //echo "isRoot: ".$xml->attributes()->isRoot."<br>";
      $infoArray['isRoot'] = (string) $xml->attributes()->isRoot;
    }
    if (isset($xml->attributes()->isLeaf)) {
      //echo "isLeaf: ".$xml->attributes()->isLeaf."<br>";
      $infoArray['isLeaf'] = (string) $xml->attributes()->isLeaf;
    }
    if (isset($xml->attributes()->isAbstract)) {
      //echo "isAbstract: ".$xml->attributes()->isAbstract."<br>";
      $infoArray['isAbstract'] = (string) $xml->attributes()->isAbstract;
    }
    if (isset($xml->attributes()->visibility)) {
      //echo "visibility: ".$xml->attributes()->visibility."<br>";
      $infoArray['visibility'] = (string) $xml->attributes()->visibility;
    }
    if (isset($xml->attributes()->tagType)) {
      //echo "tagType: ".$xml->attributes()->tagType."<br>";
      $infoArray['tagType'] = (string) $xml->attributes()->tagType;
    }
    if (isset($xml->attributes()->ownerScope)) {
      //echo "ownerScope: ".$xml->attributes()->ownerScope."<br>";
      $infoArray['ownerScope'] = (string) $xml->attributes()->ownerScope;
    }
    if (isset($xml->attributes()->changeability)) {
      //echo "changeability: ".$xml->attributes()->changeability."<br>";
      $infoArray['changeability'] = (string) $xml->attributes()->changeability;
    }
    if (isset($xml->attributes()->ordering)) {
      //echo "ordering: ".$xml->attributes()->ordering."<br>";
      $infoArray['ordering'] = (string) $xml->attributes()->ordering;
    }
    if (isset($xml->attributes()->targetScope)) {
      //echo "targetScope: ".$xml->attributes()->targetScope."<br>";
      $infoArray['targetScope'] = (string) $xml->attributes()->targetScope;
    }
    if (isset($xml->attributes()->aggregation)) {
      //echo "aggregation: ".$xml->attributes()->aggregation."<br>";
      $infoArray['aggregation'] = (string) $xml->attributes()->aggregation;
    }
    if (isset($xml->attributes()->isOrdered)) {
      //echo "isOrdered: ".$xml->attributes()->isOrdered."<br>";
      $infoArray['isOrdered'] = (string) $xml->attributes()->isOrdered;
    }
    if (isset($xml->attributes()->isNavigable)) {
      //echo "isNavigable: ".$xml->attributes()->isNavigable."<br>";
      $infoArray['isNavigable'] = (string) $xml->attributes()->isNavigable;
    }
    if (isset($xml->attributes()->type)) {
      //echo "type: ".$xml->attributes()->type."<br>";
      $infoArray['type'] = (string) $xml->attributes()->type;
    }
    if (isset($xml->attributes()->body)) {
      //echo "body: ".$xml->attributes()->body."<br>";
      $infoArray['body'] = (string) $xml->attributes()->body;
    }
    if (isset($xml->{'TaggedValue.dataValue'})) {//Problem: 'Art' gibt die Namen der Attribute an, ...
      $infoArray['dataValue'] = (string) str_replace("'", "", $xml->{'TaggedValue.dataValue'});
    }
    if (isset($xml->{'TaggedValue.type'})) {
      if (isset($xml->{'TaggedValue.type'}->TagDefinition->attributes()->{'xmi.idref'})) $infoArray['taggedValueType'] = (string) $xml->{'TaggedValue.type'}->TagDefinition->attributes()->{'xmi.idref'};
      if (isset($xml->{'TaggedValue.type'}->TagDefinition->attributes()->href)) $infoArray['taggedValueType'] = (string) $xml->{'TaggedValue.type'}->TagDefinition->attributes()->href;
    }
    return $infoArray;
  }

  /**
   * Deprecated
   */
  function getTaggedValueInfos($taggedValue) {
    $taggedValueInfoArray = array();
    //$this->getAttributeInfos($taggedValue);
    $taggedValueInfoArray['dataValue'] = (string) $taggedValue->{'TaggedValue.dataValue'};
    $taggedValueInfoArray['taggedValueType'] = (string) $taggedValue->{'TaggedValue.type'}->TagDefinition->attributes()->{'xmi.idref'};
    //echo "TaggedValue dataValue: ".$taggedValue->{'TaggedValue.dataValue'}."<br>";
    //echo "TaggedValue type: ".$taggedValue->{'TaggedValue.type'}->TagDefinition->attributes()->{'xmi.idref'}."<br>";
  }

  function getMultiplicityInfos($multiplicity) {
    $infoArray  = array();
    if (isset($multiplicity->attributes()->{'xmi.id'})) {
      //echo "StructuralFeature Multiplicity id: ".$multiplicity->attributes()->{'xmi.id'}."<br>";
      $infoArray['multiplicity_id'] = (string) $multiplicity->attributes()->{'xmi.id'};
    }
    if (isset($multiplicity->{'Multiplicity.range'}->MultiplicityRange->attributes()->{'xmi.id'})) {
      //echo "StructuralFeature Multiplicity Range id: ".$multiplicity->{'Multiplicity.range'}->MultiplicityRange->attributes()->{'xmi.id'}."<br>";
      $infoArray['multiplicity_range_id'] = (string) $multiplicity->{'Multiplicity.range'}->MultiplicityRange->attributes()->{'xmi.id'};
    }
    if (isset($multiplicity->{'Multiplicity.range'}->MultiplicityRange->attributes()->lower)) {
      //echo "StructuralFeature Multiplicity Range lower: ".$multiplicity->{'Multiplicity.range'}->MultiplicityRange->attributes()->lower."<br>";
      $infoArray['multiplicity_range_lower'] = (string) $multiplicity->{'Multiplicity.range'}->MultiplicityRange->attributes()->lower;
    }
    if (isset($multiplicity->{'Multiplicity.range'}->MultiplicityRange->attributes()->upper)) {
      //echo "StructuralFeature Multiplicity Range upper: ".$multiplicity->{'Multiplicity.range'}->MultiplicityRange->attributes()->upper."<br>";
      $infoArray['multiplicity_range_upper'] = (string) $multiplicity->{'Multiplicity.range'}->MultiplicityRange->attributes()->upper;
    }
    return $infoArray;
  }

  function iterateModel($root_package) {
    Pascoul::send_message(0, " Funktion iterateModel() erreicht ", $progress++);
    $packages = $root_package->{'Namespace.ownedElement'}->Package;
    if (empty($packages)) {
      $packages = array($root_package);
      $hasSubPackages = false;
    }
    else {
      $hasSubPackages = true;
    }

    foreach ($packages as $package_sub) {
      //checks if packages_conf is empty, if not it checks if current package is in packages_conf
      if (empty($this->packages_conf) xor in_array($package_sub->attributes()->name, $this->packages_conf)) {
        Pascoul::send_message(0, " Get Queries for sub package " . $package_sub->attributes()->name, $progress++);
        //Store top-level package (e.g. "Basisklassen") into DB and use the returned ID to store it's elements in the db
        $idPackage_sub = $this->getQueriesForPackages($package_sub);
        echo "<h3>Package: ".$idPackage_sub."</h3><br>";
        Pascoul::send_message(0, '<b>Package: '.$package_sub->attributes()->name.'</b>');
        echo $package_sub->attributes()->name."<br>";
        //$this->getAttributeInfos($package_sub);

        $packageArrayTop = $this->getAttributeInfos($package_sub);
        //$packageIdTop = $this->buildQueryForPackage($packageArrayTop, 'NULL', 'NULL');

        if (isset($package_sub->{'ModelElement.stereotype'})) {
          $stereotypeId = $package_sub->{'ModelElement.stereotype'}->Stereotype->attributes()->{'xmi.idref'};
          $packageIdTop = $this->buildQueryForPackage($packageArrayTop, 'NULL', $stereotypeId);
        }
        else $packageIdTop = $this->buildQueryForPackage($packageArrayTop, 'NULL', '-1');

        if ($hasSubPackages) {
          $package = $package_sub->{'Namespace.ownedElement'}->Package;
        }
        else {
          $package = $package_sub;
        }

        //Either there is a Package (EA) or directly a Class (Argo)
        //if (isset($package_sub->{'Namespace.ownedElement'}->Package)) $package = $package_sub->{'Namespace.ownedElement'}->Package;
        //else $package = $package_sub;

        //The top-level package should only have packages as children, now iterate through them
        //foreach ($package_sub->{'Namespace.ownedElement'}->Package as $package_objektbereich) {
        foreach ($package as $package_objektbereich) {
          //checks if packages_conf is empty, if not it checks if current package is in packages_conf
          if (empty($this->packages_conf) xor in_array($package_objektbereich->attributes()->name, $this->packages_conf)) {
            $this->iteratePackage($package_objektbereich, $packageIdTop);
          }
        }
      }
    }
  }

  /** Go through a package and store everything
   * TODO
   */
  function iteratePackage($pckg, $packageIdTop) {
    global $progress;

    //print_r($pckg);
    echo $pckg->attributes()->name."<br>";
    //echo $pckg;
    $idpckg = $this->getQueriesForPackages($pckg);
    echo "\tObjektbereich: ".$idpckg."<br>";

    $progress++;
    Pascoul::send_message(0, "<i><b>\tBeginn Objektbereich: ".$idpckg."</b></i>", $progress);
    $this->getAttributeInfos($pckg);

    $packageArray = $this->getAttributeInfos($pckg);

    if (isset($pckg->{'ModelElement.stereotype'})) {
      $stereotypeId = $pckg->{'ModelElement.stereotype'}->Stereotype->attributes()->{'xmi.idref'};
      $packageId = $this->buildQueryForPackage($packageArray, $packageIdTop, $stereotypeId);
    }
    else $packageId = $this->buildQueryForPackage($packageArray, $packageIdTop, '-1');

    //TODO: ModelElement.comment mit auswerten

    if (isset($pckg->{'Namespace.ownedElement'})) $pckgChildren = $pckg->{'Namespace.ownedElement'};
    else $pckgChildren = $pckg;

    $i_classes = 0;
    //iterate through classes
    foreach ($pckgChildren->Class as $class) {
      echo "\t\tKlasse: ".$class->attributes()->name."<br>";
      Pascoul::send_message(0, "\t\tKlasse: ".$class->attributes()->name);
      //$this->getAttributeInfos($class);

      $classArray = $this->getAttributeInfos($class);

      //stereotypes
      if (isset($class->{'ModelElement.stereotype'})) {
        //$stereotypeId = $class->{'ModelElement.stereotype'}->Stereotype->attributes()->{'xmi.idref'};
        //$classId = $this->buildQueryForClass($classArray, $packageId, $stereotypeId);
        if (isset($class->{'ModelElement.stereotype'}->Stereotype->attributes()->{'xmi.idref'})) $classArray['stereotype_id'] = (string) $class->{'ModelElement.stereotype'}->Stereotype->attributes()->{'xmi.idref'};
        if (isset($class->{'ModelElement.stereotype'}->Stereotype->attributes()->href)) $classArray['stereotype_id'] = (string) $class->{'ModelElement.stereotype'}->Stereotype->attributes()->href;
      }
      else $classArray['stereotype_id'] = '-1';


      //Generalizations
      /*
         <UML:GeneralizableElement.generalization>
         <UML:Generalization xmi.idref="EAID_8D332318_85B0_468f_997D_ACE86ABEDB1F"/>
         </UML:GeneralizableElement.generalization>
       */
      if (isset($class->{'GeneralizableElement.generalization'}->Generalization)) $classArray['general_id'] = (string) $class->{'GeneralizableElement.generalization'}->Generalization->attributes()->{'xmi.idref'};
      else $classArray['general_id'] = '-1';

      $classId = $this->buildQueryForClass($classArray, $packageId);

      //taggedValues
      $i_taggedValues = 0;
      if (isset($class->{'ModelElement.taggedValue'})) {
        foreach ($class->{'ModelElement.taggedValue'}->TaggedValue as $taggedValue) {
          $classTaggedValueArray = $this->getAttributeInfos($taggedValue);
          $this->buildQueryForTaggedValue($classTaggedValueArray, 'NULL', $classId);
          //echo "\t\t\tTaggedValue: ".$taggedValue->{'TaggedValue.type'}->TagDefinition->attributes()->{'xmi.idref'}."<br>";
          //echo "\t\t\tTaggedValue isSpecification: ".$taggedValue->attributes()->isSpecification."<br>";
          //echo "\t\t\tTaggedValue dataValue: ".$taggedValue->{'TaggedValue.dataValue'}."<br>";
          //echo "\t\t\tTaggedValue type: ".$taggedValue->{'TaggedValue.type'}->TagDefinition->attributes()->{'xmi.idref'}."<br>";
          $i_taggedValues++;
        }
      }
      echo "\t\t\t".$i_taggedValues." taggedValues in die DB geschrieben.<br>";
      Pascoul::send_message(0, "\t\t\t".$i_taggedValues." taggedValues in die DB geschrieben");

      //attributes
      $i_attributes = 0;
      if (isset($class->{'Classifier.feature'})) {
        foreach ($class->{'Classifier.feature'}->Attribute as $attribute) {
          //$this->getAttributeInfos($attribute);
          $attributeArray = $this->getAttributeInfos($attribute);
          //print_r($attributeArray);
          //echo "\t\t\tAttribut: ".$attribute->attributes()->name."<br>";
          //echo "\t\t\t\tAttribut ID: ".$attribute->attributes()->{'xmi.id'}."<br>";
          if (isset($attribute->{'StructuralFeature.type'}->DataType)) {
            //echo "\t\t\t\tStructuralFeature DataType IDref: ".$attribute->{'StructuralFeature.type'}->DataType->attributes()->{'xmi.idref'}."<br>";
            if (isset($attribute->{'StructuralFeature.type'}->DataType->attributes()->{'xmi.idref'})) $attributeArray['datatype'] = (string) $attribute->{'StructuralFeature.type'}->DataType->attributes()->{'xmi.idref'};
            if (isset($attribute->{'StructuralFeature.type'}->DataType->attributes()->href)) $attributeArray['datatype'] = (string) $attribute->{'StructuralFeature.type'}->DataType->attributes()->href;
          }
          else if (isset($attribute->{'StructuralFeature.type'}->Class)) $attributeArray['classifier'] = (string) $attribute->{'StructuralFeature.type'}->Class->attributes()->{'xmi.idref'};
          //was:
          //else if (isset($attribute->{'StructuralFeature.type'}->Class)) $attributeArray['datatype'] = (string) $attribute->{'StructuralFeature.type'}->Class->attributes()->{'xmi.idref'};

          if (isset($attribute->{'StructuralFeature.type'}->Classifier)) {
            //echo "\t\t\t\tStructuralFeature Classifier IDref: ".$attribute->{'StructuralFeature.type'}->Classifier->attributes()->{'xmi.idref'}."<br>";
            $attributeArray['classifier'] = (string) $attribute->{'StructuralFeature.type'}->Classifier->attributes()->{'xmi.idref'};
          }

          if (isset($attribute->{'Attribute.initialValue'}->Expression)) {
            //echo "\t\t\t\tinitialValue id: ".$attribute->{'Attribute.initialValue'}->Expression->attributes()->{'xmi.id'}."<br>";
            $attributeArray['initialvalue_id'] = (string) $attribute->{'Attribute.initialValue'}->Expression->attributes()->{'xmi.id'};
            //echo "\t\t\t\tinitialValue body: ".$attribute->{'Attribute.initialValue'}->Expression->attributes()->body."<br>";
            $attributeArray['initialvalue_body'] = (string) $attribute->{'Attribute.initialValue'}->Expression->attributes()->body;
          }

          /*
             echo "\t\t\t\tStructuralFeature Multiplicity id: ".$attribute->{'StructuralFeature.multiplicity'}->Multiplicity->attributes()->{'xmi.id'}."<br>";
             echo "\t\t\t\tStructuralFeature Multiplicity Range id: ".$attribute->{'StructuralFeature.multiplicity'}->Multiplicity->{'Multiplicity.range'}->MultiplicityRange->attributes()->{'xmi.id'}."<br>";
             echo "\t\t\t\tStructuralFeature Multiplicity Range lower: ".$attribute->{'StructuralFeature.multiplicity'}->Multiplicity->{'Multiplicity.range'}->MultiplicityRange->attributes()->lower."<br>";
             echo "\t\t\t\tStructuralFeature Multiplicity Range upper: ".$attribute->{'StructuralFeature.multiplicity'}->Multiplicity->{'Multiplicity.range'}->MultiplicityRange->attributes()->upper."<br>";
           */
          //$this->getMultiplicityInfos($attribute->{'StructuralFeature.multiplicity'}->Multiplicity);
          $attributeArrayMultiplicity = array_merge($attributeArray, $this->getMultiplicityInfos($attribute->{'StructuralFeature.multiplicity'}->Multiplicity));

          $attributeId = $this->buildQueryForAttribute($attributeArrayMultiplicity, $classId);

          //Bsp: name="gebietsTyp" xmi.id="EAID_44CDE765_DE87_4264_80A2_960C6B709A1F"
          if (isset($attribute->{'ModelElement.taggedValue'}->TaggedValue)) {
            foreach ($attribute->{'ModelElement.taggedValue'}->TaggedValue as $taggedValueAttr) {
              $attributeTaggedValueArray = $this->getAttributeInfos($taggedValueAttr);
              $this->buildQueryForTaggedValue($attributeTaggedValueArray, $attributeId, 'NULL');
              //echo "\t\t\t\tTaggedValue: ".$taggedValueAttr->{'TaggedValue.type'}->TagDefinition->attributes()->{'xmi.idref'}."<br>";
              //echo "\t\t\t\tTaggedValue isSpecification: ".$taggedValueAttr->attributes()->isSpecification."<br>";
              //echo "\t\t\t\tTaggedValue dataValue: ".$taggedValueAttr->{'TaggedValue.dataValue'}."<br>";
            }
          }
          $i_attributes++;
        }
      }
      echo "\t\t\t".$i_attributes." Attribute in die DB geschrieben.<br>";
      Pascoul::send_message(0, "\t\t\t".$i_attributes." Attribute in die DB geschrieben");
      $i_classes++;
    }
    echo "\t\t".$i_classes." Klassen in die DB geschrieben.<br>";
    Pascoul::send_message(0, "<i>\t\t".$i_classes." Klassen in die DB geschrieben</i>");

    //iterate through generalizations after classes
    /*
       </UML:Class>
       <UML:Generalization xmi.id="EAID_45122D40_7AAC_4804_8470_AAAFA0B300DA" isSpecification="false">
       <UML:Generalization.child>
       <UML:Class xmi.idref="EAID_53E00E39_D667_4ad7_B04B_6F24BDEC2AD2"/>
       </UML:Generalization.child>
       <UML:Generalization.parent>
       <UML:Class xmi.idref="EAID_9D7293F8_D5F8_4f1d_828A_A2EF84879508"/>
       </UML:Generalization.parent>
       </UML:Generalization>
     */
    $i_generalizations = 0;
    foreach ($pckgChildren->Generalization as $generalization) {
      //echo "\t\t\tGeneralization: ".$generalization->attributes()->{'xmi.id'}."<br>";
      $generalizationArray = $this->getAttributeInfos($generalization);

      //echo "\t\t\tGeneralization.child: ".$generalization->{'Generalization.child'}->Class->attributes()->{'xmi.idref'}."<br>";
      $generalizationArray['child_id'] = (string) $generalization->{'Generalization.child'}->Class->attributes()->{'xmi.idref'};
      //echo "\t\t\tGeneralization.parent: ".$generalization->{'Generalization.parent'}->Class->attributes()->{'xmi.idref'}."<br>";
      $generalizationArray['parent_id'] = (string) $generalization->{'Generalization.parent'}->Class->attributes()->{'xmi.idref'};

      $this->buildQueryForGeneralization($generalizationArray, $packageId);
      $i_generalizations++;
    }
    echo "\t\t".$i_generalizations." Generalisierungen in die DB geschrieben.<br>";
    Pascoul::send_message(0, "<i>\t\t".$i_generalizations." Generalisierungen in die DB geschrieben</i>");

    //iterate through associations after classes
    $i_associations = 0;
    foreach ($pckgChildren->Association as $association) {
      //echo "\t\t\tAssociation: ".$association->attributes()->{'xmi.id'}."<br>";
      $associationArray = $this->getAttributeInfos($association);
      //echo("<br>associationArray<br>");
      //print_r($associationArray);
      $association_id = $this->buildQueryForAssociation($associationArray,$packageId);

      foreach ($association->{'Association.connection'}->AssociationEnd as $associationEnd) {
        $associationEndArray = $this->getAttributeInfos($associationEnd);

        //echo "AssociationEnd: ".$associationEnd->{'TaggedValue.type'}->TagDefinition->attributes()->{'xmi.idref'}."<br>";
        //$this->getMultiplicityInfos($associationEnd->{'AssociationEnd.multiplicity'}->Multiplicity);

        if (isset($associationEnd->{'AssociationEnd.multiplicity'}->Multiplicity)) $associationEndArrayRange = array_merge($associationEndArray, $this->getMultiplicityInfos($associationEnd->{'AssociationEnd.multiplicity'}->Multiplicity));
        else $associationEndArrayRange = $associationEndArray;

        //echo "\t\t\t\tAssociationEnd name: ".$associationEnd->attributes()->name."<br>";
        //echo "\t\t\t\tAssociationEnd participant: ".$associationEnd->{'AssociationEnd.participant'}->Class->attributes()->{'xmi.idref'}."<br>";

        $associationEndArrayRange['participant'] = (string) $associationEnd->{'AssociationEnd.participant'}->Class->attributes()->{'xmi.idref'};

        //echo("<br>associationEndArrayRange<br>");
        //print_r($associationEndArrayRange);
        $associationEnd_id = $this->buildQueryForAssociationEnd($associationEndArrayRange,$association_id);
      }
      $i_associations++;
    }
    echo "\t\t".$i_associations." Assoziationen in die DB geschrieben.<br>";
    Pascoul::send_message(0, "<i>\t\t".$i_associations." Assoziationen in die DB geschrieben</i>");

    $i_comments = 0;
    foreach ($pckgChildren->Comment as $comment) {
      //echo "\t\t\tGeneralization: ".$generalization->attributes()->{'xmi.id'}."<br>";
      $commentArray = $this->getAttributeInfos($comment);

      //echo "\t\t\tGeneralization.child: ".$generalization->{'Generalization.child'}->Class->attributes()->{'xmi.idref'}."<br>";
      if (isset($comment->{'Comment.annotatedElement'})) $commentArray['class_id'] = (string) $comment->{'Comment.annotatedElement'}->Class->attributes()->{'xmi.idref'};

      //TODO: Anpassen an neue EA Version
      //if (isset($comment->{'ModelElement.taggedValue'})) $commentArray['class_id'] = (string) $comment->{'ModelElement.taggedValue'}->TaggedValue->{'TaggedValue.dataValue'};


      $this->buildQueryForComment($commentArray, $packageId);
      $i_comments++;
    }
    echo "\t\t".$i_comments." Kommentare in die DB geschrieben.<br>";
    Pascoul::send_message(0, "<i>\t\t".$i_comments." Kommentare in die DB geschrieben</i>");
    Pascoul::send_message(0, "<i><b>\tEnde Objektbereich: ".$idpckg."</b></i>", $progress);

    if (isset($pckg->{'Namespace.ownedElement'}->Package)) {
      $subpackage = $pckg->{'Namespace.ownedElement'}->Package;
      foreach ($subpackage as $subpckg) {
        //checks if packages_conf is empty, if not it checks if current package is in packages_conf
        if (empty($this->packages_conf) xor in_array($subpckg->attributes()->name, $this->packages_conf)) {
          $this->iteratePackage($subpckg, $packageId);
        }
      }
    }
  }

  public function start() {
    global $progress;
    $progress = 0;
    Pascoul::start();
    if (isset($_REQUEST['file']))
      $this->setXMIFile($_REQUEST['file']);
    else
      $this->setXMIFile("XPlanGML-xmi12-uml14.xml");

    if (isset($_REQUEST['basepackage']))
      $this->setBasePackage($_REQUEST['basepackage']);
    else
      $this->setBasePackage("XPlanGML 4.1");

    if (file_exists(SCHEMA_CONF_FILE)) {
      include(SCHEMA_CONF_FILE);
      Pascoul::send_message(0, 'SCHEMA_CONF_FILE eingelesen' , $progress++);
    }
    else Pascoul::send_message(0, 'SCHEMA_CONF_FILE NICHT eingelesen' , $progress++);
    $packages_conf = str_replace("'", "", PACKAGES);
    $packages_conf = explode(";", $packages_conf);
    //Delete single empty value so that array is really eampty when there are no PACKAGES given in database_conf
    //if ($packages_conf[0]=="") $packages_conf = array_filter($packages_conf);
    //Delete sole entry in array ('PACKAGES') which means that there is no package configured, thus the array should be empty.
    if ($packages_conf[0]='PACKAGES') unset($packages_conf[0]);;
    $this->setConfiguredPackages($packages_conf);

    $this->buildSchema();

    //if Argo Export using ISO19136 Schema, fill stereotypes table
    if ($_REQUEST['argo'] == 1) {
      Pascoul::send_message(0, 'Fülle Stereotypes mit ISO19136 Werten (ArgoUML)' , $progress++);
      $this->fillArgoStereotypes();
      Pascoul::send_message(0, 'Fülle Datatypes mit ISO19136 Werten (ArgoUML)' , $progress++);
      $this->fillArgoDatatypes();
    }

    $this->getQueries();
  }

  //Create Schema and Table structure if needed
  function buildSchema() {
    global $progress;
    Pascoul::send_message(0, '#Beginn Lege Datenbankschema an' , 0);
    $schema_sql = "
      SELECT EXISTS(
          SELECT
              schema_name
          FROM
              information_schema.schemata
          WHERE
              schema_name = '" . $this->schema . "'
      )
      ";
    //echo $schema_sql;
    //echo "<br>";
    $result = pg_query($this->conn, $schema_sql);
    $schemaBool = pg_fetch_row($result);
    if ($schemaBool[0]=='t') {
      echo "Schema vorhanden<br>";
      $progress++;
      Pascoul::send_message(0, 'Schema vorhanden' , $progress);
      //Truncate if wanted
      if ($_REQUEST['truncate'] == 1) {
        $this->truncateTables();
        $progress++;
        Pascoul::send_message(0, 'Leere vorhandene Tabellen' , $progress);
      }
      $migration_files = scandir('../sql');
      foreach ($migration_files as $migration_file) {
        if (strpos($migration_file, '_mig')) {
          Pascoul::send_message(0, 'mig file ' . $migration_file . ' gefunden', $progress++);
          //Load SQL migration file and replace "schema_name" placeholder with desired schema name
          $result = pg_query($this->conn, str_replace('schema_name', $this->schema, file_get_contents('../sql/'.$migration_file)));
          if ($result) {
            echo 'mig file '.$migration_file.' loaded<br>';
            $progress++;
            Pascoul::send_message(0, 'mig file '.$migration_file.' geladen', $progress);
          }
          else {
            echo 'mig file '.$migration_file.' nicht geladen, eventuell schon vorhanden.<br>';
            $progress++;
            Pascoul::send_message(0, 'mig file '.$migration_file.' nicht geladen, eventuell schon vorhanden.', $progress);
          }
        }
      }
    }
    else {
      $progress++;
      Pascoul::send_message(0, 'Schema nicht vorhanden' , $progress);
      echo "Schema NICHT vorhanden<br>";
      //Load SQL dump file and replace "schema_name" placeholder with desired schema name
      $sql_dump = file_get_contents('../sql/db-schema.sql');
      //echo $sql_dump;
      $sql_dump2 = str_replace('_uml_schema_name_', $this->schema, $sql_dump);
      //echo $sql_dump2;
      pg_query($this->conn, $sql_dump2);
      $progress++;
      Pascoul::send_message(0, 'Basisschema angelegt' , $progress);
      //Check for additional migration files (e.g. 20150731_mig.sql)
      $migration_files = scandir('../sql');
      foreach ($migration_files as $migration_file) {
        if (strpos($migration_file, '_mig')) {
          //Load SQL migration file and replace "schema_name" placeholder with desired schema name
          $result = pg_query($this->conn, str_replace('schema_name', $this->schema, file_get_contents('../sql/' . $migration_file)));
          if ($result) {
            echo 'mig file '.$migration_file.' loaded<br>';
            $progress++;
            Pascoul::send_message(0, 'mig file '.$migration_file.' geladen', $progress);
          }
          else {
            echo 'mig file '.$migration_file.' NOT loaded<br>';
            $progress++;
            Pascoul::send_message(0, 'mig file '.$migration_file.' NICHT geladen (Fehler)', $progress);
          }
        }
      }
    }
    $progress++;
  }

  /**
   * Build the query - Main Function
   *  ("classes" => "uml_classes",++
   *  "attributes" => "uml_attributes",+
   *  "association_classes" => "association_classes",+
   *  "class_generalizations" => "class_generalizations",+
   *  "packages" => "packages",+
   *  "stereotypes" => "stereotypes"));+
   */
  function getQueries() {
    Pascoul::send_message(0, '#Lade XMI-Datei: ' . $this->xmi_file, $progress++);
    if (!file_exists($this->xmi_file)) {
      echo "File ".$this->xmi_file." not found.";
      return false;
    }
    $xmi = simplexml_load_file($this->xmi_file);
    Pascoul::send_message(0, '#XMI-Datei erfolgreich geladen', $progress++);

    $namespaces = $xmi->getNamespaces(true);
    Pascoul::send_message(0, '#Namespace' . $namespace, $progress++);
    //echo "<pre>";

    //analyse everything top-level

    echo "<h3>Übergeordnetes: " . $idPackage_sub . "</h3><br>";
    $progress++;
    Pascoul::send_message(0, '#Beginn Übergeordnetes', $progress);

    //1. Stereotypes
    //echo "<h2>Stereotypes</h2>";
    $i_stereotypes = 0;
    foreach ($xmi->{$this->root_element}->children($namespaces["UML"])->Model->{'Namespace.ownedElement'}->Stereotype as $stereotypes) {
      $stereotypesArray = $this->getAttributeInfos($stereotypes);
      $stereotypesArray['baseClass'] = (string) $stereotypes->{'Stereotype.baseClass'};
      $this->buildQueryForStereotype($stereotypesArray);
      //echo $stereotypes->attributes()->name."<br>";
      //echo "baseClass: ".$stereotypes->{'Stereotype.baseClass'}."<br>";
      //print_r($stereotypesArray);
      $i_stereotypes++;
    }

    echo $i_stereotypes." Stereotypes in die DB geschrieben.<br>";
    $progress++;
    Pascoul::send_message(0, $i_stereotypes." Stereotypes in die DB geschrieben.", $progress);

    //2. TagDefinitions
    $i_TagDefinitions = 0;
    //echo "<h2>TagDefinitions</h2>";
    foreach ($xmi->{$this->root_element}->children($namespaces["UML"])->Model->{'Namespace.ownedElement'}->TagDefinition as $tagDefinition) {
      $tagDefinitionArray = $this->getAttributeInfos($tagDefinition);
      $this->buildQueryForTagDefinition($tagDefinitionArray);
      //print_r($tagDefinitionArray);
      //echo $tagDefinition->attributes()->name."<br>";
      $i_TagDefinitions++;
    }
    echo $i_TagDefinitions." TagDefinitions in die DB geschrieben.<br>";
    $progress++;
    Pascoul::send_message(0, $i_TagDefinitions." TagDefinitions in die DB geschrieben.", $progress);

    //3. DataTypes
    //echo "<h2>DataTypes</h2>";
    $i_DataTypes = 0;
    foreach ($xmi->{$this->root_element}->children($namespaces["UML"])->Model->{'Namespace.ownedElement'}->DataType as $dataType) {
      $dataTypeArray = $this->getAttributeInfos($dataType);
      $this->buildQueryForDataType($dataTypeArray);
      //print_r($dataTypeArray);
      //echo $dataType->attributes()->name."<br>";
      $i_DataTypes++;
    }
    echo $i_DataTypes." DataTypes in die DB geschrieben.<br>";
    $progress++;
    Pascoul::send_message(0, $i_DataTypes." DataTypes in die DB geschrieben.", $progress);

    $progress++;
    Pascoul::send_message(0, '#Ende Übergeordnetes', $progress);

    Pascoul::send_message(0, 'Base Package:' . $this->basePackage, $progress);

    if(!isset($this->basePackage) or $this->basePackage=='') {
      Pascoul::send_message(0, 'Iterate through the model', $progress++);
      $this->iterateModel($xmi->{$this->root_element}->children($namespaces["UML"])->Model);
    }
    else {
      //look for package that contains most of the model
      //das müsste für INSPIRE-Kompatibilität angepasst werden
      foreach ($xmi->{$this->root_element}->children($namespaces["UML"])->Model->{'Namespace.ownedElement'}->Package as $package_top) {
        //Only use "XPlanGML 4.1" and ignore the other two ("XPlanung-Operationen" and "Weitere Diagramme")
        //Gilt nur für den EA Export, sonst sollen alle Packages durchgegangen werden! (dann ist basePackage nicht gesetzt bzw. leer!)

        //echo "basePackage: ".$this->basePackage."<br>";
        //echo "aktuelles Package: ".$package_top->attributes()->name."<br>";
        //if ($package_top->attributes()->name == $this->basePackage) echo "true";
        //else echo "false";

        //echo "basePackage: ".$this->basePackage."<br>";
        //echo "aktuelles Package: ".$package_top->attributes()->name."<br>";

        if (isset($this->basePackage) and $package_top->attributes()->name == $this->basePackage and $this->basePackage!=='')
          $this->iterateModel($package_top);//$root_package = $package_top;
        else
          if(!isset($this->basePackage) or $this->basePackage=='')
            $this->iterateModel($package_top);
      }
    }

    //Now use this to convert the model
    //iterate through packages

    //echo "</pre>";
    /*
    foreach ($xmi->{$this->root_element} as $item) {
      reset($this->data);
      $ic=1;
      $sql[$c] = "INSERT INTO " . $this->table ." SET ";
      foreach($this->data as $d_array) {
        $sql[$c] .= $d_array[2] . " = '";
        // node root attribuite
        if ($d_array[1]=="attr" and empty($d_array[0]) and isset($item[ $d_array[3] ])) {
          $sql[$c] .= utf8_decode($item[ $d_array[3] ]);
        }
        // node attribuite
        elseif ($d_array[1]=="attr" and !empty( $item->{$d_array[0]}[ $d_array[3] ] ))
        {
          $sql[$c] .= utf8_decode($item->{$d_array[0]}[ $d_array[3] ]);
        }
        // node contents
        elseif ($d_array[1]=="node") {
          $sql[$c] .= utf8_decode($item->$d_array[0]);
        }
        $sql[$c] .= "'";
        if($ic < count($this->data) ) {
          $sql[$c] .= ", ";
        }
        $ic++;
      }
      $sql[$c] .= "\n";
      $c++;
    }
    return $sql;
    */
  }

  function addExternalUmlClasses() {
    Pascoul::send_message(0, 'Externe UML-Klassen Anlegen', $progress);
    pg_query(
        $this->conn,
        str_replace(
          'schema_name',
          $this->schema,
          file_get_contents('../sql/external_uml_classes.sql')
          )
        );
    Pascoul::send_message('CLOSE', 'Process complete');
  }
}
?>
