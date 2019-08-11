--
-- PostgreSQL database dump
--

--
-- Name: schema_name; Type: SCHEMA; Schema: -; Owner: pgadmin
--

CREATE SCHEMA _uml_schema_name_;

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = _uml_schema_name_, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;



--
-- Name: association_classes; Type: TABLE; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

CREATE TABLE association_classes (
    xmi_id character varying(255),
    model_id integer,
    visibility character varying,
    "isLeaf" boolean,
    "isAbstract" boolean,
    "isActive" boolean,
    package_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "isRoot" boolean,
    id integer NOT NULL
);

--
-- Name: association_classes_testid_seq; Type: SEQUENCE; Schema: _uml_schema_name_; Owner: pgadmin
--

CREATE SEQUENCE association_classes_testid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: association_classes_testid_seq; Type: SEQUENCE OWNED BY; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER SEQUENCE association_classes_testid_seq OWNED BY association_classes.id;


--
-- Name: id; Type: DEFAULT; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER TABLE ONLY association_classes ALTER COLUMN id SET DEFAULT nextval('association_classes_testid_seq'::regclass);


--
-- Name: association_classes_pkey; Type: CONSTRAINT; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

ALTER TABLE ONLY association_classes
    ADD CONSTRAINT association_classes_pkey PRIMARY KEY (id);


--
-- Name: association_ends; Type: TABLE; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

CREATE TABLE association_ends (
    id integer NOT NULL,
    assoc_id integer,
    name character varying,
    visibility character varying,
    aggregation character varying,
    "isOrdered" boolean,
    "isNavigable" boolean,
    type character varying,
    created_at timestamp without time zone,
    multiplicity_range_lower character varying,
    multiplicity_range_upper character varying,
	"targetScope" character varying,
	changeability character varying,
	ordering character varying,
    participant character varying
);

--
-- Name: association_ends_id_seq; Type: SEQUENCE; Schema: _uml_schema_name_; Owner: pgadmin
--

CREATE SEQUENCE association_ends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: association_ends_id_seq; Type: SEQUENCE OWNED BY; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER SEQUENCE association_ends_id_seq OWNED BY association_ends.id;


--
-- Name: id; Type: DEFAULT; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER TABLE ONLY association_ends ALTER COLUMN id SET DEFAULT nextval('association_ends_id_seq'::regclass);


--
-- Name: association_ends_pkey; Type: CONSTRAINT; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

ALTER TABLE ONLY association_ends
    ADD CONSTRAINT association_ends_pkey PRIMARY KEY (id);

--
-- Name: class_generalizations; Type: TABLE; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

CREATE TABLE class_generalizations (
    xmi_id character varying(255),
    name character varying(255),
    model_id integer,
    "isSpecification" boolean,
    package_id integer,
    parent_id character varying,
    child_id character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer NOT NULL
);

--
-- Name: class_generalizations_id_seq; Type: SEQUENCE; Schema: _uml_schema_name_; Owner: pgadmin
--

CREATE SEQUENCE class_generalizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: class_generalizations_id_seq; Type: SEQUENCE OWNED BY; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER SEQUENCE class_generalizations_id_seq OWNED BY class_generalizations.id;


--
-- Name: id; Type: DEFAULT; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER TABLE ONLY class_generalizations ALTER COLUMN id SET DEFAULT nextval('class_generalizations_id_seq'::regclass);


--
-- Name: class_generalizations_id_key; Type: CONSTRAINT; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

ALTER TABLE ONLY class_generalizations
    ADD CONSTRAINT class_generalizations_id_key UNIQUE (id);

--
-- Name: datatypes; Type: TABLE; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

CREATE TABLE datatypes (
    id integer NOT NULL,
    xmi_id character varying,
    name character varying,
    "isRoot" boolean,
    "isLeaf" boolean,
    "isAbstract" boolean,
    visibility character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

--
-- Name: datatypes_id_seq; Type: SEQUENCE; Schema: _uml_schema_name_; Owner: pgadmin
--

CREATE SEQUENCE datatypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: datatypes_id_seq; Type: SEQUENCE OWNED BY; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER SEQUENCE datatypes_id_seq OWNED BY datatypes.id;


--
-- Name: id; Type: DEFAULT; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER TABLE ONLY datatypes ALTER COLUMN id SET DEFAULT nextval('datatypes_id_seq'::regclass);


--
-- Name: datatypes_pkey; Type: CONSTRAINT; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

ALTER TABLE ONLY datatypes
    ADD CONSTRAINT datatypes_pkey PRIMARY KEY (id);

--
-- Name: packages; Type: TABLE; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

CREATE TABLE packages (
    xmi_id character varying(255),
    name character varying(255),
    visibility character varying(255),
    "isSpecification" boolean,
    "isRoot" boolean,
    "isLeaf" boolean,
    "isAbstract" boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    model_id integer,
    parent_package_id integer,
    id integer NOT NULL,
    stereotype_id character varying
);

--
-- Name: packages_id_seq; Type: SEQUENCE; Schema: _uml_schema_name_; Owner: pgadmin
--

CREATE SEQUENCE packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: packages_id_seq; Type: SEQUENCE OWNED BY; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER SEQUENCE packages_id_seq OWNED BY packages.id;


--
-- Name: id; Type: DEFAULT; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER TABLE ONLY packages ALTER COLUMN id SET DEFAULT nextval('packages_id_seq'::regclass);


--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (id);

--
-- Name: stereotypes; Type: TABLE; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

CREATE TABLE stereotypes (
    xmi_id character varying(255),
    name character varying(255),
    model_id integer,
    "isSpecification" boolean,
    "isRoot" boolean,
    "isLeaf" boolean,
    "isAbstract" boolean,
    "baseClass" character varying(255),
    stereotype_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer NOT NULL
);

--
-- Name: stereotypes_id_seq; Type: SEQUENCE; Schema: _uml_schema_name_; Owner: pgadmin
--

CREATE SEQUENCE stereotypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: stereotypes_id_seq; Type: SEQUENCE OWNED BY; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER SEQUENCE stereotypes_id_seq OWNED BY stereotypes.id;


--
-- Name: id; Type: DEFAULT; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER TABLE ONLY stereotypes ALTER COLUMN id SET DEFAULT nextval('stereotypes_id_seq'::regclass);


--
-- Name: stereotypes_id_key; Type: CONSTRAINT; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

ALTER TABLE ONLY stereotypes
    ADD CONSTRAINT stereotypes_id_key UNIQUE (id);

--
-- Name: tagdefinitions; Type: TABLE; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

CREATE TABLE tagdefinitions (
    id integer NOT NULL,
    xmi_id character varying,
    name character varying,
    "isSpecification" character varying,
    "tagType" character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

--
-- Name: tagdefinitions_id_seq; Type: SEQUENCE; Schema: _uml_schema_name_; Owner: pgadmin
--

CREATE SEQUENCE tagdefinitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: tagdefinitions_id_seq; Type: SEQUENCE OWNED BY; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER SEQUENCE tagdefinitions_id_seq OWNED BY tagdefinitions.id;


--
-- Name: id; Type: DEFAULT; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER TABLE ONLY tagdefinitions ALTER COLUMN id SET DEFAULT nextval('tagdefinitions_id_seq'::regclass);


--
-- Name: tagdefinitions_pkey; Type: CONSTRAINT; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

ALTER TABLE ONLY tagdefinitions
    ADD CONSTRAINT tagdefinitions_pkey PRIMARY KEY (id);

--
-- Name: taggedvalues; Type: TABLE; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

CREATE TABLE taggedvalues (
    id integer NOT NULL,
    xmi_id character varying,
    "isSpecification" character varying,
    datavalue character varying,
    type character varying,
    created_at timestamp without time zone,
    attribute_id integer,
    class_id integer
);

--
-- Name: taggedvalues_id_seq; Type: SEQUENCE; Schema: _uml_schema_name_; Owner: pgadmin
--

CREATE SEQUENCE taggedvalues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: taggedvalues_id_seq; Type: SEQUENCE OWNED BY; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER SEQUENCE taggedvalues_id_seq OWNED BY taggedvalues.id;


--
-- Name: id; Type: DEFAULT; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER TABLE ONLY taggedvalues ALTER COLUMN id SET DEFAULT nextval('taggedvalues_id_seq'::regclass);


--
-- Name: taggedvalues_pkey; Type: CONSTRAINT; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

ALTER TABLE ONLY taggedvalues
    ADD CONSTRAINT taggedvalues_pkey PRIMARY KEY (id);

--
-- Name: uml_attributes; Type: TABLE; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

CREATE TABLE uml_attributes (
    xmi_id character varying(255),
    name character varying(255),
    model_id integer,
    uml_class_id integer,
    visibility character varying(255),
    "isSpecification" boolean,
    "ownerSpace" character varying(255),
    changeability character varying(255),
    "targetScope" character varying(255),
    ordering character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer NOT NULL,
    datatype character varying,
    classifier character varying,
    multiplicity_id character varying,
    multiplicity_range_id character varying,
    multiplicity_range_lower character varying,
    multiplicity_range_upper character varying,
    initialvalue_id character varying,
    initialvalue_body character varying
);

--
-- Name: uml_attributes_id_seq; Type: SEQUENCE; Schema: _uml_schema_name_; Owner: pgadmin
--

CREATE SEQUENCE uml_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: uml_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER SEQUENCE uml_attributes_id_seq OWNED BY uml_attributes.id;


--
-- Name: id; Type: DEFAULT; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER TABLE ONLY uml_attributes ALTER COLUMN id SET DEFAULT nextval('uml_attributes_id_seq'::regclass);


--
-- Name: uml_attributes_id_key; Type: CONSTRAINT; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

ALTER TABLE ONLY uml_attributes
    ADD CONSTRAINT uml_attributes_id_key UNIQUE (id);

--
-- Name: uml_classes; Type: TABLE; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

CREATE TABLE uml_classes (
    xmi_id character varying(255),
    name character varying(255),
    visibility character varying(255),
    "isSpecification" boolean,
    "isRoot" boolean,
    "isLeaf" boolean,
    "isActive" boolean,
    package_id integer,
    model_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "isAbstract" boolean,
    id integer NOT NULL,
    stereotype_id character varying,
    general_id character varying
);

--
-- Name: uml_classes_id2_seq; Type: SEQUENCE; Schema: _uml_schema_name_; Owner: pgadmin
--

CREATE SEQUENCE uml_classes_id2_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: uml_classes_id2_seq; Type: SEQUENCE OWNED BY; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER SEQUENCE uml_classes_id2_seq OWNED BY uml_classes.id;


--
-- Name: id; Type: DEFAULT; Schema: _uml_schema_name_; Owner: pgadmin
--

ALTER TABLE ONLY uml_classes ALTER COLUMN id SET DEFAULT nextval('uml_classes_id2_seq'::regclass);


--
-- Name: uml_classes_pkey; Type: CONSTRAINT; Schema: _uml_schema_name_; Owner: pgadmin; Tablespace: 
--

ALTER TABLE ONLY uml_classes
    ADD CONSTRAINT uml_classes_pkey PRIMARY KEY (id);



--
-- PostgreSQL database dump complete
--