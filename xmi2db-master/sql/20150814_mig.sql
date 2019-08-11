--
-- Migration @ 15-08-14 | Table "comments"
--

--
-- Name: comments; Type: TABLE; Schema: schema_name; Owner: pgadmin; Tablespace: 
--

CREATE TABLE schema_name.comments (
    id integer NOT NULL,
    xmi_id character varying,
    "isSpecification" boolean,
    body character varying,
    class_id character varying,
    package_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: schema_name; Owner: pgadmin
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: schema_name; Owner: pgadmin
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: id; Type: DEFAULT; Schema: schema_name; Owner: pgadmin
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: schema_name; Owner: pgadmin; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);