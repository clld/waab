--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: ck_entry_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE ck_entry_type AS ENUM (
    'conference',
    'manual',
    'techreport',
    'phdthesis',
    'inproceedings',
    'booklet',
    'unpublished',
    'misc',
    'inbook',
    'proceedings',
    'book',
    'incollection',
    'mastersthesis',
    'article'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: affixfunction; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE affixfunction (
    pk integer NOT NULL,
    representation integer,
    count_borrowed integer
);


--
-- Name: affixfunction_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE affixfunction_history (
    pk integer NOT NULL,
    representation integer,
    count_borrowed integer,
    version integer NOT NULL
);


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


--
-- Name: config; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE config (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying
);


--
-- Name: config_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE config_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: config_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE config_pk_seq OWNED BY config.pk;


--
-- Name: contribution; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contribution (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    date date,
    version integer NOT NULL
);


--
-- Name: contribution_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contribution_data (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: contribution_data_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contribution_data_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: contribution_data_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contribution_data_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contribution_data_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contribution_data_history_pk_seq OWNED BY contribution_data_history.pk;


--
-- Name: contribution_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contribution_data_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contribution_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contribution_data_pk_seq OWNED BY contribution_data.pk;


--
-- Name: contribution_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contribution_files (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: contribution_files_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contribution_files_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: contribution_files_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contribution_files_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contribution_files_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contribution_files_history_pk_seq OWNED BY contribution_files_history.pk;


--
-- Name: contribution_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contribution_files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contribution_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contribution_files_pk_seq OWNED BY contribution_files.pk;


--
-- Name: contribution_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contribution_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    date date,
    version integer NOT NULL
);


--
-- Name: contribution_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contribution_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contribution_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contribution_history_pk_seq OWNED BY contribution_history.pk;


--
-- Name: contribution_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contribution_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contribution_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contribution_pk_seq OWNED BY contribution.pk;


--
-- Name: contributioncontributor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contributioncontributor (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    contribution_pk integer NOT NULL,
    contributor_pk integer NOT NULL,
    ord integer,
    "primary" boolean,
    version integer NOT NULL
);


--
-- Name: contributioncontributor_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contributioncontributor_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    contribution_pk integer,
    contributor_pk integer,
    ord integer,
    "primary" boolean,
    version integer NOT NULL
);


--
-- Name: contributioncontributor_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contributioncontributor_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributioncontributor_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contributioncontributor_history_pk_seq OWNED BY contributioncontributor_history.pk;


--
-- Name: contributioncontributor_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contributioncontributor_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributioncontributor_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contributioncontributor_pk_seq OWNED BY contributioncontributor.pk;


--
-- Name: contributionreference; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contributionreference (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    description character varying,
    contribution_pk integer NOT NULL,
    source_pk integer NOT NULL,
    version integer NOT NULL
);


--
-- Name: contributionreference_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contributionreference_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    description character varying,
    contribution_pk integer,
    source_pk integer,
    version integer NOT NULL
);


--
-- Name: contributionreference_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contributionreference_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributionreference_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contributionreference_history_pk_seq OWNED BY contributionreference_history.pk;


--
-- Name: contributionreference_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contributionreference_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributionreference_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contributionreference_pk_seq OWNED BY contributionreference.pk;


--
-- Name: contributor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contributor (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    url character varying,
    email character varying,
    address character varying,
    version integer NOT NULL
);


--
-- Name: contributor_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contributor_data (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: contributor_data_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contributor_data_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: contributor_data_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contributor_data_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributor_data_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contributor_data_history_pk_seq OWNED BY contributor_data_history.pk;


--
-- Name: contributor_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contributor_data_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributor_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contributor_data_pk_seq OWNED BY contributor_data.pk;


--
-- Name: contributor_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contributor_files (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: contributor_files_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contributor_files_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: contributor_files_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contributor_files_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributor_files_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contributor_files_history_pk_seq OWNED BY contributor_files_history.pk;


--
-- Name: contributor_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contributor_files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributor_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contributor_files_pk_seq OWNED BY contributor_files.pk;


--
-- Name: contributor_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contributor_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    url character varying,
    email character varying,
    address character varying,
    version integer NOT NULL
);


--
-- Name: contributor_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contributor_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributor_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contributor_history_pk_seq OWNED BY contributor_history.pk;


--
-- Name: contributor_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contributor_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributor_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contributor_pk_seq OWNED BY contributor.pk;


--
-- Name: dataset; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataset (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    published date,
    publisher_name character varying,
    publisher_place character varying,
    publisher_url character varying,
    license character varying,
    domain character varying NOT NULL,
    contact character varying,
    version integer NOT NULL
);


--
-- Name: dataset_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataset_data (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: dataset_data_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataset_data_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: dataset_data_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dataset_data_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dataset_data_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dataset_data_history_pk_seq OWNED BY dataset_data_history.pk;


--
-- Name: dataset_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dataset_data_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dataset_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dataset_data_pk_seq OWNED BY dataset_data.pk;


--
-- Name: dataset_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataset_files (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: dataset_files_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataset_files_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: dataset_files_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dataset_files_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dataset_files_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dataset_files_history_pk_seq OWNED BY dataset_files_history.pk;


--
-- Name: dataset_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dataset_files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dataset_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dataset_files_pk_seq OWNED BY dataset_files.pk;


--
-- Name: dataset_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataset_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    published date,
    publisher_name character varying,
    publisher_place character varying,
    publisher_url character varying,
    license character varying,
    domain character varying NOT NULL,
    contact character varying,
    version integer NOT NULL
);


--
-- Name: dataset_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dataset_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dataset_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dataset_history_pk_seq OWNED BY dataset_history.pk;


--
-- Name: dataset_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dataset_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dataset_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dataset_pk_seq OWNED BY dataset.pk;


--
-- Name: domainelement; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE domainelement (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    parameter_pk integer NOT NULL,
    number integer,
    abbr character varying,
    version integer NOT NULL
);


--
-- Name: domainelement_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE domainelement_data (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: domainelement_data_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE domainelement_data_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: domainelement_data_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE domainelement_data_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: domainelement_data_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE domainelement_data_history_pk_seq OWNED BY domainelement_data_history.pk;


--
-- Name: domainelement_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE domainelement_data_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: domainelement_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE domainelement_data_pk_seq OWNED BY domainelement_data.pk;


--
-- Name: domainelement_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE domainelement_files (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: domainelement_files_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE domainelement_files_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: domainelement_files_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE domainelement_files_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: domainelement_files_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE domainelement_files_history_pk_seq OWNED BY domainelement_files_history.pk;


--
-- Name: domainelement_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE domainelement_files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: domainelement_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE domainelement_files_pk_seq OWNED BY domainelement_files.pk;


--
-- Name: domainelement_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE domainelement_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    parameter_pk integer,
    number integer,
    abbr character varying,
    version integer NOT NULL
);


--
-- Name: domainelement_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE domainelement_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: domainelement_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE domainelement_history_pk_seq OWNED BY domainelement_history.pk;


--
-- Name: domainelement_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE domainelement_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: domainelement_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE domainelement_pk_seq OWNED BY domainelement.pk;


--
-- Name: editor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE editor (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    dataset_pk integer NOT NULL,
    contributor_pk integer NOT NULL,
    ord integer,
    "primary" boolean,
    version integer NOT NULL
);


--
-- Name: editor_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE editor_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    dataset_pk integer,
    contributor_pk integer,
    ord integer,
    "primary" boolean,
    version integer NOT NULL
);


--
-- Name: editor_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE editor_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: editor_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE editor_history_pk_seq OWNED BY editor_history.pk;


--
-- Name: editor_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE editor_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: editor_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE editor_pk_seq OWNED BY editor.pk;


--
-- Name: glossabbreviation; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE glossabbreviation (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    language_pk integer,
    version integer NOT NULL
);


--
-- Name: glossabbreviation_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE glossabbreviation_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    language_pk integer,
    version integer NOT NULL
);


--
-- Name: glossabbreviation_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE glossabbreviation_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: glossabbreviation_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE glossabbreviation_history_pk_seq OWNED BY glossabbreviation_history.pk;


--
-- Name: glossabbreviation_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE glossabbreviation_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: glossabbreviation_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE glossabbreviation_pk_seq OWNED BY glossabbreviation.pk;


--
-- Name: identifier; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE identifier (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    id character varying,
    type character varying,
    lang character varying(3),
    version integer NOT NULL
);


--
-- Name: identifier_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE identifier_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    id character varying,
    type character varying,
    lang character varying(3),
    version integer NOT NULL
);


--
-- Name: identifier_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE identifier_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: identifier_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE identifier_history_pk_seq OWNED BY identifier_history.pk;


--
-- Name: identifier_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE identifier_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: identifier_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE identifier_pk_seq OWNED BY identifier.pk;


--
-- Name: language; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE language (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    latitude double precision,
    longitude double precision,
    version integer NOT NULL,
    CONSTRAINT language_latitude_check CHECK (((((-90))::double precision <= latitude) AND (latitude <= (90)::double precision))),
    CONSTRAINT language_longitude_check CHECK (((((-180))::double precision <= longitude) AND (longitude <= (180)::double precision)))
);


--
-- Name: language_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE language_data (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: language_data_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE language_data_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: language_data_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE language_data_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: language_data_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE language_data_history_pk_seq OWNED BY language_data_history.pk;


--
-- Name: language_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE language_data_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: language_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE language_data_pk_seq OWNED BY language_data.pk;


--
-- Name: language_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE language_files (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: language_files_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE language_files_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: language_files_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE language_files_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: language_files_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE language_files_history_pk_seq OWNED BY language_files_history.pk;


--
-- Name: language_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE language_files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: language_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE language_files_pk_seq OWNED BY language_files.pk;


--
-- Name: language_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE language_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    latitude double precision,
    longitude double precision,
    version integer NOT NULL,
    CONSTRAINT language_history_latitude_check CHECK (((((-90))::double precision <= latitude) AND (latitude <= (90)::double precision))),
    CONSTRAINT language_history_longitude_check CHECK (((((-180))::double precision <= longitude) AND (longitude <= (180)::double precision)))
);


--
-- Name: language_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE language_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: language_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE language_history_pk_seq OWNED BY language_history.pk;


--
-- Name: language_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE language_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: language_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE language_pk_seq OWNED BY language.pk;


--
-- Name: languageidentifier; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE languageidentifier (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    language_pk integer NOT NULL,
    identifier_pk integer NOT NULL,
    description character varying,
    version integer NOT NULL
);


--
-- Name: languageidentifier_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE languageidentifier_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    language_pk integer,
    identifier_pk integer,
    description character varying,
    version integer NOT NULL
);


--
-- Name: languageidentifier_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE languageidentifier_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: languageidentifier_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE languageidentifier_history_pk_seq OWNED BY languageidentifier_history.pk;


--
-- Name: languageidentifier_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE languageidentifier_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: languageidentifier_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE languageidentifier_pk_seq OWNED BY languageidentifier.pk;


--
-- Name: languagesource; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE languagesource (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    language_pk integer NOT NULL,
    source_pk integer NOT NULL,
    version integer NOT NULL
);


--
-- Name: languagesource_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE languagesource_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    language_pk integer,
    source_pk integer,
    version integer NOT NULL
);


--
-- Name: languagesource_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE languagesource_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: languagesource_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE languagesource_history_pk_seq OWNED BY languagesource_history.pk;


--
-- Name: languagesource_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE languagesource_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: languagesource_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE languagesource_pk_seq OWNED BY languagesource.pk;


--
-- Name: pair; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pair (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    recipient_pk integer,
    donor_pk integer,
    area character varying,
    reliability character varying,
    int_reliability integer,
    count_interrel integer,
    count_borrowed integer
);


--
-- Name: pair_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pair_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pair_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pair_pk_seq OWNED BY pair.pk;


--
-- Name: pairsource; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pairsource (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    pair_pk integer,
    source_pk integer
);


--
-- Name: pairsource_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pairsource_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pairsource_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pairsource_pk_seq OWNED BY pairsource.pk;


--
-- Name: parameter; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE parameter (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    version integer NOT NULL
);


--
-- Name: parameter_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE parameter_data (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: parameter_data_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE parameter_data_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: parameter_data_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE parameter_data_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameter_data_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE parameter_data_history_pk_seq OWNED BY parameter_data_history.pk;


--
-- Name: parameter_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE parameter_data_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameter_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE parameter_data_pk_seq OWNED BY parameter_data.pk;


--
-- Name: parameter_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE parameter_files (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: parameter_files_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE parameter_files_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: parameter_files_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE parameter_files_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameter_files_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE parameter_files_history_pk_seq OWNED BY parameter_files_history.pk;


--
-- Name: parameter_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE parameter_files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameter_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE parameter_files_pk_seq OWNED BY parameter_files.pk;


--
-- Name: parameter_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE parameter_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    version integer NOT NULL
);


--
-- Name: parameter_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE parameter_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameter_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE parameter_history_pk_seq OWNED BY parameter_history.pk;


--
-- Name: parameter_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE parameter_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameter_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE parameter_pk_seq OWNED BY parameter.pk;


--
-- Name: sentence; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sentence (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    analyzed character varying,
    gloss character varying,
    type character varying,
    source character varying,
    comment character varying,
    original_script character varying,
    xhtml character varying,
    markup_text character varying,
    markup_analyzed character varying,
    markup_gloss character varying,
    markup_comment character varying,
    language_pk integer,
    version integer NOT NULL
);


--
-- Name: sentence_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sentence_data (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: sentence_data_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sentence_data_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: sentence_data_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sentence_data_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sentence_data_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sentence_data_history_pk_seq OWNED BY sentence_data_history.pk;


--
-- Name: sentence_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sentence_data_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sentence_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sentence_data_pk_seq OWNED BY sentence_data.pk;


--
-- Name: sentence_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sentence_files (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: sentence_files_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sentence_files_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: sentence_files_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sentence_files_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sentence_files_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sentence_files_history_pk_seq OWNED BY sentence_files_history.pk;


--
-- Name: sentence_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sentence_files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sentence_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sentence_files_pk_seq OWNED BY sentence_files.pk;


--
-- Name: sentence_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sentence_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    analyzed character varying,
    gloss character varying,
    type character varying,
    source character varying,
    comment character varying,
    original_script character varying,
    xhtml character varying,
    markup_text character varying,
    markup_analyzed character varying,
    markup_gloss character varying,
    markup_comment character varying,
    language_pk integer,
    version integer NOT NULL
);


--
-- Name: sentence_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sentence_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sentence_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sentence_history_pk_seq OWNED BY sentence_history.pk;


--
-- Name: sentence_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sentence_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sentence_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sentence_pk_seq OWNED BY sentence.pk;


--
-- Name: sentencereference; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sentencereference (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    description character varying,
    sentence_pk integer NOT NULL,
    source_pk integer NOT NULL,
    version integer NOT NULL
);


--
-- Name: sentencereference_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sentencereference_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    description character varying,
    sentence_pk integer,
    source_pk integer,
    version integer NOT NULL
);


--
-- Name: sentencereference_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sentencereference_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sentencereference_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sentencereference_history_pk_seq OWNED BY sentencereference_history.pk;


--
-- Name: sentencereference_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sentencereference_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sentencereference_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sentencereference_pk_seq OWNED BY sentencereference.pk;


--
-- Name: source; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE source (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    glottolog_id character varying,
    google_book_search_id character varying,
    bibtex_type ck_entry_type,
    author character varying,
    year character varying,
    title character varying,
    type character varying,
    booktitle character varying,
    editor character varying,
    pages character varying,
    edition character varying,
    journal character varying,
    school character varying,
    address character varying,
    url character varying,
    note character varying,
    number character varying,
    series character varying,
    volume character varying,
    publisher character varying,
    organization character varying,
    chapter character varying,
    howpublished character varying,
    year_int integer,
    startpage_int integer,
    pages_int integer,
    version integer NOT NULL
);


--
-- Name: source_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE source_data (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: source_data_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE source_data_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: source_data_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE source_data_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: source_data_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE source_data_history_pk_seq OWNED BY source_data_history.pk;


--
-- Name: source_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE source_data_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: source_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE source_data_pk_seq OWNED BY source_data.pk;


--
-- Name: source_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE source_files (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: source_files_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE source_files_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: source_files_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE source_files_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: source_files_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE source_files_history_pk_seq OWNED BY source_files_history.pk;


--
-- Name: source_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE source_files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: source_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE source_files_pk_seq OWNED BY source_files.pk;


--
-- Name: source_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE source_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    glottolog_id character varying,
    google_book_search_id character varying,
    bibtex_type ck_entry_type,
    author character varying,
    year character varying,
    title character varying,
    type character varying,
    booktitle character varying,
    editor character varying,
    pages character varying,
    edition character varying,
    journal character varying,
    school character varying,
    address character varying,
    url character varying,
    note character varying,
    number character varying,
    series character varying,
    volume character varying,
    publisher character varying,
    organization character varying,
    chapter character varying,
    howpublished character varying,
    year_int integer,
    startpage_int integer,
    pages_int integer,
    version integer NOT NULL
);


--
-- Name: source_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE source_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: source_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE source_history_pk_seq OWNED BY source_history.pk;


--
-- Name: source_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE source_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: source_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE source_pk_seq OWNED BY source.pk;


--
-- Name: unit; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unit (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    language_pk integer NOT NULL,
    version integer NOT NULL
);


--
-- Name: unit_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unit_data (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unit_data_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unit_data_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unit_data_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unit_data_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unit_data_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unit_data_history_pk_seq OWNED BY unit_data_history.pk;


--
-- Name: unit_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unit_data_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unit_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unit_data_pk_seq OWNED BY unit_data.pk;


--
-- Name: unit_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unit_files (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unit_files_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unit_files_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unit_files_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unit_files_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unit_files_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unit_files_history_pk_seq OWNED BY unit_files_history.pk;


--
-- Name: unit_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unit_files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unit_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unit_files_pk_seq OWNED BY unit_files.pk;


--
-- Name: unit_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unit_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    language_pk integer,
    version integer NOT NULL
);


--
-- Name: unit_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unit_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unit_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unit_history_pk_seq OWNED BY unit_history.pk;


--
-- Name: unit_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unit_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unit_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unit_pk_seq OWNED BY unit.pk;


--
-- Name: unitdomainelement; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitdomainelement (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    unitparameter_pk integer NOT NULL,
    ord integer,
    version integer NOT NULL
);


--
-- Name: unitdomainelement_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitdomainelement_data (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unitdomainelement_data_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitdomainelement_data_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unitdomainelement_data_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitdomainelement_data_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitdomainelement_data_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitdomainelement_data_history_pk_seq OWNED BY unitdomainelement_data_history.pk;


--
-- Name: unitdomainelement_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitdomainelement_data_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitdomainelement_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitdomainelement_data_pk_seq OWNED BY unitdomainelement_data.pk;


--
-- Name: unitdomainelement_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitdomainelement_files (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unitdomainelement_files_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitdomainelement_files_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unitdomainelement_files_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitdomainelement_files_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitdomainelement_files_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitdomainelement_files_history_pk_seq OWNED BY unitdomainelement_files_history.pk;


--
-- Name: unitdomainelement_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitdomainelement_files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitdomainelement_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitdomainelement_files_pk_seq OWNED BY unitdomainelement_files.pk;


--
-- Name: unitdomainelement_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitdomainelement_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    unitparameter_pk integer,
    ord integer,
    version integer NOT NULL
);


--
-- Name: unitdomainelement_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitdomainelement_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitdomainelement_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitdomainelement_history_pk_seq OWNED BY unitdomainelement_history.pk;


--
-- Name: unitdomainelement_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitdomainelement_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitdomainelement_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitdomainelement_pk_seq OWNED BY unitdomainelement.pk;


--
-- Name: unitparameter; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitparameter (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    version integer NOT NULL
);


--
-- Name: unitparameter_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitparameter_data (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unitparameter_data_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitparameter_data_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unitparameter_data_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitparameter_data_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitparameter_data_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitparameter_data_history_pk_seq OWNED BY unitparameter_data_history.pk;


--
-- Name: unitparameter_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitparameter_data_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitparameter_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitparameter_data_pk_seq OWNED BY unitparameter_data.pk;


--
-- Name: unitparameter_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitparameter_files (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unitparameter_files_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitparameter_files_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unitparameter_files_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitparameter_files_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitparameter_files_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitparameter_files_history_pk_seq OWNED BY unitparameter_files_history.pk;


--
-- Name: unitparameter_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitparameter_files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitparameter_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitparameter_files_pk_seq OWNED BY unitparameter_files.pk;


--
-- Name: unitparameter_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitparameter_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    version integer NOT NULL
);


--
-- Name: unitparameter_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitparameter_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitparameter_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitparameter_history_pk_seq OWNED BY unitparameter_history.pk;


--
-- Name: unitparameter_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitparameter_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitparameter_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitparameter_pk_seq OWNED BY unitparameter.pk;


--
-- Name: unitparameterunit; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitparameterunit (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    unit_pk integer,
    unitparameter_pk integer,
    version integer NOT NULL
);


--
-- Name: unitparameterunit_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitparameterunit_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    unit_pk integer,
    unitparameter_pk integer,
    version integer NOT NULL
);


--
-- Name: unitparameterunit_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitparameterunit_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitparameterunit_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitparameterunit_history_pk_seq OWNED BY unitparameterunit_history.pk;


--
-- Name: unitparameterunit_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitparameterunit_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitparameterunit_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitparameterunit_pk_seq OWNED BY unitparameterunit.pk;


--
-- Name: unitvalue; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitvalue (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    unit_pk integer NOT NULL,
    unitparameter_pk integer NOT NULL,
    contribution_pk integer,
    unitdomainelement_pk integer,
    frequency double precision,
    version integer NOT NULL
);


--
-- Name: unitvalue_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitvalue_data (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unitvalue_data_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitvalue_data_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unitvalue_data_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitvalue_data_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitvalue_data_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitvalue_data_history_pk_seq OWNED BY unitvalue_data_history.pk;


--
-- Name: unitvalue_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitvalue_data_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitvalue_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitvalue_data_pk_seq OWNED BY unitvalue_data.pk;


--
-- Name: unitvalue_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitvalue_files (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unitvalue_files_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitvalue_files_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: unitvalue_files_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitvalue_files_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitvalue_files_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitvalue_files_history_pk_seq OWNED BY unitvalue_files_history.pk;


--
-- Name: unitvalue_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitvalue_files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitvalue_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitvalue_files_pk_seq OWNED BY unitvalue_files.pk;


--
-- Name: unitvalue_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unitvalue_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    unit_pk integer,
    unitparameter_pk integer,
    contribution_pk integer,
    unitdomainelement_pk integer,
    frequency double precision,
    version integer NOT NULL
);


--
-- Name: unitvalue_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitvalue_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitvalue_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitvalue_history_pk_seq OWNED BY unitvalue_history.pk;


--
-- Name: unitvalue_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unitvalue_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitvalue_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unitvalue_pk_seq OWNED BY unitvalue.pk;


--
-- Name: value; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE value (
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    pk integer NOT NULL,
    valueset_pk integer NOT NULL,
    domainelement_pk integer,
    frequency double precision,
    confidence character varying,
    version integer NOT NULL
);


--
-- Name: value_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE value_data (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: value_data_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE value_data_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: value_data_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE value_data_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: value_data_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE value_data_history_pk_seq OWNED BY value_data_history.pk;


--
-- Name: value_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE value_data_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: value_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE value_data_pk_seq OWNED BY value_data.pk;


--
-- Name: value_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE value_files (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: value_files_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE value_files_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: value_files_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE value_files_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: value_files_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE value_files_history_pk_seq OWNED BY value_files_history.pk;


--
-- Name: value_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE value_files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: value_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE value_files_pk_seq OWNED BY value_files.pk;


--
-- Name: value_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE value_history (
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    pk integer NOT NULL,
    valueset_pk integer,
    domainelement_pk integer,
    frequency double precision,
    confidence character varying,
    version integer NOT NULL
);


--
-- Name: value_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE value_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: value_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE value_history_pk_seq OWNED BY value_history.pk;


--
-- Name: value_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE value_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: value_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE value_pk_seq OWNED BY value.pk;


--
-- Name: valuesentence; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE valuesentence (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    value_pk integer NOT NULL,
    sentence_pk integer NOT NULL,
    description character varying,
    version integer NOT NULL
);


--
-- Name: valuesentence_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE valuesentence_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    value_pk integer,
    sentence_pk integer,
    description character varying,
    version integer NOT NULL
);


--
-- Name: valuesentence_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE valuesentence_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valuesentence_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE valuesentence_history_pk_seq OWNED BY valuesentence_history.pk;


--
-- Name: valuesentence_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE valuesentence_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valuesentence_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE valuesentence_pk_seq OWNED BY valuesentence.pk;


--
-- Name: valueset; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE valueset (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    description character varying,
    markup_description character varying,
    language_pk integer NOT NULL,
    parameter_pk integer NOT NULL,
    contribution_pk integer,
    source character varying,
    version integer NOT NULL
);


--
-- Name: valueset_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE valueset_data (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: valueset_data_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE valueset_data_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: valueset_data_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE valueset_data_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valueset_data_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE valueset_data_history_pk_seq OWNED BY valueset_data_history.pk;


--
-- Name: valueset_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE valueset_data_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valueset_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE valueset_data_pk_seq OWNED BY valueset_data.pk;


--
-- Name: valueset_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE valueset_files (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: valueset_files_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE valueset_files_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    object_pk integer,
    version integer NOT NULL
);


--
-- Name: valueset_files_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE valueset_files_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valueset_files_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE valueset_files_history_pk_seq OWNED BY valueset_files_history.pk;


--
-- Name: valueset_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE valueset_files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valueset_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE valueset_files_pk_seq OWNED BY valueset_files.pk;


--
-- Name: valueset_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE valueset_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    description character varying,
    markup_description character varying,
    language_pk integer,
    parameter_pk integer,
    contribution_pk integer,
    source character varying,
    version integer NOT NULL
);


--
-- Name: valueset_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE valueset_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valueset_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE valueset_history_pk_seq OWNED BY valueset_history.pk;


--
-- Name: valueset_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE valueset_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valueset_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE valueset_pk_seq OWNED BY valueset.pk;


--
-- Name: valuesetreference; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE valuesetreference (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    description character varying,
    valueset_pk integer NOT NULL,
    source_pk integer NOT NULL,
    version integer NOT NULL
);


--
-- Name: valuesetreference_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE valuesetreference_history (
    pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    jsondata character varying,
    key character varying,
    description character varying,
    valueset_pk integer,
    source_pk integer,
    version integer NOT NULL
);


--
-- Name: valuesetreference_history_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE valuesetreference_history_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valuesetreference_history_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE valuesetreference_history_pk_seq OWNED BY valuesetreference_history.pk;


--
-- Name: valuesetreference_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE valuesetreference_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valuesetreference_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE valuesetreference_pk_seq OWNED BY valuesetreference.pk;


--
-- Name: waabvalue; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE waabvalue (
    pk integer NOT NULL,
    pair_pk integer,
    "numeric" integer
);


--
-- Name: waabvalue_history; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE waabvalue_history (
    pk integer NOT NULL,
    pair_pk integer,
    "numeric" integer,
    version integer NOT NULL
);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY config ALTER COLUMN pk SET DEFAULT nextval('config_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contribution ALTER COLUMN pk SET DEFAULT nextval('contribution_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contribution_data ALTER COLUMN pk SET DEFAULT nextval('contribution_data_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contribution_data_history ALTER COLUMN pk SET DEFAULT nextval('contribution_data_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contribution_files ALTER COLUMN pk SET DEFAULT nextval('contribution_files_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contribution_files_history ALTER COLUMN pk SET DEFAULT nextval('contribution_files_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contribution_history ALTER COLUMN pk SET DEFAULT nextval('contribution_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributioncontributor ALTER COLUMN pk SET DEFAULT nextval('contributioncontributor_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributioncontributor_history ALTER COLUMN pk SET DEFAULT nextval('contributioncontributor_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributionreference ALTER COLUMN pk SET DEFAULT nextval('contributionreference_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributionreference_history ALTER COLUMN pk SET DEFAULT nextval('contributionreference_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributor ALTER COLUMN pk SET DEFAULT nextval('contributor_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributor_data ALTER COLUMN pk SET DEFAULT nextval('contributor_data_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributor_data_history ALTER COLUMN pk SET DEFAULT nextval('contributor_data_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributor_files ALTER COLUMN pk SET DEFAULT nextval('contributor_files_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributor_files_history ALTER COLUMN pk SET DEFAULT nextval('contributor_files_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributor_history ALTER COLUMN pk SET DEFAULT nextval('contributor_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataset ALTER COLUMN pk SET DEFAULT nextval('dataset_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataset_data ALTER COLUMN pk SET DEFAULT nextval('dataset_data_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataset_data_history ALTER COLUMN pk SET DEFAULT nextval('dataset_data_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataset_files ALTER COLUMN pk SET DEFAULT nextval('dataset_files_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataset_files_history ALTER COLUMN pk SET DEFAULT nextval('dataset_files_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataset_history ALTER COLUMN pk SET DEFAULT nextval('dataset_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY domainelement ALTER COLUMN pk SET DEFAULT nextval('domainelement_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY domainelement_data ALTER COLUMN pk SET DEFAULT nextval('domainelement_data_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY domainelement_data_history ALTER COLUMN pk SET DEFAULT nextval('domainelement_data_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY domainelement_files ALTER COLUMN pk SET DEFAULT nextval('domainelement_files_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY domainelement_files_history ALTER COLUMN pk SET DEFAULT nextval('domainelement_files_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY domainelement_history ALTER COLUMN pk SET DEFAULT nextval('domainelement_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY editor ALTER COLUMN pk SET DEFAULT nextval('editor_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY editor_history ALTER COLUMN pk SET DEFAULT nextval('editor_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY glossabbreviation ALTER COLUMN pk SET DEFAULT nextval('glossabbreviation_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY glossabbreviation_history ALTER COLUMN pk SET DEFAULT nextval('glossabbreviation_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY identifier ALTER COLUMN pk SET DEFAULT nextval('identifier_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY identifier_history ALTER COLUMN pk SET DEFAULT nextval('identifier_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY language ALTER COLUMN pk SET DEFAULT nextval('language_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY language_data ALTER COLUMN pk SET DEFAULT nextval('language_data_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY language_data_history ALTER COLUMN pk SET DEFAULT nextval('language_data_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY language_files ALTER COLUMN pk SET DEFAULT nextval('language_files_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY language_files_history ALTER COLUMN pk SET DEFAULT nextval('language_files_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY language_history ALTER COLUMN pk SET DEFAULT nextval('language_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY languageidentifier ALTER COLUMN pk SET DEFAULT nextval('languageidentifier_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY languageidentifier_history ALTER COLUMN pk SET DEFAULT nextval('languageidentifier_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY languagesource ALTER COLUMN pk SET DEFAULT nextval('languagesource_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY languagesource_history ALTER COLUMN pk SET DEFAULT nextval('languagesource_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pair ALTER COLUMN pk SET DEFAULT nextval('pair_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pairsource ALTER COLUMN pk SET DEFAULT nextval('pairsource_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY parameter ALTER COLUMN pk SET DEFAULT nextval('parameter_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY parameter_data ALTER COLUMN pk SET DEFAULT nextval('parameter_data_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY parameter_data_history ALTER COLUMN pk SET DEFAULT nextval('parameter_data_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY parameter_files ALTER COLUMN pk SET DEFAULT nextval('parameter_files_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY parameter_files_history ALTER COLUMN pk SET DEFAULT nextval('parameter_files_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY parameter_history ALTER COLUMN pk SET DEFAULT nextval('parameter_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sentence ALTER COLUMN pk SET DEFAULT nextval('sentence_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sentence_data ALTER COLUMN pk SET DEFAULT nextval('sentence_data_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sentence_data_history ALTER COLUMN pk SET DEFAULT nextval('sentence_data_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sentence_files ALTER COLUMN pk SET DEFAULT nextval('sentence_files_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sentence_files_history ALTER COLUMN pk SET DEFAULT nextval('sentence_files_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sentence_history ALTER COLUMN pk SET DEFAULT nextval('sentence_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sentencereference ALTER COLUMN pk SET DEFAULT nextval('sentencereference_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sentencereference_history ALTER COLUMN pk SET DEFAULT nextval('sentencereference_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY source ALTER COLUMN pk SET DEFAULT nextval('source_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY source_data ALTER COLUMN pk SET DEFAULT nextval('source_data_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY source_data_history ALTER COLUMN pk SET DEFAULT nextval('source_data_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY source_files ALTER COLUMN pk SET DEFAULT nextval('source_files_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY source_files_history ALTER COLUMN pk SET DEFAULT nextval('source_files_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY source_history ALTER COLUMN pk SET DEFAULT nextval('source_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unit ALTER COLUMN pk SET DEFAULT nextval('unit_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unit_data ALTER COLUMN pk SET DEFAULT nextval('unit_data_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unit_data_history ALTER COLUMN pk SET DEFAULT nextval('unit_data_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unit_files ALTER COLUMN pk SET DEFAULT nextval('unit_files_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unit_files_history ALTER COLUMN pk SET DEFAULT nextval('unit_files_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unit_history ALTER COLUMN pk SET DEFAULT nextval('unit_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitdomainelement ALTER COLUMN pk SET DEFAULT nextval('unitdomainelement_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitdomainelement_data ALTER COLUMN pk SET DEFAULT nextval('unitdomainelement_data_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitdomainelement_data_history ALTER COLUMN pk SET DEFAULT nextval('unitdomainelement_data_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitdomainelement_files ALTER COLUMN pk SET DEFAULT nextval('unitdomainelement_files_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitdomainelement_files_history ALTER COLUMN pk SET DEFAULT nextval('unitdomainelement_files_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitdomainelement_history ALTER COLUMN pk SET DEFAULT nextval('unitdomainelement_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitparameter ALTER COLUMN pk SET DEFAULT nextval('unitparameter_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitparameter_data ALTER COLUMN pk SET DEFAULT nextval('unitparameter_data_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitparameter_data_history ALTER COLUMN pk SET DEFAULT nextval('unitparameter_data_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitparameter_files ALTER COLUMN pk SET DEFAULT nextval('unitparameter_files_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitparameter_files_history ALTER COLUMN pk SET DEFAULT nextval('unitparameter_files_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitparameter_history ALTER COLUMN pk SET DEFAULT nextval('unitparameter_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitparameterunit ALTER COLUMN pk SET DEFAULT nextval('unitparameterunit_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitparameterunit_history ALTER COLUMN pk SET DEFAULT nextval('unitparameterunit_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitvalue ALTER COLUMN pk SET DEFAULT nextval('unitvalue_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitvalue_data ALTER COLUMN pk SET DEFAULT nextval('unitvalue_data_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitvalue_data_history ALTER COLUMN pk SET DEFAULT nextval('unitvalue_data_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitvalue_files ALTER COLUMN pk SET DEFAULT nextval('unitvalue_files_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitvalue_files_history ALTER COLUMN pk SET DEFAULT nextval('unitvalue_files_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitvalue_history ALTER COLUMN pk SET DEFAULT nextval('unitvalue_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY value ALTER COLUMN pk SET DEFAULT nextval('value_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY value_data ALTER COLUMN pk SET DEFAULT nextval('value_data_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY value_data_history ALTER COLUMN pk SET DEFAULT nextval('value_data_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY value_files ALTER COLUMN pk SET DEFAULT nextval('value_files_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY value_files_history ALTER COLUMN pk SET DEFAULT nextval('value_files_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY value_history ALTER COLUMN pk SET DEFAULT nextval('value_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY valuesentence ALTER COLUMN pk SET DEFAULT nextval('valuesentence_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY valuesentence_history ALTER COLUMN pk SET DEFAULT nextval('valuesentence_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY valueset ALTER COLUMN pk SET DEFAULT nextval('valueset_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY valueset_data ALTER COLUMN pk SET DEFAULT nextval('valueset_data_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY valueset_data_history ALTER COLUMN pk SET DEFAULT nextval('valueset_data_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY valueset_files ALTER COLUMN pk SET DEFAULT nextval('valueset_files_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY valueset_files_history ALTER COLUMN pk SET DEFAULT nextval('valueset_files_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY valueset_history ALTER COLUMN pk SET DEFAULT nextval('valueset_history_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY valuesetreference ALTER COLUMN pk SET DEFAULT nextval('valuesetreference_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY valuesetreference_history ALTER COLUMN pk SET DEFAULT nextval('valuesetreference_history_pk_seq'::regclass);


--
-- Data for Name: affixfunction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY affixfunction (pk, representation, count_borrowed) FROM stdin;
1	6	6
2	5	5
3	19	46
4	2	2
5	5	9
6	1	1
7	4	4
8	2	2
9	10	20
10	5	8
11	4	4
12	6	11
13	3	45
14	16	34
15	3	4
16	5	10
17	2	3
18	1	2
19	16	35
20	26	51
21	12	39
22	7	9
23	6	8
24	14	27
25	3	5
26	1	3
27	12	50
28	7	7
29	1	1
30	2	16
31	8	9
32	4	6
33	5	5
34	4	4
35	2	4
36	2	2
37	1	1
38	17	51
39	9	21
40	10	60
41	8	11
42	4	7
43	2	2
\.


--
-- Data for Name: affixfunction_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY affixfunction_history (pk, representation, count_borrowed, version) FROM stdin;
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alembic_version (version_num) FROM stdin;
95ca22c431fc
\.


--
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: -
--

COPY config (pk, created, updated, active, jsondata, key, value) FROM stdin;
\.


--
-- Name: config_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('config_pk_seq', 1, false);


--
-- Data for Name: contribution; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contribution (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, date, version) FROM stdin;
1	2013-11-19 20:49:32.941948+01	2013-11-19 20:49:32.941957+01	t	\N	base	afbo	AfBo	\N	\N	\N	1
\.


--
-- Data for Name: contribution_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contribution_data (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Data for Name: contribution_data_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contribution_data_history (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Name: contribution_data_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contribution_data_history_pk_seq', 1, false);


--
-- Name: contribution_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contribution_data_pk_seq', 1, false);


--
-- Data for Name: contribution_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contribution_files (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Data for Name: contribution_files_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contribution_files_history (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Name: contribution_files_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contribution_files_history_pk_seq', 1, false);


--
-- Name: contribution_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contribution_files_pk_seq', 1, false);


--
-- Data for Name: contribution_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contribution_history (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, date, version) FROM stdin;
\.


--
-- Name: contribution_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contribution_history_pk_seq', 1, false);


--
-- Name: contribution_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contribution_pk_seq', 1, true);


--
-- Data for Name: contributioncontributor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contributioncontributor (pk, created, updated, active, jsondata, polymorphic_type, contribution_pk, contributor_pk, ord, "primary", version) FROM stdin;
\.


--
-- Data for Name: contributioncontributor_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contributioncontributor_history (pk, created, updated, active, jsondata, polymorphic_type, contribution_pk, contributor_pk, ord, "primary", version) FROM stdin;
\.


--
-- Name: contributioncontributor_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contributioncontributor_history_pk_seq', 1, false);


--
-- Name: contributioncontributor_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contributioncontributor_pk_seq', 1, false);


--
-- Data for Name: contributionreference; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contributionreference (pk, created, updated, active, jsondata, key, description, contribution_pk, source_pk, version) FROM stdin;
\.


--
-- Data for Name: contributionreference_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contributionreference_history (pk, created, updated, active, jsondata, key, description, contribution_pk, source_pk, version) FROM stdin;
\.


--
-- Name: contributionreference_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contributionreference_history_pk_seq', 1, false);


--
-- Name: contributionreference_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contributionreference_pk_seq', 1, false);


--
-- Data for Name: contributor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contributor (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, url, email, address, version) FROM stdin;
1	2013-11-19 20:49:32.939433+01	2013-11-19 20:49:32.939443+01	t	\N	base	seifart	Frank Seifart	\N	\N	\N	\N	\N	1
\.


--
-- Data for Name: contributor_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contributor_data (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Data for Name: contributor_data_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contributor_data_history (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Name: contributor_data_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contributor_data_history_pk_seq', 1, false);


--
-- Name: contributor_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contributor_data_pk_seq', 1, false);


--
-- Data for Name: contributor_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contributor_files (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Data for Name: contributor_files_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contributor_files_history (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Name: contributor_files_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contributor_files_history_pk_seq', 1, false);


--
-- Name: contributor_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contributor_files_pk_seq', 1, false);


--
-- Data for Name: contributor_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contributor_history (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, url, email, address, version) FROM stdin;
\.


--
-- Name: contributor_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contributor_history_pk_seq', 1, false);


--
-- Name: contributor_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contributor_pk_seq', 1, true);


--
-- Data for Name: dataset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataset (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, published, publisher_name, publisher_place, publisher_url, license, domain, contact, version) FROM stdin;
1	2013-11-19 20:49:32.944448+01	2013-11-19 20:49:32.944458+01	t	{"license_name": "Creative Commons Attribution 3.0 Unported License", "license_icon": "cc-by.png"}	base	afbo	AfBo: A world-wide survey of affix borrowing	\N	\N	2013-11-19	Max Planck Institute for Evolutionary Anthropology	Leipzig	http://www.eva.mpg.de	http://creativecommons.org/licenses/by/3.0/	afbo.info	f.c.seifart@uva.nl	1
\.


--
-- Data for Name: dataset_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataset_data (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Data for Name: dataset_data_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataset_data_history (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Name: dataset_data_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('dataset_data_history_pk_seq', 1, false);


--
-- Name: dataset_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('dataset_data_pk_seq', 1, false);


--
-- Data for Name: dataset_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataset_files (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Data for Name: dataset_files_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataset_files_history (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Name: dataset_files_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('dataset_files_history_pk_seq', 1, false);


--
-- Name: dataset_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('dataset_files_pk_seq', 1, false);


--
-- Data for Name: dataset_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataset_history (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, published, publisher_name, publisher_place, publisher_url, license, domain, contact, version) FROM stdin;
\.


--
-- Name: dataset_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('dataset_history_pk_seq', 1, false);


--
-- Name: dataset_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('dataset_pk_seq', 1, true);


--
-- Data for Name: domainelement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY domainelement (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, parameter_pk, number, abbr, version) FROM stdin;
\.


--
-- Data for Name: domainelement_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY domainelement_data (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Data for Name: domainelement_data_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY domainelement_data_history (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Name: domainelement_data_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('domainelement_data_history_pk_seq', 1, false);


--
-- Name: domainelement_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('domainelement_data_pk_seq', 1, false);


--
-- Data for Name: domainelement_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY domainelement_files (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Data for Name: domainelement_files_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY domainelement_files_history (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Name: domainelement_files_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('domainelement_files_history_pk_seq', 1, false);


--
-- Name: domainelement_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('domainelement_files_pk_seq', 1, false);


--
-- Data for Name: domainelement_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY domainelement_history (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, parameter_pk, number, abbr, version) FROM stdin;
\.


--
-- Name: domainelement_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('domainelement_history_pk_seq', 1, false);


--
-- Name: domainelement_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('domainelement_pk_seq', 1, false);


--
-- Data for Name: editor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY editor (pk, created, updated, active, jsondata, polymorphic_type, dataset_pk, contributor_pk, ord, "primary", version) FROM stdin;
1	2013-11-19 20:49:33.450548+01	2013-11-19 20:49:33.450554+01	t	\N	base	1	1	1	t	1
\.


--
-- Data for Name: editor_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY editor_history (pk, created, updated, active, jsondata, polymorphic_type, dataset_pk, contributor_pk, ord, "primary", version) FROM stdin;
\.


--
-- Name: editor_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('editor_history_pk_seq', 1, false);


--
-- Name: editor_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('editor_pk_seq', 1, true);


--
-- Data for Name: glossabbreviation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY glossabbreviation (pk, created, updated, active, jsondata, id, name, description, markup_description, language_pk, version) FROM stdin;
\.


--
-- Data for Name: glossabbreviation_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY glossabbreviation_history (pk, created, updated, active, jsondata, id, name, description, markup_description, language_pk, version) FROM stdin;
\.


--
-- Name: glossabbreviation_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('glossabbreviation_history_pk_seq', 1, false);


--
-- Name: glossabbreviation_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('glossabbreviation_pk_seq', 1, false);


--
-- Data for Name: identifier; Type: TABLE DATA; Schema: public; Owner: -
--

COPY identifier (pk, created, updated, active, jsondata, name, description, markup_description, id, type, lang, version) FROM stdin;
1	2013-11-19 20:49:32.683096+01	2013-11-19 20:49:32.683104+01	t	\N	orm	\N	\N	orm	iso639-3	en	1
2	2013-11-19 20:49:32.720996+01	2013-11-19 20:49:32.721002+01	t	\N	kwe	\N	\N	kwe	iso639-3	en	1
3	2013-11-19 20:49:32.721668+01	2013-11-19 20:49:32.721672+01	t	\N	nucl1595	\N	\N	nucl1595	glottolog	en	1
4	2013-11-19 20:49:32.722202+01	2013-11-19 20:49:32.722206+01	t	\N	acm	\N	\N	acm	iso639-3	en	1
5	2013-11-19 20:49:32.72279+01	2013-11-19 20:49:32.722794+01	t	\N	meso1252	\N	\N	meso1252	glottolog	en	1
6	2013-11-19 20:49:32.723514+01	2013-11-19 20:49:32.723525+01	t	\N	est	\N	\N	est	iso639-3	en	1
7	2013-11-19 20:49:32.724323+01	2013-11-19 20:49:32.724334+01	t	\N	esto1258	\N	\N	esto1258	glottolog	en	1
8	2013-11-19 20:49:32.725129+01	2013-11-19 20:49:32.72514+01	t	\N	chx	\N	\N	chx	iso639-3	en	1
9	2013-11-19 20:49:32.726035+01	2013-11-19 20:49:32.726046+01	t	\N	chan1310	\N	\N	chan1310	glottolog	en	1
10	2013-11-19 20:49:32.726938+01	2013-11-19 20:49:32.726949+01	t	\N	khr	\N	\N	khr	iso639-3	en	1
11	2013-11-19 20:49:32.727839+01	2013-11-19 20:49:32.72785+01	t	\N	khar1287	\N	\N	khar1287	glottolog	en	1
12	2013-11-19 20:49:32.728776+01	2013-11-19 20:49:32.728787+01	t	\N	ruq	\N	\N	ruq	iso639-3	en	1
13	2013-11-19 20:49:32.729602+01	2013-11-19 20:49:32.729613+01	t	\N	megl1237	\N	\N	megl1237	glottolog	en	1
14	2013-11-19 20:49:32.730511+01	2013-11-19 20:49:32.730522+01	t	\N	mhj	\N	\N	mhj	iso639-3	en	1
15	2013-11-19 20:49:32.731351+01	2013-11-19 20:49:32.731362+01	t	\N	mogh1245	\N	\N	mogh1245	glottolog	en	1
16	2013-11-19 20:49:32.731969+01	2013-11-19 20:49:32.731977+01	t	\N	bul	\N	\N	bul	iso639-3	en	1
17	2013-11-19 20:49:32.73286+01	2013-11-19 20:49:32.732871+01	t	\N	bulg1262	\N	\N	bulg1262	glottolog	en	1
18	2013-11-19 20:49:32.733794+01	2013-11-19 20:49:32.733805+01	t	\N	bjn	\N	\N	bjn	iso639-3	en	1
19	2013-11-19 20:49:32.734619+01	2013-11-19 20:49:32.734629+01	t	\N	banj1239	\N	\N	banj1239	glottolog	en	1
20	2013-11-19 20:49:32.735433+01	2013-11-19 20:49:32.735443+01	t	\N	ess	\N	\N	ess	iso639-3	en	1
21	2013-11-19 20:49:32.736244+01	2013-11-19 20:49:32.736255+01	t	\N	cent2128	\N	\N	cent2128	glottolog	en	1
22	2013-11-19 20:49:32.737014+01	2013-11-19 20:49:32.737022+01	t	\N	siz	\N	\N	siz	iso639-3	en	1
23	2013-11-19 20:49:32.737713+01	2013-11-19 20:49:32.737721+01	t	\N	siwi1239	\N	\N	siwi1239	glottolog	en	1
24	2013-11-19 20:49:32.738402+01	2013-11-19 20:49:32.73841+01	t	\N	rmy	\N	\N	rmy	iso639-3	en	1
25	2013-11-19 20:49:32.739056+01	2013-11-19 20:49:32.739064+01	t	\N	vlax1238	\N	\N	vlax1238	glottolog	en	1
26	2013-11-19 20:49:32.739722+01	2013-11-19 20:49:32.739729+01	t	\N	xno	\N	\N	xno	iso639-3	en	1
27	2013-11-19 20:49:32.740407+01	2013-11-19 20:49:32.740415+01	t	\N	angl1258	\N	\N	angl1258	glottolog	en	1
28	2013-11-19 20:49:32.741101+01	2013-11-19 20:49:32.741109+01	t	\N	nep	\N	\N	nep	iso639-3	en	1
29	2013-11-19 20:49:32.741751+01	2013-11-19 20:49:32.741758+01	t	\N	nepa1252	\N	\N	nepa1252	glottolog	en	1
30	2013-11-19 20:49:32.742398+01	2013-11-19 20:49:32.742406+01	t	\N	fin	\N	\N	fin	iso639-3	en	1
31	2013-11-19 20:49:32.743056+01	2013-11-19 20:49:32.743063+01	t	\N	finn1318	\N	\N	finn1318	glottolog	en	1
32	2013-11-19 20:49:32.743703+01	2013-11-19 20:49:32.74371+01	t	\N	rit	\N	\N	rit	iso639-3	en	1
33	2013-11-19 20:49:32.744341+01	2013-11-19 20:49:32.744348+01	t	\N	rita1239	\N	\N	rita1239	glottolog	en	1
34	2013-11-19 20:49:32.744985+01	2013-11-19 20:49:32.744992+01	t	\N	aln	\N	\N	aln	iso639-3	en	1
35	2013-11-19 20:49:32.745621+01	2013-11-19 20:49:32.745629+01	t	\N	gheg1238	\N	\N	gheg1238	glottolog	en	1
36	2013-11-19 20:49:32.746394+01	2013-11-19 20:49:32.746402+01	t	\N	wnd	\N	\N	wnd	iso639-3	en	1
37	2013-11-19 20:49:32.747131+01	2013-11-19 20:49:32.747138+01	t	\N	wand1263	\N	\N	wand1263	glottolog	en	1
38	2013-11-19 20:49:32.747767+01	2013-11-19 20:49:32.747775+01	t	\N	sck	\N	\N	sck	iso639-3	en	1
39	2013-11-19 20:49:32.748386+01	2013-11-19 20:49:32.748396+01	t	\N	sadr1248	\N	\N	sadr1248	glottolog	en	1
40	2013-11-19 20:49:32.749118+01	2013-11-19 20:49:32.749126+01	t	\N	evn	\N	\N	evn	iso639-3	en	1
41	2013-11-19 20:49:32.749779+01	2013-11-19 20:49:32.749787+01	t	\N	even1259	\N	\N	even1259	glottolog	en	1
42	2013-11-19 20:49:32.750429+01	2013-11-19 20:49:32.750436+01	t	\N	nln	\N	\N	nln	iso639-3	en	1
43	2013-11-19 20:49:32.751072+01	2013-11-19 20:49:32.751079+01	t	\N	dura1245	\N	\N	dura1245	glottolog	en	1
44	2013-11-19 20:49:32.751712+01	2013-11-19 20:49:32.75172+01	t	\N	cbk	\N	\N	cbk	iso639-3	en	1
45	2013-11-19 20:49:32.752362+01	2013-11-19 20:49:32.752369+01	t	\N	chav1241	\N	\N	chav1241	glottolog	en	1
46	2013-11-19 20:49:32.752969+01	2013-11-19 20:49:32.752977+01	t	\N	sce	\N	\N	sce	iso639-3	en	1
47	2013-11-19 20:49:32.75363+01	2013-11-19 20:49:32.753638+01	t	\N	dong1285	\N	\N	dong1285	glottolog	en	1
48	2013-11-19 20:49:32.75427+01	2013-11-19 20:49:32.754278+01	t	\N	turk1311	\N	\N	turk1311	glottolog	en	1
49	2013-11-19 20:49:32.754934+01	2013-11-19 20:49:32.754942+01	t	\N	tgk	\N	\N	tgk	iso639-3	en	1
50	2013-11-19 20:49:32.755596+01	2013-11-19 20:49:32.755604+01	t	\N	taji1245	\N	\N	taji1245	glottolog	en	1
51	2013-11-19 20:49:32.756252+01	2013-11-19 20:49:32.756259+01	t	\N	ydd	\N	\N	ydd	iso639-3	en	1
52	2013-11-19 20:49:32.756929+01	2013-11-19 20:49:32.756937+01	t	\N	east2295	\N	\N	east2295	glottolog	en	1
53	2013-11-19 20:49:32.757638+01	2013-11-19 20:49:32.757645+01	t	\N	sza	\N	\N	sza	iso639-3	en	1
54	2013-11-19 20:49:32.758303+01	2013-11-19 20:49:32.758311+01	t	\N	seme1247	\N	\N	seme1247	glottolog	en	1
55	2013-11-19 20:49:32.758932+01	2013-11-19 20:49:32.758939+01	t	\N	khoe1241	\N	\N	khoe1241	glottolog	en	1
56	2013-11-19 20:49:32.759559+01	2013-11-19 20:49:32.759566+01	t	\N	nhr	\N	\N	nhr	iso639-3	en	1
57	2013-11-19 20:49:32.760186+01	2013-11-19 20:49:32.760194+01	t	\N	naro1249	\N	\N	naro1249	glottolog	en	1
58	2013-11-19 20:49:32.760852+01	2013-11-19 20:49:32.76086+01	t	\N	zoqu1261	\N	\N	zoqu1261	glottolog	en	1
59	2013-11-19 20:49:32.761481+01	2013-11-19 20:49:32.761489+01	t	\N	swe	\N	\N	swe	iso639-3	en	1
60	2013-11-19 20:49:32.762104+01	2013-11-19 20:49:32.762112+01	t	\N	swed1254	\N	\N	swed1254	glottolog	en	1
61	2013-11-19 20:49:32.762725+01	2013-11-19 20:49:32.762733+01	t	\N	qvc	\N	\N	qvc	iso639-3	en	1
62	2013-11-19 20:49:32.763464+01	2013-11-19 20:49:32.763475+01	t	\N	caja1238	\N	\N	caja1238	glottolog	en	1
63	2013-11-19 20:49:32.764205+01	2013-11-19 20:49:32.764213+01	t	\N	mon	\N	\N	mon	iso639-3	en	1
64	2013-11-19 20:49:32.764894+01	2013-11-19 20:49:32.764902+01	t	\N	mhr	\N	\N	mhr	iso639-3	en	1
65	2013-11-19 20:49:32.76569+01	2013-11-19 20:49:32.7657+01	t	\N	east2328	\N	\N	east2328	glottolog	en	1
66	2013-11-19 20:49:32.76647+01	2013-11-19 20:49:32.766479+01	t	\N	nas	\N	\N	nas	iso639-3	en	1
67	2013-11-19 20:49:32.767189+01	2013-11-19 20:49:32.767197+01	t	\N	naas1242	\N	\N	naas1242	glottolog	en	1
68	2013-11-19 20:49:32.767892+01	2013-11-19 20:49:32.7679+01	t	\N	brh	\N	\N	brh	iso639-3	en	1
69	2013-11-19 20:49:32.768581+01	2013-11-19 20:49:32.768589+01	t	\N	brah1256	\N	\N	brah1256	glottolog	en	1
70	2013-11-19 20:49:32.769253+01	2013-11-19 20:49:32.769261+01	t	\N	atla1275	\N	\N	atla1275	glottolog	en	1
71	2013-11-19 20:49:32.769923+01	2013-11-19 20:49:32.76993+01	t	\N	evn	\N	\N	evn	iso639-3	en	1
72	2013-11-19 20:49:32.770575+01	2013-11-19 20:49:32.770582+01	t	\N	even1259	\N	\N	even1259	glottolog	en	1
73	2013-11-19 20:49:32.771224+01	2013-11-19 20:49:32.771231+01	t	\N	nmm	\N	\N	nmm	iso639-3	en	1
74	2013-11-19 20:49:32.771863+01	2013-11-19 20:49:32.771871+01	t	\N	mana1288	\N	\N	mana1288	glottolog	en	1
75	2013-11-19 20:49:32.772518+01	2013-11-19 20:49:32.772525+01	t	\N	nhr	\N	\N	nhr	iso639-3	en	1
76	2013-11-19 20:49:32.773216+01	2013-11-19 20:49:32.773224+01	t	\N	naro1249	\N	\N	naro1249	glottolog	en	1
77	2013-11-19 20:49:32.773904+01	2013-11-19 20:49:32.773912+01	t	\N	ind	\N	\N	ind	iso639-3	en	1
78	2013-11-19 20:49:32.774571+01	2013-11-19 20:49:32.774578+01	t	\N	indo1316	\N	\N	indo1316	glottolog	en	1
79	2013-11-19 20:49:32.775238+01	2013-11-19 20:49:32.775245+01	t	\N	lat	\N	\N	lat	iso639-3	en	1
80	2013-11-19 20:49:32.775876+01	2013-11-19 20:49:32.775883+01	t	\N	lati1261	\N	\N	lati1261	glottolog	en	1
81	2013-11-19 20:49:32.776509+01	2013-11-19 20:49:32.776517+01	t	\N	ndt	\N	\N	ndt	iso639-3	en	1
82	2013-11-19 20:49:32.777169+01	2013-11-19 20:49:32.777177+01	t	\N	ndun1249	\N	\N	ndun1249	glottolog	en	1
83	2013-11-19 20:49:32.7778+01	2013-11-19 20:49:32.777807+01	t	\N	haw	\N	\N	haw	iso639-3	en	1
84	2013-11-19 20:49:32.778429+01	2013-11-19 20:49:32.778436+01	t	\N	hawa1245	\N	\N	hawa1245	glottolog	en	1
85	2013-11-19 20:49:32.77904+01	2013-11-19 20:49:32.779047+01	t	\N	sah	\N	\N	sah	iso639-3	en	1
86	2013-11-19 20:49:32.779639+01	2013-11-19 20:49:32.779646+01	t	\N	yaku1245	\N	\N	yaku1245	glottolog	en	1
87	2013-11-19 20:49:32.780687+01	2013-11-19 20:49:32.780699+01	t	\N	gwj	\N	\N	gwj	iso639-3	en	1
88	2013-11-19 20:49:32.781476+01	2013-11-19 20:49:32.781486+01	t	\N	gwii1239	\N	\N	gwii1239	glottolog	en	1
89	2013-11-19 20:49:32.782203+01	2013-11-19 20:49:32.782212+01	t	\N	sjd	\N	\N	sjd	iso639-3	en	1
90	2013-11-19 20:49:32.782921+01	2013-11-19 20:49:32.782929+01	t	\N	kild1236	\N	\N	kild1236	glottolog	en	1
91	2013-11-19 20:49:32.783684+01	2013-11-19 20:49:32.783695+01	t	\N	hrt	\N	\N	hrt	iso639-3	en	1
92	2013-11-19 20:49:32.784451+01	2013-11-19 20:49:32.78446+01	t	\N	hert1241	\N	\N	hert1241	glottolog	en	1
93	2013-11-19 20:49:32.785153+01	2013-11-19 20:49:32.785161+01	t	\N	qvn	\N	\N	qvn	iso639-3	en	1
94	2013-11-19 20:49:32.785864+01	2013-11-19 20:49:32.785872+01	t	\N	nort2980	\N	\N	nort2980	glottolog	en	1
95	2013-11-19 20:49:32.786565+01	2013-11-19 20:49:32.786572+01	t	\N	byn	\N	\N	byn	iso639-3	en	1
96	2013-11-19 20:49:32.787252+01	2013-11-19 20:49:32.787259+01	t	\N	bili1260	\N	\N	bili1260	glottolog	en	1
97	2013-11-19 20:49:32.787936+01	2013-11-19 20:49:32.787943+01	t	\N	gue	\N	\N	gue	iso639-3	en	1
98	2013-11-19 20:49:32.788591+01	2013-11-19 20:49:32.788598+01	t	\N	guri1247	\N	\N	guri1247	glottolog	en	1
99	2013-11-19 20:49:32.789245+01	2013-11-19 20:49:32.789252+01	t	\N	bod	\N	\N	bod	iso639-3	en	1
100	2013-11-19 20:49:32.789859+01	2013-11-19 20:49:32.789866+01	t	\N	tibe1272	\N	\N	tibe1272	glottolog	en	1
101	2013-11-19 20:49:32.790473+01	2013-11-19 20:49:32.790481+01	t	\N	guri1249	\N	\N	guri1249	glottolog	en	1
102	2013-11-19 20:49:32.791084+01	2013-11-19 20:49:32.791091+01	t	\N	rml	\N	\N	rml	iso639-3	en	1
103	2013-11-19 20:49:32.791692+01	2013-11-19 20:49:32.7917+01	t	\N	balt1257	\N	\N	balt1257	glottolog	en	1
104	2013-11-19 20:49:32.792297+01	2013-11-19 20:49:32.792305+01	t	\N	bgp	\N	\N	bgp	iso639-3	en	1
105	2013-11-19 20:49:32.79293+01	2013-11-19 20:49:32.792937+01	t	\N	east2304	\N	\N	east2304	glottolog	en	1
106	2013-11-19 20:49:32.793742+01	2013-11-19 20:49:32.793753+01	t	\N	tdt	\N	\N	tdt	iso639-3	en	1
107	2013-11-19 20:49:32.794524+01	2013-11-19 20:49:32.794532+01	t	\N	tetu1246	\N	\N	tetu1246	glottolog	en	1
108	2013-11-19 20:49:32.795232+01	2013-11-19 20:49:32.795241+01	t	\N	tae	\N	\N	tae	iso639-3	en	1
109	2013-11-19 20:49:32.79592+01	2013-11-19 20:49:32.795928+01	t	\N	tari1256	\N	\N	tari1256	glottolog	en	1
110	2013-11-19 20:49:32.796598+01	2013-11-19 20:49:32.796617+01	t	\N	uzn	\N	\N	uzn	iso639-3	en	1
111	2013-11-19 20:49:32.797295+01	2013-11-19 20:49:32.797303+01	t	\N	nort2690	\N	\N	nort2690	glottolog	en	1
112	2013-11-19 20:49:32.797961+01	2013-11-19 20:49:32.797969+01	t	\N	tsz	\N	\N	tsz	iso639-3	en	1
113	2013-11-19 20:49:32.798905+01	2013-11-19 20:49:32.798922+01	t	\N	pure1242	\N	\N	pure1242	glottolog	en	1
114	2013-11-19 20:49:32.79964+01	2013-11-19 20:49:32.799649+01	t	\N	tig	\N	\N	tig	iso639-3	en	1
115	2013-11-19 20:49:32.800388+01	2013-11-19 20:49:32.800399+01	t	\N	tigr1270	\N	\N	tigr1270	glottolog	en	1
116	2013-11-19 20:49:32.801247+01	2013-11-19 20:49:32.801255+01	t	\N	ell	\N	\N	ell	iso639-3	en	1
117	2013-11-19 20:49:32.8021+01	2013-11-19 20:49:32.802108+01	t	\N	mode1248	\N	\N	mode1248	glottolog	en	1
118	2013-11-19 20:49:32.802799+01	2013-11-19 20:49:32.802807+01	t	\N	lav	\N	\N	lav	iso639-3	en	1
119	2013-11-19 20:49:32.803516+01	2013-11-19 20:49:32.803526+01	t	\N	latv1249	\N	\N	latv1249	glottolog	en	1
120	2013-11-19 20:49:32.804322+01	2013-11-19 20:49:32.804331+01	t	\N	eng	\N	\N	eng	iso639-3	en	1
121	2013-11-19 20:49:32.805084+01	2013-11-19 20:49:32.805092+01	t	\N	stan1293	\N	\N	stan1293	glottolog	en	1
122	2013-11-19 20:49:32.805809+01	2013-11-19 20:49:32.805818+01	t	\N	scn	\N	\N	scn	iso639-3	en	1
123	2013-11-19 20:49:32.806496+01	2013-11-19 20:49:32.806504+01	t	\N	sici1248	\N	\N	sici1248	glottolog	en	1
124	2013-11-19 20:49:32.807169+01	2013-11-19 20:49:32.807177+01	t	\N	pes	\N	\N	pes	iso639-3	en	1
125	2013-11-19 20:49:32.807861+01	2013-11-19 20:49:32.807869+01	t	\N	west2369	\N	\N	west2369	glottolog	en	1
126	2013-11-19 20:49:32.808543+01	2013-11-19 20:49:32.808551+01	t	\N	hrv	\N	\N	hrv	iso639-3	en	1
127	2013-11-19 20:49:32.809231+01	2013-11-19 20:49:32.809239+01	t	\N	croa1245	\N	\N	croa1245	glottolog	en	1
128	2013-11-19 20:49:32.809901+01	2013-11-19 20:49:32.809909+01	t	\N	wuh	\N	\N	wuh	iso639-3	en	1
129	2013-11-19 20:49:32.810569+01	2013-11-19 20:49:32.810577+01	t	\N	wutu1241	\N	\N	wutu1241	glottolog	en	1
130	2013-11-19 20:49:32.811209+01	2013-11-19 20:49:32.811217+01	t	\N	cmn	\N	\N	cmn	iso639-3	en	1
131	2013-11-19 20:49:32.811844+01	2013-11-19 20:49:32.811852+01	t	\N	mand1415	\N	\N	mand1415	glottolog	en	1
132	2013-11-19 20:49:32.812483+01	2013-11-19 20:49:32.812491+01	t	\N	poi	\N	\N	poi	iso639-3	en	1
133	2013-11-19 20:49:32.813141+01	2013-11-19 20:49:32.813149+01	t	\N	high1276	\N	\N	high1276	glottolog	en	1
134	2013-11-19 20:49:32.813953+01	2013-11-19 20:49:32.813961+01	t	\N	waya1271	\N	\N	waya1271	glottolog	en	1
135	2013-11-19 20:49:32.814827+01	2013-11-19 20:49:32.814836+01	t	\N	ame	\N	\N	ame	iso639-3	en	1
136	2013-11-19 20:49:32.815569+01	2013-11-19 20:49:32.815578+01	t	\N	yane1238	\N	\N	yane1238	glottolog	en	1
137	2013-11-19 20:49:32.816298+01	2013-11-19 20:49:32.816306+01	t	\N	mud	\N	\N	mud	iso639-3	en	1
138	2013-11-19 20:49:32.817045+01	2013-11-19 20:49:32.817053+01	t	\N	medn1235	\N	\N	medn1235	glottolog	en	1
139	2013-11-19 20:49:32.817766+01	2013-11-19 20:49:32.817775+01	t	\N	ttu	\N	\N	ttu	iso639-3	en	1
140	2013-11-19 20:49:32.818525+01	2013-11-19 20:49:32.818536+01	t	\N	tora1259	\N	\N	tora1259	glottolog	en	1
141	2013-11-19 20:49:32.819284+01	2013-11-19 20:49:32.819293+01	t	\N	cari1283	\N	\N	cari1283	glottolog	en	1
142	2013-11-19 20:49:32.819998+01	2013-11-19 20:49:32.820006+01	t	\N	apc	\N	\N	apc	iso639-3	en	1
143	2013-11-19 20:49:32.820726+01	2013-11-19 20:49:32.820735+01	t	\N	nort3139	\N	\N	nort3139	glottolog	en	1
144	2013-11-19 20:49:32.821419+01	2013-11-19 20:49:32.821427+01	t	\N	acy	\N	\N	acy	iso639-3	en	1
145	2013-11-19 20:49:32.822099+01	2013-11-19 20:49:32.822107+01	t	\N	cypr1248	\N	\N	cypr1248	glottolog	en	1
146	2013-11-19 20:49:32.822744+01	2013-11-19 20:49:32.822752+01	t	\N	swh	\N	\N	swh	iso639-3	en	1
147	2013-11-19 20:49:32.823404+01	2013-11-19 20:49:32.823412+01	t	\N	swah1253	\N	\N	swah1253	glottolog	en	1
148	2013-11-19 20:49:32.824193+01	2013-11-19 20:49:32.824203+01	t	\N	car	\N	\N	car	iso639-3	en	1
149	2013-11-19 20:49:32.824977+01	2013-11-19 20:49:32.824986+01	t	\N	gali1262	\N	\N	gali1262	glottolog	en	1
150	2013-11-19 20:49:32.825708+01	2013-11-19 20:49:32.825716+01	t	\N	cpg	\N	\N	cpg	iso639-3	en	1
151	2013-11-19 20:49:32.826422+01	2013-11-19 20:49:32.82643+01	t	\N	capp1239	\N	\N	capp1239	glottolog	en	1
152	2013-11-19 20:49:32.827125+01	2013-11-19 20:49:32.827133+01	t	\N	tur	\N	\N	tur	iso639-3	en	1
153	2013-11-19 20:49:32.827795+01	2013-11-19 20:49:32.827802+01	t	\N	nucl1301	\N	\N	nucl1301	glottolog	en	1
154	2013-11-19 20:49:32.828463+01	2013-11-19 20:49:32.82847+01	t	\N	dta	\N	\N	dta	iso639-3	en	1
155	2013-11-19 20:49:32.82913+01	2013-11-19 20:49:32.829138+01	t	\N	daur1238	\N	\N	daur1238	glottolog	en	1
156	2013-11-19 20:49:32.829774+01	2013-11-19 20:49:32.829782+01	t	\N	enm	\N	\N	enm	iso639-3	en	1
157	2013-11-19 20:49:32.830399+01	2013-11-19 20:49:32.830407+01	t	\N	midd1317	\N	\N	midd1317	glottolog	en	1
158	2013-11-19 20:49:32.831045+01	2013-11-19 20:49:32.831053+01	t	\N	kmr	\N	\N	kmr	iso639-3	en	1
159	2013-11-19 20:49:32.831801+01	2013-11-19 20:49:32.831812+01	t	\N	nort2641	\N	\N	nort2641	glottolog	en	1
160	2013-11-19 20:49:32.832601+01	2013-11-19 20:49:32.832625+01	t	\N	ksx	\N	\N	ksx	iso639-3	en	1
161	2013-11-19 20:49:32.83335+01	2013-11-19 20:49:32.833359+01	t	\N	keda1252	\N	\N	keda1252	glottolog	en	1
162	2013-11-19 20:49:32.834063+01	2013-11-19 20:49:32.834072+01	t	\N	cho	\N	\N	cho	iso639-3	en	1
163	2013-11-19 20:49:32.834783+01	2013-11-19 20:49:32.834791+01	t	\N	choc1276	\N	\N	choc1276	glottolog	en	1
164	2013-11-19 20:49:32.835484+01	2013-11-19 20:49:32.835492+01	t	\N	aat	\N	\N	aat	iso639-3	en	1
165	2013-11-19 20:49:32.8363+01	2013-11-19 20:49:32.836308+01	t	\N	arva1236	\N	\N	arva1236	glottolog	en	1
166	2013-11-19 20:49:32.837009+01	2013-11-19 20:49:32.837017+01	t	\N	akk	\N	\N	akk	iso639-3	en	1
167	2013-11-19 20:49:32.837675+01	2013-11-19 20:49:32.837683+01	t	\N	akka1240	\N	\N	akka1240	glottolog	en	1
168	2013-11-19 20:49:32.838332+01	2013-11-19 20:49:32.83834+01	t	\N	hin	\N	\N	hin	iso639-3	en	1
169	2013-11-19 20:49:32.838982+01	2013-11-19 20:49:32.838989+01	t	\N	hind1269	\N	\N	hind1269	glottolog	en	1
170	2013-11-19 20:49:32.839624+01	2013-11-19 20:49:32.839632+01	t	\N	tur	\N	\N	tur	iso639-3	en	1
171	2013-11-19 20:49:32.840361+01	2013-11-19 20:49:32.840368+01	t	\N	nucl1301	\N	\N	nucl1301	glottolog	en	1
172	2013-11-19 20:49:32.841032+01	2013-11-19 20:49:32.841039+01	t	\N	sux	\N	\N	sux	iso639-3	en	1
173	2013-11-19 20:49:32.841673+01	2013-11-19 20:49:32.84168+01	t	\N	sume1241	\N	\N	sume1241	glottolog	en	1
174	2013-11-19 20:49:32.842281+01	2013-11-19 20:49:32.842288+01	t	\N	plt	\N	\N	plt	iso639-3	en	1
175	2013-11-19 20:49:32.842892+01	2013-11-19 20:49:32.842899+01	t	\N	plat1254	\N	\N	plat1254	glottolog	en	1
176	2013-11-19 20:49:32.843525+01	2013-11-19 20:49:32.843533+01	t	\N	chv	\N	\N	chv	iso639-3	en	1
177	2013-11-19 20:49:32.844242+01	2013-11-19 20:49:32.844253+01	t	\N	chuv1255	\N	\N	chuv1255	glottolog	en	1
178	2013-11-19 20:49:32.845056+01	2013-11-19 20:49:32.845065+01	t	\N	hun	\N	\N	hun	iso639-3	en	1
179	2013-11-19 20:49:32.845786+01	2013-11-19 20:49:32.845794+01	t	\N	hung1274	\N	\N	hung1274	glottolog	en	1
180	2013-11-19 20:49:32.846487+01	2013-11-19 20:49:32.846495+01	t	\N	lad	\N	\N	lad	iso639-3	en	1
181	2013-11-19 20:49:32.847173+01	2013-11-19 20:49:32.84718+01	t	\N	ladi1251	\N	\N	ladi1251	glottolog	en	1
182	2013-11-19 20:49:32.847913+01	2013-11-19 20:49:32.847923+01	t	\N	apc	\N	\N	apc	iso639-3	en	1
183	2013-11-19 20:49:32.848737+01	2013-11-19 20:49:32.848746+01	t	\N	nort3139	\N	\N	nort3139	glottolog	en	1
184	2013-11-19 20:49:32.849455+01	2013-11-19 20:49:32.849463+01	t	\N	dese1234	\N	\N	dese1234	glottolog	en	1
185	2013-11-19 20:49:32.85015+01	2013-11-19 20:49:32.850158+01	t	\N	zlm	\N	\N	zlm	iso639-3	en	1
186	2013-11-19 20:49:32.850895+01	2013-11-19 20:49:32.850904+01	t	\N	mala1479	\N	\N	mala1479	glottolog	en	1
187	2013-11-19 20:49:32.851688+01	2013-11-19 20:49:32.851698+01	t	\N	krl	\N	\N	krl	iso639-3	en	1
188	2013-11-19 20:49:32.852434+01	2013-11-19 20:49:32.852442+01	t	\N	kare1335	\N	\N	kare1335	glottolog	en	1
189	2013-11-19 20:49:32.853212+01	2013-11-19 20:49:32.85322+01	t	\N	qxp	\N	\N	qxp	iso639-3	en	1
190	2013-11-19 20:49:32.853904+01	2013-11-19 20:49:32.853912+01	t	\N	puno1238	\N	\N	puno1238	glottolog	en	1
191	2013-11-19 20:49:32.854613+01	2013-11-19 20:49:32.854621+01	t	\N	gbc	\N	\N	gbc	iso639-3	en	1
192	2013-11-19 20:49:32.855326+01	2013-11-19 20:49:32.855336+01	t	\N	gara1261	\N	\N	gara1261	glottolog	en	1
193	2013-11-19 20:49:32.856106+01	2013-11-19 20:49:32.856115+01	t	\N	rus	\N	\N	rus	iso639-3	en	1
194	2013-11-19 20:49:32.856863+01	2013-11-19 20:49:32.856871+01	t	\N	russ1263	\N	\N	russ1263	glottolog	en	1
195	2013-11-19 20:49:32.857619+01	2013-11-19 20:49:32.857628+01	t	\N	srp	\N	\N	srp	iso639-3	en	1
196	2013-11-19 20:49:32.858358+01	2013-11-19 20:49:32.858366+01	t	\N	serb1264	\N	\N	serb1264	glottolog	en	1
197	2013-11-19 20:49:32.859044+01	2013-11-19 20:49:32.859051+01	t	\N	heb	\N	\N	heb	iso639-3	en	1
198	2013-11-19 20:49:32.859713+01	2013-11-19 20:49:32.859721+01	t	\N	hebr1245	\N	\N	hebr1245	glottolog	en	1
199	2013-11-19 20:49:32.860381+01	2013-11-19 20:49:32.860388+01	t	\N	cku	\N	\N	cku	iso639-3	en	1
200	2013-11-19 20:49:32.861071+01	2013-11-19 20:49:32.861078+01	t	\N	koas1236	\N	\N	koas1236	glottolog	en	1
201	2013-11-19 20:49:32.861822+01	2013-11-19 20:49:32.86183+01	t	\N	kas	\N	\N	kas	iso639-3	en	1
202	2013-11-19 20:49:32.862546+01	2013-11-19 20:49:32.862554+01	t	\N	kash1277	\N	\N	kash1277	glottolog	en	1
203	2013-11-19 20:49:32.863269+01	2013-11-19 20:49:32.863277+01	t	\N	fin	\N	\N	fin	iso639-3	en	1
204	2013-11-19 20:49:32.864001+01	2013-11-19 20:49:32.864009+01	t	\N	finn1318	\N	\N	finn1318	glottolog	en	1
205	2013-11-19 20:49:32.865015+01	2013-11-19 20:49:32.865024+01	t	\N	ckt	\N	\N	ckt	iso639-3	en	1
206	2013-11-19 20:49:32.865836+01	2013-11-19 20:49:32.865843+01	t	\N	chuk1273	\N	\N	chuk1273	glottolog	en	1
207	2013-11-19 20:49:32.866548+01	2013-11-19 20:49:32.866555+01	t	\N	ayl	\N	\N	ayl	iso639-3	en	1
208	2013-11-19 20:49:32.867242+01	2013-11-19 20:49:32.867249+01	t	\N	liby1240	\N	\N	liby1240	glottolog	en	1
209	2013-11-19 20:49:32.867928+01	2013-11-19 20:49:32.867935+01	t	\N	bnc	\N	\N	bnc	iso639-3	en	1
210	2013-11-19 20:49:32.868636+01	2013-11-19 20:49:32.868647+01	t	\N	cent2083	\N	\N	cent2083	glottolog	en	1
211	2013-11-19 20:49:32.869306+01	2013-11-19 20:49:32.869314+01	t	\N	amw	\N	\N	amw	iso639-3	en	1
212	2013-11-19 20:49:32.870055+01	2013-11-19 20:49:32.870063+01	t	\N	west2763	\N	\N	west2763	glottolog	en	1
213	2013-11-19 20:49:32.870782+01	2013-11-19 20:49:32.87079+01	t	\N	tav	\N	\N	tav	iso639-3	en	1
214	2013-11-19 20:49:32.871506+01	2013-11-19 20:49:32.871514+01	t	\N	tatu1247	\N	\N	tatu1247	glottolog	en	1
215	2013-11-19 20:49:32.872232+01	2013-11-19 20:49:32.872241+01	t	\N	lez	\N	\N	lez	iso639-3	en	1
216	2013-11-19 20:49:32.872988+01	2013-11-19 20:49:32.872996+01	t	\N	lezg1247	\N	\N	lezg1247	glottolog	en	1
217	2013-11-19 20:49:32.873736+01	2013-11-19 20:49:32.873744+01	t	\N	mlk	\N	\N	mlk	iso639-3	en	1
218	2013-11-19 20:49:32.874484+01	2013-11-19 20:49:32.874492+01	t	\N	ilwa1237	\N	\N	ilwa1237	glottolog	en	1
219	2013-11-19 20:49:32.875197+01	2013-11-19 20:49:32.875204+01	t	\N	deu	\N	\N	deu	iso639-3	en	1
220	2013-11-19 20:49:32.875888+01	2013-11-19 20:49:32.875895+01	t	\N	stan1295	\N	\N	stan1295	glottolog	en	1
221	2013-11-19 20:49:32.876573+01	2013-11-19 20:49:32.87658+01	t	\N	tam	\N	\N	tam	iso639-3	en	1
222	2013-11-19 20:49:32.877259+01	2013-11-19 20:49:32.877266+01	t	\N	tami1289	\N	\N	tami1289	glottolog	en	1
223	2013-11-19 20:49:32.877904+01	2013-11-19 20:49:32.877912+01	t	\N	kpv	\N	\N	kpv	iso639-3	en	1
224	2013-11-19 20:49:32.878546+01	2013-11-19 20:49:32.878554+01	t	\N	komi1268	\N	\N	komi1268	glottolog	en	1
225	2013-11-19 20:49:32.879162+01	2013-11-19 20:49:32.87917+01	t	\N	azb	\N	\N	azb	iso639-3	en	1
226	2013-11-19 20:49:32.879805+01	2013-11-19 20:49:32.879812+01	t	\N	sout2697	\N	\N	sout2697	glottolog	en	1
227	2013-11-19 20:49:32.880618+01	2013-11-19 20:49:32.88063+01	t	\N	pes	\N	\N	pes	iso639-3	en	1
228	2013-11-19 20:49:32.881388+01	2013-11-19 20:49:32.881396+01	t	\N	west2369	\N	\N	west2369	glottolog	en	1
229	2013-11-19 20:49:32.882129+01	2013-11-19 20:49:32.882137+01	t	\N	khk	\N	\N	khk	iso639-3	en	1
230	2013-11-19 20:49:32.882849+01	2013-11-19 20:49:32.882857+01	t	\N	halh1238	\N	\N	halh1238	glottolog	en	1
231	2013-11-19 20:49:32.88357+01	2013-11-19 20:49:32.883578+01	t	\N	eus	\N	\N	eus	iso639-3	en	1
232	2013-11-19 20:49:32.884284+01	2013-11-19 20:49:32.884292+01	t	\N	basq1248	\N	\N	basq1248	glottolog	en	1
233	2013-11-19 20:49:32.885195+01	2013-11-19 20:49:32.885207+01	t	\N	ayr	\N	\N	ayr	iso639-3	en	1
234	2013-11-19 20:49:32.885985+01	2013-11-19 20:49:32.885994+01	t	\N	cent2142	\N	\N	cent2142	glottolog	en	1
235	2013-11-19 20:49:32.88672+01	2013-11-19 20:49:32.886729+01	t	\N	swh	\N	\N	swh	iso639-3	en	1
236	2013-11-19 20:49:32.887448+01	2013-11-19 20:49:32.887456+01	t	\N	swah1253	\N	\N	swah1253	glottolog	en	1
237	2013-11-19 20:49:32.888171+01	2013-11-19 20:49:32.888179+01	t	\N	gyd	\N	\N	gyd	iso639-3	en	1
238	2013-11-19 20:49:32.888885+01	2013-11-19 20:49:32.888893+01	t	\N	kaya1319	\N	\N	kaya1319	glottolog	en	1
239	2013-11-19 20:49:32.88958+01	2013-11-19 20:49:32.889588+01	t	\N	ron	\N	\N	ron	iso639-3	en	1
240	2013-11-19 20:49:32.890266+01	2013-11-19 20:49:32.890274+01	t	\N	roma1327	\N	\N	roma1327	glottolog	en	1
241	2013-11-19 20:49:32.890948+01	2013-11-19 20:49:32.890956+01	t	\N	lin	\N	\N	lin	iso639-3	en	1
242	2013-11-19 20:49:32.891568+01	2013-11-19 20:49:32.891576+01	t	\N	ling1263	\N	\N	ling1263	glottolog	en	1
243	2013-11-19 20:49:32.892372+01	2013-11-19 20:49:32.892382+01	t	\N	swh	\N	\N	swh	iso639-3	en	1
244	2013-11-19 20:49:32.893176+01	2013-11-19 20:49:32.893184+01	t	\N	swah1253	\N	\N	swah1253	glottolog	en	1
245	2013-11-19 20:49:32.893927+01	2013-11-19 20:49:32.893936+01	t	\N	rgr	\N	\N	rgr	iso639-3	en	1
246	2013-11-19 20:49:32.894716+01	2013-11-19 20:49:32.894725+01	t	\N	resi1247	\N	\N	resi1247	glottolog	en	1
247	2013-11-19 20:49:32.895458+01	2013-11-19 20:49:32.895466+01	t	\N	ruo	\N	\N	ruo	iso639-3	en	1
248	2013-11-19 20:49:32.896189+01	2013-11-19 20:49:32.896197+01	t	\N	istr1245	\N	\N	istr1245	glottolog	en	1
249	2013-11-19 20:49:32.896974+01	2013-11-19 20:49:32.896982+01	t	\N	ilo	\N	\N	ilo	iso639-3	en	1
250	2013-11-19 20:49:32.897702+01	2013-11-19 20:49:32.89771+01	t	\N	ilok1237	\N	\N	ilok1237	glottolog	en	1
251	2013-11-19 20:49:32.898588+01	2013-11-19 20:49:32.898597+01	t	\N	nld	\N	\N	nld	iso639-3	en	1
252	2013-11-19 20:49:32.899324+01	2013-11-19 20:49:32.899332+01	t	\N	dutc1256	\N	\N	dutc1256	glottolog	en	1
253	2013-11-19 20:49:32.900057+01	2013-11-19 20:49:32.90007+01	t	\N	san	\N	\N	san	iso639-3	en	1
254	2013-11-19 20:49:32.900857+01	2013-11-19 20:49:32.900865+01	t	\N	sans1269	\N	\N	sans1269	glottolog	en	1
255	2013-11-19 20:49:32.901614+01	2013-11-19 20:49:32.901623+01	t	\N	cab	\N	\N	cab	iso639-3	en	1
256	2013-11-19 20:49:32.902467+01	2013-11-19 20:49:32.902475+01	t	\N	gari1256	\N	\N	gari1256	glottolog	en	1
257	2013-11-19 20:49:32.903201+01	2013-11-19 20:49:32.903209+01	t	\N	kru	\N	\N	kru	iso639-3	en	1
258	2013-11-19 20:49:32.903923+01	2013-11-19 20:49:32.90393+01	t	\N	kuru1302	\N	\N	kuru1302	glottolog	en	1
259	2013-11-19 20:49:32.904663+01	2013-11-19 20:49:32.904671+01	t	\N	tgk	\N	\N	tgk	iso639-3	en	1
260	2013-11-19 20:49:32.905445+01	2013-11-19 20:49:32.905454+01	t	\N	taji1245	\N	\N	taji1245	glottolog	en	1
261	2013-11-19 20:49:32.906185+01	2013-11-19 20:49:32.906193+01	t	\N	ctu	\N	\N	ctu	iso639-3	en	1
262	2013-11-19 20:49:32.906911+01	2013-11-19 20:49:32.906919+01	t	\N	chol1282	\N	\N	chol1282	glottolog	en	1
263	2013-11-19 20:49:32.907681+01	2013-11-19 20:49:32.90769+01	t	\N	kca	\N	\N	kca	iso639-3	en	1
264	2013-11-19 20:49:32.908164+01	2013-11-19 20:49:32.908167+01	t	\N	khan1273	\N	\N	khan1273	glottolog	en	1
265	2013-11-19 20:49:32.908526+01	2013-11-19 20:49:32.908535+01	t	\N	east2698	\N	\N	east2698	glottolog	en	1
266	2013-11-19 20:49:32.909162+01	2013-11-19 20:49:32.909166+01	t	\N	bisa1268	\N	\N	bisa1268	glottolog	en	1
267	2013-11-19 20:49:32.909518+01	2013-11-19 20:49:32.909523+01	t	\N	nuy	\N	\N	nuy	iso639-3	en	1
268	2013-11-19 20:49:32.910053+01	2013-11-19 20:49:32.910058+01	t	\N	nung1290	\N	\N	nung1290	glottolog	en	1
269	2013-11-19 20:49:32.910753+01	2013-11-19 20:49:32.910762+01	t	\N	mlt	\N	\N	mlt	iso639-3	en	1
270	2013-11-19 20:49:32.911446+01	2013-11-19 20:49:32.911453+01	t	\N	malt1254	\N	\N	malt1254	glottolog	en	1
271	2013-11-19 20:49:32.912108+01	2013-11-19 20:49:32.912117+01	t	\N	asm	\N	\N	asm	iso639-3	en	1
272	2013-11-19 20:49:32.912784+01	2013-11-19 20:49:32.912792+01	t	\N	assa1263	\N	\N	assa1263	glottolog	en	1
273	2013-11-19 20:49:32.913598+01	2013-11-19 20:49:32.913606+01	t	\N	kmr	\N	\N	kmr	iso639-3	en	1
274	2013-11-19 20:49:32.914276+01	2013-11-19 20:49:32.914284+01	t	\N	nort2641	\N	\N	nort2641	glottolog	en	1
275	2013-11-19 20:49:32.915001+01	2013-11-19 20:49:32.915017+01	t	\N	ncl	\N	\N	ncl	iso639-3	en	1
276	2013-11-19 20:49:32.915747+01	2013-11-19 20:49:32.91575+01	t	\N	mich1245	\N	\N	mich1245	glottolog	en	1
277	2013-11-19 20:49:32.916548+01	2013-11-19 20:49:32.916558+01	t	\N	wsa	\N	\N	wsa	iso639-3	en	1
278	2013-11-19 20:49:32.917466+01	2013-11-19 20:49:32.917477+01	t	\N	ware1253	\N	\N	ware1253	glottolog	en	1
279	2013-11-19 20:49:32.918296+01	2013-11-19 20:49:32.918307+01	t	\N	cmn	\N	\N	cmn	iso639-3	en	1
280	2013-11-19 20:49:32.91913+01	2013-11-19 20:49:32.91914+01	t	\N	mand1415	\N	\N	mand1415	glottolog	en	1
281	2013-11-19 20:49:32.919953+01	2013-11-19 20:49:32.919963+01	t	\N	ure	\N	\N	ure	iso639-3	en	1
282	2013-11-19 20:49:32.920715+01	2013-11-19 20:49:32.920724+01	t	\N	uruu1244	\N	\N	uruu1244	glottolog	en	1
283	2013-11-19 20:49:32.92139+01	2013-11-19 20:49:32.921397+01	t	\N	ycn	\N	\N	ycn	iso639-3	en	1
284	2013-11-19 20:49:32.922049+01	2013-11-19 20:49:32.922057+01	t	\N	yucu1253	\N	\N	yucu1253	glottolog	en	1
285	2013-11-19 20:49:32.922702+01	2013-11-19 20:49:32.92271+01	t	\N	khc	\N	\N	khc	iso639-3	en	1
286	2013-11-19 20:49:32.92335+01	2013-11-19 20:49:32.923358+01	t	\N	tuka1248	\N	\N	tuka1248	glottolog	en	1
287	2013-11-19 20:49:32.923998+01	2013-11-19 20:49:32.924006+01	t	\N	nid	\N	\N	nid	iso639-3	en	1
288	2013-11-19 20:49:32.924653+01	2013-11-19 20:49:32.924661+01	t	\N	ngan1295	\N	\N	ngan1295	glottolog	en	1
289	2013-11-19 20:49:32.925431+01	2013-11-19 20:49:32.925443+01	t	\N	por	\N	\N	por	iso639-3	en	1
290	2013-11-19 20:49:32.926187+01	2013-11-19 20:49:32.926195+01	t	\N	port1283	\N	\N	port1283	glottolog	en	1
291	2013-11-19 20:49:32.92698+01	2013-11-19 20:49:32.926992+01	t	\N	ary	\N	\N	ary	iso639-3	en	1
292	2013-11-19 20:49:32.927792+01	2013-11-19 20:49:32.927803+01	t	\N	moro1292	\N	\N	moro1292	glottolog	en	1
293	2013-11-19 20:49:32.928601+01	2013-11-19 20:49:32.928625+01	t	\N	eve	\N	\N	eve	iso639-3	en	1
294	2013-11-19 20:49:32.929344+01	2013-11-19 20:49:32.929353+01	t	\N	even1260	\N	\N	even1260	glottolog	en	1
295	2013-11-19 20:49:32.930015+01	2013-11-19 20:49:32.930028+01	t	\N	mala1544	\N	\N	mala1544	glottolog	en	1
296	2013-11-19 20:49:32.93072+01	2013-11-19 20:49:32.930728+01	t	\N	boa	\N	\N	boa	iso639-3	en	1
297	2013-11-19 20:49:32.931349+01	2013-11-19 20:49:32.931356+01	t	\N	bora1263	\N	\N	bora1263	glottolog	en	1
298	2013-11-19 20:49:32.932007+01	2013-11-19 20:49:32.932024+01	t	\N	spa	\N	\N	spa	iso639-3	en	1
299	2013-11-19 20:49:32.932817+01	2013-11-19 20:49:32.932826+01	t	\N	stan1288	\N	\N	stan1288	glottolog	en	1
300	2013-11-19 20:49:32.933554+01	2013-11-19 20:49:32.933562+01	t	\N	brah1260	\N	\N	brah1260	glottolog	en	1
301	2013-11-19 20:49:32.934256+01	2013-11-19 20:49:32.934264+01	t	\N	yua	\N	\N	yua	iso639-3	en	1
302	2013-11-19 20:49:32.934941+01	2013-11-19 20:49:32.934949+01	t	\N	yuca1254	\N	\N	yuca1254	glottolog	en	1
303	2013-11-19 20:49:32.93563+01	2013-11-19 20:49:32.935638+01	t	\N	qua	\N	\N	qua	iso639-3	en	1
304	2013-11-19 20:49:32.936424+01	2013-11-19 20:49:32.936432+01	t	\N	quap1242	\N	\N	quap1242	glottolog	en	1
\.


--
-- Data for Name: identifier_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY identifier_history (pk, created, updated, active, jsondata, name, description, markup_description, id, type, lang, version) FROM stdin;
\.


--
-- Name: identifier_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('identifier_history_pk_seq', 1, false);


--
-- Name: identifier_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('identifier_pk_seq', 304, true);


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: -
--

COPY language (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, latitude, longitude, version) FROM stdin;
1	2013-11-19 20:49:33.004423+01	2013-12-02 09:12:54.770422+01	t	{"color": "ffffff", "genus": "Eastern Cushitic", "macroarea": "Africa"}	base	1	Cushitic	\N	\N	-0.849999999999999978	39.9500000000000028	1
4	2013-11-19 20:49:33.025082+01	2013-12-02 09:12:54.802373+01	t	{"color": "ffffff", "genus": "Finnic", "macroarea": "Eurasia"}	base	4	Estonian	\N	\N	59.5478000000000023	22.8209000000000017	1
9	2013-11-19 20:49:33.028962+01	2013-12-02 09:12:54.805523+01	t	{"color": "ffffff", "genus": "Slavic", "macroarea": "Eurasia"}	base	9	Bulgarian	\N	\N	43.3646000000000029	25.0470000000000006	1
10	2013-11-19 20:49:33.029844+01	2013-12-02 09:12:54.809571+01	t	{"color": "ffffff", "genus": "Malayic", "macroarea": "Southeast Asia & Oceania"}	base	10	Banjar Malay	\N	\N	0.747105000000000019	115.790000000000006	1
14	2013-11-19 20:49:33.033441+01	2013-12-02 09:12:54.813232+01	t	{"color": "ffffff", "genus": "Romance", "macroarea": "Eurasia"}	base	14	Norman French	\N	\N	48	2	1
15	2013-11-19 20:49:33.034388+01	2013-12-02 09:12:54.817663+01	t	{"color": "ffffff", "genus": "Indic", "macroarea": "Eurasia"}	base	15	Nepali	\N	\N	27.5946999999999996	87.6200999999999937	1
20	2013-11-19 20:49:33.039294+01	2013-12-02 09:12:54.822663+01	t	{"color": "ffffff", "genus": "Indic", "macroarea": "Eurasia"}	base	20	Sadri	\N	\N	23.6585000000000001	84.8114000000000061	1
25	2013-11-19 20:49:33.04374+01	2013-12-02 09:12:54.82717+01	t	{"color": "ffffff", "genus": "Turkic", "macroarea": "Eurasia"}	base	25	Turkic	\N	\N	39.8667000000000016	32.8667000000000016	1
26	2013-11-19 20:49:33.044513+01	2013-12-02 09:12:54.831532+01	t	{"color": "ffffff", "genus": "Iranian", "macroarea": "Eurasia"}	base	26	Tajik	\N	\N	38.8213000000000008	68.5549000000000035	1
29	2013-11-19 20:49:33.046869+01	2013-12-02 09:12:54.835856+01	t	{"color": "ffffff", "genus": "Central Khoisan", "macroarea": "Africa"}	base	29	Kxoe languages	\N	\N	-16.5904999999999987	22.5997999999999983	1
30	2013-11-19 20:49:33.047714+01	2013-12-02 09:12:54.840264+01	t	{"color": "ffffff", "genus": "Central Khoisan", "macroarea": "Africa"}	base	30	Shua‑Tshwa	\N	\N	-22.0939000000000014	20.7457999999999991	1
31	2013-11-19 20:49:33.048531+01	2013-12-02 09:12:54.844625+01	t	{"color": "ffffff", "genus": "Mixe-Zoque", "macroarea": "North America"}	base	31	Zoquean languages	\N	\N	17.2156999999999982	-93.3182999999999936	1
32	2013-11-19 20:49:33.049287+01	2013-12-02 09:12:54.849082+01	t	{"color": "ffffff", "genus": "Germanic", "macroarea": "Eurasia"}	base	32	Swedish	\N	\N	59.8006340000000023	17.389526	1
36	2013-11-19 20:49:33.052833+01	2013-12-02 09:12:54.853467+01	t	{"color": "ffffff", "genus": "East Bougainville", "macroarea": "Southeast Asia & Oceania"}	base	36	Naasioi	\N	\N	-6.46021999999999963	155.632000000000005	1
38	2013-11-19 20:49:33.054483+01	2013-12-02 09:12:54.857888+01	t	{"color": "ffffff", "genus": "Berber", "macroarea": "Africa"}	base	38	Moroccan Berber languages	\N	\N	32.741500000000002	-2.40872000000000019	1
39	2013-11-19 20:49:33.055258+01	2013-12-02 09:12:54.862924+01	t	{"color": "ffffff", "genus": "Tungusic", "macroarea": "Eurasia"}	base	39	Evenki	\N	\N	53.8500000000000014	108.626000000000005	1
43	2013-11-19 20:49:33.058676+01	2013-12-02 09:12:54.867565+01	t	{"color": "ffffff", "genus": "Romance", "macroarea": "Eurasia"}	base	43	Latin	\N	\N	41.9025999999999996	12.4502000000000006	1
49	2013-11-19 20:49:33.063306+01	2013-12-02 09:12:54.871828+01	t	{"color": "ffffff", "genus": "Semitic", "macroarea": "Eurasia"}	base	49	Aramaic	\N	\N	37.3729999999999976	42.5191999999999979	1
50	2013-11-19 20:49:33.064268+01	2013-12-02 09:12:54.87604+01	t	{"color": "ffffff", "genus": "Quechuan", "macroarea": "South America"}	base	50	Quechua	\N	\N	-11.2132000000000005	-75.8127999999999957	1
159	2013-11-19 20:49:33.158417+01	2013-12-02 09:12:55.084997+01	t	{"color": "ffffff", "genus": "Siouan", "macroarea": "North America"}	base	159	Quapaw	\N	\N	36.9470999999999989	-94.6633999999999958	1
52	2013-11-19 20:49:33.066126+01	2013-12-02 09:12:54.880243+01	t	{"color": "ffffff", "genus": "Pama-Nyungan", "macroarea": "Australia & New Guinea"}	base	52	Gurindji	\N	\N	-17.0329000000000015	130.378999999999991	1
53	2013-11-19 20:49:33.067251+01	2013-12-02 09:12:54.884487+01	t	{"color": "ffffff", "genus": "Bodic", "macroarea": "Eurasia"}	base	53	Tibetan	\N	\N	28.3680999999999983	90.1872000000000043	1
56	2013-11-19 20:49:33.07004+01	2013-12-02 09:12:54.888655+01	t	{"color": "ffffff", "genus": "Iranian", "macroarea": "Eurasia"}	base	56	Makrān Baluchi	\N	\N	28	62	1
59	2013-11-19 20:49:33.072881+01	2013-12-02 09:12:54.89283+01	t	{"color": "ffffff", "genus": "Turkic", "macroarea": "Eurasia"}	base	59	Uzbek	\N	\N	43.748899999999999	59.2310000000000016	1
61	2013-11-19 20:49:33.074656+01	2013-12-02 09:12:54.897009+01	t	{"color": "ffffff", "genus": "Semitic", "macroarea": "Africa"}	base	61	Tigre	\N	\N	17.3493999999999993	38.2233000000000018	1
62	2013-11-19 20:49:33.075443+01	2013-12-02 09:12:54.901502+01	t	{"color": "ffffff", "genus": "Greek", "macroarea": "Eurasia"}	base	62	Greek	\N	\N	42.3224000000000018	24.8699000000000012	1
63	2013-11-19 20:49:33.076215+01	2013-12-02 09:12:54.906419+01	t	{"color": "ffffff", "genus": "Baltic", "macroarea": "Eurasia"}	base	63	Latvian	\N	\N	56.1424000000000021	18.1685000000000016	1
64	2013-11-19 20:49:33.077011+01	2013-12-02 09:12:54.910996+01	t	{"color": "ffffff", "genus": "Germanic", "macroarea": "Southeast Asia & Oceania"}	base	64	English	\N	\N	52	0	1
65	2013-11-19 20:49:33.077877+01	2013-12-02 09:12:54.915442+01	t	{"color": "ffffff", "genus": "Romance", "macroarea": "Eurasia"}	base	65	Sicilian Italian	\N	\N	43.0463999999999984	12.6488999999999994	1
66	2013-11-19 20:49:33.078728+01	2013-12-02 09:12:54.919708+01	t	{"color": "ffffff", "genus": "Iranian", "macroarea": "Eurasia"}	base	66	Farsi	\N	\N	28.6593000000000018	55.1585999999999999	1
67	2013-11-19 20:49:33.079686+01	2013-12-02 09:12:54.923882+01	t	{"color": "ffffff", "genus": "Slavic", "macroarea": "Eurasia"}	base	67	Croatian	\N	\N	44.3237999999999985	21.9192	1
69	2013-11-19 20:49:33.081576+01	2013-12-02 09:12:54.928121+01	t	{"color": "ffffff", "genus": "Chinese", "macroarea": "Eurasia"}	base	69	Chinese	\N	\N	40.0208999999999975	116.227999999999994	1
75	2013-11-19 20:49:33.087007+01	2013-12-02 09:12:54.93236+01	t	{"color": "ffffff", "genus": "Cariban", "macroarea": "South America"}	base	75	intermediate Proto‑Carib	\N	\N	5.83772000000000002	-56.8322999999999965	1
76	2013-11-19 20:49:33.087922+01	2013-12-02 09:12:54.936529+01	t	{"color": "ffffff", "genus": "Semitic", "macroarea": "Eurasia"}	base	76	Arabic	\N	\N	34	-6	1
78	2013-11-19 20:49:33.089807+01	2013-12-02 09:12:54.94072+01	t	{"color": "ffffff", "genus": "Bantoid", "macroarea": "Southeast Asia & Oceania"}	base	78	Swahili	\N	\N	-8.25605000000000011	37.6240000000000023	1
79	2013-11-19 20:49:33.090723+01	2013-12-02 09:12:54.945541+01	t	{"color": "ffffff", "genus": "Cariban", "macroarea": "South America"}	base	79	Carib	\N	\N	5.83772000000000002	-56.8322999999999965	1
88	2013-11-19 20:49:33.098396+01	2013-12-02 09:12:54.949813+01	t	{"color": "ffffff", "genus": "Semitic", "macroarea": "Eurasia"}	base	88	Akkadian	\N	\N	\N	\N	1
89	2013-11-19 20:49:33.099349+01	2013-12-02 09:12:54.954222+01	t	{"color": "ffffff", "genus": "Indic", "macroarea": "Eurasia"}	base	89	Hindi	\N	\N	25	77	1
93	2013-11-19 20:49:33.102647+01	2013-12-02 09:12:54.958472+01	t	{"color": "ffffff", "genus": "Turkic", "macroarea": "Eurasia"}	base	93	Chuvash	\N	\N	55.4870000000000019	47.1629999999999967	1
97	2013-11-19 20:49:33.105747+01	2013-12-02 09:12:54.962966+01	t	{"color": "ffffff", "genus": "Pama-Nyungan", "macroarea": "Australia & New Guinea"}	base	97	Northern Nyungic	\N	\N	-33.1199000000000012	118.150999999999996	1
98	2013-11-19 20:49:33.106491+01	2013-12-02 09:12:54.967291+01	t	{"color": "ffffff", "genus": "Malayic", "macroarea": "Southeast Asia & Oceania"}	base	98	Malay	\N	\N	1.85855999999999999	103	1
101	2013-11-19 20:49:33.10906+01	2013-12-02 09:12:54.971584+01	t	{"color": "ffffff", "genus": "Garrwan", "macroarea": "Australia & New Guinea"}	base	101	Karrwa	\N	\N	-17.4503999999999984	137.719999999999999	1
102	2013-11-19 20:49:33.10988+01	2013-12-02 09:12:54.975842+01	t	{"color": "ffffff", "genus": "Slavic", "macroarea": "Eurasia"}	base	102	Russian	\N	\N	53.9194999999999993	72.3926000000000016	1
103	2013-11-19 20:49:33.11066+01	2013-12-02 09:12:54.980107+01	t	{"color": "ffffff", "genus": "Slavic", "macroarea": "Eurasia"}	base	103	Bosnian/Croatian/Serbian	\N	\N	44.3237999999999985	21.9192	1
108	2013-11-19 20:49:33.114731+01	2013-12-02 09:12:54.984324+01	t	{"color": "ffffff", "genus": "Northern Chukotko-Kamchatkan", "macroarea": "North America"}	base	108	Chukchi	\N	\N	68.6436000000000064	170.044999999999987	1
109	2013-11-19 20:49:33.115683+01	2013-12-02 09:12:54.989146+01	t	{"color": "ffffff", "genus": "Semitic", "macroarea": "Africa"}	base	109	Libyan Arabic	\N	\N	22.0031999999999996	15.0014000000000003	1
116	2013-11-19 20:49:33.121898+01	2013-12-02 09:12:54.993375+01	t	{"color": "ffffff", "genus": "Southern Dravidian", "macroarea": "Eurasia"}	base	116	Tamil	\N	\N	9	80.5	1
117	2013-11-19 20:49:33.122821+01	2013-12-02 09:12:54.997626+01	t	{"color": "ffffff", "genus": "Finnic", "macroarea": "Eurasia"}	base	117	Komi‑Zyrian	\N	\N	64.0527000000000015	54.945999999999998	1
119	2013-11-19 20:49:33.12469+01	2013-12-02 09:12:55.001829+01	t	{"color": "ffffff", "genus": "Iranian", "macroarea": "Eurasia"}	base	119	Persian	\N	\N	28.6593000000000018	55.1585999999999999	1
120	2013-11-19 20:49:33.125534+01	2013-12-02 09:12:55.006004+01	t	{"color": "ffffff", "genus": "Mongolic", "macroarea": "Eurasia"}	base	120	Mongolian	\N	\N	48.3239999999999981	106.289000000000001	1
122	2013-11-19 20:49:33.127118+01	2013-12-02 09:12:55.010225+01	t	{"color": "ffffff", "genus": "Aymaran", "macroarea": "South America"}	base	122	Aymara	\N	\N	-17	-68.5	1
123	2013-11-19 20:49:33.127899+01	2013-12-02 09:12:55.014832+01	t	{"color": "ffffff", "genus": "Bantoid", "macroarea": "Africa"}	base	123	North Swahili	\N	\N	-8.25605000000000011	37.6240000000000023	1
125	2013-11-19 20:49:33.129445+01	2013-12-02 09:12:55.019383+01	t	{"color": "ffffff", "genus": "Romance", "macroarea": "Eurasia"}	base	125	Romanian	\N	\N	46.3913000000000011	24.2256	1
126	2013-11-19 20:49:33.130217+01	2013-12-02 09:12:55.023655+01	t	{"color": "ffffff", "genus": "Bantoid", "macroarea": "Africa"}	base	126	Lingala	\N	\N	1.40324000000000004	19.7829000000000015	1
130	2013-11-19 20:49:33.133762+01	2013-12-02 09:12:55.02854+01	t	{"color": "ffffff", "genus": "Northern Philippines", "macroarea": "Southeast Asia & Oceania"}	base	130	Ilokano	\N	\N	15.9360999999999997	120.992999999999995	1
131	2013-11-19 20:49:33.134689+01	2013-12-02 09:12:55.032871+01	t	{"color": "ffffff", "genus": "Germanic", "macroarea": "Southeast Asia & Oceania"}	base	131	Dutch	\N	\N	52	5	1
132	2013-11-19 20:49:33.135605+01	2013-12-02 09:12:55.037184+01	t	{"color": "ffffff", "genus": "Indic", "macroarea": "Southeast Asia & Oceania"}	base	132	Sanskrit	\N	\N	20	77	1
138	2013-11-19 20:49:33.14088+01	2013-12-02 09:12:55.041515+01	t	{"color": "ffffff", "genus": "Tucanoan", "macroarea": "North America"}	base	138	Eastern Tucanoan languages	\N	\N	0.57975500000000002	-69.5763000000000034	1
139	2013-11-19 20:49:33.141812+01	2013-12-02 09:12:55.045779+01	t	{"color": "ffffff", "genus": "Meso-Philippine", "macroarea": "Southeast Asia & Oceania"}	base	139	Visayan	\N	\N	8.38799000000000028	124.367000000000004	1
140	2013-11-19 20:49:33.142647+01	2013-12-02 09:12:55.049993+01	t	{"color": "ffffff", "genus": "Nunggubuyu", "macroarea": "Australia & New Guinea"}	base	140	Nunggubuyu	\N	\N	-14.2622999999999998	135.752999999999986	1
143	2013-11-19 20:49:33.145102+01	2013-12-02 09:12:55.054157+01	t	{"color": "ffffff", "genus": "Iranian", "macroarea": "Eurasia"}	base	143	Kurdish	\N	\N	37	43	1
145	2013-11-19 20:49:33.14668+01	2013-12-02 09:12:55.058318+01	t	{"color": "ffffff", "genus": "Lower Mamberano", "macroarea": "Southeast Asia & Oceania"}	base	145	Warembori	\N	\N	-1.65941000000000005	137.566000000000003	1
148	2013-11-19 20:49:33.149144+01	2013-12-02 09:12:55.062636+01	t	{"color": "ffffff", "genus": "Arawakan", "macroarea": "South America"}	base	148	Yucuna and Cabiyarí	\N	\N	-0.760750000000000037	-71.0032999999999959	1
151	2013-11-19 20:49:33.151868+01	2013-12-02 09:12:55.06686+01	t	{"color": "ffffff", "genus": "Romance", "macroarea": "Southeast Asia & Oceania"}	base	151	Portuguese	\N	\N	42.0341000000000022	-4.18815000000000026	1
155	2013-11-19 20:49:33.155269+01	2013-12-02 09:12:55.072131+01	t	{"color": "ffffff", "genus": "Boran", "macroarea": "South America"}	base	155	Bora	\N	\N	-2.91467000000000009	-68.9093000000000018	1
128	2013-11-19 20:49:33.131846+01	2013-11-19 20:49:43.468434+01	t	{"color": "8b4512", "genus": "Arawakan", "macroarea": "South America"}	base	128	Resígaro	\N	\N	-2.41999999999999993	-71.5	1
54	2013-11-19 20:49:33.068088+01	2013-11-19 20:49:43.472259+01	t	{"color": "8b4512", "genus": "English-based", "macroarea": "Australia & New Guinea"}	base	54	Gurindji Kriol	\N	\N	-14.8300000000000001	135	1
73	2013-11-19 20:49:33.085184+01	2013-11-19 20:49:43.476369+01	t	{"color": "8b4512", "genus": "Aleut", "macroarea": "Eurasia"}	base	73	Copper Island Aleut	\N	\N	55	166.159999999999997	1
46	2013-11-19 20:49:33.061037+01	2013-11-19 20:49:43.481039+01	t	{"color": "8b4512", "genus": "Turkic", "macroarea": "Eurasia"}	base	46	Sakha	\N	\N	62	130	1
13	2013-11-19 20:49:33.032459+01	2013-11-19 20:49:43.4835+01	t	{"color": "8b4512", "genus": "Indic", "macroarea": "Eurasia"}	base	13	Kalderash Romani	\N	\N	45.3999999999999986	20.1799999999999997	1
153	2013-11-19 20:49:33.153488+01	2013-11-19 20:49:43.486472+01	t	{"color": "8b4512", "genus": "Tungusic", "macroarea": "Eurasia"}	base	153	Sebjan‑Küöl Ėven	\N	\N	66.4166666666666714	128.416666666666657	1
135	2013-11-19 20:49:33.138033+01	2013-11-19 20:49:43.490947+01	t	{"color": "8b4512", "genus": "Iranian", "macroarea": "Eurasia"}	base	135	Northern Tajik	\N	\N	38.3999999999999986	70	1
42	2013-11-19 20:49:33.057826+01	2013-11-19 20:49:43.499478+01	t	{"color": "8b4512", "genus": "Malayic", "macroarea": "Southeast Asia & Oceania"}	base	42	Indonesian	\N	\N	-6.16999999999999993	106.75	1
21	2013-11-19 20:49:33.040223+01	2013-11-19 20:49:43.505051+01	t	{"color": "cd661c", "genus": "Tungusic", "macroarea": "Eurasia"}	base	21	Uchur Ėvenki	\N	\N	56	125	1
83	2013-11-19 20:49:33.093983+01	2013-11-19 20:49:43.510252+01	t	{"color": "cd661c", "genus": "Germanic", "macroarea": "Eurasia"}	base	83	Middle English	\N	\N	51.5071999999999974	-0.127500000000000002	1
23	2013-11-19 20:49:33.042135+01	2013-11-19 20:49:43.515732+01	t	{"color": "cd661c", "genus": "Spanish-based", "macroarea": "Southeast Asia & Oceania"}	base	23	Chabacano	\N	\N	7	122.079999999999998	1
35	2013-11-19 20:49:33.051938+01	2013-11-19 20:49:43.518561+01	t	{"color": "8b4512", "genus": "Finnic", "macroarea": "Eurasia"}	base	35	Mari	\N	\N	57	48	1
51	2013-11-19 20:49:33.065196+01	2013-11-19 20:49:43.520696+01	t	{"color": "cd661c", "genus": "Central Cushitic", "macroarea": "Africa"}	base	51	Bilin	\N	\N	15.75	38.5	1
18	2013-11-19 20:49:33.037342+01	2013-11-19 20:49:43.522951+01	t	{"color": "8b4512", "genus": "Albanian", "macroarea": "Eurasia"}	base	18	Albanian	\N	\N	41.3299999999999983	20.8299999999999983	1
33	2013-11-19 20:49:33.050019+01	2013-11-19 20:49:43.528294+01	t	{"color": "cd661c", "genus": "Quechuan", "macroarea": "South America"}	base	33	Cajamarca Quechua	\N	\N	-7	-78.5	1
147	2013-11-19 20:49:33.148277+01	2013-11-19 20:49:43.533217+01	t	{"color": "cd661c", "genus": "Uru-Chipaya", "macroarea": "South America"}	base	147	Uru	\N	\N	-16.75	-69	1
104	2013-11-19 20:49:33.111496+01	2013-11-19 20:49:43.538098+01	t	{"color": "cd661c", "genus": "Semitic", "macroarea": "Eurasia"}	base	104	Israeli Hebrew	\N	\N	31.5	34.8299999999999983	1
5	2013-11-19 20:49:33.025849+01	2013-11-19 20:49:43.543018+01	t	{"color": "ee7620", "genus": "Bodic", "macroarea": "Eurasia"}	base	5	Chantyal	\N	\N	28.5799999999999983	83.4200000000000017	1
80	2013-11-19 20:49:33.091571+01	2013-11-19 20:49:43.54783+01	t	{"color": "cd661c", "genus": "Greek", "macroarea": "Eurasia"}	base	80	Cappadocian Greek	\N	\N	38.3900000000000006	34.509999999999998	1
77	2013-11-19 20:49:33.08891+01	2013-11-19 20:49:43.55107+01	t	{"color": "cd661c", "genus": "Semitic", "macroarea": "Eurasia"}	base	77	Kormakiti	\N	\N	35.25	33.5	1
12	2013-11-19 20:49:33.031481+01	2013-11-19 20:49:43.553743+01	t	{"color": "cd661c", "genus": "Berber", "macroarea": "Africa"}	base	12	Siwi	\N	\N	29.1700000000000017	25.5	1
19	2013-11-19 20:49:33.03835+01	2013-11-19 20:49:43.556558+01	t	{"color": "cd661c", "genus": "Maran", "macroarea": "Australia & New Guinea"}	base	19	Warndarang	\N	\N	-14.4199999999999999	135.580000000000013	1
133	2013-11-19 20:49:33.136436+01	2013-11-19 20:49:43.560312+01	t	{"color": "ee7620", "genus": "Arawakan", "macroarea": "South America"}	base	133	Garifuna	\N	\N	15.6699999999999999	-88	1
17	2013-11-19 20:49:33.036305+01	2013-11-19 20:49:43.562965+01	t	{"color": "ee7620", "genus": "Pama-Nyungan", "macroarea": "Australia & New Guinea"}	base	17	Ritharngu	\N	\N	-12.8300000000000001	135.5	1
110	2013-11-19 20:49:33.116538+01	2013-11-19 20:49:43.566278+01	t	{"color": "ee7620", "genus": "Northern Philippines", "macroarea": "Southeast Asia & Oceania"}	base	110	Guina‑ang Bontok	\N	\N	17.0799999999999983	120.920000000000002	1
90	2013-11-19 20:49:33.100193+01	2013-11-19 20:49:43.56975+01	t	{"color": "cd661c", "genus": "Turkic", "macroarea": "Eurasia"}	base	90	Sonqor Turkic	\N	\N	34.7836111111111137	47.6002777777777766	1
150	2013-11-19 20:49:33.151021+01	2013-11-19 20:49:43.575221+01	t	{"color": "ee7620", "genus": "Ngandi", "macroarea": "Australia & New Guinea"}	base	150	Ngandi	\N	\N	-13.8300000000000001	135	1
41	2013-11-19 20:49:33.056985+01	2013-11-19 20:49:43.580848+01	t	{"color": "ee7620", "genus": "Central Khoisan", "macroarea": "Africa"}	base	41	Danisi	\N	\N	-22.5	20.5	1
129	2013-11-19 20:49:33.132821+01	2013-11-19 20:49:43.587343+01	t	{"color": "cd661c", "genus": "Romance", "macroarea": "Eurasia"}	base	129	Istro‑Romanian	\N	\N	45.2100000000000009	14.1099999999999994	1
68	2013-11-19 20:49:33.080627+01	2013-11-19 20:49:43.590558+01	t	{"color": "cd661c", "genus": "Chinese-based", "macroarea": "Eurasia"}	base	68	Wutun	\N	\N	35.6499999999999986	102.219999999999999	1
105	2013-11-19 20:49:33.112268+01	2013-11-19 20:49:43.592874+01	t	{"color": "ff7f24", "genus": "Muskogean", "macroarea": "North America"}	base	105	Koasati	\N	\N	34.8299999999999983	-85.1700000000000017	1
96	2013-11-19 20:49:33.105005+01	2013-11-19 20:49:43.595128+01	t	{"color": "ee7620", "genus": "Semitic", "macroarea": "Eurasia"}	base	96	Hasankeyf Arabic	\N	\N	37.7141083333333356	41.4131666666666689	1
154	2013-11-19 20:49:33.154465+01	2013-11-19 20:49:43.59749+01	t	{"color": "ee7620", "genus": "Romance", "macroarea": "Eurasia"}	base	154	Sri Lanka Portuguese	\N	\N	6.54000000000000004	79.5	1
124	2013-11-19 20:49:33.128677+01	2013-11-19 20:49:43.59983+01	t	{"color": "ff7f24", "genus": "Taustralia & New Guineakic", "macroarea": "Australia & New Guinea"}	base	124	Kayardild	\N	\N	-17.0500000000000007	139.5	1
91	2013-11-19 20:49:33.101034+01	2013-11-19 20:49:43.602173+01	t	{"color": "ff7f24", "genus": "Sumerian", "macroarea": "Eurasia"}	base	91	Sumerian	\N	\N	31.3200000000000003	45.9500000000000028	1
74	2013-11-19 20:49:33.086104+01	2013-11-19 20:49:43.604714+01	t	{"color": "ff7f24", "genus": "Oceanic", "macroarea": "Southeast Asia & Oceania"}	base	74	Torau	\N	\N	-6.16999999999999993	155.5	1
141	2013-11-19 20:49:33.143517+01	2013-11-19 20:49:43.607044+01	t	{"color": "ee7620", "genus": "Semitic", "macroarea": "Eurasia"}	base	141	Maltese	\N	\N	35.9200000000000017	14.4199999999999999	1
6	2013-11-19 20:49:33.026678+01	2013-11-19 20:49:43.611454+01	t	{"color": "ee7620", "genus": "Munda", "macroarea": "Eurasia"}	base	6	Kharia	\N	\N	22.5	84.3299999999999983	1
107	2013-11-19 20:49:33.113847+01	2013-11-19 20:49:43.614144+01	t	{"color": "ee7620", "genus": "Finnic", "macroarea": "Eurasia"}	base	107	Ingrian Finnish	\N	\N	59.9166666666666643	29.7666666666666657	1
156	2013-11-19 20:49:33.156082+01	2013-12-02 09:12:55.076519+01	t	{"color": "ffffff", "genus": "Romance", "macroarea": "North America"}	base	156	Spanish	\N	\N	40.4414000000000016	-1.11787999999999998	1
157	2013-11-19 20:49:33.156881+01	2013-12-02 09:12:55.080836+01	t	{"color": "ffffff", "genus": "Baric", "macroarea": "Eurasia"}	base	157	Tibeto-Burman languages	\N	\N	26.7255000000000003	89.333200000000005	1
92	2013-11-19 20:49:33.101837+01	2013-11-19 20:49:43.616371+01	t	{"color": "ee7620", "genus": "Barito", "macroarea": "Southeast Asia & Oceania"}	base	92	Malagasy	\N	\N	-20.5199999999999996	47.25	1
71	2013-11-19 20:49:33.083356+01	2013-11-19 20:49:43.618443+01	t	{"color": "ff7f24", "genus": "Tupi-Guarani", "macroarea": "South America"}	base	71	Wayampi‑Emerillon‑Zo’é	\N	\N	3.25	-52.3299999999999983	1
45	2013-11-19 20:49:33.060225+01	2013-11-19 20:49:43.620459+01	t	{"color": "ff7f24", "genus": "Oceanic", "macroarea": "Southeast Asia & Oceania"}	base	45	Hawaiian	\N	\N	19.5799999999999983	-155.5	1
48	2013-11-19 20:49:33.062554+01	2013-11-19 20:49:43.62291+01	t	{"color": "cd661c", "genus": "Finnic", "macroarea": "Eurasia"}	base	48	Kola Saami	\N	\N	67	37	1
84	2013-11-19 20:49:33.094876+01	2013-11-19 20:49:43.625359+01	t	{"color": "ff7f24", "genus": "Iranian", "macroarea": "Eurasia"}	base	84	Western Kurmanji	\N	\N	38.8333333333333357	43.8333333333333357	1
40	2013-11-19 20:49:33.056062+01	2013-11-19 20:49:43.627855+01	t	{"color": "ff7f24", "genus": "Bodic", "macroarea": "Eurasia"}	base	40	Manange	\N	\N	28.3999999999999986	84.0100000000000051	1
27	2013-11-19 20:49:33.045293+01	2013-11-19 20:49:43.630565+01	t	{"color": "8b4512", "genus": "Germanic", "macroarea": "Eurasia"}	base	27	Yiddish	\N	\N	52	23	1
7	2013-11-19 20:49:33.027442+01	2013-11-19 20:49:43.635496+01	t	{"color": "8b4512", "genus": "Romance", "macroarea": "Eurasia"}	base	7	Megleno Romanian	\N	\N	40.5799999999999983	22.3000000000000007	1
87	2013-11-19 20:49:33.097532+01	2013-11-19 20:49:43.640349+01	t	{"color": "8b4512", "genus": "Albanian", "macroarea": "Eurasia"}	base	87	Arvanitic Albanian	\N	\N	37.5799999999999983	23.4299999999999997	1
57	2013-11-19 20:49:33.070979+01	2013-11-19 20:49:43.645061+01	t	{"color": "ff7f24", "genus": "Tetun-based", "macroarea": "Southeast Asia & Oceania"}	base	57	Tetun Dili	\N	\N	-8.58000000000000007	125.700000000000003	1
55	2013-11-19 20:49:33.069077+01	2013-11-19 20:49:43.650733+01	t	{"color": "cd661c", "genus": "Indic", "macroarea": "Eurasia"}	base	55	Lithuanian Romani	\N	\N	56.2299999999999969	24.0300000000000011	1
70	2013-11-19 20:49:33.082459+01	2013-11-19 20:49:43.655875+01	t	{"color": "ff7f24", "genus": "Mixe-Zoque", "macroarea": "South America"}	base	70	Sierra Popoluca	\N	\N	18.3299999999999983	-95.1700000000000017	1
37	2013-11-19 20:49:33.053669+01	2013-11-19 20:49:43.661068+01	t	{"color": "ee7620", "genus": "Northern Dravidian", "macroarea": "Eurasia"}	base	37	Brahui	\N	\N	28.5	67	1
28	2013-11-19 20:49:33.046025+01	2013-11-19 20:49:43.666038+01	t	{"color": "cd661c", "genus": "Aslian", "macroarea": "Southeast Asia & Oceania"}	base	28	Semelai	\N	\N	3	103	1
149	2013-11-19 20:49:33.150078+01	2013-11-19 20:49:43.671171+01	t	{"color": "ff7f24", "genus": "Sulawesi", "macroarea": "Southeast Asia & Oceania"}	base	149	Tukang Besi	\N	\N	-5.5	123.5	1
60	2013-11-19 20:49:33.073806+01	2013-11-19 20:49:43.676258+01	t	{"color": "ff7f24", "genus": "Tarascan", "macroarea": "North America"}	base	60	Purepecha/Tarascan	\N	\N	19.5	-101.75	1
2	2013-11-19 20:49:33.023587+01	2013-11-19 20:49:43.681308+01	t	{"color": "ee7620", "genus": "Kwerba", "macroarea": "Southeast Asia & Oceania"}	base	2	Kwerba Kasonaweja	\N	\N	-2.25	138.5	1
113	2013-11-19 20:49:33.119114+01	2013-11-19 20:49:43.686929+01	t	{"color": "ee7620", "genus": "Lezgic", "macroarea": "Eurasia"}	base	113	Lezgian	\N	\N	41.6700000000000017	47.8299999999999983	1
47	2013-11-19 20:49:33.061792+01	2013-11-19 20:49:43.692016+01	t	{"color": "ff7f24", "genus": "Central Khoisan", "macroarea": "Africa"}	base	47	G|ui‑Gǁana	\N	\N	-22.6700000000000017	21.75	1
11	2013-11-19 20:49:33.030668+01	2013-11-19 20:49:43.697104+01	t	{"color": "ee7620", "genus": "Eskimo", "macroarea": "North America"}	base	11	Central Siberian Yupik Eskimo	\N	\N	63.5	-170.5	1
134	2013-11-19 20:49:33.137255+01	2013-11-19 20:49:43.702528+01	t	{"color": "cd661c", "genus": "Northern Dravidian", "macroarea": "Eurasia"}	base	134	Kurux	\N	\N	22.8299999999999983	85.5	1
81	2013-11-19 20:49:33.092348+01	2013-11-19 20:49:43.707641+01	t	{"color": "cd661c", "genus": "Turkic", "macroarea": "Eurasia"}	base	81	Turkish	\N	\N	39	35	1
118	2013-11-19 20:49:33.123742+01	2013-11-19 20:49:43.713068+01	t	{"color": "8b4512", "genus": "Turkic", "macroarea": "Eurasia"}	base	118	Azari	\N	\N	37.5	47	1
106	2013-11-19 20:49:33.113068+01	2013-11-19 20:49:43.718713+01	t	{"color": "8b4512", "genus": "Indic", "macroarea": "Eurasia"}	base	106	Kashmiri	\N	\N	34	76	1
137	2013-11-19 20:49:33.13985+01	2013-11-19 20:49:43.722594+01	t	{"color": "8b4512", "genus": "Ugric", "macroarea": "Eurasia"}	base	137	Khanty	\N	\N	65	65	1
16	2013-11-19 20:49:33.035305+01	2013-11-19 20:49:43.725099+01	t	{"color": "ee7620", "genus": "Finnic", "macroarea": "Eurasia"}	base	16	Finnish	\N	\N	62	25	1
112	2013-11-19 20:49:33.118268+01	2013-11-19 20:49:43.727437+01	t	{"color": "ff7f24", "genus": "Tucanoan", "macroarea": "South America"}	base	112	Carapana, Tatuyo, Wáimaja, and Yurutí	\N	\N	0.92000000000000004	-71.4200000000000017	1
121	2013-11-19 20:49:33.126341+01	2013-11-19 20:49:43.729972+01	t	{"color": "8b4512", "genus": "Basque", "macroarea": "Eurasia"}	base	121	Basque	\N	\N	43	-3	1
152	2013-11-19 20:49:33.152692+01	2013-11-19 20:49:43.732286+01	t	{"color": "ff7f24", "genus": "Semitic", "macroarea": "Africa"}	base	152	Moroccan Arabic	\N	\N	34.0333333333333314	-6.83333333333333304	1
100	2013-11-19 20:49:33.108128+01	2013-11-19 20:49:43.734629+01	t	{"color": "cd661c", "genus": "Quechuan", "macroarea": "South America"}	base	100	Quechua de Puno	\N	\N	-15.75	-70.1299999999999955	1
146	2013-11-19 20:49:33.14749+01	2013-11-19 20:49:43.73696+01	t	{"color": "ff7f24", "genus": "Chinese", "macroarea": "Eurasia"}	base	146	Chinese of Línxìa/Hézōu	\N	\N	35.6000000000000014	103.216666666666669	1
95	2013-11-19 20:49:33.104249+01	2013-11-19 20:49:43.739544+01	t	{"color": "cd661c", "genus": "Romance", "macroarea": "Eurasia"}	base	95	Judeo‑Spanish	\N	\N	41.0136111111111106	28.9549999999999983	1
99	2013-11-19 20:49:33.107346+01	2013-11-19 20:49:43.741905+01	t	{"color": "cd661c", "genus": "Finnic", "macroarea": "Eurasia"}	base	99	Karelien	\N	\N	64	32	1
58	2013-11-19 20:49:33.071922+01	2013-11-19 20:49:43.744288+01	t	{"color": "ee7620", "genus": "Arawakan", "macroarea": "North America"}	base	58	Tariana	\N	\N	1	-69.1700000000000017	1
136	2013-11-19 20:49:33.138914+01	2013-11-19 20:49:43.746747+01	t	{"color": "ee7620", "genus": "Mayan", "macroarea": "North America"}	base	136	Cho’ol	\N	\N	17.3000000000000007	-92.4333333333333371	1
111	2013-11-19 20:49:33.11744+01	2013-11-19 20:49:43.749062+01	t	{"color": "ff7f24", "genus": "Semitic", "macroarea": "Eurasia"}	base	111	Western Neo‑Aramaic of Ma’lūla	\N	\N	33.8441666666666663	36.5466666666666669	1
142	2013-11-19 20:49:33.144318+01	2013-11-19 20:49:43.751715+01	t	{"color": "8b4512", "genus": "Indic", "macroarea": "Eurasia"}	base	142	Assamese	\N	\N	26	93	1
22	2013-11-19 20:49:33.041217+01	2013-11-19 20:49:43.754442+01	t	{"color": "ff7f24", "genus": "Aztecan", "macroarea": "North America"}	base	22	Mexicanero de la Sierra Madre Occidental	\N	\N	24.9347222222222236	-104.911944444444444	1
158	2013-11-19 20:49:33.157658+01	2013-11-19 20:49:43.75726+01	t	{"color": "ff7f24", "genus": "Mayan", "macroarea": "North America"}	base	158	Yucatec Maya	\N	\N	20	-89	1
85	2013-11-19 20:49:33.095767+01	2013-11-19 20:49:43.760075+01	t	{"color": "ff7f24", "genus": "Central Malayo-Polynesian", "macroarea": "Southeast Asia & Oceania"}	base	85	Kedang	\N	\N	-8.25	123.75	1
3	2013-11-19 20:49:33.024401+01	2013-11-19 20:49:43.762921+01	t	{"color": "ee7620", "genus": "Semitic", "macroarea": "Eurasia"}	base	3	Iraqi Arabic	\N	\N	33	44	1
86	2013-11-19 20:49:33.096673+01	2013-11-19 20:49:43.765733+01	t	{"color": "ff7f24", "genus": "Muskogean", "macroarea": "North America"}	base	86	Alabama and Choctaw‑Chickasaw	\N	\N	35.2388888888888872	-96.2397222222222268	1
115	2013-11-19 20:49:33.12097+01	2013-11-19 20:49:43.768537+01	t	{"color": "ff7f24", "genus": "Germanic", "macroarea": "Eurasia"}	base	115	German	\N	\N	56.948888888888888	24.1063888888888904	1
72	2013-11-19 20:49:33.084266+01	2013-11-19 20:49:43.771406+01	t	{"color": "ee7620", "genus": "Arawakan", "macroarea": "South America"}	base	72	Amuesha	\N	\N	-10.5	-75.4200000000000017	1
8	2013-11-19 20:49:33.028228+01	2013-11-19 20:49:43.774584+01	t	{"color": "cd661c", "genus": "Mongolic", "macroarea": "Eurasia"}	base	8	Moghol	\N	\N	35	62	1
82	2013-11-19 20:49:33.093143+01	2013-11-19 20:49:43.778285+01	t	{"color": "ee7620", "genus": "Mongolic", "macroarea": "Eurasia"}	base	82	Dagur	\N	\N	48	124	1
94	2013-11-19 20:49:33.103461+01	2013-11-19 20:49:43.781885+01	t	{"color": "ff7f24", "genus": "Ugric", "macroarea": "Eurasia"}	base	94	Hungarian	\N	\N	45.825277777777778	17.8222222222222229	1
24	2013-11-19 20:49:33.04296+01	2013-11-19 20:49:43.785692+01	t	{"color": "cd661c", "genus": "Mongolic", "macroarea": "Eurasia"}	base	24	Santa	\N	\N	31.5	107.5	1
34	2013-11-19 20:49:33.050977+01	2013-11-19 20:49:43.789411+01	t	{"color": "cd661c", "genus": "Mongolic", "macroarea": "Eurasia"}	base	34	Middle Mongolic	\N	\N	46	105	1
44	2013-11-19 20:49:33.059457+01	2013-11-19 20:49:43.793176+01	t	{"color": "ee7620", "genus": "Ubangi", "macroarea": "Africa"}	base	44	Ndunga-le	\N	\N	2.25	21.5	1
114	2013-11-19 20:49:33.120024+01	2013-11-19 20:49:43.797074+01	t	{"color": "ee7620", "genus": "Bantoid", "macroarea": "Africa"}	base	114	Ilwana	\N	\N	-0.456944444444444486	39.6583333333333314	1
127	2013-11-19 20:49:33.13097+01	2013-11-19 20:49:43.800969+01	t	{"color": "ee7620", "genus": "Bantoid", "macroarea": "Africa"}	base	127	South Swahili	\N	\N	-4.01999999999999957	39.4299999999999997	1
144	2013-11-19 20:49:33.145882+01	2013-11-19 20:49:43.807335+01	t	{"color": "ee7620", "genus": "Aztecan", "macroarea": "North America"}	base	144	Central Mexicano Nahuatl	\N	\N	18.7474999999999987	-99.0702777777777754	1
\.


--
-- Data for Name: language_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY language_data (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Data for Name: language_data_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY language_data_history (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Name: language_data_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('language_data_history_pk_seq', 1, false);


--
-- Name: language_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('language_data_pk_seq', 1, false);


--
-- Data for Name: language_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY language_files (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Data for Name: language_files_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY language_files_history (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Name: language_files_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('language_files_history_pk_seq', 1, false);


--
-- Name: language_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('language_files_pk_seq', 1, false);


--
-- Data for Name: language_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY language_history (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, latitude, longitude, version) FROM stdin;
\.


--
-- Name: language_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('language_history_pk_seq', 1, false);


--
-- Name: language_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('language_pk_seq', 159, true);


--
-- Data for Name: languageidentifier; Type: TABLE DATA; Schema: public; Owner: -
--

COPY languageidentifier (pk, created, updated, active, jsondata, language_pk, identifier_pk, description, version) FROM stdin;
1	2013-11-19 20:49:33.493995+01	2013-11-19 20:49:33.494009+01	t	\N	1	1	\N	1
2	2013-11-19 20:49:33.496231+01	2013-11-19 20:49:33.496242+01	t	\N	2	2	\N	1
3	2013-11-19 20:49:33.497242+01	2013-11-19 20:49:33.497253+01	t	\N	2	3	\N	1
4	2013-11-19 20:49:33.498177+01	2013-11-19 20:49:33.498188+01	t	\N	3	4	\N	1
5	2013-11-19 20:49:33.499035+01	2013-11-19 20:49:33.499044+01	t	\N	3	5	\N	1
6	2013-11-19 20:49:33.499862+01	2013-11-19 20:49:33.49987+01	t	\N	4	6	\N	1
7	2013-11-19 20:49:33.500716+01	2013-11-19 20:49:33.500725+01	t	\N	4	7	\N	1
8	2013-11-19 20:49:33.501529+01	2013-11-19 20:49:33.501537+01	t	\N	5	8	\N	1
9	2013-11-19 20:49:33.502404+01	2013-11-19 20:49:33.502416+01	t	\N	5	9	\N	1
10	2013-11-19 20:49:33.503246+01	2013-11-19 20:49:33.503254+01	t	\N	6	10	\N	1
11	2013-11-19 20:49:33.504008+01	2013-11-19 20:49:33.504017+01	t	\N	6	11	\N	1
12	2013-11-19 20:49:33.504794+01	2013-11-19 20:49:33.504803+01	t	\N	7	12	\N	1
13	2013-11-19 20:49:33.505546+01	2013-11-19 20:49:33.505554+01	t	\N	7	13	\N	1
14	2013-11-19 20:49:33.506292+01	2013-11-19 20:49:33.506301+01	t	\N	8	14	\N	1
15	2013-11-19 20:49:33.507102+01	2013-11-19 20:49:33.50711+01	t	\N	8	15	\N	1
16	2013-11-19 20:49:33.507997+01	2013-11-19 20:49:33.508008+01	t	\N	9	16	\N	1
17	2013-11-19 20:49:33.508922+01	2013-11-19 20:49:33.508933+01	t	\N	9	17	\N	1
18	2013-11-19 20:49:33.509776+01	2013-11-19 20:49:33.509786+01	t	\N	10	18	\N	1
19	2013-11-19 20:49:33.510673+01	2013-11-19 20:49:33.510684+01	t	\N	10	19	\N	1
20	2013-11-19 20:49:33.511504+01	2013-11-19 20:49:33.511515+01	t	\N	11	20	\N	1
21	2013-11-19 20:49:33.512358+01	2013-11-19 20:49:33.512369+01	t	\N	11	21	\N	1
22	2013-11-19 20:49:33.513118+01	2013-11-19 20:49:33.513127+01	t	\N	12	22	\N	1
23	2013-11-19 20:49:33.513907+01	2013-11-19 20:49:33.513918+01	t	\N	12	23	\N	1
24	2013-11-19 20:49:33.514695+01	2013-11-19 20:49:33.514706+01	t	\N	13	24	\N	1
25	2013-11-19 20:49:33.515443+01	2013-11-19 20:49:33.515452+01	t	\N	13	25	\N	1
26	2013-11-19 20:49:33.516343+01	2013-11-19 20:49:33.516354+01	t	\N	14	26	\N	1
27	2013-11-19 20:49:33.5173+01	2013-11-19 20:49:33.517311+01	t	\N	14	27	\N	1
28	2013-11-19 20:49:33.51822+01	2013-11-19 20:49:33.518231+01	t	\N	15	28	\N	1
29	2013-11-19 20:49:33.51914+01	2013-11-19 20:49:33.519151+01	t	\N	15	29	\N	1
30	2013-11-19 20:49:33.520056+01	2013-11-19 20:49:33.520067+01	t	\N	16	30	\N	1
31	2013-11-19 20:49:33.520924+01	2013-11-19 20:49:33.520935+01	t	\N	16	31	\N	1
32	2013-11-19 20:49:33.521826+01	2013-11-19 20:49:33.521837+01	t	\N	17	32	\N	1
33	2013-11-19 20:49:33.52264+01	2013-11-19 20:49:33.522651+01	t	\N	17	33	\N	1
34	2013-11-19 20:49:33.523463+01	2013-11-19 20:49:33.523473+01	t	\N	18	34	\N	1
35	2013-11-19 20:49:33.524279+01	2013-11-19 20:49:33.52429+01	t	\N	18	35	\N	1
36	2013-11-19 20:49:33.525101+01	2013-11-19 20:49:33.525111+01	t	\N	19	36	\N	1
37	2013-11-19 20:49:33.525885+01	2013-11-19 20:49:33.525896+01	t	\N	19	37	\N	1
38	2013-11-19 20:49:33.526665+01	2013-11-19 20:49:33.526676+01	t	\N	20	38	\N	1
39	2013-11-19 20:49:33.527492+01	2013-11-19 20:49:33.527503+01	t	\N	20	39	\N	1
40	2013-11-19 20:49:33.528281+01	2013-11-19 20:49:33.528292+01	t	\N	21	40	\N	1
41	2013-11-19 20:49:33.529075+01	2013-11-19 20:49:33.529086+01	t	\N	21	41	\N	1
42	2013-11-19 20:49:33.529777+01	2013-11-19 20:49:33.529785+01	t	\N	22	42	\N	1
43	2013-11-19 20:49:33.530525+01	2013-11-19 20:49:33.530536+01	t	\N	22	43	\N	1
44	2013-11-19 20:49:33.531476+01	2013-11-19 20:49:33.531487+01	t	\N	23	44	\N	1
45	2013-11-19 20:49:33.532244+01	2013-11-19 20:49:33.532252+01	t	\N	23	45	\N	1
46	2013-11-19 20:49:33.533108+01	2013-11-19 20:49:33.533119+01	t	\N	24	46	\N	1
47	2013-11-19 20:49:33.533869+01	2013-11-19 20:49:33.533879+01	t	\N	24	47	\N	1
48	2013-11-19 20:49:33.534781+01	2013-11-19 20:49:33.534792+01	t	\N	25	48	\N	1
49	2013-11-19 20:49:33.535609+01	2013-11-19 20:49:33.535617+01	t	\N	26	49	\N	1
50	2013-11-19 20:49:33.536291+01	2013-11-19 20:49:33.536299+01	t	\N	26	50	\N	1
51	2013-11-19 20:49:33.537133+01	2013-11-19 20:49:33.537141+01	t	\N	27	51	\N	1
52	2013-11-19 20:49:33.538011+01	2013-11-19 20:49:33.53802+01	t	\N	27	52	\N	1
53	2013-11-19 20:49:33.538769+01	2013-11-19 20:49:33.538777+01	t	\N	28	53	\N	1
54	2013-11-19 20:49:33.53953+01	2013-11-19 20:49:33.539539+01	t	\N	28	54	\N	1
55	2013-11-19 20:49:33.540301+01	2013-11-19 20:49:33.540309+01	t	\N	29	55	\N	1
56	2013-11-19 20:49:33.541064+01	2013-11-19 20:49:33.541073+01	t	\N	30	56	\N	1
57	2013-11-19 20:49:33.541986+01	2013-11-19 20:49:33.541997+01	t	\N	30	57	\N	1
58	2013-11-19 20:49:33.542893+01	2013-11-19 20:49:33.542904+01	t	\N	31	58	\N	1
59	2013-11-19 20:49:33.543812+01	2013-11-19 20:49:33.543823+01	t	\N	32	59	\N	1
60	2013-11-19 20:49:33.544769+01	2013-11-19 20:49:33.54478+01	t	\N	32	60	\N	1
61	2013-11-19 20:49:33.545586+01	2013-11-19 20:49:33.545594+01	t	\N	33	61	\N	1
62	2013-11-19 20:49:33.546494+01	2013-11-19 20:49:33.546505+01	t	\N	33	62	\N	1
63	2013-11-19 20:49:33.547323+01	2013-11-19 20:49:33.547332+01	t	\N	34	63	\N	1
64	2013-11-19 20:49:33.54823+01	2013-11-19 20:49:33.548241+01	t	\N	35	64	\N	1
65	2013-11-19 20:49:33.549167+01	2013-11-19 20:49:33.549178+01	t	\N	35	65	\N	1
66	2013-11-19 20:49:33.550015+01	2013-11-19 20:49:33.550026+01	t	\N	36	66	\N	1
67	2013-11-19 20:49:33.550849+01	2013-11-19 20:49:33.55086+01	t	\N	36	67	\N	1
68	2013-11-19 20:49:33.551713+01	2013-11-19 20:49:33.551722+01	t	\N	37	68	\N	1
69	2013-11-19 20:49:33.552494+01	2013-11-19 20:49:33.552503+01	t	\N	37	69	\N	1
70	2013-11-19 20:49:33.553298+01	2013-11-19 20:49:33.553306+01	t	\N	38	70	\N	1
71	2013-11-19 20:49:33.554065+01	2013-11-19 20:49:33.554073+01	t	\N	39	71	\N	1
72	2013-11-19 20:49:33.554857+01	2013-11-19 20:49:33.554865+01	t	\N	39	72	\N	1
73	2013-11-19 20:49:33.55561+01	2013-11-19 20:49:33.555618+01	t	\N	40	73	\N	1
74	2013-11-19 20:49:33.556364+01	2013-11-19 20:49:33.556372+01	t	\N	40	74	\N	1
75	2013-11-19 20:49:33.557154+01	2013-11-19 20:49:33.557162+01	t	\N	41	75	\N	1
76	2013-11-19 20:49:33.55789+01	2013-11-19 20:49:33.557898+01	t	\N	41	76	\N	1
77	2013-11-19 20:49:33.558721+01	2013-11-19 20:49:33.558732+01	t	\N	42	77	\N	1
78	2013-11-19 20:49:33.559565+01	2013-11-19 20:49:33.559576+01	t	\N	42	78	\N	1
79	2013-11-19 20:49:33.560371+01	2013-11-19 20:49:33.560382+01	t	\N	43	79	\N	1
80	2013-11-19 20:49:33.561184+01	2013-11-19 20:49:33.561195+01	t	\N	43	80	\N	1
81	2013-11-19 20:49:33.561979+01	2013-11-19 20:49:33.561989+01	t	\N	44	81	\N	1
82	2013-11-19 20:49:33.562804+01	2013-11-19 20:49:33.562815+01	t	\N	44	82	\N	1
83	2013-11-19 20:49:33.56352+01	2013-11-19 20:49:33.563529+01	t	\N	45	83	\N	1
84	2013-11-19 20:49:33.564406+01	2013-11-19 20:49:33.564417+01	t	\N	45	84	\N	1
85	2013-11-19 20:49:33.565284+01	2013-11-19 20:49:33.565293+01	t	\N	46	85	\N	1
86	2013-11-19 20:49:33.565994+01	2013-11-19 20:49:33.566002+01	t	\N	46	86	\N	1
87	2013-11-19 20:49:33.566666+01	2013-11-19 20:49:33.566673+01	t	\N	47	87	\N	1
88	2013-11-19 20:49:33.56733+01	2013-11-19 20:49:33.567338+01	t	\N	47	88	\N	1
89	2013-11-19 20:49:33.568013+01	2013-11-19 20:49:33.568021+01	t	\N	48	89	\N	1
90	2013-11-19 20:49:33.56871+01	2013-11-19 20:49:33.568718+01	t	\N	48	90	\N	1
91	2013-11-19 20:49:33.569396+01	2013-11-19 20:49:33.569404+01	t	\N	49	91	\N	1
92	2013-11-19 20:49:33.570052+01	2013-11-19 20:49:33.570059+01	t	\N	49	92	\N	1
93	2013-11-19 20:49:33.570697+01	2013-11-19 20:49:33.570705+01	t	\N	50	93	\N	1
94	2013-11-19 20:49:33.571339+01	2013-11-19 20:49:33.571347+01	t	\N	50	94	\N	1
95	2013-11-19 20:49:33.572108+01	2013-11-19 20:49:33.572119+01	t	\N	51	95	\N	1
96	2013-11-19 20:49:33.572947+01	2013-11-19 20:49:33.572964+01	t	\N	51	96	\N	1
97	2013-11-19 20:49:33.573828+01	2013-11-19 20:49:33.573839+01	t	\N	52	97	\N	1
98	2013-11-19 20:49:33.574873+01	2013-11-19 20:49:33.574888+01	t	\N	52	98	\N	1
99	2013-11-19 20:49:33.575986+01	2013-11-19 20:49:33.575996+01	t	\N	53	99	\N	1
100	2013-11-19 20:49:33.576812+01	2013-11-19 20:49:33.57682+01	t	\N	53	100	\N	1
101	2013-11-19 20:49:33.577582+01	2013-11-19 20:49:33.577591+01	t	\N	54	101	\N	1
102	2013-11-19 20:49:33.578413+01	2013-11-19 20:49:33.578422+01	t	\N	55	102	\N	1
103	2013-11-19 20:49:33.579221+01	2013-11-19 20:49:33.57923+01	t	\N	55	103	\N	1
104	2013-11-19 20:49:33.580033+01	2013-11-19 20:49:33.580041+01	t	\N	56	104	\N	1
105	2013-11-19 20:49:33.580788+01	2013-11-19 20:49:33.580796+01	t	\N	56	105	\N	1
106	2013-11-19 20:49:33.581504+01	2013-11-19 20:49:33.581512+01	t	\N	57	106	\N	1
107	2013-11-19 20:49:33.582356+01	2013-11-19 20:49:33.582367+01	t	\N	57	107	\N	1
108	2013-11-19 20:49:33.583173+01	2013-11-19 20:49:33.583184+01	t	\N	58	108	\N	1
109	2013-11-19 20:49:33.584137+01	2013-11-19 20:49:33.584145+01	t	\N	58	109	\N	1
110	2013-11-19 20:49:33.584962+01	2013-11-19 20:49:33.584973+01	t	\N	59	110	\N	1
111	2013-11-19 20:49:33.585768+01	2013-11-19 20:49:33.585779+01	t	\N	59	111	\N	1
112	2013-11-19 20:49:33.586488+01	2013-11-19 20:49:33.586497+01	t	\N	60	112	\N	1
113	2013-11-19 20:49:33.587172+01	2013-11-19 20:49:33.58718+01	t	\N	60	113	\N	1
114	2013-11-19 20:49:33.587819+01	2013-11-19 20:49:33.587827+01	t	\N	61	114	\N	1
115	2013-11-19 20:49:33.588533+01	2013-11-19 20:49:33.588541+01	t	\N	61	115	\N	1
116	2013-11-19 20:49:33.589185+01	2013-11-19 20:49:33.589193+01	t	\N	62	116	\N	1
117	2013-11-19 20:49:33.589834+01	2013-11-19 20:49:33.589842+01	t	\N	62	117	\N	1
118	2013-11-19 20:49:33.590461+01	2013-11-19 20:49:33.590469+01	t	\N	63	118	\N	1
119	2013-11-19 20:49:33.591084+01	2013-11-19 20:49:33.591091+01	t	\N	63	119	\N	1
120	2013-11-19 20:49:33.5917+01	2013-11-19 20:49:33.591708+01	t	\N	64	120	\N	1
121	2013-11-19 20:49:33.592317+01	2013-11-19 20:49:33.592325+01	t	\N	64	121	\N	1
122	2013-11-19 20:49:33.592964+01	2013-11-19 20:49:33.592972+01	t	\N	65	122	\N	1
123	2013-11-19 20:49:33.593617+01	2013-11-19 20:49:33.593625+01	t	\N	65	123	\N	1
124	2013-11-19 20:49:33.594289+01	2013-11-19 20:49:33.594297+01	t	\N	66	124	\N	1
125	2013-11-19 20:49:33.594959+01	2013-11-19 20:49:33.594967+01	t	\N	66	125	\N	1
126	2013-11-19 20:49:33.5956+01	2013-11-19 20:49:33.595608+01	t	\N	67	126	\N	1
127	2013-11-19 20:49:33.596237+01	2013-11-19 20:49:33.596245+01	t	\N	67	127	\N	1
128	2013-11-19 20:49:33.596875+01	2013-11-19 20:49:33.596888+01	t	\N	68	128	\N	1
129	2013-11-19 20:49:33.597722+01	2013-11-19 20:49:33.597732+01	t	\N	68	129	\N	1
130	2013-11-19 20:49:33.598613+01	2013-11-19 20:49:33.598625+01	t	\N	69	130	\N	1
131	2013-11-19 20:49:33.599428+01	2013-11-19 20:49:33.599439+01	t	\N	69	131	\N	1
132	2013-11-19 20:49:33.600214+01	2013-11-19 20:49:33.600225+01	t	\N	70	132	\N	1
133	2013-11-19 20:49:33.601012+01	2013-11-19 20:49:33.601023+01	t	\N	70	133	\N	1
134	2013-11-19 20:49:33.601798+01	2013-11-19 20:49:33.601809+01	t	\N	71	134	\N	1
135	2013-11-19 20:49:33.602578+01	2013-11-19 20:49:33.602589+01	t	\N	72	135	\N	1
136	2013-11-19 20:49:33.603389+01	2013-11-19 20:49:33.6034+01	t	\N	72	136	\N	1
137	2013-11-19 20:49:33.604154+01	2013-11-19 20:49:33.604164+01	t	\N	73	137	\N	1
138	2013-11-19 20:49:33.604994+01	2013-11-19 20:49:33.605005+01	t	\N	73	138	\N	1
139	2013-11-19 20:49:33.60592+01	2013-11-19 20:49:33.605931+01	t	\N	74	139	\N	1
140	2013-11-19 20:49:33.60668+01	2013-11-19 20:49:33.606688+01	t	\N	74	140	\N	1
141	2013-11-19 20:49:33.607393+01	2013-11-19 20:49:33.607401+01	t	\N	75	141	\N	1
142	2013-11-19 20:49:33.608041+01	2013-11-19 20:49:33.608049+01	t	\N	76	142	\N	1
143	2013-11-19 20:49:33.608895+01	2013-11-19 20:49:33.608903+01	t	\N	76	143	\N	1
144	2013-11-19 20:49:33.609699+01	2013-11-19 20:49:33.60971+01	t	\N	77	144	\N	1
145	2013-11-19 20:49:33.610425+01	2013-11-19 20:49:33.610433+01	t	\N	77	145	\N	1
146	2013-11-19 20:49:33.61111+01	2013-11-19 20:49:33.611118+01	t	\N	78	146	\N	1
147	2013-11-19 20:49:33.611781+01	2013-11-19 20:49:33.611788+01	t	\N	78	147	\N	1
148	2013-11-19 20:49:33.612414+01	2013-11-19 20:49:33.612422+01	t	\N	79	148	\N	1
149	2013-11-19 20:49:33.613052+01	2013-11-19 20:49:33.61306+01	t	\N	79	149	\N	1
150	2013-11-19 20:49:33.613947+01	2013-11-19 20:49:33.613959+01	t	\N	80	150	\N	1
151	2013-11-19 20:49:33.614788+01	2013-11-19 20:49:33.614797+01	t	\N	80	151	\N	1
152	2013-11-19 20:49:33.61562+01	2013-11-19 20:49:33.615629+01	t	\N	81	152	\N	1
153	2013-11-19 20:49:33.616429+01	2013-11-19 20:49:33.616437+01	t	\N	81	153	\N	1
154	2013-11-19 20:49:33.617248+01	2013-11-19 20:49:33.617256+01	t	\N	82	154	\N	1
155	2013-11-19 20:49:33.617963+01	2013-11-19 20:49:33.617972+01	t	\N	82	155	\N	1
156	2013-11-19 20:49:33.618699+01	2013-11-19 20:49:33.618713+01	t	\N	83	156	\N	1
157	2013-11-19 20:49:33.619398+01	2013-11-19 20:49:33.619406+01	t	\N	83	157	\N	1
158	2013-11-19 20:49:33.620065+01	2013-11-19 20:49:33.620073+01	t	\N	84	158	\N	1
159	2013-11-19 20:49:33.620757+01	2013-11-19 20:49:33.620765+01	t	\N	84	159	\N	1
160	2013-11-19 20:49:33.621391+01	2013-11-19 20:49:33.621399+01	t	\N	85	160	\N	1
161	2013-11-19 20:49:33.622017+01	2013-11-19 20:49:33.622025+01	t	\N	85	161	\N	1
162	2013-11-19 20:49:33.622639+01	2013-11-19 20:49:33.622647+01	t	\N	86	162	\N	1
163	2013-11-19 20:49:33.623258+01	2013-11-19 20:49:33.623266+01	t	\N	86	163	\N	1
164	2013-11-19 20:49:33.624016+01	2013-11-19 20:49:33.624024+01	t	\N	87	164	\N	1
165	2013-11-19 20:49:33.624824+01	2013-11-19 20:49:33.624835+01	t	\N	87	165	\N	1
166	2013-11-19 20:49:33.625762+01	2013-11-19 20:49:33.625773+01	t	\N	88	166	\N	1
167	2013-11-19 20:49:33.62661+01	2013-11-19 20:49:33.626618+01	t	\N	88	167	\N	1
168	2013-11-19 20:49:33.627421+01	2013-11-19 20:49:33.627429+01	t	\N	89	168	\N	1
169	2013-11-19 20:49:33.628116+01	2013-11-19 20:49:33.628124+01	t	\N	89	169	\N	1
170	2013-11-19 20:49:33.628867+01	2013-11-19 20:49:33.628881+01	t	\N	90	170	\N	1
171	2013-11-19 20:49:33.629564+01	2013-11-19 20:49:33.629572+01	t	\N	90	171	\N	1
172	2013-11-19 20:49:33.630258+01	2013-11-19 20:49:33.630268+01	t	\N	91	172	\N	1
173	2013-11-19 20:49:33.630922+01	2013-11-19 20:49:33.63093+01	t	\N	91	173	\N	1
174	2013-11-19 20:49:33.631683+01	2013-11-19 20:49:33.631695+01	t	\N	92	174	\N	1
175	2013-11-19 20:49:33.632527+01	2013-11-19 20:49:33.632537+01	t	\N	92	175	\N	1
176	2013-11-19 20:49:33.633307+01	2013-11-19 20:49:33.633316+01	t	\N	93	176	\N	1
177	2013-11-19 20:49:33.634058+01	2013-11-19 20:49:33.634067+01	t	\N	93	177	\N	1
178	2013-11-19 20:49:33.634758+01	2013-11-19 20:49:33.634767+01	t	\N	94	178	\N	1
179	2013-11-19 20:49:33.635547+01	2013-11-19 20:49:33.635554+01	t	\N	94	179	\N	1
180	2013-11-19 20:49:33.636331+01	2013-11-19 20:49:33.636338+01	t	\N	95	180	\N	1
181	2013-11-19 20:49:33.63712+01	2013-11-19 20:49:33.637128+01	t	\N	95	181	\N	1
182	2013-11-19 20:49:33.637831+01	2013-11-19 20:49:33.637839+01	t	\N	96	182	\N	1
183	2013-11-19 20:49:33.638504+01	2013-11-19 20:49:33.638512+01	t	\N	96	183	\N	1
184	2013-11-19 20:49:33.639169+01	2013-11-19 20:49:33.639176+01	t	\N	97	184	\N	1
185	2013-11-19 20:49:33.639845+01	2013-11-19 20:49:33.639853+01	t	\N	98	185	\N	1
186	2013-11-19 20:49:33.640503+01	2013-11-19 20:49:33.640511+01	t	\N	98	186	\N	1
187	2013-11-19 20:49:33.641157+01	2013-11-19 20:49:33.641165+01	t	\N	99	187	\N	1
188	2013-11-19 20:49:33.641781+01	2013-11-19 20:49:33.641788+01	t	\N	99	188	\N	1
189	2013-11-19 20:49:33.642396+01	2013-11-19 20:49:33.642404+01	t	\N	100	189	\N	1
190	2013-11-19 20:49:33.643015+01	2013-11-19 20:49:33.643023+01	t	\N	100	190	\N	1
191	2013-11-19 20:49:33.643629+01	2013-11-19 20:49:33.643637+01	t	\N	101	191	\N	1
192	2013-11-19 20:49:33.644267+01	2013-11-19 20:49:33.644275+01	t	\N	101	192	\N	1
193	2013-11-19 20:49:33.645054+01	2013-11-19 20:49:33.645061+01	t	\N	102	193	\N	1
194	2013-11-19 20:49:33.645729+01	2013-11-19 20:49:33.645737+01	t	\N	102	194	\N	1
195	2013-11-19 20:49:33.646384+01	2013-11-19 20:49:33.646391+01	t	\N	103	195	\N	1
196	2013-11-19 20:49:33.647052+01	2013-11-19 20:49:33.64706+01	t	\N	103	196	\N	1
197	2013-11-19 20:49:33.647736+01	2013-11-19 20:49:33.647744+01	t	\N	104	197	\N	1
198	2013-11-19 20:49:33.648387+01	2013-11-19 20:49:33.648395+01	t	\N	104	198	\N	1
199	2013-11-19 20:49:33.649087+01	2013-11-19 20:49:33.649095+01	t	\N	105	199	\N	1
200	2013-11-19 20:49:33.649885+01	2013-11-19 20:49:33.649896+01	t	\N	105	200	\N	1
201	2013-11-19 20:49:33.65057+01	2013-11-19 20:49:33.650579+01	t	\N	106	201	\N	1
202	2013-11-19 20:49:33.651335+01	2013-11-19 20:49:33.651346+01	t	\N	106	202	\N	1
203	2013-11-19 20:49:33.652118+01	2013-11-19 20:49:33.652129+01	t	\N	107	203	\N	1
204	2013-11-19 20:49:33.652926+01	2013-11-19 20:49:33.652937+01	t	\N	107	204	\N	1
205	2013-11-19 20:49:33.653709+01	2013-11-19 20:49:33.65372+01	t	\N	108	205	\N	1
206	2013-11-19 20:49:33.654445+01	2013-11-19 20:49:33.654453+01	t	\N	108	206	\N	1
207	2013-11-19 20:49:33.655209+01	2013-11-19 20:49:33.655217+01	t	\N	109	207	\N	1
208	2013-11-19 20:49:33.655889+01	2013-11-19 20:49:33.655897+01	t	\N	109	208	\N	1
209	2013-11-19 20:49:33.656554+01	2013-11-19 20:49:33.656563+01	t	\N	110	209	\N	1
210	2013-11-19 20:49:33.657233+01	2013-11-19 20:49:33.65724+01	t	\N	110	210	\N	1
211	2013-11-19 20:49:33.657886+01	2013-11-19 20:49:33.657893+01	t	\N	111	211	\N	1
212	2013-11-19 20:49:33.65851+01	2013-11-19 20:49:33.658518+01	t	\N	111	212	\N	1
213	2013-11-19 20:49:33.659213+01	2013-11-19 20:49:33.659221+01	t	\N	112	213	\N	1
214	2013-11-19 20:49:33.659951+01	2013-11-19 20:49:33.659958+01	t	\N	112	214	\N	1
215	2013-11-19 20:49:33.660853+01	2013-11-19 20:49:33.660864+01	t	\N	113	215	\N	1
216	2013-11-19 20:49:33.661828+01	2013-11-19 20:49:33.661839+01	t	\N	113	216	\N	1
217	2013-11-19 20:49:33.66268+01	2013-11-19 20:49:33.662691+01	t	\N	114	217	\N	1
218	2013-11-19 20:49:33.663452+01	2013-11-19 20:49:33.66346+01	t	\N	114	218	\N	1
219	2013-11-19 20:49:33.664281+01	2013-11-19 20:49:33.664292+01	t	\N	115	219	\N	1
220	2013-11-19 20:49:33.66518+01	2013-11-19 20:49:33.665189+01	t	\N	115	220	\N	1
221	2013-11-19 20:49:33.665953+01	2013-11-19 20:49:33.665961+01	t	\N	116	221	\N	1
222	2013-11-19 20:49:33.666678+01	2013-11-19 20:49:33.666686+01	t	\N	116	222	\N	1
223	2013-11-19 20:49:33.667366+01	2013-11-19 20:49:33.667374+01	t	\N	117	223	\N	1
224	2013-11-19 20:49:33.668039+01	2013-11-19 20:49:33.668047+01	t	\N	117	224	\N	1
225	2013-11-19 20:49:33.66881+01	2013-11-19 20:49:33.668818+01	t	\N	118	225	\N	1
226	2013-11-19 20:49:33.669548+01	2013-11-19 20:49:33.669562+01	t	\N	118	226	\N	1
227	2013-11-19 20:49:33.670369+01	2013-11-19 20:49:33.670377+01	t	\N	119	227	\N	1
228	2013-11-19 20:49:33.671042+01	2013-11-19 20:49:33.67105+01	t	\N	119	228	\N	1
229	2013-11-19 20:49:33.671698+01	2013-11-19 20:49:33.671706+01	t	\N	120	229	\N	1
230	2013-11-19 20:49:33.672348+01	2013-11-19 20:49:33.672355+01	t	\N	120	230	\N	1
231	2013-11-19 20:49:33.673032+01	2013-11-19 20:49:33.67304+01	t	\N	121	231	\N	1
232	2013-11-19 20:49:33.673683+01	2013-11-19 20:49:33.673691+01	t	\N	121	232	\N	1
233	2013-11-19 20:49:33.67433+01	2013-11-19 20:49:33.674338+01	t	\N	122	233	\N	1
234	2013-11-19 20:49:33.674986+01	2013-11-19 20:49:33.674993+01	t	\N	122	234	\N	1
235	2013-11-19 20:49:33.67563+01	2013-11-19 20:49:33.675637+01	t	\N	123	235	\N	1
236	2013-11-19 20:49:33.676271+01	2013-11-19 20:49:33.676278+01	t	\N	123	236	\N	1
237	2013-11-19 20:49:33.676938+01	2013-11-19 20:49:33.676946+01	t	\N	124	237	\N	1
238	2013-11-19 20:49:33.677583+01	2013-11-19 20:49:33.67759+01	t	\N	124	238	\N	1
239	2013-11-19 20:49:33.678223+01	2013-11-19 20:49:33.67823+01	t	\N	125	239	\N	1
240	2013-11-19 20:49:33.67886+01	2013-11-19 20:49:33.678868+01	t	\N	125	240	\N	1
241	2013-11-19 20:49:33.679502+01	2013-11-19 20:49:33.679509+01	t	\N	126	241	\N	1
242	2013-11-19 20:49:33.680346+01	2013-11-19 20:49:33.680358+01	t	\N	126	242	\N	1
243	2013-11-19 20:49:33.681111+01	2013-11-19 20:49:33.681119+01	t	\N	127	243	\N	1
244	2013-11-19 20:49:33.681865+01	2013-11-19 20:49:33.681875+01	t	\N	127	244	\N	1
245	2013-11-19 20:49:33.682676+01	2013-11-19 20:49:33.682684+01	t	\N	128	245	\N	1
246	2013-11-19 20:49:33.683431+01	2013-11-19 20:49:33.683439+01	t	\N	128	246	\N	1
247	2013-11-19 20:49:33.684146+01	2013-11-19 20:49:33.684154+01	t	\N	129	247	\N	1
248	2013-11-19 20:49:33.684907+01	2013-11-19 20:49:33.684915+01	t	\N	129	248	\N	1
249	2013-11-19 20:49:33.685704+01	2013-11-19 20:49:33.685714+01	t	\N	130	249	\N	1
250	2013-11-19 20:49:33.68652+01	2013-11-19 20:49:33.686529+01	t	\N	130	250	\N	1
251	2013-11-19 20:49:33.687224+01	2013-11-19 20:49:33.687232+01	t	\N	131	251	\N	1
252	2013-11-19 20:49:33.687906+01	2013-11-19 20:49:33.687914+01	t	\N	131	252	\N	1
253	2013-11-19 20:49:33.688582+01	2013-11-19 20:49:33.68859+01	t	\N	132	253	\N	1
254	2013-11-19 20:49:33.689255+01	2013-11-19 20:49:33.689263+01	t	\N	132	254	\N	1
255	2013-11-19 20:49:33.689893+01	2013-11-19 20:49:33.689901+01	t	\N	133	255	\N	1
256	2013-11-19 20:49:33.690525+01	2013-11-19 20:49:33.690533+01	t	\N	133	256	\N	1
257	2013-11-19 20:49:33.691161+01	2013-11-19 20:49:33.691169+01	t	\N	134	257	\N	1
258	2013-11-19 20:49:33.691788+01	2013-11-19 20:49:33.691797+01	t	\N	134	258	\N	1
259	2013-11-19 20:49:33.69241+01	2013-11-19 20:49:33.692418+01	t	\N	135	259	\N	1
260	2013-11-19 20:49:33.693062+01	2013-11-19 20:49:33.693069+01	t	\N	135	260	\N	1
261	2013-11-19 20:49:33.693705+01	2013-11-19 20:49:33.693713+01	t	\N	136	261	\N	1
262	2013-11-19 20:49:33.694347+01	2013-11-19 20:49:33.694354+01	t	\N	136	262	\N	1
263	2013-11-19 20:49:33.695051+01	2013-11-19 20:49:33.695062+01	t	\N	137	263	\N	1
264	2013-11-19 20:49:33.695771+01	2013-11-19 20:49:33.695779+01	t	\N	137	264	\N	1
265	2013-11-19 20:49:33.696443+01	2013-11-19 20:49:33.69645+01	t	\N	138	265	\N	1
266	2013-11-19 20:49:33.6971+01	2013-11-19 20:49:33.697108+01	t	\N	139	266	\N	1
267	2013-11-19 20:49:33.697764+01	2013-11-19 20:49:33.697771+01	t	\N	140	267	\N	1
268	2013-11-19 20:49:33.698572+01	2013-11-19 20:49:33.698582+01	t	\N	140	268	\N	1
269	2013-11-19 20:49:33.699339+01	2013-11-19 20:49:33.699347+01	t	\N	141	269	\N	1
270	2013-11-19 20:49:33.700064+01	2013-11-19 20:49:33.700073+01	t	\N	141	270	\N	1
271	2013-11-19 20:49:33.700866+01	2013-11-19 20:49:33.700874+01	t	\N	142	271	\N	1
272	2013-11-19 20:49:33.701563+01	2013-11-19 20:49:33.701571+01	t	\N	142	272	\N	1
273	2013-11-19 20:49:33.702235+01	2013-11-19 20:49:33.702242+01	t	\N	143	273	\N	1
274	2013-11-19 20:49:33.702898+01	2013-11-19 20:49:33.702906+01	t	\N	143	274	\N	1
275	2013-11-19 20:49:33.703702+01	2013-11-19 20:49:33.703713+01	t	\N	144	275	\N	1
276	2013-11-19 20:49:33.704501+01	2013-11-19 20:49:33.704512+01	t	\N	144	276	\N	1
277	2013-11-19 20:49:33.705263+01	2013-11-19 20:49:33.705271+01	t	\N	145	277	\N	1
278	2013-11-19 20:49:33.70595+01	2013-11-19 20:49:33.705958+01	t	\N	145	278	\N	1
279	2013-11-19 20:49:33.706616+01	2013-11-19 20:49:33.706624+01	t	\N	146	279	\N	1
280	2013-11-19 20:49:33.707279+01	2013-11-19 20:49:33.707286+01	t	\N	146	280	\N	1
281	2013-11-19 20:49:33.707918+01	2013-11-19 20:49:33.70793+01	t	\N	147	281	\N	1
282	2013-11-19 20:49:33.708619+01	2013-11-19 20:49:33.708627+01	t	\N	147	282	\N	1
283	2013-11-19 20:49:33.709293+01	2013-11-19 20:49:33.709301+01	t	\N	148	283	\N	1
284	2013-11-19 20:49:33.710062+01	2013-11-19 20:49:33.710073+01	t	\N	148	284	\N	1
285	2013-11-19 20:49:33.71078+01	2013-11-19 20:49:33.710793+01	t	\N	149	285	\N	1
286	2013-11-19 20:49:33.71151+01	2013-11-19 20:49:33.711519+01	t	\N	149	286	\N	1
287	2013-11-19 20:49:33.712176+01	2013-11-19 20:49:33.712184+01	t	\N	150	287	\N	1
288	2013-11-19 20:49:33.712868+01	2013-11-19 20:49:33.712876+01	t	\N	150	288	\N	1
289	2013-11-19 20:49:33.71353+01	2013-11-19 20:49:33.713538+01	t	\N	151	289	\N	1
290	2013-11-19 20:49:33.714213+01	2013-11-19 20:49:33.714221+01	t	\N	151	290	\N	1
291	2013-11-19 20:49:33.714848+01	2013-11-19 20:49:33.714856+01	t	\N	152	291	\N	1
292	2013-11-19 20:49:33.715674+01	2013-11-19 20:49:33.715682+01	t	\N	152	292	\N	1
293	2013-11-19 20:49:33.716455+01	2013-11-19 20:49:33.716466+01	t	\N	153	293	\N	1
294	2013-11-19 20:49:33.71727+01	2013-11-19 20:49:33.71728+01	t	\N	153	294	\N	1
295	2013-11-19 20:49:33.717976+01	2013-11-19 20:49:33.717985+01	t	\N	154	295	\N	1
296	2013-11-19 20:49:33.718646+01	2013-11-19 20:49:33.718654+01	t	\N	155	296	\N	1
297	2013-11-19 20:49:33.719307+01	2013-11-19 20:49:33.719314+01	t	\N	155	297	\N	1
298	2013-11-19 20:49:33.719965+01	2013-11-19 20:49:33.719973+01	t	\N	156	298	\N	1
299	2013-11-19 20:49:33.720658+01	2013-11-19 20:49:33.720665+01	t	\N	156	299	\N	1
300	2013-11-19 20:49:33.721325+01	2013-11-19 20:49:33.721333+01	t	\N	157	300	\N	1
301	2013-11-19 20:49:33.721985+01	2013-11-19 20:49:33.721993+01	t	\N	158	301	\N	1
302	2013-11-19 20:49:33.722633+01	2013-11-19 20:49:33.722641+01	t	\N	158	302	\N	1
303	2013-11-19 20:49:33.723275+01	2013-11-19 20:49:33.723283+01	t	\N	159	303	\N	1
304	2013-11-19 20:49:33.72392+01	2013-11-19 20:49:33.723929+01	t	\N	159	304	\N	1
\.


--
-- Data for Name: languageidentifier_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY languageidentifier_history (pk, created, updated, active, jsondata, language_pk, identifier_pk, description, version) FROM stdin;
\.


--
-- Name: languageidentifier_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('languageidentifier_history_pk_seq', 1, false);


--
-- Name: languageidentifier_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('languageidentifier_pk_seq', 304, true);


--
-- Data for Name: languagesource; Type: TABLE DATA; Schema: public; Owner: -
--

COPY languagesource (pk, created, updated, active, jsondata, language_pk, source_pk, version) FROM stdin;
\.


--
-- Data for Name: languagesource_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY languagesource_history (pk, created, updated, active, jsondata, language_pk, source_pk, version) FROM stdin;
\.


--
-- Name: languagesource_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('languagesource_history_pk_seq', 1, false);


--
-- Name: languagesource_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('languagesource_pk_seq', 1, false);


--
-- Data for Name: pair; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pair (pk, created, updated, active, jsondata, id, name, description, markup_description, recipient_pk, donor_pk, area, reliability, int_reliability, count_interrel, count_borrowed) FROM stdin;
1	2013-11-19 20:49:33.453367+01	2013-11-19 20:49:33.453372+01	t	\N	1	Bora affixes in Resígaro	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P2"><span class="T2">Information and examples are from Seifart </span><span class="T2">(<a href="__seifartbora2011__">2011</a>; <a href="__seifartprinciple2012__">2012</a>)</span><span class="T2">. The following list is extracted from Seifart’s </span><span class="T2">(<a href="__seifartbora2011__">2011</a>: 66–86)</span><span class="T2"> identification of Bora forms in Allin’s </span><span class="T2">(<a href="__allingrammar1976__">1976</a>: 382–458)</span><span class="T2"> list of about 1,590 Resígaro words, selecting those affixes that are attested with at least one native Arawakan stem. Added to this selection of forms is the augmentative marker and the</span><span class="T28"> </span><span class="T2">dative case marker, which do not occur in the word list, but are widely attested in other parts of Allin’s </span><span class="T2">(<a href="__allingrammar1976__">1976</a>)</span><span class="T2"> work as well is in Seifart’s </span><span class="T2">(<a href="__seifartresigaro2009__">2009</a>; <a href="__seifartprinciple2012__">2012</a>)</span><span class="T2"> data. Note that Seifart </span><span class="T2">(<a href="__seifartprinciple2012__">2012</a>)</span><span class="T2"> provides a different, although largely overlapping, list of borrowed affixes, namely those that are attested in a given corpus of Resígaro text </span><span class="T2">(Seifart <a href="__seifartresigaro2009__">2009</a>)</span><span class="T2">.</span></p><p class="P10"> </p><p class="P2"><span class="T3">40 classifiers and gender markers</span><span class="T2"> (38 classifiers predominantly used with inanimates, 2 feminine gender markers) (one native form in same slot: </span><span class="T28">‑gi </span><span class="T2">‘non‑feminine’)</span></p><p class="P2"><span class="T28">-ba </span><span class="T53">‘classifier.thing’, </span><span class="T2">e.g. </span><span class="T28">aʔmitʰoótsibá </span><span class="T2">‘belly’</span></p><p class="P2"><span class="T28">-baba </span><span class="T53">‘classifier.bag’, </span><span class="T2">e.g. </span><span class="T28">hiiʔpabábɯ́ </span><span class="T2">‘sock’</span></p><p class="P2"><span class="T28">-dʒihɯ </span><span class="T53">‘classifier.powder’, </span><span class="T2">e.g. </span><span class="T28">hípodʒíhɯ́ </span><span class="T2">‘powder’</span></p><p class="P2"><span class="T28">-dʒiiʔo </span><span class="T53">‘classifier.broom’, </span><span class="T2">e.g. </span><span class="T28">híβeʔdʒiiʔó </span><span class="T2">‘(long) hair’</span></p><p class="P2"><span class="T28">-gaaʔdʒó </span><span class="T53">‘classifier.raft’, </span><span class="T2">e.g. </span><span class="T28">aβáanagaaʔdʒó </span><span class="T2">‘raft’</span></p><p class="P2"><span class="T28">-gahɯ </span><span class="T53">‘classifier.ridge’, </span><span class="T2">e.g. </span><span class="T28">ín̥igahɯ́ </span><span class="T2">‘eyebrow’</span></p><p class="P2"><span class="T28">-gɯ </span><span class="T53">‘classifier.plank’, </span><span class="T2">e.g. </span><span class="T28">boeʔkʰóótsígɯ́ </span><span class="T2">‘paddle’</span></p><p class="P2"><span class="T28">-ha </span><span class="T53">‘classifier.cover’, </span><span class="T2">e.g. </span><span class="T28">aʔmitʰoótsihɯ́ </span><span class="T2">‘kitchen’</span></p><p class="P2"><span class="T28">-hi </span><span class="T53">‘classifier.disc’, </span><span class="T2">e.g. </span><span class="T28">epíitsíhí </span><span class="T2">‘axe’</span></p><p class="P2"><span class="T28">-hɯ </span><span class="T53">‘classifier.tube’, </span><span class="T2">e.g. </span><span class="T28">okóniigihɯ́ </span><span class="T2">‘rifle’</span></p><p class="P2"><span class="T28">-i </span><span class="T53">‘classifier.stick’, </span><span class="T2">e.g. </span><span class="T28">aβáanaí </span><span class="T2">‘stick’</span></p><p class="P2"><span class="T28">-iko </span><span class="T53">‘classifier.nest’, </span><span class="T2">e.g. </span><span class="T28">nanáanáʔiikó </span><span class="T2">‘shoot, new growth (of a pineapple)’</span></p><p class="P2"><span class="T28">-iʔikɯ </span><span class="T53">‘classifier.framework’, </span><span class="T2">e.g. </span><span class="T28">aápiíʔíkɯ́ </span><span class="T2">‘skeleton’</span></p><p class="P2"><span class="T28">-iʔo </span><span class="T53">‘classifier.point’, </span><span class="T2">e.g. </span><span class="T28">henákoííʔo </span><span class="T2">‘horn’</span></p><p class="P2"><span class="T28">-kaahɯ </span><span class="T53">‘classifier.swamp’, </span><span class="T2">e.g. </span><span class="T28">iteeβikaahɯ́ </span><span class="T2">‘place where </span><span class="T28">aguaje</span><span class="T2"> palms grow’</span></p><p class="P2"><span class="T28">-ko </span><span class="T53">‘classifier.pointed’, </span><span class="T2">e.g. </span><span class="T28">dʲɯííʃikó </span><span class="T2">‘</span><span class="T28">hausai</span><span class="T2"> palm’</span></p><p class="P2"><span class="T28">-kooʔa </span><span class="T53">‘classifier.shaft’, </span><span class="T2">e.g. </span><span class="T28">botoʔkʰoókooʔɯ́ </span><span class="T2">‘broom’</span></p><p class="P2"><span class="T28">-kɯba </span><span class="T53">‘classifier.leg’, </span><span class="T2">e.g. </span><span class="T28">hiiʔpákɯba </span><span class="T2">‘leg’</span></p><p class="P2"><span class="T28">-mi </span><span class="T53">‘classifier.transport’, </span><span class="T2">e.g. </span><span class="T28">okóniigimí </span><span class="T2">‘launch, boat’</span></p><p class="P2"><span class="T28">-miiʔo </span><span class="T53">‘classifier.shell’, </span><span class="T2">e.g. </span><span class="T28">an̥oógí eémámííʔo </span><span class="T2">‘tapir skin’</span></p><p class="P2"><span class="T28">-paahi </span><span class="T53">‘classifier.hollow’, </span><span class="T2">e.g. </span><span class="T28">híβeʔpaahí </span><span class="T2">‘skull’</span></p><p class="P2"><span class="T28">-pahtsi </span><span class="T53">‘classifier.hole’, </span><span class="T2">e.g. </span><span class="T28">henákopásí </span><span class="T2">‘earring’</span></p><p class="P2"><span class="T28">-pako </span><span class="T53">‘classifier.water’, </span><span class="T2">e.g. </span><span class="T28">keʔβigipákó </span><span class="T2">‘brandy’</span></p><p class="P2"><span class="T28">-peko </span><span class="T53">‘classifier.night’, </span><span class="T2">e.g. </span><span class="T28">nokótsapékó </span><span class="T2">‘the night before last’</span></p><p class="P2"><span class="T28">-ɯ </span><span class="T53">‘classifier.round’, </span><span class="T2">e.g. </span><span class="T28">hímiɯ́ </span><span class="T2">‘seed’</span></p><p class="P2"><span class="T28">-ɯɯʔo </span><span class="T53">‘classifier.string’, </span><span class="T2">e.g. </span><span class="T28">epíipíɯɯʔó </span><span class="T2">‘liana cord’</span></p><p class="P2"><span class="T28">-ʔaakɯ </span><span class="T53">‘classifier.pillar’, </span><span class="T2">e.g. </span><span class="T28">hiímiaakɯ́ </span><span class="T2">‘pillar in house construction’</span></p><p class="P2"><span class="T28">-ʔaami </span><span class="T53">‘classifier.leaf’, </span><span class="T2">e.g. </span><span class="T28">apánáʔaamí </span><span class="T2">‘leaf’</span></p><p class="P2"><span class="T28">-ʔasi </span><span class="T53">‘classifier.patio’, </span><span class="T2">e.g. </span><span class="T28">híβeʔásí </span><span class="T2">‘crown (of the head)’</span></p><p class="P2"><span class="T28">-ʔe </span><span class="T53">‘classifier.trunk’, </span><span class="T2">e.g. </span><span class="T28">áɲaahíʔé </span><span class="T2">‘cashew tree’</span></p><p class="P2"><span class="T28">-ʔehɯ </span><span class="T53">‘classifier.hole’, </span><span class="T2">e.g. </span><span class="T28">hooniʔéhɯ́ </span><span class="T2">‘well (waterhole)’</span></p><p class="P2"><span class="T28">-ʔi </span><span class="T53">‘classifier.bunch/classifier.river’, </span><span class="T2">e.g. </span><span class="T28">pipíipíʔí </span><span class="T2">‘bunch of Guilelma (palm) fruits’</span></p><p class="P2"><span class="T28">-ʔidʒo </span><span class="T53">‘classifier.pot’, </span><span class="T2">e.g. </span><span class="T28">itsaaʔniʔídʒó </span><span class="T2">‘earth ware pot, pitcher, jug’</span></p><p class="P2"><span class="T28">-ʔo </span><span class="T53">‘classifier.oblong’, </span><span class="T2">e.g. </span><span class="T28">ʃakooʔgíʔó </span><span class="T2">‘banana fruit’</span></p><p class="P2"><span class="T28">-ʔoohɯ </span><span class="T53">‘classifier.cylinder’, </span><span class="T2">e.g. </span><span class="T28">hipon̥oótsíʔoohɯ́ </span><span class="T2">‘prison’</span></p><p class="P2"><span class="T28">-ʔooβɯ </span><span class="T53">‘classifier.chunk’, </span><span class="T2">e.g. </span><span class="T28">keétséʔooβɯ́ </span><span class="T2">‘lantern, flashlight (torch)’</span></p><p class="P2"><span class="T28">-ʔosi </span><span class="T53">‘classifier.hand’, </span><span class="T2">e.g. </span><span class="T28">apáʔmíʔosí </span><span class="T2">‘left hand’</span></p><p class="P2"><span class="T28">-βɯɯ́dɯ </span><span class="T53">‘classifier.chunk’, </span><span class="T2">e.g. </span><span class="T28">aβáanaβɯɯdɯ́ </span><span class="T2">‘log’</span></p><p class="P2"><span class="T28">-dʒe </span><span class="T53">‘</span><span class="T2">feminine singular’, e.g. </span><span class="T28">-βanaaʔdʒé </span><span class="T2">‘sister-in-law (sister of sister-in-law or bother-in-law)’</span></p><p class="P2"><span class="T28">-pidʒe </span><span class="T53">‘</span><span class="T2">feminine singular’, e.g. </span><span class="T28">pʰaipídʒé </span><span class="T2">‘old woman’</span></p><p class="P10"> </p><p class="P2"><span class="T3">6 number markers</span><span class="T2"> (one native form in same slot: </span><span class="T28">‑ne </span><span class="T2">‘plural for humans’)</span></p><p class="P195"><span class="T28">‑mɯ </span><span class="T53">‘</span><span class="T2">plural for animates’, e.g. </span><span class="T28">anadómɯ </span><span class="T2">‘macaws’</span></p><p class="P195"><span class="T28">‑ʔa </span><span class="T53">‘</span><span class="T2">plural for animates in certain pronominal expressions’, e.g. </span><span class="T28">faʔá </span><span class="T2">‘we (inclusive)’</span></p><p class="P195"><span class="T28">‑hi </span><span class="T53">‘</span><span class="T2">plural for inanimates’, e.g. </span><span class="T28">tsikíʔhɯ́hí </span><span class="T2">‘silly thing (lit. ‘empty words’)’</span></p><p class="P195"><span class="T28">‑kɯ </span><span class="T53">‘</span><span class="T2">dual for inanimates’, e.g. </span><span class="T28">hamáakábaakɯ́ </span><span class="T2">‘hammocks (dl.)’</span></p><p class="P195"><span class="T28">‑mɯpi </span><span class="T53">‘</span><span class="T2">dual feminine’, e.g. </span><span class="T28">pʰaimɯpi </span><span class="T2">‘two old women’</span></p><p class="P195"><span class="T28">‑mɯsi </span><span class="T53">‘</span><span class="T2">dual animate’, e.g. </span><span class="T28">anáadómɯsi </span><span class="T2">‘two macaws’</span></p><p class="P212"> </p><p class="P33">4 forms that are not interrelated with other borrowed affixes</p><p class="P195"><span class="T29">‑a‑ </span><span class="T53">‘</span><span class="T6">belonging to’, e.g.</span><span class="T2"> </span><span class="T29">ginomomináagi </span><span class="T6">‘white person (lit. one belonging to the white people)’</span></p><p class="P195"><span class="T28">‑kobɯ </span><span class="T53">‘</span><span class="T2">augmentative’, e.g. </span><span class="T28">keéʔʃékobɯ </span><span class="T2">‘big cow’</span></p><p class="P195"><span class="T28">‑ke </span><span class="T53">‘</span><span class="T2">dative case’, e.g. </span><span class="T37">náagi‑ké </span><span class="T2">‘</span><span class="T7">[she gave a fruit] to her brother’</span></p><p class="P195"><span class="T28">‑ʔi </span><span class="T53">‘</span><span class="T2">verb marker (marking main verb when in combination with auxiliary verb </span><span class="T28">kʰɯ́</span><span class="T2"> ‘do’)’, e.g. </span><span class="T28">kaaʃodʒáʔi kʰɯ́ </span><span class="T2">‘to like, to want’</span></p></td>	\N	128	155	South America	high	0	46	50
2	2013-11-19 20:49:33.75454+01	2013-11-19 20:49:33.754547+01	t	\N	2	Gurindji affixes in Gurindji Kriol	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P5"><span class="T6">Information and examples are from McConvell and Meakins </span><span class="T6">(<a href="__mcconvellgurindji2005__">2005</a>)</span><span class="T6"> and Meakins </span><span class="T6">(<a href="__meakinscasemarking2007__">2007</a>; <a href="__meakinsborrowing2011__">2011</a>)</span><span class="T6">. McConvell and Meakins </span><span class="T6">(<a href="__mcconvellgurindji2005__">2005</a>)</span><span class="T6"> argue that Gurindji Kriol emerged from code‑switching between Gurinji and Kriol, in which English‑based Kriol was the matrix language, and that therefore elements from Gurinji can be considered as borrowings. Only forms for which there are sufficient indications that they are used with native, English‑based stems, are counted here, e.g. </span><span class="T2">the borrowed plural marker </span><span class="T12">‑</span><span class="T31">rrat </span><span class="T14">is not counted here because it “</span><span class="T7">is only found on demonstratives of Gurindji origin” </span><span class="T2">(Meakins <a href="__meakinscasemarking2007__">2007</a>: 386)</span><span class="T2">.</span></p><p class="P12"> </p><p class="P16"><span class="T48">2 markers for core cases </span>(Meakins <a href="__meakinscasemarking2007__">2007</a>: 367)</p><p class="P196"><span class="T28">‑ngku ~‑tu </span><span class="T2">‘ergative’, e.g. </span><span class="T37">diya</span><span class="T7">‑</span><span class="T38">ngku</span><span class="T7"> ‘the deer (threw)’, </span><span class="T37">boi</span><span class="T7">‑</span><span class="T38">ngku </span><span class="T7">‘the boy (was minding)’, </span><span class="T28">gel‑tu</span><span class="T2"> ‘the girl (gave)’</span></p><p class="P196"><span class="T28">‑yu ~ ‑wu ~ ‑u </span><span class="T2">‘dative’</span><span class="T28">, </span><span class="T2">e.g.</span><span class="T28"> </span><span class="T39">Malingu‑wu</span><span class="T7"> ‘to Malingu’, </span><span class="T37">jikinfaul</span><span class="T39">‑u </span><span class="T9">‘for the </span><span class="T7">chicken’</span></p><p class="P47"> </p><p class="P35">4 markers for peripheral cases</p><p class="P196"><span class="T28">‑ngka ~ ‑ta </span><span class="T2">‘locative’</span><span class="T28">, </span><span class="T37">diya</span><span class="T7">‑</span><span class="T38">ngka</span><span class="T7"> ‘on the deer’, </span><span class="T37">tri</span><span class="T38">‑ngka </span><span class="T8">‘on the </span><span class="T7">tree’</span></p><p class="P196"><span class="T30">‑ngkirri ~ ‑jirri </span><span class="T13">‘</span><span class="T2">allative’, e.g. </span><span class="T40">motika</span><span class="T39">‑ngkirri </span><span class="T9">‘to the car’</span></p><p class="P196"><span class="T30">‑nginyi </span><span class="T13">‘</span><span class="T2">ablative’, e.g. </span><span class="T37">klif‑</span><span class="T38">nginyi‑ma </span><span class="T8">(cliff</span><span class="T59">‑ablative‑topic</span><span class="T8">)</span><span class="T7"> ‘off the cliff’, </span><span class="T37">hol</span><span class="T7">‑</span><span class="T38">nginyi‑ma</span><span class="T7"> (hole‑</span><span class="T58">ablative‑topic</span><span class="T7">) ‘from the hole’, </span><span class="T37">juwingjuwing</span><span class="T38">‑nginyi </span><span class="T8">‘from the swing’</span></p><p class="P198"><span class="T2">‑</span><span class="T30">marraj </span><span class="T13">‘</span><span class="T2">comparative</span><span class="T13">’ (no examples of hybrids, not treated by Meakins as a case marker)</span></p><p class="P16"> </p><p class="P35">3 number markers</p><p class="P198"><span class="T2">‑</span><span class="T30">kujarra</span><span class="T2"> ‘dual’</span><span class="T30"> </span><span class="T13">(no examples of hybrids)</span></p><p class="P195"><span class="T12">‑</span><span class="T31">walija </span><span class="T14">‘</span><span class="T12">paucal’</span><span class="T14">, e.g. </span><span class="T40">hook</span><span class="T10">‑</span><span class="T39">walija </span><span class="T9">‘a few hooks’, </span><span class="T37">bi</span><span class="T38">‑walija </span><span class="T8">‘a few bees’</span></p><p class="P198"><span class="T2">‑</span><span class="T30">purrupurru</span><span class="T2">, ‑</span><span class="T30">nyarrara</span><span class="T2">, ‑</span><span class="T30">nganyjuk</span><span class="T2"> ‘associative plural’ (no examp</span><span class="T13">les of hybrids)</span></p><p class="P213"> </p><p class="P218">2 nominalizers</p><p class="P198"><span class="T2">‑</span><span class="T30">ny</span><span class="T2"> ‘nominalizer’ (no examples of hybrids)</span></p><p class="P195"><span class="T12">‑</span><span class="T31">kaji </span><span class="T14">‘</span><span class="T12">agentive noun’</span><span class="T14">, e.g. </span><span class="T37">toktok</span><span class="T7">‑</span><span class="T38">kaji </span><span class="T8">(talk‑</span><span class="T59">agentive</span><span class="T8">) ‘recorder’, </span><span class="T37">mok</span><span class="T7">‑</span><span class="T38">kaji </span><span class="T8">‘cigarette lighter’</span></p><p class="P10"> </p><p class="P10"><span class="T48">4 </span><span class="T49">nominal suffixes affecting information structure</span><span class="T82"> (</span>out of 5 such forms)</p><p class="P195"><span class="T12">‑</span><span class="T31">rni </span><span class="T14">‘o</span><span class="T12">nly’</span><span class="T14">, e.g. </span><span class="T40">leg</span><span class="T10">‑</span><span class="T39">ta‑rni</span><span class="T7"> (leg‑</span><span class="T62">locative</span><span class="T7">‑only) ‘right through his leg’</span></p><p class="P195"><span class="T2">‑</span><span class="T30">ma </span><span class="T13">‘</span><span class="T2">topic’, e.g.</span><span class="T30"> </span><span class="T37">klif‑</span><span class="T38">nginyi‑ma </span><span class="T8">(cliff</span><span class="T59">‑ablative‑topic</span><span class="T8">)</span><span class="T7"> ‘off the cliff’, </span><span class="T40">mami</span><span class="T10">‑</span><span class="T39">ngku‑ma</span><span class="T7"> (mother‑</span><span class="T58">ergative‑topic</span><span class="T7">) ‘the mother (got)’</span></p><p class="P195"><span class="T30">‑rla </span><span class="T13">‘focus’, e.g. </span><span class="T40">hiya</span><span class="T10">‑</span><span class="T39">rla </span><span class="T9">‘here’</span></p><p class="P198"><span class="T2">‑</span><span class="T30">rayinyj </span><span class="T13">‘</span><span class="T2">alone</span><span class="T13">’ (no examples of hybrids, not treated by Meakins as belonging to this set of forms)</span></p><p class="P213"> </p><p class="P218">2 proprietive/privative suffixes</p><p class="P195"><span class="T12">‑</span><span class="T31">yawung </span><span class="T14">‘</span><span class="T12">proprietive’</span><span class="T31">, </span><span class="T7">e.g. </span><span class="T37">motika</span><span class="T38">‑yawung </span><span class="T8">‘their car’, </span><span class="T37">femli</span><span class="T38">‑yawung </span><span class="T8">‘his family’</span></p><p class="P195"><span class="T12">‑</span><span class="T31">murlung </span><span class="T14">‘</span><span class="T12">privative adjectivizer’, e.g. </span><span class="T37">kuloj</span><span class="T7">‑</span><span class="T38">murlung </span><span class="T8">‘naked’</span></p><p class="P213"> </p><p class="P218">2 non-interrelated suffixes</p><p class="P195"><span class="T12">‑</span><span class="T31">kari </span><span class="T14">‘</span><span class="T12">another’</span><span class="T14">, e.g. </span><span class="T37">mor</span><span class="T7">‑</span><span class="T38">kari </span><span class="T8">‘more’, </span><span class="T40">najan</span><span class="T39">‑kari </span><span class="T9">‘another’</span></p><p class="P198"><span class="T2">‑</span><span class="T30">k</span><span class="T2">, ‑</span><span class="T30">pijik </span><span class="T2">‘inchoative, attaching to nouns and verbs’</span><span class="T30"> </span><span class="T13">(no examples of hybrids)</span></p></td>	\N	54	52	Australia & New Guinea	high	0	17	19
3	2013-11-19 20:49:33.799541+01	2013-11-19 20:49:33.799545+01	t	\N	4	Russian affixes in Copper Island Aleut	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10"><span class="T69">Information and examples are from Golovko and Vakhtin </span>(<a href="__golovkoaleut1990__">1990</a>) and Sekerina (<a href="__sekerinacopper1994__">1994</a>: 22–29)<span class="T69">, the most complete (and only English) descriptions. Some additional, and partially alternative description is given by Thomason </span><span class="T69">(<a href="__thomasonmednyj1997__">1997</a>)</span><span class="T69">. The situation may be summarized as “the derivational and nominal inflection system of CIA [i.e. Copper Island Aleut, FS] is entirely of Aleut origin, but the verbal inflectional system is that of Russian” </span>(Sekerina <a href="__sekerinacopper1994__">1994</a>: 22)<span class="T69">. A total of 15 borrowed affixes are productively used with native stems.</span></p><p class="P11"> </p><p class="P9"><span class="T52">6 present tense subject suffixes</span><span class="T85"> </span>(Golovko and Vakhtin <a href="__golovkoaleut1990__">1990</a>: 98, 104, 107–112;  Sekerina <a href="__sekerinacopper1994__">1994</a>: 22–29)</p><p class="P200"><span class="T2">‑</span><span class="T28">yu </span><span class="T2">‘first singular’, e.g. </span><span class="T28">qɑ̄=yu </span><span class="T2">‘I eat’, </span><span class="T28">sū=yu </span><span class="T2">‘I take’</span></p><p class="P200"><span class="T28">‑iŝ </span><span class="T2">‘second singular’, e.g. </span><span class="T28">qɑ̄=iŝ </span><span class="T2">‘you eat’, </span><span class="T28">sū=iŝ </span><span class="T2">‘you take’</span></p><p class="P200"><span class="T28">‑it </span><span class="T42">‘third singular’</span><span class="T2">, e.g. </span><span class="T28">qɑ̄=it </span><span class="T2">‘he/she/it eats’, </span><span class="T28">sū=it </span><span class="T2">‘he/she/it takes’, </span><span class="T28">cali=it</span><span class="T2"> ‘he fishes’ </span></p><p class="P200"><span class="T28">‑im </span><span class="T2">‘first plural’, e.g. </span><span class="T28">qɑ̄=im </span><span class="T2">‘we eat’, </span><span class="T28">sū=im </span><span class="T2">‘we take’</span></p><p class="P200"><span class="T28">‑iti </span><span class="T2">‘second plural’, e.g. </span><span class="T28">qɑ̄=iti </span><span class="T2">‘you (pl) eat’, </span><span class="T28">sū=iti </span><span class="T2">‘you (pl) take’</span></p><p class="P200"><span class="T28">‑yut ~ ‑yat </span><span class="T2">‘third plural’, e.g. </span><span class="T28">qɑ̄=yut </span><span class="T2">‘they eat’, </span><span class="T28">sū=yut </span><span class="T2">‘they take’</span></p><p class="P11"> </p><p class="P9"><span class="T52">6 past tense inflectional suffixes</span><span class="T85"> </span>(Sekerina <a href="__sekerinacopper1994__">1994</a>: 22–29;  Golovko and Vakhtin <a href="__golovkoaleut1990__">1990</a>: 108)</p><p class="P200"><span class="T28">‑l </span><span class="T2">‘past tense’, e.g. </span><span class="T28">ukuxtɑ̄=l </span><span class="T2">‘he saw’, </span><span class="T28">ayxacɑ̄=l=a=ya </span><span class="T2">‘I started’, </span><span class="T28">ayxɑ̄=l=ya </span><span class="T2">‘I travelled’, </span><span class="T28">ukuxtɑ̄=l </span><span class="T2">‘I he saw’, </span><span class="T28">ukuxtɑ̄=l=i </span><span class="T2">‘they saw’, </span><span class="T28">sū=l </span><span class="T2">‘he took’, </span><span class="T28">sū=l=i </span><span class="T2">‘they took</span></p><p class="P200"><span class="T28">‑i </span><span class="T2">‘past plural’, e.g. </span><span class="T28">anĝaĝí=l=i=mi </span><span class="T2">‘we lived’, </span><span class="T28">ú=l=i=mi</span><span class="T2"> ‘we were’, </span><span class="T28">ukuxtɑ̄=l=i </span><span class="T2">‘they saw’, </span><span class="T28">sū=l </span><span class="T2">‘he took’, </span><span class="T28">sū=l=i </span><span class="T2">‘they took</span></p><p class="P200"><span class="T28">‑ya </span><span class="T2">‘first singular’, e.g. </span><span class="T28">ayxacɑ̄=l=a=ya </span><span class="T2">‘I started’, </span><span class="T28">ayxɑ̄=l=ya </span><span class="T2">‘I travelled’, </span><span class="T28">ukuxtɑ̄=l </span><span class="T2">‘he saw’</span></p><p class="P200"><span class="T28">‑ti </span><span class="T2">‘second singular’, e.g. </span><span class="T28">mɑ̄=l=ti </span><span class="T2">‘you did’,</span></p><p class="P200"><span class="T28">‑mi </span><span class="T2">‘first plural’, e.g. </span><span class="T28">anĝaĝí=l=i=mi </span><span class="T2">‘we lived’, </span><span class="T28">ú=l=i=mi</span><span class="T2"> ‘we were’</span></p><p class="P200"><span class="T28">‑vi </span><span class="T2">‘second plural’ (no examples of hybrids)</span></p><p class="P11">(third person is unmarked)</p><p class="P11"> </p><p class="P10"><span class="T50">1 optional subject feminine gender suffix</span><span class="T69"> </span>(Golovko and Vakhtin <a href="__golovkoaleut1990__">1990</a>: 108–109)</p><p class="P200"><span class="T28">‑a</span><span class="T2">, used after borrowed past tense marker </span><span class="T28">‑l</span><span class="T42">, e.g.</span><span class="T2"> </span><span class="T28">ayxacɑ̄=l=a=ya </span><span class="T2">‘I started’ </span></p><p class="P53"> </p><p class="P34">1 infinitive marker</p><p class="P195"><span class="T29">‑t’ </span><span class="T43">‘infinitive’, </span><span class="T6">suffixed to main verbs for plural formation which combine with a borrowed auxiliary, e.g. </span><span class="T29">taana ni‑buud‑ish ukuu‑t’ </span><span class="T6">‘You won’t see the land’ </span><span class="T2">(Sekerina <a href="__sekerinacopper1994__">1994</a>: 25)</span><span class="T6">. This marker may be considered part of finite verbal inflection and thus as being morphosyntactically related to the other morphology.</span></p><p class="P11"> </p><p class="P11"><span class="T48">1 negative verbal prefix</span> (Golovko and Vakhtin <a href="__golovkoaleut1990__">1990</a>: 102, 104, 109)</p><p class="P200"><span class="T28">ni</span><span class="T2">‑ ‘negative’, e.g. </span><span class="T28">ni=túta=qaĝī=l</span><span class="T2"> ‘he would not listen’, </span><span class="T28">ni=sūy </span><span class="T2">‘don’t take!’</span><span class="T15"> </span></p></td>	\N	73	102	Eurasia	high	0	14	15
4	2013-11-19 20:49:33.823677+01	2013-11-19 20:49:33.823683+01	t	\N	5	Mongolian affixes in Sakha	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10"><span class="T88">Information and examples are from Pakendorf </span><span class="T88">(<a href="__pakendorfcopied2010__">2010</a>)</span><span class="T88">. Pakendorf </span><span class="T88">(<a href="__pakendorfcopied2010__">2010</a>)</span><span class="T88">, analyzes data from </span><span class="T89">Kałużyński </span><span class="T89">(<a href="__kaluzynskimongolische1962__">1962</a>)</span><span class="T89">, Korkina et al.</span><span class="T88"> </span><span class="T89">(<a href="__korkinagrammatika1982__">1982</a>)</span><span class="T88"> </span><span class="T69">and from her own corpus and elicited data. She concludes that there are 14 affixes borrowed from Mongolic languages that are “</span>currently still relatively productive<span class="T69">” and used on native Turkic stems. A few other borrowed affixes are attested, but these are “</span>previously productive, or marginally productive”. The following 14 are the ones that are characterized as “currently still relatively productive” by <span class="T88">Pakendorf </span><span class="T88">(<a href="__pakendorfcopied2010__">2010</a>)</span> (s<span class="T69">ee also Pakendorf </span><span class="T69">(<a href="__pakendorfcomparison2012__">2012</a>)</span><span class="T69">, who counts more borrowed affixes because she accepts </span><span class="T89">Korkina et al.’s</span><span class="T88"> </span><span class="T89">(<a href="__korkinagrammatika1982__">1982</a>)</span><span class="T88"> assertion of the productivity of additional affixes for which no hybrid formations are attested in her own data</span><span class="T69">)</span>.</p><p class="P10"> </p><p class="P34">5 deverbal nominalizers</p><p class="P195"><span class="T2">‑</span><span class="T28">AːččI</span><span class="T2"> (also functions as habitual marker), e.g. </span><span class="T28">tut‑aːččï </span><span class="T2">‘(he) build (it)’</span></p><p class="P195"><span class="T2">‑</span><span class="T28">AːhIn</span><span class="T2">, e.g. </span><span class="T28">ottoː‑hun</span><span class="T2"> ‘the hay‑making’</span></p><p class="P195"><span class="T2">‑</span><span class="T28">BIl</span><span class="T2">, e.g. </span><span class="T28">öröbül</span><span class="T2"> ‘Sunday’ (from </span><span class="T28">öröː‑</span><span class="T2"> ‘to rest a day’)</span></p><p class="P195"><span class="T2">‑</span><span class="T28">lAŋ</span><span class="T2">, e.g. </span><span class="T28">kisteleŋ</span><span class="T2"> ‘secret’ (from </span><span class="T28">kisteː</span><span class="T2">‑ ‘hide’)</span></p><p class="P195"><span class="T2">–</span><span class="T28">ltA</span><span class="T2">, e.g. </span><span class="T28">terilte</span><span class="T2"> ‘organization’ (from </span><span class="T28">terij</span><span class="T2">‑ ‘equip, organize’)</span></p><p class="P212"> </p><p class="P34">4 deverbal adjectivizers</p><p class="P195"><span class="T2">‑</span><span class="T28">GAj</span><span class="T2">, e.g. </span><span class="T28">bïtarχaj</span><span class="T2"> ‘small’ (from </span><span class="T28">bïtarïj</span><span class="T2">‑ ‘crumble, smash, pulverize’)</span></p><p class="P195"><span class="T2">‑</span><span class="T28">ɣAr/‑gIr</span><span class="T2">, e.g. </span><span class="T28">laspaɣar</span><span class="T2"> ‘broad’ (from </span><span class="T28">laspaj</span><span class="T2">‑ ‘be/seem too broad and fleshy’)</span></p><p class="P195"><span class="T28">‑(I)mtAɣaj</span><span class="T2">, no attestations in Pakendorf’s corpus but ‘productive’ according to </span><span class="T90">(Kałużyński <a href="__kaluzynskimongolische1962__">1962</a>: 92;  Korkina et al. <a href="__korkinagrammatika1982__">1982</a>: 165)</span></p><p class="P195"><span class="T2">‑</span><span class="T28">mtIA</span><span class="T2">, no attestations in Pakendorf’s corpus but nevertheless “mainly found with Turkic stems” </span><span class="T2">(Pakendorf <a href="__pakendorfcopied2010__">2010</a>)</span><span class="T2">, and “relatively productive” according to Korkina et al. </span><span class="T2">(<a href="__korkinagrammatika1982__">1982</a>: 165)</span></p><p class="P212"> </p><p class="P34">5 non-interrelated suffixes</p><p class="P195"><span class="T2">‑</span><span class="T28">rɣAː </span><span class="T2">‘</span><span class="T6">verbalizer’</span><span class="T2">, e.g. </span><span class="T28">küːhürgeː</span><span class="T2"> ‘consider oneself strong’ (from </span><span class="T28">küːs</span><span class="T2"> ‘strength’)</span></p><p class="P195"><span class="T2">‑</span><span class="T28">TA </span><span class="T2">‘</span><span class="T6">multiplicative derivative of numerals’, e.g. </span><span class="T28">biːr‑diː‑te </span><span class="T2">‘once’</span></p><p class="P195"><span class="T28">‑(I)ččI</span><span class="T2"> ‘</span><span class="T6">deverbal adverbializer’</span><span class="T2"> (source form is a Mongolic imperfective converb), e.g. </span><span class="T28">ergičči</span><span class="T2"> ‘roundabout’ (from </span><span class="T28">ergij</span><span class="T2">‑ ‘return, turn around’)</span></p><p class="P195"><span class="T2">‑</span><span class="T28">t(tAr) </span><span class="T2">‘</span><span class="T6">plural’</span><span class="T2">, e.g. </span><span class="T28">ïaraχa‑ttar </span><span class="T2">‘the heavy ones’</span></p><p class="P195"><span class="T2">‑</span><span class="T28">Aːt</span><span class="T2">: ‘</span><span class="T6">immediate precedence converb’</span><span class="T2">, e.g. </span><span class="T28">orgut‑aːt </span><span class="T2">‘as soon as it boiled’</span></p></td>	\N	46	120	Eurasia	high	0	9	14
5	2013-11-19 20:49:33.843345+01	2013-11-19 20:49:33.843353+01	t	\N	6	Romanian affixes in Kalderash Romani	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P11">Information and examples are from Boretzky (<a href="__boretzkyromani1994__">1994</a>) and Boretzky and Igla (<a href="__boretzkymorphologische1991__">1991</a>). Kalderash Romani has also borrowed morphemes from Greek and from various Slavic languages, but in each case fewer than from Romanian.</p><p class="P10"> </p><p class="P33">1 adjectivizer</p><p class="P195"><span class="T28">‑icios</span><span class="T2">, e.g. </span><span class="T28">kalits̆oso</span><span class="T2"> ‘blackish’</span></p><p class="P10"> </p><p class="P33">1 diminutive</p><p class="P195"><span class="T28">‑uljeco </span><span class="T2">(and many phonologically related allomorphs), e.g. </span><span class="T28">foruljeco</span><span class="T2"> ‘little town’ (example from Kalderash spoken in Serbia</span><span class="T6">)</span></p><p class="P10"> </p><p class="P33">6 agent nouns/professions, including feminine</p><p class="P195"><span class="T28">‑aš(i)</span><span class="T2"> (could be from Slavic languages), e.g. </span><span class="T28">tsir‑aš </span><span class="T2">‘circus man’</span></p><p class="P195"><span class="T28">‑tori</span><span class="T2">, e.g. </span><span class="T28">diiliba‑tori</span><span class="T2"> ‘singer’</span></p><p class="P195"><span class="T28">‑anka, </span><span class="T2">e.g. </span><span class="T28">amerikánka</span><span class="T2"> ‘American woman’ (example from Kalderash of France)</span></p><p class="P195"><span class="T28">‑àsa</span><span class="T2">, e.g. </span><span class="T28">amperacása</span><span class="T2"> ‘empress’ (example from Kalderash of France, </span><span class="T28">amperac‑ </span><span class="T2">could also be Romanian)</span></p><p class="P195"><span class="T28">‑ojka</span><span class="T2"> (no examples of hybrids)</span></p><p class="P195"><span class="T28">‑twára</span><span class="T2">, e.g. </span><span class="T28">farmec̆twára</span><span class="T2"> ‘witch’ (example from Kalderash of France)</span></p><p class="P10"> </p><p class="P33">1 ordinal number formation</p><p class="P195"><span class="T28">‑leä</span><span class="T2">, e.g. </span><span class="T28">dúito‑leä </span><span class="T2">‘for the second time’ (example from Kalderash of Sweden)</span></p><p class="P10"> </p><p class="P33">1 indefinite pronoun formation prefix</p><p class="P195"><span class="T28">vare‑</span><span class="T2">, e.g. </span><span class="T28">vareko </span><span class="T2">‘anybody’ (example from Kalderash spoken in Serbia)</span></p><p class="P10"> </p><p class="P33">1 privative verbal derivational prefix</p><p class="P197"><span class="T28">des‑</span><span class="T2">, e.g. </span><span class="T28">dezmekljol </span><span class="T2">‘melt’ (example from Kalderash spoken in Serbia</span><span class="T6">)</span></p></td>	\N	13	125	Eurasia	high	0	6	11
6	2013-11-19 20:49:33.882595+01	2013-11-19 20:49:33.882602+01	t	\N	7	Sakha affixes in Sebjan‑Küöl Ėven	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from <span class="T69">Pakendorf </span><span class="T69">(<a href="__pakendorfcomparison2012__">2012</a>)</span><span class="T69">, see also </span>Pakendorf <span class="T69">(<a href="__pakendorfintensive2009__">2009</a>; <a href="__pakendorfcopied2010__">2010</a>)</span><span class="T69">, who counts fewer borrowed affixes because of different criteria. The ones given here are all attested with native stems, even though examples of hybrid formations are only given for a few here. Note that there is some formal overlap in the person-number markers of the three different paradigms.</span></p><p class="P10"> </p><p class="P33">4 mood markers</p><p class="P306"><span class="T28">‑jAktAːk </span>‘necessitative’</p><p class="P306"><span class="T28">‑dAg ~ ‑dAk </span>‘assertive’</p><p class="P306"><span class="T28">‑A ~ ‑Ar </span>‘indicative present tense’, e.g. <span class="T28">ọrọn em‑e‑j‑er </span>(reindeer/come‑<span class="T53">epenthetic</span>‑<span class="T53">connective‑present.participle</span>) ‘the reindeer are coming’</p><p class="P306"><span class="T28">‑jAk ~ ‑jAːg </span>‘hypothetical mood’</p><p class="P10"> </p><p class="P307"><span class="T48">5 subject markers for necessitative mood and indicative mood</span> (out of 6 such subject markers), combining with <span class="T28">‑jAktAːk </span>‘necessitative’ and <span class="T28">‑A ~ ‑Ar </span>‘indicative present tense’. Third person singular is unmarked.</p><p class="P306"><span class="T28">‑pIn ~ ‑bIn </span>‘first singular’</p><p class="P306"><span class="T28">‑kIn ~ ‑gIn </span>‘second singular’, e.g. <span class="T28">em‑e‑j‑egin </span>(come‑<span class="T53">epenthetic‑connective‑present.2sg) </span>‘you come’, <span class="T28">ọrọn em‑e‑j‑er </span>(reindeer/come‑<span class="T53">epenthetic</span>‑<span class="T53">connective‑present.participle</span>) ‘the reindeer are coming’</p><p class="P306"><span class="T28">‑pIt ~ ‑bIt </span>‘first plural’</p><p class="P306"><span class="T28">‑kIt ~ ‑kI‑hnAn </span>‘second plural’, e.g. <span class="T28">huː ọlọk ụtal‑a‑jaktaːkkịt </span>(2<span class="T53">pl/emphasis</span>/understand‑<span class="T53">epenthetic‑necessitative.2pl)</span> ‘you have to understand’. (Note that the form <span class="T28">‑hnAn </span>used by one speaker on various occasions is native <span class="T88">Ė</span><span class="T69">ven and that the borrowed element </span><span class="T29">‑</span><span class="T28">kIt </span>is truncated in this form.)</p><p class="P306"><span class="T28">‑llAr </span>‘third plural’<span class="T28"> </span>(Note that in the necessitative mood, native Ėven <span class="T28">‑A‑l </span>‘third plural’ is used.)</p><p class="P308"> </p><p class="P2"><span class="T3">5 subject markers for assertive mood</span><span class="T2"> (all 5 borrowed), combining with </span><span class="T28">‑dAg ~ ‑dAk </span><span class="T2">‘assertive’. No second person plural form occurs in the corpus, since the assertive mood gives a strong nuance of emphasis to the assertion that would not be used with reference to the addressee.</span></p><p class="P306"><span class="T28">‑Im </span>‘first singular’, e.g. <span class="T28">haː‑j‑bat</span><span class="T41"> </span><span class="T28">bọl‑lagịm </span>(know‑<span class="T53">connective‑negative/auxiliary‑assertive.1sg) </span>‘I did not know’</p><p class="P306"><span class="T28">‑Iŋ </span>‘second singular’, e.g. <span class="T28">neː‑j‑er bọl</span><span class="T41">‑</span><span class="T28">lagịŋ </span>(put<span class="T53">‑connective‑present.participle/auxiliary‑assertive.2sg</span>) ‘you put (it)’</p><p class="P306"><span class="T28">‑A </span>‘third singular’</p><p class="P306"><span class="T28">‑pIt </span>‘first plural’</p><p class="P306"><span class="T28">‑tArA </span>‘third plural’</p><p class="P308"> </p><p class="P307"><span class="T48">5 subject markers for hypothetical mood</span> (all 5 borrowed), combining with <span class="T28">‑jAk ~ ‑jAːg </span>‘hypothetical mood’. First and second person plural forms do not occur in the corpus.</p><p class="P306"><span class="T28">‑pIn </span>‘first singular’</p><p class="P306"><span class="T28">‑kIn </span>‘second singular’</p><p class="P306"><span class="T28">‑In ~ ‑n </span>(with deletion of final <span class="T28">‑k</span> of<span class="T28"> ‑jAk</span>) ‘third singular’, e.g. <span class="T28">em-u-jen </span>(come-<span class="T53">causative-hypothetical.3sg</span>) ‘(he) might bring’</p><p class="P306"><span class="T28">‑tArIn </span>‘third plural’</p><p class="P306"><span class="T28">‑kA </span>‘impersonal’</p><p class="P307"> </p><p class="P33">1 non‑interrelated suffix</p><p class="P195"><span class="T2">‑</span><span class="T28">Is </span><span class="T2">‘ordinal numeral formation marker’, e.g. </span><span class="T28">dig‑is </span><span class="T2">‘forth’</span></p><p class="P10"> </p><p class="P2"><span class="T2">Note that two further Sakha affixes are found in the corpus, but only rarely with Ėven stems, or in contexts where Sakha might be the matrix language, in which Ėven words receive Sakha inflection. Therefore they are not counted here. These are (i) -</span><span class="T28">An</span><span class="T2"> ‘perfective (sequential) converb’, e.g. </span><span class="T28">ič-e-j-en </span><span class="T2">(see-</span><span class="T53">epenthetic-connective-perfective.converb</span><span class="T2">) ‘yes, they do see’; and (ii) -</span><span class="T28">BAt</span><span class="T2"> ‘negative present’, which is paradigmatic opposition to -</span><span class="T28">Ar</span><span class="T2"> ‘indicative present tense’, e.g. </span><span class="T28">haː-j-bat </span><span class="T2">(know-</span><span class="T53">connective-negative)</span><span class="T2"> ‘(I) did not know’.</span></p></td>	\N	153	46	Eurasia	high	0	21	22
7	2013-11-19 20:49:33.90163+01	2013-11-19 20:49:33.901638+01	t	\N	8	Uzbek affixes in Northern Tajik	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P11">Information and examples are from Doerfer (<a href="__doerferturkische1967__">1967</a>), who mainly analyzes data from Rastorgueva (<a href="__rastorguevaopyt1964__">1964</a>), see also Boretzky (<a href="__boretzkymorphologische2004__">2004</a>: 1651). Information on the etymology of stems from Don Stilo (personal communication 2013).</p><p class="P44"> </p><p class="P34">2 nominalizers</p><p class="P200"><span class="T28">‑či ‘</span><span class="T2">agent noun’, e.g. </span><span class="T28">χizmat‑či </span><span class="T2">‘servant’, “productive” according to Doerfer </span><span class="T2">(<a href="__doerferturkische1967__">1967</a>: 54)</span></p><p class="P200"><span class="T28">‑lik </span><span class="T2">‘abstract noun’, e.g. </span><span class="T28">χoǧa‑lik </span><span class="T2">‘farm, estate’</span></p><p class="P219"> </p><p class="P11"><span class="T48">5 case suffixes</span> (out of 6 Northerern Tajik case suffixes). Some of the borrowed case markers seem to be used alternatively with native case markers, the genitive/accusative case is the only case for which there is only a native, and no borrowed case marker (Doerfer <a href="__doerferturkische1967__">1967</a>: 62).</p><p class="P200"><span class="T28">‑ga </span><span class="T2">‘dative’, e.g. </span><span class="T28">χåna‑ga </span><span class="T2">‘to the house’, used alternatively to </span><span class="T28">χåna‑va</span><span class="T2">, with a native Persian case marker.</span><span class="T28"> ‑ga </span><span class="T2">is maybe only used with Persian verbs and nominalized verbs, but there is a clear tendency that it is on the rise </span><span class="T2">(Doerfer <a href="__doerferturkische1967__">1967</a>: 62)</span><span class="T2">.</span></p><p class="P200"><span class="T28">‑dan </span><span class="T2">‘ablative’, e.g. </span><span class="T28">yakom klasašdan </span><span class="T42">(first/class-</span><span class="T53">3sg.possessor</span><span class="T42">-</span><span class="T53">ablative) </span><span class="T2">‘from the first class/grade’ </span><span class="T2">(Doerfer <a href="__doerferturkische1967__">1967</a>: 54)</span></p><p class="P200"><span class="T28">‑nda</span><span class="T2"> ~ </span><span class="T28">‑da</span><span class="T2"> ‘locative’, e.g. </span><span class="T28">inǧanda </span><span class="T2">‘here’ </span><span class="T2">(Doerfer <a href="__doerferturkische1967__">1967</a>: 54)</span></p><p class="P200"><span class="T28">‑gača </span><span class="T2">‘terminative’, e.g. </span><span class="T28">tå bist‑u‑haftom sål‑gača</span><span class="T2"> ‘up to the 26th year’ </span><span class="T2">(Doerfer <a href="__doerferturkische1967__">1967</a>: 54)</span></p><p class="P200"><span class="T28">‑dak </span><span class="T2">‘equative/comparative’ </span><span class="T2">(Doerfer <a href="__doerferturkische1967__">1967</a>: 16, 56)</span><span class="T2">, no examples given, but described as part of a borrowed paradigm of case markers </span><span class="T2">(Doerfer <a href="__doerferturkische1967__">1967</a>: 62)</span></p><p class="P214"> </p><p class="P34">2 derivational suffixes combining with numerals</p><p class="P200"><span class="T28">‑gina </span><span class="T2">‘quantitative limiter’, e.g. </span><span class="T28">yak som‑gina </span><span class="T2">‘one Ruble more [e.g. more expensive, cheaper]’</span></p><p class="P200"><span class="T28">‑la</span><span class="T2">, </span><span class="T28">‑lamiš</span><span class="T2"> ‘collective numeral formation’, e.g. </span><span class="T28">duttalamå </span><span class="T2">‘both of us’, </span><span class="T28">čårtalamiš</span><span class="T2"> ‘(with) all four’</span></p><p class="P214"> </p><p class="P34">2 suffixes not related to other borrowed morphology</p><p class="P200"><span class="T28">‑ča </span><span class="T2">‘adverbializer’, e.g. </span><span class="T28">urus‑ča </span><span class="T2">‘in Russian’</span></p><p class="P200"><span class="T28">‑råq </span><span class="T2">‘comparative’, used together with the native Tajik comparative suffix, e.g. </span><span class="T28">tez‑tar‑råq</span><span class="T2"> or </span><span class="T28">tez‑råq‑tar </span><span class="T2">‘faster’</span></p><p class="P10"> </p><p class="P3"><span class="T2">Doerfer </span><span class="T2">(<a href="__doerferturkische1967__">1967</a>: 18, 19, 25, 39, 56)</span><span class="T2"> mentions four other cases of morphological borrowing. They are not counted here for the following reasons: Two of these appear to be free forms, although maybe derived from Turkic affixes: </span><span class="T28">ikin </span><span class="T2">‘dubitative’ and </span><span class="T28">či </span><span class="T2">‘emotional particle’. The remaining two are explicitly described as combining only with Turkic stems: </span><span class="T28">inči </span><span class="T2">‘ordinal number formation’ and </span><span class="T28">miš</span><span class="T2"> ‘verbal noun formation’.</span></p></td>	\N	135	59	Eurasia	mid	1	9	11
8	2013-11-19 20:49:33.917954+01	2013-11-19 20:49:33.917962+01	t	\N	10	Sanskrit affixes in Indonesian	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Jones (<a href="__verhaarloanwords1984__">1984</a>), Verhaar (<a href="__purwoaffixation1984__">1984</a>), Tadmor <span class="T69">(<a href="__tadmorloanwords20091__">2009</a>)</span><span class="T69"> and personal communications from Uri Tadmor, David Gil, John Bowden, and a number of Indonesians working at the Jakarta Field Station of the Max Planck Institute for Evolutionary Anthropology. Jones </span>(<a href="__verhaarloanwords1984__">1984</a>: 7)<span class="T69"> states that “some half dozen affixes derived from Sanskrit are productive; most have come into vogue within the last few decades”. All of these are also mentioned by </span>Verhaar (<a href="__purwoaffixation1984__">1984</a>: 20–21), who gives many more. Below only affixes that are attested with non‑Sanskrit stems are given.</p><p class="P10"> </p><p class="P11"><span class="T48">16 derivational prefixes </span>that are attested with non‑Sanskrit stems (most of them native Indonesian)</p><p class="P195"><span class="T29">adi‑ </span><span class="T6">‘super’, according to Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 20–21)</span><span class="T6"> an affix of Sanskrit origin, </span><span class="T2">e.g. </span><span class="T29">adibintang </span><span class="T6">‘superstar’, </span><span class="T29">adikuasa </span><span class="T6">‘superpower’ (the stem is also borrowed from Sanskrit, but this noun was formed in Indonesian)</span></p><p class="P195"><span class="T29">antar‑</span><span class="T6"> ‘inter’, according to Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 20–21)</span><span class="T6"> an affix of Sanskrit origin, has become productive according to</span><span class="T2"> Jones </span><span class="T2">(<a href="__verhaarloanwords1984__">1984</a>: 7)</span><span class="T6">. This is possibly a free from rather than a prefix in Indonesian</span><span class="T29">, </span><span class="T2">e.g. </span><span class="T29">antar suku </span><span class="T6">‘intertribal’</span><span class="T29">, antar kelompok </span><span class="T6">‘inter‑group’</span></p><p class="P195"><span class="T29">catur‑ </span><span class="T6">‘four’, according to Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 20–21)</span><span class="T6"> an affix of Sanskrit origin,</span><span class="T29"> </span><span class="T2">e.g. </span><span class="T29">caturwulan </span><span class="T6">‘four monthly’</span></p><p class="P195"><span class="T29">dwi‑</span><span class="T6"> ‘two’, according to Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 20–21)</span><span class="T6"> an affix of Sanskrit origin, </span><span class="T2">e.g. </span><span class="T29">dwifungsi</span><span class="T6"> ‘bifunctional’ (stem is Dutch, but shows that the prefix is productive)</span></p><p class="P195"><span class="T29">eka‑</span><span class="T6"> ‘one’, according to Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 20–21)</span><span class="T6"> an affix of Sanskrit origin, </span><span class="T2">e.g. </span><span class="T29">eka bahasa </span><span class="T6">‘monolingual’</span></p><p class="P195"><span class="T29">maha‑ </span><span class="T6">‘very (important person)’, according to Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 20–21)</span><span class="T6"> an affix of Sanskrit origin,</span><span class="T29"> </span><span class="T2">e.g. </span><span class="T29">mahabesar</span><span class="T6"> ‘almighty’,</span><span class="T2"> </span><span class="T28">maha pelit</span><span class="T2"> (examples provided by Uri Tadmor, personal communication, 2011). This form can apparently be used both as a free form and as a prefix.</span></p><p class="P195"><span class="T29">nir‑ </span><span class="T6">‘without, free from’,</span><span class="T29"> </span><span class="T2">e.g. </span><span class="T29">nirkabel </span><span class="T6">‘wireless’, </span><span class="T29">nirlaba </span><span class="T6">‘non‑profit’. Has become productive according to</span><span class="T2"> Jones </span><span class="T2">(<a href="__verhaarloanwords1984__">1984</a>: 7)</span><span class="T2">.</span></p><p class="P195"><span class="T29">pasca‑ </span><span class="T6">‘post’, </span><span class="T2">e.g. </span><span class="T28">pasca sarjana</span><span class="T2"> ‘postgraduate’</span></p><p class="P195"><span class="T29">pra‑ </span><span class="T6">‘pre’, only small number of words formed with these (and other affixes, which are part of the learned vocabulary, according to Mueller </span><span class="T6">(<a href="__kayeindonesian2007__">2007</a>: 1220)</span><span class="T6">, according to Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 20–21)</span><span class="T6"> an affix of Sanskrit origin, has become productive according to</span><span class="T2"> Jones </span><span class="T2">(<a href="__verhaarloanwords1984__">1984</a>: 7)</span><span class="T6">, </span><span class="T2">e.g. </span><span class="T28">prabayar</span><span class="T2"> ‘prepaid’, </span><span class="T28">pra sarjana</span><span class="T2"> ‘undergraduate’ (there are many more examples)</span></p><p class="P195"><span class="T29">purna‑ </span><span class="T6">‘after’, according to Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 20–21)</span><span class="T6"> an affix of Sanskrit origin,</span><span class="T29"> </span><span class="T2">e.g. </span><span class="T29">purna jual </span><span class="T6">‘after sales service’</span><span class="T29"> purnajabatan </span><span class="T6">‘previous position’ (from </span><span class="T29">jabatan </span><span class="T6">‘position, post, function’)</span></p><p class="P195"><span class="T29">sapta‑ </span><span class="T6">‘seven’, according to Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 20–21)</span><span class="T6"> an affix of Sanskrit origin</span><span class="T29">, </span><span class="T2">e.g. </span><span class="T29">sapta pesona </span><span class="T6">‘having seven charms’</span></p><p class="P195"><span class="T29">serba‑ </span><span class="T6">‘multipurpose’, according to Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 20–21)</span><span class="T6"> an affix of Sanskrit origin, has become productive according to</span><span class="T2"> Jones </span><span class="T2">(<a href="__verhaarloanwords1984__">1984</a>: 7)</span><span class="T6">,</span><span class="T29"> </span><span class="T2">e.g. </span><span class="T29">serba ada</span><span class="T6"> ‘having everything’, </span><span class="T29">serba salah </span><span class="T6">‘always wrong’ </span><span class="T2">(examples provided by Uri Tadmor, personal communication, 2011)</span></p><p class="P195"><span class="T29">swa‑ </span><span class="T6">‘self’, according to Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 20–21)</span><span class="T6"> an affix of Sanskrit origin, has become productive according to</span><span class="T2"> Jones </span><span class="T2">(<a href="__verhaarloanwords1984__">1984</a>: 7)</span><span class="T6">,</span><span class="T29"> </span><span class="T2">e.g. </span><span class="T29">swabakar </span><span class="T6">‘self‑immolate’, </span><span class="T29">swalayan</span><span class="T6"> ‘supermarket, literally self‑service’</span></p><p class="P195"><span class="T29">tata‑ </span><span class="T6">‘extend, spread’,</span><span class="T29"> </span><span class="T2">e.g. </span><span class="T29">tata tertib </span><span class="T6">‘law and order’</span><span class="T29">, tata ruang</span><span class="T6"> ‘interior’,</span><span class="T29"> tata boga </span><span class="T6">‘table manners’. Has become productive according to</span><span class="T2"> Jones </span><span class="T2">(<a href="__verhaarloanwords1984__">1984</a>: 7)</span><span class="T2">.</span></p><p class="P195"><span class="T29">tri‑</span><span class="T6"> ‘three’, </span><span class="T2">e.g. </span><span class="T29">triwulan </span><span class="T6">‘three monthly’, </span><span class="T29">triwarna</span><span class="T6"> ‘three color’. According to Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 20–21)</span><span class="T6"> this affix is of Sanskrit origin.</span></p><p class="P195"><span class="T29">tuna‑ </span><span class="T6">‘struck, hurt, cut’, according to Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 20–21)</span><span class="T6"> an affix of Sanskrit origin,</span><span class="T29"> </span><span class="T2">e.g. </span><span class="T29">tunarungu</span><span class="T6"> ‘deaf’ </span><span class="T2">(example provided by Uri Tadmor, personal communication, 2011)</span></p><p class="P53"> </p><p class="P34">2 agent or profession noun derivational suffixes</p><p class="P195"><span class="T29">‑wan </span><span class="T6">‘masculine agent or profession noun’, reasonably common according to Mueller </span><span class="T6">(<a href="__kayeindonesian2007__">2007</a>: 1220)</span><span class="T6"> and Jones</span><span class="T2"> </span><span class="T2">(<a href="__verhaarloanwords1984__">1984</a>: 7)</span><span class="T2">, </span><span class="T6">also mentioned by Tadmor </span><span class="T6">(<a href="__tadmorloanwords20091__">2009</a>: 705)</span><span class="T6">. According to Mueller </span><span class="T6">(<a href="__kayeindonesian2007__">2007</a>: 1220)</span><span class="T6"> ‑</span><span class="T29">man</span><span class="T6"> is an allomorph of </span><span class="T29">‑wan</span><span class="T6">,</span><span class="T29"> </span><span class="T2">e.g. </span><span class="T29">pragawan</span><span class="T6"> ‘male model’, </span><span class="T29">kamerawan</span><span class="T6"> ‘male cameraman’</span></p><p class="P205"><span class="T29">‑wati </span><span class="T6">‘feminine agent or profession noun’, reasonably common according to Mueller </span><span class="T6">(<a href="__kayeindonesian2007__">2007</a>: 1220)</span><span class="T6"> and Jones</span><span class="T2"> </span><span class="T2">(<a href="__verhaarloanwords1984__">1984</a>: 7)</span><span class="T2">, </span><span class="T6">also mentioned by Tadmor </span><span class="T6">(<a href="__tadmorloanwords20091__">2009</a>: 705)</span><span class="T6">, </span><span class="T2">e.g. </span><span class="T29">pragawati</span><span class="T6"> ‘female model’, </span><span class="T29">kamerawati</span><span class="T6"> ‘female cameraman’</span></p></td>	\N	42	132	Southeast Asia & Oceania	high	0	18	18
9	2013-11-19 20:49:33.934632+01	2013-11-19 20:49:33.934638+01	t	\N	11	Sakha affixes in Uchur Ėvenki	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Malchukov <span class="T89">(<a href="__boeschotenyakut2006__">2006</a>)</span><span class="T89">, who cites Myreeva </span>(<a href="__myreevaocerk1964__">1964</a>)<span class="T89">, see also </span>Malchukov (<a href="__urelandrussian2003__">2003</a>).</p><p class="P10"> </p><p class="P33">1 hypothetical mood marker</p><p class="P195"><span class="T28">‑dax </span><span class="T42">‘hypothetical mood’ (this form</span><span class="T2"> is part of the </span><span class="T90">complex marker </span><span class="T96">‑r.dax‑</span><span class="T90">, a combination of the native Evenki present tense marker ‑</span><span class="T96">r(a)</span><span class="T90">‑ with the Sakha hypothetical mood in ‑</span><span class="T96">tax</span><span class="T90">‑), e.g. </span><span class="T96">waa‑r.dag‑im </span><span class="T91">‘I must have killed’</span><span class="T90">, </span><span class="T96">waa‑r.dag‑a </span><span class="T91">‘he/she/it must have killed’</span></p><p class="P112"> </p><p class="P10"><span class="T48">6 person subject markers</span> (all 6 borrowed) used only in combination with the hypothetical mood marker</p><p class="P225"><span class="T30">‑im </span><span class="T13">‘first singular’, e.g. </span><span class="T30">waa‑r.dag‑im </span><span class="T13">‘I must have killed’</span><span class="T2">, </span><span class="T30">waa‑r.dag‑a </span><span class="T13">‘he/she/it must have killed’</span></p><p class="P225"><span class="T30">‑i</span><span class="T28">ŋ </span><span class="T13">‘second singular’, e.g. </span><span class="T30">waa‑r.dag‑i</span><span class="T28">ŋ </span><span class="T2">‘you (sg.) must have killed’</span></p><p class="P225"><span class="T30">‑a </span><span class="T13">‘third singular’, e.g.</span><span class="T2"> </span><span class="T30">waa‑r.dag‑a </span><span class="T13">‘he/she/it must have killed’</span></p><p class="P226"><span class="T28">‑put </span><span class="T2">‘first plural’, e.g. </span><span class="T28">waa‑r.dak‑put </span><span class="T2">‘we must have killed’</span></p><p class="P225"><span class="T30">‑kit </span><span class="T13">‘second plural’, e.g. </span><span class="T30">waa‑r.dak‑kit </span><span class="T13">‘you (pl) must have killed’, </span><span class="T30">suu gorolli‑r.dak‑kit </span><span class="T13">(</span><span class="T2">you.</span><span class="T53">nominative</span><span class="T2">/far_away_go‑</span><span class="T53">probability‑2pl)</span><span class="T2"> ‘you (pl) must have gone far away’</span></p><p class="P226"><span class="T28">‑tara </span><span class="T2">‘third plural’, e.g. </span><span class="T28">waa‑r.dak‑tara </span><span class="T2">‘they must have killed’</span></p><p class="P10"> </p><p class="P35">1 ordinal number‑forming suffix</p><p class="P196"><span class="T32">‑s </span><span class="T16">‘ordinal numeral derivation’, which is used in addition to a native derivational marker </span><span class="T32">‑i(s)</span><span class="T16">, e.g. </span><span class="T96">d’uur‑i‑s </span><span class="T90">‘second’</span><span class="T96"> </span><span class="T90">(from </span><span class="T96">d’uur </span><span class="T90">‘two’)</span></p><p class="P10"> </p><p class="P10">Malchukov (personal communication 2011) notes that the hypothetical mood marker is a recently grammaticalized auxiliary verb, which explains why it comes with its own inflectional morphology.</p></td>	\N	21	46	Eurasia	high	0	7	8
10	2013-11-19 20:49:33.945094+01	2013-11-19 20:49:33.945099+01	t	\N	12	Norman French affixes in Middle English	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from <span class="T69">Dalton‑Puffer </span><span class="T69">(<a href="__daltonpufferfrench1996__">1996</a>)</span><span class="T69">, see also Ciszek </span><span class="T69">(<a href="__ciszekword2008__">2008</a>)</span><span class="T69"> and Palmer </span><span class="T69">(<a href="__palmerborrowings2009__">2009</a>)</span><span class="T69">. Thanks to Sarah Menzel for help with the analysis. There are 8 derivational suffixes that are used on at least some Germanic stems in Middle English already (there are 10 others that are only attested in combination with Romance stems in Middle English and therefore not counted here).</span></p><p class="P11"> </p><p class="P34">4 abstract noun formation</p><p class="P200"><span class="T28">‑age </span><span class="T2">‘abstract noun’</span><span class="T28">,</span><span class="T2"> e.g</span><span class="T28">. bondage</span></p><p class="P200"><span class="T28">‑erie </span><span class="T2">‘abstract noun’</span><span class="T28">, </span><span class="T2">e.g. </span><span class="T28">aldermanrie, husbondrie, loselry, outlawerie</span></p><p class="P200"><span class="T28">‑ite </span><span class="T2">‘abstract noun’</span><span class="T28">, </span><span class="T2">e.g. </span><span class="T28">scantetee</span></p><p class="P200"><span class="T28">‑ment </span><span class="T2">‘abstract noun’, e.g. </span><span class="T28">garnement</span></p><p class="P11"> </p><p class="P34">3 concrete noun formation</p><p class="P3"><span class="T28">-ard </span><span class="T2">‘concrete noun’</span><span class="T28">, </span><span class="T2">e.g</span><span class="T28">. niggard, dotard</span></p><p class="P3"><span class="T28">-esse </span><span class="T2">‘concrete noun’</span><span class="T28">, </span><span class="T2">e.g.</span><span class="T28"> hunteresse</span></p><p class="P3"><span class="T28">‑our </span><span class="T2">‘concrete noun’, e.g. </span><span class="T28">worshippour, harpour</span></p><p class="P53"> </p><p class="P34">1 adjectivizer</p><p class="P3"><span class="T28">‑able </span><span class="T2">‘adjectivizer’, e.g. </span><span class="T28">spekable, knowable</span></p></td>	\N	83	14	Eurasia	high	0	7	8
11	2013-11-19 20:49:33.957048+01	2013-11-19 20:49:33.957055+01	t	\N	13	Visayan affixes in Chabacano	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Steinkrüger (<a href="__steinkrugermorphological2003__">2003</a>), <span class="T69">see also Steinkrüger &amp; Seifart </span>(<a href="__steinkrugertransfer2009__">2009</a>)<span class="T69"> and Seifart </span><span class="T69">(<a href="__seifartdirect2013__">2013</a>)</span></p><p class="P11"> </p><p class="P34">2 adjectivizer prefixes</p><p class="P195"><span class="T29">ma‑ </span><span class="T6">‘adjectivizer’,</span><span class="T29"> </span><span class="T6">e.g. </span><span class="T28">ma‑pyédra</span><span class="T2"> ‘stony, full of stones’</span></p><p class="P195"><span class="T29">maka‑ </span><span class="T6">‘adjectivizer’, e.g. </span><span class="T30">maka‑myédo</span><span class="T2"> ‘dreadful, scary’</span></p><p class="P212"> </p><p class="P33">2 verbalizer prefixes</p><p class="P195"><span class="T28">man‑ </span><span class="T6">‘verbalizer’</span><span class="T28">, </span><span class="T2">e.g. </span><span class="T28">man‑amígo</span><span class="T2"> ‘to be(come) friends’</span></p><p class="P195"><span class="T28">pa‑ </span><span class="T6">‘verbalizer’</span><span class="T2">, e.g. </span><span class="T28">pa‑alísto</span><span class="T2"> ‘test each other’s skills’</span></p><p class="P212"> </p><p class="P243"><span class="T48">1 reciprocal/locative suffix</span>, which in its reciprocal meaning is used in combination with borrowed verbalizer prefix, and which is therefore considered to be syntagmatically related to that prefix</p><p class="P244"><span class="T28">‑an, ‑han </span><span class="T2">‘reciprocal/locative’, e.g. </span><span class="T28">man‑kwénto‑han</span><span class="T2"> ‘to tell each other’, </span><span class="T28">tubu‑han</span><span class="T2"> ‘sugar cane field’</span></p><p class="P10"> </p><p class="P33">3 non‑interrelated affixes</p><p class="P2"><span class="T29">‑hin ~ ‑in ‘</span><span class="T6">adjectivizer’, e.g. </span><span class="T28">myedú‑hin</span><span class="T2"> ‘easily frightened’, </span><span class="T28">asmá‑hin</span><span class="T2"> ‘</span><a name="OLE_LINK4"></a><span class="T2">asthmatic’</span></p><p class="P2"><span class="T29">paka‑ ‘</span><span class="T6">nominalizer’, e.g. </span><span class="T28">paka‑alísto</span><span class="T2"> ‘talent’</span></p><p class="P2"><span class="T28">ika‑ </span><span class="T2">‘ordinal number formation’, e.g. </span><span class="T28">ika‑dos</span><span class="T2"> ‘second’, </span><span class="T28">ika‑síng</span><span class="T30">ko</span><span class="T2"> ‘fifth’.</span></p></td>	\N	23	139	Southeast Asia & Oceania	high	0	5	8
24	2013-11-19 20:49:34.184965+01	2013-11-19 20:49:34.184969+01	t	\N	27	Chuvash affixes in Mari	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10"><span class="T69">Information and examples mainly from Bereczki </span><span class="T69">(<a href="__bereczkitschuwaschische1979__">1979</a>; <a href="__bereczkicharacter1993__">1993</a>; <a href="__bereczkiaz2002__">2002</a>)</span><span class="T69"> and </span>Kangasmaa‑Minn (<a href="__kangasmaaminnmari1998__">1998</a>)<span class="T69">, in addition to other sources, as specified below.</span></p><p class="P44"> </p><p class="P10"><span class="T50">4 case markers</span><span class="T69">, out of 11 Mari case markers. Note that </span>the “boundaries between case suffixes, derivational suffixes, and enclitics are far from clear‑cut” (Kangasmaa‑Minn <a href="__kangasmaaminnmari1998__">1998</a>: 220).</p><p class="P195"><span class="T6">‑</span><span class="T29">la ~ ‑lä</span><span class="T6"> ‘modal, lative, comparative’, e.g. </span><span class="T29">mar‑la ojla </span><span class="T6">‘speaks Mari’, </span><span class="T29">totar-la solə̂k </span><span class="T6">‘Tartar scarf’, </span><span class="T29">jal muča‑ŝkə̂‑la kaja </span><span class="T6">(village/end‑</span><span class="T54">illocution‑modal</span><span class="T6">/goes) ‘goes to the end of the village’ </span><span class="T2">(Kangasmaa‑Minn <a href="__kangasmaaminnmari1998__">1998</a>: 227)</span><span class="T2">, </span><span class="T28">kiɗemla </span><span class="T2">‘as my hand’ </span><span class="T6">(Bereczki <a href="__bereczkitschuwaschische1979__">1979</a>: 65)</span></p><p class="P195"><span class="T28">-s</span><span class="T29">ɘ̂(n) </span><span class="T6">‘causal case, used with participles’, e.g. </span><span class="T29">kottəmašən šolten o ̇ mɘ̂l</span><span class="T6"> ‘I did not cook so they would not eat’ </span><span class="T6">(Bereczki <a href="__bereczkitschuwaschische1979__">1979</a>: 68)</span><span class="T6">. See also </span><span class="T2">Kangasmaa‑Minn </span><span class="T2">(<a href="__kangasmaaminnmari1998__">1998</a>: 233, 244)</span><span class="T2">. </span><span class="T6">Note that Bereczki </span><span class="T6">(<a href="__bereczkitschuwaschische1979__">1979</a>: 68)</span><span class="T6"> considers this to be a causal case suffix, borrowed from a corresponding case suffix from Chuvash, the use of which is restricted to participles. Its status as a case suffix is confirmed by the fact that it can be replaced by a dative case marker.</span></p><p class="P200"><span class="T28">‑len</span><span class="T2"> ‘distributive’, e.g.</span><span class="T15"> </span><span class="T28">kečɘ̂len</span><span class="T2"> ‘every day’</span><span class="T28">, almašlen </span><span class="T2">‘changing’ </span><span class="T2">(Bereczki <a href="__bereczkitschuwaschische1979__">1979</a>: 69)</span></p><p class="P200"><span class="T28">‑j </span><span class="T2">‘vocative case (used with kinship terms)’, e.g. </span><span class="T28">isaj </span><span class="T2">‘my older brother!, my uncle!’ </span><span class="T2">(Bereczki <a href="__bereczkicharacter1993__">1993</a>: 511)</span><span class="T2">. This form may also be from Tartar.</span></p><p class="P11"> </p><p class="P34">2 valency‑changing verbal suffixes</p><p class="P195"><span class="T29">‑n </span><span class="T6">‘reflexive’, e.g. </span><span class="T30">wijnem </span><span class="T13">‘get up’ (from </span><span class="T30">wiem </span><span class="T13">‘lift up’) </span><span class="T13">(Bereczki <a href="__bereczkiaz2002__">2002</a>: 99)</span></p><p class="P195"><span class="T29">‑tar, ‑tär, ‑dar, ‑där </span><span class="T6">‘causative’, e.g. </span><span class="T29">jomdara </span><span class="T6">‘he/she looses’ (from </span><span class="T29">jomam </span><span class="T6">‘I disappear’)</span><span class="T2"> </span><span class="T2">(Mägiste <a href="__magistesuffixentlehnung1968__">1968</a>: 10;  citing Beke <a href="__bekecseremisz1911__">1911</a>: 134–136, 287–288, 301–302)</span><span class="T29">. </span><span class="T2">Kangasmaa‑Minn </span><span class="T2">(<a href="__kangasmaaminnmari1998__">1998</a>: 235)</span><span class="T2"> gives the forms </span><span class="T28">=tə̂ ~ =də̂</span><span class="T2">, e.g. </span><span class="T29">joškar</span><span class="T28">=tə̂</span><span class="T2"> ‘make red’, but does not explicitly state that it is borrowed. </span><span class="T6">This form may also be from Tartar.</span></p><p class="P21"> </p><p class="P37">6 affixes</p><p class="P205"><span class="T30">‑mVš </span><span class="T13">~</span><span class="T30"> ‑šV </span><span class="T13">‘</span><span class="T2">ordinal numeral formation’</span><span class="T13">, e.g. </span><span class="T30">kumuso </span><span class="T2">‘third’, </span><span class="T30">nilemise </span><span class="T2">‘fourth’ </span><span class="T2">(Bereczki <a href="__bereczkiaz2002__">2002</a>: 99;  citing Budenz <a href="__budenzcseremisz1864__">1864</a>: 437–438)</span><span class="T13">, </span><span class="T30">koγә̑ mśo </span><span class="T2">‘second’ </span><span class="T13">(Bereczki <a href="__bereczkiaz2002__">2002</a>: 99;  citing Galkin <a href="__galkinistoritsheskaja1964__">1964</a>: 108)</span><span class="T13">, </span><span class="T30">kolә̑ šo </span><span class="T2">‘twentieth’ </span><span class="T13">(Bereczki <a href="__bereczkiaz2002__">2002</a>: 99)</span><span class="T13">. </span><span class="T6">Note that </span><span class="T2">Kangasmaa‑Minn </span><span class="T2">(<a href="__kangasmaaminnmari1998__">1998</a>: 233–234, 244)</span><span class="T2"> considers this to be “the same (or homophonous) suffix (with an </span><span class="T28">m‑</span><span class="T2"> element)” as </span><span class="T28">=s</span><span class="T29">ɘ̂(n) </span><span class="T6">‘causal case, used with participles’, which is used </span><span class="T2">in the formation of ordinal numerals, e.g. </span><span class="T28">n</span><span class="T29">ɘ̂lɘ̂mše </span><span class="T6">‘forth’.</span></p><p class="P195"><span class="T30">ala‑ </span><span class="T2">‘indefinite’, e.g. </span><span class="T30">ala‑kö </span><span class="T2">‘someone’, </span><span class="T30">ala‑mo </span><span class="T2">‘something’ </span><span class="T30">ala‑kuze </span><span class="T2">‘somehow’ </span><span class="T13">(Bereczki <a href="__bereczkiaz2002__">2002</a>: 99)</span></p><p class="P195"><span class="T28">=le ~ =lö ~ =lo</span><span class="T2"> ‘adjectivizer’, e.g. </span><span class="T28">lüm=lö</span><span class="T2"> ‘famous’ </span><span class="T2">(Kangasmaa‑Minn <a href="__kangasmaaminnmari1998__">1998</a>: 244)</span></p><p class="P195"><span class="T29">=rak </span><span class="T6">‘comparative, modal’, e.g.</span><span class="T29"> joškar=gə̂=rak </span><span class="T6">‘reddish’ </span><span class="T2">(Kangasmaa‑Minn <a href="__kangasmaaminnmari1998__">1998</a>: 234)</span><span class="T2">, </span><span class="T28">ko ̇yo‑rak </span><span class="T2">‘bigger’ </span><span class="T2">(Mägiste <a href="__magistesuffixentlehnung1968__">1968</a>: 10;  citing Beke <a href="__bekecseremisz1911__">1911</a>: 134–136, 287–288, 301–302)</span><span class="T29">.</span><span class="T6"> See also Raun </span><span class="T6">(<a href="__raunessays1971__">1971</a>: 120 and passim)</span><span class="T6"> and Wiedemann </span><span class="T6">(<a href="__wiedemannversuch1847__">1847</a>: 50)</span><span class="T6">. This form may also be from Tartar.</span></p><p class="P195"><span class="T29">=lə̂k</span><span class="T6"> ‘abstract noun’, e.g. </span><span class="T29">kül‑eš=lə̂k </span><span class="T6">‘necessity’ </span><span class="T2">(Kangasmaa‑Minn <a href="__kangasmaaminnmari1998__">1998</a>: 244)</span><span class="T2">, </span><span class="T28">porlək </span><span class="T2">‘goodness’ </span><span class="T2">(Mägiste <a href="__magistesuffixentlehnung1968__">1968</a>: 10;  citing Beke <a href="__bekecseremisz1911__">1911</a>: 134–136, 287–288, 301–302)</span></p><p class="P195"><span class="T29">=kalə̂‑ </span><span class="T6">‘iterative aspect’, e.g</span><span class="T29">. lüj=kalə̂‑ </span><span class="T6">‘shoots repeatedly’ </span><span class="T2">(Kangasmaa‑Minn <a href="__kangasmaaminnmari1998__">1998</a>: 245)</span></p><p class="P11"> </p><p class="P2"><span class="T6">Note that it is not clear what the total number of cases is. </span><span class="T2">Kangasmaa‑Minn </span><span class="T2">(<a href="__kangasmaaminnmari1998__">1998</a>: 226)</span><span class="T6"> gives 10 (in addition to unmarked nominative), to which I added </span><span class="T29">-</span><span class="T18">j</span><span class="T6"> ‘vocative’. </span></p></td>	\N	35	93	Eurasia	mid	1	6	12
12	2013-11-19 20:49:33.977193+01	2013-11-19 20:49:33.977198+01	t	\N	14	Tigre affixes in Bilin	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Appleyard <span class="T69">(<a href="__kayebilin2007__">2007</a>)</span><span class="T69">. </span>Bilin has borrowed an entire set of object markers from Tigre: “Alone among the Agaw languages, Bilin also has a set of object suffix pronouns added to the verb. Both the construction and the form themselves are borrowed directly from Tigre even to the extent that as in Tigre the 2nd person distinguishes masculine and feminine, a contrast that is not made in Bilin elsewhere, neither in the independent pronoun nor in the subject marking of the verb” (Appleyard <a href="__kayebilin2007__">2007</a>: 491).</p><p class="P10"> </p><p class="P33">8 borrowed object markers</p><p class="P7"><span class="T28">‑law </span><span class="T2">‘first singular object’</span></p><p class="P7"><span class="T28">‑ka </span><span class="T2">‘second singular masculine object’</span></p><p class="P7"><span class="T28">‑ki </span><span class="T2">‘second singular feminine object’</span></p><p class="P7"><span class="T28">‑lu </span><span class="T2">‘third singular masculine object’</span></p><p class="P7"><span class="T28">‑la </span><span class="T2">‘third singular feminine object’</span></p><p class="P7"><span class="T28">‑na </span><span class="T2">‘first plural object’</span></p><p class="P7"><span class="T28">‑kum </span><span class="T2">‘second plural object’</span></p><p class="P7"><span class="T28">‑lom </span><span class="T2">‘third plural object’</span></p><p class="P10"> </p><p class="P2"><span class="T2">These forms are also attested in Reinisch </span><span class="T2">(<a href="__reinischbilinsprache1882__">1882</a>)</span><span class="T2">, who did not recognize them as borrowed. Reinisch </span><span class="T2">(<a href="__reinischbilinsprache1882__">1882</a>: 38)</span><span class="T2"> also gives forms that distinguish gender in third person plural (masc. </span><span class="T28">‑lom</span><span class="T2">, fem. </span><span class="T28">‑län</span><span class="T2">), which does not appear in Hamde’s </span><span class="T2">(<a href="__hamdeorigin1986__">1986</a>)</span><span class="T2"> grammar as noted by Appleyard </span><span class="T6">(<a href="__kayebilin2007__">2007</a>)</span><span class="T2">. Hamde </span><span class="T2">(<a href="__hamdeorigin1986__">1986</a>: 33, 49–54, 93–94)</span><span class="T2"> gives the same forms as Appleyard </span><span class="T6">(<a href="__kayebilin2007__">2007</a>)</span><span class="T2">, without, however, a clear explanation of their function and distribution. Hamde </span><span class="T2">(<a href="__hamdeorigin1986__">1986</a>: 48–52)</span><span class="T2"> mentions that suffixes are borrowed from Tigre and notes that “we cannot escape the fact the Tigre is invading Bilin through such grammatical explainable aspects of the grammar” </span><span class="T2">(Hamde <a href="__hamdeorigin1986__">1986</a>: 51)</span><span class="T2">, without given further details. Hamde </span><span class="T2">(<a href="__hamdeorigin1986__">1986</a>: 51–52)</span><span class="T2"> mentions two “prefixes and phrases” that would be borrowed from Tigre, one would be a verbal prefix (although written separately) translated as “as, that, is as” </span><span class="T2">(Hamde <a href="__hamdeorigin1986__">1986</a>: 51)</span><span class="T2">, another is apparently a nominal derivational element, translated as “mismal, improper” (also written separately). Hamde </span><span class="T2">(<a href="__hamdeorigin1986__">1986</a>)</span><span class="T2"> dismisses both as incorrect forms. It seems both can be treated as borrowed lexical elements, or maybe particles. Neither Appleyard </span><span class="T6">(<a href="__kayebilin2007__">2007</a>)</span><span class="T6"> or </span><span class="T2">Hamde </span><span class="T2">(<a href="__hamdeorigin1986__">1986</a>)</span><span class="T2"> give examples of hybrid formation, but since these forms are apparently obligatory, inflectional object markers, and there is no indication that all transitive verbs would be borrowed from Tigre, it is safe to assume that they form hybrid formations.</span></p></td>	\N	51	61	Africa	high	0	8	8
13	2013-11-19 20:49:33.99255+01	2013-11-19 20:49:33.992557+01	t	\N	15	Bosnian/Croatian/Serbian affixes in Albanian	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10"><span class="T69">Information and examples are from </span>Xhuvani and Çabej (<a href="__xhuvaniprapashtesat1962__">1962</a>)<span class="T69">, Demiraj </span>(<a href="__demirajgjuha1988__">1988</a>: 122–123)<span class="T69">, </span><span class="T83">Svane</span><span class="T69"> </span><span class="T69">(<a href="__svaneslavische1992__">1992</a>: 290)</span><span class="T69">, Orel </span><span class="T69">(<a href="__orelalbanian1998__">1998</a>)</span><span class="T69">, Boretzky </span><span class="T69">(<a href="__boretzkymorphologische2004__">2004</a>: 1647)</span><span class="T69">, and Johanna Nichols (personal communication 14.7.2011). Examples were compiled by Lisa Morgenroth, some additional translation by Suzana Dibrani.</span></p><p class="P11"> </p><p class="P11"><span class="T48">5 gender or declension class differentiated suffixes</span> that form masculine nouns and adjectives</p><p class="P195"><span class="T29">‑ac</span><span class="T6"> [ats] ‘adjectivizer’ </span><span class="T6">(Boretzky <a href="__boretzkymorphologische2004__">2004</a>: 1647;  Demiraj <a href="__demirajgjuha1988__">1988</a>: 122)</span><span class="T28">,</span><span class="T2"> e.g. </span><span class="T28">sqepac </span><span class="T2">‘beak‑shaped’ (from </span><span class="T28">sqep </span><span class="T2">‘beak’), </span><span class="T28">thumbac </span><span class="T2">‘metal tip of a goad’ (from </span><span class="T28">thumb </span><span class="T2">‘thorn’), </span><span class="T28">dorac </span><span class="T2">‘one‑handed’ (from </span><span class="T28">dorë </span><span class="T2">‘hand’)</span></p><p class="P195"><span class="T29">‑aç</span><span class="T6"> [atʃ] ‘nominal derivation’ </span><span class="T6">(Boretzky <a href="__boretzkymorphologische2004__">2004</a>: 1647;  Svane <a href="__svaneslavische1992__">1992</a>: 290)</span><span class="T6">, </span><span class="T2">e.g. </span><span class="T28">biraç </span><span class="T2">‘wall niche next to the hearth’ (from </span><span class="T28">birë </span><span class="T2">‘hole’), </span><span class="T28">gjembaç </span><span class="T2">‘thistle, sharp spine’ (from </span><span class="T28">gjemb </span><span class="T2">‘thorn’), </span><span class="T28">kungullaç </span><span class="T2">‘unripe, immature’ (from </span><span class="T28">kungull </span><span class="T2">‘marrow, pumpkin, bottle’)</span></p><p class="P195"><span class="T29">‑ak</span><span class="T6"> [ak] ‘nominal derivation’ </span><span class="T6">(Boretzky <a href="__boretzkymorphologische2004__">2004</a>: 1647)</span><span class="T6">, e</span><span class="T2">.g. </span><span class="T28">dorak </span><span class="T2">‘handle’ (from </span><span class="T28">dorë </span><span class="T2">‘hand’), </span><span class="T28">fytak </span><span class="T2">‘small wooden jug with a spout’ (from </span><span class="T28">fyt </span><span class="T2">‘throat, gullet’), </span><span class="T28">pishak </span><span class="T2">‘thick pine tree, stump’ (from </span><span class="T28">pishë </span><span class="T2">‘pine’)</span></p><p class="P195"><span class="T29">‑ash</span><span class="T6"> ‘adjectivizer’ </span><span class="T6">(Demiraj <a href="__demirajgjuha1988__">1988</a>: 122)</span><span class="T6">, e.g. </span><span class="T28">buzash </span><span class="T2">‘lips’ (from </span><span class="T28">buzë </span><span class="T2">‘end, edge’), </span><span class="T28">gjumash </span><span class="T2">‘sleepy’ (from </span><span class="T28">gjumë </span><span class="T2">‘sleep’), </span><span class="T28">jargash </span><span class="T2">‘slobbering, drooling’ (from </span><span class="T28">jargë </span><span class="T2">‘split, phlegm’), </span><span class="T28">kromash </span><span class="T2">‘scabious’ (from </span><span class="T28">kromë </span><span class="T2">‘scabies, dogrose’)</span></p><p class="P195"><span class="T29">‑avec </span><span class="T6">‘agent nominalizer’ </span><span class="T6">(Demiraj <a href="__demirajgjuha1988__">1988</a>: 122)</span><span class="T28">,</span><span class="T2"> e.g. </span><span class="T28">jargavec </span><span class="T2">‘slug, slobbering’ (from </span><span class="T28">jargë </span><span class="T2">‘split, phlegm’), </span><span class="T28">ligavec </span><span class="T2">‘slug, sniveling coward’ (from </span><span class="T28">lig </span><span class="T2">‘evil, cowardly’), </span><span class="T28">qullavec </span><span class="T2">‘person who is slow and clumsy’ (from </span><span class="T28">qull </span><span class="T2">‘porridge, get soaked, soggy’)</span></p><p class="P11"> </p><p class="P2"><span class="T4">3 gender or declension class differentiated suffixes</span><span class="T6"> that form masculine (‑</span><span class="T32">ik</span><span class="T16">) and feminine</span><span class="T6"> (‑</span><span class="T32">itsə</span><span class="T16">) </span><span class="T6">nouns and adjectives</span></p><p class="P195"><span class="T29">‑ic</span><span class="T32">ë</span><span class="T16"> [itsə] ‘nominal derivation’ </span><span class="T6">(Boretzky <a href="__boretzkymorphologische2004__">2004</a>: 1647;  Svane <a href="__svaneslavische1992__">1992</a>: 290;  Demiraj <a href="__demirajgjuha1988__">1988</a>: 123)</span><span class="T6">,</span><span class="T2"> e.g. </span><span class="T28">petkicë </span><span class="T2">‘small sized garment’ (from </span><span class="T28">petk </span><span class="T2">‘clothes’), </span><span class="T28">tulicë </span><span class="T2">‘tender meat’ (from </span><span class="T28">tul </span><span class="T2">‘meat, flesh’), </span><span class="T28">balticë </span><span class="T2">‘ground that gets muddy quickly’ (from </span><span class="T28">baltë </span><span class="T2">‘swamp, dirt’)</span></p><p class="P195"><span class="T29">‑içë</span><span class="T6"> ‘nominal derivation or adjectivizer’, e.g. </span><span class="T28">hardhiçë </span><span class="T2">‘wall lizard’ (from </span><span class="T28">hardhucë </span><span class="T2">‘lizard’), </span><span class="T28">barkiç </span><span class="T2">‘potbellied’ (from </span><span class="T28">bark </span><span class="T2">‘belly, abdomen’), </span><span class="T28">guriçkë </span><span class="T2">‘small rock’ (from </span><span class="T28">gur </span><span class="T2">‘stone, rock’)</span></p><p class="P195"><span class="T32">‑ik</span><span class="T16"> [ik] </span><span class="T6">‘nominal derivation or adjectivizer’</span><span class="T16"> </span><span class="T6">(Boretzky <a href="__boretzkymorphologische2004__">2004</a>: 1647)</span><span class="T6">, e.</span><span class="T2">g. </span><span class="T28">balik </span><span class="T2">‘animal with white spotted face or body’ (from </span><span class="T28">balë </span><span class="T2">‘badger’), </span><span class="T28">baltik </span><span class="T2">‘muddy, marshy’ (from </span><span class="T28">baltë </span><span class="T2">‘swamp, dirt’), </span><span class="T28">çapik </span><span class="T2">‘impudent, saucy’ (from </span><span class="T28">çap </span><span class="T2">‘to chew’)</span></p><p class="P22"> </p><p class="P2"><span class="T4">2 gender or declension class differentiated affixes</span><span class="T6"> that form masculine (</span><span class="T29">‑</span><span class="T32">iʃtə</span><span class="T16">) and feminine</span><span class="T6"> (</span><span class="T29">‑</span><span class="T32">inə</span><span class="T16">) </span><span class="T6">nouns, often having to do with locations</span></p><p class="P195"><span class="T32">‑inë</span><span class="T16"> [inə] ‘location noun derivation’ </span><span class="T6">(Boretzky <a href="__boretzkymorphologische2004__">2004</a>: 1647;  Svane <a href="__svaneslavische1992__">1992</a>: 290;  Demiraj <a href="__demirajgjuha1988__">1988</a>: 123)</span><span class="T6">, e.</span><span class="T2">g. </span><span class="T28">baltinë </span><span class="T2">‘muddy ground’ (from </span><span class="T28">baltë </span><span class="T2">‘swamp, dirt’), </span><span class="T28">botinë </span><span class="T2">‘swampland’ (from </span><span class="T28">botë </span><span class="T2">‘earth, world’), </span><span class="T28">djerrinë </span><span class="T2">‘wilderness, fallow land’ (from </span><span class="T28">djerr </span><span class="T2">‘to destroy’)</span></p><p class="P195"><span class="T32">‑ishtë</span><span class="T16"> [iʃtə] ‘location noun derivation’ </span><span class="T6">(Boretzky <a href="__boretzkymorphologische2004__">2004</a>: 1647;  Svane <a href="__svaneslavische1992__">1992</a>: 290;  Demiraj <a href="__demirajgjuha1988__">1988</a>: 123)</span><span class="T6">, </span><span class="T2">e.g. </span><span class="T28">ahishtë </span><span class="T2">‘beech forest’ (from </span><span class="T28">ah </span><span class="T2">‘beech‑tree’), </span><span class="T28">arrishtë </span><span class="T2">‘walnut grove’ (from </span><span class="T28">arrë </span><span class="T2">‘walnut tree’), </span><span class="T28">baltishtë </span><span class="T2">‘ground that gets muddy quickly’ (from </span><span class="T28">baltë </span><span class="T2">‘swamp, dirt’)</span></p><p class="P11"> </p><p class="P34">3 other nominal suffixes</p><p class="P195"><span class="T32">‑nik </span><span class="T16">‘nominal derivation’ </span><span class="T16">(Svane <a href="__svaneslavische1992__">1992</a>: 290;  Demiraj <a href="__demirajgjuha1988__">1988</a>: 123)</span><span class="T16">, e.g. </span><span class="T28">danik </span><span class="T2">‘special purpose room’ (from </span><span class="T28">daj </span><span class="T2">‘to divide’), </span><span class="T28">drithnik </span><span class="T2">‘granary’ (from </span><span class="T28">drithë </span><span class="T2">‘grain’), </span><span class="T28">kohënik </span><span class="T2">‘contemporary’ (from </span><span class="T28">kohë </span><span class="T2">‘time’)</span></p><p class="P195"><span class="T32">‑kë </span><span class="T16">‘nominal derivation’ </span><span class="T16">(Svane <a href="__svaneslavische1992__">1992</a>: 290)</span><span class="T16">, e.g. </span><span class="T28">vickë </span><span class="T2">‘perverseness’ (from </span><span class="T28">vithe </span><span class="T2">‘crupper, ramp’), </span><span class="T28">veshkë </span><span class="T2">‘kidney’ (from </span><span class="T28">vesh </span><span class="T2">‘ear, vine’)</span></p><p class="P195"><span class="T32">‑ar </span><span class="T16">‘nominal derivation’</span><span class="T32"> </span><span class="T2">(Xhuvani and Çabej <a href="__xhuvaniprapashtesat1962__">1962</a>: 18)</span><span class="T16">, </span><span class="T2">e.g. </span><span class="T28">grunar </span><span class="T2">‘granary’ (from </span><span class="T28">grunë </span><span class="T2">‘wheat’), </span><span class="T28">lumare </span><span class="T2">‘riverbanks’ (from </span><span class="T28">lumë </span><span class="T2">‘river’)</span></p><p class="P214"> </p><p class="P34">1 verbalizer</p><p class="P195"><span class="T29">‑it</span><span class="T6"> </span><span class="T6">(Demiraj <a href="__demirajgjuha1988__">1988</a>: 123)</span><span class="T6">, e.g. </span><span class="T28">djersit </span><span class="T2">‘to sweat’ (from </span><span class="T28">djersë </span><span class="T2">‘perspiration’), </span><span class="T28">shoshit </span><span class="T2">‘to sift, screen, scan’ (from </span><span class="T28">shosh </span><span class="T2">‘to sift’)</span></p></td>	\N	18	103	Eurasia	high	0	13	14
14	2013-11-19 20:49:34.006442+01	2013-11-19 20:49:34.006448+01	t	\N	16	Spanish affixes in Cajamarca Quechua	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">The description of morphological borrowing from Spanish into various Quechuan languages is from Muysken (<a href="__muyskenspanish2012__">2012</a>), who argues explicitly that these seven suffixes are “<span class="T89">part of a cluster of related processes, processes which almost operate in paradigmatic opposition” </span>(Muysken <a href="__muyskenspanish2012__">2012</a>: 485). Examples are taken directly from the sources Muysken (<a href="__muyskenspanish2012__">2012</a>) cites for <span class="T89">Cajamarca </span><span class="T69">Quechua</span> (Quesada Castillo <a href="__quesadacastillodiccionario1976__">1976a</a>; <a href="__quesadacastillogrammatica1976__">1976b</a>).</p><p class="P10"> </p><p class="P33">7 derivational suffixes</p><p class="P195"><span class="T28">‑dor </span><span class="T2">‘agentive, occupation noun’, e.g. </span><span class="T28">michidor</span><span class="T2"> ‘shepherd’, </span><span class="T28">awador</span><span class="T2"> ‘tailor’, </span><span class="T28">ampidor</span><span class="T2"> ‘medicine man’ </span><span class="T2">(Quesada Castillo <a href="__quesadacastillogrammatica1976__">1976b</a>: 102)</span></p><p class="P205"><span class="T28">‑iru </span><span class="T2">‘agentive, occupation’, e.g.</span><span class="T28"> </span><span class="T95">yamtiru</span><span class="T90"> ‘firewood gatherer’ </span><span class="T2">(Quesada Castillo <a href="__quesadacastillodiccionario1976__">1976a</a>: 150)</span><span class="T2">, see also </span><span class="T2">(Muysken <a href="__muyskenspanish2012__">2012</a>: 485, 491)</span></p><p class="P195"><span class="T28">‑itu ~ ‑ita ­~ -situ ~ -sita </span><span class="T2">‘diminutive’, e.g. </span><span class="T28">pishqito </span><span class="T2">‘little bird’, </span><span class="T28">warmisita</span><span class="T2"> ‘little woman’, </span><span class="T28">wishita </span><span class="T2">‘little sheep’ </span><span class="T2">(Quesada Castillo <a href="__quesadacastillogrammatica1976__">1976b</a>: 105)</span></p><p class="P195"><span class="T28">‑liju </span><span class="T2">‘adjectivizer/nominalizer’, e.g.</span><span class="T28"> </span><span class="T95">mancha‑liju </span><span class="T90">‘easily scared’ </span><span class="T2">(Quesada Castillo <a href="__quesadacastillodiccionario1976__">1976a</a>: 60)</span><span class="T2">, see also </span><span class="T2">(Muysken <a href="__muyskenspanish2012__">2012</a>: 487, 491)</span></p><p class="P205"><span class="T28">‑linku </span><span class="T2">‘adjectivizer/nominalizer’, e.g. </span><span class="T95">wañu‑inku</span><span class="T90"> ‘dying, moribund’ </span><span class="T2">(Quesada Castillo <a href="__quesadacastillodiccionario1976__">1976a</a>: 96)</span><span class="T2">, see also </span><span class="T2">(Muysken <a href="__muyskenspanish2012__">2012</a>: 487, 491)</span></p><p class="P195"><span class="T28">‑nyentu ~ ‑chintu ~ ‑lyentu </span><span class="T2">‘adjectivizer’, e.g. </span><span class="T28">mallaqnyentu</span><span class="T2"> ‘hungry’, </span><span class="T28">qeshyachintu</span><span class="T2"> ‘sickly’, </span><span class="T28">iskilyentu</span><span class="T2"> ‘having lice’ </span><span class="T2">(Quesada Castillo <a href="__quesadacastillogrammatica1976__">1976b</a>: 103)</span></p><p class="P205"><span class="T28">‑likido </span><span class="T2">‘</span><span class="T90">characterizing derivation’, e.g. </span><span class="T95">qallo‑likidu</span><span class="T90"> (tongue‑liquid) ‘liar, talker, gossiper’, </span><span class="T95">qalla‑likidu</span><span class="T90"> (lazy‑liquid) ‘lazy’, </span><span class="T95">usa‑likidu</span><span class="T90"> (louse‑liquid) ‘full of lice’ </span><span class="T2">(Quesada Castillo <a href="__quesadacastillodiccionario1976__">1976a</a>: 125, 168, 169)</span><span class="T2">, see also </span><span class="T2">(Muysken <a href="__muyskenspanish2012__">2012</a>: 487, 491)</span></p></td>	\N	33	156	South America	high	0	7	7
15	2013-11-19 20:49:34.02813+01	2013-11-19 20:49:34.028134+01	t	\N	17	Aymara affixes in Uru	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10"><span class="T69">Information and examples are from Hannß </span>(<a href="__hannsuchumataqu2008__">2008</a>)<span class="T69"> and Katja Hannß (personal communication, 2011).</span></p><p class="P11"> </p><p class="P11"><span class="T48">3 case markers</span> (out of a paradigm of 9 case markers in Uru)</p><p class="P205"><span class="T28">‑kama </span><span class="T2">‘terminative case’, e.g. </span><span class="T96">uskatan‑kama </span><span class="T91">(</span><span class="T90">moment‑</span><span class="T65">terminative</span><span class="T90">) </span><span class="T92">‘</span><span class="T90">in a moment, in an instant</span><span class="T92">’ </span><span class="T92">(Hannß <a href="__hannsuchumataqu2008__">2008</a>: 173;  citing Métraux <a href="__metrauxcontribution1935__">1935</a>: 101)</span></p><p class="P225"><span class="T2">‑</span><span class="T30">taki ‘</span><span class="T2">benefactive case’, e.g. </span><span class="T30">suni‑taki </span><span class="T2">‘for the people’ </span><span class="T2">(Hannß <a href="__hannsuchumataqu2008__">2008</a>: 176;  citing Muysken <a href="__muyskenidioma2005__">2005</a>: 73)</span></p><p class="P195"><span class="T28">‑na </span><span class="T2">‘locative case’, e.g. </span><span class="T96">kʷas‑na </span><span class="T91">‘into the water’ </span><span class="T90">(Hannß <a href="__hannsuchumataqu2008__">2008</a>: 167;  citing Vellard <a href="__vellardcontribucion1967__">1967</a>: 4)</span></p><p class="P214"> </p><p class="P34">3 suffixes that are not interrelated</p><p class="P195"><span class="T90">‑</span><span class="T96">pača ‘</span><span class="T6">intensifier’</span><span class="T90">, e.g. </span><span class="T95">t</span><span class="T96">onx pača </span><span class="T91">‘even today’ </span><span class="T90">(Hannß <a href="__hannsuchumataqu2008__">2008</a>: 253;  citing Métraux <a href="__metrauxcontribution1935__">1935</a>: 91, 101)</span></p><p class="P195"><span class="T28">‑naka ‘</span><span class="T6">plural’</span><span class="T2">, e.g.</span><span class="T96"> suni‑naka </span><span class="T92">‘</span><span class="T90">the Uru people’ </span><span class="T90">(Hannß <a href="__hannsuchumataqu2008__">2008</a>: 138;  citing Vellard <a href="__vellardcontribucion1967__">1967</a>: 3)</span><span class="T90">, </span><span class="T95">tusa‑naka</span><span class="T90"> ‘balsa rafts’ </span><span class="T90">(Hannß <a href="__hannsuchumataqu2008__">2008</a>: 168;  citing Métraux <a href="__metrauxcontribution1935__">1935</a>: 99)</span></p><p class="P197"><span class="T90">‑</span><span class="T96">pini </span><span class="T91">‘a</span><span class="T90">ffirmative </span><span class="T6">clausal clitic’</span><span class="T90">, e.g. </span><span class="T93">kustak-pini-ki</span><span class="T90"> (brother-</span><span class="T66">affirmative-topic</span><span class="T90">) ‘the truly older brother’ </span><span class="T90">(Hannß <a href="__hannsuchumataqu2008__">2008</a>: 274;  citing Vellard <a href="__vellardcontribucion1967__">1967</a>: 24)</span><span class="T90">, </span><span class="T96">yuk‑pini </span><span class="T90">‘very many’ </span><span class="T90">(Hannß <a href="__hannsuchumataqu2008__">2008</a>: 274;  citing Vellard <a href="__vellardcontribucion1967__">1967</a>: 16)</span></p></td>	\N	147	122	South America	high	0	3	6
16	2013-11-19 20:49:34.039057+01	2013-11-19 20:49:34.039059+01	t	\N	18	Russian affixes in Israeli Hebrew	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P2"><span class="T2">Information and examples are from Bolozkoy </span><span class="T2">(<a href="__bolozkymeasuring1999__">1999</a>)</span><span class="T2">. The following six affixes are identified by Uri Tadmor (personal communication, 2011) as productive, and as having entered Hebrew from Russian, although they may be ultimately French, and may also exist in English, such as </span><span class="T28">‑er</span><span class="T2"> (from French </span><span class="T28">‑aire</span><span class="T2">). Bolozkoy </span><span class="T2">(<a href="__bolozkymeasuring1999__">1999</a>)</span><span class="T2"> studies in detail the productivity of these affixes (in dictionaries, corpora, and with “productivity test” involving native speaker judgments), providing also information on the extent to which they are used with native stems. See also Cohen and Laks </span><span class="T2">(<a href="__cohenhebrew2012__">2012</a>)</span><span class="T2"> who describe some of the same borrowed affixes.</span></p><p class="P42"> </p><p class="P33">4 agent noun formation suffixes</p><p class="P195"><span class="T28">‑nik </span><span class="T2">‘agent noun’, e.g. </span><span class="T28">núdnik</span><span class="T2"> ‘pest’, </span><span class="T28">kibúcnik</span><span class="T2"> ‘kibbutz member’, </span><span class="T28">klumnik</span><span class="T2"> ‘good‑for‑nothing’ </span><span class="T2">(Schwarzwald <a href="__schwarzwaldinflection1998__">1998</a>: 271)</span></p><p class="P195"><span class="T41">‑</span><span class="T28">tšik</span><span class="T2"> ‘diminutive; doer’ </span><span class="T28">politírtšik</span><span class="T2"> ‘furniture polisher’ (from </span><span class="T28">politum</span><span class="T2"> ‘polish’), </span><span class="T28">xaltúrištšik</span><span class="T2"> ‘one who does side‑jobs’ (</span><span class="T28">xaltúra</span><span class="T2"> ‘side‑job, non‑serious Job’), </span><span class="T28">katántšik</span><span class="T2"> ‘tiny’ (from </span><span class="T28">katan</span><span class="T2"> ‘small’), </span><span class="T28">šaméntšik</span><span class="T2"> ‘chubby’ (from </span><span class="T28">samen</span><span class="T2"> ‘fat’)</span></p><p class="P195"><span class="T28">‑ist</span><span class="T2"> ‘agent, activist’ </span><span class="T2">(Schwarzwald <a href="__schwarzwaldinflection1998__">1998</a>: 271)</span><span class="T2">, see also </span><span class="T2">(Bolozky <a href="__kayeisraeli2007__">2007</a>: 299–300)</span></p><p class="P195"><span class="T28">‑er </span><span class="T2">‘agent noun formation’, e.g. </span><span class="T28">širyoner</span><span class="T2"> ‘soldier in armor’ (from </span><span class="T28">širyon</span><span class="T2"> ‘armor’) </span><span class="T2">(Bolozky <a href="__bolozkymeasuring1999__">1999</a>: 199)</span></p><p class="P212"> </p><p class="P33">2 abstract noun formation suffixes</p><p class="P195"><span class="T2">‑</span><span class="T28">ológya</span><span class="T2"> (according to Uri Tadmor only comically, such as </span><span class="T28">xupológya</span><span class="T2"> ‘marital‑canopy studies’, </span><span class="T28">xoxmológya</span><span class="T2"> ‘smart‑alec‑ness’)</span></p><p class="P195"><span class="T28">‑izm</span><span class="T2">, e.g. </span><span class="T28">bitxonízm </span><span class="T2">‘emphasis on security’, </span><span class="T28">bicu’izm </span><span class="T2">‘no‑nonsense, hands‑on approach’ </span><span class="T2">(Bolozky <a href="__bolozkymeasuring1999__">1999</a>: 111, 224)</span></p></td>	\N	104	102	Eurasia	high	0	6	6
17	2013-11-19 20:49:34.053077+01	2013-11-19 20:49:34.053081+01	t	\N	19	Dutch affixes in Indonesian	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Jones (<a href="__verhaarloanwords1984__">1984</a>), Verhaar (<a href="__purwoaffixation1984__">1984</a>), Tadmor <span class="T69">(<a href="__tadmorloanwords20091__">2009</a>)</span><span class="T69"> and personal communications from Uri Tadmor, David Gil, John Bowden, and a number of Indonesians working at the Jakarta Field Station of the Max Planck Institute for Evolutionary Anthropology</span>. Below only affixes that are attested with non‑Dutch stems are given.</p><p class="P10"> </p><p class="P33">10 derivational prefixes <span class="T69">are attested with non‑Dutch stems</span></p><p class="P195"><span class="T28">a‑ </span><span class="T2">‘negative’, e.g. </span><span class="T28">a‑susila </span><span class="T2">‘immoral’ (</span><span class="T28">susila</span><span class="T2"> is probably a Sanskrit borrowing, but certainly not Dutch). The form </span><span class="T28">a‑</span><span class="T2"> is not mentioned as being (also) a loan from Sanskrit by Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 20–21)</span><span class="T42">.</span></p><p class="P195"><span class="T28">anti‑ </span><span class="T2">‘anti’</span><span class="T28">, </span><span class="T2">e.g. </span><span class="T28">anti‑kuman </span><span class="T2">‘anti‑germ’, </span><span class="T28">anti nyamuk </span><span class="T2">‘anti‑mosquito’,</span><span class="T28"> anti cewek </span><span class="T2">‘anti‑girls’,</span><span class="T28"> anti cowok </span><span class="T2">‘anti‑boys’,</span><span class="T28"> saya anti pemikiran Tessa</span><span class="T2"> ‘I’m against what Tessa thinks’. Jakarta respondents feel that although </span><span class="T28">anti</span><span class="T2"> is productive it is not really an affix but an independent adverb.</span></p><p class="P206"><span class="T28">eks‑ </span><span class="T2">‘former’, e.g. </span><span class="T28">eks pacar </span><span class="T2">‘ex girlfriend/boyfriend’</span><span class="T28">, eks narapidana </span><span class="T2">‘ex convict’</span><span class="T28">, eks tapol</span><span class="T2"> ‘ex‑political prisoner’. Possibly </span><span class="T28">eks</span><span class="T2"> is an independent word.</span></p><p class="P195"><span class="T28">ekstra‑</span><span class="T2"> ‘extra’, e.g. </span><span class="T28">ekstra ketat</span><span class="T2"> ‘superstrict’,</span><span class="T28"> ekstra hatihati </span><span class="T2">‘supercareful’. These examples were provided by Uri Tadmor, this prefix is not mentioned by Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 20–21)</span><span class="T2">. Possibly </span><span class="T28">ekstra</span><span class="T2"> is an independent word rather than a prefix.</span></p><p class="P195"><span class="T28">inter‑ </span><span class="T2">‘inter’, e.g. </span><span class="T28">intersuku </span><span class="T6">‘inter‑tribal’,</span><span class="T28"> interkeluarga </span><span class="T6">‘inter‑</span><span class="T2">familiar</span><span class="T6">’ </span><span class="T2">(example from the</span><span class="T28"> </span><span class="T12">SEAlang Library Indonesian Text Corpus, see http://sealang.net/indonesia</span><span class="T2">)</span></p><p class="P195"><span class="T29">kontra‑ </span><span class="T6">‘contra’</span><span class="T2">,</span><span class="T6"> </span><span class="T2">e.g. </span><span class="T29">kontra alami </span><span class="T6">‘unnatural’,</span><span class="T29"> saya kontra dengan pemikiran Tessa </span><span class="T6">‘I’m against what Tessa thinks’. </span><span class="T29">K</span><span class="T28">ontra</span><span class="T2"> may be an independent adverb rather than a prefix.</span></p><p class="P195"><span class="T29">non‑ </span><span class="T6">‘negative’, </span><span class="T2">e.g. </span><span class="T29">non‑migas </span><span class="T6">‘non‑fossile fuels’</span></p><p class="P195"><span class="T29">pro‑ </span><span class="T6">‘pro’, </span><span class="T2">e.g. </span><span class="T29">pro banci </span><span class="T6">‘pro‑transvestite’,</span><span class="T29"> pro Amerika </span><span class="T6">‘pro‑America’,</span><span class="T29"> kamu pro atau anti pemikiran Tessa?</span><span class="T6"> ‘are you for or against what Tessa thinks?’</span></p><p class="P195"><span class="T29">sub‑ </span><span class="T6">‘sub’</span><span class="T29">, </span><span class="T2">e.g. </span><span class="T29">sub‑bagian </span><span class="T6">‘subpart’,</span><span class="T29"> sub‑bab </span><span class="T6">‘subchapter’</span><span class="T29"> </span><span class="T6">(</span><span class="T28">bab</span><span class="T2"> ‘chapter’ is borrowed from Arabic)</span></p><p class="P195"><span class="T29">super‑ </span><span class="T6">‘super’, </span><span class="T2">e.g. </span><span class="T29">super mahal </span><span class="T6">‘very expensive’ (example provided by Uri Tadmor)</span></p><p class="P214"> </p><p class="P11"><span class="T48">3 abstract-noun forming suffixes</span>, that are attested with non‑Dutch stems</p><p class="P195"><span class="T28">‑isme </span><span class="T2">‘abstract noun’, e.g. </span><span class="T28">caloisme</span><span class="T2"> ‘a mentality and system characterized by using the power of one’s position for personal gain’ (from </span><span class="T28">calo</span><span class="T2"> ‘agent or intermediary who negotiates government things on behalf of you’), </span><span class="T28">premanisme</span><span class="T2"> ‘gangsterism’ (from </span><span class="T28">preman</span><span class="T2"> ‘gangster’), </span><span class="T28">bencongisme </span><span class="T2">‘trans‑genderism’</span></p><p class="P195"><span class="T29">‑asi</span><span class="T109"> </span><span class="T6">‘abstract noun’, </span><span class="T2">e.g. </span><span class="T29">kondomi‑sasi </span><span class="T6">‘spreading the use of condoms’ (this example is also given by Verhaar </span><span class="T2">(<a href="__purwoaffixation1984__">1984</a>: 24)</span><span class="T6">). This suffix is probably not the same as </span><span class="T29">‑isasi</span><span class="T6">. Its status as an affix is disputed by de Vries </span><span class="T6">(<a href="__devriesadaptation1984__">1984</a>)</span><span class="T6">, see also Mueller </span><span class="T6">(<a href="__kayeindonesian2007__">2007</a>: 1220)</span><span class="T6">.</span></p><p class="P205"><span class="T28">‑isasi </span><span class="T6">‘abstract noun formation’</span><span class="T28">, </span><span class="T2">e.g. </span><span class="T28">swastnisasi</span><span class="T2"> ‘privatization’ (from </span><span class="T28">swasta</span><span class="T2"> ‘private business), </span><span class="T28">kapurisasi </span><span class="T6">‘adding lime (calcium)’ (in both examples, the stems are also borrowed from Sanskrit, but these nouns were formed in Indonesian. </span><span class="T2">The complete form of this suffix is </span><span class="T28">‑(n)isasi </span><span class="T2">with </span><span class="T28">n</span><span class="T2"> occurring after vowel‑final roots. </span><span class="T6">Its status as a productive affix is argued for by de Vries </span><span class="T6">(<a href="__devriesadaptation1984__">1984</a>)</span><span class="T6">, see also Mueller </span><span class="T6">(<a href="__kayeindonesian2007__">2007</a>: 1220)</span><span class="T6">.</span></p></td>	\N	42	131	Southeast Asia & Oceania	high	0	13	13
25	2013-11-19 20:49:34.200931+01	2013-11-19 20:49:34.200939+01	t	\N	28	Nepali affixes in Chantyal	<td class="Table1_D26" style="text-align:left;width:4.8694in; "><p class="P10"><span class="T69">Information from Noonan </span><span class="T69">(<a href="__noonanchantyal2003__">2003</a>; <a href="__noonancontactinduced2008__">2008</a>)</span><span class="T69">, for some background see also Noonan </span><span class="T69">(<a href="__noonanrise1996__">1996</a>)</span><span class="T69">. Examples from Noonan and </span>Bhulanja<span class="T69"> </span><span class="T69">(<a href="__noonanchantyal2005__">2005</a>)</span><span class="T69">.</span></p><p class="P11"> </p><p class="P28"><span class="T48">4 case markers</span>, out of 22 Chantyal case markers</p><p class="P210"><span class="T28">‑siŋ, ‑səŋ, ‑səŋə, ‑səŋgə </span><span class="T2">‘allative/comitative’, e.g. </span><span class="T28">na‑siŋ</span><span class="T2"> ‘I (had)’, </span><span class="T28">gəjjab‑siŋ</span><span class="T2"> ‘with goodness’</span></p><p class="P210"><span class="T28">‑ma, ‑wã</span><span class="T2"> ‘temporal’, e.g. </span><span class="T28">bis bərsə‑ma</span><span class="T2"> (twenty/year‑</span><span class="T53">temporal</span><span class="T2">) ‘in twenty years’</span></p><p class="P2"><span class="T28">‑bɦənda </span><span class="T6">‘</span><span class="T2">comparative/temporal’, e.g. </span><span class="T28">nakhu‑bɦənda </span><span class="T2">‘(bigger) than a dog’ </span><span class="T2">(example from Noonan <a href="__noonanchantyal2003__">2003</a>: 320)</span></p><p class="P205"><span class="T28">‑dɦin, ‑dɦikin </span><span class="T2">‘comparative/temporal’, e.g. </span><span class="T28">khawa‑dɦikin</span><span class="T2"> (coming‑</span><span class="T53">temporal)</span><span class="T2"> ‘since I had come home’, </span><span class="T28">pəyle‑dɦikin</span><span class="T2"> ‘since the first’</span></p><p class="P17"> </p><p class="P17"><span class="T48">2 subordinators</span>, out of 4 Chantyal subordinators</p><p class="P230"><span class="T2">-</span><span class="T30">nu </span><span class="T13">‘</span><span class="T2">infinitive’, e.g. </span><span class="T30">th</span><span class="T28">ũ</span><span class="T30">-nu la-g</span><span class="T28">ə</span><span class="T30">y a-th</span><span class="T28">ũ</span><span class="T2"> (drink-</span><span class="T53">infinitive</span><span class="T2">/do-</span><span class="T53">progressive/negative</span><span class="T2">-drink) ‘she was about to drink, but didn’t’</span></p><p class="P231"><span class="T2">-</span><span class="T30">khiri</span><span class="T2">, </span><span class="T30">-khir</span><span class="T2">, </span><span class="T30">-khi </span><span class="T2">‘cotemporal’, e.g. </span><span class="T28">ca-wa-khiri</span><span class="T2"> (eat-</span><span class="T53">nominalization-cotemporal</span><span class="T2">) ‘when we eat’, </span><span class="T28">thaa ta-wa-khiri</span><span class="T2"> (knowledge/become-</span><span class="T53">nominalization-simultaneous</span><span class="T2">) ‘when they know’</span></p><p class="P11"> </p><p class="P10"><span class="T69">In addition, Chantyal borrowed all numerals (cardinal and ordinal), with two classifier</span> suffixes for human vs. nonhuman used on numerals ‘one’, ‘two’, ‘three’. These classifiers are not counted here because their use is restricted to borrowed stems. </p></td>	\N	5	15	Eurasia	high	0	4	4
18	2013-11-19 20:49:34.063172+01	2013-11-19 20:49:34.063176+01	t	\N	20	Turkish affixes in Cappadocian Greek	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P2"><span class="T6">Information and examples are from Dawkins </span><span class="T6">(<a href="__dawkinsmodern1916__">1916</a>)</span><span class="T6"> and Janse </span><span class="T6">(<a href="__janseagglutination2009__">2009a</a>; <a href="__jansegreekturkish2009__">2009b</a>)</span><span class="T6">. Cappadocian Greek has undergone heavy lexical and structural influence from Turkish, moving away from fusional and towards agglutinating structures, with some morphological borrowing. Different forms are attested in different dialects with only partial overlap. Dawkins </span><span class="T6">(<a href="__dawkinsmodern1916__">1916</a>: 130)</span><span class="T6"> explicitly notes that </span><span class="T28">‑lan</span><span class="T2"> ‘verbalizer, deriving intransitive verbs from adjectives’ and </span><span class="T28">‑t</span><span class="T2"> ‘causative’ </span><span class="T6">“occasionally find their way into Greek words”.</span></p><p class="P11"> </p><p class="P34">1 verbal derivational markers</p><p class="P195"><span class="T28">‑lan</span><span class="T2"> ‘verbalizer, deriving intransitive verbs from adjectives’, recorded in Ferték dialect, e.g. </span><span class="T28">ἀστενάρλανσε</span><span class="T2"> ‘he became ill’</span></p><p class="P212"> </p><p class="P217">1 valency-changing suffix</p><p class="P195"><span class="T28">‑t</span><span class="T2"> ‘causative’, recorded in Ulağaç dialect, e.g. </span><span class="T28">ψοφάτσαν</span><span class="T2"> ‘they killed him’</span></p><p class="P212"> </p><p class="P11"><span class="T48">2 subject agreement markers</span>, in Semenderé and (similarly) Sillí dialects (Dawkins <a href="__dawkinsmodern1916__">1916</a>: 144)</p><p class="P195"><span class="T28">‑k</span><span class="T2"> ‘first plural’, e.g. </span><span class="T28">κέτουμιστικ</span><span class="T2"> ‘we exist’</span></p><p class="P195"><span class="T28">‑inis</span><span class="T2"> ‘second plural’, e.g. </span><span class="T28">κέτουστινις</span><span class="T2"> ‘they exist’</span></p><p class="P2"><span class="T2">The borrowing of these forms is “probably due to the resemblance of </span><span class="T30">‑misti </span><span class="T2">with the Turkish pluperfect in </span><span class="T30">‑mIs‑tI </span><span class="T2">to which the 1st and 2nd person plural markers </span><span class="T30">‑k </span><span class="T2">and </span><span class="T30">‑nIz </span><span class="T2">are added. The Semenderé forms seem to replicate the Central Anatolian Turkish pluperfect in </span><span class="T30">‑DI‑mIș‑tI</span><span class="T2">, e.g. </span><span class="T30">ol‑du‑muș‑tu‑k </span><span class="T2">→ </span><span class="T30">cé‑tun‑mis‑ti‑c</span><span class="T2">” </span><span class="T2">(Janse <a href="__jansegreekturkish2009__">2009b</a>)</span><span class="T2">.</span></p><p class="P30"> </p><p class="P34">1 element in possessive pronouns</p><p class="P195"><span class="T28">‑ï</span><span class="T2">, a</span><span class="T28"> </span><span class="T6">re‑analyzed Turkish element used in the formation of possessive suffixes, which are accordingly all partially Turkish, e.g. </span><span class="T53">1sg </span><span class="T28">‑ïm </span><span class="T2">(combination of Turkish possessive element </span><span class="T28">‑ï</span><span class="T2"> and the element </span><span class="T28">m</span><span class="T2">, which occurs in the native Greek and Turkish form), </span><span class="T53">2sg </span><span class="T28">‑ïs </span><span class="T2">(combination of Turkish possessive element </span><span class="T28">‑ï</span><span class="T2"> and native Greek element </span><span class="T28">s</span><span class="T2">), </span><span class="T53">3sg </span><span class="T28">‑ït </span><span class="T2">(combination of Turkish possessive element </span><span class="T28">‑ï</span><span class="T2"> and the native Greek element </span><span class="T28">t</span><span class="T2">), </span><span class="T53">1pl </span><span class="T28">‑ïmas </span><span class="T2">(combination of Turkish possessive element </span><span class="T28">‑ï</span><span class="T2"> and native Greek </span><span class="T28">mas</span><span class="T2">), </span><span class="T53">2pl </span><span class="T28">‑ïsas </span><span class="T2">(combination of Turkish possessive element </span><span class="T28">‑ï</span><span class="T2"> and native Greek </span><span class="T28">sas</span><span class="T2">), </span><span class="T53">3pl </span><span class="T28">‑ïtne </span><span class="T2">(combination of Turkish possessive element </span><span class="T28">‑ï</span><span class="T2"> and </span><span class="T28">‑tne</span><span class="T2">, which is of unclear origin) </span><span class="T2">(examples from Janse <a href="__jansegreekturkish2009__">2009b</a>)</span><span class="T2">.</span></p></td>	\N	80	81	Eurasia	high	0	2	5
19	2013-11-19 20:49:34.072167+01	2013-11-19 20:49:34.072183+01	t	\N	21	Greek affixes in Kormakiti	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10"><span class="T69">Information and examples mainly from Borg </span>(<a href="__borgcypriot1985__">1985</a>: 125–126)<span class="T69"> and Kossmann </span><span class="T69">(<a href="__kossmannnature2008__">2008</a>; <a href="__kossmanninflectional2011__">2011</a>)</span><span class="T69"> </span>(see also Newton <a href="__newtonarabicgreek1964__">1964</a>;  Tsiapera <a href="__tsiaperagreek1964__">1964</a>: 125–126;  Roth <a href="__rothverbe1979__">1979</a>;  Roth <a href="__lentinoppositions2003__">2003</a>). <span class="T69">Kormakiti, i.e. Arabic spoken on Cyprus, </span>has very many Greek loanwords which retain their Greek morphology, but relatively little Greek morphology is used on native Arabic stems, with one major exception: a set of suffixes marking diminutive, which is further specified for gender and number. These are productively used on Arabic nouns.</p><p class="P10"> </p><p class="P33">1 diminutive marker and 4 gender/number marking suffixes</p><p class="P2"><span class="T28">‑u </span><span class="T2">‘diminutive’</span></p><p class="P2"><span class="T28">‑i </span><span class="T2">‘masculine singular’</span></p><p class="P2"><span class="T28">‑kkya</span><span class="T60"> </span><span class="T53">‘</span><span class="T2">masculine plural’</span></p><p class="P2"><span class="T28">‑a </span><span class="T2">‘feminine singular’</span></p><p class="P2"><span class="T2">‑</span><span class="T28">úes </span><span class="T2">‘feminine plural’</span></p><p class="P2"><span class="T2">Examples of hybrids: </span><span class="T28">payt‑u‑i </span><span class="T2">‘little house’, </span><span class="T28">payt‑u‑kkya </span><span class="T2">‘little houses’ (from </span><span class="T28">payt</span><span class="T2"> ‘house’ (masc.)), </span><span class="T28">mišl‑u‑a</span><span class="T2"> ‘little ladle’, </span><span class="T28">mišl‑u‑es</span><span class="T2"> ‘little ladles’ (from </span><span class="T28">mišl‑e </span><span class="T2">‘ladle’ (fem.)).</span></p></td>	\N	77	62	Eurasia	high	0	5	5
20	2013-11-19 20:49:34.095402+01	2013-11-19 20:49:34.095415+01	t	\N	22	Libyan Arabic affixes in Siwi	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P11">Information and examples are from Souag (<a href="__souaggrammatical2010__">2010</a>), see also Souag (<a href="__souagsiwa2009__">2009</a>). There are five borrowed affixes/fusional patterns.</p><p class="P11"> </p><p class="P34">2 comparative/superlative markers</p><p class="P195"><span class="T30">C1C2əC3 </span><span class="T2">template imposed on triliteral adjectives ‘</span><span class="T6">comparative’, e.g. </span><span class="T30">gzəl </span><span class="T2">‘shorter’ (from </span><span class="T30">agzāl </span><span class="T2">‘short’), </span><span class="T30">zṭəf </span><span class="T2">‘blacker’ (from </span><span class="T30">azəṭtạ̄f </span><span class="T2">‘black’), </span><span class="T30">zwər </span><span class="T2">‘bigger’ (from </span><span class="T30">azuwwār </span><span class="T2">‘big’)</span><span class="T6"> </span><span class="T6">(Souag <a href="__souaggrammatical2010__">2010</a>: 158)</span></p><p class="P195"><span class="T30">‑hum </span><span class="T13">‘</span><span class="T6">superlative’, e.g. </span><span class="T30">zwərhum </span><span class="T2">‘the biggest’ (from </span><span class="T30">azuwwār </span><span class="T2">‘big’) </span><span class="T6">(Souag <a href="__souaggrammatical2010__">2010</a>: 159)</span><span class="T2">.</span><span class="T6"> Note that Souag </span><span class="T6">(<a href="__souaggrammatical2010__">2010</a>: 38)</span><span class="T6"> talks about “</span><span class="T2">full productivity of the Arabic comparative/superlative template in Siwi.”</span></p><p class="P11"> </p><p class="P34">2 nominalizing root patterns</p><p class="P195"><span class="T30">āCəCCēCī </span><span class="T6">template ‘agent (habitual doer)’, e.g. </span><span class="T30">aččēwī </span><span class="T2">‘glutton’ (from </span><span class="T30">əčč </span><span class="T2">‘eat’), </span><span class="T30">aruwwēlī </span><span class="T2">‘flee‑er’ (from</span><span class="T30"> rwəl </span><span class="T2">‘flee’), </span><span class="T30">ajəllēwī </span><span class="T2">‘someone who swears a lot’ (from</span><span class="T30"> jəll </span><span class="T2">‘swear’) </span><span class="T2">(Souag <a href="__souaggrammatical2010__">2010</a>: 422)</span></p><p class="P195"><span class="T30">lə‑/əl‑ </span><span class="T2">+ </span><span class="T30">C1C2āC3ət </span><span class="T6">template ‘deadjectival nominalizer’, e.g. </span><span class="T30">ləmlālət </span><span class="T2">‘whiteness’ (from </span><span class="T30">aməllāl </span><span class="T2">‘white’), </span><span class="T30">zzṭāfət </span><span class="T2">‘blackness’ (from </span><span class="T30">azəṭtạ̄f </span><span class="T2">‘black’), </span><span class="T30">əzzwārət </span><span class="T2">‘bigness, size’ (from </span><span class="T30">āzuwwār </span><span class="T2">‘big’) </span><span class="T6">(Souag <a href="__souaggrammatical2010__">2010</a>: 161)</span></p><p class="P10"> </p><p class="P34">1 verbal derivational prefix</p><p class="P195"><span class="T30">dā‑</span><span class="T6"> ‘suggestive’, e.g. </span><span class="T30">dā‑təġḍəb! </span><span class="T2">‘let her get angry!’, </span><span class="T30">dā‑iẓnant! </span><span class="T2">‘let them [Algeria and Morocco] divide it!’ </span><span class="T6">(Souag <a href="__souaggrammatical2010__">2010</a>: 384)</span><span class="T6">. It probably comes from </span><span class="T94">Classical Arabic imperative </span><span class="T93">daʕ </span><span class="T94">‘leave, let’ </span><span class="T6">(Souag <a href="__souaggrammatical2010__">2010</a>: 379)</span><span class="T6">.</span></p><p class="P10"> </p><p class="P2"><span class="T2">Additionally, there are two plural morphemes which are each only attested with one native Siwi (Berber) stem, thus they are not counted here, especially because it can be expected that </span><span class="T6">Souag’s </span><span class="T6">(<a href="__souaggrammatical2010__">2010</a>)</span><span class="T6"> detailed study would have uncovered further hybrid formations if they existed</span><span class="T2">: </span><span class="T96">lə‑CCaCəC, </span><span class="T91">e.g. </span><span class="T96">lŭgrazən </span><span class="T91">‘dogs’ (from </span><span class="T96">agŭrzni </span><span class="T90">‘dog’) </span><span class="T90">(Souag <a href="__souaggrammatical2010__">2010</a>: 90)</span><span class="T90">, </span><span class="T96">lə‑kdew‑a </span><span class="T98">‘squashes’ (from </span><span class="T96">lə‑kdew‑iyy‑at </span><span class="T90">‘squash’) </span><span class="T90">(Souag <a href="__souaggrammatical2010__">2010</a>: 88)</span><span class="T6">.</span></p></td>	\N	12	109	Africa	high	0	4	5
21	2013-11-19 20:49:34.122565+01	2013-11-19 20:49:34.122571+01	t	\N	23	Nunggubuyu affixes in Warndarang	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P26">Information and examples are from Heath <span class="T69">(<a href="__heathlinguistic1978__">1978a</a>; <a href="__heathbasic19801__">1980a</a>; <a href="__heathfunctional1984__">1984</a>)</span><span class="T69">. </span>5 suffixes were borrowed</p><p class="P14"> </p><p class="P26"><span class="T48">3 noun class prefixes</span> (out of a paradigm of 8 noun class prefixes in Warndarang) (Heath <a href="__heathbasic19801__">1980a</a>: 22–25); nouns can occur without prefixes, but usually take one.</p><p class="P207"><span class="T32">(ṛ)a‑ </span><span class="T16">‘indefinite/non‑human class I’ (also </span><span class="T2">optionally used in place of a human prefix)</span><span class="T16">, e.g.</span><span class="T32"> ṛ</span><span class="T28">a‑wa</span><span class="T32">ṛiyi</span><span class="T28"> </span><span class="T2">‘Aborigine(s)’, </span><span class="T32">ṛ</span><span class="T28">a‑jamaļagu</span><span class="T2"> ‘tapsticks’, </span><span class="T28">ra‑waluŋma</span><span class="T2"> ‘</span><span class="T13">python’ </span><span class="T16">(Heath <a href="__heathbasic19801__">1980a</a>: 23, 25, 26)</span></p><p class="P209"><span class="T28">wu‑ </span><span class="T2">‘non‑human class II’, e.g. </span><span class="T28">wu‑bunjiyu </span><span class="T2">‘honey’, </span><span class="T28">wu‑ndawaynu</span><span class="T2"> ‘words’, </span><span class="T28">wu‑jambaguwnu</span><span class="T2"> ‘tobacco’ </span><span class="T2">(Heath <a href="__heathbasic19801__">1980a</a>: 25)</span></p><p class="P207"><span class="T32">ma‑ </span><span class="T16">‘non‑human class III’, e.g. </span><span class="T28">ma-ḍuŋal</span><span class="T2"> ‘s</span><span class="T13">pear’, </span><span class="T30">ma‑gamba</span><span class="T13"> ‘pearl shell’, </span><span class="T30">ma‑yimbiḍgu </span><span class="T13">‘cypress’ </span><span class="T16">(Heath <a href="__heathbasic19801__">1980a</a>: 25)</span></p><p class="P23"> </p><p class="P238"><span class="T48">2 case markers</span> (out of a paradigm of 5 case markers in Warndarang (Heath <a href="__heathbasic19801__">1980a</a>: 26–28)</p><p class="P207"><span class="T32">‑wala </span><span class="T16">‘ablative’, e.g. </span><span class="T28">wuyulbawala</span><span class="T2"> ‘from </span><span class="T13">the tree’ </span><span class="T16">(Heath <a href="__heathbasic19801__">1980a</a>: 26)</span><span class="T16">, </span><span class="T32">wunaya‑wala</span><span class="T16"> ‘from here’, </span><span class="T32">awuni‑wala</span><span class="T16"> ‘from there’ </span><span class="T16">(Heath <a href="__heathbasic19801__">1980a</a>: 53)</span></p><p class="P207"><span class="T32">‑miri </span><span class="T16">‘instrumental’, e.g. </span><span class="T28">maḍuŋamiri</span><span class="T2"> ‘</span><span class="T13">by means of spears’ </span><span class="T2">(three examples attested in corpora, but only one example given in Heath 1980a:26–27)</span><span class="T16">.</span></p></td>	\N	19	140	Australia & New Guinea	mid	1	5	5
22	2013-11-19 20:49:34.14673+01	2013-11-19 20:49:34.146734+01	t	\N	25	Turkish affixes in Albanian	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10"><span class="T69">Information and examples are mostly from Boretzky </span>(<a href="__boretzkyturkische1975__">1975a</a>: 265–270)<span class="T69">, some additional examples form </span>Xhuvani and Çabej<span class="T69"> </span>(<a href="__xhuvaniprapashtesat1962__">1962</a>)<span class="T69">. Information on the etymologies of stems comes from Orel </span><span class="T69">(<a href="__orelalbanian1998__">1998</a>)</span><span class="T69">. According to Boretzky </span>(<a href="__boretzkyturkische1975__">1975a</a>: 265)<span class="T69">, there are many Turkish suffixes in Albanian, but only 3‑4 are used to derive more than a few Albanian stems. Boretzky </span>(<a href="__boretzkyturkische1975__">1975a</a>: 265–270)<span class="T69"> nevertheless lists five borrowed suffixes and gives examples of combinations with native stems for each. Some of them may be restricted to spoken varieties.</span></p><p class="P11"> </p><p class="P34">4 nominalizers</p><p class="P195"><span class="T29">‑xhi/‑çi</span><span class="T6"> ‘profession derivation’, e.g. </span><span class="T29">derraxhi </span><span class="T6">‘swineherd’ (from </span><span class="T29">derre</span><span class="T6"> ‘pig’), </span><span class="T29">djathëxhi </span><span class="T6">‘cheese maker’ (from </span><span class="T29">djathë </span><span class="T6">‘cheese’), </span><span class="T29">lëkuraxhi </span><span class="T6">‘skinner’ (from </span><span class="T29">lëkurë </span><span class="T6">‘skin’). Boretzky </span><span class="T2">(<a href="__boretzkyturkische1975__">1975a</a>: 265–270)</span><span class="T6"> found about 40 derivations with this suffix, but expects there are many more. Brian Joseph (personal communication, July 2011) confirms that this suffix is productively used.</span></p><p class="P195"><span class="T29">‑ll</span><span class="T32">ëk</span><span class="T16"> ‘abstract noun nominalizer (from adverbs, and others)’, e.g. </span><span class="T32">zjarrl</span><span class="T29">ëk </span><span class="T6">‘burning heat’ (from </span><span class="T29">zjarr</span><span class="T6"> ‘fire’). </span><span class="T16">According to </span><span class="T6">Brian Joseph (personal communication July 2011) this suffix is not very productively used.</span></p><p class="P208"><span class="T28">‑li/‑lli</span><span class="T2"> ‘designation of residents’, e.g. </span><span class="T28">vendali</span><span class="T2"> ‘inhabitant’ (from </span><span class="T28">vend </span><span class="T2">‘place’), </span><span class="T28">Elbasanlli</span><span class="T2"> ‘inhabitant of Elbasan’, </span><span class="T28">Tiranalli </span><span class="T2">‘inhabitant of Tirana’</span></p><p class="P195"><span class="T32">‑qar</span><span class="T16"> ‘</span><span class="T2">nouns denoting a quality or a person having a quality that is denoted by the noun or verb from which it is derived’</span><span class="T16">, e.g. </span><span class="T32">nihma</span><span class="T29">çar </span><span class="T6">‘helper’ (from </span><span class="T29">ndihmë</span><span class="T6"> ‘help’), </span><span class="T29">mundqar </span><span class="T6">‘someone who earns his daily bread with effort’ (from </span><span class="T29">mund </span><span class="T6">‘effort’)</span></p><p class="P214"> </p><p class="P34">1 adjectivizer</p><p class="P195"><span class="T29">‑çe</span><span class="T6"> ‘</span><span class="T16">ethnic or regional terms, and other derivations’, e.g. </span><span class="T32">Shqipëtar</span><span class="T29">çe</span><span class="T32"> </span><span class="T16">‘Albanian (adj.)’ </span><span class="T6">(from </span><span class="T32">Shqipëtar</span><span class="T29"> </span><span class="T16">‘Albanian (person)’), </span><span class="T32">vend</span><span class="T29">çe</span><span class="T16"> ‘locally’ (from </span><span class="T32">vend</span><span class="T16"> ‘place’), </span><span class="T32">derr</span><span class="T29">çe</span><span class="T16"> ‘pig‑like’ (from </span><span class="T32">derr </span><span class="T16">‘pig’). </span><span class="T6">Brian Joseph (personal communication, July 2011) confirms that this suffix is productively used.</span></p><p class="P214"> </p><p class="P34">1 plural marker</p><p class="P201"><span class="T28">‑lar ~ ‑llar ~ lerë</span><span class="T2"> ‘male human plural’, e.g. </span><span class="T28">mbretlerë </span><span class="T2">‘emperor’ (from </span><span class="T28">mbret</span><span class="T2">, originally from Latin), </span><span class="T28">priʃtlerë </span><span class="T2">‘priests’ (from </span><span class="T28">priʃt</span><span class="T2">, originally from Latin), </span><span class="T28">giyshllar</span><span class="T2"> ‘grandfathers’ (from </span><span class="T28">giyish</span><span class="T2">, from Proto Albanian) (examples from Gardani </span><span class="T2">(<a href="__gardaniborrowing2008__">2008</a>: 72)</span><span class="T2">, who cites Fiedler </span><span class="T2">(<a href="__fiedlerpluralbildung1977__">1977</a>)</span><span class="T2">. This form is used on a few words, probably most of them of Turkish origin, according to Brian Joseph (personal communication, July 2011). </span></p></td>	\N	18	81	Eurasia	high	0	4	6
23	2013-11-19 20:49:34.15763+01	2013-11-19 20:49:34.15764+01	t	\N	26	Carib affixes in Garifuna	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from <span class="T69">Taylor </span><span class="T71">(<a href="__taylordiachronic1954__">1954</a>; <a href="__taylorisland1956__">1956</a>; <a href="__taylormorpheme1959__">1959</a>; <a href="__taylorlanguages1977__">1977</a>)</span><span class="T71">, Taylor and Hoff</span><span class="T69"> </span><span class="T71">(<a href="__taylorlinguistic1980__">1980</a>)</span><span class="T71">, Hoff</span> <span class="T71">(<a href="__hoffevidentiality1986__">1986</a>)</span><span class="T71">, </span>de Pury <span class="T69">(<a href="__depurygarifuna2001__">2001</a>; <a href="__chamoreaugenero2005__">2005</a>)</span><span class="T69">, and </span>Escure (<a href="__escuregarifuna2004__">2004</a>: 45–46; <a href="__escuregrammaticalizaion2012__">2012</a>). See also <span class="T69">Grant </span><span class="T69">(<a href="__grantcontactinduced2010__">2010</a>)</span><span class="T69">.</span></p><p class="P42"> </p><p class="P39">1 possessive person‑marker prefix</p><p class="P195"><span class="T40">i‑</span><span class="T10"> ‘first singular possessor’, e.g. </span><span class="T40">iuaku</span><span class="T10"> ‘my drink’, </span><span class="T40">iúti</span><span class="T10"> ‘my share (of food etc.)’ </span><span class="T2">(Taylor <a href="__taylorisland1956__">1956</a>: 39)</span></p><p class="P10"> </p><p class="P33">1 collective (plural) suffix</p><p class="P205"><span class="T40">‑gu</span><span class="T10"> ‘collective, plural’, e.g. </span><span class="T40">níbirigu</span><span class="T10"> ‘my younger siblings’, </span><span class="T40">numégegu</span><span class="T10"> ‘my (personal) belongings’, </span><span class="T40">nibą́iagu</span><span class="T10"> ‘my grandchildren’, </span><span class="T40">tibegu</span><span class="T10"> ‘her people’ </span><span class="T2">(Taylor <a href="__taylormorpheme1959__">1959</a>: 190–191)</span></p><p class="P49"> </p><p class="P2"><span class="T10">Note that Escure </span><span class="T2">(<a href="__escuregarifuna2004__">2004</a>: 45–46)</span><span class="T2"> discusses a number of further affixes of putative Carib origin, in particular a nominalizing suffix </span><span class="T28">‑un(i)</span><span class="T2">, and a large number of evidential particles (or suffixes) of which she discusses in particular </span><span class="T28">‑ti</span><span class="T2"> (hearsay), </span><span class="T28">‑na</span><span class="T2"> (uncertainty), and </span><span class="T28">‑me</span><span class="T2"> (deductive). However, </span><span class="T7">no corresponding elements have been identified in Carib (Kalin’a, Galibi), the source language for Cariban material in Garifuna. For the evidential particles, </span><span class="T10">Escure </span><span class="T2">(<a href="__escuregarifuna2004__">2004</a>: 45–46)</span><span class="T2"> cites similar‑looking forms from Hixkaryana as sources forms </span><span class="T2">(Derbyshire <a href="__derbyshirecarib1999__">1999</a>: 53)</span><span class="T2">, but Hixkaryana</span><span class="T7"> is from a different branch of the Cariban family. Additionally, the Garifuna evidential particles are only attested in </span><span class="T10">Escure’s </span><span class="T2">(<a href="__escuregarifuna2004__">2004</a>: 45–46)</span><span class="T2"> material, and not mentioned by other </span><span class="T7">sources. For the nominalizing suffix, </span><span class="T2">Lokono/Arawak (the Arawakan language most closely related to Garifuna) </span><span class="T28">‑n </span><span class="T2">(Pet <a href="__petgrammar2011__">2011</a>: 22–24 )</span><span class="T2">, seems a likely cognate, which means the form would be native.</span></p></td>	\N	133	79	South America	mid	1	0	2
26	2013-11-19 20:49:34.234244+01	2013-11-19 20:49:34.234259+01	t	\N	29	Ngandi affixes in Ritharngu	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P11">Information and examples are from Heath (<a href="__heathlinguistic1978__">1978a</a>; <a href="__heathbasic1980__">1980b</a>).</p><p class="P10"> </p><p class="P38">4 suffixes which are not interrelated with other borrowed affixes</p><p class="P207"><span class="T28">‑kaʔ</span><span class="T2"> ‘kin‑term dyadic dual’, e.g. </span><span class="T28">gaykay‑kaʔ </span><span class="T2">‘uncle and niece’,</span><span class="T28"> mu:mu‑kaʔ </span><span class="T2">‘mother’s father’s sister and brother’s daughter’s child’, </span><span class="T28">wa:wa‑kaʔ</span><span class="T2"> ‘elder brother and younger sibling’ </span><span class="T2">(Heath <a href="__heathbasic1980__">1980b</a>: 25–26)</span></p><p class="P207"><span class="T28">‑ʔmayʔ</span><span class="T2"> ‘negative’, suffixed to verbs or other constituents, e.g. </span><span class="T28">wa:n‑i‑ʔmayʔ ṋi: </span><span class="T2">(go‑</span><span class="T53">future‑negative/</span><span class="T2">you) ‘Don’t go!’, </span><span class="T28">munaŋa‑ʔmayʔ ra</span><span class="T2"> (White‑</span><span class="T53">negative</span><span class="T2">/I) ‘I am not a White’ </span><span class="T2">(Heath <a href="__heathbasic1980__">1980b</a>: 101)</span></p><p class="P207"><span class="T28">‑bukiʔ</span><span class="T2"> ‘only’, rarely used, and no examples available </span><span class="T2">(Heath <a href="__heathbasic1980__">1980b</a>: 93)</span></p><p class="P207"><span class="T28">‑ʔwañjiʔ</span><span class="T2"> ‘semblative case’, e.g. </span><span class="T28">bakara‑ʔwañjiʔ </span><span class="T2">‘like long‑necked turtles’ </span><span class="T2">(Heath <a href="__heathbasic1980__">1980b</a>: 42)</span><span class="T2"> (out of a total of 14 case suffixes)</span></p><p class="P26"> </p><p class="P2"><span class="T2">Note that four more prefixes might be borrowed, but the directionality is unclear, therefore they are excluded here (see also the entry on Ngandi): two out of two derivational adverbializers (or “compounding elements”) </span><span class="T2">(Heath <a href="__heathbasic1980__">1980b</a>: 81)</span><span class="T2">: </span><span class="T28">malk‑ </span><span class="T2">‘times’ and </span><span class="T28">bala‑ </span><span class="T2">‘side’; and two out of three verbal derivation markers (called “comitative” by Heath) </span><span class="T2">(Heath <a href="__heathbasic1980__">1980b</a>: 79, 82–83)</span><span class="T2">: </span><span class="T28">baṱa‑</span><span class="T16"> ‘applicative’, forming (semantically) transitive verbs with comitative object from intransitive verbs, and </span><span class="T32">ṛay‑/yay‑</span><span class="T16"> ‘applicative marker’, forming transitive verbs with an object that denotes something transported from intransitive verbs of motion.</span></p></td>	\N	17	150	Australia & New Guinea	mid	1	0	4
27	2013-11-19 20:49:34.256525+01	2013-11-19 20:49:34.256528+01	t	\N	31	Ilokano affixes in Guina‑ang Bontok	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Lawrence Reid (personal communication, January 2012).</p><p class="P10"> </p><p class="P33">3 non-interrelated forms</p><p class="P195"><span class="T28">=to/=nto</span><span class="T2"> ‘future’, enclitisized to predicate, used in addition to inherited, preverbal future auxiliary. Only occurs in speech of younger generation (as of early 21st century), e.g. </span><span class="T28">mapan=ka=nto</span><span class="T2"> ‘you will go’</span></p><p class="P195"><span class="T28">mang‑/nang‑</span><span class="T2"> ‘completed aspect, intransitive’, replaced native </span><span class="T28">ma</span><span class="T2">{</span><span class="T28">n,n,ng</span><span class="T2">}‑ +deletion of initial consonant of stem, e.g. </span><span class="T28">nang‑sulbar</span><span class="T2"> ‘(they) solved’</span></p><p class="P195"><span class="T28">taga‑</span><span class="T2"> ‘a person from’ derivation, replaced native </span><span class="T28">i‑</span><span class="T2">; could be from Ilokano or Tagalog, e.g. </span><span class="T28">tagabaryo </span><span class="T2">‘someone from the neighborhood’</span></p></td>	\N	110	130	Southeast Asia & Oceania	high	0	0	3
28	2013-11-19 20:49:34.267948+01	2013-11-19 20:49:34.267955+01	t	\N	33	Kurdish affixes in Sonqor Turkic	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P11">Information and examples are from Bulut (<a href="__csatoiranian2005__">2005</a>; <a href="__bulutiraqi2007__">2007</a>) and Bulut (<a href="__bulutturkic__">In press</a>), which is partially based on material presented by Buluç (<a href="__bulucmendeli1975__">1975</a>). The borrowed affixes are attested in various Turkic varieties belonging to the South Oghuz dialect group spoken in Iran and Iraq.</p><p class="P11"> </p><p class="P11"><span class="T48">2 object pronoun enclitics</span>. Only these two are attested in corpora, although it is very likely that other object pronoun enclitics (different person and number) are also borrowed (Christiane Bulut, personal communication 2012).</p><p class="P195"><span class="T29">‑it</span><span class="T6"> ‘second singular’, e.g. </span><span class="T29">almæ âllæm‑it</span><span class="T6"> (apple/buy.</span><span class="T54">aorist</span><span class="T6">.1</span><span class="T54">sg</span><span class="T6">‑2</span><span class="T54">sg</span><span class="T6">.</span><span class="T54">dative</span><span class="T6">) ‘I will buy you an apple’ </span><span class="T2">(Buluç <a href="__bulucmendeli1975__">1975</a>: 183;  Bulut <a href="__bulutiraqi2007__">2007</a>: 174)</span></p><p class="P195"><span class="T29">‑şan </span><span class="T6">‘third plural’, e.g. </span><span class="T29">yæyipt‑şan </span><span class="T6">(eat.</span><span class="T54">perfect</span><span class="T6">.3</span><span class="T54">sg</span><span class="T6">‑3</span><span class="T54">pl</span><span class="T6">.</span><span class="T54">accusative</span><span class="T6">) ‘he has eaten them’ </span><span class="T2">(Buluç <a href="__bulucmendeli1975__">1975</a>: 183;  Bulut <a href="__bulutiraqi2007__">2007</a>: 174)</span></p><p class="P214"> </p><p class="P34">3 non‑interrelated suffixes</p><p class="P200"><span class="T28">‑tar</span><span class="T2"> ‘comparative’, e.g. </span><span class="T28">çux‑dar </span><span class="T2">(much/most‑</span><span class="T53">comparative</span><span class="T2">) ‘more’ </span><span class="T2">(Bulut <a href="__csatoiranian2005__">2005</a>: 254)</span><span class="T2">, “the copied morpheme +</span><span class="T28">tar </span><span class="T2">displays no combinatorial restrictions; it combines with Turkic and Iranian adjectives alike” </span><span class="T2">(Bulut <a href="__csatoiranian2005__">2005</a>: 253)</span></p><p class="P200"><span class="T28">‑aka</span><span class="T2"> </span><span class="T28">~ ‑eke ~ ‑ækæ</span><span class="T2"> ‘definite, specific’ (from Southern Kurdish, Gorani), e.g. </span><span class="T28">ušaġ‑ækæ‑le’ </span><span class="T2">(child‑</span><span class="T53">specific‑pl</span><span class="T2">) ‘those children’, </span><span class="T28">mincuġ‑ækæ‑re </span><span class="T2">(bead‑</span><span class="T53">specific‑ablative</span><span class="T2">) ‘of those pearls’, </span><span class="T28">šê’r‑eke‑sin‑ne </span><span class="T2">(poem‑</span><span class="T53">specific‑possessor‑ablative</span><span class="T2">) ‘about that poem by him’. This suffix “attaches directly to Turkic noun stems and precedes plural, possessive or case suffixes” </span><span class="T2">(Bulut <a href="__csatoiranian2005__">2005</a>: 254)</span><span class="T2">. See also Kossmann </span><span class="T2">(<a href="__kossmanninflectional2011__">2011</a>)</span><span class="T2">, who cites a Sorani source form from Blau </span><span class="T2">(<a href="__blaumanuel1980__">1980</a>: 46, 63)</span><span class="T2">. This form is also borrowed into Southern Iraqi Turkman.</span></p><p class="P193"><span class="T104">‑iş </span><span class="T106">‘also, even’, e.g. </span><span class="T104">yėm</span><span class="hps"><span class="T103">ēduv</span></span><span class="T104">iş</span><span class="T106"> ‘</span><span class="hps"><span class="T105">you have not even eaten’, </span></span><span class="hps"><span class="T103">ġēliş</span></span><span class="hps"><span class="T105"> ‘come!’, </span></span><span class="hps"><span class="T103">ōḫiş</span></span><span class="hps"><span class="T105"> ‘even an eye’ </span></span><span class="T105">(Buluç <a href="__bulucmendeli1975__">1975</a>: 182)</span><span class="T106">. This suffix “is in all probability a copy of the Kurdish enclitic [...] which in southern Kurdish may be suffixed to either a nominal or a verbal form” </span><span class="T106">(Bulut <a href="__bulutiraqi2007__">2007</a>: 175)</span><span class="T106">.</span></p><p class="P11"> </p><p class="P4"><span class="T2">An additional borrowed suffix, </span><span class="T28">‑i</span><span class="T2"> ‘indefinite’ from Persian, “with similar function [as </span><span class="T28">‑aka</span><span class="T2">]” </span><span class="T2">(Bulut <a href="__csatoiranian2005__">2005</a>: 254)</span><span class="T2">, is “in all instances of our material [...] attached to copied noun phrases” </span><span class="T2">(Bulut <a href="__csatoiranian2005__">2005</a>: 255)</span><span class="T2">, i.e. stems that are likewise borrowed from Persian. For this reason, this suffix is not included here, although there is some indirect evidence that “could prove that the copied unit +</span><span class="T28">i </span><span class="T2">is compatible with non‑Persian nouns” </span><span class="T2">(Bulut <a href="__csatoiranian2005__">2005</a>: 255)</span><span class="T2">.</span></p></td>	\N	90	143	Eurasia	mid	1	2	5
29	2013-11-19 20:49:34.285949+01	2013-11-19 20:49:34.285956+01	t	\N	34	Ritharngu affixes in Ngandi	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P26">Information and examples are from Heath <span class="T69">(<a href="__heathlinguistic1978__">1978a</a>; <a href="__heathngandi1978__">1978b</a>)</span><span class="T69">.</span></p><p class="P26"> </p><p class="P26"><span class="T48">2 case markers </span>(out of 7 Ngandi case markers) (Heath <a href="__heathngandi1978__">1978b</a>: 41–50)</p><p class="P207"><span class="T28">‑</span><span class="T32">ṱu</span><span class="T28"> </span><span class="T2">‘ergative/instrumental’, e.g. </span><span class="T28">‑mumbaʔ‑ḓu </span><span class="T2">‘with axes’, </span><span class="T28">awaṭuʔṇayi‑</span><span class="T32">ṱu</span><span class="T28"> </span><span class="T2">‘his dog [bit me]’</span></p><p class="P207"><span class="T28">‑ku </span><span class="T2">‘genitive, dative, purposive’, e.g. </span><span class="T28">ŋayi‑ku</span><span class="T2"> ‘mine’, </span><span class="T28">mawaṇguraʔ‑gu </span><span class="T2">‘the bandicoot’s’</span></p><p class="P26"> </p><p class="P8"><span class="T2">Note that four further affixes may have been borrowed, but the directionality of borrowing is not clear, therefore they are not counted here (see also the entry on Ritharngu): (i) 2 out of 3 derivational adverbializers (called “compounding” elements by Heath </span><a name="OLE_LINK2"></a><span class="T2">(1978b:121)</span><span class="T2">): </span><span class="T28">malk‑ </span><span class="T2">‘times’, </span><span class="T28">bala‑ </span><span class="T2">‘side’; (ii) 2 out of 2 verbal derivation markers (called “comitative” by Heath </span><span class="T2">(<a href="__heathngandi1978__">1978b</a>: 83)</span><span class="T2">): </span><span class="T28">‑ba</span><span class="T32">ṱa‑</span><span class="T28"> </span><span class="T42">‘</span><span class="T16">applicative’ (forming (semantically) transitive verbs with comitative object from intransitive verbs), </span><span class="T32">‑ṛi‑</span><span class="T28"> </span><span class="T42">‘</span><span class="T16">applicative’ (forming transitive verbs with an object that denotes something transported from intransitive verbs of motion).</span></p></td>	\N	150	17	Australia & New Guinea	mid	1	2	2
30	2013-11-19 20:49:34.306769+01	2013-11-19 20:49:34.30678+01	t	\N	35	Kxoe affixes in Danisi	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P11">Information and example are from Vossen (<a href="__hiedapatterns2011__">2011</a>: 197).</p><p class="P11"> </p><p class="P11"><span class="T48">2 verbal derivational markers</span>, which do not form a paradigm in the strict sense (Vossen, personal communication, June 2011), but are nevertheless considered as interrelated here.</p><p class="P200"><span class="T28">=kx’oa</span><span class="T2"> ‘inclinative verbal derivation’ (no examples of hybrid formations given)</span></p><p class="P200"><span class="T28">=|xoa </span><span class="T2">‘comitative verbal derivational’ (no examples of hybrid formations given). According to Anne-Maria Fehn (personal communication March 2013), this form is common in Danisi’s branch (Shua-Cluster), therefore more likely to be inherited than to be borrowed.</span></p><p class="P214"> </p><p class="P11">These are two relatively closely related languages. The evidence for borrowing is that there are no cognates documented in other languages of Danisi’s subbranch (Shua), while there are cognate forms documented in various languages of the Kxoe subgroup. According to Anne-Maria Fehn (personal communication March 2013), Vossen’s data are from a single informant whose Danisi is problematic in various respects.</p></td>	\N	41	29	Africa	low	2	2	2
31	2013-11-19 20:49:34.325668+01	2013-11-19 20:49:34.325673+01	t	\N	37	Croatian affixes in Istro‑Romanian	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10"><span class="T82">Information and examples are from various sources, as noted below. For additional discussion of these examples, see </span>Rozencvejg (<a href="__rozencvejginterference1976__">1976</a>: 24), <span class="T88">Dahmen </span><span class="T88">(<a href="__holtusrumanisch1989__">1989</a>: 455)</span><span class="T88">, </span><span class="T82">Breu </span>(<a href="__breuzur1992__">1992</a>; <a href="__breuuberlegungen1996__">1996</a>: 35–36)<span class="T82">, and Boretzki </span><span class="T69">(<a href="__boretzkymorphologische2004__">2004</a>: 1648)</span><span class="T69">.</span></p><p class="P19"> </p><p class="P19"><span class="T48">8 derivational prefixes</span>, forming ‑ to some extent ‑ aspectual pairs. Further prefixes are mentioned in some of the sources, but these are not attested in hybrid formations.</p><p class="P205"><span class="T33">ăn‑ </span><span class="T44">‘</span><span class="T12">perfective’, e.g. </span><span class="T33">ănviså </span><span class="T12">‘to dream (perfective)’ (from </span><span class="T33">viså </span><span class="T12">‘to dream (imperfective)’ </span><span class="T2">(Gardani <a href="__gardaniborrowing2008__">2008</a>: 68;  citing Dahmen <a href="__holtusrumanisch1989__">1989</a>: 455)</span></p><p class="P205"><span class="T33">po‑ </span><span class="T44">‘</span><span class="T12">perfective’</span><span class="T44">,</span><span class="T12"> e.g. </span><span class="T33">potorče</span><span class="T12"> ‘to spin (perfective)’ (from</span><span class="T33"> torče</span><span class="T12"> ‘to spin (imperfective)’) </span><span class="T2">(Hurren <a href="__hurrenverbal1969__">1969</a>: 62;  Kovačec <a href="__kovacecdescrierea1971__">1971</a>: 125)</span><span class="T12">, </span><span class="T33">posúže</span><span class="T12"> ‘suck (perfective)’ (from</span><span class="T33"> súže</span><span class="T12"> ‘suck (imperfective)’) </span><span class="T12">(Sala <a href="__salaproblema1988__">1988</a>: 79)</span></p><p class="P205"><span class="T33">za‑ ~ ze‑ </span><span class="T44">‘</span><span class="T12">perfective’</span><span class="T33">,</span><span class="T12"> e.g. </span><span class="T33">zadurmi/zedurmi</span><span class="T12"> ‘to sleep (perfective)’ (from</span><span class="T33"> durmi</span><span class="T12"> ‘to sleep (imperfective)’), </span><span class="T33">zaplənče</span><span class="T12"> ‘to weep (perfective)’ (from</span><span class="T33"> plənče</span><span class="T12"> ‘to weep (imperfective)’) </span><span class="T2">(Hurren <a href="__hurrenverbal1969__">1969</a>: 62;  Kovačec <a href="__kovacecdescrierea1971__">1971</a>: 125)</span><span class="T12">, </span><span class="T33">zalatrɑ̊ </span><span class="T12">‘begin to bark’ (from </span><span class="T33">latrɑ̊ </span><span class="T12">‘bark’) </span><span class="T12">(Sala <a href="__salaproblema1988__">1988</a>: 79)</span></p><p class="P205"><span class="T33">raz‑ </span><span class="T44">‘</span><span class="T12">perfective’</span><span class="T33">,</span><span class="T12"> e.g. </span><span class="T33">razleg</span><span class="T112">u</span><span class="T33">a</span><span class="T12"> ‘to bind (perfective)’ (from </span><span class="T33">leg</span><span class="T112">u</span><span class="T33">a</span><span class="T12"> ‘to bind (imperfective)’) </span><span class="T2">(Hurren <a href="__hurrenverbal1969__">1969</a>: 62;  Kovačec <a href="__kovacecdescrierea1971__">1971</a>: 125;  Sala <a href="__salaproblema1988__">1988</a>: 79)</span></p><p class="P205"><span class="T33">s‑ </span><span class="T44">‘</span><span class="T12">perfective’</span><span class="T44">,</span><span class="T12"> e.g. </span><span class="T33">skopei</span><span class="T12"> ‘to dig (perfective)’ (from</span><span class="T33"> kopei</span><span class="T12"> ‘to dig (imperfective)’ </span><span class="T2">(Hurren <a href="__hurrenverbal1969__">1969</a>: 62;  Kovačec <a href="__kovacecdescrierea1971__">1971</a>: 125)</span></p><p class="P205"><span class="T33">od‑ </span><span class="T44">‘</span><span class="T12">perfective’</span><span class="T44">,</span><span class="T12"> e.g. </span><span class="T33">odlomi</span><span class="T12"> ‘to break (perfective)’ (from </span><span class="T33">lomi</span><span class="T12"> ‘to break (imperfective)’) </span><span class="T2">(Hurren <a href="__hurrenverbal1969__">1969</a>: 62;  Kovačec <a href="__kovacecdescrierea1971__">1971</a>: 125)</span></p><p class="P199"><span class="T28">na‑ ~ ne‑ </span><span class="T42">‘</span><span class="T2">perfective’</span><span class="T42">, e</span><span class="T2">.g. </span><span class="T28">namâŋcɑ̊</span><span class="T2"> ‘eat (perfective)’ (from</span><span class="T28"> mâncɑ̊ </span><span class="T2">‘eat’) </span><span class="T2">(Sala <a href="__salaproblema1988__">1988</a>: 79)</span></p><p class="P199"><span class="T28">pri‑ </span><span class="T42">‘</span><span class="T2">perfective’, e.g. </span><span class="T28">prifače</span><span class="T2"> ‘finish changing, do differently’ (from </span><span class="T28">fače </span><span class="T2">‘to do’) </span><span class="T2">(Sala <a href="__salaproblema1988__">1988</a>: 79)</span></p><p class="P10"> </p><p class="P1"><span class="T20">Gardani </span><span class="T2">(<a href="__gardaniborrowing2008__">2008</a>: 69; citing Pușcariu and Kuen 1943:280)</span><span class="T20"> also mentions that</span><span class="T21"> accusative </span><span class="T35">-u</span><span class="T21"> would have replaced inherited </span><span class="T35">‑ɑ̌</span><span class="T21">, but this appears to occur in two fixed phrases only.</span></p></td>	\N	129	67	Eurasia	mid	1	8	8
71	2013-11-19 20:49:34.880115+01	2013-11-19 20:49:34.880124+01	t	\N	116	Tibetan affixes in Wutun	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are mainly from Janhunen et al.’s (<a href="__janhunenwutun2008__">2008</a>) detailed description, including etymologies for affixes. However, Lee‑Smith &amp; Wurm (<a href="__wurmwutun1996__">1996</a>) give different etymologies for almost every one of the potentially borrowed items. The preference for Janhunen et al.’s (<a href="__janhunenwutun2008__">2008</a>) etymologies is based on the authority of Juha Janhunen as a specialist of East Asian languages. The situation in Wutun has been summarized as follows: “Wutun has borrowed so extensively from Amdo Tibetan, both grammatically and lexically, that on first encounter, one hardly recognizes it as a Chinese language” (Li <a href="__liverbmedial1984__">1984</a>: 320). Note also that according to <span class="T100">Slater </span><span class="T100">(<a href="__slatergrammar2003__">2003</a>: 329)</span><span class="T100"> it often “becomes impossible to trace the precise historical path of any given linguistic feature [in </span><span class="T101">China’s Qinghai‑Gansu Sprachbund</span><span class="T100">]”.</span></p><p class="P10"> </p><p class="P10"><span class="T48">2 case markers</span> (out of a total of 7 in Wutun, the remaining 5 are native Chinese: genitive, locative, superessive, sociative, comparative)</p><p class="P195"><span class="T28">‑na </span><span class="T2">‘distributive case’</span><span class="T28"> </span><span class="T2">(Janhunen et al. <a href="__janhunenwutun2008__">2008</a>: 59)</span><span class="T2">, e.g. </span><span class="T28">san nian‑na </span><span class="T2">‘for three years’, </span><span class="T28">liang tian‑na</span><span class="T2"> ‘for two days’</span></p><p class="P195"><span class="T28">‑la ~ ‑ra </span><span class="T2">‘ablative case’</span><span class="T28">, </span><span class="T2">e.g. </span><span class="T28">gguan‑la </span><span class="T2">‘from the temple’, </span><span class="T28">gunse‑la</span><span class="T2"> ‘from the company’. This marker is possibly identical to the verbal “serial marker” </span><span class="T28">‑la</span><span class="T2">. Since Janhunen et al. </span><span class="T2">(<a href="__janhunenwutun2008__">2008</a>)</span><span class="T2"> are silent about the possible etymology of this marker, in this case I follow Lee‑Smith &amp; Wurm </span><span class="T2">(<a href="__wurmwutun1996__">1996</a>: 888)</span><span class="T2"> according to whom “directional </span><span class="T28">‑ra</span><span class="T2"> probably reflects the Tibetan directional, locative </span><span class="T28">‑la.</span><span class="T2">”</span></p><p class="P10"> </p><p class="P10"><span class="T48">3 “verb complements”</span> (out of a total of 20 in Wutun). All of these appear to be paradigmatically related, the subdivision in three sets given by Janhunen et al. (<a href="__janhunenwutun2008__">2008</a>: 76–86) seems to be based on semantic criteria. With respect to their status as affixes, they “differ greatly in their degree of grammaticalization”, but all of these are written as suffixes. Some at least are “very close to grammatical markers”.</p><p class="P195"><span class="T28">‑la </span><span class="T2">‘non‑completive’ “voice complements”, “</span><span class="T28">‑la</span><span class="T2"> can also be attached to verbs of a Sinitic origin” </span><span class="T2">(Janhunen et al. <a href="__janhunenwutun2008__">2008</a>: 78)</span><span class="T2">, e.g. </span><span class="T28">qu‑la‑li </span><span class="T2">‘to live in it’ (from </span><span class="T28">qu</span><span class="T2"> ‘live’). The other two “voice complements” are </span><span class="T28">‑gu</span><span class="T2"> ‘completive’ which is native Chinese, and </span><span class="T28">‑ge</span><span class="T2"> ‘causative’ which is possibly native Chinese </span><span class="T2">(Janhunen et al. <a href="__janhunenwutun2008__">2008</a>: 76–80)</span><span class="T2">.</span></p><p class="P195"><span class="T28">‑qai</span><span class="T2"> ‘to get broken’ “aspect complement”, no example of hybrid formation given. There are a total of 11 “aspect complements” in Wutun </span><span class="T2">(Janhunen et al. <a href="__janhunenwutun2008__">2008</a>: 80–82)</span><span class="T2">.</span></p><p class="P195"><span class="T28">‑dd‑ </span><span class="T2">‘to want’ “modal complement”, no example of hybrid formation given. There are a total of 11 “modal complements” in Wutun.</span></p><p class="P10"> </p><p class="P2"><span class="T3">2 serial markers</span><span class="T2"> “that indicate the relationships between the complement events described by the serialized verbs” </span><span class="T2">(Janhunen et al. <a href="__janhunenwutun2008__">2008</a>: 89–92)</span><span class="T2">. For the general serial marker </span><span class="T28">‑ma</span><span class="T2"> no etymology is given, only that it is potentially identical to the conjunction </span><span class="T28">ma </span><span class="T2">‘and’. There are a total of 3 such serial markers in Wutun.</span></p><p class="P195"><span class="T28">‑da </span><span class="T2">‘consequential’, e.g. </span><span class="T28">ngan‑di‑di</span><span class="T2"> ‘as (he) was pressing’, </span><span class="T28">jja‑la‑gu‑da</span><span class="T2"> ‘if you visit’</span></p><p class="P195"><span class="T28">‑la </span><span class="T2">‘conditional’, e.g. </span><span class="T28">kan‑gu‑de hong‑la </span><span class="T2">‘if you read’. This marker is possibly the same as the ablative case (see above).</span></p></td>	\N	68	53	Eurasia	mid	1	7	7
32	2013-11-19 20:49:34.338022+01	2013-11-19 20:49:34.338026+01	t	\N	39	Quapaw affixes in Koasati	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10"><span class="T69">Information from Rankin </span>(<a href="__shipleyquapaw1988__">1988</a>: 643–644 citing Geoffrey Kimball, personal communication)<span class="T69">. No examples of hybrids are given. The identification of the affix as borrowed is based on similarities in form, the presence of cognate forms in other Siouan languages, and the absence of similar forms in other Muskogean languages.</span></p><p class="P11"> </p><p class="P34">1 numeral-forming suffix</p><p class="P200"><span class="T28">‑nąną</span><span class="T2"> ‘distributive of numerals’</span></p></td>	\N	105	159	North America	mid	1	0	1
33	2013-11-19 20:49:34.345033+01	2013-11-19 20:49:34.345039+01	t	\N	40	Aramaic affixes in syrian‑lebanese‑mesopotamian Arabic	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P2"><span class="T2">These borrowed affixes are reported for the variety spoken in </span>Hasankeyf<span class="T2"> (Turkey). Information and examples are from Andreas Fink (personal communication), see also Diem </span><span class="T2">(<a href="__diemzum1971__">1971</a>)</span><span class="T2"> and Jastrow </span><span class="T2">(<a href="__jastrowmesopotamischarabischen1978__">1978</a>: 31)</span><span class="T2"> for the </span><span class="T28">n‑</span><span class="T2">pattern.</span></p><p class="P10"> </p><p class="P33">2 non-interrelated patterns</p><p class="P195"><span class="T28">n</span><span class="T2">-pattern ‘plural’, e.g. </span><span class="T28">hənne</span><span class="T2"> ‘they’ (instead of native Arabic </span><span class="T28">həmmu</span><span class="T2">)</span></p><p class="P195"><span class="T28">a‑ə</span><span class="T2"> pattern ‘perfect verb stem formation’ (no examples of hybrids)</span></p></td>	\N	96	49	Eurasia	mid	1	0	2
34	2013-11-19 20:49:34.354744+01	2013-11-19 20:49:34.354751+01	t	\N	41	Tamil affixes in Sri Lanka Portuguese	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P11">Information and examples from Nordhoff (<a href="__nordhoffcurrent2013__">2013</a>), Smith (<a href="__smithsri2013__">2013</a>) and personal communications from Sebastian Nordhoff and Ian Smith, 2012.</p><p class="P11"> </p><p class="P34">1 polite imperative marker</p><p class="P195"><span class="T29">‑nga </span><span class="T43">‘imperative’, </span><span class="T6">e.g. </span><span class="T29">vii </span><span class="T6">‘come! (fam.)’ vs. </span><span class="T29">viinga </span><span class="T6">‘come! (polite)’, </span><span class="T28">kummenga</span><span class="T2"> ‘eat! (polite)’</span></p><p class="P214"> </p><p class="P33">1 conjunctive participle marker</p><p class="P195"><span class="T28">=tu </span><span class="T42">‘participle’</span><span class="T2">, e.g. </span><span class="T28">aka noos aka uusha kampani‑pa daa=tu, aka jaa‑faya dreetu </span><span class="T2">(that/1</span><span class="T53">pl</span><span class="T2">/that/Usha/company‑</span><span class="T53">dative</span><span class="T2">/give=</span><span class="T53">perfective.participle</span><span class="T2">/that/</span><span class="T53">past‑</span><span class="T2">make/right) ‘we gave that to the Usha company and repaired it’</span></p></td>	\N	154	116	Eurasia	mid	1	0	2
35	2013-11-19 20:49:34.367597+01	2013-11-19 20:49:34.367605+01	t	\N	42	Northern Nyungic affixes in Kayardild	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P11">Information and examples are from Evans (<a href="__evansgrammar1995__">1995</a>: 38, 129).</p><p class="P11"> </p><p class="P34">1 derivational suffix</p><p class="P195"><span class="T29">‑kuru ~ ‑</span><span class="T28">wuru</span><span class="T6"> ‘proprietive’, e.g</span><span class="T29">. </span><span class="T28">wara‑wuran‑kuru‑</span><span class="T2"> (mouth‑food‑</span><span class="T53">proprietive</span><span class="T2">) ‘having food in its mouth’, </span><span class="T28">kurndu‑kunawuna‑wuru‑</span><span class="T2"> (chest‑child‑</span><span class="T53">proprietive)</span><span class="T2"> ‘having a child on her chest’ </span><span class="T2">(examples from Round <a href="__roundkayardild2010__">2010</a>: 199)</span></p></td>	\N	124	97	Australia & New Guinea	high	0	0	1
36	2013-11-19 20:49:34.38308+01	2013-11-19 20:49:34.383092+01	t	\N	43	Akkadian affixes in Sumerian	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P3"><span class="T2">Information and examples are from Thomas Goldammer (personal communication, 2011). No examples of hybrids are available. The source form in Akkadian was a preposition </span><span class="T28">kima</span><span class="T2">.</span></p><p class="P11"> </p><p class="P34">1 clitic</p><p class="P200"><span class="T28">=gim ~ =gin</span><span class="T2"> ‘equative adposition’</span><span class="T28"> </span></p></td>	\N	91	88	Eurasia	mid	1	0	1
37	2013-11-19 20:49:34.396115+01	2013-11-19 20:49:34.396127+01	t	\N	44	Naasioi affixes in Torau	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P11">Information is from Palmer and Evans (<a href="__palmermetatypic2011__">2011</a>). Note that the formal resemblance may be a coincidence because the form is short and contains frequent phonemes.</p><p class="P11"> </p><p class="P34">1 suffix</p><p class="P202"><span class="T28">‑na </span><span class="T2">‘possessum singular number marker’</span></p></td>	\N	74	36	Southeast Asia & Oceania	low	2	0	1
38	2013-11-19 20:49:34.409826+01	2013-11-19 20:49:34.409832+01	t	\N	46	Arabic affixes in Indonesian	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P9"><span class="T84">Information and examples are from Jones </span><span class="T84">(<a href="__verhaarloanwords1984__">1984</a>)</span><span class="T84">, Verhaar </span><span class="T84">(<a href="__purwoaffixation1984__">1984</a>)</span><span class="T84">, Tadmor </span><span class="T85">(<a href="__tadmorloanwords20091__">2009</a>)</span><span class="T85"> and personal communications from Uri Tadmor. Jones </span>(<a href="__verhaarloanwords1984__">1984</a>: 12–17)<span class="T85"> discusses loanwords and some “Arabic phrases and bound morphemes; Arabic grammar”, but it is unclear whether these are used with native Indonesian stems. According to Uri Tadmor (personal communication), only one affix from Arabic is attested with non‑Arabic stems.</span></p><p class="P11"> </p><p class="P34">1 suffix</p><p class="P2"><span class="T29">‑awi </span><span class="T6">‘adjectivizer’ </span><span class="T6">(Tadmor <a href="__tadmorloanwords20091__">2009</a>: 705)</span><span class="T6">, </span><span class="T2">e.g.</span><span class="T29"> gerejawi</span><span class="T6"> ‘related to church’</span></p><p class="P11"> </p><p class="P3"><span class="T2">Another Arabic adjectivizer,</span><span class="T28"> ‑iah</span><span class="T2"> is used only with Arabic roots and roots perceived as Arabic according to Uri Tadmor (personal communication).</span><span class="T15"> </span></p></td>	\N	42	76	Southeast Asia & Oceania	high	0	0	1
39	2013-11-19 20:49:34.417535+01	2013-11-19 20:49:34.417541+01	t	\N	67	Sicilian Italian affixes in Maltese	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P17">Information and examples are from Borg (<a href="__borgevolutionary1994__">1994</a>: 57) and Borg and Azzopardi‑Alexander (<a href="__borgmaltese1997__">1997</a>: 280, 291). See also Gardani (<a href="__gardaniborrowing2008__">2008</a>: 75; <a href="__gardaniplural2012__">2012</a>: 81).</p><p class="P17"> </p><p class="P36">3 singulative suffixes</p><p class="P205"><span class="T28">‑ata </span><span class="T2">‘singulative’, e.g. </span><span class="T28">xemxata</span><span class="T2"> ‘sunstroke’ (from </span><span class="T28">xemx</span><span class="T2"> ‘sun’), </span><span class="T28">ksuħata </span><span class="T2">‘(act of) snobbery’ (from </span><span class="T28">ksuħa</span><span class="T2"> ‘snobbery’) </span><span class="T2">(Albert Borg and Azzopardi‑Alexander <a href="__borgmaltese1997__">1997</a>: 280)</span></p><p class="P205"><span class="T28">‑u </span><span class="T2">‘singulative masculine’, e.g. </span><span class="T28">wizzu </span><span class="T2">‘goose’,</span><span class="T28"> du:du </span><span class="T2">‘worm’, </span><span class="T28">fu:lu</span><span class="T2"> ‘bean’ </span><span class="T2">(Borg <a href="__borgevolutionary1994__">1994</a>: 57)</span></p><p class="P205"><span class="T28">‑a </span><span class="T2">‘singulative feminine’, e.g. </span><span class="T28">du:da </span><span class="T2">‘worm’, </span><span class="T28">fu:la</span><span class="T2"> ‘bean’ </span><span class="T2">(Borg <a href="__borgevolutionary1994__">1994</a>: 57)</span><span class="T2">. Borg and Azzopardi‑Alexander </span><span class="T2">(<a href="__borgmaltese1997__">1997</a>: 174, 245)</span><span class="T2"> also mention singulative </span><span class="T28">‑a</span><span class="T2">, e.g. </span><span class="T28">neml‑a</span><span class="T2"> ‘ants’ (from </span><span class="T28">nemel</span><span class="T2"> ‘ant’), </span><span class="T28">xirj‑a </span><span class="T2">‘a shopping (from </span><span class="T28">xiri</span><span class="T2"> ‘shopping’), but do not say whether this is borrowed.</span></p><p class="P215"> </p><p class="P36">1 adjectivizer/inhabitant noun derivation</p><p class="P195"><span class="T28">‑ż </span><span class="T2">(masculine), </span><span class="T28">‑ża </span><span class="T2">(feminine) ‘adjectives and inhabitant nouns from place names’, e.g. </span><span class="T28">Karkariż, Karkariża</span><span class="T2"> ‘person from </span><span class="T28">Birkirkara</span><span class="T2">’, </span><span class="T28">Ċiniż </span><span class="T42">‘Chinese’</span><span class="T28">, Ingliż </span><span class="T42">‘English’</span></p></td>	\N	141	65	Eurasia	high	0	3	4
40	2013-11-19 20:49:34.425608+01	2013-11-19 20:49:34.425614+01	t	\N	68	Sadri affixes in Kharia	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P11">Information and examples are from Peterson (<a href="__petersongrammar2011__">2011</a>: 324) and John Peterson (personal communication, March 2012).</p><p class="P11"> </p><p class="P11"><span class="T48">2 so-called “sequential converbs”/”conjunctive participles”</span> (out of a paradigm of 3 forms in Kharia)</p><p class="P195"><span class="T7">=</span><span class="T38">ke</span><span class="T7">, e.g. </span><span class="T28">kaʔ kom=ki ɖhoʔ=ke</span><span class="T2"> (bow/arrow=</span><span class="T53">pl</span><span class="T2"> grab=</span><span class="T53">sequential</span><span class="T2">) ‘having taken their bows and arrows, ...’</span></p><p class="P221"><span class="T2">=</span><span class="T30">ker</span><span class="T2"> (no examples available)</span></p><p class="P48"> </p><p class="P10"><span class="T70">Note that </span>Abbi (<a href="__abbilanguage1995__">1995</a>: 183; <a href="__abbilanguages1997__">1997</a>: 139–142; <a href="__abbimanual2001__">2001</a>: 47,53) mentions a number of other borrowed affixes in Kharia, but according to John Peterson <span class="T69">(personal communication, March 2012), it is not certain whether any of these can be used </span>with native stems.</p></td>	\N	6	20	Eurasia	mid	1	2	2
41	2013-11-19 20:49:34.442168+01	2013-11-19 20:49:34.442179+01	t	\N	70	Estonian affixes in Ingrian Finnish	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from <span class="T69">Riionheimo </span><span class="T69">(<a href="__riionheimohow2002__">2002</a>; <a href="__riionheimomorfologinen2010__">2010</a>)</span><span class="T69">. Note that Finnish and Estonian are closely related.</span></p><p class="P11"> </p><p class="P34">2 tense (and person) markers</p><p class="P195"><span class="T28">‑p</span><span class="T2"> ‘third person present’, e.g. </span><span class="T28">maksa‑a‑p</span><span class="T2"> ‘it costs’, </span><span class="T28">istu‑u‑p</span><span class="T2"> ‘he sits’, </span><span class="T28">tullo‑o‑p</span><span class="T2"> ‘he comes’</span></p><p class="P195"><span class="T28">‑si</span><span class="T2"> ‘past’, e.g. </span><span class="T28">ve‑i‑si‑mme </span><span class="T2">‘we took’</span><span class="T28">, osta‑si‑it</span><span class="T2"> ‘they bought it’, </span><span class="T28">jouta‑si‑mme</span><span class="T2"> ‘we were in time’</span></p></td>	\N	107	4	Eurasia	high	0	2	2
42	2013-11-19 20:49:34.456905+01	2013-11-19 20:49:34.456911+01	t	\N	72	Swahili affixes in Malagasy	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P9"><span class="T84">Information and examples are from Alexander Adelaar </span>(<a href="__adelaarmalagasy2012__">2012</a>: 149–150) (see also Adelaar <a href="__adelaaraustronesian2005__">2005</a>;  Adelaar <a href="__adelaarloanwords2009__">2009</a>;  Adelaar <a href="__bowdenamalgamation2010__">2010</a>)<span class="T84">.</span></p><p class="P10"> </p><p class="P33">2 non‑interrelated prefixes</p><p class="P195"><span class="T28">ki‑ </span><span class="T2">~ </span><span class="T28">tsi‑ </span><span class="T2">‘nominalizer, diminutive’, e.g. </span><span class="T30">ki‑tranu‑trànu</span><span class="T2">, </span><span class="T30">tsi‑tranu‑trànu </span><span class="T2">‘doll house’ (from </span><span class="T30">trànu </span><span class="T2">‘house’)</span></p><p class="P195"><span class="T28">h‑ ~ hu(‑)</span><span class="T2"> ‘future tense’, e.g. </span><span class="T28">h‑angàlatră pàuli</span><span class="T2"> ‘Paul will steal’ (vs. </span><span class="T28">m‑angàlatră Pàuli</span><span class="T2"> ‘Paul steals’), </span><span class="T28">h‑umè‑nă àzi ni vùla</span><span class="T2"> ‘Money will be given to her’ (vs. </span><span class="T28">umè‑nă àzi ni vùla</span><span class="T2"> ‘Money is given to her’), </span><span class="T28">hu tùnga rahampìtsu ìzi</span><span class="T2"> ‘He’ll arrive tomorrow’ (vs. </span><span class="T28">tùnga izàu ìzi</span><span class="T2"> ‘He arrives today’)</span></p></td>	\N	92	78	Southeast Asia & Oceania	mid	1	0	2
43	2013-11-19 20:49:34.474202+01	2013-11-19 20:49:34.47421+01	t	\N	73	Banjar Malay affixes in Malagasy	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Alexander Adelaar (<a href="__bowdenamalgamation2010__">2010</a>). The identification of these affixes as borrowed is based on sound changes.</p><p class="P10"> </p><p class="P33">4 non‑interrelated affixes</p><p class="P194"><span class="T34">vua‑ </span><span class="T20">‘passive’, e.g. </span><span class="T34">vua‑helukă </span><span class="T20">‘guilty’ (compare </span><span class="T34">mana‑melukă </span><span class="T20">‘to condemn O’), </span><span class="T34">vuampanga</span><span class="T20"> ‘accused’ (compare </span><span class="T34">mi‑ampanga</span><span class="T20"> ‘to accuse O’) </span><span class="T2">(example from Adelaar and Vérin <a href="__adelaarmalagasy1995__">1995</a>: 401)</span><span class="T20">, </span><span class="T36">vua‑suràtr‑o </span><span class="T20">‘to be written’, </span><span class="T36">vua‑valì‑ko </span><span class="T20">‘answered by me’, </span><span class="T36">vua‑lazà‑ku </span><span class="T20">‘said by me’ </span><span class="T20">(examples from Adelaar <a href="__adelaarmalagasy2012__">2012</a>: 144)</span></p><p class="P195"><span class="T28">tafa‑</span><span class="T2"> ‘accomplished act (verbal aspect)’ (no example of hybrid formations available)</span></p><p class="P194"><span class="T34">ra‑</span><span class="T20"> ‘honorific personal prefix’ (used in nouns with human reference, including kinship terms), e.g. </span><span class="T34">ra‑fuȼi </span><span class="T20">‘term of address for an old lady’ (</span><span class="T34">fuȼi </span><span class="T20">‘white’) </span><span class="T2">(example from Adelaar and Vérin <a href="__adelaarmalagasy1995__">1995</a>: 403–404)</span></p><p class="P195"><span class="T28">ta‑</span><span class="T2"> ‘ethnic or geographical group’ derivation (no example of hybrid formations available)</span></p></td>	\N	92	10	Southeast Asia & Oceania	mid	1	0	4
44	2013-11-19 20:49:34.496423+01	2013-11-19 20:49:34.496431+01	t	\N	75	intermediate Proto‑Carib affixes in Wayampi‑Emerillon‑Zo’é 	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Rose (<a href="__roseborrowing2012__">2012</a>). Detailed reconstruction allows determining that the plural marker was borrowed from an intermediate Proto‑Carib language into <span class="T69">Proto</span> Wayampi‑Emerillon‑Zo’é. The marker is a suffix in two of the daughter languages (Wayampi‑Emerillon) and a free form in one of the daughter languages (Zo’é).</p><p class="P10"> </p><p class="P33">1 plural suffix</p><p class="P205"><span class="T28">‑kom </span><span class="T2">(Emerillon)</span><span class="T28">, ‑kõ</span><span class="T2"> (Wayampi) ‘plural’, e.g. </span><span class="T28">wãĩwĩ‑kom</span><span class="T2"> (women‑</span><span class="T53">pl) </span><span class="T2">‘women’ (Emerillon), </span><span class="T28">e‑m</span><span class="T114">ɛ</span><span class="T28">m</span><span class="T115">ɨ</span><span class="T28">‑k</span><span class="T115">ũ</span><span class="T117"> (</span><span class="T53">1sg</span><span class="T2">‑child‑</span><span class="T53">pl) ‘</span><span class="T2">my children’ (Wayampi)</span></p></td>	\N	71	75	South America	mid	1	0	1
45	2013-11-19 20:49:34.51278+01	2013-11-19 20:49:34.51279+01	t	\N	77	English affixes in Hawaiian	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P17">Information and examples are from Parker Jones (<a href="__parkerjonesloanwords2009__">2009</a>: 784).</p><p class="P17"> </p><p class="P36">1 derivational suffix</p><p class="P205"><span class="T28">‑kona</span><span class="T2"> ‘sports event’ (from English </span><span class="T28">marathon</span><span class="T2">), e.g. </span><span class="T28">hele‑kona</span><span class="T2"> ‘walk‑athon’ (from </span><span class="T28">hele</span><span class="T2"> ‘go’)</span></p><p class="P17"> </p><p class="P2"><span class="T2">A number of other English affixes in Hawaiian are not attested with native stems, i.e. </span><span class="T28">heko‑kalame</span><span class="T2"> ‘hecto‑gram’, </span><span class="T28">keni‑kalame</span><span class="T2"> ‘centi‑gram’, </span><span class="T28">polai‑posapahate</span><span class="T2"> ‘poly‑phosphate’.</span></p></td>	\N	45	64	Southeast Asia & Oceania	high	0	0	1
46	2013-11-19 20:49:34.52556+01	2013-11-19 20:49:34.525568+01	t	\N	78	Russian affixes in Kola Saami	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from work by Michael Rießler and Rogier Blokland, as noted below. These forms are used on native stems according to Michael Rießler and Rogier Blokland (personal communication), although no examples of hybrids are given below.</p><p class="P10"> </p><p class="P33">3 pragmatic particles</p><p class="P195"><span class="T28">=že </span><span class="T2">‘topic’ (no examples of hybrid formations) </span><span class="T2">(Rießler <a href="__rieslerloanwords2009__">2009</a>: 392) (see also Rießler <a href="__matrasgrammatical20072__">2007</a>: 238)</span></p><p class="P195"><span class="T28">=dak</span><span class="T2"> ‘topic’ (the exact function of the source form is described as “</span><span class="T7">the preceding linguistic expression, say A, represents information, say x, on which a certain thought is based</span><span class="T2">” </span><span class="T2">(Post <a href="__postnorthern2006__">2006</a>: 495)</span><span class="T2">) (no examples of hybrid formations) (Rießler, personal communication, February 2012)</span></p><p class="P195"><span class="T28">‑ka </span><span class="T2">‘hortative’, e.g. </span><span class="T28">vancla‑ka</span><span class="T2"> ‘(let him) go!’ </span><span class="T2">(Blokland and Rießler <a href="__hasselblattkomisaamirussian2011__">2011</a>: 15)</span></p><p class="P10"> </p><p class="P33">1 negative indefinite prefix</p><p class="P195"><span class="T28">nie‑ </span><span class="T2">‘negative indefinite’, forming expressions like ‘nobody, nowhere, nothing’ from expressions like ‘who, where, what’ (no examples of hybrid formations) </span><span class="T2">(Rießler <a href="__matrasgrammatical20072__">2007</a>: 237–238) (see also Blokland and Rießler <a href="__hasselblattkomisaamirussian2011__">2011</a>: 14–15)</span></p><p class="P10"> </p><p class="P301">1 agent nominalizer</p><p class="P195"><span class="T2">‑</span><span class="st"><span class="T28">nihk ~ ‑nɨhk</span></span><span class="st"><span class="T2"> ~ ‑</span></span><span class="st"><span class="T28">nehk</span></span><span class="st"><span class="T2"> ‘agent nouns’, e.g. </span></span><span class="st"><span class="T28">pastlesnɨhk</span></span><span class="st"><span class="T2"> ‘a thorny shrub’ (from </span></span><span class="st"><span class="T28">pastel</span></span><span class="st"><span class="T2"> ‘sharp’), </span></span><span class="st"><span class="T28">v(ɨnn)ājtnihk</span></span><span class="st"><span class="T2"> ‘winegrower’ </span></span><span class="T2">(Blokland and Rießler <a href="__hasselblattkomisaamirussian2011__">2011</a>: 15;  citing Mägiste <a href="__magistesuffixentlehnung1968__">1968</a>: 16–17)</span><span class="T2">.</span></p></td>	\N	48	102	Eurasia	high	0	3	5
47	2013-11-19 20:49:34.540105+01	2013-11-19 20:49:34.540111+01	t	\N	82	Turkish affixes in Western Kurmanji	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Haig (<a href="__matrasgrammatical20075__">2007</a>: 173) (see also Matras <a href="__matrasborrowability2007__">2007</a>: 45).</p><p class="P10"> </p><p class="P33">1 clause‑final clitic conditional marker</p><p class="P195"><span class="T28">=se </span><span class="T2">‘conditional’, e.g. </span><span class="T28">eer bapirê min ewna ne‑girt‑ine cem xa=sa ew‑na di‑mir‑in</span><span class="T2"> (if/grandfather/I/they/not_take/to/</span><span class="T53">reflexive=conditional</span><span class="T2">/they/die) ‘If my grandfather had not taken them in they would have died’</span></p></td>	\N	84	81	Eurasia	mid	1	0	1
48	2013-11-19 20:49:34.549419+01	2013-11-19 20:49:34.549429+01	t	\N	83	Nepali affixes in Manange	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Hildebrandt (<a href="__hildebrandtgrammar2004__">2004</a>: 82–83) (see also Hildebrandt <a href="__matrasgrammatical20071__">2007</a>: 292).</p><p class="P10"> </p><p class="P33">1 numeral classifier</p><p class="P195"><span class="T28">‑tʰa</span><span class="T2"> ‘general numeral classifier’, used optionally for every kind of noun (the only classifier in Manange, the Nepali source form is the non‑human classifier, opposed to a human classifier), e.g. </span><span class="T30">4ŋi‑ŋtha kòla</span><span class="T2"> (two‑</span><span class="T53">classifier</span><span class="T2">/child) ‘two children’, </span><span class="T30">4shi‑ŋtha 1p</span><span class="T2">ʌ</span><span class="T30">le </span><span class="T13">(</span><span class="T2">one‑</span><span class="T53">classifier</span><span class="T2">/hand) ‘one hand’ (numbers in the transcription indicate tone) </span></p></td>	\N	40	15	Eurasia	mid	1	0	1
49	2013-11-19 20:49:34.558452+01	2013-11-19 20:49:34.558456+01	t	\N	85	Russian affixes in Yiddish	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P2"><span class="T2">Information and examples are from Weinreich </span><span class="T2">(<a href="__weinreichyiddish1958__">1958</a>: 378–380) (see also Reershemius <a href="__matrasgrammatical20073__">2007</a>)</span><span class="T2"> (cited by </span><span class="T2">(Reershemius <a href="__matrasgrammatical20073__">2007</a>)</span><span class="T2">. Weinreich </span><span class="T2">(<a href="__weinreichyiddish1958__">1958</a>: 378)</span><span class="T2"> notes that the following seven potential cases of borrowed affixes have “rather limited distribution in the lexicon [and] are limited to a relatively small number of words each”, therefore they are not counted here: ‑</span><span class="T28">še</span><span class="T2"> ‘feminizer’, ‑</span><span class="T28">čik</span><span class="T2"> ‘endearing’, and the four ‘pejoratives’ </span><span class="T28">‑ak, ‑áč, ‑éts,</span><span class="T2"> and</span><span class="T28"> ‑l’ák, ‑nák</span><span class="T2">. The remaining thirteen borrowed affixes, given in the following, are said to be “highly productive” </span><span class="T2">(Weinreich <a href="__weinreichyiddish1958__">1958</a>: 378)</span><span class="T2">. Weinreich </span><span class="T2">(<a href="__weinreichyiddish1958__">1958</a>: 378)</span><span class="T2"> notes that there are “many others”, without giving further details.</span></p><p class="P10"> </p><p class="P33">3 feminine noun derivation</p><p class="P195"><span class="T2">‑</span><span class="T28">ke </span><span class="T2">‘feminine’, e.g. </span><span class="T28">lérerke </span><span class="T2">‘woman teacher’</span></p><p class="P195"><span class="T2">‑</span><span class="T28">ixe</span><span class="T2"> ‘feminine form of animal and (pejorative) personal names’, e.g. </span><span class="T28">léjb‑ixe</span><span class="T2"> ‘lioness, Leyb’s wife’</span></p><p class="P195"><span class="T2">‑</span><span class="T28">ńítse</span><span class="T2"> ‘feminine form of personalizing or agentive nouns’, e.g. </span><span class="T28">ejšes‑íš‑ńítse </span><span class="T2">‘adulteress’</span></p><p class="P10"> </p><p class="P33">2 (pejorative) adjectivizers</p><p class="P195"><span class="T2">‑</span><span class="T28">ske</span><span class="T2">, e.g. </span><span class="T28">oriman‑ske </span><span class="T2">‘fit for a pauper’</span></p><p class="P195"><span class="T28">‑(ev)ate</span><span class="T2">, e.g. </span><span class="T28">tam‑evate </span><span class="T2">‘dull’</span></p><p class="P10"> </p><p class="P33">3 noun‑noun derivation</p><p class="P195"><span class="T28">-arné </span><span class="T2">‘place name mildly contemptuous’, e.g. </span><span class="T28">xasid</span><span class="T2">‑</span><span class="T28">arné</span><span class="T2"> ‘gathering place for khasidim’</span></p><p class="P195"><span class="T2">‑</span><span class="T28">ńik ‘</span><span class="T2">personalizing or agentive derivation’, e.g. </span><span class="T28">jišuf</span><span class="T2">‑</span><span class="T28">ńik </span><span class="T2">‘village Jew’</span></p><p class="P195"><span class="T2">‑</span><span class="T28">úk </span><span class="T2">‘pejorative, especially for names of occupations’, e.g. </span><span class="T28">šuster‑úk</span><span class="T2"> ‘contemptible cobbler’</span></p><p class="P10"> </p><p class="P33">3 endearing vocatives/diminutives</p><p class="P195"><span class="T28">‑(e)ńu</span><span class="T2">, e.g. </span><span class="T28">kínd‑eńu </span><span class="T2">‘dear child’</span></p><p class="P195"><span class="T28">‑ink(e)</span><span class="T2">, used with nouns, e.g. </span><span class="T28">múm‑inke </span><span class="T2">‘dear aunt’, with adjectives, e.g. </span><span class="T28">dos rójt‑ink‑e kíšele </span><span class="T2">‘the little red (endearing) pillow’, with verbs, e.g. </span><span class="T28">šlóf‑inke‑en</span><span class="T2"> ‘to sleep (nursery‑talk)’, with adverbs, e.g. </span><span class="T28">pamél‑ink‑es </span><span class="T2">‘slowly (endearing)’, and with at least one interjection, e.g. </span><span class="T28">gváld‑ink‑es </span><span class="T2">‘heavens!’</span></p><p class="P195"><span class="T28">‑ičk</span><span class="T2">, used (also) with adjectives, e.g. </span><span class="T28">der ált‑ičk‑er</span><span class="T2"> </span><span class="T28">man</span><span class="T2"> ‘the old (endearing) man’</span></p><p class="P10"> </p><p class="P2"><span class="T3">1 privative prefix</span><span class="T2">, “incipiently productive” </span><span class="T2">(Weinreich <a href="__weinreichyiddish1958__">1958</a>: 378)</span><span class="T2"> and syntagmatically related to the personalizing or agentive derivational suffix ‑</span><span class="T28">ńik</span><span class="T2"> in the sense that it “seems to be limited to constructions with ‑</span><span class="T28">ńik</span><span class="T2"> in pejorative vocabulary” </span><span class="T2">(Weinreich <a href="__weinreichyiddish1958__">1958</a>: 378)</span><span class="T2">.</span></p><p class="P195"><span class="T28">bez‑ </span><span class="T2">‘without’, e.g. </span><span class="T28">bez‑buš</span><span class="T2">‑</span><span class="T28">ńik</span><span class="T2"> ‘shameless person’</span></p><p class="P10"> </p><p class="P33">1 verbalizers of interjections</p><p class="P195"><span class="T2">‑</span><span class="T28">ke</span><span class="T2">‑ ‘verbalizer’, e.g. </span><span class="T28">bom‑ke‑n</span><span class="T2"> ‘to say “bom”’</span></p></td>	\N	27	102	Eurasia	mid	1	11	13
50	2013-11-19 20:49:34.581973+01	2013-11-19 20:49:34.58198+01	t	\N	87	Bulgarian affixes in Megleno Romanian	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10"><span class="T89">Information and examples are from </span><span class="T88">Capidan </span><span class="T88">(<a href="__capidanmeglenoromanii1925__">1925</a>)</span><span class="T88"> and other sources as noted below.</span></p><p class="P112"> </p><p class="P1"><span class="T5">2 person markers on verbs. </span><span class="T21">Examples of these are from Capidan </span><span class="T21">(<a href="__capidanmeglenoromanii1925__">1925</a>: 94, 159)</span><span class="T21">, translations and evidence for Romance origin of stems comes from </span><span class="T2">Pușcariu</span><span class="T21"> </span><span class="T2">(1905:168, passim)</span><span class="T21">, Weinreich </span><span class="T21">(<a href="__weinreichlanguages1953__">1953</a>: 32)</span><span class="T21">, and Gardani </span><span class="T21">(<a href="__gardaniborrowing2008__">2008</a>: 67)</span><span class="T21">. These suffixes are added to forms already inflected for those categories by native suffixes ­</span><span class="T35">-u </span><span class="T21">and</span><span class="T35"> -i</span><span class="T21">, i.e. one might say that </span><span class="T35">-um</span><span class="T21">,</span><span class="T35"> -ǎm</span><span class="T21"> replaced native </span><span class="T35">-u</span><span class="T21"> and </span><span class="T35">-iş </span><span class="T21">replaced native </span><span class="T35">-i</span><span class="T21">. Gardani </span><span class="T21">(<a href="__gardaniborrowing2008__">2008</a>: 67)</span><span class="T21">, citing Sandfeld </span><span class="T21">(<a href="__sandfeldproblemes1938__">1938</a>: 59)</span><span class="T21">, Capidan </span><span class="T21">(<a href="__capidanbilinguisme1940__">1940</a>: 91)</span><span class="T21"> and Puşcariu </span><span class="T21">(<a href="__puscariurumanische1943__">1943</a>: 274)</span><span class="T21"> states that “the morphemes have been added to the corresponding Romanian morphemes </span><span class="T35">-u </span><span class="T21">and </span><span class="T35">-i</span><span class="T21">, but are not productive since they apply only to certain verbs”, implying that at least some verbs take them, as the examples below suggest.</span></p><p class="P208"><span class="T28">-m </span><span class="T2">‘first person singular indicative present’, e.g. </span><span class="T28">aflum </span><span class="T2">‘I find’, </span><span class="T28">antrum</span><span class="T2"> ‘I enter’, </span><span class="T28">amnum </span><span class="T2">‘I go’</span></p><p class="P208"><span class="T28">-ş </span><span class="T2">‘second person singular indicative present’, e.g. </span><span class="T28">afliş </span><span class="T2">‘you (sg.) find’, </span><span class="T28">antriş</span><span class="T2"> ‘you (sg.) enter’</span></p><p class="P22"> </p><p class="P9"><span class="T51">10 derivational prefixes </span><span class="T84">(out of 13 in Megleno Romanian). The ones listed here include pan-Slavic prefixes, but not prefixes that are exclusive to one Slavic language other than Bulgarian (e.g. only Serbian). Information and examples are from Capidan </span>(<a href="__capidanmeglenoromanii1925__">1925</a>: 195–202)<span class="T84">. No examples of hybrid formations are provided by Capidan </span>(<a href="__capidanmeglenoromanii1925__">1925</a>: 195–202)<span class="T84">, but some are explicitly described as “very productive”. The meanings of these prefixes are hard to describe, also in the Slavic source languages, they usually encode aspectual or aktionsart meanings and sometimes form pairs.</span></p><p class="P195"><span class="T28">du-</span><span class="T2"> </span><span class="T11">‘aktionsart’</span><span class="T2"> (from Bulgarian </span><span class="T28">do</span><span class="T2">-), described as “very productive”</span></p><p class="P195"><span class="T28">iz-</span><span class="T2"> </span><span class="T11">‘aktionsart’</span><span class="T2"> (from Bulgarian </span><span class="T28">iz</span><span class="T2">-)</span></p><p class="P195"><span class="T28">nӑ-</span><span class="T2"> </span><span class="T11">‘aktionsart’</span><span class="T2"> (from Bulgarian </span><span class="T28">na</span><span class="T2">-)</span></p><p class="P195"><span class="T28">ni</span><span class="T2">- ‘privative particle’ (seems to be Slavic, although no source form is given, only the equivalent in Cyrillic script, it is uncertain whether this form is “paradigmatically related” to the other prefixes listed here)</span></p><p class="P195"><span class="T28">pri-</span><span class="T2"> </span><span class="T11">‘aktionsart’</span><span class="T2"> (from Bulgarian </span><span class="T28">prĕ-</span><span class="T2"> (also related to Latin </span><span class="T28">per</span><span class="T2">-?)</span></p><p class="P195"><span class="T28">pru</span><span class="T2">- </span><span class="T11">‘aktionsart’</span><span class="T2"> (from Bulgarian </span><span class="T28">pro</span><span class="T2">-), described as “highly productive”</span></p><p class="P195"><span class="T28">pu</span><span class="T2">- </span><span class="T11">‘aktionsart’</span><span class="T2"> (from Bulgarian </span><span class="T28">po-</span><span class="T2">)</span></p><p class="P195"><span class="T28">pud</span><span class="T2">- ~ </span><span class="T28">put</span><span class="T2">- </span><span class="T11">‘aktionsart’</span><span class="T2"> (from Bulgarian </span><span class="T28">pod</span><span class="T2">-)</span></p><p class="P195"><span class="T28">răz</span><span class="T2">- </span><span class="T11">‘aktionsart’</span><span class="T2"> (from Bulgarian </span><span class="T28">răs</span><span class="T2">-)</span></p><p class="P195"><span class="T28">ză- </span><span class="T11">‘aktionsart’</span><span class="T2"> (from Bulgarian </span><span class="T28">za</span><span class="T2">)</span></p><p class="P10"> </p><p class="P9"><span class="T84">23 derivational suffixes are borrowed from Bulgarian. Below, forms are listed that are marked by Capidan </span>(<a href="__capidanmeglenoromanii1925__">1925</a>: 186–195)<span class="T84"> as pan-Slavic, but excluded are those marked only as Serbian </span>(Capidan 1925:186-195)<span class="T84">. Note that some forms are probably complex and some others may be allomorphs. There are a total of about 50 derivational suffixes in Megleno Romanian, many of the non-Slavic ones have etymologies in Latin (i.e. count as native), but there are also quite a lot borrowed from Greek and some from Turkish. No examples of hybrid formations are provided by Capidan </span>(<a href="__capidanmeglenoromanii1925__">1925</a>: 195–202)<span class="T84">.</span></p><p class="P10"> </p><p class="P33">12 diminutives</p><p class="P193"><span class="T105">-</span><span class="T103">atš</span><span class="T105"> ‘diminutive’, e.g. </span><span class="T107">ghiuma</span><span class="T103">tš</span><span class="T105"> ‘</span><span class="hps"><span class="T108">small</span></span><span class="short_5f_text"><span class="T108"> </span></span><span class="hps"><span class="T108">brass</span></span><span class="short_5f_text"><span class="T108"> </span></span><span class="hps"><span class="T108">pitcher’</span></span></p><p class="P195"><span class="T2">-</span><span class="T28">aş</span><span class="T2"> ‘diminutive’ (from Slavic in general), e.g. </span><span class="T17">cupilas </span><span class="T2">‘little baby’</span></p><p class="P195"><span class="T2">-</span><span class="T28">cǎ</span><span class="T2"> ‘feminine diminutive’ (from Slavic in general), e.g. </span><span class="T17">izvor</span><span class="T2">-</span><span class="T28">cǎ</span><span class="T2"> ‘little spring’, described as “very productive”</span></p><p class="P195"><span class="T2">-</span><span class="T28">eaşcǎ</span><span class="T2"> ‘diminutive’ (from Bulgarian), e.g. </span><span class="T17">dumin</span><span class="T28">eşcǎ</span><span class="T2"> ‘little Sunday’ </span></p><p class="P195"><span class="T2">-</span><span class="T28">ic</span><span class="T2"> ‘diminutive’ (from Slavic in general), e.g. </span><span class="T17">aric </span><span class="T2">‘yard (lit. little area)’</span></p><p class="P195"><span class="T2">-</span><span class="T28">icǎ</span><span class="T2"> ‘diminutive’ (from Slavic in general), e.g. </span><span class="T17">balit</span><span class="T28">iicǎ </span><span class="T42">‘little lake’</span></p><p class="P195"><span class="T2">-</span><span class="T28">itşcǎ</span><span class="T2"> ‘diminutive’ (from Bulgarian), e.g. </span><span class="T28">cǎsitşcǎ </span><span class="T42">‘little house’</span></p><p class="P195"><span class="T2">-</span><span class="T28">iṭǎ</span><span class="T2"> ‘diminutive’/’feminine from masculine nouns’ (from Slavic in general), e.g. </span><span class="T17">g</span><span class="T28">ǎuriṭǎ </span><span class="T42">‘little hole’</span></p><p class="P195"><span class="T2">-</span><span class="T28">oşcǎ</span><span class="T2"> ‘diminutive’, e.g. </span><span class="T17">bar</span><span class="T28">oşcǎ </span><span class="T42">‘little puddle’</span></p><p class="P195"><span class="T2">-</span><span class="T28">utş</span><span class="T2"> ‘diminutive’, e.g. </span><span class="T17">frat</span><span class="T28">utş </span><span class="T42">‘little brother’</span></p><p class="P195"><span class="T2">-</span><span class="T28">uş</span><span class="T2"> ‘diminutive’, e.g. </span><span class="T17">c</span><span class="T28">ǎldǎrǎş </span><span class="T42">‘littel bucket’</span></p><p class="P195"><span class="T2">-</span><span class="T28">tšoc</span><span class="T2"> (</span><span class="T28">-tše-oc</span><span class="T2">) ‘diminutive’, e.g. </span><span class="T17">c</span><span class="T28">ǎ</span><span class="T17">p</span><span class="T2">-</span><span class="T28">tšoc </span><span class="T42">‘small head’</span></p><p class="P220"> </p><p class="P217">9 nominalizers and nominal derivation</p><p class="P195"><span class="T2">-</span><span class="T28">an</span><span class="T2"> ‘quality nouns’ (from Slavic in general and Bulgarian), e.g. </span><span class="T17">mijlucan </span><span class="T2">‘the middle one (middle brother)’</span></p><p class="P195"><span class="T2">-</span><span class="T28">ealǎ</span><span class="T2"> ‘abstract nouns from adjectives’, e.g. </span><span class="T28">nigrealǎ </span><span class="T42">‘blackness’</span></p><p class="P195"><span class="T2">-</span><span class="T28">ean</span><span class="T2"> ‘inhabitant of’ (from Slavic in general), e.g. </span><span class="T28">cǎtunean </span><span class="T42">‘</span><span class="T2">someone who lives in a helmet’</span></p><p class="P195"><span class="T2">-</span><span class="T28">eṭ</span><span class="T2"> (meaning unclear) (from Slavic in general), e.g. </span><span class="T17">v</span><span class="T28">ă</span><span class="T17">rd</span><span class="T28">ă</span><span class="T17">re</span><span class="T28">ṭ</span><span class="T17"> </span><span class="T2">‘wind (from Vardar?)’</span></p><p class="P195"><span class="T28">-i̯ǎ</span><span class="T2"> ‘nouns from adjectives’ (from Slavic in general), e.g. </span><span class="T17">vu</span><span class="T28">ṭi̯ǎ </span><span class="T42">‘wealth’</span></p><p class="P195"><span class="T2">-</span><span class="T28">ineṭ</span><span class="T2"> ‘inhabitant noun’ (from Bulgarian), e.g. </span><span class="T17">Cup</span><span class="T28">ineṭ </span><span class="T42">‘someone from Cupa’</span></p><p class="P195"><span class="T2">-</span><span class="T28">işti</span><span class="T2"> ‘place where x is/happens’, e.g. </span><span class="T17">b</span><span class="T28">ǎnişti </span><span class="T42">‘bathing place’ </span></p><p class="P195"><span class="T2">-</span><span class="T28">niṭǎ</span><span class="T2"> ‘place name derivation’, e.g. </span><span class="T17">valtur</span><span class="T28">niṭǎ </span><span class="T42">‘place where eagles nest’</span></p><p class="P195"><span class="T2">-</span><span class="T28">utinǎ</span><span class="T2"> ‘collective nouns’, e.g. </span><span class="T17">erbutinin</span><span class="T28">ǎ </span><span class="T42">‘grassland’</span></p><p class="P55"> </p><p class="P56">2 adjectivizers</p><p class="P195"><span class="T2">-</span><span class="T28">lif</span><span class="T2"> ‘adjectives from nouns’ (from Bulgarian), e.g. </span><span class="T17">b</span><span class="T28">ǎnlif </span><span class="T42">‘wounded’</span></p><p class="P195"><span class="T2">-</span><span class="T28">nic</span><span class="T2"> ‘adjective from nouns’ (from Bulgarian -</span><span class="T28">nik</span><span class="T2">) three attestations, counting one with -</span><span class="T28">arnic</span><span class="T42">, e.g. </span><span class="T28">cǎvai̯nic </span><span class="T42">‘poor’</span></p></td>	\N	7	9	Eurasia	high	0	35	35
51	2013-11-19 20:49:34.599851+01	2013-11-19 20:49:34.599858+01	t	\N	88	Greek affixes in Arvanitic Albanian	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Sasse (<a href="__sassesprachkontakt1985__">1985</a>; <a href="__sassearvanitika1991__">1991</a>). According to Sasse (<a href="__sassesprachkontakt1985__">1985</a>: 91–92), borrowed affixes have become productive and can today be added to Albanian stems.</p><p class="P10"> </p><p class="P10"><span class="T48">4 diminutive markers</span> (out of a total of 7 diminutive markers in Arvanitic Albanian) (Sasse <a href="__sassearvanitika1991__">1991</a>: 235–239), which do not seem to be phonologically conditioned allomorphs</p><p class="P195"><span class="T2">‑(</span><span class="T28">á)ko </span><span class="T2">‘diminutive’, e.g. </span><span class="T28">prift‑áko</span><span class="T2"> ‘little priest’, limited to a few cases, explicitly mentioned that it is borrowed by Sasse (<a href="__sassesprachkontakt1985__">1985</a>)</span></p><p class="P195"><span class="T2">‑</span><span class="T28">átʃ </span><span class="T2">‘diminutive’, e.g. </span><span class="T28">kuð</span><span class="T2">‑</span><span class="T28">átʃ </span><span class="T2">‘little jar’, limited productivity, explicitly mentioned that it is borrowed by Sasse (<a href="__sassesprachkontakt1985__">1985</a>)</span></p><p class="P195"><span class="T2">‑</span><span class="T28">ác </span><span class="T2">‘diminutive (pup)’, e.g. </span><span class="T28">ʎepur‑ác</span><span class="T2"> ‘rabbit’s pup’. Its use as diminutive with nouns other than animals is restricted to Greek stems </span><span class="T2">(Sasse <a href="__sassearvanitika1991__">1991</a>: 240)</span><span class="T2">.</span></p><p class="P195"><span class="T2">‑</span><span class="T28">ópuł </span><span class="T2">‘diminutive (pup)’, e.g. </span><span class="T28">uʎk</span><span class="T2">‑</span><span class="T28">ópuł </span><span class="T2">‘wolf’s pup’, has limited productivity </span><span class="T2">(Sasse <a href="__sassearvanitika1991__">1991</a>: 241)</span></p><p class="P212"> </p><p class="P10"><span class="T48">2 noun‑noun derivation suffixes</span> (out of a large set of other noun to noun derivation markers, e.g. feminine occupation, etc.) (Sasse <a href="__sassearvanitika1991__">1991</a>: 241–246)</p><p class="P195"><span class="T2">-</span><span class="T28">jár </span><span class="T2">‘agent noun’, e.g. </span><span class="T28">ʃurr‑jár</span><span class="T2"> ‘someone urinating’ (from </span><span class="T28">ʃúrrə </span><span class="T2">‘urine’). Is largely productive, and partially native and partially borrowed from Greek </span><span class="T28">‑(ι)άρης</span><span class="T2"> </span><span class="T2">(Sasse <a href="__sassearvanitika1991__">1991</a>: 242)</span><span class="T2">.</span></p><p class="P195"><span class="T2">‑</span><span class="T28">jót </span><span class="T2">‘inhabitant of’, e.g. </span><span class="T28">curkat‑jót</span><span class="T2"> ‘inhabitant of Kiurka’ (from </span><span class="T28">curkát</span><span class="T2"> ‘Kiurka’). Is productive; explicitly mentioned that it is borrowed by Sasse (<a href="__sassesprachkontakt1985__">1985</a>).</span></p><p class="P212"> </p><p class="P10"><span class="T48">3 verbalizers </span>(out of a total of 9 in Arvanitic Albanian verbalizers). All verbal derivational morphemes are unproductive (Sasse <a href="__sassearvanitika1991__">1991</a>: 252–255).</p><p class="P195"><span class="T2">‑</span><span class="T28">(j)ás </span><span class="T2">‘verbalizer’, e.g. </span><span class="T28">morr‑á</span><span class="T2"> ‘delouse’ (from </span><span class="T28">mórr</span><span class="T2"> ‘louse’). The form is given as ‑</span><span class="T28">(j)ás</span><span class="T2"> </span><span class="T2">(Sasse <a href="__sassearvanitika1991__">1991</a>: 254)</span><span class="T2"> or ‑</span><span class="T28">á </span><span class="T2">(Sasse <a href="__sassesprachkontakt1985__">1985</a>), but according to Sasse (personal communication, 2012) </span><span class="T28">‑as </span><span class="T2">is the correct form. Sasse (<a href="__sassesprachkontakt1985__">1985</a>) explicitly mentions that it is borrowed.</span></p><p class="P195"><span class="T2">‑</span><span class="T28">ís </span><span class="T2">‘verbalizer’, e.g. </span><span class="T28">dzarr‑ís </span><span class="T2">‘to harrow’ (from </span><span class="T28">dzárrə </span><span class="T2">‘harrow’), only attested in a few words, explicitly mentioned that it is borrowed by Sasse (<a href="__sassesprachkontakt1985__">1985</a>).</span></p><p class="P195"><span class="T2">‑</span><span class="T28">ós </span><span class="T2">‘verbalizer’, e.g. </span><span class="T28">ɲatr‑ós</span><span class="T2"> ‘let oneself seduce’ (from </span><span class="T28">ɲátrə </span><span class="T2">‘another’),</span><span class="T28"> </span><span class="T2">only attested in one word, explicitly mentioned that it is borrowed by Sasse (<a href="__sassesprachkontakt1985__">1985</a>).</span></p><p class="P212"> </p><p class="P10"><span class="T48">11 adjectives used as derivational prefixes</span> (or bound, first elements of compounds) on nouns (adjective‑noun compounds) (Sasse <a href="__sassearvanitika1991__">1991</a>: 257–258) (out of a total of 11 such forms in Arvanitic Albanian). All are productive, for almost all there are various examples with Albanian stems.</p><p class="P195"><span class="T28">aγrio</span><span class="T2">‑ ‘wild’, e.g. </span><span class="T28">aγrio‑dérr </span><span class="T2">‘wild boar’</span></p><p class="P195"><span class="T28">ðoʎo</span><span class="T2">‑ ‘poor’ (only three attestations, all from songs), e.g. </span><span class="T28">ðoʎo‑nún</span><span class="T2"> ‘poor godfather’</span></p><p class="P195"><span class="T28">meγalo</span><span class="T2">‑ ‘big’, e.g. </span><span class="T28">meγalo‑kopíʎe </span><span class="T2">‘old spinster’</span></p><p class="P195"><span class="T28">mes</span><span class="T2">‑ ‘medium’, e.g. </span><span class="T28">mes‑nátə </span><span class="T2">‘midnight’</span></p><p class="P195"><span class="T28">mono</span><span class="T2">‑ ‘single’, e.g. </span><span class="T28">mono‑bíʎə </span><span class="T2">‘single daughter’</span></p><p class="P195"><span class="T28">mavro</span><span class="T2">‑ ‘black, pitiful’, e.g. </span><span class="T28">mavro‑pʎák </span><span class="T2">‘poor old man’</span></p><p class="P195"><span class="T28">paʎo</span><span class="T2">‑ ‘bad’ (very popular), e.g. </span><span class="T28">paʎo‑djáʎə </span><span class="T2">‘naughty child’</span></p><p class="P195"><span class="T28">psefto‑ </span><span class="T2">‘fake’, e.g. </span><span class="T28">psefto‑púnǝ </span><span class="T2">‘superficial work’</span></p><p class="P195"><span class="T28">proto‑ </span><span class="T2">‘first’ (only one example given), e.g. </span><span class="T28">proto‑hérǝ</span><span class="T2"> ‘for the first time’</span></p><p class="P195"><span class="T28">stravo‑ </span><span class="T2">‘crooked’ (only attested once), e.g. </span><span class="T28">stravo‑grúa </span><span class="T2">‘stubborn woman’</span></p><p class="P195"><span class="T28">vromo‑</span><span class="T2"> ‘dirty, smelly’, e.g. </span><span class="T28">vromo‑púnǝ</span><span class="T2"> ‘dirty work’</span></p><p class="P10">Very rarely and only in songs Albanian adjectives are also used in such constructions (Sasse <a href="__sassearvanitika1991__">1991</a>: 258).</p><p class="P10"> </p><p class="P2"><span class="T3">2 prepositions as derivational devices on nouns</span><span class="T2"> (out of a total of 3 in Arvanitic Albanian, the native Albanian one is </span><span class="T28">nənə</span><span class="T2">‑ ‘under’)</span></p><p class="P195"><span class="T28">para</span><span class="T2">‑ ‘next to’, e.g. </span><span class="T28">para‑tátǝ </span><span class="T2">‘stepfather’</span></p><p class="P195"><span class="T28">pro</span><span class="T2">‑ ‘before’, e.g. </span><span class="T28">pro‑tátǝ </span><span class="T2">‘forefather’</span></p><p class="P212"> </p><p class="P2"><span class="T3">1 preposition as derivational device on adjectives, participles, and adverbs</span><span class="T2"> (out of a total of 2 in Arvanitic Albanian, the native Albanian one is </span><span class="T28">pa‑</span><span class="T2"> ‘without’)</span></p><p class="P195"><span class="T28">kata‑</span><span class="T2"> ‘very’, e.g. </span><span class="T28">kata‑i‑ri </span><span class="T2">‘brand new’ (from </span><span class="T28">i‑ri</span><span class="T2"> ‘new’), </span><span class="T28">katanáni </span><span class="T2">‘right now’ (from </span><span class="T28">náni</span><span class="T2"> ‘now’)</span></p><p class="P10"> </p><p class="P2"><span class="T3">4 (5) preverbs</span><span class="T2"> (out of a total of 8 in Arvanitic Albanian), </span><span class="T28">kata‑</span><span class="T2"> is also used with adjectives and not counted here again) </span><span class="T2">(Sasse <a href="__sassearvanitika1991__">1991</a>: 262–267)</span><span class="T2">. These have entered the language on Greek loans, but have become productive with Albanian stems</span></p><p class="P195"><span class="T28">apo</span><span class="T2">‑ (different functions, only few cases), e.g. </span><span class="T28">apo‑bǝ́nem</span><span class="T2"> ‘I become’, </span><span class="T28">apo‑híng(ǝ)ra </span><span class="T2">‘I ate up’</span></p><p class="P195"><span class="T28">kse</span><span class="T2">‑ (different functions, like German </span><span class="T28">ent‑, aus‑, auf‑</span><span class="T2">, very frequent, also with Albanian verbs), e.g. </span><span class="T28">kse‑ʎóð(əɲ) </span><span class="T2">‘let someone rest’</span></p><p class="P195"><span class="T28">ksana</span><span class="T2">‑ ‘do x again’ (very productive, also with Albanian verbs), e.g. </span><span class="T28">ksana‑háp(əɲ) </span><span class="T2">‘open again’</span></p><p class="P195"><span class="T28">para</span><span class="T2">‑ ‘excessively’, e.g. </span><span class="T28">para‑há </span><span class="T2">‘eat too much’</span></p><p class="P195"><span class="T2">(plus </span><span class="T28">kata</span><span class="T2">‑ ‘intensifier’ (relatively rare), repeated from above, example of use as preverb </span><span class="T28">kata‑ʎóðem </span><span class="T2">‘I become very tired, i.e. I work too hard’)</span></p><p class="P212"> </p><p class="P10"><span class="T48">4 adjectives as derivational devices</span> (first elements of compounds) (Sasse <a href="__sassearvanitika1991__">1991</a>: 267)</p><p class="P195"><span class="T28">kalo‑</span><span class="T2"> ‘good’, e.g. </span><span class="T28">kalo‑pagúan </span><span class="T2">‘pay well’</span></p><p class="P195"><span class="T28">kako‑</span><span class="T2"> ‘bad’, e.g. </span><span class="T28">kako‑pagúan </span><span class="T2">‘pay badly’</span></p><p class="P195"><span class="T28">miso‑</span><span class="T2"> ‘medium’, e.g. </span><span class="T28">miso‑háp(əɲ) </span><span class="T2">‘open partially’</span></p><p class="P195"><span class="T28">proto‑</span><span class="T2"> ‘for the first time’, e.g. </span><span class="T28">proto‑véte</span><span class="T2"> ‘go for the first time’</span></p></td>	\N	87	62	Eurasia	high	0	30	31
82	2013-11-19 20:49:35.058341+01	2013-11-19 20:49:35.058353+01	t	\N	133	Portuguese affixes in Tetun Dili	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P276"><a id="a__Information_and_examples_are_from_Hajek__2006_172__"><span></span></a>Information and examples are from Hajek (<a href="__hajeklanguage2006__">2006</a>: 172).</p><p class="P278"><a id="a__1_nominalizer"><span></span></a>1 nominalizer</p><p class="P203"><span class="T28">‑dor</span><span class="T2"> ‘agent nominalizer’, someone who habitually does something (often pejorative), i.e. more restricted than the general agentive noun derivation in Portuguese, e.g. </span><span class="T28">hemudór</span><span class="T2"> ‘drinker’ (from </span><span class="T28">hemu</span><span class="T2"> ‘drink’) “the only Portuguese affix that can be applied to a native root” according to Hajek </span><span class="T2">(<a href="__hajeklanguage2006__">2006</a>: 172)</span><span class="T2">.</span></p></td>	\N	57	151	Southeast Asia & Oceania	high	0	0	1
52	2013-11-19 20:49:34.617733+01	2013-11-19 20:49:34.617737+01	t	\N	92	Russian affixes in Lithuanian Romani	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Tenser (<a href="__tenserlithuanian2005__">2005</a>: 13, 34–35).</p><p class="P10"> </p><p class="P33">1 superlative prefix</p><p class="P195"><span class="T28">naj‑ </span><span class="T2">‘superlative’, e.g. </span><span class="T30">nai‑bar‑edvr </span><span class="T13">(</span><span class="T55">superlative</span><span class="T13">‑big‑</span><span class="T55">comparative</span><span class="T13">) ‘the biggest’</span></p><p class="P212"> </p><p class="P41">5 aktionsart prefixes</p><p class="P222"><span class="T30">po‑ </span><span class="T23">‘aktionsart’, e.g. </span><span class="T30">po‑mang‑ </span><span class="T22">‘to ask’</span></p><p class="P222"><span class="T30">pod‑ </span><span class="T23">‘aktionsart’, e.g. </span><span class="T30">pod‑gij‑ </span><span class="T22">‘to approach’</span></p><p class="P222"><span class="T30">ros‑ </span><span class="T23">‘aktionsart’, e.g. </span><span class="T30">ros‑pxen‑ </span><span class="T22">‘to tell’</span></p><p class="P222"><span class="T30">vy‑ </span><span class="T23">‘aktionsart’, e.g. </span><span class="T30">vy‑pi‑ </span><span class="T22">‘to drink’</span></p><p class="P223"><span class="T30">za‑ </span><span class="T23">‘aktionsart’, e.g. </span><span class="T30">za‑pres‑ </span><span class="T22">‘to pay’</span></p></td>	\N	55	102	Eurasia	high	0	6	5
53	2013-11-19 20:49:34.627229+01	2013-11-19 20:49:34.627237+01	t	\N	93	Spanish affixes in Sierra Popoluca	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P2"><span class="T28">­</span><span class="T2">Information and examples are from Gutiérrez‑Morales </span><span class="T2">(<a href="__gutierrezmoraleskueteero2005__">2005</a>; <a href="__gutierrezmoralesborrowing2008__">2008</a>)</span><span class="T2">. Note that the form of this affix is probably influenced by Nahuatl, where it appears as </span><span class="T28">‑teero</span><span class="T2"> in the complex loanword </span><span class="T28">kuenteero</span><span class="T2"> (from Spanish </span><span class="T28">cohetero</span><span class="T2">) ‘fireworks specialist’, and where it is reinforced by similar Nahuatl form </span><span class="T2">(Gutiérrez‑Morales <a href="__gutierrezmoralesborrowing2008__">2008</a>;  Gutiérrez‑Morales <a href="__gutierrezmoraleskueteero2005__">2005</a>)</span><span class="T2">.</span></p><p class="P10"> </p><p class="P33">1 agent noun derivation</p><p class="P205"><span class="T28">‑teero </span><span class="T2">‘agent noun’, e.g.</span><span class="T28"> </span><span class="T30">kööp‑teeroj </span><span class="T13">(</span><span class="T2">firewood‑</span><span class="T53">agent</span><span class="T2">) ‘wood cutter’, </span><span class="T30">nöts‑teeroj‑am </span><span class="T2">(armadillo‑</span><span class="T53">agent‑</span><span class="T42">already</span><span class="T2">) ‘armadillo hunter’, </span><span class="T30">aa‑teeroj </span><span class="T2">(canoe‑</span><span class="T53">agent</span><span class="T2">) ‘rower, paddler’, </span><span class="T30">tö’öp‑teeroj </span><span class="T2">(fish‑</span><span class="T53">agent</span><span class="T2">) ‘fisherman’, </span><span class="T30">nö’‑teeroj </span><span class="T2">(water‑</span><span class="T53">agent</span><span class="T2">) ‘water carrier’, </span><span class="T30">muut‑teeroj </span><span class="T2">(well‑</span><span class="T53">agent</span><span class="T2">) ‘well driller’, </span><span class="T30">yooxa‑teeroj </span><span class="T2">(work‑</span><span class="T53">agent</span><span class="T2">) ‘hard worker’</span></p></td>	\N	70	156	South America	mid	1	0	1
54	2013-11-19 20:49:34.637719+01	2013-11-19 20:49:34.637728+01	t	\N	94	Makrān Baluchi affixes in Brahui	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Emeneau (<a href="__emeneaubrahui1962__">1962</a>) and Andronov (<a href="__andronovbrahui1980__">1980</a>).</p><p class="P10"> </p><p class="P33">1 verbal prefix</p><p class="P195"><span class="T28">a‑ </span><span class="T2">‘present‑future and imperfect’, e.g. </span><span class="T31">ī‑a kāva, </span><span class="T46">underlying form</span><span class="T31"> ī a‑kāva</span><span class="T14"> (I/</span><span class="T56">future</span><span class="T14">‑go) </span><span class="T2">‘I shall go’ </span><span class="T2">(Emeneau <a href="__emeneaubrahui1962__">1962</a>: 56–57;  Andronov <a href="__andronovbrahui1980__">1980</a>: 68)</span></p><p class="P10"> </p><p class="P33">2 adjectival derivational suffixes</p><p class="P195"><span class="T30">‑tir </span><span class="T13">‘comparative’</span><span class="T2">, e.g. </span><span class="T31">juāntir </span><span class="T14">‘better’ (from </span><span class="T31">juān </span><span class="T2">‘good’</span><span class="T14">) </span><span class="T14">(Andronov <a href="__andronovbrahui1980__">1980</a>: 45)</span><span class="T14">. This marker is originally Persian, but entered Brahui through Baluchi </span><span class="T14">(Elfenbein <a href="__steeverbrahui1998__">1998</a>: 398)</span><span class="T14">.</span></p><p class="P205"><span class="T31">‑ēn </span><span class="T14">‘</span><span class="T2">adjective formation’, e.g. </span><span class="T31">pudēn </span><span class="T2">‘cold’, </span><span class="T31">‘anēn </span><span class="T2">‘sweet’, </span><span class="T31">xarēn </span><span class="T2">‘bitter’, </span><span class="T31">kubēn </span><span class="T2">‘heavy’ </span><span class="T2">(Andronov <a href="__andronovbrahui1980__">1980</a>: 29)</span></p></td>	\N	37	56	Eurasia	high	0	2	3
55	2013-11-19 20:49:34.648815+01	2013-11-19 20:49:34.648824+01	t	\N	95	Malay affixes in Semelai	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Kruspe (<a href="__kruspegrammar2004__">2004</a>: 64–69, 81–85, 206–208). This is a case of extreme compartmentalization of borrowed and native morphology since all native morphology is non‑concatenative, and all borrowed morphology is concatenative. In this sense, all borrowed affixes are related.</p><p class="P10"> </p><p class="P33">2 valency‑changing prefixes and circumfix</p><p class="P195"><span class="T28">br‑</span><span class="T2"> ‘middle voice’ (passivization of verbs, nominalization ‘have’ of nouns), e.g. </span><span class="T28">br‑bɒy</span><span class="T2"> ‘be dug up’</span></p><p class="P195"><span class="T28">p‑</span><span class="T2"> ‘causative’ (used alternatively to non‑concatenative causative morpheme, with some roots only), e.g. </span><span class="T28">p‑jʔjiʔ </span><span class="T2">‘to make dirty’</span></p><p class="P10"> </p><p class="P33">4 aspect prefixes, including one circumfix</p><p class="P195"><span class="T28">tr‑</span><span class="T2"> ‘happenstance’, ‘happen to x’ (used with roots or causative‑derived, or reduplicated roots from verbs), e.g. </span><span class="T28">tr‑ca</span><span class="T2"> ‘happen to eat’</span></p><p class="P195"><span class="T28">par‑</span><span class="T2"> ~ </span><span class="T28">pr‑ </span><span class="T2">‘excessive agent/performer’ (with verbs), e.g. </span><span class="T28">par‑ca</span><span class="T2"> ‘one who eats incessantly, a glutton’</span></p><p class="P195"><span class="T28">m(N)‑</span><span class="T2"> ‘imperfective’ (derives intransitive verbs from nouns and imperfective verb forms from verbs), e.g. </span><span class="T28">m‑nar‑deh </span><span class="T2">‘be denying’</span></p><p class="P195"><span class="T28">b‑...‑an</span><span class="T2"> ‘collective’ (collective activity verbs from verbs), e.g. </span><span class="T28">b&lt;pa’loh&gt;an</span><span class="T2"> ‘many people hiding together’</span></p><p class="P10"> </p><p class="P33">1 valency‑changing suffix</p><p class="P195"><span class="T28">‑iʔ</span><span class="T2"> ‘applicative’ (increases valency, marks iterative aspect), e.g. </span><span class="T28">glɔk‑iʔ</span><span class="T2"> ‘to laugh unkindly at someone’</span></p><p class="P10"> </p><p class="P33">1 nominalizing suffix</p><p class="P195"><span class="T28">‑an </span><span class="T2">‘nominalizer’ (relatively infrequent), e.g. </span><span class="T28">jʔjiʔ‑an</span><span class="T2"> ‘dirtiness, filth’</span></p></td>	\N	28	98	Southeast Asia & Oceania	high	0	6	8
56	2013-11-19 20:49:34.667071+01	2013-11-19 20:49:34.667077+01	t	\N	96	Indonesian affixes in Tukang Besi	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information from Marc Donohue (personal communication, 2012). Although no examples of hybrid formation are available, this prefix seems to be used with native stems.</p><p class="P10"> </p><p class="P33">1 passive marker</p><p class="P195"><span class="T28">di‑ </span><span class="T2">‘passive’, used as a passive in subordinate clauses only in Tukang Besi, in addition to native (cognate) markers </span><span class="T28">i‑ </span><span class="T2">and (less commonly used) </span><span class="T28">ni‑</span><span class="T2">. What additionally may have helped borrowing is that Tukang Besi past tense marker is </span><span class="T28">di‑</span><span class="T2"> ~ </span><span class="T28">i‑</span><span class="T2">, i.e. the same allomorphy as the resulting passive marking pattern </span><span class="T2">(Donohue <a href="__donohuegrammar1999__">1999</a>)</span><span class="T2">.</span></p><p class="P212"> </p><p class="P2"><span class="T2">An additional, marginal case is </span><span class="T28">kempe‑</span><span class="T2">, a reanalysis of the first two syllables of </span><span class="T28">kempetai </span><span class="T2">‘Japanese secret police during the occupation’ and Tukang Besi </span><span class="T28">‑taʔi</span><span class="T2"> ‘feces’. Now, </span><span class="T28">kempe‑</span><span class="T2"> can be used with native stems such as</span><span class="T28"> ‑buta </span><span class="T2">‘vagina’,</span><span class="T28"> ‑lau </span><span class="T2">‘penis’, etc. (Marc Donohue, personal communication, 2012).</span></p></td>	\N	149	42	Southeast Asia & Oceania	high	0	0	1
83	2013-11-19 20:49:35.066184+01	2013-11-19 20:49:35.066196+01	t	\N	134	Spanish affixes in Purepecha/Tarascan	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P275"><a id="a__Information_and_examples_are_from_Chamoreau__2012_81–82__"><span></span></a><span class="T69">Information and examples are from Chamoreau </span>(<a href="__chamoreauspanish2012__">2012</a>: 81–82)<span class="T69">.</span></p><p class="P278"><a id="a__1_diminutive"><span></span></a>1 diminutive</p><p class="P204"><span class="T28">‑itu</span><span class="T2"> ‘diminutive’, e.g. </span><span class="T28">watsi‑itu‑etʃa‑ni</span><span class="T2"> (boy</span><span class="T53">‑diminutive‑pl‑object</span><span class="T2">) ‘(to) the boys’, </span><span class="T28">xantiakhu‑itu </span><span class="T2">‘completely alone’ (from </span><span class="T28">xantiakhu </span><span class="T2">‘alone’), </span><span class="T28">sapilati‑itu‑e‑p‑ka </span><span class="T2">(small</span><span class="T53">‑diminutive‑predication‑aorist.past-subject</span><span class="T2">) ‘(you) were very young’</span></p></td>	\N	60	156	North America	high	0	0	1
57	2013-11-19 20:49:34.677574+01	2013-11-19 20:49:34.677582+01	t	\N	97	Warembori affixes in Kwerba Kasonaweja	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information from Marc Donohue (personal communication, 2012). Although no examples of hybrid formations are given, it can be assumed that borrowed prefixes combine with native stems.</p><p class="P10"> </p><p class="P33">3 subject prefixes</p><p class="P195"><span class="T28">e‑</span><span class="T2"> ‘first person’</span></p><p class="P195"><span class="T28">o‑</span><span class="T2"> ‘second person’</span></p><p class="P195"><span class="T28">i‑</span><span class="T2"> ‘third person’</span></p><p class="P10"> </p><p class="P10">These are used in Kwerba Kasonaweja, which is in contact with Warembori, and has low prestige with respect to it. They are used in addition to native subject suffixes. Related Kwerba languages Kwerba Aurimi, Kwerba Isirawa, Kwerba Samorokana have no subject prefixes. <span class="T69">South Halmahjera languages related to Warembori have these prefixes. </span>Marc Donohue is not aware of other borrowed morphology. The origin of <span class="T69">South Halmahjera subject prefixes itself is complex, probably reanalyzed genitive suffixes (auxiliary‑genitive verb ‑&gt; Ø genitive‑verb). The three borrowed subject prefixes are the only monosyllabic (single vowel) pronoun prefixes in the source languages. </span></p></td>	\N	2	145	Southeast Asia & Oceania	high	0	3	3
58	2013-11-19 20:49:34.686011+01	2013-11-19 20:49:34.686019+01	t	\N	98	Farsi affixes in Lezgian	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P11">Information and examples are from Haspelmath (<a href="__haspelmathgrammar1993__">1993</a>: 107) and from Don Stilo (personal communication 2013).</p><p class="P11"> </p><p class="P11"><span class="T48">3 nominalizers</span> (out of a total of 8 nominalizers in Lezgian)</p><p class="P195"><span class="T28">‑qʰan</span><span class="T2"> ‘agent nouns from nouns’, e.g. </span><span class="T28">xpe‑qʰan</span><span class="T2"> ‘sheep herder’</span></p><p class="P195"><span class="T28">‑gan</span><span class="T2"> ‘nouns denoting containers from nouns’, e.g. </span><span class="T28">t’urar‑gan</span><span class="T2"> ‘box for spoons’</span></p><p class="P195"><span class="T28">‑ban</span><span class="T2"> ‘nouns denoting people associated with the thing denoted by the base word’, e.g. </span><span class="T28">wak’ar‑ban</span><span class="T2"> ‘swineherd’ </span></p></td>	\N	113	66	Eurasia	high	0	3	3
59	2013-11-19 20:49:34.697626+01	2013-11-19 20:49:34.697633+01	t	\N	99	Shua‑Tshwa affixes in G|ui‑Gǁana 	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10"><span class="T69">Information is from Güldemann </span>(<a href="__guldemannreconstruction2004__">2004</a>: 262) (see also Vossen <a href="__vossenkhoesprachen1997__">1997</a>)<span class="T69">, the example is from Vossen </span><span class="T69">(<a href="__vossenkhoesprachen1997__">1997</a>)</span><span class="T69">.</span></p><p class="P53"> </p><p class="P34">1 subject marker</p><p class="P200"><span class="T28">‑be </span><span class="T2">‘first person dual’, e.g. </span><span class="T28">hí.tsèbè </span><span class="T2">‘first person dual masculine pronoun’. This is a case of borrowing between closely related languages. The identification of this form as borrowed is based on the fact that the regular reflex would have been </span><span class="T28">‑m</span><span class="T2">, while in Shua‑Tshwa’s subbranch, all languages have </span><span class="T28">‑b</span><span class="T2">. G|ui‑Gǁana is the only language of its subbranch that has </span><span class="T28">‑b</span><span class="T2">. Shua‑Tshwa is sociolinguistically dominant with respect to G|ui‑Gǁana speakers.</span></p></td>	\N	47	30	Africa	low	2	0	1
60	2013-11-19 20:49:34.708385+01	2013-11-19 20:49:34.708396+01	t	\N	100	Chukchi affixes in Central Siberian Yupik Eskimo	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from de Reuse (<a href="__dereusesiberian1994__">1994</a>). There are many loanwords and very many borrowed adverbial and conjunctional particles, but only three bound forms were borrowed, one suffix and two clitics. They seem to have a similar distribution ( de Reuse <a href="__dereusesiberian1994__">1994</a>: 288) and similar meanings, therefore they are considered to be paradigmatically related.</p><p class="P10"> </p><p class="P33">3 emphatic enclitics/suffixes</p><p class="P195"><span class="T28">‑am </span><span class="T2">‘emphatic’, e.g. </span><span class="T28">maatenllaam </span><span class="T2">‘this time’ (from </span><span class="T28">maaten </span><span class="T2">‘time’,</span><span class="T28"> =llu</span><span class="T2"> ‘and’), </span><span class="T28">sanganllaam </span><span class="T2">‘why now’ (from </span><span class="T28">sangan </span><span class="T2">‘why’,</span><span class="T28"> =llu</span><span class="T2"> ‘and’), </span><span class="T28">qayuqham </span><span class="T2">‘how is it? how did it go?’ (from </span><span class="T28">qayuq </span><span class="T2">‘how’) </span><span class="T2">( de Reuse <a href="__dereusesiberian1994__">1994</a>: 364)</span><span class="T2">. This form is called an affix, but follows other clitics, such as </span><span class="T28">=llu</span><span class="T2"> ‘and’ </span><span class="T2">( de Reuse <a href="__dereusesiberian1994__">1994</a>: 288)</span><span class="T2">. See also Miyaoka </span><span class="T2">(<a href="__miyaokagrammar2012__">2012</a>: 1549–1550)</span><span class="T2">, who analyzes this form as a clitic.</span></p><p class="P194"><span class="T34">=qun </span><span class="T20">‘affirmative, emphasis’, e.g. </span><span class="T34">natenqun </span><span class="T20">‘how (could you think)?’ (from </span><span class="T34">naten </span><span class="T20">‘how’), </span><span class="T34">esghaqaghnakenqun</span><span class="T20"> ‘Look!’ (from </span><span class="T34">esghagh </span><span class="T20">‘see’), </span><span class="T34">tuugkaatqun </span><span class="T20">‘Harpoon heads!’ (from </span><span class="T34">tugkagh </span><span class="T20">‘harpoon head’) </span><span class="T2">( de Reuse <a href="__dereusesiberian1994__">1994</a>: 270–276, 424)</span></p><p class="P194"><span class="T34">=Vy </span><span class="T20">‘emphatic vocative’, e.g. </span><span class="T34">angyaay </span><span class="T20">‘Hey, boat!’ (from </span><span class="T34">angyagh</span><span class="T20"> ‘boat’), </span><span class="T34">qakmaay</span><span class="T20"> ‘You out there!’ (from </span><span class="T34">qakma</span><span class="T20"> ‘out’), </span><span class="T34">kangsughtungaay</span><span class="T20"> ‘I cannot fit through!’ (from </span><span class="T34">kangsugh</span><span class="T20"> ‘cannot fit through’) </span><span class="T2">( de Reuse <a href="__dereusesiberian1994__">1994</a>: 285–287, 424)</span></p></td>	\N	11	108	North America	high	0	3	3
61	2013-11-19 20:49:34.716813+01	2013-11-19 20:49:34.716822+01	t	\N	101	Karrwa affixes in Kayardild	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information from Nicholas Evans (personal communication, February 2012).</p><p class="P10"> </p><p class="P195"><span class="T28">‑nganji</span><span class="T2"> ‘dear’ (applied to a relative) (no example of hybrid formation available).</span></p></td>	\N	124	101	Australia & New Guinea	high	0	0	1
62	2013-11-19 20:49:34.729542+01	2013-11-19 20:49:34.72955+01	t	\N	102	Hindi affixes in Kurux	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P11">Information and examples are from Mishra (<a href="__mishraword1996__">1996</a>). Only affixes for which there are indications that they are used on native stems are given in the following.</p><p class="P44"> </p><p class="P10"><span class="T50">4 adjectivizers</span><span class="T69">. About these four, Mishra </span><span class="T69">(<a href="__mishraword1996__">1996</a>: 98)</span><span class="T69"> explicitly states that they are borrowed and productive, Mishra </span>(<a href="__mishraword1996__">1996</a>: 48–51)<span class="T69"> gives many other affixes, about which this is not explicitly stated.</span></p><p class="P200"><span class="T28">‑ū </span><span class="T2">‘adjectivizer’, e.g. </span><span class="T28">pīṭū </span><span class="T2">‘fatal’ (from </span><span class="T28">pīṭ </span><span class="T2">‘to kill’)</span></p><p class="P200"><span class="T28">‑hā </span><span class="T2">‘adjectivizer’, e.g. </span><span class="T28">bhūthā </span><span class="T2">‘haunted’ (from </span><span class="T28">bhūt</span><span class="T2"> ‘ghost’)</span></p><p class="P200"><span class="T28">‑yā </span><span class="T2">‘adjectivizer’, e.g. </span><span class="T28">banyā </span><span class="T2">‘wild’ (from </span><span class="T28">ban </span><span class="T2">‘forest’)</span></p><p class="P200"><span class="T28">‑al </span><span class="T2">‘adjectivizer’, e.g. </span><span class="T28">ḍubal </span><span class="T2">‘drowned’ (from </span><span class="T28">ḍub‑</span><span class="T2"> ‘to drown’)</span></p><p class="P11"> </p><p class="P11"><span class="T48">1 gender marker</span>, assuming that the following forms are phonologically conditioned allomorphs</p><p class="P195"><span class="T29">‑ī, ‑in, ‑āin, ‑nī </span><span class="T6">‘feminine’. These are “directly borrowed from Indo‑Aryan. The suffixes are mostly added to the borrowed nouns” </span><span class="T2">(Mishra 1996:96, see also 21–22)</span><span class="T6">, which seems to imply that they are not exclusively used on borrowed nouns </span><span class="T2">(see also Abbi <a href="__abbilanguages1997__">1997</a>: 142; <a href="__abbimanual2001__">2001</a>: 47–48)</span><span class="T6">.</span></p><p class="P11"> </p><p class="P2"><span class="T4">2 forms deriving special numerals</span><span class="T6">. The “suffixes </span><span class="T29">khēp </span><span class="T6">and </span><span class="T29">bahrī</span><span class="T6"> are used to form enumerative/proportional numerals [...] the suffix </span><span class="T29">‑ō</span><span class="T6"> forming adjectival constructions from numerals” </span><span class="T2">(Mishra <a href="__mishraword1996__">1996</a>: 96–97)</span><span class="T6">. Examples of ‑</span><span class="T29">khēp </span><span class="T6">and </span><span class="T29">‑bahrī</span><span class="T6"> are given in Mishra </span><span class="T6">(<a href="__mishraword1996__">1996</a>: 32)</span><span class="T6">, where they are also written as suffixes. Numerals one to four are indigenous Kurux </span><span class="T2">(Mishra <a href="__mishraword1996__">1996</a>: 30)</span><span class="T6">. There are examples of </span><span class="T29">‑ō</span><span class="T6"> and ‑</span><span class="T29">khēp</span><span class="T6"> in combination with numerals lower than five, but all examples of </span><span class="T29">‑bahrī</span><span class="T6"> are with the borrowed numerals five or higher, therefore </span><span class="T29">‑bahrī</span><span class="T6"> is not included here.</span></p><p class="P200"><span class="T28">‑khēp </span><span class="T2">‘enumerative/proportional numerals’, e.g. </span><span class="T28">ōnd khēp</span><span class="T2"> ‘once’</span></p><p class="P200"><span class="T28">‑ō </span><span class="T2">‘adjectives from numerals’, e.g. </span><span class="T28">tin‑ō</span><span class="T2">, e.g. ‘all the three’</span></p><p class="P11"> </p><p class="P34">1 passive marker</p><p class="P200"><span class="T28">‑r/‑tār </span><span class="T2">‘passive’, e.g. </span><span class="T28">cōx‑tār/cōx‑r</span><span class="T2"> ‘to be plucked’ (from </span><span class="T28">cōx </span><span class="T2">‘to pluck’), </span><span class="T28">la’ō‑tār/la’ō‑r</span><span class="T2"> ‘to be beaten up’ (from </span><span class="T28">la’ō </span><span class="T2">‘to beat someone up’). Abbi </span><span class="T2">(<a href="__abbilanguages1997__">1997</a>: 140)</span><span class="T2"> explicitly claims this form is borrowed from Indo‑Aryan. Mishra </span><span class="T2">(<a href="__mishraword1996__">1996</a>: 108)</span><span class="T2"> discusses this form and says passive arose from contact with Indo‑Aryan, but does not say explicitly that the form </span><span class="T28">‑r/‑tār</span><span class="T2"> would be borrowed.</span></p><p class="P11"> </p><p class="P3"><span class="T2">Abbi </span><span class="T2">(<a href="__abbilanguages1997__">1997</a>: 140, 142)</span><span class="T2"> mentions that the two Indo‑Aryan “conjunctive participles” </span><span class="T28">‑ar </span><span class="T2">and </span><span class="T28">‑ki</span><span class="T2"> would be used in urban Kurux. Because they are written as separate words by Abbi </span><span class="T2">(<a href="__abbilanguages1997__">1997</a>: 140)</span><span class="T2">, and also because no corresponding forms were found in Mishra </span><span class="T2">(<a href="__mishraword1996__">1996</a>)</span><span class="T2">, they are not considered here.</span></p></td>	\N	134	89	Eurasia	mid	1	6	8
63	2013-11-19 20:49:34.746751+01	2013-11-19 20:49:34.746756+01	t	\N	107	Persian affixes in Turkish	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Göksel and Kerslake (<a href="__gokselturkish2005__">2005</a>), Vietze, Zenker, and Warnke (<a href="__vietzerucklaufiges1975__">1975</a>), Kubiyak (<a href="__kubiyakrucklaufiges2004__">2004</a>), Memoglu‑Süleymanoglu (<a href="__memoglusuleymanogluturkcenin2006__">2006</a>), Nişanyan (<a href="__nisanyansozlerin2009__">2009</a>), Zengin (<a href="__zenginturkcenin2009__">2009</a>), and personal communication by Jaklin Kornfilt, as well as Korfilt (<a href="__kornfiltturkish1997__">1997</a>: 463–465). During the Ottoman Empire (13th‑19th century), there was a heavy influence by Arabic (especially in religious styles) and Persian (especially in literary styles), particularly in higher and educated registers (Göksel and Kerslake 2005:xxv–xxviii). Since 1911 there is a movement to clear Turkish of Arabic and Persian influence and “words containing Arabic and Persian suffixes are increasingly giving way to their synonyms of Turkish origin” (Göksel and Kerslake <a href="__gokselturkish2005__">2005</a>: 59). The following examples were compiled with the help of Sabine Günther. Only affixes that are attested with Turkish stems are given, there are also Persian affixes that are only used with Persian stems.</p><p class="P17"> </p><p class="P17"><span class="T48">6 noun‑forming suffixes</span> (including one forming nouns and adjectives)</p><p class="P205"><span class="T28">‑baz</span><span class="T2"> ‘agent or occupation noun’, </span><span class="T12">e.g. </span><span class="T33">madrabaz </span><span class="T12">‘swindler’ (from </span><span class="T33">mandıra</span><span class="T12"> ‘small cheesery’), </span><span class="T33">dilbaz </span><span class="T12">‘somebody who’s good with words’ (from </span><span class="T33">dil</span><span class="T12"> ‘tongue, language’), </span><span class="T33">davlumbaz </span><span class="T12">‘shrouding, chimney hood, paddle box’ (from </span><span class="T33">davul</span><span class="T12"> ‘drum’), </span><span class="T33">düzenbaz </span><span class="T12">‘cheater’ (from </span><span class="T28">düzen</span><span class="T2"> ‘regulation, scheme’</span><span class="T12">), </span><span class="T33">oyunbaz </span><span class="T12">‘playful person’ (from </span><span class="T33">oyun</span><span class="T12"> ‘play, game, jest, trick’), </span><span class="T33">kuşbaz </span><span class="T12">‘</span><span class="T2">raiser, trainer, or seller of birds’</span><span class="T12"> (from </span><span class="T33">kuş</span><span class="T12"> ‘bird’)</span></p><p class="P205"><span class="T28">‑dan </span><span class="T42">(</span><span class="T2">various noun derivations), </span><span class="T12">e.g.</span><span class="T33"> yağdan(lık) </span><span class="T12">‘lubricator’ (from </span><span class="T33">yağ</span><span class="T12"> ‘oil’), </span><span class="T33">sonradan </span><span class="T12">‘afterwards’ (from </span><span class="T33">sonra</span><span class="T12"> ‘after, later’), </span><span class="T33">yaradan </span><span class="T12">‘the Creator’ (from </span><span class="T33">yara</span><span class="T12"> ‘injury’)</span></p><p class="P199"><span class="T28">‑(h)ane</span><span class="T2"> ‘place noun derivation’, e.g. </span><span class="T42">balıkhane</span><span class="T2"> ‘fish market’ (from </span><span class="T42">balık</span><span class="T2"> ‘fish’), </span><span class="T42">boyahane </span><span class="T2">‘dyeing factory’ (from </span><span class="T42">boya </span><span class="T2">‘dye’), </span><span class="Strong_20_Emphasis"><span class="T47">yemekhane</span></span><span class="Strong_20_Emphasis"><span class="T2"> ‘dining room’ (from </span></span><span class="Strong_20_Emphasis"><span class="T42">yemek</span></span><span class="Strong_20_Emphasis"><span class="T2"> ‘food’)</span></span></p><p class="P205"><span class="T28">‑kar</span><span class="T2"> ‘a person associated with a profession or occupation and other derivations’, e.g. </span><span class="T33">koçkar </span><span class="T12">‘a ram that was raised for fighting’ (from </span><span class="T33">koç</span><span class="T12"> ‘ram’), </span><span class="T33">buzulkar </span><span class="T12">‘fern’ (from </span><span class="T33">buzul</span><span class="T12"> ‘glacier’)</span></p><p class="P205"><span class="T28">‑zede </span><span class="T2">‘victims of a catastrophic event’</span><span class="T12">, e.g.</span><span class="T33"> depremzede </span><span class="T12">‘earthquake victim’ (from </span><span class="T33">deprem</span><span class="T12"> ‘earthquake’), </span><span class="T33">sınavzede </span><span class="T12">‘</span><span class="T2">student who suffers from exams</span><span class="T12">’ (from </span><span class="T33">sınav</span><span class="T12"> ‘test, examination’)</span></p><p class="P205"><span class="T28">‑dar</span><span class="T2"> ‘agent noun derivation’</span><span class="T12">, e.g.</span><span class="T33"> bayraktar </span><span class="T12">‘</span><span class="T2">standard‑bearer’</span><span class="T12"> (from </span><span class="T33">byrak</span><span class="T12"> ‘flag’), </span><span class="T33">sancaktar </span><span class="T12">‘</span><span class="T2">standard‑bearer’</span><span class="T12"> (from </span><span class="T33">sancak</span><span class="T12"> ‘flag’)</span></p><p class="P17"> </p><p class="P17"><span class="T48">1 adjective‑forming suffix</span> (plus one forming nouns and adjectives, see above)</p><p class="P205"><span class="T28">‑vari </span><span class="T42">‘</span><span class="T2">adjectivizer’</span><span class="T12">, e.g.</span><span class="T33"> yengeçvari </span><span class="T12">‘crab‑like’ (from </span><span class="T33">yengeç</span><span class="T12"> ‘crab’), </span><span class="T33">Türkvari </span><span class="T12">‘Turk‑like’ (from </span><span class="T33">Türk</span><span class="T12"> ‘Turk’). There are also many new formations based on non‑Turkish stems, e.g. </span><span class="T28">gangstervari</span><span class="T2"> ‘gangsterlike’, </span><span class="T28">Amerikanvari</span><span class="T2"> ‘American‑style’.</span></p><p class="P17"> </p><p class="P17">Note that none of the very many derivational suffixes attaching to verbs were borrowed and also no suffixes that attach to nominals to form verbs (Göksel and Kerslake <a href="__gokselturkish2005__">2005</a>: 53–57). Note also that the set of Persian affixes in Azari (closely related to Turkish) is different.</p></td>	\N	81	119	Eurasia	high	0	6	7
64	2013-11-19 20:49:34.764268+01	2013-11-19 20:49:34.764277+01	t	\N	108	Persian affixes in Azari	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P113">Information and examples are from Dehghani (<a href="__dehghanigrammar2000__">2000</a>). The affixes given in the following are described as “borrowed prefixes and suffixes which are used frequently in Azari and which can attach to some native stems”, unlike others, which “can only attach to borrowed stems” (Dehghani <a href="__dehghanigrammar2000__">2000</a>: 96–97). Dehghani (<a href="__dehghanigrammar2000__">2000</a>: 87–96) provides a clear description of the morphology, allowing to see how many forms of the grammatical subsystems are borrowed affixes.</p><p class="P113"> </p><p class="P120"><span class="T3">2 privative-possessive adjectivizer prefixes</span><span class="T2">. These two function as equivalents for the native suffixes ‑</span><span class="T28">sIz </span><span class="T2">and ‑</span><span class="T28">lI</span><span class="T2"> </span><span class="T2">(Dehghani <a href="__dehghanigrammar2000__">2000</a>: 97)</span></p><p class="P228"><span class="T28">ba‑ </span><span class="T2">‘having the quality specified by the noun’, e.g. </span><span class="T28">baädäb </span><span class="T2">‘polite’ (from </span><span class="T28">ädäb</span><span class="T2"> ‘politeness’), </span><span class="T28">basavad</span><span class="T2"> ‘literate’ (from </span><span class="T28">savad</span><span class="T2"> ‘literacy’)</span></p><p class="P228"><span class="T28">bi‑ </span><span class="T2">‘privative’, e.g. </span><span class="T28">biädäb </span><span class="T2">‘impolite’ (from </span><span class="T28">ädäb</span><span class="T2"> ‘politeness’), </span><span class="T28">bisavad</span><span class="T2"> ‘illiterate’ (from </span><span class="T28">savad</span><span class="T2"> ‘literacy’)</span></p><p class="P113"> </p><p class="P113"><span class="T48">7 noun‑forming derivational suffixes </span>(out of 10 such forms, i.e. there are 3 native ones, not counting “rarely used derivational suffixes, of which another 2 derive nouns from nouns)</p><p class="P228"><span class="T28">‑ban </span><span class="T2">‘a person who guards or maintains N as his usual occupation’, e.g. </span><span class="T28">bagban </span><span class="T2">‘gardener’ (from </span><span class="T28">bag</span><span class="T2"> ‘garden’), </span><span class="T28">jängäl‑ban</span><span class="T2"> ‘forester’</span><span class="T28"> </span><span class="T2">(from </span><span class="T28">jängäl</span><span class="T2"> ‘forest’)</span></p><p class="P228"><span class="T28">‑baz</span><span class="T2"> ‘the person whose occupation involves N’, e.g.</span><span class="T28"> gumarbaz </span><span class="T2">‘gambler’ (from </span><span class="T28">gumar</span><span class="T2"> ‘gambling’), </span><span class="T28">gušbaz</span><span class="T2"> ‘bird keeper’ (from </span><span class="T28">guš</span><span class="T2"> ‘bird’)</span></p><p class="P228"><span class="T28">‑čA</span><span class="T2"> ‘diminutive’, e.g. </span><span class="T28">bagča</span><span class="T2"> ‘small garden’ (from </span><span class="T28">bag</span><span class="T2"> ‘garden’), </span><span class="T28">käläkča </span><span class="T2">‘small boat’ (from </span><span class="T28">käläk</span><span class="T2"> ‘boat’)</span></p><p class="P228"><span class="T28">‑dan </span><span class="T2">‘standard container for N’, e.g. </span><span class="T28">gänddan </span><span class="T2">‘sugar bowl’ (from </span><span class="T28">gänd</span><span class="T2"> ‘sugar’), </span><span class="T28">güldan</span><span class="T2"> ‘flower pot’ (from </span><span class="T28">gül</span><span class="T2"> ‘flower’)</span></p><p class="P228"><span class="T28">‑dar </span><span class="T2">‘the person who owns N’, e.g. </span><span class="T28">eldar</span><span class="T2"> ‘the head of tribe’ (from </span><span class="T28">el</span><span class="T2"> ‘tribe’), </span><span class="T28">puldar</span><span class="T2"> ‘rich’ (from </span><span class="T28">pul </span><span class="T2">‘money’)</span></p><p class="P228"><span class="T28">‑Istan</span><span class="T2"> ‘a place designed to contain N’, e.g. </span><span class="T28">gäbiristan</span><span class="T2"> ‘cemetery’ (from </span><span class="T28">gäbir </span><span class="T2">‘grave’), </span><span class="T28">gülüstan</span><span class="T2"> ‘rose garden’ (from </span><span class="T28">gül</span><span class="T2"> ‘flower’)</span></p><p class="P228"><span class="T2">­</span><span class="T28">‑saz</span><span class="T2"> ‘the person who is the maker or repairer of N as his usual occupation’, e.g. </span><span class="T28">čıragsaz </span><span class="T2">‘lamp maker’ (from </span><span class="T28">čırag </span><span class="T2">‘lamp’), </span><span class="T28">sahatsaz</span><span class="T2"> ‘watch maker’ (from </span><span class="T28">sahat</span><span class="T2"> ‘watch’)</span></p><p class="P113"> </p><p class="P113"><span class="T48">1 adjective‑forming derivational suffix</span> (out of 3 such forms, the only two native denominal adjectivizing suffixes are the two mentioned above that are being replaced by the borrowed prefixes, not counting one rarely used derivational suffixes, which derives adjectives from nouns)</p><p class="P229"><span class="T28">‑I </span><span class="T2">‘pertaining to N, having the quality of N’, e.g. </span><span class="T28">bazari </span><span class="T2">‘commercial’ (from </span><span class="T28">bazar </span><span class="T2">‘market’), </span><span class="T28">tarixi</span><span class="T2"> ‘historical’ (from </span><span class="T28">tarix</span><span class="T2"> ‘history’)</span></p></td>	\N	118	119	Eurasia	high	0	9	10
65	2013-11-19 20:49:34.784263+01	2013-11-19 20:49:34.78427+01	t	\N	109	Persian affixes in Kashmiri	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P17">The information and examples given below are taken from Koul (<a href="__koulstudies2005__">2005</a>: 156–158), which is the most recent one of the three descriptions available to me. Koul (<a href="__koulstudies2005__">2005</a>: 156–158) describes morphological borrowing in a section explicitly about borrowed morphology, and the affixes given below are explicitly described as combining with Kashmiri stems, even though this is in contradiction to an earlier description (Wali and Koul <a href="__walikashmiri1996__">1996</a>: 265) in at least one case, as noted below. Bhat (<a href="__bhatdescriptive1987__">1987</a>) and Wali &amp; Koul (<a href="__walikashmiri1996__">1996</a>) list a lot more Persian affixes than Koul (<a href="__koulstudies2005__">2005</a>: 156–158), but they are less explicit about whether the forms they give are used with Kashmiri stems.</p><p class="P17"> </p><p class="P17"><span class="T48">5 derivational prefixes</span>. It is uncertain whether the results are nouns, adjectives or may be both.</p><p class="P205"><span class="T28">be‑ </span><span class="T2">‘without’, e.g. </span><span class="T28">bepatsh</span><span class="T2"> ‘untrustworthy,’ </span><span class="T28">bezuv</span><span class="T2"> ‘without life’, </span><span class="T28">bevəti:r</span><span class="T2"> ‘without manners’. Wali &amp; Koul </span><span class="T2">(<a href="__walikashmiri1996__">1996</a>: 265)</span><span class="T2"> confirm that this prefix is used with native stems.</span></p><p class="P205"><span class="T28">ba:‑ </span><span class="T2">‘with’, e.g. </span><span class="T28">ba:darɨm</span><span class="T2"> ‘with religious piety’</span></p><p class="P205"><span class="T28">har‑ </span><span class="T2">‘every’, e.g. </span><span class="T28">harkã:h</span><span class="T2"> ‘every one’, </span><span class="T28">harja:yi</span><span class="T2"> ‘every place’</span></p><p class="P205"><span class="T28">kam‑ </span><span class="T2">‘little’, e.g. </span><span class="T28">kamza:n</span><span class="T2"> ‘a little acquainted person’</span></p><p class="P205"><span class="T28">bar‑ </span><span class="T2">‘on’, e.g. </span><span class="T28">barz’av</span><span class="T2"> ‘on the tip of the tongue’</span></p><p class="P205"><span class="T2">Note that there is also </span><span class="T28">bad‑</span><span class="T2"> ‘bad’, e.g. </span><span class="T28">badza:th</span><span class="T2"> ‘bad character’, but Wali &amp; Koul </span><span class="T2">(<a href="__walikashmiri1996__">1996</a>: 265)</span><span class="T2"> state that this prefix is only used with Persian stems, therefore it is excluded here.</span></p><p class="P17"> </p><p class="P36">2 suffixes deriving agent nouns</p><p class="P205"><span class="T30">‑gor </span><span class="T13">‘agent noun’, e.g. </span><span class="T28">g’avangor </span><span class="T2">‘one who sings’, </span><span class="T28">gindangor </span><span class="T2">‘one who plays’, </span><span class="T28">natsangor </span><span class="T2">‘one who dances’</span></p><p class="P205"><span class="T2">‑</span><span class="T30">ci: </span><span class="T13">‘agent noun’, e.g. </span><span class="T28">tabalci: </span><span class="T2">‘one who plays on tabla’, </span><span class="T28">ə:phi:mci </span><span class="T2">‘one who is addicted to opium’</span></p><p class="P17"> </p><p class="P36">2 suffixes deriving abstract nouns</p><p class="P205"><span class="T30">‑gi: </span><span class="T2">‘abstract noun’, e.g. </span><span class="T28">ga:nɨgi: </span><span class="T2">‘the act of procurer’, </span><span class="T28">badma:šɨgi:</span><span class="T2"> ‘the act of a rogue’</span></p><p class="P205"><span class="T28">‑i: </span><span class="T2">‘abstract nouns derived from nouns of agency’, e.g. </span><span class="T28">ma:sṭar </span><span class="T2">‘teacher’ vs. </span><span class="T28">ma:sṭəri: </span><span class="T2">‘teachership’, </span><span class="T28">aphsar </span><span class="T2">‘officer’ vs. </span><span class="T28">aphsari: </span><span class="T2">‘officership’, </span><span class="T28">da:kṭar </span><span class="T2">‘doctor’ vs. </span><span class="T28">ḍa:kṭəri: </span><span class="T2">‘medical practice’, </span><span class="T28">ci:n </span><span class="T2">‘China’ vs. </span><span class="T28">ci:ni: </span><span class="T2">‘Chinese’</span></p><p class="P17"> </p><p class="P36">4 suffixes deriving adjectives from nouns</p><p class="P205"><span class="T30">‑ba:z </span><span class="T13">‘adjectivizer’, e.g. </span><span class="T28">do:khɨba:z </span><span class="T2">‘deceitful’, </span><span class="T28">ca:lda:z </span><span class="T2">‘crafty’</span></p><p class="P205"><span class="T30">‑mand </span><span class="T13">‘adjectivizer’, e.g. </span><span class="T28">phə:ydɨmand </span><span class="T2">‘useful’, </span><span class="T28">akɨlmand </span><span class="T2">‘wise’, </span><span class="T28">do:latmand </span><span class="T2">‘rich</span></p><p class="P205"><span class="T30">‑za:d</span><span class="T28">ɨ </span><span class="T13">‘adjectivizer’</span><span class="T2">, e.g. </span><span class="T28">darza:dɨ </span><span class="T2">‘an offspring of Dars’</span></p><p class="P205"><span class="T28">‑da:r</span><span class="T2"> ‘</span><span class="T13">adjectivizer “</span><span class="T2">with x”’, e.g. </span><span class="T28">ləṭ’da:r</span><span class="T2"> ‘with tail’, </span><span class="T28">chiṭida:r</span><span class="T2"> ‘with prints’. Koul </span><span class="T2">(<a href="__koulstudies2005__">2005</a>: 157)</span><span class="T2"> gives this as an example of a combination of a Kashmiri prefix and Persian stem, but this is apparently the same as </span><span class="T28">‑da:r</span><span class="T2"> described by Baht </span><span class="T2">(<a href="__bhatdescriptive1987__">1987</a>: 88)</span><span class="T2">, who describes it as “added to nouns, common and productive” and gives examples such as “land lord, leader, honest” which suggest that </span><span class="T28">‑da:r </span><span class="T2">might be glossed as ‘with’.</span></p><p class="P17"> </p></td>	\N	106	119	Eurasia	high	0	13	13
66	2013-11-19 20:49:34.799435+01	2013-11-19 20:49:34.79944+01	t	\N	110	Komi‑Zyrian affixes in Khanty	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P17">Information and examples are from Sauer (<a href="__sauernominalbildung1967__">1967</a>: 171–188) (see also Sauer <a href="__sauersyrjanischen1963__">1963</a>;  Mägiste <a href="__magistesuffixentlehnung1968__">1968</a>: 6). According to Sauer (<a href="__sauernominalbildung1967__">1967</a>: 171–172), borrowed affixes are primarily productive, also with native stems.</p><p class="P17"> </p><p class="P17"><span class="T48">7 nominal derivational suffixes</span>. Sauer (<a href="__sauernominalbildung1967__">1967</a>) gives a total of 11 borrowed nominal derivational suffixes, but 4 of these are excluded here because they are not attested with native stems</p><p class="P205"><span class="T28">‑ja </span><span class="T2">‘adjectivizer’, e.g. </span><span class="T28">wŭ’rja </span><span class="T2">‘fat (of bears)’</span></p><p class="P205"><span class="T28">‑ki̬m ~ ‑kem ~ ‑kim ~ ‑kam ~ ‑kȧm </span><span class="T2">‘diminutive (note that all examples are with adjectives)’, e.g. </span><span class="T28">łełkam</span><span class="T2"> ‘smallish’</span></p><p class="P205"><span class="T28">‑kis</span><span class="T2"> ‘attenuative, adjectivizer’, e.g. </span><span class="T28">warkis </span><span class="T2">‘light red, reddish’</span></p><p class="P205"><span class="T28">‑an</span><span class="T2"> ‘instrument noun’, e.g. </span><span class="T28">šestän</span><span class="T2"> ‘pole for pushing a boat along’</span></p><p class="P205"><span class="T28">‑as</span><span class="T2"> ‘nominalizer’, e.g. </span><span class="T28">šărtas keʌ </span><span class="T2">‘belt’</span></p><p class="P205"><span class="T28">‑tek, ‑tak</span><span class="T2"> ‘adjectivizer’, e.g. </span><span class="T28">šitak </span><span class="T2">‘peaceful’</span></p><p class="P205"><span class="T28">‑tem ~ ‑tim ~ ‑tam ~ ‑tȧm</span><span class="T2"> ‘negative adjective formation’, e.g. </span><span class="T28">ŏččam </span><span class="T2">‘unintelligent, stupid’</span></p><p class="P215"> </p><p class="P36">2 comparative/superlative particles</p><p class="P205"><span class="T28">‑čək</span><span class="T2"> ‘comparative’, e.g. </span><span class="T28">ȧjčək</span><span class="T2"> ‘smaller’</span></p><p class="P205"><span class="T28">‑mȧtȧ</span><span class="T2"> ‘superlative’, e.g. </span><span class="T28">ȧjmȧtȧ </span><span class="T2">‘smallest’</span></p><p class="P215"> </p><p class="P17"><span class="T48">6 verbal derivational suffixes</span>, Sauer (<a href="__sauersyrjanischen1963__">1963</a>: 195–196) lists a total of 7, but one is excluded here because it is only attested with Komi‑Zyrian<span class="T86"> </span>stems. Sauer (<a href="__sauersyrjanischen1963__">1963</a>) does not give examples of hybrid formations, but explicitly states that these suffixes are added to native stems.</p><p class="P205"><span class="T28">‑aś‑ </span><span class="T2">‘reflexive verbs from nouns’</span></p><p class="P205"><span class="T28">‑e̬d‑</span><span class="T2"> ‘causative verbs from nouns’</span></p><p class="P205"><span class="T28">‑al‑ </span><span class="T2">‘intransitive verbs from nouns’</span></p><p class="P205"><span class="T28">‑śi̬‑ ~ ‑źi̬‑ ~ ‑t’śi̬‑ </span><span class="T2">‘reflexive, intransitive’ from nouns</span></p><p class="P205"><span class="T28">‑i̬ś‑ </span><span class="T2">‘reflexive, frequentive’ [for this form, the only example seems to be verb‑verb derivation with valency change, but I am assuming that it can have a verbalizing function, too.]</span></p><p class="P205"><span class="T28">‑ki̬‑ ~ ‑gi̬‑ </span><span class="T2">‘affective verbs’</span></p><p class="P215"> </p><p class="P10">Mägiste (<a href="__magistesuffixentlehnung1968__">1968</a>: 6), citing Sauer (<a href="__sauersyrjanischen1963__">1963</a>) also mentions that there are a total of seven nominal derivational suffixes, seven verbal derivational suffixes, and two nominal particles. Sauer (<a href="__sauernominalbildung1967__">1967</a>: 171–172, 182–188) discusses affixes from Russian, Samojedian, Wogulian, and Tartar, but these do not seem to have become productive.</p></td>	\N	137	117	Eurasia	high	0	14	15
67	2013-11-19 20:49:34.81546+01	2013-11-19 20:49:34.815464+01	t	\N	111	Swedish affixes in Finnish	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P17">Information and examples are from Mägiste (<a href="__magistesuffixentlehnung1968__">1968</a>: 7).</p><p class="P17"> </p><p class="P36">1 nominalizer</p><p class="P205"><span class="T28">‑ri</span><span class="T2"> ‘agent noun, occupation noun’, e.g. </span><span class="T28">pellkuri </span><span class="T2">‘coward’, </span><span class="T28">petturi</span><span class="T2"> ‘cheater’</span></p><p class="P215"> </p><p class="P36">2 feminine derivational affixes</p><p class="P205"><span class="T28">‑inna </span><span class="T42">‘female person’</span><span class="T28">, </span><span class="T2">e.g. </span><span class="T28">tohtorinna </span><span class="T2">‘female doctor’</span></p><p class="P205"><span class="T28">‑ska </span><span class="T42">‘female person’</span><span class="T2">, e.g. </span><span class="T28">seppäskä</span><span class="T2"> ‘tailor’s wife’</span></p><p class="P215"> </p><p class="P10">Various other affixes from Swedish are used in the slang of Helsinki, but their use is not clear.</p></td>	\N	16	32	Eurasia	high	0	2	3
68	2013-11-19 20:49:34.825452+01	2013-11-19 20:49:34.82546+01	t	\N	112	Yucuna and Cabiyarí affixes in Carapana, Tatuyo, Wáimaja, and Yurutí	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P17"><span class="T89">Information and examples are from Metzger </span><span class="T89">(<a href="__metzgermorpheme1998__">1998</a>)</span><span class="T89">. This form also exists in a number of other South American languages, but the borrowing scenario for the Eastern Tucanoan languages </span>Carapana, Tatuyo, Wáimaja, and Yurutí <span class="T89">is quite clear: no other Eastern Tucanoan languages have it, but it is old in Arawakan. Examples below are from </span>Carapana.</p><p class="P113"> </p><p class="P118">1 multifunctional prefix</p><p class="P225"><span class="T28">ka‑ </span><span class="T2">‘deictic specifier or marker of specificity’, e.g. </span><span class="T119">ka‑pak</span><span class="T30">ɨ</span><span class="T121"> ‘the/that father (the one referred to previously)’, e.g. </span><span class="T119">ka‑bero</span><span class="T121"> ‘after the/that time (the time referred to previously)’</span></p></td>	\N	112	148	South America	mid	1	0	1
69	2013-11-19 20:49:34.845759+01	2013-11-19 20:49:34.845765+01	t	\N	113	Latin affixes in Basque	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P17">Information and examples are from Segura Munguía and Etxebarria Ayesta (<a href="__seguramunguialatin1996__">1996</a>) and Hualde and Urbina (<a href="__hualdegrammar2003__">2003</a>). See also Haase (<a href="__haasesprachkontakt1992__">1992</a>: 48–51), who focuses on French and Gascon influence on the Basque variety of <span class="T69">lower Navarra</span>, and Mujika (<a href="__mujikalatina1982__">1982</a>).</p><p class="P17"> </p><p class="P36">2 diminutive suffixes</p><p class="P211"><span class="T28">‑ila, ‑ilo </span><span class="T2">‘diminutive’, e.g. </span><span class="T28">neskatila</span><span class="T2"> ‘little girl’ (from </span><span class="T28">neska</span><span class="T2"> ‘girl’), </span><span class="T28">leihatila</span><span class="T2"> ‘little window’ (from </span><span class="T28">leiho</span><span class="T2"> ‘window’), </span><span class="T28">andrakila</span><span class="T2"> ‘doll’ (from </span><span class="T28">andra</span><span class="T2"> ‘woman’), </span><span class="T28">astokilo</span><span class="T2"> ‘little donkey’ (from </span><span class="T28">asto</span><span class="T2"> ‘donkey’), </span><span class="T28">gizonilo</span><span class="T2"> ‘little man’ (from </span><span class="T28">gizon</span><span class="T2"> ‘man’) </span><span class="T2">(Hualde <a href="__hualdederivation2003__">2003a</a>: 331) (see also Haase <a href="__haasesprachkontakt1992__">1992</a>: 49;  Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 84, 89)</span></p><p class="P205"><span class="T28">‑(i)no, ‑(i)na, ‑(i)ño, ‑(i)ña, ‑ño </span><span class="T2">‘diminutive’, e.g. </span><span class="T37">emekiñio</span><span class="T7"> ‘very softly’ (from </span><span class="T37">emeki </span><span class="T7">‘softly’), </span><span class="T28">batño </span><span class="T2">‘a little one’ (from </span><span class="T28">bat</span><span class="T2"> ‘one’) </span><span class="T2">(Hualde <a href="__hualdederivation2003__">2003a</a>: 331;  Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 89)</span></p><p class="P54"> </p><p class="P36">2 augmentative suffixes</p><p class="P205"><span class="T28">‑nda </span><span class="T2">‘diminutive female’, e.g. </span><span class="T30">urdanda </span><span class="T2">~</span><span class="T30">urdanga </span><span class="T2">‘sow’ (from </span><span class="T30">urde </span><span class="T2">‘hog’), </span><span class="T30">oilanda </span><span class="T2">‘young hen’ (from </span><span class="T30">oilo </span><span class="T2">‘hen’) </span><span class="T2">(Trask <a href="__hualdenoun2003__">2003</a>: 117;  Hualde <a href="__hualdederivation2003__">2003a</a>: 331)</span></p><p class="P205"><span class="T37">‑ote</span><span class="T7"> ‘augmentative’, e.g. </span><span class="T37">lodikote</span><span class="T7"> ‘kind of fat’ (from </span><span class="T37">lodi</span><span class="T7"> ‘fat, thick’), </span><span class="T37">handikote</span><span class="T7"> ‘kind of big’ (from </span><span class="T37">handi</span><span class="T7"> ‘big’, cf. Sp </span><span class="T37">grandote</span><span class="T7">) </span><span class="T2">(Hualde <a href="__hualdederivation2003__">2003a</a>: 331)</span></p><p class="P17"> </p><p class="P36">7 human noun derivation (occupation, inhabitant) suffixes</p><p class="P197"><span class="T30">‑(l)ari, ‑kari, ‑tari ~ ‑lari </span><span class="T13">‘</span><span class="T2">occupation, names of meals’</span><span class="T30"> </span><span class="T13">(</span><span class="T2">from Latin </span><span class="T30">‑arius</span><span class="T13">), e.g.</span><span class="T30"> pelotari </span><span class="T2">‘ball player’ </span><span class="T13">(from </span><span class="T30">pelota </span><span class="T2">‘ball’)</span><span class="T13">, </span><span class="T30">bertsolari </span><span class="T2">‘verse singer’ </span><span class="T13">(from </span><span class="T30">bertso </span><span class="T2">‘poem’)</span><span class="T13">, </span><span class="T30">txistulari </span><span class="T2">‘flutist’ </span><span class="T13">(from </span><span class="T30">txistu </span><span class="T2">‘flute’)</span><span class="T13">, </span><span class="T30">haizkolari </span><span class="T2">‘lumberjack’ </span><span class="T13">(from </span><span class="T30">haizkora </span><span class="T2">‘ax’)</span><span class="T13">, </span><span class="T30">koblakari </span><span class="T2">‘bard’ </span><span class="T13">(from </span><span class="T30">kobla </span><span class="T2">‘song’)</span><span class="T13">, </span><span class="T30">mendikari </span><span class="T2">‘climber’ </span><span class="T13">(from </span><span class="T30">mendi </span><span class="T2">‘mountain’)</span><span class="T13">, </span><span class="T30">hizkuntzalari </span><span class="T2">‘linguist’ </span><span class="T13">(from </span><span class="T30">hizkuntw </span><span class="T2">‘language’</span><span class="T13">), </span><span class="T30">albokari </span><span class="T2">‘lateral’ </span><span class="T13">(from </span><span class="T30">albo </span><span class="T2">‘side’)</span><span class="T13">, </span><span class="T30">sudurkari </span><span class="T2">‘nasal’ </span><span class="T13">(from </span><span class="T30">sudur </span><span class="T2">‘nose’)</span><span class="T13">, </span><span class="T30">egunkari </span><span class="T2">‘newspaper’ </span><span class="T13">(from </span><span class="T30">egun </span><span class="T2">‘day’)</span><span class="T13">, </span><span class="T30">aldizkari </span><span class="T2">‘magazine’ </span><span class="T13">(from </span><span class="T30">aldiz </span><span class="T2">‘time’)</span><span class="T13">, </span><span class="T30">lehendakari </span><span class="T2">‘president’ </span><span class="T13">(from </span><span class="T30">lehen </span><span class="T2">‘first’)</span><span class="T13">, </span><span class="T30">agintari </span><span class="T2">‘authority’</span><span class="T30"> </span><span class="T13">(from </span><span class="T30">agin(du)</span><span class="T2"> ‘order’)</span><span class="T13">, </span><span class="T30">gosari </span><span class="T2">‘breakfast’</span><span class="T13"> (from </span><span class="T30">gose </span><span class="T2">‘hunger’)</span><span class="T13">, </span><span class="T30">bazkari </span><span class="T2">‘dinner’</span><span class="T30"> </span><span class="T13">(from </span><span class="T30">baratze </span><span class="T2">‘vegetable garden’)</span><span class="T13">, </span><span class="T30">afari </span><span class="T2">‘supper’</span><span class="T30"> </span><span class="T13">(from </span><span class="T30">*gauhari </span><span class="T2">= </span><span class="T30">gau </span><span class="T2">‘night’ +</span><span class="T30">‑ari</span><span class="T13">)</span><span class="T2"> </span><span class="T2">(Hualde <a href="__hualdederivation2003__">2003a</a>: 335) (see also Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 83)</span></p><p class="P211"><span class="T28">‑tar </span><span class="T2">‘inhabitant, occupatoin, and adjectives’, e.g. </span><span class="T30">ofiatiar </span><span class="T2">‘Ofiatian’ (from </span><span class="T30">Ofiati</span><span class="T13">)</span><span class="T2">, </span><span class="T30">gipuzkoar </span><span class="T2">‘Gipuzkoan’ (from </span><span class="T30">Gipuzkoa</span><span class="T13">)</span><span class="T2">, </span><span class="T30">arabar </span><span class="T2">‘Araban’ (from </span><span class="T30">Araba</span><span class="T13">)</span><span class="T2">, </span><span class="T30">espainiar </span><span class="T2">‘Spanish’ (from </span><span class="T30">Espainia</span><span class="T13">)</span><span class="T2">, </span><span class="T30">gernikar </span><span class="T2">‘Gernikan’ (from </span><span class="T30">Gernika</span><span class="T13">)</span><span class="T2">, </span><span class="T30">donostiar </span><span class="T2">‘Donostian’ (from </span><span class="T30">Donostia</span><span class="T13">)</span><span class="T2">, </span><span class="T30">ainhoar </span><span class="T2">‘Ainhoan’ (from </span><span class="T30">Ainhoa</span><span class="T13">)</span><span class="T2">, </span><span class="T30">saratar </span><span class="T2">‘Saran’ (from </span><span class="T30">Sara</span><span class="T13">)</span><span class="T2">, </span><span class="T30">erromatar </span><span class="T2">‘Roman’ (from </span><span class="T30">Erroma </span><span class="T2">‘Rome’</span><span class="T13">)</span><span class="T2">, </span><span class="T30">zuberotar </span><span class="T2">‘Zuberoan’ (from </span><span class="T30">Zubero‑a</span><span class="T13">)</span><span class="T2">, </span><span class="T30">baztandar </span><span class="T2">‘Baztanese’ (from </span><span class="T30">Baztan</span><span class="T13">)</span><span class="T2">, </span><span class="T30">irundar </span><span class="T2">‘Irunese’ (from </span><span class="T30">Irún</span><span class="T13">)</span><span class="T2">, </span><span class="T30">brasildar </span><span class="T2">‘Brazilian’ (from </span><span class="T30">Brasil</span><span class="T13">)</span><span class="T2">, </span><span class="T30">paristar </span><span class="T2">‘Parisian’ (from </span><span class="T30">Paris</span><span class="T13">)</span><span class="T2">, </span><span class="T30">kanpotar </span><span class="T2">‘outsider’ (from </span><span class="T30">kanpo </span><span class="T2">‘outside’</span><span class="T13">)</span><span class="T2">, </span><span class="T30">zerutar </span><span class="T2">‘heavenly’ (from </span><span class="T30">zeru </span><span class="T2">‘heaven’</span><span class="T13">)</span><span class="T2">, </span><span class="T30">baserritar </span><span class="T2">‘farmer’ (from </span><span class="T30">baserri </span><span class="T2">‘farm’</span><span class="T13">)</span><span class="T2">, </span><span class="T30">kaletar </span><span class="T2">‘town dweller’</span><span class="T30"> </span><span class="T2">(from </span><span class="T30">kale </span><span class="T2">‘street’). </span><span class="T2">(Hualde <a href="__hualdederivation2003__">2003a</a>: 339)</span></p><p class="P197"><span class="T38">‑es </span><span class="T8">‘ethnonym’, e.g. </span><span class="T38">frantses </span><span class="T7">‘French’, </span><span class="T38">ingeles </span><span class="T7">‘English’, </span><span class="T38">baiones </span><span class="T7">‘from Bayonne (Bayonne)’, </span><span class="T38">biames </span><span class="T7">‘Biarnais’ </span><span class="T2">(Hualde <a href="__hualdederivation2003__">2003a</a>: 340)</span></p><p class="P197"><span class="T28">‑duru </span><span class="T2">‘agent noun’, e.g. </span><span class="T28">hoberaduru</span><span class="T2"> ‘sinner’, </span><span class="T28">zorduru</span><span class="T2"> ‘debtor’</span><span class="T28">, harzedura</span><span class="T2"> ‘creditor’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 84)</span></p><p class="P197"><span class="T28">‑er(o), ‑ier </span><span class="T2">‘agent noun’, e.g. </span><span class="T28">gezurtero </span><span class="T2">‘liar’, </span><span class="T28">zurrutero </span><span class="T2">‘drinker’, </span><span class="T28">zakutero</span><span class="T2"> ‘(heavy) eater’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 86)</span></p><p class="P211"><span class="T28">‑(k)oi </span><span class="T2">‘agent noun’, e.g. </span><span class="T28">andrako</span><span class="T2"> ‘womanizer’, </span><span class="T28">berekoi</span><span class="T2"> ‘egoist’, </span><span class="T28">herrikoi </span><span class="T2">‘patriot’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 92–93)</span></p><p class="P197"><span class="T28">‑(e)sa, ‑(t)sa</span><span class="T2"> ‘female person’, e.g. </span><span class="T30">jainkosa </span><span class="T2">‘goddess’ (from </span><span class="T30">jainko </span><span class="T2">‘god’), </span><span class="T30">okintsa </span><span class="T2">‘female baker’ (regional, from </span><span class="T30">okin </span><span class="T2">‘baker’), </span><span class="T30">alarguntsa </span><span class="T2">‘widow’ (from</span><span class="T30"> alargun </span><span class="T2">‘widow’ and ‘widower’), </span><span class="T30">errientsa </span><span class="T2">‘female primary school teacher’ (from </span><span class="T30">errient </span><span class="T13">‘</span><span class="T2">male primary school teacher’) </span><span class="T2">(Trask <a href="__hualdenoun2003__">2003</a>: 117) (see also Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 95)</span></p><p class="P29"> </p><p class="P36">19 inanimate and abstract noun derivation suffixes, and/or adjectivizers</p><p class="P197"><span class="T30">‑eria </span><span class="T13">‘</span><span class="T2">collective’, e.g. </span><span class="T30">tresneria </span><span class="T2">‘set of tools’ (from </span><span class="T30">tresna </span><span class="T2">‘tool’), </span><span class="T30">gazteria </span><span class="T2">‘youth, group of youngsters’ (from </span><span class="T30">gazte </span><span class="T2">‘young’), </span><span class="T30">umeteria </span><span class="T2">‘group of children’ (from </span><span class="T30">ume </span><span class="T2">‘child’), </span><span class="T30">langileria </span><span class="T2">‘staff, group of workers’ (from </span><span class="T30">langile </span><span class="T2">‘worker’) </span><span class="T2">(Hualde <a href="__hualdederivation2003__">2003a</a>: 333)</span></p><p class="P197"><span class="T28">‑kada</span><span class="T2"> ‘blow with N’ or ‘heap of N’, e.g. </span><span class="T28">eskukada</span><span class="T2"> ‘blow with the hand, handful’ (from </span><span class="T28">esku</span><span class="T2"> ‘hand’), </span><span class="T28">harrikada</span><span class="T2"> ‘blow with a stone’ (from </span><span class="T28">harri</span><span class="T2"> ‘stone’), </span><span class="T28">ukabilkada</span><span class="T2"> ‘punch with the fist’ (from </span><span class="T28">ukabil</span><span class="T2"> ‘fist’), </span><span class="T28">ahokada</span><span class="T2"> ‘mouthful’ (from </span><span class="T28">aho</span><span class="T2"> ‘mouth’), </span><span class="T28">aurrerakada</span><span class="T2"> ‘step forward, progress’ (from </span><span class="T28">aurrera</span><span class="T2"> ‘onwards’), </span><span class="T28">karrokada</span><span class="T2"> ‘cartful’ (from </span><span class="T28">karro</span><span class="T2"> ‘cart’) </span><span class="T2">(Hualde <a href="__hualdederivation2003__">2003a</a>: 334) (see also Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 81)</span></p><p class="P211"><span class="T28">‑keria </span><span class="T2">‘negative quality’, e.g. </span><span class="T30">erokeria </span><span class="T2">‘foolishness’ </span><span class="T13">(from </span><span class="T30">ero </span><span class="T2">‘fool’)</span><span class="T13">, </span><span class="T30">zikinkeria </span><span class="T2">‘dirtiness’ </span><span class="T13">(from </span><span class="T30">zikin </span><span class="T2">‘dirty’)</span><span class="T13">, </span><span class="T30">garbikeria </span><span class="T2">‘purism’ </span><span class="T13">(from </span><span class="T30">garbi </span><span class="T2">‘clean’)</span><span class="T13">, </span><span class="T30">sorginkeria </span><span class="T2">‘witchcraft’ </span><span class="T13">(from </span><span class="T30">sorgin </span><span class="T2">‘witch’)</span><span class="T13">, </span><span class="T30">alukeria </span><span class="T2">‘stupidity’ </span><span class="T13">(from </span><span class="T30">alu </span><span class="T2">‘vulva, stupid’), also used to express an </span><span class="T7">action or the result of an action, e.g.</span><span class="T2"> </span><span class="T38">astokeria </span><span class="T94">‘assinine behavior’</span><span class="T38"> </span><span class="T7">(from </span><span class="T38">asto </span><span class="T7">‘donkey’) </span><span class="T2">(Hualde <a href="__hualdederivation2003__">2003a</a>: 340) (see also Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 85–86)</span></p><p class="P197"><span class="T38">‑gailu, ‑ailu, ‑kailu </span><span class="T7">‘instrument’, e.g. </span><span class="T30">sendagailu </span><span class="T2">‘remedy’ (from </span><span class="T30">senda(tu) </span><span class="T2">‘heal’), </span><span class="T30">zerrailu </span><span class="T2">‘lock’ (from </span><span class="T30">zerra(tu) </span><span class="T2">‘close’), </span><span class="T30">apaingailu </span><span class="T2">‘fixing, decoration’ (from </span><span class="T30">apain(du) </span><span class="T2">‘fix’), </span><span class="T30">edergailu </span><span class="T2">‘decoration’ (from </span><span class="T30">eder(tu) </span><span class="T2">‘beautify’), </span><span class="T30">berogailu </span><span class="T2">‘heater’ (from </span><span class="T30">bero(tu) </span><span class="T2">‘heat’), </span><span class="T30">hozkailu </span><span class="T2">‘refrigerator’ (from </span><span class="T30">hoz(tu) </span><span class="T2">‘make cold’) </span><span class="T2">(Hualde <a href="__hualdederivation2003__">2003a</a>: 341–342) (see also Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 80–81)</span></p><p class="P211"><span class="T28">‑era, ‑kera </span><span class="T7">‘manner’ (in nouns derived from verbs), ‘dimension’ (in nouns from adjectives), ‘name of languages and dialects’, e.g. </span><span class="T30">ibil(k)era </span><span class="T2">‘way of walking’ </span><span class="T13">(from </span><span class="T30">ibil(i) </span><span class="T2">‘walk’)</span><span class="T13">, </span><span class="T30">jarrera </span><span class="T2">‘position, attitude’ </span><span class="T13">(from </span><span class="T30">jarr(i) </span><span class="T2">‘put’)</span><span class="T13">, </span><span class="T30">hasiera </span><span class="T2">‘beginning’ </span><span class="T13">(from </span><span class="T30">has(i) </span><span class="T2">‘begin’)</span><span class="T13">, </span><span class="T30">zabalera </span><span class="T2">‘extension’ </span><span class="T13">(from </span><span class="T30">zabal </span><span class="T2">‘wide’)</span><span class="T13">, </span><span class="T30">lodiera </span><span class="T2">‘fatness’ </span><span class="T13">(from </span><span class="T30">lodi </span><span class="T2">‘fat’)</span><span class="T13">, </span><span class="T30">luzera </span><span class="T2">‘length’ </span><span class="T13">(from </span><span class="T30">luze </span><span class="T2">‘long’)</span><span class="T13">, </span><span class="T30">italiera </span><span class="T2">‘Italian language’ </span><span class="T13">(from </span><span class="T30">Italia </span><span class="T2">‘Italy’)</span><span class="T13">, </span><span class="T30">arabiera </span><span class="T2">‘Arabian language’ </span><span class="T13">(from </span><span class="T30">Arabia</span><span class="T45">)</span><span class="T13">, </span><span class="T30">bizkaiera </span><span class="T2">‘Biscayan dialect’ </span><span class="T13">(from </span><span class="T30">Bizkaia</span><span class="T45">)</span><span class="T13"> </span><span class="T2">(Hualde <a href="__hualdederivation2003__">2003a</a>: 342) (see also Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 84–85)</span><span class="T2">. Hualde and Urbina </span><span class="T2">(<a href="__hualdegrammar2003__">2003</a>)</span><span class="T7"> do not mention explicitly that this suffix would be borrowed, but </span><span class="T2">Segura Munguía and Etxebarria Ayesta</span><span class="T7"> </span><span class="T7">(<a href="__seguramunguialatin1996__">1996</a>: 84)</span><span class="T7"> do</span></p><p class="P197"><span class="T38">‑keta </span><span class="T8">‘</span><span class="T7">action or result’</span><span class="T38">, </span><span class="T8">e.g. </span><span class="T38">hedaketa </span><span class="T7">‘act of spreading’ (from </span><span class="T38">heda(tu) </span><span class="T7">‘spread’), </span><span class="T28">garbiketa </span><span class="T2">‘cleaning’ (from </span><span class="T28">garbi(tu) </span><span class="T2">‘clean’), </span><span class="T28">aldaketa </span><span class="T2">‘change’ (from </span><span class="T28">alda(tu) </span><span class="T2">‘change’), </span><span class="T28">erosketa </span><span class="T2">‘purchase, shopping’ (from </span><span class="T28">eros(i) </span><span class="T2">‘buy’), </span><span class="T28">salketa </span><span class="T2">‘sale’ (from </span><span class="T28">sal(du) </span><span class="T2">‘sale’), </span><span class="T28">sorketa </span><span class="T2">‘creativity, creation’ (from </span><span class="T28">sor(tu) </span><span class="T2">‘create’), </span><span class="T28">salaketa </span><span class="T2">‘denunciation’ (from </span><span class="T28">sala(tu) </span><span class="T2">‘denounce’) </span><span class="T2">(Hualde <a href="__hualdederivation2003__">2003a</a>: 342–343) (see also Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 87)</span></p><p class="P197"><span class="T38">‑dura </span><span class="T8">‘</span><span class="T7">action or result’</span><span class="T8">, e.g.</span><span class="T38"> hedadura </span><span class="T7">‘extension, space that is covered’ (from </span><span class="T38">heda(tu) </span><span class="T7">‘spread’), </span><span class="T28">luzadura </span><span class="T2">‘lengthening’ (from </span><span class="T28">luza(tu) </span><span class="T2">‘lengthen’), </span><span class="T28">erredura </span><span class="T2">‘burn’ (from </span><span class="T28">erre </span><span class="T2">‘burn’), </span><span class="T28">kutsadura </span><span class="T2">‘pollution’ (from </span><span class="T28">kutsa(tu) </span><span class="T2">‘pollute’), </span><span class="T28">ebakidura </span><span class="T2">‘cut’ (from </span><span class="T28">ebaki </span><span class="T2">‘cut’) </span><span class="T2">(Hualde <a href="__hualdederivation2003__">2003a</a>: 342–343) (see also Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 97–98)</span></p><p class="P197"><span class="T38">‑zio, </span><span class="T28">‑(k)izun</span><span class="T38"> </span><span class="T8">‘</span><span class="T7">action or result’</span><span class="T8">, e.g.</span><span class="T38"> </span><span class="T28">barkazio </span><span class="T2">‘pardon’ (from </span><span class="T28">barka(tu) </span><span class="T2">‘forgive’) </span><span class="T2">(Hualde <a href="__hualdederivation2003__">2003a</a>: 342–343)</span><span class="T2">, </span><span class="T28">barkakizun</span><span class="T2"> ‘pardon’, </span><span class="T28">erraizun</span><span class="T2"> ‘(empty) talk’, </span><span class="T28">ikhuskizun </span><span class="T2">‘things to see’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 90–91, 98)</span></p><p class="P211"><span class="T28">‑aje, ‑aia, ‑aie </span><span class="T2">‘abstract noun’, e.g. </span><span class="T28">lumaje</span><span class="T2"> ‘plumage’, </span><span class="T28">narruaje</span><span class="T2"> ‘skin’, </span><span class="T28">zuraje</span><span class="T2"> ‘woodwork’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 81–82)</span></p><p class="P211"><span class="T28">‑antza, -antzia, -entzia </span><span class="T2">‘abstract noun’, e.g. </span><span class="T28">ustanza</span><span class="T2"> ‘confidence’, </span><span class="T28">gorantza</span><span class="T2"> ‘praise’, </span><span class="T28">durkentza</span><span class="T2"> ‘meeting’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 81–82)</span></p><p class="P211"><span class="T28">‑duria </span><span class="T2">‘abstract noun’, e.g. </span><span class="T28">jakinduria</span><span class="T2"> ‘wisdom’, </span><span class="T28">apainduria</span><span class="T2"> ‘decoration’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 84)</span></p><p class="P211"><span class="T28">‑eta </span><span class="T2">‘grove’, e.g. </span><span class="T28">lizarreta</span><span class="T2"> ‘ash tree grove’, </span><span class="T28">inxaurreta</span><span class="T2"> ‘walnut tree grove’, </span><span class="T28">aritzeta</span><span class="T2"> ‘oak tree grove’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 87–88)</span></p><p class="P211"><span class="T28">‑gura</span><span class="T2"> ‘abstract noun’, e.g. </span><span class="T28">logura</span><span class="T2"> ‘sleepiness’, </span><span class="T28">barregura</span><span class="T2"> ‘desire to laugh’, </span><span class="T28">zelanguare </span><span class="T2">‘however’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 88)</span></p><p class="P211"><span class="T28">‑(g/k)unde, ‑undia, ‑kune</span><span class="T2"> ‘abstract noun: action, ability, social group’, e.g. </span><span class="T28">beharkunde</span><span class="T2"> ‘necessity’, </span><span class="T28">gizonkunde</span><span class="T2"> ‘males’, </span><span class="T28">apezkunde </span><span class="T2">‘priests’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 91)</span></p><p class="P211"><span class="T28">‑pen, -men(du/tu/ta) </span><span class="T2">‘abstract noun’, e.g. </span><span class="T28">luzamen</span><span class="T2"> ‘enlargement’, </span><span class="T28">aitomen</span><span class="T2"> ‘confession’, </span><span class="T28">pairmen </span><span class="T2">‘suffering’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 92)</span></p><p class="P211"><span class="T28">‑ta(de/te), ‑da(te/de/re) </span><span class="T2">‘abstract noun’, e.g. </span><span class="T28">bakartade</span><span class="T2"> ‘solitude’, </span><span class="T28">egitade</span><span class="T2"> ‘action’, </span><span class="T28">hondare </span><span class="T2">‘heritage’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 96)</span></p><p class="P211"><span class="T28">‑(t)za, ‑(e)zia </span><span class="T2">‘abstract noun’, e.g. </span><span class="T28">zuhurtzia</span><span class="T2"> ‘prudence’, </span><span class="T28">emaitza</span><span class="T2"> ‘result, production’, </span><span class="T28">agintza </span><span class="T2">‘promise’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 97)</span></p><p class="P211"><span class="T28">‑os(o), ‑ts(u/a), ‑z(u/a) </span><span class="T2">‘abstract noun or adjective’, e.g. </span><span class="T28">menditsu</span><span class="T2"> ‘mountainous’, </span><span class="T28">elortza</span><span class="T2"> ‘thorny’, </span><span class="T28">harritza </span><span class="T2">‘stone desert’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 94)</span></p><p class="P211"><span class="T28">‑tu, ‑du </span><span class="T2">‘adjectivizer’, e.g. </span><span class="T28">zigortu</span><span class="T2"> ‘punished’, </span><span class="T28">ihartu</span><span class="T2"> ‘dry’, </span><span class="T28">bazkaldu </span><span class="T2">‘eaten’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 96)</span></p><p class="P29"> </p><p class="P36">5 derivational prefixes</p><p class="P211"><span class="T28">des‑</span><span class="T2"> ‘privative’, e.g. </span><span class="T30">desegin </span><span class="T2">‘undo’ (from </span><span class="T30">egin </span><span class="T2">‘do, make’), </span><span class="T30">deslotu </span><span class="T2">‘untie’ (from </span><span class="T30">lotu </span><span class="T2">‘tie’), </span><span class="T30">desberdin </span><span class="T2">‘unequal, different’ (from </span><span class="T30">berdin </span><span class="T2">‘same, equal’), </span><span class="T30">desegoki </span><span class="T2">‘inappropriate’ (from </span><span class="T30">egoki </span><span class="T2">‘appropriate’), </span><span class="T30">desadostasun </span><span class="T2">‘lack of agreement’ (from </span><span class="T30">adostasun </span><span class="T2">‘agreement’) </span><span class="T2">(Hualde <a href="__hualdederivation2003__">2003a</a>: 349) (see also Hualde <a href="__hualdesegmental2003__">2003b</a>: 42;  Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 99–100)</span></p><p class="P211"><span class="T28">erre‑, arra‑ </span><span class="T2">‘repeated’</span><span class="T42">,</span><span class="T28"> </span><span class="T2">e.g. </span><span class="T28">arraseme </span><span class="T2">‘grandson’, </span><span class="T28">arraeraiki </span><span class="T2">‘lift up again’, </span><span class="T28">arraberritu </span><span class="T2">‘renovate’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 99) (see also Haase <a href="__haasesprachkontakt1992__">1992</a>: 50–51)</span></p><p class="P211"><span class="T28">kontra‑ </span><span class="T2">‘contra’</span><span class="T42">,</span><span class="T28"> </span><span class="T2">e.g. </span><span class="T28">kontraurre </span><span class="T2">‘stern’, </span><span class="T28">kontraease </span><span class="T2">‘contradiction’, </span><span class="T28">kontrajarri </span><span class="T2">‘put against’ </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 100)</span></p><p class="P211"><span class="T28">anti‑ </span><span class="T2">‘against’</span><span class="T42">,</span><span class="T28"> </span><span class="T2">e.g. </span><span class="T28">anitherritar </span><span class="T2">‘unpopular’ (only one example with a native stem) </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 100–101)</span></p><p class="P195"><span class="T28">super‑ </span><span class="T2">‘super’</span><span class="T42">,</span><span class="T28"> </span><span class="T2">e.g. </span><span class="T28">supermutil </span><span class="T2">‘big boy’, </span><span class="T28">superneska</span><span class="T2"> ‘impressive girl’ (only two example with a native stem) </span><span class="T2">(Segura Munguía and Etxebarria Ayesta <a href="__seguramunguialatin1996__">1996</a>: 100–101)</span></p></td>	\N	121	43	Eurasia	high	0	35	35
70	2013-11-19 20:49:34.858194+01	2013-11-19 20:49:34.858202+01	t	\N	114	Moroccan Berber affixes in Moroccan Arabic	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P17">Information and examples are from Zellou (<a href="__zelloumoroccan2011__">2011</a>).</p><p class="P17"> </p><p class="P36">1 derivational circumfix/pattern</p><p class="P205"><span class="T28">ta‑...‑t</span><span class="T2"> ‘abstract noun’, e.g. </span><span class="T28">takotbiyət</span><span class="T2"> ‘profession/art of bookseller’ (from </span><span class="T28">kotbi</span><span class="T2"> ‘bookseller’), </span><span class="T28">takəddabət</span><span class="T2"> ‘habitual liar’ (from </span><span class="T28">kəddab </span><span class="T2">‘liar’), </span><span class="T28">tabənnayət</span><span class="T2"> ‘profession of masonry’ (from </span><span class="T28">bənnay</span><span class="T2"> ‘mason’)</span></p><p class="P17"> </p><p class="P10">Zellou (<a href="__zelloumoroccan2011__">2011</a>) argues that “The pattern that can be inferred for the MA circumfix is one where MA lexical items are diffused into Berber, the most common language contact scenario, then these stems are inflected to match the inflectional patterns of Berber, including noun state /a‑/ and feminine gender /t‑...‑t/. Finally, these nouns with Berber inflectional morphology are incorporated back into MA with the inflectional morphology components reanalyzed as a single derivational morpheme.” </p></td>	\N	152	38	Africa	high	0	0	1
72	2013-11-19 20:49:34.897194+01	2013-11-19 20:49:34.897204+01	t	\N	117	Aymara affixes in Quechua de Puno	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Adelaar (<a href="__adelaaraymarismos1987__">1987</a>) (see also Adelaar <a href="__wurmquechua1996__">1996</a>: 1328).</p><p class="P10"> </p><p class="P10"><span class="T48">1 polyfunctional derivational suffix </span>that attaches to finite verbs, subordinate and nominalized verbs, adjectives, temporal expressions and other adverbial expressions</p><p class="P195"><span class="T28">‑pacha </span><span class="T2">(no meaning or examples given). This is probably the same “totality‑marker” that Uru borrowed from Aymara </span><span class="T2">(Hannß <a href="__hannsuchumataqu2008__">2008</a>: 9)</span><span class="T6">, according to </span><span class="T2">Adelaar </span><span class="T2">(<a href="__adelaaraymarismos1987__">1987</a>: 225)</span><span class="T2"> it is extremely frequent.</span></p><p class="P212"> </p><p class="P10"><span class="T48">8 verbal derivational suffixes</span> that occur with certain frequency and are treated together by Adelaar (<a href="__adelaaraymarismos1987__">1987</a>), implying that they form a derivational system. Note also that they are also semantically related, expressing movement and direction.</p><p class="P197"><span class="T31">‑ra‑ </span><span class="T2">‘repeated action’, ‘singular repetition’, or ‘undoing an action’, e.g. </span><span class="T31">wañurachin </span><span class="T14">‘he killed [them] one by one’, </span><span class="T31">chayaranku </span><span class="T14">‘they arrive one by one’. </span><span class="T6">According to </span><span class="T2">Adelaar </span><span class="T2">(<a href="__adelaaraymarismos1987__">1987</a>: 225)</span><span class="T2">, i</span><span class="T14">n some cases, the suffix </span><span class="T31">‑ra‑ </span><span class="T2">forms part of complex Aymara loanwords, implying that in most, it is used with Quechua stems</span></p><p class="P197"><span class="T31">‑naqa‑ </span><span class="T14">‘diffuse, action, without goal’</span><span class="T2">, e.g. </span><span class="T31">purinaqa‑ </span><span class="T2">‘go about, behave’ (from </span><span class="T31">puri‑ </span><span class="T2">‘go, walk’)</span></p><p class="P197"><span class="T31">‑tata‑ </span><span class="T14">‘</span><span class="T2">extension or dispersion in various directions’, e.g.</span><span class="T31"> hump’itatachi </span><span class="T14">‘It makes sweat’</span></p><p class="P197"><span class="T31">‑thapi‑ </span><span class="T14">(opposite of </span><span class="T31">‑tata‑</span><span class="T14">) ‘</span><span class="T2">concentration, reunion’, e.g. </span><span class="T31">mikhuthapi‑ </span><span class="T2">‘eat by gathering what is around’ (from </span><span class="T31">mikhu‑ </span><span class="T2">‘eat’)</span></p><p class="P197"><span class="T31">‑qa‑ </span><span class="T2">‘downwards movement’ (part of a system of directionals in Aymara), e.g. </span><span class="T31">ituqa‑ </span><span class="T2">‘take a pot from the stove’ (from </span><span class="T31">itu‑ </span><span class="T2">‘carry (a pot) with both hands’)</span></p><p class="P197"><span class="T31">‑t’a‑ </span><span class="T14">‘single, short </span><span class="T2">action’, e.g. </span><span class="T31">q’epiyt’aku‑ </span><span class="T14">‘carry briefly’</span><span class="T31"> </span><span class="T14">(from</span><span class="T31"> q’epi‑ </span><span class="T2">‘carry’)</span></p><p class="P197"><span class="T31">‑kata‑ </span><span class="T14">‘crossing an empty space</span><span class="T2">’, e.g. </span><span class="T31">q’epikatarqon </span><span class="T14">‘he carried [him across the lake]’</span></p><p class="P197"><span class="T31">‑kipa‑ </span><span class="T14">‘</span><span class="T2">change of direction’, e.g. </span><span class="T31">q’epikiparqollantaq </span><span class="T14">‘he carried [him running around the cacti]’</span></p><p class="P17"> </p><p class="P10">Adelaar (<a href="__adelaaraymarismos1987__">1987</a>: 230) notes that no native suffix has been displaced by borrowed affixes, i.e. these borrowed affixes seem to be gap‑filling.</p></td>	\N	100	122	South America	high	0	8	9
73	2013-11-19 20:49:34.922846+01	2013-11-19 20:49:34.922855+01	t	\N	118	Santa affixes in Chinese of Línxìa/Hézōu	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P296">Information and examples are mainly from Li (<a href="__liverbmedial1984__">1984</a>). Hézōu (Dwyer <a href="__dwyeraltaic1992__">1992</a>) is the older name for the city and province (Dwyer <a href="__dwyeraltaic1992__">1992</a>: 161;  Lee‑Smith <a href="__wurmhezhou1996__">1996a</a>: 366). There seem to be two ethnic groups living there, speaking different dialects<span class="T69">, the </span>Hàn and the Huí, who are Muslims (Li <a href="__liverbmedial1984__">1984</a>: 320).</p><p class="P296"> </p><p class="P296"><span class="T48">1 case marker</span> (out of a total of 4 case markers in <span class="T69">Chinese spoken in Línxìa/</span>Hézōu)</p><p class="P299"><span class="T28">‑lɑ</span> ‘comitative case’, e.g.<span class="T28"> ɑmɑ‑lɑ </span>‘with mother’, <span class="T28">tɑmən‑lɑ</span> ‘with them’ (examples from Li <a href="__liverbmedial1984__">1984</a>: 314). Note that Li (<a href="__liverbmedial1984__">1984</a>: 312–315) clearly states that the four case markers are suffixes, and they are written with a hyphen, e.g. <span class="T28">‑la</span>, even though they are called “postposition” in Dwyer’s (<a href="__dwyeraltaic1992__">1992</a>) description. The comitative case suffix is used primarily by Hàn people in <span class="T69">Línxìa, according to Dwyer </span>(<a href="__dwyeraltaic1992__">1992</a>: 169), and borrowed from <span class="T69">Monguor, Santa, and/or Easter Yugur (Mongolic) according to</span> Dwyer (<a href="__dwyeraltaic1992__">1992</a>). Li (<a href="__liverbmedial1984__">1984</a>: 314) describes “comitative case suffix /lɑ/”, identifying it with a corresponding Santa (Mongolic) form, although he hypothesizes, based on ethnographic facts, that Mongolic influence on <span class="T69">Línxìa</span><span class="T87">/</span>Hézōu is substratum influence, not borrowing. Lee‑Smith (<a href="__wurmhezhou1996__">1996</a>: 868) gives a Turkic etymology for this marker.</p><p class="P296"> </p><p class="P302"><span class="T2">Lee‑Smith </span><span class="T2">(<a href="__wurmhezhou1996__">1996</a>: 868)</span><span class="T2"> also gives a Turkic etymology for the object marker </span><span class="T28">xa </span><span class="T2">and a mixed Turkic/Tibetan etymology for the case marker glossed as “to/until”. I follow</span><span class="T6"> Dwyer’s and </span><span class="T2">(1992)</span><span class="T2"> Li’s </span><span class="T2">(<a href="__liverbmedial1984__">1984</a>)</span><span class="T2"> analysis, which is based on much more careful argumentation, and not addressed by Lee‑Smith </span><span class="T2">(<a href="__wurmhezhou1996__">1996</a>)</span><span class="T2">. Note also that according to Slater </span><span class="T2">(<a href="__slatergrammar2003__">2003</a>: 329)</span><span class="T2"> it often “becomes impossible to trace the precise historical path of any given linguistic feature [in </span><span class="T13">China’s Qinghai‑Gansu Sprachbund</span><span class="T2">]”.</span></p></td>	\N	146	24	Eurasia	mid	1	0	1
74	2013-11-19 20:49:34.937658+01	2013-11-19 20:49:34.937669+01	t	\N	119	Turkish affixes in Judeo‑Spanish	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P2"><span class="T2">Information and examples are from Varol‑Bornes </span><span class="T2">(<a href="__varolbornesjudeoespagnol2008__">2008</a>)</span><span class="T2">. All prefixes are Spanish (except possibly </span><span class="T28">m‑</span><span class="T2"> as part of a phenomenon called </span><span class="T28">mühmele</span><span class="T2">, e.g. </span><span class="T28">Kapará por ti Mapará por ti</span><span class="T2">.)</span></p><p class="P10"> </p><p class="P33">4 nominal suffixes, nominalizers and noun-noun formation with overlaps</p><p class="P195"><span class="T28">‑oğlu </span><span class="T2">‘son of’ (noun-noun derivation only), e.g. </span><span class="T28">mamzeroğlu </span><span class="T2">‘son of a bastard’ (stem originally from Hebrew)</span></p><p class="P195"><span class="T28">‑cik ~ ‑çik </span><span class="T2">(</span><span class="T28">‑cuk ~ ‑çuk) </span><span class="T2">‘hypocoristic diminutive’ (noun-noun derivation and adjectivizer), no examples of hybrids given</span></p><p class="P195"><span class="T28">‑ané ~ ‑aná</span><span class="T2"> ‘house of, place for’ (noun-noun derivation and nominalizer) (originally Persian, no clear examples of hybrids given)</span></p><p class="P195"><span class="T28">‑lik </span><span class="T2">‘nominalizer for adjectives and others’ (only nominalizer), e.g. </span><span class="T28">semanalik </span><span class="T2">‘money for one week’</span></p><p class="P212"> </p><p class="P33">2 privative‑possessive adjectivizers</p><p class="P195"><span class="T28">‑li ~ ‑liya ~ ‑lü ~ -lüya</span><span class="T2"> ‘having x’, used on Turkish loans, but also Hebrew loans, and Greek loans, e.g. </span><span class="T28">azlahari </span><span class="T2">‘making rich’ (stem from Hebrew)</span></p><p class="P195"><span class="T28">‑siz, ‑siza, ‑suz, ‑suza</span><span class="T2"> ‘privative’, often used in spontaneous creations, e.g. </span><span class="T28">azlahasiz </span><span class="T2">‘unfavorable’ (stem from Hebrew)</span></p><p class="P10"> </p><p class="P2"><span class="T2">A further, uncertain case is </span><span class="T28">‑tear</span><span class="T2"> ‘causative’, which has at least some influence of Spanish, but maybe some Turkish, too.</span></p></td>	\N	95	81	Eurasia	high	0	6	6
75	2013-11-19 20:49:34.964306+01	2013-11-19 20:49:34.964309+01	t	\N	124	Russian affixes in Karelien	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Alvre (<a href="__alvrerussische2002__">2002</a>) (see also Raun <a href="__raunkarelian1964__">1964</a>;  Laanest <a href="__laanesteinfuhrung1982__">1982</a>), which is, however, specifically about indefinite‑marking elements, and there is no information whether any other affix was borrowed. The following set of borrowed forms refers to the Karelian Tikhvin variety, similar but in different ways overlapping sets were borrowed in the closely related Karelian Tver variety, Karelian Valdai variety, Livvi‑Karelian (Olonets Karelian), Veps, Wotic, and Ludic. All suffixes are used to form indefinite pronouns and adverbs.</p><p class="P10"> </p><p class="P33">6 indefinite‑marking suffixes</p><p class="P195"><span class="T28">‑bį ~ ‑bi̬ </span><span class="T42">‘</span><span class="T2">indefinite’, e.g. </span><span class="T28">kenen bį </span><span class="T2">‘whoever’, </span><span class="T28">ku·ibi̬</span><span class="T2"> ‘in whatever way’</span></p><p class="P195"><span class="T28">‑bui(ť) ~ ‑buit’en(a</span><span class="T2">) </span><span class="T42">‘</span><span class="T2">indefinite’, e.g. </span><span class="T28">miľľä</span><span class="T123">‿</span><span class="T28">bui ripakolla</span><span class="T2"> ‘with any kind of cloth’, </span><span class="T28">miśśä</span><span class="T123">‿</span><span class="T28">buitėḛ</span><span class="T2"> ‘anywhere’, </span><span class="T28">miťüš</span><span class="T123">‿</span><span class="T28">buiť</span><span class="T2"> ‘anyone’</span></p><p class="P195"><span class="T28">‑i</span><span class="T2"> </span><span class="T42">‘</span><span class="T2">indefinite’, e.g. </span><span class="T28">keľľä</span><span class="T123">‿</span><span class="T28">i jōlu</span><span class="T2"> ‘nobody has’, </span><span class="T28">i ruadua ei miäii̯</span><span class="T2"> ‘and there is no work whatsoever’</span></p><p class="P195"><span class="T28">‑ńi ~ ‑ni </span><span class="T42">‘</span><span class="T2">indefinite’</span><span class="T28">, </span><span class="T2">e.g. </span><span class="T28">ruvetti͔ḭ valamaa̰ reŋgilöiľľa da ken miľľä</span><span class="T123">‿</span><span class="T28">ńi</span><span class="T2"> ‘they began to pour with buckets or anyone with anything’, </span><span class="T28">možot muissat, miśśä ńi näit</span><span class="T2"> ‘maybe you can remember having seen it somewhere?’</span></p><p class="P195"><span class="T28">‑ńibuť ~ ‑ńibit </span><span class="T42">‘</span><span class="T2">indefinite’, e.g. </span><span class="T115">on ken</span><span class="T116">‿</span><span class="T115">ńibuť üökšun</span><span class="T28"> </span><span class="T2">‘somebody was wrong’</span></p><p class="P195"><span class="T28">‑to </span><span class="T42">‘</span><span class="T2">indefinite’, e.g.</span><span class="T28"> miďä to šano</span><span class="T2"> ‘he/she said something’, </span><span class="T28">poiga šinä miśśä</span><span class="T123">‿</span><span class="T28">to meiľä on</span><span class="T2"> ‘the boy is there somewhere with us’, </span><span class="T28">kuin</span><span class="T123">‿</span><span class="T28">to</span><span class="T2"> ‘in any way’</span></p></td>	\N	99	102	Eurasia	mid	1	6	6
76	2013-11-19 20:49:34.975837+01	2013-11-19 20:49:34.975845+01	t	\N	125	Eastern Tucanoan affixes in Tariana	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Aikhenvald (<a href="__aikhenvaldinvisible2012__">2012</a>: 175–177). The following three forms are used consistently by speakers of all generations, a few more by younger speakers or inconsistently.</p><p class="P10"> </p><p class="P33">1 conditional‑potential enclitic</p><p class="P6"><span class="T28">=bohta</span><span class="T2">, e.g. </span><span class="T95">kwe-bohtI</span><span class="T90"> </span><span class="T95">waha‑pu‑bohta</span><span class="T90"> (how-</span><span class="T65">conditional/</span><span class="T66">1pl</span><span class="T90">‑</span><span class="T65">augmentative‑conditional</span><span class="T90">) ‘how could we...’, </span><span class="T95">hanipa‑bohta kasitana</span><span class="T90"> (big+</span><span class="T65">classifier.closed_space‑conditional/</span><span class="T90">be_fed_up) ‘It would be really annoying’ </span><span class="T90">(Aikhenvald <a href="__aikhenvaldtariana1999__">1999</a>: 104–105) (see also Aikhenvald <a href="__aikhenvaldgrammar2003__">2003</a>: 390–393)</span></p><p class="P52"> </p><p class="P33">2 manner enclitics</p><p class="P195"><span class="T28">=pisi </span><span class="T2">‘stretch’, no examples of hybrid formations are given by Aikhenvald </span><span class="T2">(<a href="__aikhenvaldinvisible2012__">2012</a>: 175–177)</span><span class="T2"> or Aikhenvald </span><span class="T2">(<a href="__aikhenvaldtariana1999__">1999</a>)</span><span class="T2">, but since lexical borrowing is very limited, it is safe to assume that there are many.</span></p><p class="P195"><span class="T28">=miña</span><span class="T2"> ‘light’, used only with the verb ‘see’, e.g. </span><span class="T28">di‑ka=miña</span><span class="T2"> (</span><span class="T61">3sg.non_feminine</span><span class="T2">‑see=light) ‘(close one’s eyes) and see little lights and stars’ </span><span class="T2">(Aikhenvald <a href="__aikhenvaldinvisible2012__">2012</a>: 176)</span></p></td>	\N	58	138	North America	high	0	2	3
77	2013-11-19 20:49:34.988334+01	2013-11-19 20:49:34.988343+01	t	\N	126	Greek affixes in Kalderash Romani	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P11">Information and examples are from Boretzky (<a href="__boretzkyromani1994__">1994</a>) and Boretzky and Igla (<a href="__boretzkymorphologische1991__">1991</a>). Kalderash Romani has also borrowed affixes from Romanian and from various Slavic languages.</p><p class="P52"> </p><p class="P33">2 nominalizers (originally singular‑plural)</p><p class="P195"><span class="T28">‑imos </span><span class="T2">‘nominalizer’, e.g. </span><span class="T28">barvalimos </span><span class="T2">‘richness’</span></p><p class="P195"><span class="T28">‑imata </span><span class="T2">‘nominalizer’, e.g. </span><span class="T28">marimata </span><span class="T2">‘brawl’ </span><span class="T2">(Boretzky and Igla <a href="__boretzkymorphologische1991__">1991</a>: 16)</span></p><p class="P212"> </p><p class="P33">3 non-interrelated suffixes</p><p class="P195"><span class="T28">‑to </span><span class="T2">‘ordinal number formation’, e.g. </span><span class="T28">štár‑to</span><span class="T2"> ‘the fourth’ </span><span class="T2">(Boretzky <a href="__boretzkyromani1994__">1994</a>: 93)</span></p><p class="P195"><span class="T28">‑icko, ‑icka </span><span class="T2">‘adjectivizer for languages and places’, e.g. </span><span class="T28">lovaricka </span><span class="T2">‘in Lovari’, </span><span class="T28">sogodicko </span><span class="T2">‘in [various] languages’ </span><span class="T2">(Boretzky and Igla <a href="__boretzkymorphologische1991__">1991</a>: 12)</span></p><p class="P195"><span class="T28">‑icî </span><span class="T2">‘diminutive’, e.g. </span><span class="T28">kotoricí </span><span class="T2">‘little piece’ </span><span class="T2">(Boretzky and Igla <a href="__boretzkymorphologische1991__">1991</a>: 12)</span></p></td>	\N	13	62	Eurasia	high	0	2	5
78	2013-11-19 20:49:35.008954+01	2013-11-19 20:49:35.008959+01	t	\N	127	Spanish affixes in Cho’ol	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P2"><span class="T2">Information from Dürr </span><span class="T2">(<a href="__durreinfuhrung2012__">2012</a>)</span><span class="T2">, Dürr (personal communication, 2012) and Vázquez Álvarez </span><span class="T2">(<a href="__vasquezalvarezgrammar2011__">2011</a>)</span><span class="T2">. The three adverbial particles borrowed are from a closed class of forms that have a fixed position before the verb stem and after the argument proclitics </span><span class="T90">(Dürr <a href="__durreinfuhrung2012__">2012</a>: 38, 92;  Vásquez Álvarez <a href="__vasquezalvarezgrammar2011__">2011</a>: 138–145)</span><span class="T2">. In the closely related Chontal there are similar forms, e.g. </span><span class="T28">malah</span><span class="T2"> ‘badly’ </span><span class="T2">(Knowles <a href="__knowlesdescriptive1984__">1984</a>: 223–228)</span><span class="T2">.</span></p><p class="P303"> </p><p class="P304">3 bound adverbial particles</p><p class="P305"><span class="T28">‑mero</span><span class="T2"> ‘a little’, e.g. </span><span class="T28">i‑mero‑ña’ty‑añ‑ø</span><span class="T24"> (</span><span class="T63">3.ergative</span><span class="T24">‑little‑know‑</span><span class="T63">transitive</span><span class="T24">‑</span><span class="T63">3.absolutive</span><span class="T24">) ‘He knew a little something (e.g. has a power)’ </span><span class="T2">(Vásquez Álvarez <a href="__vasquezalvarezgrammar2011__">2011</a>: 437)</span><span class="T24">, </span><span class="T28">i‑mero‑jajm‑el</span><span class="T24"> (</span><span class="T63">3.ergative</span><span class="T24">‑little‑clear‑</span><span class="T63">nonfinite</span><span class="T24">) ‘It is a little clear’ </span><span class="T2">(Vásquez Álvarez <a href="__vasquezalvarezgrammar2011__">2011</a>: 492)</span><span class="T24">, </span><span class="T28">a‑mero‑tsep‑ø</span><span class="T24"> (</span><span class="T63">2.ergative</span><span class="T24">‑little‑cut‑</span><span class="T63">3.absolutive</span><span class="T24">) ‘You will cut’ </span><span class="T2">(Vásquez Álvarez <a href="__vasquezalvarezgrammar2011__">2011</a>: 211)</span></p><p class="P195"><span class="T28">‑weñ</span><span class="T2"> ‘a lot’, e.g. </span><span class="T95">k‑weñ‑bä’ñ‑añ‑ø</span><span class="T90"> (</span><span class="T66">1.ergative</span><span class="T90">‑much‑get.scared‑</span><span class="T66">transitive</span><span class="T90">‑</span><span class="T66">3.absolutive</span><span class="T90">) ‘It scared me a lot’ </span><span class="T90">(Vásquez Álvarez <a href="__vasquezalvarezgrammar2011__">2011</a>: 211)</span></p><p class="P195"><span class="T2">‑</span><span class="T97">komoñ</span><span class="T90"> ‘together’, e.g. </span><span class="T95">la=j‑</span><span class="T97">komoñ</span><span class="T95">‑mel‑ø</span><span class="T90"> (</span><span class="T65">pl</span><span class="T90">.</span><span class="T65">inclusive</span><span class="T90">=</span><span class="T66">1.ergative</span><span class="T90">‑together‑do‑</span><span class="T66">3.absolutive</span><span class="T90">) ‘We make it together’ </span><span class="T90">(Vásquez Álvarez <a href="__vasquezalvarezgrammar2011__">2011</a>: 139)</span></p></td>	\N	136	156	North America	high	0	3	3
79	2013-11-19 20:49:35.01995+01	2013-11-19 20:49:35.019953+01	t	\N	128	Zoquean affixes in Cho’ol	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P17"><span class="T69">Information and examples are from </span>Vásquez Álvarez<span class="T69"> </span>(<a href="__vasquezalvarezgrammar2011__">2011</a>: 11), who cites Martínez Cruz (<a href="__martinezcruzadjetivos2007__">2007</a>) and Zavala Maldonado (<a href="__zavalaoraciones2007__">2007</a>). Evidence for borrowing includes that cognate forms are absent in the Tseltalan languages related to Chol.</p><p class="P17"> </p><p class="P36">1 relative marker</p><p class="P197"><span class="T118">=bä</span><span class="T121">, e.g. </span><span class="T118">bu’ul pulem‑</span><span class="T120">bä</span><span class="T122"> (</span><span class="T121">bean/burned‑</span><span class="T67">relative</span><span class="T121">) ‘the beans that are burned’, </span><span class="T118">ilekax=bä </span><span class="T120">x</span><span class="T118">ixik</span><span class="T121"> (beautiful=</span><span class="T67">relative</span><span class="T121">/woman) ‘beautiful woman’, </span><span class="T120">ixim päk’beñ=ba</span><span class="T122"> (</span><span class="T121">corn/spoil=</span><span class="T67">relative)</span><span class="T121"> ‘corn that is spoiled.’</span><span class="T2"> </span></p></td>	\N	136	31	North America	high	0	0	1
80	2013-11-19 20:49:35.027607+01	2013-11-19 20:49:35.027614+01	t	\N	130	Arabic affixes in Western Neo‑Aramaic of Ma’lūla	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10"><span class="T69">Information and examples are from </span>Lipiński (<a href="__lipinskisemitic1997__">1997</a>: 280)</p><p class="P10"> </p><p class="P33">1 comparative‑forming pattern</p><p class="P195"><span class="T30">‘aw‑</span><span class="T2"> ‘comparative’, e.g. </span><span class="T30">‘awrab</span><span class="T13"> ‘</span><span class="T2">greater’ (from </span><span class="T30">rab </span><span class="T13">‘</span><span class="T2">great’)</span></p></td>	\N	111	76	Eurasia	high	0	0	1
81	2013-11-19 20:49:35.046387+01	2013-11-19 20:49:35.046391+01	t	\N	132	Tibeto-Burman affixes in Assamese	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P275"><a id="a__Examples_from_Goswami_and_Tamuli__2003_456–458___These_forms_are_“clearly_of_non‑Aryan_origin”__Masica_1991_250___According_to_Matras__2009_216___they_are_“probably_from_Tibeto‑Burman”_"><span></span></a><span class="T69">Examples from </span>Goswami and Tamuli (<a href="__goswamiasamiya2003__">2003</a>: 456–458). <span class="T69">These forms are “</span>clearly of non‑Aryan origin<span class="T69">” </span><span class="T69">(Masica <a href="__masicaindoaryan1991__">1991</a>: 250)</span><span class="T69">. According to Matras </span><span class="T69">(<a href="__matraslanguage2009__">2009</a>: 216)</span><span class="T69">, they are “probably from Tibeto‑Burman”.</span></p><p class="P278"><a id="a__15_numeral_classifiers"><span></span></a>15 numeral classifiers</p><p class="P292"><a id="a__‑zɒn_‘human_male__respect_polite’__e_g__dɒɦ‑zɒn_‘ten__men_’__manuɦ‑zɒn_‘the_man’"><span></span></a><span class="T28">‑zɒn </span>‘human male, respect/polite’, e.g. <span class="T28">dɒɦ‑zɒn </span>‘ten (men)’, <span class="T28">manuɦ‑zɒn </span>‘the man’</p><p class="P195"><span class="T28">‑zɒni </span><span class="T2">‘human female (with lack of respect), non-human female’, e.g. </span><span class="T28">sari‑zɒni </span><span class="T2">‘four (females)’, </span><span class="T28">manuɦ‑zɒni </span><span class="T2">‘the woman’, </span><span class="T28">sagɔli‑zɒni </span><span class="T2">‘the she‑goat’, </span><span class="T28">gai‑zɒni </span><span class="T2">‘the cow’</span></p><p class="P195"><span class="T28">‑gɒraki </span><span class="T2">‘human, respect’, e.g. </span><span class="T28">sari‑gɒraki </span><span class="T2">‘four (gentlemen/ladies)’, </span><span class="T28">manuɦ‑gɒraki </span><span class="T2">‘the gentleman/lady’</span></p><p class="P195"><span class="T28">‑to </span><span class="T2">‘inanimate, non‑human male, human male (impolite)’, e.g. </span><span class="T28">bɒlɒdfi‑to </span><span class="T2">‘the bull’, </span><span class="T28">xadɦu‑to </span><span class="T2">‘the story’, after numerals, the allomorph </span><span class="T28">‑ɛta </span><span class="T2">is used (impolite when used with human male referents)’, e.g. </span><span class="T28">dɒɦ‑ta </span><span class="T2">‘ten (bulls, men, etc.)’, </span><span class="T28">ɛ‑ta </span><span class="T2">‘one (story, man, etc.)’, </span><span class="T28">musi‑to </span><span class="T2">‘the cobbler’, </span><span class="T28">manuɦ‑to </span><span class="T2">‘the man’</span></p><p class="P195"><span class="T28">‑ti </span><span class="T2">‘same as </span><span class="T28">to</span><span class="T2">, but diminutive, endearing’, e.g. </span><span class="T28">lɔra‑ti </span><span class="T2">‘the (dear) little boy’, </span><span class="T28">zuri‑ti </span><span class="T2">‘the little stream’</span></p><p class="P195"><span class="T28">‑khɒn </span><span class="T2">‘dimensional (space, time)’, e.g. </span><span class="T28">natɒk‑khɒn </span><span class="T2">‘the play’, </span><span class="T28">kitɒp‑khɒn </span><span class="T2">‘the book’</span></p><p class="P195"><span class="T28">‑khɒni </span><span class="T2">‘same as </span><span class="T28">khɒn</span><span class="T2">, but diminutive, endearing’, e.g. </span><span class="T28">natika‑khɒni </span><span class="T2">‘the playlet’, </span><span class="T28">nɔi‑khɒni </span><span class="T2">‘the river’</span></p><p class="P195"><span class="T28">‑khini </span><span class="T2">‘non‑count (mass) nouns and pronouns’, e.g. </span><span class="T28">xei‑khini </span><span class="T2">‘that (place/thing)’, </span><span class="T28">pani‑khini </span><span class="T2">‘the water’</span></p><p class="P195"><span class="T28">‑dal </span><span class="T2">‘inanimate, flexible/stiff, oblong, human (pejorative)’, e.g. </span><span class="T28">manuɦ‑dal </span><span class="T2">‘the man’, </span><span class="T28">lathi‑dal </span><span class="T2">‘the stick’</span></p><p class="P195"><span class="T37">‑bor</span><span class="T28"> </span><span class="T2">‘</span><span class="T7">animate</span><span class="T2">,</span><span class="T7"> inanimate</span><span class="T2">’, e.g. </span><span class="T28">manuɦ‑bor </span><span class="T2">‘the men’, </span><span class="T28">eõ‑lok </span><span class="T2">‘these (people)’</span></p><p class="P195"><span class="T37">‑ɦɑ̃t</span><span class="T28"> </span><span class="T2">‘</span><span class="T7">human</span><span class="T2">’, e.g. </span><span class="T28">lɔra‑ɦɑ̃t </span><span class="T2">‘the boys’, </span><span class="T28">tekhet‑xɒlɒl </span><span class="T2">‘those (ladies/gentlemen)’</span></p><p class="P195"><span class="T37">‑ɦɑ̃t</span><span class="T28"> </span><span class="T2">‘</span><span class="T7">non‑human (pejorative reference to humans)</span><span class="T2">’, e.g. </span><span class="T28">gɔru‑ɦɑ̃t </span><span class="T2">‘fools’, </span><span class="T28">manuɦ‑zɒn </span><span class="T2">‘the man’</span></p><p class="P195"><span class="T37">‑lok</span><span class="T28"> </span><span class="T2">‘</span><span class="T7">human</span><span class="T2">,</span><span class="T7"> respect (occurs with some pronouns)</span><span class="T2">’, e.g. </span><span class="T28">toma‑lok </span><span class="T2">‘you’, </span><span class="T28">manuɦ‑gɒraki </span><span class="T2">‘the gentleman/lady’</span></p><p class="P195"><span class="T37">‑xɒlɒl</span><span class="T28"> </span><span class="T2">‘</span><span class="T7">human</span><span class="T2">,</span><span class="T7"> respect (occurs with select nouns and pronouns)</span><span class="T2">’, e.g. </span><span class="T28">xikhyɒk‑xɒlɒl </span><span class="T2">‘the teachers’, </span><span class="T28">kagɒz‑khila </span><span class="T2">‘the (sheet of) paper’</span></p><p class="P195"><span class="T37">‑khila</span><span class="T28"> </span><span class="T2">‘</span><span class="T7">sheet</span><span class="T2">,</span><span class="T7"> leaf‑like</span><span class="T2">’, e.g. </span><span class="T28">kagɒz‑khila </span><span class="T2">‘the sheets of paper’</span></p></td>	\N	142	157	Eurasia	mid	1	15	15
84	2013-11-19 20:49:35.079802+01	2013-11-19 20:49:35.079814+01	t	\N	135	Spanish affixes in Mexicanero de la Sierra Madre Occidental	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P275"><a id="a__Information_and_examples_are_from_Chamoreau__2012_82–84__"><span></span></a><span class="T69">Information and examples are from Chamoreau </span>(<a href="__chamoreauspanish2012__">2012</a>: 82–84)<span class="T69">.</span></p><p class="P278"><a id="a__1_diminutive"><span></span></a>1 diminutive</p><p class="P204"><span class="T28">‑ito</span><span class="T2"> ‘diminutive’, e.g. </span><span class="T28">tepitʃi‑ito </span><span class="T2">‘tiny’ (from </span><span class="T28">tepitʃi </span><span class="T2">‘boy’), </span><span class="T28">meka‑t‑ito </span><span class="T2">(string</span><span class="T53">‑sg‑diminutive</span><span class="T2">) ‘little string’, </span><span class="T28">nin‑nakas‑ito </span><span class="T2">(3</span><span class="T53">pl‑</span><span class="T2">ear‑</span><span class="T53">diminutive</span><span class="T2">) ‘their tiny ears’</span></p></td>	\N	22	156	North America	high	0	0	1
85	2013-11-19 20:49:35.09681+01	2013-11-19 20:49:35.096821+01	t	\N	136	Spanish affixes in Yucatec Maya	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P275"><a id="a__Information_and_examples_are_from_Chamoreau__2012_84__"><span></span></a><span class="T69">Information and examples are from Chamoreau </span>(<a href="__chamoreauspanish2012__">2012</a>: 84)<span class="T69">.</span></p><p class="P278"><a id="a__1_diminutive"><span></span></a>1 diminutive</p><p class="P204"><span class="T28">‑ito ~ ‑itu</span><span class="T2"> ‘diminutive’, e.g. </span><span class="T28">polok‑ito </span><span class="T2">‘sort of fat (of a male)’, </span><span class="T28">bek’ech‑ita </span><span class="T2">‘sort of thin (of a female)’, </span><span class="T28">sak‑ito</span><span class="T2"> ‘sort of white (of a man)’, </span><span class="T28">xlo’obayan‑ita</span><span class="T2"> ‘youthful (of a female)’</span></p></td>	\N	158	156	North America	high	0	0	1
86	2013-11-19 20:49:35.112227+01	2013-11-19 20:49:35.112234+01	t	\N	137	Indonesian affixes in Kedang	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P276"><a id="a__Examples_are_from_Samely__1991_67___According_to_Matras__2009_210___‑wala_is_bound_and_borrowed_from_Indonesian__which_in_turn_borrowed_it_from_Indo‑Aryan_"><span></span></a>Examples are from Samely (<a href="__samelykedang1991__">1991</a>: 67). According to Matras (<a href="__matraslanguage2009__">2009</a>: 210), <span class="T28">‑wala</span> is bound and borrowed from Indonesian, which in turn borrowed it from Indo‑Aryan.</p><p class="P278"><a id="a__1_agent‑noun_derivation"><span></span></a>1 agent‑noun derivation</p><p class="P204"><span class="T28">‑wala</span><span class="T2"> ‘agent noun’, e.g. </span><span class="T28">durungwala </span><span class="T2">‘seller’ (from </span><span class="T28">durung</span><span class="T2"> ‘to sell’), </span><span class="T28">galekawala</span><span class="T2"> ‘helper, server’ (from </span><span class="T28">galeka</span><span class="T2"> ‘to help, serve’), </span><span class="T28">huangwala</span><span class="T2"> ‘player’ (from </span><span class="T28">huang</span><span class="T2"> ‘to play’)</span></p></td>	\N	85	42	Southeast Asia & Oceania	low	2	0	1
87	2013-11-19 20:49:35.122306+01	2013-11-19 20:49:35.12231+01	t	\N	138	Turkish affixes in Iraqi Arabic	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P276"><a id="a__Information_and_examples_are_from_Masliyah__1996___etymological_information_from_Nişanyan__2009__"><span></span></a>Information and examples are from Masliyah (<a href="__masliyahfour1996__">1996</a>), etymological information from Nişanyan (<a href="__nisanyansozlerin2009__">2009</a>).</p><p class="P278"><a id="a__2_adverbializers__one_also_functions_as_inhabitant_noun_derivation_"><span></span></a>2 adverbializers (one also functions as inhabitant noun derivation)</p><p class="P293"><a id="a__‑li_‘having_a_property__inhabitant’__e_g__Karkūkli_‘resident_of_Kirkuk’__Oşmalli_‘Ottoman’__Arbīlli_‘from_Irbil’__maktabli_‘student’__from_maktab_‘school’___buṭuḷli_‘deceiver’__from_buṭuḷ_‘fraud’_"><span></span></a><span class="T28">‑li </span>‘having a property, inhabitant’, e.g. <span class="T28">Karkūkli </span>‘resident of Kirkuk’, <span class="T28">Oşmalli</span> ‘Ottoman’, <span class="T28">Arbīlli</span> ‘from Irbil’, <span class="T28">maktabli </span>‘student’ (from <span class="T28">maktab </span>‘school’), <span class="T28">buṭuḷli </span>‘deceiver’ (from <span class="T28">buṭuḷ </span>‘fraud’)</p><p class="P293"><a id="a__‑sizz_‘privative’__e_g__šarafsizz_‘honourless’__ġīrasizz_‘without_jealousy’"><span></span></a><span class="T28">‑sizz </span>‘privative’, e.g. <span class="T28">šarafsizz</span> ‘honourless’, <span class="T28">ġīrasizz</span> ‘without jealousy’</p><p class="P278"><a id="a__2_nominalizers"><span></span></a>2 nominalizers</p><p class="P293"><a id="a__‑loġ_‘abstract_nominalizer’__used_in_addition_to_Arabic_abstract_nominalizer_‑iyya__e_g__zmālloġiyya_‘stupidity__lit__donkeyness_’__ḫwārdlloġiyya_‘foolishness’"><span></span></a><span class="T28">‑loġ </span>‘abstract nominalizer’, used in addition to Arabic abstract nominalizer <span class="T28">‑iyya</span>, e.g. <span class="T28">zmālloġiyya </span>‘stupidity (lit. donkeyness)’, <span class="T28">ḫwārdlloġiyya</span> ‘foolishness’</p><p class="P293"><a id="a__‑çi_‘agent_nominalizer’__e_g__saḫtaçi_‘wily’__sakarçi_‘addicted_drinker’__from_sakar_‘drunkenness’___ballamçi_‘boatman’__from_balam_‘boat’_"><span></span></a><span class="T28">‑çi </span>‘agent nominalizer’, e.g. <span class="T28">saḫtaçi </span>‘wily’, <span class="T28">sakarçi </span>‘addicted drinker’ (from <span class="T28">sakar </span>‘drunkenness’), <span class="T28">ballamçi </span>‘boatman’ (from <span class="T28">balam </span>‘boat’)</p><p class="P17"> </p></td>	\N	3	81	Eurasia	high	0	4	4
88	2013-11-19 20:49:35.131577+01	2013-11-19 20:49:35.131591+01	t	\N	139	Quapaw affixes in Alabama and Choctaw‑Chickasaw	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10"><span class="T69">Information from Rankin </span>(<a href="__shipleyquapaw1988__">1988</a>: 644 citing Geoffrey Kimball, personal communication)<span class="T69">. No examples of hybrids are given. The identification of the affix as borrowed is based on similarities in form, the presence of cognate forms in other Siouan languages, and the absence of similar forms in other Muskogean languages.</span></p><p class="P11"> </p><p class="P34">1 numeral formation prefix</p><p class="P3"><span class="T28">hi‑</span><span class="T2"> ‘ordinal number formation’, no examples of hybrids given</span></p></td>	\N	86	159	North America	mid	1	0	1
89	2013-11-19 20:49:35.145415+01	2013-11-19 20:49:35.145422+01	t	\N	140	Hindi affixes in Kharia	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P10"><span class="T70">Information and examples are from Peterson </span>(<a href="__petersongrammar2011__">2011</a>: 333–334)<span class="T70"> </span><span class="T69">and John Peterson (personal communication, March 2012).</span></p><p class="P48"> </p><p class="P48"><span class="T48">1 participles marker</span> (out of a total of 3 Kharia participle markers)</p><p class="P2"><span class="T37">=wala</span><span class="T7"> ‘iterativity and habituality’, e.g. </span><span class="T28">kamu=na=wala lebu=ki</span><span class="T2"> ‘working people’</span></p></td>	\N	6	89	Eurasia	mid	1	0	1
90	2013-11-19 20:49:35.152018+01	2013-11-19 20:49:35.152025+01	t	\N	142	Latvian affixes in German	<td class="Table1_A1" style="text-align:left;width:4.8694in; "><p class="P112"><span class="T83">This case refers to German dialects spoken in Latvia. Information and examples are from Polanska </span>(<a href="__polanskazum2002__">2002</a>: 161–167)<span class="T83">.</span></p><p class="P117"> </p><p class="P119">1 nominal derivational suffix</p><p class="P227"><span class="T28">‑neck </span><span class="T2">‘occupation noun, agent noun’, e.g. </span><span class="T28">kammerneck</span><span class="T2"> ‘peasant (lit. inhabitant of a small chamber)’, </span><span class="T28">reiseneck </span><span class="T2">‘traveller’, </span><span class="T28">vlosseneck </span><span class="T2">‘rafter’</span></p></td>	\N	115	63	Eurasia	high	0	0	1
91	2013-11-19 20:49:35.158486+01	2013-11-19 20:49:35.158493+01	t	\N	143	Quechua affixes in Amuesha	<td class="Table1_D26" style="text-align:left;width:4.8694in; "><p class="P117">Information and examples are from Adelaar (<a href="__adelaarquechua2006__">2006</a>), who takes examples from Duff-Tripp (<a href="__dufftrippgramatica1997__">1997</a>).</p><p class="P117"> </p><p class="P119">2 tense-aspect mood clitics</p><p class="P232"><span class="T28">-(V:)kma</span><span class="T2"> ‘distributive’, used with demonstratives, possessive pronouns and adverbial expressions, e.g. </span><span class="T28">na:-nm-a:kma</span><span class="T2"> (1</span><span class="T53">sg</span><span class="T2">-first-</span><span class="T53">distributive) ‘</span><span class="T2">Always me first’, </span><span class="T28">no:-kma</span><span class="T2"> (</span><span class="T53">1sg.possessor-distributive) ‘</span><span class="T2">(Several) of mine, all mine’, </span><span class="T28">a:l</span><span class="T111">y</span><span class="T28">-o</span><span class="T111">h</span><span class="T28">t</span><span class="T111">y</span><span class="T28">-e:kma</span><span class="T2"> (there-</span><span class="T53">ablative-distributive</span><span class="T2">) ‘Always from there’</span></p><p class="P232"><span class="T28">-n</span><span class="T111">y</span><span class="T28">a </span><span class="T2">‘emphatic’ (sentential clitic), e.g. </span><span class="T28">al</span><span class="T111">y</span><span class="T28">-empo-n</span><span class="T111">y</span><span class="T28">a-pa</span><span class="T111">ʔ</span><span class="T28"> a:w-o</span><span class="T111">ʔ</span><span class="T28"> ot-a:n-e</span><span class="T111">h</span><span class="T28">t-n</span><span class="T111">y</span><span class="T28">a korne</span><span class="T111">h</span><span class="T28">ša</span><span class="T111">ʔ</span><span class="T2"> (there-time-</span><span class="T53">sequentiail-topic/auxiliary-reported</span><span class="T2">/say-</span><span class="T53">3pl.object-3pl.agent-sequentiail</span><span class="T2">/chief) ‘Then the chief said to them’</span></p><p class="P233"> </p><p class="P117"><span class="T48">1 case suffix</span> (out of a total of 4 Amuesha case suffixes)</p><p class="P121"><span class="T28">-(V:)kop</span><span class="T2"> ‘benefactive case’, e.g</span><span class="T28">. a:č-e:kop</span><span class="T2"> (mother-</span><span class="T53">benefactive) ‘</span><span class="T2">for mother’, </span><span class="T28">no-:kop-pa’</span><span class="T2"> (</span><span class="T53">1sg.possessor-benefactive-topic</span><span class="T2">) ‘as for me, ...’</span></p></td>	\N	72	50	South America	mid	1	2	3
92	2013-11-19 20:49:35.167607+01	2013-11-19 20:49:35.167615+01	t	\N	144	Tajik affixes in Moghol	<td class="Table1_D26" style="text-align:left;width:4.8694in; "><p class="P163">Information and examples are from Weiers (<a href="__janhunenmoghol2003__">2003</a>).</p><p class="P163"> </p><p class="P163"><span class="T48">4 plural markers</span> (one series, there is another native series)</p><p class="P234"><span class="T30">-ån </span><span class="T13">‘plural’</span><span class="T2">, e.g. </span><span class="T30">cashm-ån </span><span class="T2">‘eyes’</span></p><p class="P234"><span class="T2">-</span><span class="T30">åt ~ -yåt </span><span class="T2">(after vowels)</span><span class="T30"> </span><span class="T13">‘plural’, e.g. </span><span class="T30">jar-åt </span><span class="T2">‘ghazals’, </span><span class="T30">urul-åt </span><span class="T2">‘lips’, </span><span class="T30">gazhi-yåt </span><span class="T2">‘signs’</span></p><p class="P234"><span class="T2">-</span><span class="T30">hå</span><span class="T2"> ‘plural’, e.g. </span><span class="T30">qutuf-hå </span><span class="T2">‘slow steps’</span></p><p class="P234"><span class="T2">-</span><span class="T30">håt </span><span class="T13">‘plural’</span><span class="T2">, e.g. </span><span class="T30">cuqu-håt </span><span class="T2">‘realities’</span></p><p class="P169"><span class="T2">The following implies that these are also used with native stems: “The second series is of Persian-Arabic origin and is mostly (but not only) used in connection with Persian-Arabic words, [-</span><span class="T30">håt</span><span class="T2">] is a combined Persian and Moghol plural suffix” </span><span class="T2">(Weiers <a href="__janhunenmoghol2003__">2003</a>: 254)</span><span class="T2">.</span></p><p class="P163"> </p><p class="P164">2 comparative/superlative markers</p><p class="P169"><span class="T28">-tar</span><span class="T2"> ‘comparative’</span></p><p class="P234"><span class="T28">-iin</span><span class="T2"> ‘superlative’, used in addition to comparative, i.e. -</span><span class="T28">tariin. </span><span class="T2">There are no examples of hybrids, but the following implies that they are used with native stems: “Adjectives are distinguished by the category of degree (comparison), borrowed from Iranian and marked by the Persian suffixes </span><span class="T30">-tar </span><span class="T2">for the comparative and </span><span class="T30">-tar-iin </span><span class="T2">for the superlative” </span><span class="T2">(Weiers <a href="__janhunenmoghol2003__">2003</a>: 252)</span><span class="T2">.</span></p><p class="P235"> </p><p class="P163"><span class="T48">1 case marker</span> (out of a total of 7 Moghol case markers)</p><p class="P234"><span class="T28">-az </span><span class="T2">‘ablative case’. There are no examples of hybrids, but the following implies that they are used with native stems: “The Persian preposition </span><span class="T30">az </span><span class="T2">‘from’ is sometimes used as an ablative suffix -</span><span class="T30">az</span><span class="T2">” </span><span class="T2">(Weiers <a href="__janhunenmoghol2003__">2003</a>: 255)</span><span class="T2">.</span></p></td>	\N	8	26	Eurasia	high	0	6	7
93	2013-11-19 20:49:35.176794+01	2013-11-19 20:49:35.1768+01	t	\N	145	Chinese affixes in Dagur	<td class="Table1_D26" style="text-align:left;width:4.8694in; "><p class="P163">Information and examples are from Tsumagari (<a href="__janhunendagur2003__">2003</a>: 136).</p><p class="P163"> </p><p class="P163"><span class="T48">1 plural suffix</span> (out of 4 Dagur plural suffixes)</p><p class="P234"><span class="T2">-</span><span class="T30">cieng </span><span class="T13">‘plural’</span><span class="T2">, e.g. </span><span class="T30">gambul-cieng </span><span class="T13">‘executives’</span><span class="T2"> (in Chinese, </span><span class="T30">-cieng </span><span class="T2">denotes place of origin or habitation, e.g. </span><span class="T30">batgen-cieng </span><span class="T2">‘Butha people’, </span><span class="T30">degidee-cieng </span><span class="T2">‘upper-river-dwellers’)</span></p></td>	\N	82	69	Eurasia	high	0	0	1
94	2013-11-19 20:49:35.186116+01	2013-11-19 20:49:35.186121+01	t	\N	146	Croatian affixes in Hungarian	<td class="Table1_D26" style="text-align:left;width:4.8694in; "><p class="P1"><span class="T125">This case refers to the dialects of Ormányság and Hosszúszó. Information and examples are from Fuchs </span><span class="T90">(<a href="__fuchskomparativ1949__">1949</a>: 225–226)</span><span class="T125">. Examples are from the dialect of Ormányság, but the borrowed prefix is also attested in the dialect of Hosszúszó. The borrowed prefix is added to forms that include native Hungarian comparative suffixes. Fuchs </span><span class="T90">(<a href="__fuchskomparativ1949__">1949</a>: 226)</span><span class="T125"> notes that the same Croatian prefix is used by German speaking children in Upper Hungary in combination with native German superlative forms, e.g. </span><span class="T126">naj-grösste </span><span class="T125">(</span><span class="T68">superlative</span><span class="T125">-biggest) ‘biggest’</span><span class="T126">, najbeste </span><span class="T125">(</span><span class="T68">superlative</span><span class="T125">-best) ‘best’.</span></p><p class="P163"> </p><p class="P164">1 superlative prefix</p><p class="P169"><span class="T28">naj- </span><span class="T2">‘superlative’, e.g. </span><span class="T28">náj-nagy-obb </span><span class="T2">(</span><span class="T53">superlative</span><span class="T2">-big-</span><span class="T53">comparative</span><span class="T2">) ‘biggest’, </span><span class="T28">náj-zë-bb</span><span class="T2"> (</span><span class="T53">superlative</span><span class="T2">-nice-</span><span class="T53">comparative</span><span class="T2">) ‘most beautiful’</span></p></td>	\N	94	67	Eurasia	high	0	0	1
95	2013-11-19 20:49:35.191778+01	2013-11-19 20:49:35.191782+01	t	\N	147	Evenki affixes in Dagur	<td class="Table1_D26" style="text-align:left;width:4.8694in; "><p class="P163">Information and examples are from Tsumagari (<a href="__janhunendagur2003__">2003</a>: 136).</p><p class="P163"> </p><p class="P163"><span class="T48">3 plural suffixes</span> (out of a total of 4 Dagur plural markers)</p><p class="P234"><span class="T30">-sul</span><span class="T2"> ‘plural’ (used with any noun), e.g. </span><span class="T30">akaa-sul </span><span class="T2">‘elder brothers’, </span><span class="T30">mori-sul </span><span class="T2">‘horses’, </span><span class="T30">mood-sul </span><span class="T2">‘trees’</span></p><p class="P234"><span class="T2">-</span><span class="T30">nur </span><span class="T13">‘plural’ (for human nouns), e.g. </span><span class="T30">guc/i-nur </span><span class="T13">‘friends’</span><span class="T2">, </span><span class="T30">deu-nur </span><span class="T2">‘younger brothers’</span></p><p class="P234"><span class="T2">-</span><span class="T30">r </span><span class="T13">‘plural’ (for human nouns), e.g. </span><span class="T30">ugi-r </span><span class="T13">‘girls’</span><span class="T2">, </span><span class="T30">uciike-r </span><span class="T2">‘infants’, </span><span class="T30">kek/u-r </span><span class="T13">‘children’</span></p></td>	\N	82	39	Eurasia	high	0	3	3
96	2013-11-19 20:49:35.196457+01	2013-11-19 20:49:35.196462+01	t	\N	148	Chinese affixes in Santa	<td class="Table1_D26" style="text-align:left;width:4.8694in; "><p class="P48">Information and examples are from Kim (<a href="__janhunensanta2003__">2003</a>).</p><p class="P48"> </p><p class="P48"><span class="T48">5 derivational suffixes forming denominal nouns</span> (out of a total of 13 of such derivational suffixes in Santa)</p><p class="P197"><span class="T33">-kai</span><span class="T12"> ‘agent or occupation noun’, </span><span class="T2">e.g. </span><span class="T33">su-kai</span><span class="T12"> (vinegar-</span><span class="T64">nominalization</span><span class="T12">) </span><span class="T2">‘vinegar seller’, </span><span class="T33">nienjinzi-kai</span><span class="T12"> (</span><span class="T2">eye_glasses-</span><span class="T61">nominalization</span><span class="T2">) ‘a person wearing glasses’</span></p><p class="P197"><span class="T33">-tu</span><span class="T12"> </span><span class="T2">‘possessive adjectival nouns’, e.g. </span><span class="T33">amin-tu</span><span class="T12"> (life-</span><span class="T57">nominalization</span><span class="T12">) </span><span class="T2">‘living, alive’</span></p><p class="P197"><span class="T33">-sha</span><span class="T12"> </span><span class="T2">‘noun denoting a person having a characteristic’, e.g. </span><span class="T33">taghu-sha</span><span class="T12"> (fat-</span><span class="T57">nominalization</span><span class="T12">) </span><span class="T2">‘a fat person’</span></p><p class="P197"><span class="T33">-bao</span><span class="T12"> </span><span class="T2">‘noun denoting a person having a characteristic’, e.g. </span><span class="T33">yara-bao</span><span class="T12"> (tumor-</span><span class="T57">nominalization</span><span class="T12">) </span><span class="T2">‘a person with a tumor’</span></p><p class="P197"><span class="T33">-jian</span><span class="T12"> </span><span class="T2">‘noun denoting a person having a characteristic’, e.g. </span><span class="T33">borun-jian</span><span class="T12"> (right_side-</span><span class="T57">nominalization</span><span class="T12">) </span><span class="T2">‘a right-handed person’</span></p><p class="P216"> </p><p class="P17"><span class="T48">1 plural suffix for pronouns and kinship terms</span> (out of a total of 2 such plural markers in Santa)</p><p class="P57"><span class="T33">-xie</span><span class="T2">, e.g. </span><span class="T33">gayijio-xie</span><span class="T28">(</span><span class="T33">-la</span><span class="T28">)</span><span class="T2"> ‘younger brothers’</span></p><p class="P51"> </p><p class="P40">1 passive marker</p><p class="P224"><span class="T19">neyi-</span><span class="T12"> </span><span class="T2">‘passive’, e.g. </span><span class="T33">bi gayi-se-ne </span><span class="T28">(</span><span class="T33">idun</span><span class="T28">) </span><span class="T33">neyi-wo</span><span class="T12"> </span><span class="T2">‘I was hit (one blow) by my brother’, </span><span class="T33">ene kewon changbang pipin neyizhi wo</span><span class="T12"> </span><span class="T2">‘this boy is frequently being rebuked’.</span></p></td>	\N	24	69	Eurasia	high	0	5	7
97	2013-11-19 20:49:35.205333+01	2013-11-19 20:49:35.20534+01	t	\N	149	Turkic affixes in Middle Mongolic	<td class="Table1_D26" style="text-align:left;width:4.8694in; "><p class="P17"><span class="T124">Information and examples are from Schönig </span><span class="T89">(<a href="__janhunenturcomongolic2003__">2003</a>)</span><span class="T124">. Note that many of the features concerned may be much older than Middle Mongolic.</span></p><p class="P168"> </p><p class="P166">3 case markers</p><p class="P237"><span class="T2">*</span><span class="T30">-lUx-A </span><span class="T13">‘</span><span class="T2">comitative’, based on the Turkic suffix *</span><span class="T30">-lVg </span><span class="T2">for possessive adjectival nouns, as in Turkic *</span><span class="T30">at-lïg </span><span class="T2">‘with a horse’. The same Turkic suffix appears with a derivative function as a later borrowing in Middle Mongol, e.g. Middle Mongol </span><span class="T30">miqa-liq </span><span class="T2">‘corpulent’ (from </span><span class="T30">miqa/n </span><span class="T2">‘flesh’).</span></p><p class="P237"><span class="T2">*</span><span class="T30">-cAA </span><span class="T2">‘terminative’, rarely used, may be a borrowing from the Turkic equative in *</span><span class="T30">-cA </span><span class="T2">(‘as’); a connection of the latter with the Mongolic primary ablative in *</span><span class="T30">-cA </span><span class="T2">is also possible but less likely.</span></p><p class="P237"><span class="T2">*</span><span class="T30">-ki </span><span class="T2">‘secondary nominative’, has a cognate in Turkic and is probably of Turkic origin</span></p><p class="P168"> </p><p class="P171"><span class="T2">Other Mongolic case suffixes that have been compared with Turkic include the locative in *</span><span class="T30">-A </span><span class="T2">(cf. the Turkic dative in *</span><span class="T30">-GA</span><span class="T2">), the dative (dative-locative) in *</span><span class="T30">-D-A </span><span class="T2">(cf. the Turkic locative in *</span><span class="T30">-DA</span><span class="T2">), and the accusative in *</span><span class="T30">-g </span><span class="T2">(only in Mongol proper, Ordos, Oirat, and Kalmuck, cf. the Turkic accusative in *</span><span class="T30">-G</span><span class="T2">). All of these comparisons involve, however, considerable linguistic problems.</span></p><p class="P168"> </p><p class="P165">1 plural suffix</p><p class="P170"><span class="T2">*</span><span class="T30">-s </span><span class="T13">‘plural’ </span><span class="T2">(&gt; Common Turkic *</span><span class="T30">-z</span><span class="T2">)</span></p><p class="P167"> </p><p class="P165">1 nominal derivation suffix</p><p class="P170"><span class="T2">*</span><span class="T30">-cI </span><span class="T2">‘actor noun’</span></p><p class="P167"> </p><p class="P165">1 verbalizer prefix</p><p class="P236"><span class="T2">*</span><span class="T30">-lA- </span><span class="T2">‘denominal verbalization’, e.g. *</span><span class="T30">ger.le- </span><span class="T2">‘to marry’ (from *</span><span class="T30">ger </span><span class="T2">‘house’)</span></p></td>	\N	34	25	Eurasia	mid	1	3	6
98	2013-11-19 20:49:35.219739+01	2013-11-19 20:49:35.219747+01	t	\N	150	Lingala affixes in Ndunga-le	<td class="Table1_D26" style="text-align:left;width:4.8694in; "><p class="P168">Information and examples are from Pasch (<a href="__paschentlehnung1988__">1988</a>).</p><p class="P168"> </p><p class="P166">4 noun class prefixes which form two singular-plural pairs</p><p class="P237"><span class="T28">mù- </span><span class="T2">‘singular class 1’, e.g. </span><span class="T28">mù-mbòmà-Ø </span><span class="T2">‘spirit’</span></p><p class="P237"><span class="T28">mì- </span><span class="T2">‘plural class 2’, e.g. </span><span class="T28">mì-mbòmà-yè </span><span class="T2">‘spirits’</span></p><p class="P237"><span class="T28">(l)í- </span><span class="T2">‘singular class 3’, e.g. </span><span class="T28">í-lágɛ̀-Ø </span><span class="T2">‘fire’</span></p><p class="P237"><span class="T28">ma- </span><span class="T2">‘plural class 4’, e.g, </span><span class="T28">má-lágɛ́-yɛ̀ </span><span class="T2">‘fires’</span></p></td>	\N	44	126	Africa	high	0	4	4
99	2013-11-19 20:49:35.232952+01	2013-11-19 20:49:35.232956+01	t	\N	151	Cushitic affixes in Ilwana	<td class="Table1_D26" style="text-align:left;width:4.8694in; "><p class="P31"><span class="T127">Information and examples are from Möhlig </span><span class="T127">(<a href="__mohligaspects1986__">1986</a>)</span><span class="T127">. The exact source language is unknown, but “plural formation with suffixes is certainly not Bantu [and] looks somehow Cushitic” </span><span class="T89">(Möhlig <a href="__mohligaspects1986__">1986</a>: 279)</span><span class="T127">.</span></p><p class="P168"> </p><p class="P166">4 plural markers</p><p class="P237"><span class="T28">-ɛna</span><span class="T2"> ‘plural’, e.g. </span><span class="T128">n</span><span class="T28">gɔ́mena</span><span class="T2"> ‘drums’ (</span><span class="T28">ngɔ́ma</span><span class="T2"> ‘drum’), </span><span class="T28">híɗɛna</span><span class="T2"> ‘roots’ (</span><span class="T28">híɗa</span><span class="T2"> ‘root’), </span><span class="T28">bɔ́kwɛna</span><span class="T2"> ‘cheeks’ (</span><span class="T28">bɔ́kɔ</span><span class="T2"> ‘cheek’)</span></p><p class="P237"><span class="T115">-ıɾa</span><span class="T28"> </span><span class="T2">‘plural’, e.g. </span><span class="T28">símbıɾa </span><span class="T2">‘sticks’ (</span><span class="T28">símbɔ </span><span class="T2">‘stick’), </span><span class="T28">sâ:pwıɾa </span><span class="T2">‘palms of hand’ (</span><span class="T28">sâ:pu </span><span class="T2">‘palm of hand’), </span><span class="T28">pâ:</span><span class="T128">n</span><span class="T30">g</span><span class="T28">ıɾa </span><span class="T2">‘machetes’ (</span><span class="T28">lupâ:</span><span class="T128">n</span><span class="T28">ga </span><span class="T2">‘machete’)</span></p><p class="P237"><span class="T28">-wakı </span><span class="T2">‘plural’, e.g. </span><span class="T28">sî:ɾwakı</span><span class="T2"> ‘knifes’ (</span><span class="T28">sî:ɾu</span><span class="T2"> ‘knife’), </span><span class="T28">ɣɛ́ɾwakı</span><span class="T2"> ‘giraffes’ (</span><span class="T28">ɣɛ́ɾı</span><span class="T2"> ‘giraffe’)</span></p><p class="P237"><span class="T28">-imɔ </span><span class="T2">‘plural’, e.g. </span><span class="T28">ɓánimɔ </span><span class="T2">‘branches’ (</span><span class="T28">ɓána</span><span class="T2"> ‘branch’), </span><span class="T28">ɓáɓalimɔ </span><span class="T2">‘doors’ (</span><span class="T28">ɓáɓala </span><span class="T2">‘door’), </span><span class="T28">ɲâ:limɔ </span><span class="T2">‘claws’ (</span><span class="T28">ɲâ:la </span><span class="T2">‘claw’)</span></p></td>	\N	114	1	Africa	mid	1	4	4
100	2013-11-19 20:49:35.238531+01	2013-11-19 20:49:35.238536+01	t	\N	152	North Swahili affixes in South Swahili	<td class="Table1_D26" style="text-align:left;width:4.8694in; "><p class="P168">Information and examples are from Güldemann (<a href="__guldemannist1992__">1992</a>: 52, 53; <a href="__guldemanngrammaticalization2003__">2003</a>: 187)­. No examples of hybrid formations are given here, but since these forms have become members of inflection in South Swahili, it is safe to assume that they regularly combine with native South Swahili stems. The forms do not share the same slot in the verbal template. Both prefixes have developed from multimorphemic forms of North Swahili.</p><p class="P168"> </p><p class="P166">2 tense-aspect markers</p><p class="P171"><span class="T28">me- </span><span class="T2">‘perfect’</span></p><p class="P171"><span class="T28">hu- </span><span class="T2">‘habitual’</span></p></td>	\N	127	123	Africa	high	0	0	2
101	2013-11-19 20:49:35.250417+01	2013-11-19 20:49:35.250423+01	t	\N	153	Spanish affixes in Central Mexicano Nahuatl	<td class="Table1_A102" style="text-align:left;width:4.8694in; "><p class="P10">Information and examples are from Hill &amp; Hill (<a href="__hillspeaking1986__">1986</a>: 194, 197).</p><p class="P10"> </p><p class="P33">2 diminutive/augmentative markers</p><p class="P195"><span class="T28">-ita </span><span class="T2">‘diminutive’, e.g. </span><span class="T28">nān-ita</span><span class="T2"> (mother-</span><span class="T53">diminutive</span><span class="T2">) ‘mother dear’ (only one hybrid attested)</span></p><p class="P195"><span class="T28">-ote</span><span class="T2"> ‘augmentative’, e.g. </span><span class="T28">huēy-ote</span><span class="T2"> (big-</span><span class="T53">augmentative</span><span class="T2">) ‘enormous’ (only one hybrid attested)</span></p><p class="P10"> </p><p class="P33">1 agent noun derivation</p><p class="P195"><span class="T2">-</span><span class="T28">tero</span><span class="T2"> ‘agent noun’, e.g. </span><span class="T28">cuah-tero</span><span class="T2"> (wood-</span><span class="T53">agent</span><span class="T2">) ‘wood cutter’, </span><span class="T28">tlahchiqu-ero</span><span class="T2"> (collect_maguey-</span><span class="T53">agent</span><span class="T2">) ‘one who collects maguey’. The suffix “does appear on Mexicano roots as well as on Spanish roots” </span><span class="T2">(Hill and Hill <a href="__hillspeaking1986__">1986</a>: 197)</span><span class="T2"> </span></p></td>	\N	144	156	North America	high	0	2	3
\.


--
-- Name: pair_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pair_pk_seq', 101, true);


--
-- Data for Name: pairsource; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pairsource (pk, created, updated, active, jsondata, pair_pk, source_pk) FROM stdin;
1	2013-11-19 20:49:43.835353+01	2013-11-19 20:49:43.835358+01	t	\N	1	30
2	2013-11-19 20:49:43.840233+01	2013-11-19 20:49:43.840238+01	t	\N	1	139
3	2013-11-19 20:49:43.844392+01	2013-11-19 20:49:43.844397+01	t	\N	1	36
4	2013-11-19 20:49:43.84885+01	2013-11-19 20:49:43.848857+01	t	\N	1	73
5	2013-11-19 20:49:43.856344+01	2013-11-19 20:49:43.856351+01	t	\N	2	132
6	2013-11-19 20:49:43.860214+01	2013-11-19 20:49:43.860221+01	t	\N	2	231
7	2013-11-19 20:49:43.864455+01	2013-11-19 20:49:43.864462+01	t	\N	2	98
8	2013-11-19 20:49:43.870395+01	2013-11-19 20:49:43.870402+01	t	\N	3	32
9	2013-11-19 20:49:43.874229+01	2013-11-19 20:49:43.874237+01	t	\N	3	177
10	2013-11-19 20:49:43.878494+01	2013-11-19 20:49:43.878501+01	t	\N	3	203
11	2013-11-19 20:49:43.884403+01	2013-11-19 20:49:43.88441+01	t	\N	4	230
12	2013-11-19 20:49:43.88851+01	2013-11-19 20:49:43.888517+01	t	\N	4	94
13	2013-11-19 20:49:43.895751+01	2013-11-19 20:49:43.895763+01	t	\N	4	146
14	2013-11-19 20:49:43.903239+01	2013-11-19 20:49:43.903251+01	t	\N	4	99
15	2013-11-19 20:49:43.91689+01	2013-11-19 20:49:43.916903+01	t	\N	5	185
16	2013-11-19 20:49:43.924989+01	2013-11-19 20:49:43.924995+01	t	\N	5	80
17	2013-11-19 20:49:43.930296+01	2013-11-19 20:49:43.930302+01	t	\N	6	230
18	2013-11-19 20:49:43.936799+01	2013-11-19 20:49:43.936811+01	t	\N	6	146
19	2013-11-19 20:49:43.940341+01	2013-11-19 20:49:43.940346+01	t	\N	6	57
20	2013-11-19 20:49:43.946082+01	2013-11-19 20:49:43.946088+01	t	\N	7	29
21	2013-11-19 20:49:43.950653+01	2013-11-19 20:49:43.95066+01	t	\N	7	197
22	2013-11-19 20:49:43.955824+01	2013-11-19 20:49:43.955831+01	t	\N	7	11
23	2013-11-19 20:49:43.96384+01	2013-11-19 20:49:43.963847+01	t	\N	8	219
24	2013-11-19 20:49:43.969544+01	2013-11-19 20:49:43.969551+01	t	\N	8	126
25	2013-11-19 20:49:43.975147+01	2013-11-19 20:49:43.975155+01	t	\N	8	46
26	2013-11-19 20:49:43.980919+01	2013-11-19 20:49:43.980926+01	t	\N	8	107
27	2013-11-19 20:49:43.995805+01	2013-11-19 20:49:43.995819+01	t	\N	9	96
28	2013-11-19 20:49:44.000134+01	2013-11-19 20:49:44.00014+01	t	\N	9	2
29	2013-11-19 20:49:44.004116+01	2013-11-19 20:49:44.004123+01	t	\N	9	95
30	2013-11-19 20:49:44.010836+01	2013-11-19 20:49:44.010843+01	t	\N	10	101
31	2013-11-19 20:49:44.014794+01	2013-11-19 20:49:44.014801+01	t	\N	10	64
32	2013-11-19 20:49:44.018742+01	2013-11-19 20:49:44.01875+01	t	\N	10	65
33	2013-11-19 20:49:44.025118+01	2013-11-19 20:49:44.025125+01	t	\N	11	59
34	2013-11-19 20:49:44.029038+01	2013-11-19 20:49:44.029045+01	t	\N	11	190
35	2013-11-19 20:49:44.036124+01	2013-11-19 20:49:44.036137+01	t	\N	11	116
36	2013-11-19 20:49:44.050129+01	2013-11-19 20:49:44.050142+01	t	\N	24	221
37	2013-11-19 20:49:44.058655+01	2013-11-19 20:49:44.058666+01	t	\N	24	34
38	2013-11-19 20:49:44.067065+01	2013-11-19 20:49:44.067077+01	t	\N	24	147
39	2013-11-19 20:49:44.075163+01	2013-11-19 20:49:44.075175+01	t	\N	24	173
40	2013-11-19 20:49:44.083887+01	2013-11-19 20:49:44.0839+01	t	\N	24	83
41	2013-11-19 20:49:44.092706+01	2013-11-19 20:49:44.092718+01	t	\N	24	48
42	2013-11-19 20:49:44.10154+01	2013-11-19 20:49:44.101553+01	t	\N	24	82
43	2013-11-19 20:49:44.111113+01	2013-11-19 20:49:44.111125+01	t	\N	24	76
44	2013-11-19 20:49:44.120067+01	2013-11-19 20:49:44.120079+01	t	\N	24	41
45	2013-11-19 20:49:44.129094+01	2013-11-19 20:49:44.129106+01	t	\N	24	176
46	2013-11-19 20:49:44.142467+01	2013-11-19 20:49:44.142475+01	t	\N	12	142
47	2013-11-19 20:49:44.14637+01	2013-11-19 20:49:44.146377+01	t	\N	12	180
48	2013-11-19 20:49:44.15032+01	2013-11-19 20:49:44.150327+01	t	\N	12	18
49	2013-11-19 20:49:44.156651+01	2013-11-19 20:49:44.156657+01	t	\N	13	121
50	2013-11-19 20:49:44.160805+01	2013-11-19 20:49:44.16081+01	t	\N	13	74
51	2013-11-19 20:49:44.164742+01	2013-11-19 20:49:44.164747+01	t	\N	13	222
52	2013-11-19 20:49:44.172206+01	2013-11-19 20:49:44.172218+01	t	\N	13	72
53	2013-11-19 20:49:44.181406+01	2013-11-19 20:49:44.181418+01	t	\N	13	197
54	2013-11-19 20:49:44.194283+01	2013-11-19 20:49:44.194296+01	t	\N	14	128
55	2013-11-19 20:49:44.203414+01	2013-11-19 20:49:44.203427+01	t	\N	14	138
56	2013-11-19 20:49:44.213546+01	2013-11-19 20:49:44.213561+01	t	\N	14	225
57	2013-11-19 20:49:44.227725+01	2013-11-19 20:49:44.227737+01	t	\N	15	8
58	2013-11-19 20:49:44.236962+01	2013-11-19 20:49:44.236967+01	t	\N	15	144
59	2013-11-19 20:49:44.2458+01	2013-11-19 20:49:44.245811+01	t	\N	15	103
60	2013-11-19 20:49:44.2547+01	2013-11-19 20:49:44.254711+01	t	\N	15	52
61	2013-11-19 20:49:44.269359+01	2013-11-19 20:49:44.269374+01	t	\N	16	192
62	2013-11-19 20:49:44.275096+01	2013-11-19 20:49:44.275102+01	t	\N	16	196
63	2013-11-19 20:49:44.279769+01	2013-11-19 20:49:44.279775+01	t	\N	16	93
64	2013-11-19 20:49:44.283743+01	2013-11-19 20:49:44.283749+01	t	\N	16	7
65	2013-11-19 20:49:44.289355+01	2013-11-19 20:49:44.289362+01	t	\N	17	219
66	2013-11-19 20:49:44.293358+01	2013-11-19 20:49:44.293364+01	t	\N	17	126
67	2013-11-19 20:49:44.297029+01	2013-11-19 20:49:44.297035+01	t	\N	17	46
68	2013-11-19 20:49:44.300818+01	2013-11-19 20:49:44.300824+01	t	\N	17	9
69	2013-11-19 20:49:44.305026+01	2013-11-19 20:49:44.305031+01	t	\N	17	107
70	2013-11-19 20:49:44.311618+01	2013-11-19 20:49:44.311624+01	t	\N	25	43
71	2013-11-19 20:49:44.315996+01	2013-11-19 20:49:44.316001+01	t	\N	25	77
72	2013-11-19 20:49:44.32029+01	2013-11-19 20:49:44.320296+01	t	\N	25	55
73	2013-11-19 20:49:44.325044+01	2013-11-19 20:49:44.32505+01	t	\N	25	102
74	2013-11-19 20:49:44.332291+01	2013-11-19 20:49:44.332298+01	t	\N	18	171
75	2013-11-19 20:49:44.337972+01	2013-11-19 20:49:44.337979+01	t	\N	18	79
76	2013-11-19 20:49:44.343691+01	2013-11-19 20:49:44.343699+01	t	\N	18	49
77	2013-11-19 20:49:44.352413+01	2013-11-19 20:49:44.352421+01	t	\N	19	191
78	2013-11-19 20:49:44.358098+01	2013-11-19 20:49:44.358106+01	t	\N	19	226
79	2013-11-19 20:49:44.364386+01	2013-11-19 20:49:44.364394+01	t	\N	19	6
80	2013-11-19 20:49:44.370373+01	2013-11-19 20:49:44.370382+01	t	\N	19	208
81	2013-11-19 20:49:44.376435+01	2013-11-19 20:49:44.376443+01	t	\N	19	81
82	2013-11-19 20:49:44.382654+01	2013-11-19 20:49:44.382663+01	t	\N	19	35
83	2013-11-19 20:49:44.389814+01	2013-11-19 20:49:44.389822+01	t	\N	19	53
84	2013-11-19 20:49:44.399794+01	2013-11-19 20:49:44.399804+01	t	\N	20	58
85	2013-11-19 20:49:44.405895+01	2013-11-19 20:49:44.405901+01	t	\N	20	68
86	2013-11-19 20:49:44.412002+01	2013-11-19 20:49:44.412008+01	t	\N	21	120
87	2013-11-19 20:49:44.415632+01	2013-11-19 20:49:44.415638+01	t	\N	21	92
88	2013-11-19 20:49:44.419418+01	2013-11-19 20:49:44.419425+01	t	\N	21	186
89	2013-11-19 20:49:44.425388+01	2013-11-19 20:49:44.425395+01	t	\N	22	123
90	2013-11-19 20:49:44.428976+01	2013-11-19 20:49:44.428982+01	t	\N	22	74
91	2013-11-19 20:49:44.43256+01	2013-11-19 20:49:44.432567+01	t	\N	22	85
92	2013-11-19 20:49:44.436622+01	2013-11-19 20:49:44.436628+01	t	\N	22	72
93	2013-11-19 20:49:44.440374+01	2013-11-19 20:49:44.44038+01	t	\N	22	3
94	2013-11-19 20:49:44.44588+01	2013-11-19 20:49:44.445886+01	t	\N	23	112
95	2013-11-19 20:49:44.449845+01	2013-11-19 20:49:44.449852+01	t	\N	23	209
96	2013-11-19 20:49:44.453677+01	2013-11-19 20:49:44.453684+01	t	\N	23	224
97	2013-11-19 20:49:44.457821+01	2013-11-19 20:49:44.457825+01	t	\N	23	160
98	2013-11-19 20:49:44.461867+01	2013-11-19 20:49:44.461871+01	t	\N	23	152
99	2013-11-19 20:49:44.465862+01	2013-11-19 20:49:44.46587+01	t	\N	23	189
100	2013-11-19 20:49:44.470216+01	2013-11-19 20:49:44.470222+01	t	\N	23	162
101	2013-11-19 20:49:44.47564+01	2013-11-19 20:49:44.475646+01	t	\N	23	90
102	2013-11-19 20:49:44.480486+01	2013-11-19 20:49:44.480492+01	t	\N	23	60
103	2013-11-19 20:49:44.485256+01	2013-11-19 20:49:44.485262+01	t	\N	23	113
104	2013-11-19 20:49:44.490225+01	2013-11-19 20:49:44.490231+01	t	\N	23	86
105	2013-11-19 20:49:44.495789+01	2013-11-19 20:49:44.495796+01	t	\N	23	216
106	2013-11-19 20:49:44.501248+01	2013-11-19 20:49:44.501256+01	t	\N	23	104
107	2013-11-19 20:49:44.509939+01	2013-11-19 20:49:44.509947+01	t	\N	26	167
108	2013-11-19 20:49:44.516504+01	2013-11-19 20:49:44.516513+01	t	\N	26	92
109	2013-11-19 20:49:44.526009+01	2013-11-19 20:49:44.526017+01	t	\N	28	174
110	2013-11-19 20:49:44.532377+01	2013-11-19 20:49:44.532385+01	t	\N	28	97
111	2013-11-19 20:49:44.539628+01	2013-11-19 20:49:44.539639+01	t	\N	28	191
112	2013-11-19 20:49:44.5468+01	2013-11-19 20:49:44.546811+01	t	\N	28	15
113	2013-11-19 20:49:44.553664+01	2013-11-19 20:49:44.553675+01	t	\N	28	16
114	2013-11-19 20:49:44.560989+01	2013-11-19 20:49:44.560999+01	t	\N	28	17
115	2013-11-19 20:49:44.57259+01	2013-11-19 20:49:44.572602+01	t	\N	29	92
116	2013-11-19 20:49:44.576374+01	2013-11-19 20:49:44.57638+01	t	\N	29	213
117	2013-11-19 20:49:44.582515+01	2013-11-19 20:49:44.582522+01	t	\N	30	182
118	2013-11-19 20:49:44.588052+01	2013-11-19 20:49:44.588058+01	t	\N	31	183
119	2013-11-19 20:49:44.591646+01	2013-11-19 20:49:44.591651+01	t	\N	31	175
120	2013-11-19 20:49:44.595831+01	2013-11-19 20:49:44.595838+01	t	\N	31	151
121	2013-11-19 20:49:44.599907+01	2013-11-19 20:49:44.599912+01	t	\N	31	153
122	2013-11-19 20:49:44.603985+01	2013-11-19 20:49:44.603989+01	t	\N	31	3
123	2013-11-19 20:49:44.607629+01	2013-11-19 20:49:44.607632+01	t	\N	31	197
124	2013-11-19 20:49:44.612318+01	2013-11-19 20:49:44.612324+01	t	\N	31	220
125	2013-11-19 20:49:44.616792+01	2013-11-19 20:49:44.616798+01	t	\N	31	207
126	2013-11-19 20:49:44.621387+01	2013-11-19 20:49:44.621393+01	t	\N	31	47
127	2013-11-19 20:49:44.629355+01	2013-11-19 20:49:44.629361+01	t	\N	71	140
128	2013-11-19 20:49:44.634304+01	2013-11-19 20:49:44.634311+01	t	\N	71	200
129	2013-11-19 20:49:44.639492+01	2013-11-19 20:49:44.639498+01	t	\N	71	84
130	2013-11-19 20:49:44.644796+01	2013-11-19 20:49:44.644803+01	t	\N	71	66
131	2013-11-19 20:49:44.653957+01	2013-11-19 20:49:44.653965+01	t	\N	32	157
132	2013-11-19 20:49:44.662718+01	2013-11-19 20:49:44.662726+01	t	\N	33	158
133	2013-11-19 20:49:44.669549+01	2013-11-19 20:49:44.669557+01	t	\N	33	5
134	2013-11-19 20:49:44.678883+01	2013-11-19 20:49:44.678892+01	t	\N	34	130
135	2013-11-19 20:49:44.685666+01	2013-11-19 20:49:44.685675+01	t	\N	34	100
136	2013-11-19 20:49:44.695199+01	2013-11-19 20:49:44.695204+01	t	\N	35	141
137	2013-11-19 20:49:44.70258+01	2013-11-19 20:49:44.70259+01	t	\N	35	27
138	2013-11-19 20:49:44.709269+01	2013-11-19 20:49:44.709275+01	t	\N	37	88
139	2013-11-19 20:49:44.715121+01	2013-11-19 20:49:44.715127+01	t	\N	38	219
140	2013-11-19 20:49:44.718792+01	2013-11-19 20:49:44.718798+01	t	\N	38	46
141	2013-11-19 20:49:44.722475+01	2013-11-19 20:49:44.722481+01	t	\N	38	107
142	2013-11-19 20:49:44.728335+01	2013-11-19 20:49:44.728342+01	t	\N	39	124
143	2013-11-19 20:49:44.731998+01	2013-11-19 20:49:44.732004+01	t	\N	39	44
144	2013-11-19 20:49:44.735684+01	2013-11-19 20:49:44.735691+01	t	\N	39	125
145	2013-11-19 20:49:44.739305+01	2013-11-19 20:49:44.739311+01	t	\N	39	3
146	2013-11-19 20:49:44.74518+01	2013-11-19 20:49:44.745186+01	t	\N	40	40
147	2013-11-19 20:49:44.748846+01	2013-11-19 20:49:44.748853+01	t	\N	40	202
148	2013-11-19 20:49:44.752854+01	2013-11-19 20:49:44.752859+01	t	\N	40	10
149	2013-11-19 20:49:44.75696+01	2013-11-19 20:49:44.756965+01	t	\N	40	178
150	2013-11-19 20:49:44.762868+01	2013-11-19 20:49:44.762873+01	t	\N	41	199
151	2013-11-19 20:49:44.767054+01	2013-11-19 20:49:44.76706+01	t	\N	41	25
152	2013-11-19 20:49:44.774297+01	2013-11-19 20:49:44.774303+01	t	\N	42	71
153	2013-11-19 20:49:44.77917+01	2013-11-19 20:49:44.779176+01	t	\N	42	168
154	2013-11-19 20:49:44.784325+01	2013-11-19 20:49:44.784332+01	t	\N	42	4
155	2013-11-19 20:49:44.790262+01	2013-11-19 20:49:44.79027+01	t	\N	42	134
156	2013-11-19 20:49:44.798835+01	2013-11-19 20:49:44.798843+01	t	\N	43	134
157	2013-11-19 20:49:44.804862+01	2013-11-19 20:49:44.80487+01	t	\N	43	1
158	2013-11-19 20:49:44.811615+01	2013-11-19 20:49:44.811623+01	t	\N	43	4
159	2013-11-19 20:49:44.822214+01	2013-11-19 20:49:44.822224+01	t	\N	44	78
160	2013-11-19 20:49:44.833195+01	2013-11-19 20:49:44.833205+01	t	\N	45	115
161	2013-11-19 20:49:44.843566+01	2013-11-19 20:49:44.843576+01	t	\N	46	188
162	2013-11-19 20:49:44.850392+01	2013-11-19 20:49:44.850403+01	t	\N	46	221
163	2013-11-19 20:49:44.858421+01	2013-11-19 20:49:44.858432+01	t	\N	46	63
164	2013-11-19 20:49:44.863243+01	2013-11-19 20:49:44.863249+01	t	\N	46	89
165	2013-11-19 20:49:44.866981+01	2013-11-19 20:49:44.866987+01	t	\N	46	217
166	2013-11-19 20:49:44.873057+01	2013-11-19 20:49:44.873063+01	t	\N	47	232
167	2013-11-19 20:49:44.876726+01	2013-11-19 20:49:44.876733+01	t	\N	47	119
168	2013-11-19 20:49:44.882555+01	2013-11-19 20:49:44.882561+01	t	\N	48	228
169	2013-11-19 20:49:44.886318+01	2013-11-19 20:49:44.886325+01	t	\N	48	62
170	2013-11-19 20:49:44.892997+01	2013-11-19 20:49:44.893004+01	t	\N	49	195
171	2013-11-19 20:49:44.896751+01	2013-11-19 20:49:44.896756+01	t	\N	49	170
172	2013-11-19 20:49:44.902369+01	2013-11-19 20:49:44.902376+01	t	\N	50	118
173	2013-11-19 20:49:44.906524+01	2013-11-19 20:49:44.906529+01	t	\N	50	161
174	2013-11-19 20:49:44.910403+01	2013-11-19 20:49:44.910408+01	t	\N	50	198
175	2013-11-19 20:49:44.914185+01	2013-11-19 20:49:44.91419+01	t	\N	50	3
176	2013-11-19 20:49:44.918053+01	2013-11-19 20:49:44.918058+01	t	\N	50	156
177	2013-11-19 20:49:44.922921+01	2013-11-19 20:49:44.922927+01	t	\N	50	42
178	2013-11-19 20:49:44.929529+01	2013-11-19 20:49:44.929534+01	t	\N	51	20
179	2013-11-19 20:49:44.934097+01	2013-11-19 20:49:44.934103+01	t	\N	51	131
180	2013-11-19 20:49:44.941878+01	2013-11-19 20:49:44.941885+01	t	\N	82	155
181	2013-11-19 20:49:44.949754+01	2013-11-19 20:49:44.949762+01	t	\N	52	194
182	2013-11-19 20:49:44.958407+01	2013-11-19 20:49:44.958415+01	t	\N	53	122
183	2013-11-19 20:49:44.964062+01	2013-11-19 20:49:44.96407+01	t	\N	53	51
184	2013-11-19 20:49:44.973708+01	2013-11-19 20:49:44.973717+01	t	\N	54	223
185	2013-11-19 20:49:44.979789+01	2013-11-19 20:49:44.979797+01	t	\N	54	184
186	2013-11-19 20:49:44.985976+01	2013-11-19 20:49:44.985984+01	t	\N	54	229
187	2013-11-19 20:49:44.996421+01	2013-11-19 20:49:44.99643+01	t	\N	55	23
188	2013-11-19 20:49:45.005989+01	2013-11-19 20:49:45.005996+01	t	\N	56	28
189	2013-11-19 20:49:45.012042+01	2013-11-19 20:49:45.012048+01	t	\N	83	19
190	2013-11-19 20:49:45.017775+01	2013-11-19 20:49:45.017782+01	t	\N	58	54
191	2013-11-19 20:49:45.023773+01	2013-11-19 20:49:45.02378+01	t	\N	59	111
192	2013-11-19 20:49:45.027471+01	2013-11-19 20:49:45.027477+01	t	\N	59	108
193	2013-11-19 20:49:45.033043+01	2013-11-19 20:49:45.033049+01	t	\N	60	133
194	2013-11-19 20:49:45.037115+01	2013-11-19 20:49:45.037122+01	t	\N	60	109
195	2013-11-19 20:49:45.042639+01	2013-11-19 20:49:45.042646+01	t	\N	62	178
196	2013-11-19 20:49:45.046203+01	2013-11-19 20:49:45.046209+01	t	\N	62	40
197	2013-11-19 20:49:45.050247+01	2013-11-19 20:49:45.050254+01	t	\N	62	149
198	2013-11-19 20:49:45.055843+01	2013-11-19 20:49:45.055848+01	t	\N	63	105
199	2013-11-19 20:49:45.060016+01	2013-11-19 20:49:45.060021+01	t	\N	63	137
200	2013-11-19 20:49:45.063787+01	2013-11-19 20:49:45.063791+01	t	\N	63	215
201	2013-11-19 20:49:45.068119+01	2013-11-19 20:49:45.068125+01	t	\N	63	212
202	2013-11-19 20:49:45.073535+01	2013-11-19 20:49:45.073541+01	t	\N	63	164
203	2013-11-19 20:49:45.078134+01	2013-11-19 20:49:45.07814+01	t	\N	63	50
204	2013-11-19 20:49:45.082921+01	2013-11-19 20:49:45.082928+01	t	\N	63	172
205	2013-11-19 20:49:45.090989+01	2013-11-19 20:49:45.090997+01	t	\N	64	24
206	2013-11-19 20:49:45.099072+01	2013-11-19 20:49:45.099079+01	t	\N	65	181
207	2013-11-19 20:49:45.104655+01	2013-11-19 20:49:45.104663+01	t	\N	65	204
208	2013-11-19 20:49:45.110757+01	2013-11-19 20:49:45.110764+01	t	\N	65	210
209	2013-11-19 20:49:45.11972+01	2013-11-19 20:49:45.119728+01	t	\N	66	221
210	2013-11-19 20:49:45.125744+01	2013-11-19 20:49:45.125753+01	t	\N	66	211
211	2013-11-19 20:49:45.132747+01	2013-11-19 20:49:45.132757+01	t	\N	66	148
212	2013-11-19 20:49:45.14301+01	2013-11-19 20:49:45.143019+01	t	\N	67	221
213	2013-11-19 20:49:45.154143+01	2013-11-19 20:49:45.154154+01	t	\N	68	14
214	2013-11-19 20:49:45.163+01	2013-11-19 20:49:45.163006+01	t	\N	69	150
215	2013-11-19 20:49:45.166702+01	2013-11-19 20:49:45.166708+01	t	\N	69	75
216	2013-11-19 20:49:45.170645+01	2013-11-19 20:49:45.170652+01	t	\N	69	38
217	2013-11-19 20:49:45.174427+01	2013-11-19 20:49:45.174434+01	t	\N	69	37
218	2013-11-19 20:49:45.178069+01	2013-11-19 20:49:45.178075+01	t	\N	69	69
219	2013-11-19 20:49:45.18163+01	2013-11-19 20:49:45.181635+01	t	\N	69	26
220	2013-11-19 20:49:45.185716+01	2013-11-19 20:49:45.185722+01	t	\N	69	159
221	2013-11-19 20:49:45.191426+01	2013-11-19 20:49:45.191433+01	t	\N	70	106
222	2013-11-19 20:49:45.197385+01	2013-11-19 20:49:45.197391+01	t	\N	72	143
223	2013-11-19 20:49:45.201048+01	2013-11-19 20:49:45.201054+01	t	\N	72	39
224	2013-11-19 20:49:45.204717+01	2013-11-19 20:49:45.204724+01	t	\N	72	8
225	2013-11-19 20:49:45.211246+01	2013-11-19 20:49:45.211252+01	t	\N	73	140
226	2013-11-19 20:49:45.215433+01	2013-11-19 20:49:45.215439+01	t	\N	73	31
227	2013-11-19 20:49:45.219361+01	2013-11-19 20:49:45.219366+01	t	\N	73	67
228	2013-11-19 20:49:45.223571+01	2013-11-19 20:49:45.223577+01	t	\N	73	66
229	2013-11-19 20:49:45.230942+01	2013-11-19 20:49:45.230948+01	t	\N	74	154
230	2013-11-19 20:49:45.237955+01	2013-11-19 20:49:45.237961+01	t	\N	75	187
231	2013-11-19 20:49:45.243197+01	2013-11-19 20:49:45.243203+01	t	\N	75	136
232	2013-11-19 20:49:45.24845+01	2013-11-19 20:49:45.248455+01	t	\N	75	163
233	2013-11-19 20:49:45.256853+01	2013-11-19 20:49:45.256861+01	t	\N	76	22
234	2013-11-19 20:49:45.26239+01	2013-11-19 20:49:45.262397+01	t	\N	76	110
235	2013-11-19 20:49:45.268078+01	2013-11-19 20:49:45.268086+01	t	\N	76	70
236	2013-11-19 20:49:45.279386+01	2013-11-19 20:49:45.279394+01	t	\N	77	185
237	2013-11-19 20:49:45.285971+01	2013-11-19 20:49:45.285981+01	t	\N	77	80
238	2013-11-19 20:49:45.296627+01	2013-11-19 20:49:45.296644+01	t	\N	78	214
239	2013-11-19 20:49:45.303351+01	2013-11-19 20:49:45.30336+01	t	\N	78	227
240	2013-11-19 20:49:45.311183+01	2013-11-19 20:49:45.311193+01	t	\N	78	205
241	2013-11-19 20:49:45.320048+01	2013-11-19 20:49:45.320055+01	t	\N	79	214
242	2013-11-19 20:49:45.323758+01	2013-11-19 20:49:45.323763+01	t	\N	79	179
243	2013-11-19 20:49:45.327457+01	2013-11-19 20:49:45.327463+01	t	\N	79	117
244	2013-11-19 20:49:45.333973+01	2013-11-19 20:49:45.33398+01	t	\N	80	21
245	2013-11-19 20:49:45.339659+01	2013-11-19 20:49:45.339666+01	t	\N	81	135
246	2013-11-19 20:49:45.343286+01	2013-11-19 20:49:45.343291+01	t	\N	81	201
247	2013-11-19 20:49:45.347494+01	2013-11-19 20:49:45.347501+01	t	\N	81	45
248	2013-11-19 20:49:45.353182+01	2013-11-19 20:49:45.353189+01	t	\N	84	19
249	2013-11-19 20:49:45.359045+01	2013-11-19 20:49:45.359052+01	t	\N	85	19
250	2013-11-19 20:49:45.364765+01	2013-11-19 20:49:45.364771+01	t	\N	86	201
251	2013-11-19 20:49:45.368788+01	2013-11-19 20:49:45.368793+01	t	\N	86	218
252	2013-11-19 20:49:45.376923+01	2013-11-19 20:49:45.376929+01	t	\N	87	206
253	2013-11-19 20:49:45.383811+01	2013-11-19 20:49:45.383817+01	t	\N	87	212
254	2013-11-19 20:49:45.394041+01	2013-11-19 20:49:45.394049+01	t	\N	88	157
255	2013-11-19 20:49:45.403151+01	2013-11-19 20:49:45.403162+01	t	\N	89	10
256	2013-11-19 20:49:45.412503+01	2013-11-19 20:49:45.41251+01	t	\N	90	166
257	2013-11-19 20:49:45.421416+01	2013-11-19 20:49:45.421424+01	t	\N	91	91
258	2013-11-19 20:49:45.426981+01	2013-11-19 20:49:45.426989+01	t	\N	91	129
259	2013-11-19 20:49:45.437604+01	2013-11-19 20:49:45.437618+01	t	\N	92	114
260	2013-11-19 20:49:45.450395+01	2013-11-19 20:49:45.450407+01	t	\N	93	33
261	2013-11-19 20:49:45.464069+01	2013-11-19 20:49:45.464082+01	t	\N	94	169
262	2013-11-19 20:49:45.474934+01	2013-11-19 20:49:45.474941+01	t	\N	95	33
263	2013-11-19 20:49:45.481736+01	2013-11-19 20:49:45.481743+01	t	\N	96	56
264	2013-11-19 20:49:45.487518+01	2013-11-19 20:49:45.487525+01	t	\N	97	127
265	2013-11-19 20:49:45.493515+01	2013-11-19 20:49:45.493522+01	t	\N	98	145
266	2013-11-19 20:49:45.499129+01	2013-11-19 20:49:45.499135+01	t	\N	99	165
267	2013-11-19 20:49:45.505113+01	2013-11-19 20:49:45.505119+01	t	\N	100	61
268	2013-11-19 20:49:45.508835+01	2013-11-19 20:49:45.508842+01	t	\N	100	193
269	2013-11-19 20:49:45.51592+01	2013-11-19 20:49:45.51593+01	t	\N	101	13
\.


--
-- Name: pairsource_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pairsource_pk_seq', 269, true);


--
-- Data for Name: parameter; Type: TABLE DATA; Schema: public; Owner: -
--

COPY parameter (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, version) FROM stdin;
1	2013-11-19 20:49:32.949501+01	2013-11-19 20:49:32.949512+01	t	\N	custom	1	comparative	\N	\N	1
2	2013-11-19 20:49:32.951289+01	2013-11-19 20:49:32.951301+01	t	\N	custom	2	superlative	\N	\N	1
3	2013-11-19 20:49:32.952106+01	2013-11-19 20:49:32.952114+01	t	\N	custom	3	adjectivizer	\N	\N	1
4	2013-11-19 20:49:32.952817+01	2013-11-19 20:49:32.952826+01	t	\N	custom	4	adverbializer	\N	\N	1
5	2013-11-19 20:49:32.953597+01	2013-11-19 20:49:32.953606+01	t	\N	custom	5	clause-level TAM	\N	\N	1
6	2013-11-19 20:49:32.954368+01	2013-11-19 20:49:32.954376+01	t	\N	custom	6	clause linking	\N	\N	1
7	2013-11-19 20:49:32.955063+01	2013-11-19 20:49:32.95507+01	t	\N	custom	7	case: dative	\N	\N	1
8	2013-11-19 20:49:32.955755+01	2013-11-19 20:49:32.955763+01	t	\N	custom	8	case: ergative	\N	\N	1
9	2013-11-19 20:49:32.956642+01	2013-11-19 20:49:32.95665+01	t	\N	custom	9	case: non-locative peripheral case	\N	\N	1
10	2013-11-19 20:49:32.957425+01	2013-11-19 20:49:32.957433+01	t	\N	custom	10	case: locative	\N	\N	1
11	2013-11-19 20:49:32.9583+01	2013-11-19 20:49:32.958311+01	t	\N	custom	11	case: comparative	\N	\N	1
12	2013-11-19 20:49:32.959223+01	2013-11-19 20:49:32.959234+01	t	\N	custom	12	gender (human)	\N	\N	1
13	2013-11-19 20:49:32.960065+01	2013-11-19 20:49:32.960074+01	t	\N	custom	13	noun class (inanimate)	\N	\N	1
14	2013-11-19 20:49:32.960791+01	2013-11-19 20:49:32.960799+01	t	\N	custom	14	diminutive	\N	\N	1
15	2013-11-19 20:49:32.96146+01	2013-11-19 20:49:32.961468+01	t	\N	custom	15	augmentative	\N	\N	1
16	2013-11-19 20:49:32.962133+01	2013-11-19 20:49:32.962141+01	t	\N	custom	16	definite/indefinite	\N	\N	1
17	2013-11-19 20:49:32.9629+01	2013-11-19 20:49:32.962908+01	t	\N	custom	17	topic	\N	\N	1
18	2013-11-19 20:49:32.963641+01	2013-11-19 20:49:32.963649+01	t	\N	custom	18	focus	\N	\N	1
19	2013-11-19 20:49:32.964408+01	2013-11-19 20:49:32.964416+01	t	\N	custom	19	nominalizer: miscellaneous	\N	\N	1
20	2013-11-19 20:49:32.965356+01	2013-11-19 20:49:32.965367+01	t	\N	custom	20	nominalizer: agent	\N	\N	1
21	2013-11-19 20:49:32.966153+01	2013-11-19 20:49:32.966162+01	t	\N	custom	21	nominalizer: abstract	\N	\N	1
22	2013-11-19 20:49:32.966925+01	2013-11-19 20:49:32.966934+01	t	\N	custom	22	nominalizer: social group	\N	\N	1
23	2013-11-19 20:49:32.967688+01	2013-11-19 20:49:32.967696+01	t	\N	custom	23	nominalizer: place name	\N	\N	1
24	2013-11-19 20:49:32.968448+01	2013-11-19 20:49:32.968457+01	t	\N	custom	24	number: plural	\N	\N	1
25	2013-11-19 20:49:32.969226+01	2013-11-19 20:49:32.969234+01	t	\N	custom	25	number: dual	\N	\N	1
26	2013-11-19 20:49:32.969977+01	2013-11-19 20:49:32.969985+01	t	\N	custom	26	number: singular	\N	\N	1
27	2013-11-19 20:49:32.970726+01	2013-11-19 20:49:32.970734+01	t	\N	custom	27	nominal derivation (miscellaneous)	\N	\N	1
28	2013-11-19 20:49:32.971478+01	2013-11-19 20:49:32.971487+01	t	\N	custom	28	privative	\N	\N	1
29	2013-11-19 20:49:32.972312+01	2013-11-19 20:49:32.972322+01	t	\N	custom	29	possessor indexing	\N	\N	1
30	2013-11-19 20:49:32.973166+01	2013-11-19 20:49:32.973177+01	t	\N	custom	30	numeral classifier	\N	\N	1
31	2013-11-19 20:49:32.974002+01	2013-11-19 20:49:32.974013+01	t	\N	custom	31	numeral derivation: ordinals	\N	\N	1
32	2013-11-19 20:49:32.974715+01	2013-11-19 20:49:32.974723+01	t	\N	custom	32	numeral and quantifier derivation	\N	\N	1
33	2013-11-19 20:49:32.975385+01	2013-11-19 20:49:32.975393+01	t	\N	custom	33	valency: passive	\N	\N	1
34	2013-11-19 20:49:32.976163+01	2013-11-19 20:49:32.976174+01	t	\N	custom	34	valency: causative	\N	\N	1
35	2013-11-19 20:49:32.977036+01	2013-11-19 20:49:32.977046+01	t	\N	custom	35	valency: reflexive	\N	\N	1
36	2013-11-19 20:49:32.977834+01	2013-11-19 20:49:32.977845+01	t	\N	custom	36	valency: applicative	\N	\N	1
37	2013-11-19 20:49:32.978638+01	2013-11-19 20:49:32.978648+01	t	\N	custom	37	valency: reciprocal	\N	\N	1
38	2013-11-19 20:49:32.979429+01	2013-11-19 20:49:32.97944+01	t	\N	custom	38	verbal TAM	\N	\N	1
39	2013-11-19 20:49:32.980293+01	2013-11-19 20:49:32.980303+01	t	\N	custom	39	verbal derivation (miscellaneous)	\N	\N	1
40	2013-11-19 20:49:32.981161+01	2013-11-19 20:49:32.981169+01	t	\N	custom	40	subject/object indexing	\N	\N	1
41	2013-11-19 20:49:32.981968+01	2013-11-19 20:49:32.98198+01	t	\N	custom	41	verbalizer	\N	\N	1
42	2013-11-19 20:49:32.982822+01	2013-11-19 20:49:32.982831+01	t	\N	custom	42	relativizer/subordinator	\N	\N	1
43	2013-11-19 20:49:32.983597+01	2013-11-19 20:49:32.983606+01	t	\N	custom	43	verbal negation	\N	\N	1
\.


--
-- Data for Name: parameter_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY parameter_data (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Data for Name: parameter_data_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY parameter_data_history (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Name: parameter_data_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('parameter_data_history_pk_seq', 1, false);


--
-- Name: parameter_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('parameter_data_pk_seq', 1, false);


--
-- Data for Name: parameter_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY parameter_files (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Data for Name: parameter_files_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY parameter_files_history (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Name: parameter_files_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('parameter_files_history_pk_seq', 1, false);


--
-- Name: parameter_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('parameter_files_pk_seq', 1, false);


--
-- Data for Name: parameter_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY parameter_history (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, version) FROM stdin;
\.


--
-- Name: parameter_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('parameter_history_pk_seq', 1, false);


--
-- Name: parameter_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('parameter_pk_seq', 43, true);


--
-- Data for Name: sentence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sentence (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, analyzed, gloss, type, source, comment, original_script, xhtml, markup_text, markup_analyzed, markup_gloss, markup_comment, language_pk, version) FROM stdin;
\.


--
-- Data for Name: sentence_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sentence_data (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Data for Name: sentence_data_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sentence_data_history (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Name: sentence_data_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sentence_data_history_pk_seq', 1, false);


--
-- Name: sentence_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sentence_data_pk_seq', 1, false);


--
-- Data for Name: sentence_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sentence_files (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Data for Name: sentence_files_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sentence_files_history (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Name: sentence_files_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sentence_files_history_pk_seq', 1, false);


--
-- Name: sentence_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sentence_files_pk_seq', 1, false);


--
-- Data for Name: sentence_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sentence_history (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, analyzed, gloss, type, source, comment, original_script, xhtml, markup_text, markup_analyzed, markup_gloss, markup_comment, language_pk, version) FROM stdin;
\.


--
-- Name: sentence_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sentence_history_pk_seq', 1, false);


--
-- Name: sentence_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sentence_pk_seq', 1, false);


--
-- Data for Name: sentencereference; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sentencereference (pk, created, updated, active, jsondata, key, description, sentence_pk, source_pk, version) FROM stdin;
\.


--
-- Data for Name: sentencereference_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sentencereference_history (pk, created, updated, active, jsondata, key, description, sentence_pk, source_pk, version) FROM stdin;
\.


--
-- Name: sentencereference_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sentencereference_history_pk_seq', 1, false);


--
-- Name: sentencereference_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sentencereference_pk_seq', 1, false);


--
-- Data for Name: source; Type: TABLE DATA; Schema: public; Owner: -
--

COPY source (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, glottolog_id, google_book_search_id, bibtex_type, author, year, title, type, booktitle, editor, pages, edition, journal, school, address, url, note, number, series, volume, publisher, organization, chapter, howpublished, year_int, startpage_int, pages_int, version) FROM stdin;
1	2013-11-19 20:49:33.181842+01	2013-11-19 20:49:33.181848+01	t	{}	base	adelaarmalagasy1995	Adelaar, Alexander and Vérin, Pierre 1995	Malagasy	\N	\N	\N	incollection	Adelaar, Alexander and Vérin, Pierre	1995	Malagasy	\N	Comparative Austronesian Dictionary An Introduction to Austronesian Studies	Tryon, Darrell T.	393–406	\N	\N	\N	Berlin, New York	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
2	2013-11-19 20:49:33.183651+01	2013-11-19 20:49:33.183656+01	t	{}	base	urelandrussian2003	Malchukov, Andrej L. 2003	Russian interference in Tungusic languages in an areal-typological perspective	\N	\N	\N	incollection	Malchukov, Andrej L.	2003	Russian interference in Tungusic languages in an areal-typological perspective	\N	Convergence and divergence of European languages	Ureland, Sture	235–251	\N	\N	\N	Berlin	\N	\N	1	Studies in Eurolinguistics	\N	Logos Verlag	\N	\N	\N	\N	\N	\N	1
3	2013-11-19 20:49:33.184551+01	2013-11-19 20:49:33.184555+01	t	{}	base	gardaniborrowing2008	Gardani, Francesco 2008	Borrowing of Inflectional Morphemes in Language Contact	\N	\N	\N	book	Gardani, Francesco	2008	Borrowing of Inflectional Morphemes in Language Contact	\N	\N	\N	\N	\N	\N	\N	Frankfurt/Main	\N	\N	320	European University Studies, Series XXI Linguistics	\N	Peter Lang	\N	\N	\N	\N	\N	\N	1
4	2013-11-19 20:49:33.185394+01	2013-11-19 20:49:33.185398+01	t	{}	base	adelaarmalagasy2012	Adelaar, Alexander 2012	Malagasy Phonological History and Bantu Influence	\N	\N	\N	article	Adelaar, Alexander	2012	Malagasy Phonological History and Bantu Influence	\N	\N	\N	123–159	\N	Oceanic Linguistics	\N	\N	\N	\N	1	\N	51	\N	\N	\N	\N	\N	\N	\N	1
5	2013-11-19 20:49:33.186226+01	2013-11-19 20:49:33.18623+01	t	{}	base	diemzum1971	Diem, Werner 1971	Zum Problem der Personalpronomina -hənne (3.Pl.), -kon (2.Pl.) und-hon (3.Pl.) in den syrisch-libanesischen Dialekten	\N	\N	\N	article	Diem, Werner	1971	Zum Problem der Personalpronomina -hənne (3.Pl.), -kon (2.Pl.) und-hon (3.Pl.) in den syrisch-libanesischen Dialekten	\N	\N	\N	223–230	\N	Zeitschriften der Deutschen Morgenländischen Gesellschaft	\N	\N	\N	\N	2	\N	121	\N	\N	\N	\N	\N	\N	\N	1
6	2013-11-19 20:49:33.187035+01	2013-11-19 20:49:33.187039+01	t	{}	base	lentinoppositions2003	Roth, Arlette 2003	Oppositions aspectives dans le parler arabe de Kormakiti (Chypre). Conservations, tâtonnements, innovations	\N	\N	\N	incollection	Roth, Arlette	2003	Oppositions aspectives dans le parler arabe de Kormakiti (Chypre). Conservations, tâtonnements, innovations	\N	Mélanges David Cohen. Études sur le langage, les langues, les dialectes, les littératures, offertes par ses élèves, ses collègues, ses amis présentées à l'occasion de son quatre-vingtième anniversaire	Lentin, Jérôme and Lonnet, Antoine	595–608	\N	\N	\N	Paris	\N	Textes en français, anglais, italien et arabe Bibliogr. des travaux de David Cohen p. [XXIII]-LII. Références bibliogr. Notes bibliogr. Index Mélanges David Cohen; études sur le langage, les langues, les dialectes, les littératures, offertes par ses élèves, ses collègues, ses amis présentées à l'occasion de son quatre-vingtième anniversaire; textes réunis et éd. par Jérôme Lentin et Antoine Lonnet; [collab.] Aziza Boucherit, Arlette Roth, Catherine Taine-Cheikh, Amor Bencheikh Mélanges David Cohen Etudes sur le langage, les langues, les dialectes, les littératures, offertes par ses élèves, ses collègues, ses amis présentées à l'occasion de son quatre-vingtième anniversaire	\N	\N	\N	Maisonneuve &Larose	\N	\N	\N	\N	\N	\N	1
7	2013-11-19 20:49:33.187789+01	2013-11-19 20:49:33.187793+01	t	{}	base	kayeisraeli2007	Bolozky, Shmuel 2007	Israeli Hebrew Morphology	\N	\N	\N	incollection	Bolozky, Shmuel	2007	Israeli Hebrew Morphology	\N	Morphologies of Asia and Africa	Kaye, Alan S.	283–308	\N	\N	\N	Winona Lake	\N	\N	\N	\N	\N	Eisenbrauns	\N	\N	\N	\N	\N	\N	1
8	2013-11-19 20:49:33.18847+01	2013-11-19 20:49:33.188474+01	t	{}	base	hannsuchumataqu2008	Hannß, Katja 2008	Uchumataqu. The lost language of the Urus of Bolivia. A grammatical description of the language as documented between 1894 and 1952	\N	\N	\N	book	Hannß, Katja	2008	Uchumataqu. The lost language of the Urus of Bolivia. A grammatical description of the language as documented between 1894 and 1952	\N	\N	\N	\N	\N	\N	\N	Leiden	\N	\N	\N	\N	\N	CNWS Publications	\N	\N	\N	\N	\N	\N	1
9	2013-11-19 20:49:33.189286+01	2013-11-19 20:49:33.18929+01	t	{}	base	devriesadaptation1984	de Vries, J.W. 1984	Adaptation of polymorphemic loanwords. The case of words ending in -asi in Indonesian	\N	\N	\N	article	de Vries, J.W.	1984	Adaptation of polymorphemic loanwords. The case of words ending in -asi in Indonesian	\N	\N	\N	476–496	\N	Bijdragen tot de Taal-, Land- en Volkenkunde	\N	\N	http://www.kitlv-journals.nl	\N	4	\N	140	\N	\N	\N	\N	\N	\N	\N	1
10	2013-11-19 20:49:33.19009+01	2013-11-19 20:49:33.190094+01	t	{}	base	petersongrammar2011	Peterson, John 2011	A Grammar of Kharia: A South Munda Language	\N	\N	\N	book	Peterson, John	2011	A Grammar of Kharia: A South Munda Language	\N	\N	\N	\N	\N	\N	\N	Leiden, Boston	\N	\N	1	Brill's Studies in South and Southwest Asian Languages	\N	Brill	\N	\N	\N	\N	\N	\N	1
11	2013-11-19 20:49:33.190873+01	2013-11-19 20:49:33.190876+01	t	{}	base	doerferturkische1967	Doerfer, Gerhard 1967	Türkische Lehnwörter im Tadschikischen	\N	\N	\N	book	Doerfer, Gerhard	1967	Türkische Lehnwörter im Tadschikischen	\N	\N	\N	\N	\N	\N	\N	Wiesbaden	\N	\N	37.3	Abhandlungen für die Kunde des Morgenlandes	\N	Steiner	\N	\N	\N	\N	\N	\N	1
12	2013-11-19 20:49:33.191629+01	2013-11-19 20:49:33.191632+01	t	{}	base	myersscottonlanguage2007	Myers-Scotton, Carol 2007	Language Contact: Why Outsider System Morphemes Resist Transfer	\N	\N	\N	article	Myers-Scotton, Carol	2007	Language Contact: Why Outsider System Morphemes Resist Transfer	\N	\N	\N	21–41	\N	Journal of Language Contact - THEMA	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	1
13	2013-11-19 20:49:33.192325+01	2013-11-19 20:49:33.192329+01	t	{}	base	hillspeaking1986	Hill, Jane H. and Hill, Kenneth C. 1986	Speaking Mexicano: The Dynamics of Syncretic Language in Central Mexico	\N	\N	\N	book	Hill, Jane H. and Hill, Kenneth C.	1986	Speaking Mexicano: The Dynamics of Syncretic Language in Central Mexico	\N	\N	\N	\N	\N	\N	\N	Tucson	\N	\N	\N	\N	\N	University of Arizona Press	\N	\N	\N	\N	\N	\N	1
14	2013-11-19 20:49:33.193043+01	2013-11-19 20:49:33.193046+01	t	{}	base	metzgermorpheme1998	Metzger, Ronald G. 1998	The Morpheme KA- of Carapana (Tucanoan)	\N	\N	\N	article	Metzger, Ronald G.	1998	The Morpheme KA- of Carapana (Tucanoan)	\N	\N	\N	\N	\N	SIL Electronic Working Papers	\N	\N	\N	\N	\N	\N	1998-003	\N	\N	\N	\N	\N	\N	\N	1
15	2013-11-19 20:49:33.193718+01	2013-11-19 20:49:33.193721+01	t	{}	base	csatoiranian2005	Bulut, Christiane 2005	Iranian influence on Sonqor Turkic	\N	\N	\N	incollection	Bulut, Christiane	2005	Iranian influence on Sonqor Turkic	\N	Linguistic convergence and areal diffusion: case studies from Iranian, Semitic and Turkic	Csató, Éva Ágnes and Isaksson, Bo and Jahani, Carina	241–270	\N	\N	\N	Abington, New York	\N	\N	\N	\N	\N	RoutledgeCurzon	\N	\N	\N	\N	\N	\N	1
16	2013-11-19 20:49:33.194403+01	2013-11-19 20:49:33.194406+01	t	{}	base	bulutturkic	Bulut, Christiane nd	Turkic varieties of West Iran and Iraq. Representatives of a South Oghuz dialect group?	\N	\N	\N	unpublished	Bulut, Christiane	\N	Turkic varieties of West Iran and Iraq. Representatives of a South Oghuz dialect group?	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
17	2013-11-19 20:49:33.195093+01	2013-11-19 20:49:33.195096+01	t	{}	base	blaumanuel1980	Blau, Joyce 1980	Manuel de kurde (dialecte sorani): grammaire, textes de lecture, vocabulaire kurde-français et français-kurde	\N	\N	\N	book	Blau, Joyce	1980	Manuel de kurde (dialecte sorani): grammaire, textes de lecture, vocabulaire kurde-français et français-kurde	\N	\N	\N	\N	\N	\N	\N	Paris	\N	\N	\N	\N	\N	Klincksieck	\N	\N	\N	\N	\N	\N	1
18	2013-11-19 20:49:33.195771+01	2013-11-19 20:49:33.195774+01	t	{}	base	kayebilin2007	Appleyard, David L. 2007	Bilin Morphology	\N	\N	\N	incollection	Appleyard, David L.	2007	Bilin Morphology	\N	Morphologies of Asia and Africa	Kaye, Alan S.	481–504	\N	\N	\N	Winona Lake	\N	\N	\N	\N	\N	Eisenbrauns	\N	\N	\N	\N	\N	\N	1
19	2013-11-19 20:49:33.19645+01	2013-11-19 20:49:33.196453+01	t	{}	base	chamoreauspanish2012	Chamoreau, Claudine 2012	Spanish diminutive markers -ito/-ita in Mesoamerican languages: a challenge for acceptance of gender distinction	\N	\N	\N	incollection	Chamoreau, Claudine	2012	Spanish diminutive markers -ito/-ita in Mesoamerican languages: a challenge for acceptance of gender distinction	\N	Morphologies in Contact	Vanhove, Martine and Stolz, Thomas and Urdze, Aina and Otsuka, Hitomi	71–89	\N	\N	\N	Berlin	\N	\N	10	Studia Typologica	\N	Akademie Verlag	\N	\N	\N	\N	\N	\N	1
20	2013-11-19 20:49:33.197161+01	2013-11-19 20:49:33.197164+01	t	{}	base	sassearvanitika1991	Sasse, Hans-Jürgen 1991	Arvanitika. Die albanischen Sprachreste in Griechenland. Teil 1	\N	\N	\N	book	Sasse, Hans-Jürgen	1991	Arvanitika. Die albanischen Sprachreste in Griechenland. Teil 1	\N	\N	\N	\N	\N	\N	\N	Wiesbaden	\N	\N	\N	\N	\N	Harrassowitz	\N	\N	\N	\N	\N	\N	1
21	2013-11-19 20:49:33.197839+01	2013-11-19 20:49:33.197842+01	t	{}	base	lipinskisemitic1997	Lipiński, Edward 1997	Semitic languages. Outline of a comparative grammar	\N	\N	\N	book	Lipiński, Edward	1997	Semitic languages. Outline of a comparative grammar	\N	\N	\N	\N	\N	\N	\N	Leuven	\N	\N	80	Orientalia Lovaniensia Analecta	\N	Peeters, Departement Oosterse Studies	\N	\N	\N	\N	\N	\N	1
22	2013-11-19 20:49:33.198579+01	2013-11-19 20:49:33.198583+01	t	{}	base	aikhenvaldgrammar2003	Aikhenvald, Alexandra Y. 2003	A Grammar of Tariana, from Northwest Amazonia	\N	\N	\N	book	Aikhenvald, Alexandra Y.	2003	A Grammar of Tariana, from Northwest Amazonia	\N	\N	\N	\N	\N	\N	\N	Cambridge	\N	\N	\N	\N	\N	Cambridge University Press	\N	\N	\N	\N	\N	\N	1
23	2013-11-19 20:49:33.199358+01	2013-11-19 20:49:33.19936+01	t	{}	base	kruspegrammar2004	Kruspe, Nicole 2004	A grammar of Semelai	\N	\N	\N	book	Kruspe, Nicole	2004	A grammar of Semelai	\N	\N	\N	\N	\N	\N	\N	Cambridge	\N	\N	\N	\N	\N	Cambridge University Press	\N	\N	\N	\N	\N	\N	1
24	2013-11-19 20:49:33.200124+01	2013-11-19 20:49:33.200126+01	t	{}	base	dehghanigrammar2000	Dehghani, Yavar 2000	A grammar of Iranian Azari: including comparisons with Persian	\N	\N	\N	book	Dehghani, Yavar	2000	A grammar of Iranian Azari: including comparisons with Persian	\N	\N	\N	\N	\N	\N	\N	Munich	\N	\N	30	LINCOM Studies in Asian Linguistics	\N	LINCOM Europa	\N	\N	\N	\N	\N	\N	1
25	2013-11-19 20:49:33.200928+01	2013-11-19 20:49:33.200931+01	t	{}	base	riionheimohow2002	Riionheimo, Helka 2002	How to Borrow a Bound Morpheme? Evaluating the Status of Structural Interference in a Contact between Closely-related Languages	\N	\N	\N	article	Riionheimo, Helka	2002	How to Borrow a Bound Morpheme? Evaluating the Status of Structural Interference in a Contact between Closely-related Languages	\N	\N	\N	187–217	\N	SKY Journal of Linguistics	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	1
26	2013-11-19 20:49:33.201672+01	2013-11-19 20:49:33.201674+01	t	{}	base	hualdenoun2003	Trask, R.L. 2003	The Noun Phrase: nouns, determiners and modifiers; pronouns and names	\N	\N	\N	incollection	Trask, R.L.	2003	The Noun Phrase: nouns, determiners and modifiers; pronouns and names	\N	A grammar of Basque	Hualde, José Ignacio and Urbina, Jon Ortiz de	113–171	\N	\N	\N	Berlin, New York	\N	\N	26	Mouton Grammar Library	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
27	2013-11-19 20:49:33.202409+01	2013-11-19 20:49:33.202412+01	t	{}	base	evansgrammar1995	Evans, Nicholas D. 1995	A grammar of Kayardild. With historical-comparative notes on Tangkic	\N	\N	\N	book	Evans, Nicholas D.	1995	A grammar of Kayardild. With historical-comparative notes on Tangkic	\N	\N	\N	\N	\N	\N	\N	Berlin	\N	\N	15	Mouton Grammar Library	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
28	2013-11-19 20:49:33.203111+01	2013-11-19 20:49:33.203115+01	t	{}	base	donohuegrammar1999	Donohue, Mark 1999	A grammar of Tukang Besi	\N	\N	\N	book	Donohue, Mark	1999	A grammar of Tukang Besi	\N	\N	\N	\N	\N	\N	\N	Berlin, New York	\N	\N	20	Mouton grammar library	\N	Walter De Gruyter	\N	\N	\N	\N	\N	\N	1
29	2013-11-19 20:49:33.203776+01	2013-11-19 20:49:33.203779+01	t	{}	base	rastorguevaopyt1964	Rastorgueva, Vera Sergeevna 1964	Opyt sravnitel'nogo izučenija tadžikskich govorov	\N	\N	\N	book	Rastorgueva, Vera Sergeevna	1964	Opyt sravnitel'nogo izučenija tadžikskich govorov	\N	\N	\N	\N	\N	\N	\N	Moscow	\N	\N	\N	\N	\N	Nauka	\N	\N	\N	\N	\N	\N	1
30	2013-11-19 20:49:33.204433+01	2013-11-19 20:49:33.204436+01	t	{}	base	seifartbora2011	Seifart, Frank 2011	Bora loans in Resígaro: Massive morphological and little lexical borrowing in a moribund Arawakan language	\N	\N	\N	book	Seifart, Frank	2011	Bora loans in Resígaro: Massive morphological and little lexical borrowing in a moribund Arawakan language	\N	\N	\N	\N	\N	\N	\N	\N	http://www.etnolinguistica.org/mono:2	\N	2	Cadernos de Etnolingüística. Série Monografias	\N	\N	\N	\N	\N	\N	\N	\N	1
31	2013-11-19 20:49:33.205279+01	2013-11-19 20:49:33.205289+01	t	{}	base	dwyeraltaic1992	Dwyer, Arienne M 1992	Altaic elements in the Linxia dialect: contact-induced change on the Yellow River plateau	\N	\N	\N	article	Dwyer, Arienne M	1992	Altaic elements in the Linxia dialect: contact-induced change on the Yellow River plateau	\N	\N	\N	\N	\N	Journal of Chinese Linguistics	\N	\N	http://cup.cuhk.edu.hk/ojs/index.php/JCL/article/viewArticle/1794/0	Language contact between the Hàn and non-Hàn languages of China has often been assumed to be unidirectional (i.e., Hàn  non-Hàn) and limited generally to lexical items, while morphosyntactic interference is believed to be moderate and comparatively recent. However, in the northwestern Chinese dialect of Línxìa, it will be shown below that in fact the opposite is true: the Línxìa dialect consistently retains certain native phonological and lexical features, while undergoing heavy interference in syntax. In this paper three examples illustrating the nature and extent of contact-induced change in the Línxìa dialect are examined. In Section 1 the morphemes for ‘small, little’ of the region’s languages are compared as an illustration of extensive lexicosemantic diffusion resulting in areal convergence. In Section 2 it is concluded that the co-existing markers of the comitative/ instrumental in Línxìa represent two different types of borrowing: one, a calque on a compound numeral of the Mongolic languages of the region, and the other an outright loan from Mongolic of the Proto-Altaic comitative suffix *-lū. Finally, as an example of significant syntactic and phonological reanalysis, in Section 3 the Línxìa postpositional conditional marker -ì is examined. We conclude that this is the result of the combination of certain social and linguistic factors, and that social factors, such as political dominance, may well be the primary determinants of change. These data provide evidence to support a reanalysis of certain universals of language contact.	1	\N	20	\N	\N	\N	\N	\N	\N	\N	1
32	2013-11-19 20:49:33.206389+01	2013-11-19 20:49:33.206399+01	t	{}	base	golovkoaleut1990	Golovko, Evgenij V. and Vakhtin, Nikolai B. 1990	Aleut in Contact: the Copper Island Aleut Enigma	\N	\N	\N	article	Golovko, Evgenij V. and Vakhtin, Nikolai B.	1990	Aleut in Contact: the Copper Island Aleut Enigma	\N	\N	\N	97–125	\N	Acta linguistica Hafniensia	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	1
33	2013-11-19 20:49:33.207348+01	2013-11-19 20:49:33.207357+01	t	{}	base	janhunendagur2003	Tsumagari, Toshiro 2003	Dagur	\N	\N	\N	incollection	Tsumagari, Toshiro	2003	Dagur	\N	The Mongolic languages	Janhunen, Juha	129–153	\N	\N	\N	London	\N	\N	5	Routledge Language Family Series	\N	RoutledgeCurzon	\N	\N	\N	\N	\N	\N	1
34	2013-11-19 20:49:33.2084+01	2013-11-19 20:49:33.208412+01	t	{}	base	kangasmaaminnmari1998	Kangasmaa-Minn, Eeva 1998	Mari	\N	\N	\N	incollection	Kangasmaa-Minn, Eeva	1998	Mari	\N	The Uralic Languages	Abondolo, Daniel	219–248	\N	\N	\N	London	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	1
35	2013-11-19 20:49:33.209474+01	2013-11-19 20:49:33.209483+01	t	{}	base	tsiaperagreek1964	Tsiapera, Maria 1964	Greek Borrowings in the Arabic Dialect of Cyprus	\N	\N	\N	article	Tsiapera, Maria	1964	Greek Borrowings in the Arabic Dialect of Cyprus	\N	\N	\N	124–126	\N	Journal of the American Oriental Society	\N	\N	http://www.jstor.org/stable/597099	ArticleType: research-article / Full publication date: Apr. - Jun., 1964 / Copyright © 1964 American Oriental Society	2	\N	84	\N	\N	\N	\N	\N	\N	\N	1
36	2013-11-19 20:49:33.210446+01	2013-11-19 20:49:33.210455+01	t	{}	base	seifartprinciple2012	Seifart, Frank 2012	The Principle of Morphosyntactic Subsystem Integrity in language contact: Evidence from morphological borrowing in Resígaro (Arawakan)	\N	\N	\N	article	Seifart, Frank	2012	The Principle of Morphosyntactic Subsystem Integrity in language contact: Evidence from morphological borrowing in Resígaro (Arawakan)	\N	\N	\N	471–504	\N	Diachronica	\N	\N	\N	\N	4	\N	29	\N	\N	\N	\N	\N	\N	\N	1
37	2013-11-19 20:49:33.211413+01	2013-11-19 20:49:33.211422+01	t	{}	base	hualdesegmental2003	Hualde, José Ignacio 2003	Segmental phonology	\N	\N	\N	incollection	Hualde, José Ignacio	2003	Segmental phonology	\N	A grammar of Basque	Hualde, José Ignacio and Urbina, Jon Ortiz de	15–65	\N	\N	\N	Berlin, New York	\N	\N	26	Mouton Grammar Library	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
38	2013-11-19 20:49:33.212389+01	2013-11-19 20:49:33.212398+01	t	{}	base	seguramunguialatin1996	Segura Munguía, Santiago and Etxebarria Ayesta, Juan Manuel 1996	Del latín al euskara = Latinetik euskarara	\N	\N	\N	book	Segura Munguía, Santiago and Etxebarria Ayesta, Juan Manuel	1996	Del latín al euskara = Latinetik euskarara	\N	\N	\N	\N	\N	\N	\N	Bilbao	\N	\N	\N	\N	\N	Universidad de Deusto	\N	\N	\N	\N	\N	\N	1
130	2013-11-19 20:49:33.3116+01	2013-11-19 20:49:33.31161+01	t	{}	base	nordhoffcurrent2013	Nordhoff, Sebastian 2013	The current state of Sri Lanka Portuguese	\N	\N	\N	article	Nordhoff, Sebastian	2013	The current state of Sri Lanka Portuguese	\N	\N	\N	425–434	\N	Journal of Pidgin and Creole Languages	\N	\N	\N	\N	2	\N	28	\N	\N	\N	\N	\N	\N	\N	1
39	2013-11-19 20:49:33.213488+01	2013-11-19 20:49:33.213497+01	t	{}	base	wurmquechua1996	Adelaar, Willem F. H. 1996	Quechua, a language of intercultural communication in the Middle Andes	\N	\N	\N	incollection	Adelaar, Willem F. H.	1996	Quechua, a language of intercultural communication in the Middle Andes	\N	Atlas of languages of intercultural communication in the Pacific, Asia and the Americas. Volume 2, Part 1	Wurm, Stephen A. and Mühlhäusler, Peter and Tryon, Darrell T.	1325–1329	\N	\N	\N	Berlin, New York	\N	\N	13	Trends in Linguistics, Documentation Series	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
40	2013-11-19 20:49:33.2147+01	2013-11-19 20:49:33.214711+01	t	{}	base	abbilanguages1997	Abbi, Anvita 1997	Languages in Contact in Jharkhand. A Case of Language Conflation, Language Change and Language Convergence	\N	\N	\N	incollection	Abbi, Anvita	1997	Languages in Contact in Jharkhand. A Case of Language Conflation, Language Change and Language Convergence	\N	Languages of tribal and indigenous peoples of India: the ethnic space	Abbi, Anvita	131–148	\N	\N	\N	Delhi	\N	\N	10	MLBD series in linguistics	\N	Motilal Banarasidass	\N	\N	\N	\N	\N	\N	1
41	2013-11-19 20:49:33.215989+01	2013-11-19 20:49:33.216001+01	t	{}	base	bereczkitschuwaschische1979	Bereczki, Gábor 1979	Tschuwaschische Kasussuffixe im Tscheremissischen	\N	\N	\N	article	Bereczki, Gábor	1979	Tschuwaschische Kasussuffixe im Tscheremissischen	\N	\N	\N	65–69	\N	Veröffentlichungen der Societas Uralo-Altaica	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	\N	\N	\N	1
42	2013-11-19 20:49:33.217121+01	2013-11-19 20:49:33.217129+01	t	{}	base	puscariurumanische1943	Pușcariu, Sextil and Kuen, Heinrich 1943	Die rumänische Sprache, ihr Wesen und ihre volkliche Prägung	\N	\N	\N	book	Pușcariu, Sextil and Kuen, Heinrich	1943	Die rumänische Sprache, ihr Wesen und ihre volkliche Prägung	\N	\N	\N	\N	\N	\N	\N	Leipzig	\N	\N	\N	\N	\N	Otto Harrassowitz	\N	\N	\N	\N	\N	\N	1
43	2013-11-19 20:49:33.218277+01	2013-11-19 20:49:33.218289+01	t	{}	base	noonanchantyal2005	Noonan, Michael and Bhulanja, Ram Prasad 2005	Chantyal Discourses	\N	\N	\N	article	Noonan, Michael and Bhulanja, Ram Prasad	2005	Chantyal Discourses	\N	\N	\N	1–254	\N	Himalayan Linguistics Archive	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	1
44	2013-11-19 20:49:33.219434+01	2013-11-19 20:49:33.219445+01	t	{}	base	borgmaltese1997	Borg, Albert and Azzopardi-Alexander, Marie 1997	Maltese	\N	\N	\N	book	Borg, Albert and Azzopardi-Alexander, Marie	1997	Maltese	\N	\N	\N	\N	\N	\N	\N	London, New York	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	1
45	2013-11-19 20:49:33.220642+01	2013-11-19 20:49:33.220653+01	t	{}	base	goswamiasamiya2003	Goswami, G. C. and Tamuli, Jyotiprakash 2003	Asamiya	\N	\N	\N	incollection	Goswami, G. C. and Tamuli, Jyotiprakash	2003	Asamiya	\N	The Indo-Aryan Languages	Cardona, George and Dhanesh, Jain	391–443	\N	\N	\N	London, New York	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	1
46	2013-11-19 20:49:33.221913+01	2013-11-19 20:49:33.221924+01	t	{}	base	verhaarloanwords1984	Jones, Russel 1984	Loan-words in contemporary Indonesian	\N	\N	\N	incollection	Jones, Russel	1984	Loan-words in contemporary Indonesian	\N	Towards a description of contemporary Indonesian. Preliminary studies, Part II	Verhaar, John W. M.	1–38	\N	\N	\N	Jakarta	\N	\N	19	NUSA Linguistic Studies of Indonesian and Other Languages of Indonesia	\N	Universitas Atma Jaya	\N	\N	\N	\N	\N	\N	1
47	2013-11-19 20:49:33.223163+01	2013-11-19 20:49:33.223174+01	t	{}	base	salaproblema1988	Sala, Marius 1988	El problema de las lenguas en contacto	\N	\N	\N	book	Sala, Marius	1988	El problema de las lenguas en contacto	\N	\N	\N	\N	\N	\N	\N	México	\N	\N	\N	\N	\N	Universidad de México	\N	\N	\N	\N	\N	\N	1
48	2013-11-19 20:49:33.224336+01	2013-11-19 20:49:33.224346+01	t	{}	base	wiedemannversuch1847	Wiedemann, Ferdinand Joh. 1847	Versuch einer Grammatik der tscheremissischen Sprache nach dem in der Evangelienübersetzung von 1821 gebrauchten Dialekte	\N	\N	\N	book	Wiedemann, Ferdinand Joh.	1847	Versuch einer Grammatik der tscheremissischen Sprache nach dem in der Evangelienübersetzung von 1821 gebrauchten Dialekte	\N	\N	\N	\N	\N	\N	\N	Reval	\N	\N	\N	\N	\N	Verlag Franz Kluge	\N	\N	\N	\N	\N	\N	1
49	2013-11-19 20:49:33.225532+01	2013-11-19 20:49:33.225544+01	t	{}	base	dawkinsmodern1916	Dawkins, R. M. 1916	Modern Greek in Asia Minor	\N	\N	\N	book	Dawkins, R. M.	1916	Modern Greek in Asia Minor	\N	\N	\N	\N	\N	\N	\N	Cambridge	\N	\N	\N	\N	\N	Cambridge University Press	\N	\N	\N	\N	\N	\N	1
50	2013-11-19 20:49:33.226559+01	2013-11-19 20:49:33.226568+01	t	{}	base	memoglusuleymanogluturkcenin2006	Memoglu-Süleymanoglu, Hayriye 2006	Türkçenin ters siklik sözlügü	\N	\N	\N	book	Memoglu-Süleymanoglu, Hayriye	2006	Türkçenin ters siklik sözlügü	\N	\N	\N	\N	\N	\N	\N	Ankara	\N	\N	\N	\N	\N	Kurmay	\N	\N	\N	\N	\N	\N	1
51	2013-11-19 20:49:33.227512+01	2013-11-19 20:49:33.22752+01	t	{}	base	gutierrezmoralesborrowing2008	Gutiérrez-Morales, Salomé 2008	Borrowing and Grammaticalization in Sierra Popoluca: The Influence of Nahuatl and Spanish	\N	\N	\N	phdthesis	Gutiérrez-Morales, Salomé	2008	Borrowing and Grammaticalization in Sierra Popoluca: The Influence of Nahuatl and Spanish	Ph.D. dissertation	\N	\N	\N	\N	\N	University of California at Berkeley	Berkeley	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
52	2013-11-19 20:49:33.228465+01	2013-11-19 20:49:33.228473+01	t	{}	base	muyskenidioma2005	Muysken, Pieter 2005	El idioma Uchumataqu	\N	\N	\N	book	Muysken, Pieter	2005	El idioma Uchumataqu	\N	\N	\N	\N	\N	\N	\N	Irohito	\N	\N	\N	\N	\N	Distrito Nacionalidad Indígena. Urus de Irohito	\N	\N	\N	\N	\N	\N	1
53	2013-11-19 20:49:33.229508+01	2013-11-19 20:49:33.229516+01	t	{}	base	kossmannnature2008	Kossmann, Maarten 2008	On the Nature of Borrowing in Cypriot Arabic	\N	\N	\N	article	Kossmann, Maarten	2008	On the Nature of Borrowing in Cypriot Arabic	\N	\N	\N	5–24	\N	Zeitschrift für Arabische Linguistik	\N	\N	\N	\N	\N	\N	49	\N	\N	\N	\N	\N	\N	\N	1
54	2013-11-19 20:49:33.230585+01	2013-11-19 20:49:33.230593+01	t	{}	base	haspelmathgrammar1993	Haspelmath, Martin 1993	A Grammar of Lezgian	\N	\N	\N	book	Haspelmath, Martin	1993	A Grammar of Lezgian	\N	\N	\N	\N	\N	\N	\N	Berlin, New York	\N	\N	9	Mouton grammar library	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
55	2013-11-19 20:49:33.231725+01	2013-11-19 20:49:33.231736+01	t	{}	base	noonanrise1996	Noonan, Michael 1996	The rise and fall of the Chantyal language	\N	\N	\N	article	Noonan, Michael	1996	The rise and fall of the Chantyal language	\N	\N	\N	121–136	\N	Southwest Journal of Linguistics	\N	\N	\N	\N	1-2	\N	15	\N	\N	\N	\N	\N	\N	\N	1
56	2013-11-19 20:49:33.232866+01	2013-11-19 20:49:33.232876+01	t	{}	base	janhunensanta2003	Kim, Stephen S. 2003	Santa	\N	\N	\N	incollection	Kim, Stephen S.	2003	Santa	\N	The Mongolic languages	Janhunen, Juha	346–363	\N	\N	\N	London	\N	\N	5	Routledge Language Family Series	\N	RoutledgeCurzon	\N	\N	\N	\N	\N	\N	1
57	2013-11-19 20:49:33.234046+01	2013-11-19 20:49:33.234057+01	t	{}	base	pakendorfintensive2009	Pakendorf, Brigitte 2009	Intensive contact and the copying of paradigms. An Ėven dialect in contact with Sakha (Yakut)	\N	\N	\N	article	Pakendorf, Brigitte	2009	Intensive contact and the copying of paradigms. An Ėven dialect in contact with Sakha (Yakut)	\N	\N	\N	85–110	\N	Journal of Language Contact – VARIA	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	1
58	2013-11-19 20:49:33.235234+01	2013-11-19 20:49:33.235245+01	t	{}	base	souagsiwa2009	Souag, Lameen 2009	Siwa and its significance for Arabic dialectology	\N	\N	\N	article	Souag, Lameen	2009	Siwa and its significance for Arabic dialectology	\N	\N	\N	51–75	\N	Zeitschrift für Arabische Linguistik	\N	\N	\N	\N	\N	\N	51	\N	\N	\N	\N	\N	\N	\N	1
59	2013-11-19 20:49:33.236416+01	2013-11-19 20:49:33.236427+01	t	{}	base	steinkrugertransfer2009	Steinkrüger, Patrick O. and Seifart, Frank 2009	Transfer of derivational morphology without borrowing of stems: Resígaro (Arawakan, Peru) and Chabacano (Creole, Philippines)	\N	\N	\N	misc	Steinkrüger, Patrick O. and Seifart, Frank	2009	Transfer of derivational morphology without borrowing of stems: Resígaro (Arawakan, Peru) and Chabacano (Creole, Philippines)	\N	\N	\N	\N	\N	\N	\N	Paper presented at Morphologies in Contact, University of Bremen, October 1-3, 2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
60	2013-11-19 20:49:33.237638+01	2013-11-19 20:49:33.23765+01	t	{}	base	petgrammar2011	Pet, Willem J. A. 2011	A Grammar Sketch and Lexicon of Arawak (Lokono Dian)	\N	\N	\N	book	Pet, Willem J. A.	2011	A Grammar Sketch and Lexicon of Arawak (Lokono Dian)	\N	\N	\N	\N	\N	\N	\N	Dallas, Texas	http://www.sil.org/silepubs/abstract.asp?id=928474543236	\N	30	SIL e-Books	\N	SIL International	\N	\N	\N	\N	\N	\N	1
61	2013-11-19 20:49:33.238837+01	2013-11-19 20:49:33.238847+01	t	{}	base	guldemanngrammaticalization2003	Güldemann, Tom 2003	Grammaticalization	\N	\N	\N	incollection	Güldemann, Tom	2003	Grammaticalization	\N	The Bantu languages	Nurse, Derek and Philippson, Gérard	182–194	\N	\N	\N	London	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	1
62	2013-11-19 20:49:33.24003+01	2013-11-19 20:49:33.240041+01	t	{}	base	matrasgrammatical20071	Hildebrandt, Kristine A. 2007	Grammatical borrowing in Manage	\N	\N	\N	incollection	Hildebrandt, Kristine A.	2007	Grammatical borrowing in Manage	\N	Grammatical borrowing in cross-linguistic perspective	Matras, Yaron and Sakel, Jeanette	283–300	\N	\N	\N	Berlin, New York	\N	\N	38	Empirical approaches to language typology	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
63	2013-11-19 20:49:33.241176+01	2013-11-19 20:49:33.241185+01	t	{}	base	matrasgrammatical20072	Rießler, Michael 2007	Grammatical Borrowing in Kildin Saami	\N	\N	\N	incollection	Rießler, Michael	2007	Grammatical Borrowing in Kildin Saami	\N	Grammatical Borrowing in Cross-Linguistic Perspective	Matras, Yaron and Sakel, Jeanette	229–244	\N	\N	\N	Berlin, New York	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
64	2013-11-19 20:49:33.242345+01	2013-11-19 20:49:33.242357+01	t	{}	base	daltonpufferfrench1996	Dalton-Puffer, Christiane 1996	The French influence on Middle English Morphology. A corpus-based study of derivation	\N	\N	\N	book	Dalton-Puffer, Christiane	1996	The French influence on Middle English Morphology. A corpus-based study of derivation	\N	\N	\N	\N	\N	\N	\N	Berlin, New York	\N	\N	20	Topics in English Linguistics	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
65	2013-11-19 20:49:33.243431+01	2013-11-19 20:49:33.243443+01	t	{}	base	palmerborrowings2009	Palmer, Chris C. 2009	Borrowings, derivational morphology, and perceived productivity in English, 1300-1600.	\N	\N	\N	phdthesis	Palmer, Chris C.	2009	Borrowings, derivational morphology, and perceived productivity in English, 1300-1600.	Ph.D. dissertation	\N	\N	\N	\N	\N	The University of Michigan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
66	2013-11-19 20:49:33.244496+01	2013-11-19 20:49:33.244507+01	t	{}	base	slatergrammar2003	Slater, Keith W. 2003	A Grammar of Mangghuer. A Mongolic language of China's Qinghai-Gansu Sprachbund	\N	\N	\N	book	Slater, Keith W.	2003	A Grammar of Mangghuer. A Mongolic language of China's Qinghai-Gansu Sprachbund	\N	\N	\N	\N	\N	\N	\N	London, New York	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	1
67	2013-11-19 20:49:33.24567+01	2013-11-19 20:49:33.245681+01	t	{}	base	wurmhezhou1996	Lee-Smith, Mei W. 1996	The Hezhou language	\N	\N	\N	incollection	Lee-Smith, Mei W.	1996	The Hezhou language	\N	Atlas of languages of intercultural communication in the Pacific, Asia and the Americas. Volume 2, Part 1	Wurm, Stephen A. and Mühlhäusler, Peter and Tryon, Darrell T.	865–874	\N	\N	\N	Berlin, New York	\N	\N	13	Trends in Linguistics, Documentation Series	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
68	2013-11-19 20:49:33.246786+01	2013-11-19 20:49:33.246797+01	t	{}	base	souaggrammatical2010	Souag, Lameen 2010	Grammatical Contact in the Sahara. Arabic, Berber, and Songhay in Tabelbala and Siwa	\N	\N	\N	phdthesis	Souag, Lameen	2010	Grammatical Contact in the Sahara. Arabic, Berber, and Songhay in Tabelbala and Siwa	Ph.D. dissertation	\N	\N	\N	\N	\N	School of Oriental and African Studies, University of London	London	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
69	2013-11-19 20:49:33.247793+01	2013-11-19 20:49:33.247802+01	t	{}	base	mujikalatina1982	Mujika, Luis Mari 1982	Latina eta erromanikoaren eragina euskaran. Euskal lexikoaren azterketa bideetan	\N	\N	\N	book	Mujika, Luis Mari	1982	Latina eta erromanikoaren eragina euskaran. Euskal lexikoaren azterketa bideetan	\N	\N	\N	\N	\N	\N	\N	Donostia	\N	\N	\N	\N	\N	Sendoa Argitaldaria	\N	\N	\N	\N	\N	\N	1
70	2013-11-19 20:49:33.248891+01	2013-11-19 20:49:33.248904+01	t	{}	base	aikhenvaldtariana1999	Aikhenvald, Alexandra Y. 1999	Tariana Texts and Cultural Context	\N	\N	\N	book	Aikhenvald, Alexandra Y.	1999	Tariana Texts and Cultural Context	\N	\N	\N	\N	\N	\N	\N	Munich	\N	\N	\N	\N	\N	LINCOM EUROPA	\N	\N	\N	\N	\N	\N	1
71	2013-11-19 20:49:33.250011+01	2013-11-19 20:49:33.250022+01	t	{}	base	adelaaraustronesian2005	Adelaar, Alexander 2005	The Austronesian languages of South East Asia and Madagascar: a historical perspective	\N	\N	\N	incollection	Adelaar, Alexander	2005	The Austronesian languages of South East Asia and Madagascar: a historical perspective	\N	The Austronesian languages of Asia and Madagascar	Adelaar, Alexander and Himmelmann, Nikolaus P.	\N	\N	\N	\N	London	\N	\N	7	Routledge Language Family Series	\N	Routledge	\N	\N	\N	\N	\N	\N	1
72	2013-11-19 20:49:33.251049+01	2013-11-19 20:49:33.251058+01	t	{}	base	xhuvaniprapashtesat1962	Xhuvani, Aleksandër and Çabej, Eqrem 1962	Prapashtesat e gjuhës shqipe	\N	\N	\N	book	Xhuvani, Aleksandër and Çabej, Eqrem	1962	Prapashtesat e gjuhës shqipe	\N	\N	\N	\N	\N	\N	\N	Tiranë	\N	\N	\N	\N	\N	Universiteti Shtetëror	\N	\N	\N	\N	\N	\N	1
73	2013-11-19 20:49:33.252055+01	2013-11-19 20:49:33.252065+01	t	{}	base	seifartresigaro2009	Seifart, Frank 2009	Resígaro documentation	\N	\N	\N	incollection	Seifart, Frank	2009	Resígaro documentation	\N	A multimedia documentation of the languages of the People of the Center. Online publication of transcribed and translated Bora, Ocaina, Nonuya, Resígaro, and Witoto audio and video recordings with linguistic and ethnographic annotations and descriptions	Seifart, Frank and Fagua, Doris and Gasché, Jürg and Echeverri, Juan Alvaro	\N	\N	\N	\N	Nijmegen	http://corpus1.mpi.nl/qfs1/media-archive/dobes_data/Center/Info/WelcomeToCenterPeople.html	\N	\N	\N	\N	DOBES-MPI	\N	\N	\N	\N	\N	\N	1
74	2013-11-19 20:49:33.253237+01	2013-11-19 20:49:33.253246+01	t	{}	base	orelalbanian1998	Orel, Vladimir E. 1998	Albanian etymological dictionary	\N	\N	\N	book	Orel, Vladimir E.	1998	Albanian etymological dictionary	\N	\N	\N	\N	\N	\N	\N	Leiden	\N	\N	\N	\N	\N	Brill	\N	\N	\N	\N	\N	\N	1
75	2013-11-19 20:49:33.254352+01	2013-11-19 20:49:33.25436+01	t	{}	base	hualdederivation2003	Hualde, José Ignacio 2003	Derivation	\N	\N	\N	incollection	Hualde, José Ignacio	2003	Derivation	\N	A grammar of Basque	Hualde, José Ignacio and Urbina, Jon Ortiz de	328–351	\N	\N	\N	Berlin, New York	\N	\N	26	Mouton Grammar Library	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
76	2013-11-19 20:49:33.255374+01	2013-11-19 20:49:33.255383+01	t	{}	base	bekecseremisz1911	Beke, Ödön 1911	Cseremisz nyelvtan	\N	\N	\N	book	Beke, Ödön	1911	Cseremisz nyelvtan	\N	\N	\N	\N	\N	\N	\N	Budapest	\N	\N	\N	\N	\N	Kiadja a Magyar Tudományos Akadémia	\N	\N	\N	\N	\N	\N	1
77	2013-11-19 20:49:33.256325+01	2013-11-19 20:49:33.256333+01	t	{}	base	noonancontactinduced2008	Noonan, Michael 2008	Contact-induced change. The case of Tamangic languages	\N	\N	\N	incollection	Noonan, Michael	2008	Contact-induced change. The case of Tamangic languages	\N	Language Contact and Contact Languages	Siemund, Peter and Kintana, Noemi	81–106	\N	\N	\N	Amsterdam, Philadelphia	\N	\N	7	Hamburg Studies on Multlingualism	\N	John Benjamins	\N	\N	\N	\N	\N	\N	1
78	2013-11-19 20:49:33.257269+01	2013-11-19 20:49:33.257277+01	t	{}	base	roseborrowing2012	Rose, Françoise 2012	Borrowing of a Cariban number marker into three Tupi-Guarani languages	\N	\N	\N	unpublished	Rose, Françoise	2012	Borrowing of a Cariban number marker into three Tupi-Guarani languages	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
79	2013-11-19 20:49:33.258166+01	2013-11-19 20:49:33.258173+01	t	{}	base	janseagglutination2009	Janse, Mark 2009	Agglutination and the Psychology of Double Inflections in Cappadocian	\N	\N	\N	incollection	Janse, Mark	2009	Agglutination and the Psychology of Double Inflections in Cappadocian	\N	Studies in Modern Greek Dialects and Linguistic Theory	Janse, Mark and Joseph, Brian D. and Pavlou, Pavlos and Ralli, Angela	\N	\N	\N	\N	Nicosia	\N	\N	\N	\N	\N	Research Center of the Holy Monastery of Kykkos	\N	\N	\N	\N	\N	\N	1
80	2013-11-19 20:49:33.259247+01	2013-11-19 20:49:33.259255+01	t	{}	base	boretzkyromani1994	Boretzky, Norbert 1994	Romani : Grammatik des Kalderaš-Dialektes mit Texten und Glossar	\N	\N	\N	book	Boretzky, Norbert	1994	Romani : Grammatik des Kalderaš-Dialektes mit Texten und Glossar	\N	\N	\N	\N	\N	\N	\N	Wiesbaden	\N	\N	24	Balkanologische Veröffentlichungen	\N	Harrassowitz	\N	\N	\N	\N	\N	\N	1
81	2013-11-19 20:49:33.260313+01	2013-11-19 20:49:33.260321+01	t	{}	base	borgcypriot1985	Borg, Alexander 1985	Cypriot Arabic : a historical and comparative investigation into the phonology and morphology of the Arabic vernacular spoken by the Maronites of Kormakiti village in the Kyrenia district of North-Western Cyprus	\N	\N	\N	book	Borg, Alexander	1985	Cypriot Arabic : a historical and comparative investigation into the phonology and morphology of the Arabic vernacular spoken by the Maronites of Kormakiti village in the Kyrenia district of North-Western Cyprus	\N	\N	\N	\N	\N	\N	\N	Stuttgart	\N	\N	47.4	Abhandlungen für die Kunde des Morgenlandes	\N	Steiner	\N	\N	\N	\N	\N	\N	1
82	2013-11-19 20:49:33.261347+01	2013-11-19 20:49:33.261355+01	t	{}	base	budenzcseremisz1864	Budenz, József 1864	Cseremisz tanulmányok	\N	\N	\N	article	Budenz, József	1864	Cseremisz tanulmányok	\N	\N	\N	397–470	\N	NyK	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	1
83	2013-11-19 20:49:33.2623+01	2013-11-19 20:49:33.262308+01	t	{}	base	galkinistoritsheskaja1964	Galkin, Ivan Stepanovich 1964	Istoritsheskaja grammatika marijskogo jazyka	\N	\N	\N	book	Galkin, Ivan Stepanovich	1964	Istoritsheskaja grammatika marijskogo jazyka	\N	\N	\N	\N	\N	\N	\N	Joshkar-Ola	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
84	2013-11-19 20:49:33.263232+01	2013-11-19 20:49:33.263239+01	t	{}	base	janhunenwutun2008	Janhunen, Juha and Peltomaa, Marja and Sandman, Erika and Dongzhou, Xiawu 2008	Wutun	\N	\N	\N	book	Janhunen, Juha and Peltomaa, Marja and Sandman, Erika and Dongzhou, Xiawu	2008	Wutun	\N	\N	\N	\N	\N	\N	\N	Munich	\N	\N	466	Language of the World/Materials	\N	LINCOM EUROPA	\N	\N	\N	\N	\N	\N	1
85	2013-11-19 20:49:33.264152+01	2013-11-19 20:49:33.26416+01	t	{}	base	boretzkyturkische1975	Boretzky, Norbert 1975	Der türkische Einfluss auf das Albanische. Teil 2: Wörterbuch der albanischen Turzismen	\N	\N	\N	book	Boretzky, Norbert	1975	Der türkische Einfluss auf das Albanische. Teil 2: Wörterbuch der albanischen Turzismen	\N	\N	\N	\N	\N	\N	\N	Wiesbaden	\N	\N	12	Albanische Forschungen	\N	Harrassowitz	\N	\N	\N	\N	\N	\N	1
86	2013-11-19 20:49:33.265326+01	2013-11-19 20:49:33.265338+01	t	{}	base	escuregrammaticalizaion2012	Escure, Geneviève 2012	The grammaticalizaion of evidential markers in Garifuna	\N	\N	\N	incollection	Escure, Geneviève	2012	The grammaticalizaion of evidential markers in Garifuna	\N	Grammatical replication and borrowability in language contact	Wiemer, Björn and Wälchli, Bernhard and Hansen, Björn	357–380	\N	\N	\N	Berlin, Boston	\N	\N	\N	\N	\N	de Gruyter Mouton	\N	\N	\N	\N	\N	\N	1
87	2013-11-19 20:49:33.266409+01	2013-11-19 20:49:33.266419+01	t	{}	base	myersscottoncontact2002	Myers-Scotton, Carol 2002	Contact Linguistics. Bilingual Encounters and Grammatical Outcomes	\N	\N	\N	book	Myers-Scotton, Carol	2002	Contact Linguistics. Bilingual Encounters and Grammatical Outcomes	\N	\N	\N	\N	\N	\N	\N	Oxford	\N	\N	\N	\N	\N	Oxford University Press	\N	\N	\N	\N	\N	\N	1
88	2013-11-19 20:49:33.267439+01	2013-11-19 20:49:33.267449+01	t	{}	base	palmermetatypic2011	Palmer, Bill and Evans, Bethwyn 2011	Metatypic change in Mono-Uravan	\N	\N	\N	unpublished	Palmer, Bill and Evans, Bethwyn	2011	Metatypic change in Mono-Uravan	\N	\N	\N	\N	\N	\N	\N	Paper given at the International Conference on Historical Linguistics	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
89	2013-11-19 20:49:33.268466+01	2013-11-19 20:49:33.268476+01	t	{}	base	rieslerloanwords2009	Rießler, Michael 2009	Loanwords in Kildin Saami	\N	\N	\N	incollection	Rießler, Michael	2009	Loanwords in Kildin Saami	\N	Loanwords in the World's Languages. A Comparative Handbook	Haspelmath, Martin and Tadmor, Uri	384–413	\N	\N	\N	Berlin	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
90	2013-11-19 20:49:33.269619+01	2013-11-19 20:49:33.269628+01	t	{}	base	hoffevidentiality1986	Hoff, Berend J. 1986	Evidentiality in carib Particles, affixes, and a variant of Wackernagel's law	\N	\N	\N	article	Hoff, Berend J.	1986	Evidentiality in carib Particles, affixes, and a variant of Wackernagel's law	\N	\N	\N	49–103	\N	Lingua	\N	\N	http://www.sciencedirect.com/science/article/pii/0024384186900781	\N	1–2	\N	69	\N	\N	\N	\N	\N	\N	\N	1
91	2013-11-19 20:49:33.270797+01	2013-11-19 20:49:33.270808+01	t	{}	base	adelaarquechua2006	Adelaar, Willem F. H. 2006	The Quechua impact in the Amuesha language, an Arawak language of the Peruvian Amazon	\N	\N	\N	incollection	Adelaar, Willem F. H.	2006	The Quechua impact in the Amuesha language, an Arawak language of the Peruvian Amazon	\N	Grammars in Contact. A Cross-Linguistic Typology	Aikhenvald, Alexandra Y. and Dixon, R. M. W.	290–312	\N	\N	\N	Oxford	\N	\N	4	Explorations in Linguistic Typology	\N	Oxford University Press	\N	\N	\N	\N	\N	\N	1
92	2013-11-19 20:49:33.271936+01	2013-11-19 20:49:33.271946+01	t	{}	base	heathlinguistic1978	Heath, Jeffrey 1978	Linguistic Diffusion in Arnhem Land	\N	\N	\N	book	Heath, Jeffrey	1978	Linguistic Diffusion in Arnhem Land	\N	\N	\N	\N	\N	\N	\N	Canberra	\N	\N	\N	\N	\N	Australian Institute of Aboriginal Studies	\N	\N	\N	\N	\N	\N	1
93	2013-11-19 20:49:33.273047+01	2013-11-19 20:49:33.273057+01	t	{}	base	bolozkymeasuring1999	Bolozky, Shmuel 1999	Measuring productivity in word formation: the case of Israeli Hebrew	\N	\N	\N	book	Bolozky, Shmuel	1999	Measuring productivity in word formation: the case of Israeli Hebrew	\N	\N	\N	\N	\N	\N	\N	Leiden	\N	\N	27	Studies in Semitic languages and linguistics	\N	Brill	\N	\N	\N	\N	\N	\N	1
94	2013-11-19 20:49:33.274148+01	2013-11-19 20:49:33.274159+01	t	{}	base	kaluzynskimongolische1962	Kałużyński, Stanisław 1962	Mongolische Elemente in der jakutischen Sprache	\N	\N	\N	book	Kałużyński, Stanisław	1962	Mongolische Elemente in der jakutischen Sprache	\N	\N	\N	\N	\N	\N	\N	Warsaw, 's-Gravenhage	\N	\N	\N	\N	\N	Państwowe Wydawnictwo Naukowe, Mouton \\& Co	\N	\N	\N	\N	\N	\N	1
95	2013-11-19 20:49:33.27523+01	2013-11-19 20:49:33.275241+01	t	{}	base	boeschotenyakut2006	Malchukov, Andrej L. 2006	Yakut interference in North Tungusic languages	\N	\N	\N	incollection	Malchukov, Andrej L.	2006	Yakut interference in North Tungusic languages	\N	Turkic languages in contact	Boeschoten, Hendrik and Johanson, Lars	122–138	1. Aufl.	\N	\N	Wiesbaden	\N	\N	61	Turcologica	\N	Harrassowitz	\N	\N	\N	\N	\N	\N	1
96	2013-11-19 20:49:33.276338+01	2013-11-19 20:49:33.276349+01	t	{}	base	myreevaocerk1964	Myreeva, Anna N. 1964	Očerk govora učurskix ėvenkov	\N	\N	\N	incollection	Myreeva, Anna N.	1964	Očerk govora učurskix ėvenkov	\N	Očerki učurskogo, majskogo i tottinskogo govorov	Romanova, Angnija V. and Myreeva, Anna N.	6–74	\N	\N	\N	Moscow, Leningrad	\N	\N	\N	\N	\N	Izdatel’stvo ‘Nauka’	\N	\N	\N	\N	\N	\N	1
97	2013-11-19 20:49:33.277432+01	2013-11-19 20:49:33.277443+01	t	{}	base	bulucmendeli1975	Buluç, Sadettin 1975	Mendeli (Irak) Ağzının Özellikleri	\N	\N	\N	incollection	Buluç, Sadettin	1975	Mendeli (Irak) Ağzının Özellikleri	\N	Bilimsel bildiriler 1972 : I. Türk Dili Bilimsel Kurultayina sunulan Bildiriler (Ankara, 27-29 eylül 1972)	\N	181–183	\N	\N	\N	Ankara	\N	\N	\N	\N	\N	Ankara Universitesi Basimevi	\N	\N	\N	\N	\N	\N	1
98	2013-11-19 20:49:33.278445+01	2013-11-19 20:49:33.278454+01	t	{}	base	meakinsborrowing2011	Meakins, Felicity 2011	Borrowing contextual inflection: evidence from northern Australia	\N	\N	\N	article	Meakins, Felicity	2011	Borrowing contextual inflection: evidence from northern Australia	\N	\N	\N	57–87	\N	Morphology	\N	\N	http://espace.library.uq.edu.au/view/UQ:229257	\N	1	\N	21	\N	\N	\N	\N	\N	\N	\N	1
99	2013-11-19 20:49:33.2794+01	2013-11-19 20:49:33.279409+01	t	{}	base	korkinagrammatika1982	Korkina, Evdokija I. and Ubrjatova, Elizaveta I. and Xaritonov, L. N. and Petrov, N.E. 1982	Grammatika sovremennogo jakutskogo literaturnogo jazyka. Fonetika i morfologija	\N	\N	\N	book	Korkina, Evdokija I. and Ubrjatova, Elizaveta I. and Xaritonov, L. N. and Petrov, N.E.	1982	Grammatika sovremennogo jakutskogo literaturnogo jazyka. Fonetika i morfologija	\N	\N	\N	\N	\N	\N	\N	Moscow	\N	\N	\N	\N	\N	Izdatel’stvo ‛Nauka’	\N	\N	\N	\N	\N	\N	1
100	2013-11-19 20:49:33.280685+01	2013-11-19 20:49:33.280695+01	t	{}	base	smithsri2013	Smith, Ian 2013	Sri Lanka Portuguese	\N	\N	\N	incollection	Smith, Ian	2013	Sri Lanka Portuguese	\N	The Survey of Pidgin and Creole Languages. Volume II: Portuguese-based, Spanish-based, and French-based Languages	Michaelis, Susanne Maria and Maurer, Philippe and Haspelmath, Martin and Huber, Magnus and Revis, Melanie	111–121	\N	\N	\N	Oxford	\N	\N	\N	\N	\N	Oxford University Press	\N	\N	\N	\N	\N	\N	1
101	2013-11-19 20:49:33.281705+01	2013-11-19 20:49:33.281714+01	t	{}	base	ciszekword2008	Ciszek, Ewa 2008	Word derivation in Early Middle English	\N	\N	\N	book	Ciszek, Ewa	2008	Word derivation in Early Middle English	\N	\N	\N	\N	\N	\N	\N	Frankfurt am Main	\N	\N	23	Studies in English medieval language and literature	\N	Lang	\N	\N	\N	\N	\N	\N	1
102	2013-11-19 20:49:33.282839+01	2013-11-19 20:49:33.282848+01	t	{}	base	noonanchantyal2003	Noonan, Michael 2003	Chantyal	\N	\N	\N	incollection	Noonan, Michael	2003	Chantyal	\N	The Sino-Tibetan Languages	Thurgood, Graham and LaPolla, Randy J.	315–335	\N	\N	\N	London	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	1
103	2013-11-19 20:49:33.283848+01	2013-11-19 20:49:33.283855+01	t	{}	base	metrauxcontribution1935	Métraux, Alfred 1935	Contribution à l’ethnographie et à la linguistique des indiens Uro d’Ancoaqui (Bolivie)	\N	\N	\N	article	Métraux, Alfred	1935	Contribution à l’ethnographie et à la linguistique des indiens Uro d’Ancoaqui (Bolivie)	\N	\N	\N	75–110	\N	Journal de la Société des Américanistes	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	1
104	2013-11-19 20:49:33.284847+01	2013-11-19 20:49:33.284855+01	t	{}	base	derbyshirecarib1999	Derbyshire, Desmond C. 1999	Carib	\N	\N	\N	incollection	Derbyshire, Desmond C.	1999	Carib	\N	The Amazonian languages	Dixon, R. M. W. and Aikhenvald, Alexandra Y.	22–64	\N	\N	\N	Cambridge	\N	\N	\N	\N	\N	Cambridge University Press	\N	\N	\N	\N	\N	\N	1
105	2013-11-19 20:49:33.28584+01	2013-11-19 20:49:33.285849+01	t	{}	base	vietzerucklaufiges1975	Vietze, Hans Peter and Zenker, Ludwig and Warnke, Ingrid 1975	Rückläufiges Wörterbuch der türkischen Sprache	\N	\N	\N	book	Vietze, Hans Peter and Zenker, Ludwig and Warnke, Ingrid	1975	Rückläufiges Wörterbuch der türkischen Sprache	\N	\N	\N	\N	\N	\N	\N	Leipzig	\N	\N	\N	\N	\N	Verlag Enzyklopädie	\N	\N	\N	\N	\N	\N	1
106	2013-11-19 20:49:33.286782+01	2013-11-19 20:49:33.28679+01	t	{}	base	zelloumoroccan2011	Zellou, Georgia 2011	Moroccan Arabic borrowed circumfix from Berber: investigating morphological categories in a language contact situation	\N	\N	\N	incollection	Zellou, Georgia	2011	Moroccan Arabic borrowed circumfix from Berber: investigating morphological categories in a language contact situation	\N	Les frontières internes et externes de la morphologie	Perko, Gregor	231–244	\N	\N	\N	Ljubljana	\N	\N	51	Linguistica	\N	Znanstvena založba Filozofske fakultete	\N	\N	\N	\N	\N	\N	1
107	2013-11-19 20:49:33.287738+01	2013-11-19 20:49:33.287745+01	t	{}	base	purwoaffixation1984	Verhaar, John W. M. 1984	Affixation in contemporary Indonesian	\N	\N	\N	incollection	Verhaar, John W. M.	1984	Affixation in contemporary Indonesian	\N	Towards a description of contemporary Indonesian. Preliminary studies, Part I	Purwo, Bambang Kaswanti	1–26	\N	\N	\N	Jakarta	\N	\N	18	NUSA Linguistic Studies of Indonesian and Other Languages of Indonesia	\N	Universitas Atma Jaya	\N	\N	\N	\N	\N	\N	1
108	2013-11-19 20:49:33.288783+01	2013-11-19 20:49:33.288791+01	t	{}	base	guldemannreconstruction2004	Güldemann, Tom 2004	Reconstruction through ‘de-construction’: The marking of person, gender, and number in the Khoe family and Kwadi	\N	\N	\N	article	Güldemann, Tom	2004	Reconstruction through ‘de-construction’: The marking of person, gender, and number in the Khoe family and Kwadi	\N	\N	\N	251–306	\N	Diachronica	\N	\N	http://www.benjamins.com/cgi-bin/t_articles.cgi?bookid=DIA%2021%3A2&artid=242055149	\N	2	\N	21	\N	\N	\N	\N	\N	\N	\N	1
109	2013-11-19 20:49:33.289755+01	2013-11-19 20:49:33.289763+01	t	{}	base	dereusesiberian1994	de Reuse, Willem Joseph 1994	Siberian Yupik Eskimo. The language and its contacts with Chukchi	\N	\N	\N	book	de Reuse, Willem Joseph	1994	Siberian Yupik Eskimo. The language and its contacts with Chukchi	\N	\N	\N	\N	\N	\N	\N	Salt Lake City	\N	\N	\N	Studies in indigenous languages of the Americas	\N	University of Utah Press	\N	\N	\N	\N	\N	\N	1
110	2013-11-19 20:49:33.290759+01	2013-11-19 20:49:33.290767+01	t	{}	base	aikhenvaldinvisible2012	Aikhenvald, Alexandra Y. 2012	'Invisible' loans: How to borrow a bound form	\N	\N	\N	incollection	Aikhenvald, Alexandra Y.	2012	'Invisible' loans: How to borrow a bound form	\N	Copies versus cognates in bound morphology	Johanson, Lars and Robbeets, Martine	167–185	\N	\N	\N	Leiden, Boston	\N	\N	2	Brill's Studies in Language, Cognition, and Culture	\N	Brill	\N	\N	\N	\N	\N	\N	1
111	2013-11-19 20:49:33.291707+01	2013-11-19 20:49:33.291714+01	t	{}	base	vossenkhoesprachen1997	Vossen, Rainer 1997	Die Khoe-Sprachen. Ein Beitrag zur Erforschung der Sprachgeschichte Afrikas	\N	\N	\N	book	Vossen, Rainer	1997	Die Khoe-Sprachen. Ein Beitrag zur Erforschung der Sprachgeschichte Afrikas	\N	\N	\N	\N	\N	\N	\N	Köln	\N	\N	\N	\N	\N	Rüdiger Köppe Verlag	\N	\N	\N	\N	\N	\N	1
112	2013-11-19 20:49:33.292791+01	2013-11-19 20:49:33.292798+01	t	{}	base	escuregarifuna2004	Escure, Geneviève 2004	Garifuna in Belize and Honduras	\N	\N	\N	incollection	Escure, Geneviève	2004	Garifuna in Belize and Honduras	\N	Creoles, contact, and language change. Linguistic and social implications	Escure, Geneviève and Schwegler, Armin	35–65	\N	\N	\N	Amsterdam, Philadelphia	\N	\N	27	Creole Language Library	\N	John Benjamins	\N	\N	\N	\N	\N	\N	1
113	2013-11-19 20:49:33.293752+01	2013-11-19 20:49:33.29376+01	t	{}	base	depurygarifuna2001	de Pury, Sybille 2001	Le garífuna, une langue mixte	\N	\N	\N	article	de Pury, Sybille	2001	Le garífuna, une langue mixte	\N	\N	\N	75–84	\N	Faits de Langues	\N	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	1
114	2013-11-19 20:49:33.294672+01	2013-11-19 20:49:33.294679+01	t	{}	base	janhunenmoghol2003	Weiers, Michael 2003	Moghol	\N	\N	\N	incollection	Weiers, Michael	2003	Moghol	\N	The Mongolic languages	Janhunen, Juha	248–264	\N	\N	\N	London	\N	\N	5	Routledge Language Family Series	\N	RoutledgeCurzon	\N	\N	\N	\N	\N	\N	1
115	2013-11-19 20:49:33.295606+01	2013-11-19 20:49:33.295613+01	t	{}	base	parkerjonesloanwords2009	Parker Jones, ‘Ōiwi 2009	Loanwords in Hawaiian	\N	\N	\N	incollection	Parker Jones, ‘Ōiwi	2009	Loanwords in Hawaiian	\N	Loanwords in the World's Languages. A Comparative Handbook	Haspelmath, Martin and Tadmor, Uri	771–789	\N	\N	\N	Berlin	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
116	2013-11-19 20:49:33.296512+01	2013-11-19 20:49:33.29652+01	t	{}	base	steinkrugermorphological2003	Steinkrüger, Patrick 2003	Morphological processes of word formation in Chabacano (Philippine Spanish Creole)	\N	\N	\N	incollection	Steinkrüger, Patrick	2003	Morphological processes of word formation in Chabacano (Philippine Spanish Creole)	\N	Phonology and Morphology of Creole Languages	Plag, Ingo	253–268	\N	\N	\N	Tübingen	\N	\N	478	Linguistische Arbeiten	\N	Niemeyer	\N	\N	\N	\N	\N	\N	1
117	2013-11-19 20:49:33.297488+01	2013-11-19 20:49:33.297496+01	t	{}	base	martinezcruzadjetivos2007	Martínez Cruz, Victoriano 2007	Los adjetivos y los conceptos de propiedad en chol	\N	\N	\N	phdthesis	Martínez Cruz, Victoriano	2007	Los adjetivos y los conceptos de propiedad en chol	M.A.	\N	\N	\N	\N	\N	CIESAS	México	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
118	2013-11-19 20:49:33.298622+01	2013-11-19 20:49:33.298633+01	t	{}	base	capidanmeglenoromanii1925	Capidan, Theodor 1925	Meglenoromânii. I, Istoria şi graiul lor	\N	\N	\N	book	Capidan, Theodor	1925	Meglenoromânii. I, Istoria şi graiul lor	\N	\N	\N	\N	\N	\N	\N	Bucarest	\N	\N	7	Academia Română. Studii şi Cercetări	\N	Cultura Naţională	\N	\N	\N	\N	\N	\N	1
119	2013-11-19 20:49:33.299721+01	2013-11-19 20:49:33.299731+01	t	{}	base	matrasborrowability2007	Matras, Yaron 2007	The borrowability of structural categories	\N	\N	\N	incollection	Matras, Yaron	2007	The borrowability of structural categories	\N	Grammatical borrowing in cross-linguistic perspective	Matras, Yaron and Sakel, Jeanette	31–73	\N	\N	\N	Berlin, New York	\N	\N	38	Empirical approaches to language typology	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
120	2013-11-19 20:49:33.300878+01	2013-11-19 20:49:33.300887+01	t	{}	base	heathfunctional1984	Heath, Jeffrey 1984	Functional grammar of Nunggubuyu	\N	\N	\N	book	Heath, Jeffrey	1984	Functional grammar of Nunggubuyu	\N	\N	\N	\N	\N	\N	\N	Canberra	\N	\N	\N	\N	\N	Australian Institute of Aboriginal Studies	\N	\N	\N	\N	\N	\N	1
121	2013-11-19 20:49:33.30188+01	2013-11-19 20:49:33.301889+01	t	{}	base	svaneslavische1992	Svane, Gunnar 1992	Slavische Lehnwörter im Albanischen	\N	\N	\N	book	Svane, Gunnar	1992	Slavische Lehnwörter im Albanischen	\N	\N	\N	\N	\N	\N	\N	Aarhus	\N	\N	\N	\N	\N	Aarhus University Press	\N	\N	\N	\N	\N	\N	1
122	2013-11-19 20:49:33.30298+01	2013-11-19 20:49:33.302988+01	t	{}	base	gutierrezmoraleskueteero2005	Gutiérrez-Morales, Salomé 2005	Kueteero where are you? The Spanish suffix –ero in Sierra Popoluca	\N	\N	\N	article	Gutiérrez-Morales, Salomé	2005	Kueteero where are you? The Spanish suffix –ero in Sierra Popoluca	\N	\N	\N	42–49	\N	Proceeding from the 8th Workshop on American Indigenous Languages. Santa Barbara Papers in Linguistics. Santa Barbara	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	\N	\N	1
123	2013-11-19 20:49:33.304042+01	2013-11-19 20:49:33.30405+01	t	{}	base	fiedlerpluralbildung1977	Fiedler, Wilfried 1977	Die Pluralbildung bei den türkischen Elementen des Albanischen	\N	\N	\N	article	Fiedler, Wilfried	1977	Die Pluralbildung bei den türkischen Elementen des Albanischen	\N	\N	\N	125–145	\N	Linguistique balkanique	\N	\N	\N	\N	1-2	\N	XX	\N	\N	\N	\N	\N	\N	\N	1
124	2013-11-19 20:49:33.30517+01	2013-11-19 20:49:33.305178+01	t	{}	base	gardaniplural2012	Gardani, Francesco 2012	Plural across inflection and derivation, fusion and agglutination	\N	\N	\N	incollection	Gardani, Francesco	2012	Plural across inflection and derivation, fusion and agglutination	\N	Copies versus cognates in bound morphology	Johanson, Lars and Robbeets, Martine	71–97	\N	\N	\N	Leiden, Boston	\N	\N	2	Brill's Studies in Language, Cognition, and Culture	\N	Brill	\N	\N	\N	\N	\N	\N	1
125	2013-11-19 20:49:33.306161+01	2013-11-19 20:49:33.306169+01	t	{}	base	borgevolutionary1994	Borg, Alexander 1994	Some evolutionary parallels and divergences in Cypriot Arabic and Maltese	\N	\N	\N	article	Borg, Alexander	1994	Some evolutionary parallels and divergences in Cypriot Arabic and Maltese	\N	\N	\N	43–73	\N	Mediterranean Language Review	\N	\N	\N	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	\N	1
126	2013-11-19 20:49:33.307117+01	2013-11-19 20:49:33.307125+01	t	{}	base	kayeindonesian2007	Mueller, Franz 2007	Indonesian Morphology	\N	\N	\N	incollection	Mueller, Franz	2007	Indonesian Morphology	\N	Morphologies of Asia and Africa	Kaye, Alan S.	1207–1233	\N	\N	\N	Winona Lake	\N	\N	\N	\N	\N	Eisenbrauns	\N	\N	\N	\N	\N	\N	1
127	2013-11-19 20:49:33.308236+01	2013-11-19 20:49:33.308247+01	t	{}	base	janhunenturcomongolic2003	Schönig, Claus 2003	Turco-Mongolic relations	\N	\N	\N	incollection	Schönig, Claus	2003	Turco-Mongolic relations	\N	The Mongolic languages	Janhunen, Juha	403–419	\N	\N	\N	London	\N	\N	5	Routledge Language Family Series	\N	RoutledgeCurzon	\N	\N	\N	\N	\N	\N	1
128	2013-11-19 20:49:33.309414+01	2013-11-19 20:49:33.309425+01	t	{}	base	quesadacastillodiccionario1976	Quesada Castillo, Félix 1976	Diccionario quechua Cajamarca-Cañaris	\N	\N	\N	book	Quesada Castillo, Félix	1976	Diccionario quechua Cajamarca-Cañaris	\N	\N	\N	\N	\N	\N	\N	Lima	\N	\N	\N	\N	\N	Ministerio de Educación and Instituto de Estudios Peruanos	\N	\N	\N	\N	\N	\N	1
129	2013-11-19 20:49:33.310508+01	2013-11-19 20:49:33.310519+01	t	{}	base	dufftrippgramatica1997	Duff-Tripp, Martha 1997	Gramática del idioma Yanesha’ (Amuesha)	\N	\N	\N	book	Duff-Tripp, Martha	1997	Gramática del idioma Yanesha’ (Amuesha)	\N	\N	\N	\N	\N	\N	\N	Lima	\N	\N	43	Serie Lingüística Peruana	\N	Ministerio de Educación and Instituto Lingüístico de Verano	\N	\N	\N	\N	\N	\N	1
131	2013-11-19 20:49:33.312689+01	2013-11-19 20:49:33.3127+01	t	{}	base	sassesprachkontakt1985	Sasse, Hans-Jürgen 1985	Sprachkontakt und Sprachwandel. Die Gräzisierung der Albanischen Mundarten Griechenlands	\N	\N	\N	article	Sasse, Hans-Jürgen	1985	Sprachkontakt und Sprachwandel. Die Gräzisierung der Albanischen Mundarten Griechenlands	\N	\N	\N	37–95	\N	Papiere zur Linguistik	\N	\N	\N	\N	1	\N	32	\N	\N	\N	\N	\N	\N	\N	1
132	2013-11-19 20:49:33.313762+01	2013-11-19 20:49:33.313771+01	t	{}	base	meakinscasemarking2007	Meakins, Felicity 2007	Case-marking in contact: the development and function of case morphology in Gurindji Kriol, an Australian mixed language	\N	\N	\N	phdthesis	Meakins, Felicity	2007	Case-marking in contact: the development and function of case morphology in Gurindji Kriol, an Australian mixed language	PhD thesis	\N	\N	\N	\N	\N	Department of Linguistics and Applied Linguistics, University of Melbourne	Melbourne	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
133	2013-11-19 20:49:33.314736+01	2013-11-19 20:49:33.314744+01	t	{}	base	miyaokagrammar2012	Miyaoka, Osahito 2012	A Grammar of Central Alaskan Yupik (CAY)	\N	\N	\N	book	Miyaoka, Osahito	2012	A Grammar of Central Alaskan Yupik (CAY)	\N	\N	\N	\N	\N	\N	\N	Berlin, New York	\N	\N	58	Mouton Grammar Library	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
134	2013-11-19 20:49:33.315867+01	2013-11-19 20:49:33.315878+01	t	{}	base	bowdenamalgamation2010	Adelaar, Alexander 2010	The amalgamation of Malagasy	\N	\N	\N	incollection	Adelaar, Alexander	2010	The amalgamation of Malagasy	\N	A journey through Austronesian and Papuan linguistic and cultural space. Papers in honour of Andrew K. Pawley	Bowden, John and Himmelmann, Nikolaus P. and Ross, Malcolm	\N	\N	\N	\N	Canberra	\N	\N	615	Pacific Linguistics	\N	Pacific Linguistics	\N	\N	\N	\N	\N	\N	1
135	2013-11-19 20:49:33.316951+01	2013-11-19 20:49:33.316961+01	t	{}	base	masicaindoaryan1991	Masica, Colin P. 1991	The Indo-Aryan languages	\N	\N	\N	book	Masica, Colin P.	1991	The Indo-Aryan languages	\N	\N	\N	\N	\N	\N	\N	Cambridge	\N	\N	\N	\N	\N	Cambridge University Press	\N	\N	\N	\N	\N	\N	1
136	2013-11-19 20:49:33.318038+01	2013-11-19 20:49:33.318046+01	t	{}	base	alvrerussische2002	Alvre, Paul 2002	Russische Lehnelemente in Indefinitpronomen und -adverbien der ostseefinnischen Sprachen	\N	\N	\N	article	Alvre, Paul	2002	Russische Lehnelemente in Indefinitpronomen und -adverbien der ostseefinnischen Sprachen	\N	\N	\N	161–164	\N	Linguistica Uralica	\N	\N	\N	\N	3	\N	38	\N	\N	\N	\N	\N	\N	\N	1
137	2013-11-19 20:49:33.319124+01	2013-11-19 20:49:33.319131+01	t	{}	base	kubiyakrucklaufiges2004	Kubiyak, Yel 2004	Rückläufiges Wörterbuch des Türkischen	\N	\N	\N	book	Kubiyak, Yel	2004	Rückläufiges Wörterbuch des Türkischen	\N	\N	\N	\N	\N	\N	\N	Frankfurt/M.	\N	\N	\N	\N	\N	Landeck	\N	\N	\N	\N	\N	\N	1
138	2013-11-19 20:49:33.320328+01	2013-11-19 20:49:33.320341+01	t	{}	base	quesadacastillogrammatica1976	Quesada Castillo, Félix 1976	Grammatica quechua Cajamarca-Cañaris	\N	\N	\N	book	Quesada Castillo, Félix	1976	Grammatica quechua Cajamarca-Cañaris	\N	\N	\N	\N	\N	\N	\N	Lima	\N	\N	\N	\N	\N	Instituto de estudios peruanos	\N	\N	\N	\N	\N	\N	1
139	2013-11-19 20:49:33.322159+01	2013-11-19 20:49:33.322179+01	t	{}	base	allingrammar1976	Allin, Trevor R. 1976	A Grammar of Resígaro	\N	\N	\N	book	Allin, Trevor R.	1976	A Grammar of Resígaro	\N	\N	\N	\N	\N	\N	\N	Horseleys Green	http://research-repository.st-andrews.ac.uk/handle/10023/1012	Ph.D. thesis	\N	\N	\N	Summer Institute of Linguistics	\N	\N	\N	\N	\N	\N	1
140	2013-11-19 20:49:33.323809+01	2013-11-19 20:49:33.323821+01	t	{}	base	liverbmedial1984	Li, Charles N. 1984	From verb-medial analytic language to verb-final synthetic language: A case of typological change	\N	\N	\N	incollection	Li, Charles N.	1984	From verb-medial analytic language to verb-final synthetic language: A case of typological change	\N	Proceedigs of the Thenth Annual Meeting of the Berkeley Linguistics Society	Brugman, Claudia and Macauley, Monica and Dahlstrom, Amy and Emanatian, Michele and Moonwomon, Birch and O'Connor, Catherine	307–323	\N	\N	\N	Berkeley	\N	\N	\N	\N	\N	Berkeley Linguistics Society	\N	\N	\N	\N	\N	\N	1
141	2013-11-19 20:49:33.324982+01	2013-11-19 20:49:33.324994+01	t	{}	base	roundkayardild2010	Round, Erich Ross 2010	Kayardild Morphology, Phonology and Morphosyntax	\N	\N	\N	phdthesis	Round, Erich Ross	2010	Kayardild Morphology, Phonology and Morphosyntax	Ph.D. thesis	\N	\N	\N	\N	\N	Yale University	New Haven	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
142	2013-11-19 20:49:33.326034+01	2013-11-19 20:49:33.326044+01	t	{}	base	hamdeorigin1986	Hamde, Kiflemariam 1986	The Origin and Development of Bilin	\N	\N	\N	book	Hamde, Kiflemariam	1986	The Origin and Development of Bilin	\N	\N	\N	\N	\N	\N	\N	Asmara	\N	\N	\N	\N	\N	Asmara University, The Institute of African Studies, Bilin Language Project	\N	\N	\N	\N	\N	\N	1
143	2013-11-19 20:49:33.327023+01	2013-11-19 20:49:33.327032+01	t	{}	base	adelaaraymarismos1987	Adelaar, Willem F. H. 1987	Aymarismos en el quechua de Puno	\N	\N	\N	article	Adelaar, Willem F. H.	1987	Aymarismos en el quechua de Puno	\N	\N	\N	223–231	\N	Indiana	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	\N	\N	\N	1
144	2013-11-19 20:49:33.327995+01	2013-11-19 20:49:33.328004+01	t	{}	base	vellardcontribucion1967	Vellard, Jean (Jehan) A. 1967	Contribución al estudio de la lengua uru	\N	\N	\N	book	Vellard, Jean (Jehan) A.	1967	Contribución al estudio de la lengua uru	\N	\N	\N	\N	\N	\N	\N	Buenos Aires	\N	\N	4	Cuadernos de Lingüística Indígena	\N	Universidad de Buenos Aires	\N	\N	\N	\N	\N	\N	1
145	2013-11-19 20:49:33.3291+01	2013-11-19 20:49:33.329111+01	t	{}	base	paschentlehnung1988	Pasch, Helma 1988	Die Entlehnung von Bantu-Präfixen in eine Nichtbantu-Sprache	\N	\N	\N	article	Pasch, Helma	1988	Die Entlehnung von Bantu-Präfixen in eine Nichtbantu-Sprache	\N	\N	\N	48–63	\N	Zeitschrift für Phonetik, Sprachwissenschaft und Kommunikationsforschung	\N	\N	\N	\N	1	\N	41	\N	\N	\N	\N	\N	\N	\N	1
146	2013-11-19 20:49:33.330326+01	2013-11-19 20:49:33.330337+01	t	{}	base	pakendorfcomparison2012	Pakendorf, Brigitte 2012	A comparison of copied morphemes in Sakha (Yakut) and Ėven	\N	\N	\N	unpublished	Pakendorf, Brigitte	2012	A comparison of copied morphemes in Sakha (Yakut) and Ėven	\N	\N	\N	\N	\N	\N	\N	Lyon	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
147	2013-11-19 20:49:33.331593+01	2013-11-19 20:49:33.331604+01	t	{}	base	raunessays1971	Raun, Alo 1971	Essays in Finno-Ugric and Finnic linguistics	\N	\N	\N	book	Raun, Alo	1971	Essays in Finno-Ugric and Finnic linguistics	\N	\N	\N	\N	\N	\N	\N	Bloomington, The Hague	\N	\N	107	Uralic and Altaic Series	\N	Indiana University, Mouton &Co	\N	\N	\N	\N	\N	\N	1
148	2013-11-19 20:49:33.332759+01	2013-11-19 20:49:33.332769+01	t	{}	base	sauersyrjanischen1963	Sauer, Gert 1963	Die syrjänischen Lehnsuffixe im Ostjakischen	\N	\N	\N	incollection	Sauer, Gert	1963	Die syrjänischen Lehnsuffixe im Ostjakischen	\N	Congressus Internationalis fenno-ugristarum. Budapestani habitus 20-24. IX. 1960	Bereczki, Gábor and Hajdú, P. and Képes, G. and László, Gy.	193–196	\N	\N	\N	Budapest	\N	\N	\N	\N	\N	Akadémiai Kiadó	\N	\N	\N	\N	\N	\N	1
149	2013-11-19 20:49:33.334014+01	2013-11-19 20:49:33.334026+01	t	{}	base	mishraword1996	Mishra, Awadhesh K. 1996	Word formation and language change in Kuṛux	\N	\N	\N	book	Mishra, Awadhesh K.	1996	Word formation and language change in Kuṛux	\N	\N	\N	\N	\N	\N	\N	Varanasi	\N	\N	\N	\N	\N	Tara Book Agency	\N	\N	\N	\N	\N	\N	1
150	2013-11-19 20:49:33.335137+01	2013-11-19 20:49:33.335148+01	t	{}	base	haasesprachkontakt1992	Haase, Martin 1992	Sprachkontakt und Sprachwandel im Baskenland : die Einflüsse des Gaskognischen und Französischen auf das Baskische	\N	\N	\N	book	Haase, Martin	1992	Sprachkontakt und Sprachwandel im Baskenland : die Einflüsse des Gaskognischen und Französischen auf das Baskische	\N	\N	\N	\N	\N	\N	\N	Hamburg	\N	\N	\N	\N	\N	Buske	\N	\N	\N	\N	\N	\N	1
151	2013-11-19 20:49:33.336234+01	2013-11-19 20:49:33.336245+01	t	{}	base	hurrenverbal1969	Hurren, H. Antony 1969	Verbal Aspect and Archi-Aspect in Istro-Rumanian	\N	\N	\N	article	Hurren, H. Antony	1969	Verbal Aspect and Archi-Aspect in Istro-Rumanian	\N	\N	\N	59–90	\N	La Linguistique	\N	\N	http://www.jstor.org/stable/30248126	ArticleType: research-article / Full publication date: 1969 / Copyright © 1969 Presses Universitaires de France	2	\N	5	\N	\N	\N	\N	\N	\N	\N	1
152	2013-11-19 20:49:33.337286+01	2013-11-19 20:49:33.337295+01	t	{}	base	taylormorpheme1959	Taylor, Douglas 1959	Morpheme Mergers in Island Carib	\N	\N	\N	article	Taylor, Douglas	1959	Morpheme Mergers in Island Carib	\N	\N	\N	190–195	\N	International Journal of American Linguistics	\N	\N	http://www.jstor.org/stable/1263796	ArticleType: research-article / Full publication date: Jul., 1959 / Copyright © 1959 The University of Chicago Press	3	\N	25	\N	\N	\N	\N	\N	\N	\N	1
153	2013-11-19 20:49:33.338348+01	2013-11-19 20:49:33.338358+01	t	{}	base	holtusrumanisch1989	Dahmen, Wolfgang 1989	Rumänisch: Areallinguistik IV. Istrorumänisch	\N	\N	\N	incollection	Dahmen, Wolfgang	1989	Rumänisch: Areallinguistik IV. Istrorumänisch	\N	Lexikon der romanistischen Linguistik. Vol. 3. Die Einzelnen Romanischen Sprachen Und Sprachgebiete Von Der Renaissance Bis Zur Gegenwart: Rumänisch, Dalmatisch-Istroromanisch, Friaulisch, Ladinisch, Bündnerromanisch	Holtus, Günter and Metzeltin, Michael and Schmitt, Christian	448–460	\N	\N	\N	Tübingen	\N	\N	\N	\N	\N	Niemeyer	\N	\N	\N	\N	\N	\N	1
154	2013-11-19 20:49:33.339364+01	2013-11-19 20:49:33.339373+01	t	{}	base	varolbornesjudeoespagnol2008	Varol-Bornes, Marie-Christine 2008	Le judéo-espagnol vernaculaire d'Istanbul	\N	\N	\N	book	Varol-Bornes, Marie-Christine	2008	Le judéo-espagnol vernaculaire d'Istanbul	\N	\N	\N	\N	\N	\N	\N	Bern	\N	\N	4	Sephardica	\N	Peter Lang	\N	\N	\N	\N	\N	\N	1
155	2013-11-19 20:49:33.340505+01	2013-11-19 20:49:33.340516+01	t	{}	base	hajeklanguage2006	Hajek, John 2006	Language Contact and Convergence in East Timor: The Case of Tetun Dili	\N	\N	\N	incollection	Hajek, John	2006	Language Contact and Convergence in East Timor: The Case of Tetun Dili	\N	Grammars in Contact. A Cross-Linguistic Typology	Aikhenvald, Alexandra Y. and Dixon, R. M. W.	163–178	\N	\N	\N	Oxford	\N	\N	4	Explorations in Linguistic Typology	\N	Oxford University Press	\N	\N	\N	\N	\N	\N	1
156	2013-11-19 20:49:33.341636+01	2013-11-19 20:49:33.341647+01	t	{}	base	sandfeldproblemes1938	Sandfeld, Kristian 1938	Problemes d'interferences linguistiques	\N	\N	\N	incollection	Sandfeld, Kristian	1938	Problemes d'interferences linguistiques	\N	Actes du Quatrieme Congres Internationale de Linguistes	\N	59–61	\N	\N	\N	Copenhagen	\N	\N	\N	\N	\N	Einar Munksgaard	\N	\N	\N	\N	\N	\N	1
157	2013-11-19 20:49:33.34272+01	2013-11-19 20:49:33.342731+01	t	{}	base	shipleyquapaw1988	Rankin, Robert L. 1988	Quapaw: genetic and areal affiliations	\N	\N	\N	incollection	Rankin, Robert L.	1988	Quapaw: genetic and areal affiliations	\N	In honor of Mary Haas. From the Haas Festival Conference on Native American linguistics	Shipley, William and Haas, Mary Rosamond	629–650	\N	\N	\N	Berlin, New York	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
158	2013-11-19 20:49:33.343843+01	2013-11-19 20:49:33.343852+01	t	{}	base	jastrowmesopotamischarabischen1978	Jastrow, Otto 1978	Die mesopotamisch-arabischen Qəltu-Dialekte: Band 1: Phonologie und Morphologie	\N	\N	\N	book	Jastrow, Otto	1978	Die mesopotamisch-arabischen Qəltu-Dialekte: Band 1: Phonologie und Morphologie	\N	\N	\N	\N	\N	\N	\N	Wiesbaden	\N	\N	43.4	Abhandlungen für die Kunde des Morgenlandes	\N	Steiner	\N	\N	\N	\N	\N	\N	1
159	2013-11-19 20:49:33.344845+01	2013-11-19 20:49:33.344853+01	t	{}	base	hualdegrammar2003	Hualde, José Ignacio and Urbina, Jon Ortiz de 2003	A grammar of Basque	\N	\N	\N	book	\N	2003	A grammar of Basque	\N	\N	Hualde, José Ignacio and Urbina, Jon Ortiz de	\N	\N	\N	\N	Berlin, New York	\N	\N	26	Mouton Grammar Library	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
160	2013-11-19 20:49:33.34579+01	2013-11-19 20:49:33.345798+01	t	{}	base	taylordiachronic1954	Taylor, Douglas 1954	Diachronic Note on the Carib Contribution to Island Carib	\N	\N	\N	article	Taylor, Douglas	1954	Diachronic Note on the Carib Contribution to Island Carib	\N	\N	\N	28–33	\N	International Journal of American Linguistics	\N	\N	http://www.jstor.org/stable/1263190	ArticleType: research-article / Full publication date: Jan., 1954 / Copyright © 1954 The University of Chicago Press	1	\N	20	\N	\N	\N	\N	\N	\N	\N	1
161	2013-11-19 20:49:33.34677+01	2013-11-19 20:49:33.346778+01	t	{}	base	capidanbilinguisme1940	Capidan, Theodor 1940	Le bilinguisme chez les Roumains	\N	\N	\N	article	Capidan, Theodor	1940	Le bilinguisme chez les Roumains	\N	\N	\N	73–94	\N	Langue et Littérature. Bulletin de la Section Littéraire de l'Académie Roumaine	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	1
162	2013-11-19 20:49:33.347833+01	2013-11-19 20:49:33.347842+01	t	{}	base	taylorlanguages1977	Taylor, Douglas 1977	Languages of the West Indies	\N	\N	\N	book	Taylor, Douglas	1977	Languages of the West Indies	\N	\N	\N	\N	\N	\N	\N	Baltimore	\N	\N	\N	Johns Hopkins studies in Atlantic history and culture	\N	Johns Hopkins University Press	\N	\N	\N	\N	\N	\N	1
163	2013-11-19 20:49:33.348927+01	2013-11-19 20:49:33.348938+01	t	{}	base	raunkarelian1964	Raun, Alo 1964	Karelian Survey	\N	\N	\N	book	Raun, Alo	1964	Karelian Survey	\N	\N	\N	\N	\N	\N	\N	Cleveland, Ohio	\N	\N	9	Research and Studies in Uralic and Altaic Languages	\N	Bell and Howell	\N	\N	\N	\N	\N	\N	1
164	2013-11-19 20:49:33.350028+01	2013-11-19 20:49:33.350039+01	t	{}	base	kornfiltturkish1997	Kornfilt, Jaklin 1997	Turkish	\N	\N	\N	book	Kornfilt, Jaklin	1997	Turkish	\N	\N	\N	\N	\N	\N	\N	London, New York	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	1
165	2013-11-19 20:49:33.35111+01	2013-11-19 20:49:33.351121+01	t	{}	base	mohligaspects1986	Möhlig, Wilhelm Johann Georg 1986	Aspects of the language history of the Ilwana: Former hunter-gatherers of the Central Tana Valley in Kenya	\N	\N	\N	article	Möhlig, Wilhelm Johann Georg	1986	Aspects of the language history of the Ilwana: Former hunter-gatherers of the Central Tana Valley in Kenya	\N	\N	\N	273–293	\N	Sprache und Geschichte in Afrika	\N	\N	\N	\N	1	\N	7	\N	\N	\N	\N	\N	\N	\N	1
166	2013-11-19 20:49:33.352178+01	2013-11-19 20:49:33.352189+01	t	{}	base	polanskazum2002	Polanska, Ineta 2002	Zum Einfluss des Lettischen auf das Deutsche im Baltikum	\N	\N	\N	phdthesis	Polanska, Ineta	2002	Zum Einfluss des Lettischen auf das Deutsche im Baltikum	Ph.D. dissertation	\N	\N	\N	\N	\N	Otto-Friedrich-Universität Bamberg	Bamberg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
167	2013-11-19 20:49:33.353272+01	2013-11-19 20:49:33.353282+01	t	{}	base	heathbasic1980	Heath, Jeffrey 1980	Basic materials in Ritharngu. Grammar, texts, and dictionary	\N	\N	\N	book	Heath, Jeffrey	1980	Basic materials in Ritharngu. Grammar, texts, and dictionary	\N	\N	\N	\N	\N	\N	\N	Canberra	\N	\N	59	Pacific Linguistics. Series B, Monographs	\N	Dept. of Linguistics	\N	\N	\N	\N	\N	\N	1
168	2013-11-19 20:49:33.354271+01	2013-11-19 20:49:33.35428+01	t	{}	base	adelaarloanwords2009	Adelaar, Alexander 2009	Loanwords in Malagasy	\N	\N	\N	incollection	Adelaar, Alexander	2009	Loanwords in Malagasy	\N	Loanwords in the World's Languages. A Comparative Handbook	Haspelmath, Martin and Tadmor, Uri	717–746	\N	\N	\N	Berlin	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
169	2013-11-19 20:49:33.355245+01	2013-11-19 20:49:33.355253+01	t	{}	base	fuchskomparativ1949	Fuchs, David R. 1949	Der Komparativ und Superlativ in den finnisch-ugrischen Sprachen	\N	\N	\N	article	Fuchs, David R.	1949	Der Komparativ und Superlativ in den finnisch-ugrischen Sprachen	\N	\N	\N	147–230	\N	Finnisch-ugrische Forschungen	\N	\N	\N	\N	1–2	\N	30	\N	\N	\N	\N	\N	\N	\N	1
170	2013-11-19 20:49:33.356275+01	2013-11-19 20:49:33.356287+01	t	{}	base	matrasgrammatical20073	Reershemius, Gertrud 2007	Grammatical borrowing in Yiddish	\N	\N	\N	incollection	Reershemius, Gertrud	2007	Grammatical borrowing in Yiddish	\N	Grammatical borrowing in cross-linguistic perspective	Matras, Yaron and Sakel, Jeanette	246–259	\N	\N	\N	Berlin, New York	\N	\N	38	Empirical approaches to language typology	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
171	2013-11-19 20:49:33.357355+01	2013-11-19 20:49:33.357366+01	t	{}	base	jansegreekturkish2009	Janse, Mark 2009	Greek-Turkish language contact in Asia Minor	\N	\N	\N	article	Janse, Mark	2009	Greek-Turkish language contact in Asia Minor	\N	\N	\N	37–54	\N	Études Helléniques/Hellenic Studies	\N	\N	\N	\N	1	\N	17	\N	\N	\N	\N	\N	\N	\N	1
172	2013-11-19 20:49:33.358442+01	2013-11-19 20:49:33.358453+01	t	{}	base	gokselturkish2005	Göksel, Aslı and Kerslake, Celia 2005	Turkish: a comprehensive grammar	\N	\N	\N	book	Göksel, Aslı and Kerslake, Celia	2005	Turkish: a comprehensive grammar	\N	\N	\N	\N	\N	\N	\N	London, New York	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	1
173	2013-11-19 20:49:33.359516+01	2013-11-19 20:49:33.359527+01	t	{}	base	bereczkiaz2002	Bereczki, Gábor 2002	Az alaktani elemek kölcsönzésének néhány típusa a Volga-Káma-vidéki area nyelveiben	\N	\N	\N	article	Bereczki, Gábor	2002	Az alaktani elemek kölcsönzésének néhány típusa a Volga-Káma-vidéki area nyelveiben	\N	\N	\N	97–101	\N	Nyelvtudományi Közlemények	\N	\N	\N	\N	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	1
174	2013-11-19 20:49:33.360572+01	2013-11-19 20:49:33.360582+01	t	{}	base	bulutiraqi2007	Bulut, Christiane 2007	Iraqi Turkman	\N	\N	\N	incollection	Bulut, Christiane	2007	Iraqi Turkman	\N	Languages of Iraq, ancient and modern	Postgate, J.N.	159–187	\N	\N	\N	London	\N	\N	\N	\N	\N	British School of Archaeology in Iraq	\N	\N	\N	\N	\N	\N	1
175	2013-11-19 20:49:33.361699+01	2013-11-19 20:49:33.361711+01	t	{}	base	kovacecdescrierea1971	Kovačec, August 1971	Descrierea istroromânei actuale	\N	\N	\N	book	Kovačec, August	1971	Descrierea istroromânei actuale	\N	\N	\N	\N	\N	\N	\N	Bucarest	\N	\N	\N	\N	\N	Editura Academiei Republicii Socialiste România	\N	\N	\N	\N	\N	\N	1
176	2013-11-19 20:49:33.362663+01	2013-11-19 20:49:33.362672+01	t	{}	base	bereczkicharacter1993	Bereczki, Gábor 1993	The character and scale of Turkic influence on the structure of Finno-Ugric languages	\N	\N	\N	incollection	Bereczki, Gábor	1993	The character and scale of Turkic influence on the structure of Finno-Ugric languages	\N	Comparative-Historical Linguistics. Indo-European and Finno-Ugric. Papers in Honor of Oswald Szemerényi III	Brogyanyi, Bela and Lipp, Reiner	509–519	\N	\N	\N	Amsterdam, Philadelphia	\N	\N	97	Current Issues in the Theory and History of Linguistic Science Series IV - Current Issues in Linguistic Theory	\N	John Benjamins	\N	\N	\N	\N	\N	\N	1
177	2013-11-19 20:49:33.363671+01	2013-11-19 20:49:33.363681+01	t	{}	base	sekerinacopper1994	Sekerina, Irina A. 1994	Copper Island (Mednyi) Aleut (CIA): A Mixed Language	\N	\N	\N	article	Sekerina, Irina A.	1994	Copper Island (Mednyi) Aleut (CIA): A Mixed Language	\N	\N	\N	14–31	\N	Languages of the World	\N	\N	\N	\N	1	\N	8	\N	\N	\N	\N	\N	\N	\N	1
178	2013-11-19 20:49:33.364874+01	2013-11-19 20:49:33.364883+01	t	{}	base	abbimanual2001	Abbi, Anvita 2001	A manual of linguistic field work and structures of Indian languages	\N	\N	\N	book	Abbi, Anvita	2001	A manual of linguistic field work and structures of Indian languages	\N	\N	\N	\N	\N	\N	\N	Munich	\N	\N	17	LINCOM Handbooks in Linguistics	\N	Lincom	\N	\N	\N	\N	\N	\N	1
179	2013-11-19 20:49:33.365924+01	2013-11-19 20:49:33.365934+01	t	{}	base	zavalaoraciones2007	Zavala, Roberto 2007	Las oraciones de relativo en lenguas cholanas, un calque zoqueano	\N	\N	\N	inproceedings	Zavala, Roberto	2007	Las oraciones de relativo en lenguas cholanas, un calque zoqueano	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
180	2013-11-19 20:49:33.366959+01	2013-11-19 20:49:33.366968+01	t	{}	base	reinischbilinsprache1882	Reinisch, Leo 1882	Die Bilīn-Sprache in Nordost-Afrika	\N	\N	\N	book	Reinisch, Leo	1882	Die Bilīn-Sprache in Nordost-Afrika	\N	\N	\N	\N	\N	\N	\N	Wien	http://www.archive.org/details/diekafasprachein00rein	\N	\N	\N	\N	F. Tempsky	\N	\N	\N	\N	\N	\N	1
181	2013-11-19 20:49:33.367998+01	2013-11-19 20:49:33.368007+01	t	{}	base	walikashmiri1996	Wali, Kashi and Koul, Omkar N. 1996	Kashmiri. A cognitive-descriptive grammar	\N	\N	\N	book	Wali, Kashi and Koul, Omkar N.	1996	Kashmiri. A cognitive-descriptive grammar	\N	\N	\N	\N	\N	\N	\N	London, New York	\N	\N	\N	Routledge Descriptive Grammars	\N	Routledge	\N	\N	\N	\N	\N	\N	1
182	2013-11-19 20:49:33.369049+01	2013-11-19 20:49:33.369057+01	t	{}	base	hiedapatterns2011	Vossen, Rainer 2011	Patterns of linguistic convergence in the Khoe-speaking area of southern Africa	\N	\N	\N	incollection	Vossen, Rainer	2011	Patterns of linguistic convergence in the Khoe-speaking area of southern Africa	\N	Geographical Typology and Linguistic Areas: With special reference to Africa	Hieda, Osamu and König, Christa and Nakagawa, Hirosi	189–200	\N	\N	\N	Amsterdam, Philadelphia	\N	\N	\N	\N	\N	John Benjamins	\N	\N	\N	\N	\N	\N	1
183	2013-11-19 20:49:33.370083+01	2013-11-19 20:49:33.370093+01	t	{}	base	breuzur1992	Breu, Walter 1992	Zur Rolle der Präfigierung bei der Entstehung von Aspektsystemen	\N	\N	\N	incollection	Breu, Walter	1992	Zur Rolle der Präfigierung bei der Entstehung von Aspektsystemen	\N	Linguistique et slavistique : Mélanges offerts à Paul Garde. Tome 1	\N	117–135	\N	\N	\N	Aix-en-Provence, Paris	http://www.slavistik-portal.de/datenpool/bibdatslav-db.html?data=252	\N	36	Travaux publiés par l'Institut d'Etudes slaves	\N	Publications de l'Université de Provence	\N	\N	\N	\N	\N	\N	1
184	2013-11-19 20:49:33.371197+01	2013-11-19 20:49:33.371208+01	t	{}	base	andronovbrahui1980	Andronov, Mikhail Sergeevich 1980	The Brahui language	\N	\N	\N	book	Andronov, Mikhail Sergeevich	1980	The Brahui language	\N	\N	\N	\N	\N	\N	\N	Moscow	\N	\N	\N	\N	\N	Nauka	\N	\N	\N	\N	\N	\N	1
185	2013-11-19 20:49:33.372368+01	2013-11-19 20:49:33.372379+01	t	{}	base	boretzkymorphologische1991	Boretzky, Norbert and Igla, Birgit 1991	Morphologische Entlehnung in den Romani-Dialekten	\N	\N	\N	book	Boretzky, Norbert and Igla, Birgit	1991	Morphologische Entlehnung in den Romani-Dialekten	\N	\N	\N	\N	\N	\N	\N	Essen	\N	\N	1	Arbeitspapiere des Projekts "Prinzipien des Sprachwandels"	\N	Universität GH Essen. Fachbereich Sprach- und Literaturwissenschaften	\N	\N	\N	\N	\N	\N	1
186	2013-11-19 20:49:33.373579+01	2013-11-19 20:49:33.373589+01	t	{}	base	heathbasic19801	Heath, Jeffrey 1980	Basic materials in Warndarang. Grammar, texts and dictionary	\N	\N	\N	book	Heath, Jeffrey	1980	Basic materials in Warndarang. Grammar, texts and dictionary	\N	\N	\N	\N	\N	\N	\N	Canberra	\N	\N	72	Pacific Linguistics. Series B, Monographs	\N	Australian Natl. Univ.	\N	\N	\N	\N	\N	\N	1
187	2013-11-19 20:49:33.374765+01	2013-11-19 20:49:33.374776+01	t	{}	base	laanesteinfuhrung1982	Laanest, Arvo 1982	Einführung in die ostseefinnischen Sprachen	\N	\N	\N	book	Laanest, Arvo	1982	Einführung in die ostseefinnischen Sprachen	\N	\N	\N	\N	\N	\N	\N	Hamburg	\N	\N	\N	\N	\N	Buske	\N	\N	\N	\N	\N	\N	1
188	2013-11-19 20:49:33.375939+01	2013-11-19 20:49:33.375951+01	t	{}	base	postnorthern2006	Post, Margje 2006	The Northern Russian pragmatic particle dak in the dialect of Varzuga (Kola Peninsula). An information structuring device in informal spontaneous speech	\N	\N	\N	phdthesis	Post, Margje	2006	The Northern Russian pragmatic particle dak in the dialect of Varzuga (Kola Peninsula). An information structuring device in informal spontaneous speech	Ph.D. thesis	\N	\N	\N	\N	\N	University of Tromsø	Tromsø	http://www.ub.uit.no/munin/handle/10037/246	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
189	2013-11-19 20:49:33.377155+01	2013-11-19 20:49:33.377166+01	t	{}	base	taylorisland1956	Taylor, Douglas 1956	Island Carib II: Word-Classes, Affixes, Nouns, and Verbs	\N	\N	\N	article	Taylor, Douglas	1956	Island Carib II: Word-Classes, Affixes, Nouns, and Verbs	\N	\N	\N	1–44	\N	International Journal of American Linguistics	\N	\N	http://www.jstor.org/stable/1263576	ArticleType: research-article / Full publication date: Jan., 1956 / Copyright © 1956 The University of Chicago Press	1	\N	22	\N	\N	\N	\N	\N	\N	\N	1
190	2013-11-19 20:49:33.37819+01	2013-11-19 20:49:33.378198+01	t	{}	base	seifartdirect2013	Seifart, Frank 2013	Direct and indirect affix borrowing	\N	\N	\N	unpublished	Seifart, Frank	2013	Direct and indirect affix borrowing	Manuscript	\N	\N	\N	\N	\N	\N	Leipzig: Max Planck Institute for Evolutionary Anthropology	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
191	2013-11-19 20:49:33.379235+01	2013-11-19 20:49:33.379246+01	t	{}	base	kossmanninflectional2011	Kossmann, Maarten 2011	On Inflectional Borrowing	\N	\N	\N	misc	Kossmann, Maarten	2011	On Inflectional Borrowing	\N	\N	\N	\N	\N	\N	\N	Paper presented at Rethinking Contact Induced Change. Leiden, June 9-11, 2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
192	2013-11-19 20:49:33.380336+01	2013-11-19 20:49:33.380347+01	t	{}	base	cohenhebrew2012	Cohen, Evan-Gary and Laks, Lior 2012	Hebrew Bases with Borrowed Affixes: A Multi-dimensional Account	\N	\N	\N	misc	Cohen, Evan-Gary and Laks, Lior	2012	Hebrew Bases with Borrowed Affixes: A Multi-dimensional Account	Paper presented at IMM15 Vienna 9–12 February 2012, Workshop on Borrowed Morphology Form and Meaning	\N	\N	\N	\N	\N	\N	Vienna	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
193	2013-11-19 20:49:33.381356+01	2013-11-19 20:49:33.381364+01	t	{}	base	guldemannist1992	Güldemann, Tom 1992	Ist Swahili eine monogenetische Einheit? - Betrachtungen aus der Sicht peripherer Varietäten unter besonderer Berücksichtigung der Verbalmorphologie	\N	\N	\N	article	Güldemann, Tom	1992	Ist Swahili eine monogenetische Einheit? - Betrachtungen aus der Sicht peripherer Varietäten unter besonderer Berücksichtigung der Verbalmorphologie	\N	\N	\N	35–62	\N	Afrikanische Arbeitspapiere. Schriftenreihe des Kölner Instituts für Afrikanistik	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	1
194	2013-11-19 20:49:33.382552+01	2013-11-19 20:49:33.382563+01	t	{}	base	tenserlithuanian2005	Tenser, Anton 2005	Lithuanian Romani	\N	\N	\N	book	Tenser, Anton	2005	Lithuanian Romani	\N	\N	\N	\N	\N	\N	\N	Munich	\N	\N	\N	Languages of the world. Materials	452	Lincom	\N	\N	\N	\N	\N	\N	1
195	2013-11-19 20:49:33.383673+01	2013-11-19 20:49:33.383684+01	t	{}	base	weinreichyiddish1958	Weinreich, Uriel 1958	Yiddish and Colonial German in Eastern Europe	\N	\N	\N	incollection	Weinreich, Uriel	1958	Yiddish and Colonial German in Eastern Europe	\N	American contributions to the Fourth International Congress of Slavicists, Moscow, September 1958	\N	369–419	\N	\N	\N	's-Gravenhage	\N	\N	21	Slavistic printings and reprintings	\N	Mouton	\N	\N	\N	\N	\N	\N	1
196	2013-11-19 20:49:33.384815+01	2013-11-19 20:49:33.384824+01	t	{}	base	schwarzwaldinflection1998	Schwarzwald, Ora (Rodrigue) 1998	Inflection and Derivation in Hebrew Linear Word Formation	\N	\N	\N	article	Schwarzwald, Ora (Rodrigue)	1998	Inflection and Derivation in Hebrew Linear Word Formation	\N	\N	\N	265–288	\N	Folia Linguistica	\N	\N	http://www.reference-global.com/doi/pdf/10.1515/flin.1998.32.3-4.265	\N	3-4	\N	32	\N	\N	\N	\N	\N	\N	\N	1
197	2013-11-19 20:49:33.385801+01	2013-11-19 20:49:33.385809+01	t	{}	base	boretzkymorphologische2004	Boretzky, Norbert 2004	Morphologische Entlehnung und Lehnübersetzung	\N	\N	\N	incollection	Boretzky, Norbert	2004	Morphologische Entlehnung und Lehnübersetzung	\N	Morphology / Morphologie. An International Handbook on Inflection and Word-Formation / Ein internationales Handbuch zur Flexion und Wortbildung. Part 2/Teil 2	Booij, Geert E. and Lehmann, Christian and Mugdan, Joachim and Skopeteas, Stavros and Kesselheim, in collaboration with Wolfgang	1644–1652	\N	\N	\N	Berlin, New York	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
198	2013-11-19 20:49:33.3869+01	2013-11-19 20:49:33.386907+01	t	{}	base	weinreichlanguages1953	Weinreich, Uriel 1953	Languages in Contact	\N	\N	\N	book	Weinreich, Uriel	1953	Languages in Contact	\N	\N	\N	\N	\N	\N	\N	New York	\N	\N	\N	\N	\N	Linguistic Circle of New York	\N	\N	\N	\N	\N	\N	1
199	2013-11-19 20:49:33.387886+01	2013-11-19 20:49:33.387894+01	t	{}	base	riionheimomorfologinen2010	Riionheimo, Helka 2010	Morfologinen limittyminen suomen ja viron kontaktissa	\N	\N	\N	article	Riionheimo, Helka	2010	Morfologinen limittyminen suomen ja viron kontaktissa	\N	\N	\N	218–239	\N	Lähivõrdlusi. Lähivertailuja	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	1
200	2013-11-19 20:49:33.38893+01	2013-11-19 20:49:33.388938+01	t	{}	base	wurmwutun1996	Lee-Smith, Mei W. and Wurm, Stephen A. 1996	The Wutun language	\N	\N	\N	incollection	Lee-Smith, Mei W. and Wurm, Stephen A.	1996	The Wutun language	\N	Atlas of languages of intercultural communication in the Pacific, Asia and the Americas. Volume 2, Part 1	Wurm, Stephen A. and Mühlhäusler, Peter and Tryon, Darrell T.	883–897	\N	\N	\N	Berlin, New York	\N	\N	13	Trends in Linguistics, Documentation Series	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
201	2013-11-19 20:49:33.389911+01	2013-11-19 20:49:33.389919+01	t	{}	base	matraslanguage2009	Matras, Yaron 2009	Language contact	\N	\N	\N	book	Matras, Yaron	2009	Language contact	\N	\N	\N	\N	\N	\N	\N	Cambridge	\N	\N	\N	\N	\N	Cambridge University Press	\N	\N	\N	\N	\N	\N	1
202	2013-11-19 20:49:33.390916+01	2013-11-19 20:49:33.390928+01	t	{}	base	abbilanguage1995	Abbi, Anvita 1995	Language Contact and Language Restructuring. A Case Study of Tribal languages of Central India	\N	\N	\N	article	Abbi, Anvita	1995	Language Contact and Language Restructuring. A Case Study of Tribal languages of Central India	\N	\N	\N	175–185	\N	International Journal of the Sociology of Language	\N	\N	\N	\N	\N	\N	116	\N	\N	\N	\N	\N	\N	\N	1
203	2013-11-19 20:49:33.392048+01	2013-11-19 20:49:33.392058+01	t	{}	base	thomasonmednyj1997	Thomason, Sarah G. 1997	Mednyj Aleut	\N	\N	\N	incollection	Thomason, Sarah G.	1997	Mednyj Aleut	\N	Contact Languages. A wider perspective	Thomason, Sarah G.	449–468	\N	\N	\N	Amsterdam, Philadelphia	\N	\N	\N	\N	\N	John Benjamins	\N	\N	\N	\N	\N	\N	1
204	2013-11-19 20:49:33.3931+01	2013-11-19 20:49:33.393109+01	t	{}	base	bhatdescriptive1987	Bhat, Roopkrishen 1987	A descriptive study of Kashmiri	\N	\N	\N	book	Bhat, Roopkrishen	1987	A descriptive study of Kashmiri	\N	\N	\N	\N	\N	\N	\N	Delhi	\N	\N	\N	\N	\N	Amar Prakashan	\N	\N	\N	\N	\N	\N	1
205	2013-11-19 20:49:33.394162+01	2013-11-19 20:49:33.394174+01	t	{}	base	knowlesdescriptive1984	Knowles, Susan Marie 1984	A descriptive grammar of Chontal Maya (San Carlos dialect)	\N	\N	\N	phdthesis	Knowles, Susan Marie	1984	A descriptive grammar of Chontal Maya (San Carlos dialect)	Ph.D. thesis	\N	\N	\N	\N	\N	Tulane University	New Orleans	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
206	2013-11-19 20:49:33.395303+01	2013-11-19 20:49:33.395314+01	t	{}	base	masliyahfour1996	Masliyah, Sadok 1996	Four Turkish affixes in Iraqi Arabic: -li, -lik, -siz and -çi	\N	\N	\N	article	Masliyah, Sadok	1996	Four Turkish affixes in Iraqi Arabic: -li, -lik, -siz and -çi	\N	\N	\N	291–300	\N	Journal of Semitic Studies	\N	\N	http://jss.oxfordjournals.org/content/XLI/2/291.citation	\N	2	\N	16	\N	\N	\N	\N	\N	\N	\N	1
207	2013-11-19 20:49:33.39639+01	2013-11-19 20:49:33.396401+01	t	{}	base	rozencvejginterference1976	Rozencvejg, Victor Ju. 1976	Interference and convergent change	\N	\N	\N	book	Rozencvejg, Victor Ju.	1976	Interference and convergent change	\N	\N	\N	\N	\N	\N	\N	The Hague, Paris	\N	\N	\N	\N	\N	Mouton	\N	\N	\N	\N	\N	\N	1
208	2013-11-19 20:49:33.397569+01	2013-11-19 20:49:33.39758+01	t	{}	base	rothverbe1979	Roth, Arlette 1979	Le verbe dans le parler arabe de Kormakiti (Chypre): Morphologie et elements de syntaxe (Atlas linguistique du monde arabe)	\N	\N	\N	book	Roth, Arlette	1979	Le verbe dans le parler arabe de Kormakiti (Chypre): Morphologie et elements de syntaxe (Atlas linguistique du monde arabe)	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Études chamito-sémitiques G.L.E.C.S.	\N	Librairie orientaliste P. Geuthner	\N	\N	\N	\N	\N	\N	1
209	2013-11-19 20:49:33.398778+01	2013-11-19 20:49:33.398789+01	t	{}	base	grantcontactinduced2010	Grant, Anthony P. 2010	Contact-induced change beyond the lexicon: A comparison of some heavily borrowing languages	\N	\N	\N	misc	Grant, Anthony P.	2010	Contact-induced change beyond the lexicon: A comparison of some heavily borrowing languages	Paper	\N	\N	\N	\N	\N	\N	Max Planck Institute for Evolutionary Anthropology, Leipzig	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
210	2013-11-19 20:49:33.399867+01	2013-11-19 20:49:33.399876+01	t	{}	base	koulstudies2005	Koul, Omkar N. 2005	Studies in Kashmiri linguistics	\N	\N	\N	book	Koul, Omkar N.	2005	Studies in Kashmiri linguistics	\N	\N	\N	\N	\N	\N	\N	Delhi	\N	\N	\N	\N	\N	Indian Institute of Language Studies	\N	\N	\N	\N	\N	\N	1
211	2013-11-19 20:49:33.400913+01	2013-11-19 20:49:33.400921+01	t	{}	base	sauernominalbildung1967	Sauer, Gert 1967	Die Nominalbildung im Ostjakischen	\N	\N	\N	book	Sauer, Gert	1967	Die Nominalbildung im Ostjakischen	\N	\N	\N	\N	\N	\N	\N	Berlin	\N	\N	5	Finnisch-Ugrische Studien	\N	Akademie Verlag	\N	\N	\N	\N	\N	\N	1
212	2013-11-19 20:49:33.401961+01	2013-11-19 20:49:33.40197+01	t	{}	base	nisanyansozlerin2009	Nişanyan, Sevan 2009	Sözlerin soyagaci. Çagdas Türkçenin etimolojik sözlügü	\N	\N	\N	book	Nişanyan, Sevan	2009	Sözlerin soyagaci. Çagdas Türkçenin etimolojik sözlügü	\N	\N	\N	\N	\N	\N	\N	Cagaloglu, Istanbul	http://www.nisanyansozluk.com/	\N	\N	\N	\N	Everest Yayinlari	\N	\N	\N	\N	\N	\N	1
213	2013-11-19 20:49:33.403035+01	2013-11-19 20:49:33.403043+01	t	{}	base	heathngandi1978	Heath, Jeffrey 1978	Ngandi grammar, texts, and dictionary	\N	\N	\N	book	Heath, Jeffrey	1978	Ngandi grammar, texts, and dictionary	\N	\N	\N	\N	\N	\N	\N	Canberra	\N	\N	\N	\N	\N	Australian Institute of Aboriginal Studies	\N	\N	\N	\N	\N	\N	1
214	2013-11-19 20:49:33.404187+01	2013-11-19 20:49:33.404198+01	t	{}	base	vasquezalvarezgrammar2011	Vásquez Álvarez, Juan Jesús 2011	A Grammar of Chol, a Mayan Language	\N	\N	\N	phdthesis	Vásquez Álvarez, Juan Jesús	2011	A Grammar of Chol, a Mayan Language	Ph.D. thesis	\N	\N	\N	\N	\N	University of Texas at Austin	Austin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
215	2013-11-19 20:49:33.405387+01	2013-11-19 20:49:33.405398+01	t	{}	base	zenginturkcenin2009	Zengin, Dursun 2009	Türkçenin tersine sözlügü	\N	\N	\N	book	Zengin, Dursun	2009	Türkçenin tersine sözlügü	\N	\N	\N	\N	\N	\N	\N	Ankara	\N	\N	\N	\N	\N	Kurmay	\N	\N	\N	\N	\N	\N	1
216	2013-11-19 20:49:33.406459+01	2013-11-19 20:49:33.40647+01	t	{}	base	taylorlinguistic1980	Taylor, Douglas and Hoff, Berend J. 1980	The Linguistic Repertory of the Island-Carib in the Seventeenth Century: The Men's Language: A Carib Pidgin?	\N	\N	\N	article	Taylor, Douglas and Hoff, Berend J.	1980	The Linguistic Repertory of the Island-Carib in the Seventeenth Century: The Men's Language: A Carib Pidgin?	\N	\N	\N	301–312	\N	International Journal of American Linguistics	\N	\N	http://www.jstor.org/stable/1264711	ArticleType: research-article / Full publication date: Oct., 1980 / Copyright © 1980 The University of Chicago Press	4	\N	46	\N	\N	\N	\N	\N	\N	\N	1
217	2013-11-19 20:49:33.407483+01	2013-11-19 20:49:33.407491+01	t	{}	base	hasselblattkomisaamirussian2011	Blokland, Rogier and Rießler, Michael 2011	Komi-Saami-Russian contacts on the Kola peninsula	\N	\N	\N	incollection	Blokland, Rogier and Rießler, Michael	2011	Komi-Saami-Russian contacts on the Kola peninsula	\N	Language Contact in Times of Globalization	Hasselblatt, Cornelius and Houtzagers, Peter and Pareren, Remco van	5–26	\N	\N	\N	Amsterdam, New York	\N	\N	\N	Studies in Slavic and General Linguistics	\N	Rodopi	\N	\N	\N	\N	\N	\N	1
218	2013-11-19 20:49:33.40854+01	2013-11-19 20:49:33.408552+01	t	{}	base	samelykedang1991	Samely, Ursula 1991	Kedang (Eastern Indonesia). Some aspects of its grammar	\N	\N	\N	book	Samely, Ursula	1991	Kedang (Eastern Indonesia). Some aspects of its grammar	\N	\N	\N	\N	\N	\N	\N	Hamburg	\N	\N	46	Forum Phoenticum	\N	Buske	\N	\N	\N	\N	\N	\N	1
219	2013-11-19 20:49:33.409757+01	2013-11-19 20:49:33.409768+01	t	{}	base	tadmorloanwords20091	Tadmor, Uri 2009	Loanwords in Indonesian	\N	\N	\N	incollection	Tadmor, Uri	2009	Loanwords in Indonesian	\N	Loanwords in the World's Languages. A Comparative Handbook	Haspelmath, Martin and Tadmor, Uri	686–716	\N	\N	\N	Berlin	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
220	2013-11-19 20:49:33.410879+01	2013-11-19 20:49:33.410888+01	t	{}	base	breuuberlegungen1996	Breu, Walter 1996	Überlegungen zu einer Klassifizierung des grammatischen Wandels im Sprachkontakt (am Beispiel slavischer Kontaktfälle)	\N	\N	\N	article	Breu, Walter	1996	Überlegungen zu einer Klassifizierung des grammatischen Wandels im Sprachkontakt (am Beispiel slavischer Kontaktfälle)	\N	\N	\N	21–38	\N	Sprachtypologie und Universalienforschung	\N	\N	\N	\N	\N	\N	49	\N	\N	\N	\N	\N	\N	\N	1
221	2013-11-19 20:49:33.411942+01	2013-11-19 20:49:33.41195+01	t	{}	base	magistesuffixentlehnung1968	Mägiste, Julius 1968	Suffixentlehnung in den finnisch-ugrischen Sprachen, insbesondere aus dem Russischen	\N	\N	\N	article	Mägiste, Julius	1968	Suffixentlehnung in den finnisch-ugrischen Sprachen, insbesondere aus dem Russischen	\N	\N	\N	1–30	\N	Journal de la Societé Finno-Ougrienne/Suomalais-ugrilaisen Seuran Aikakauskirja	\N	\N	\N	\N	2	\N	69	\N	\N	\N	\N	\N	\N	\N	1
222	2013-11-19 20:49:33.412951+01	2013-11-19 20:49:33.412959+01	t	{}	base	demirajgjuha1988	Demiraj, Shaban 1988	Gjuha shqipe dhe historia e saj	\N	\N	\N	book	Demiraj, Shaban	1988	Gjuha shqipe dhe historia e saj	\N	\N	\N	\N	\N	\N	\N	Tiranë	\N	\N	\N	\N	\N	Shtëpia Botuese e Librit Universitar	\N	\N	\N	\N	\N	\N	1
223	2013-11-19 20:49:33.413904+01	2013-11-19 20:49:33.413912+01	t	{}	base	emeneaubrahui1962	Emeneau, Murray Barnson 1962	Brahui and Dravidian comparative grammar	\N	\N	\N	book	Emeneau, Murray Barnson	1962	Brahui and Dravidian comparative grammar	\N	\N	\N	\N	\N	\N	\N	Berkeley, Los Angeles	\N	\N	27	University of California Publications in Linguistics	\N	University of California Press	\N	\N	\N	\N	\N	\N	1
224	2013-11-19 20:49:33.415177+01	2013-11-19 20:49:33.415204+01	t	{}	base	chamoreaugenero2005	de Pury, Sybille 2005	El género en garífuna. Un análisis dinámico	\N	\N	\N	incollection	de Pury, Sybille	2005	El género en garífuna. Un análisis dinámico	\N	Dinámica lingüística de las lenguas en contacto	Chamoreau, Claudine and Lastra, Yolanda	\N	\N	\N	\N	Hermosillo, Sonora	\N	\N	2	Colección Lingüística : Serie Simposios	\N	Universidad de Sonora	\N	\N	\N	\N	\N	\N	1
225	2013-11-19 20:49:33.41637+01	2013-11-19 20:49:33.41638+01	t	{}	base	muyskenspanish2012	Muysken, Pieter 2012	Spanish affixes in the Quechua languages: A multidimensional perspective	\N	\N	\N	article	Muysken, Pieter	2012	Spanish affixes in the Quechua languages: A multidimensional perspective	\N	\N	\N	481–493	\N	Lingua	\N	\N	http://www.sciencedirect.com/science/article/pii/S0024384111001975	\N	5	\N	122	\N	\N	\N	\N	\N	\N	\N	1
226	2013-11-19 20:49:33.417566+01	2013-11-19 20:49:33.417577+01	t	{}	base	newtonarabicgreek1964	Newton, Brian 1964	An Arabic-Greek Dialect	\N	\N	\N	incollection	Newton, Brian	1964	An Arabic-Greek Dialect	\N	Papers in Memory of George C. Pappageotes (=Supplement to Word 20:3)	Austerlitz, Robert	43–52	\N	\N	\N	New York	\N	\N	\N	\N	\N	Linguistic Circle of New York	\N	\N	\N	\N	\N	\N	1
227	2013-11-19 20:49:33.418756+01	2013-11-19 20:49:33.418767+01	t	{}	base	durreinfuhrung2012	Dürr, Michael 2012	Einführung in die Mayasprache Ch’ol	\N	\N	\N	book	Dürr, Michael	2012	Einführung in die Mayasprache Ch’ol	\N	\N	\N	\N	\N	\N	\N	Berlin	http://home.snafu.de/duerr/PDF_Doku/Cholkurs.pdf	\N	\N	\N	\N	Lateinamerikainstitut der Freien Universität Berlin	\N	\N	\N	\N	\N	\N	1
228	2013-11-19 20:49:33.420034+01	2013-11-19 20:49:33.420042+01	t	{}	base	hildebrandtgrammar2004	Hildebrandt, Kristine A. 2004	A Grammar and Glossary of the Manange Language	\N	\N	\N	book	Hildebrandt, Kristine A.	2004	A Grammar and Glossary of the Manange Language	\N	\N	\N	\N	\N	\N	\N	Santa Barbara	\N	\N	\N	\N	\N	University of California, Santa Barbara	\N	\N	\N	\N	\N	\N	1
229	2013-11-19 20:49:33.421224+01	2013-11-19 20:49:33.421235+01	t	{}	base	steeverbrahui1998	Elfenbein, Joseph 1998	Brahui	\N	\N	\N	incollection	Elfenbein, Joseph	1998	Brahui	\N	The Dravidian languages	Steever, Sanford B.	388–414	\N	\N	\N	London	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	1
230	2013-11-19 20:49:33.422418+01	2013-11-19 20:49:33.422428+01	t	{}	base	pakendorfcopied2010	Pakendorf, Brigitte 2010	Copied morphemes in Sakha and Ėven – a comparison	\N	\N	\N	misc	Pakendorf, Brigitte	2010	Copied morphemes in Sakha and Ėven – a comparison	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Paper presented at the workshop Bound morphology in common: copy or cognate?, 43rd Annual Meeting of the Societas Linguistica Europaea, 2-5 September 2010, Vilnius University	\N	\N	\N	\N	\N	\N	1
231	2013-11-19 20:49:33.423603+01	2013-11-19 20:49:33.423613+01	t	{}	base	mcconvellgurindji2005	McConvell, Patrick and Meakins, Felicity 2005	Gurindji Kriol: A Mixed Language Emerges from Code-switching	\N	\N	\N	article	McConvell, Patrick and Meakins, Felicity	2005	Gurindji Kriol: A Mixed Language Emerges from Code-switching	\N	\N	\N	9–30	\N	Australian Journal of Linguistics	\N	\N	\N	\N	1	\N	25	\N	\N	\N	\N	\N	\N	\N	1
232	2013-11-19 20:49:33.42483+01	2013-11-19 20:49:33.424841+01	t	{}	base	matrasgrammatical20075	Haig, Geoffrey 2007	Grammatical Borrowing in Kurdish (Northern Group)	\N	\N	\N	incollection	Haig, Geoffrey	2007	Grammatical Borrowing in Kurdish (Northern Group)	\N	Grammatical Borrowing in Cross-Linguistic Perspective	Matras, Yaron and Sakel, Jeanette	165–183	\N	\N	\N	Berlin, New York	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	1
\.


--
-- Data for Name: source_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY source_data (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Data for Name: source_data_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY source_data_history (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Name: source_data_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('source_data_history_pk_seq', 1, false);


--
-- Name: source_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('source_data_pk_seq', 1, false);


--
-- Data for Name: source_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY source_files (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Data for Name: source_files_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY source_files_history (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Name: source_files_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('source_files_history_pk_seq', 1, false);


--
-- Name: source_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('source_files_pk_seq', 1, false);


--
-- Data for Name: source_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY source_history (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, glottolog_id, google_book_search_id, bibtex_type, author, year, title, type, booktitle, editor, pages, edition, journal, school, address, url, note, number, series, volume, publisher, organization, chapter, howpublished, year_int, startpage_int, pages_int, version) FROM stdin;
\.


--
-- Name: source_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('source_history_pk_seq', 1, false);


--
-- Name: source_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('source_pk_seq', 232, true);


--
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unit (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, language_pk, version) FROM stdin;
\.


--
-- Data for Name: unit_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unit_data (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Data for Name: unit_data_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unit_data_history (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Name: unit_data_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unit_data_history_pk_seq', 1, false);


--
-- Name: unit_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unit_data_pk_seq', 1, false);


--
-- Data for Name: unit_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unit_files (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Data for Name: unit_files_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unit_files_history (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Name: unit_files_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unit_files_history_pk_seq', 1, false);


--
-- Name: unit_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unit_files_pk_seq', 1, false);


--
-- Data for Name: unit_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unit_history (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, language_pk, version) FROM stdin;
\.


--
-- Name: unit_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unit_history_pk_seq', 1, false);


--
-- Name: unit_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unit_pk_seq', 1, false);


--
-- Data for Name: unitdomainelement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitdomainelement (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, unitparameter_pk, ord, version) FROM stdin;
\.


--
-- Data for Name: unitdomainelement_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitdomainelement_data (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Data for Name: unitdomainelement_data_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitdomainelement_data_history (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Name: unitdomainelement_data_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitdomainelement_data_history_pk_seq', 1, false);


--
-- Name: unitdomainelement_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitdomainelement_data_pk_seq', 1, false);


--
-- Data for Name: unitdomainelement_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitdomainelement_files (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Data for Name: unitdomainelement_files_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitdomainelement_files_history (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Name: unitdomainelement_files_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitdomainelement_files_history_pk_seq', 1, false);


--
-- Name: unitdomainelement_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitdomainelement_files_pk_seq', 1, false);


--
-- Data for Name: unitdomainelement_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitdomainelement_history (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, unitparameter_pk, ord, version) FROM stdin;
\.


--
-- Name: unitdomainelement_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitdomainelement_history_pk_seq', 1, false);


--
-- Name: unitdomainelement_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitdomainelement_pk_seq', 1, false);


--
-- Data for Name: unitparameter; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitparameter (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, version) FROM stdin;
\.


--
-- Data for Name: unitparameter_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitparameter_data (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Data for Name: unitparameter_data_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitparameter_data_history (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Name: unitparameter_data_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitparameter_data_history_pk_seq', 1, false);


--
-- Name: unitparameter_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitparameter_data_pk_seq', 1, false);


--
-- Data for Name: unitparameter_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitparameter_files (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Data for Name: unitparameter_files_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitparameter_files_history (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Name: unitparameter_files_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitparameter_files_history_pk_seq', 1, false);


--
-- Name: unitparameter_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitparameter_files_pk_seq', 1, false);


--
-- Data for Name: unitparameter_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitparameter_history (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, version) FROM stdin;
\.


--
-- Name: unitparameter_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitparameter_history_pk_seq', 1, false);


--
-- Name: unitparameter_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitparameter_pk_seq', 1, false);


--
-- Data for Name: unitparameterunit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitparameterunit (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, unit_pk, unitparameter_pk, version) FROM stdin;
\.


--
-- Data for Name: unitparameterunit_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitparameterunit_history (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, unit_pk, unitparameter_pk, version) FROM stdin;
\.


--
-- Name: unitparameterunit_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitparameterunit_history_pk_seq', 1, false);


--
-- Name: unitparameterunit_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitparameterunit_pk_seq', 1, false);


--
-- Data for Name: unitvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitvalue (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, unit_pk, unitparameter_pk, contribution_pk, unitdomainelement_pk, frequency, version) FROM stdin;
\.


--
-- Data for Name: unitvalue_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitvalue_data (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Data for Name: unitvalue_data_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitvalue_data_history (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Name: unitvalue_data_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitvalue_data_history_pk_seq', 1, false);


--
-- Name: unitvalue_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitvalue_data_pk_seq', 1, false);


--
-- Data for Name: unitvalue_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitvalue_files (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Data for Name: unitvalue_files_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitvalue_files_history (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Name: unitvalue_files_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitvalue_files_history_pk_seq', 1, false);


--
-- Name: unitvalue_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitvalue_files_pk_seq', 1, false);


--
-- Data for Name: unitvalue_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY unitvalue_history (pk, created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, unit_pk, unitparameter_pk, contribution_pk, unitdomainelement_pk, frequency, version) FROM stdin;
\.


--
-- Name: unitvalue_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitvalue_history_pk_seq', 1, false);


--
-- Name: unitvalue_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('unitvalue_pk_seq', 1, false);


--
-- Data for Name: value; Type: TABLE DATA; Schema: public; Owner: -
--

COPY value (created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, pk, valueset_pk, domainelement_pk, frequency, confidence, version) FROM stdin;
2013-11-19 20:49:33.76373+01	2013-11-19 20:49:33.763734+01	t	\N	custom	1-7	1	Bora affixes in Resígaro	\N	1	1	\N	\N	\N	1
2013-11-19 20:49:33.765603+01	2013-11-19 20:49:33.765607+01	t	\N	custom	1-12	2	Bora affixes in Resígaro	\N	2	2	\N	\N	\N	1
2013-11-19 20:49:33.766235+01	2013-11-19 20:49:33.766239+01	t	\N	custom	1-13	38	Bora affixes in Resígaro	\N	3	3	\N	\N	\N	1
2013-11-19 20:49:33.766982+01	2013-11-19 20:49:33.766986+01	t	\N	custom	1-15	1	Bora affixes in Resígaro	\N	4	4	\N	\N	\N	1
2013-11-19 20:49:33.76768+01	2013-11-19 20:49:33.767683+01	t	\N	custom	1-24	3	Bora affixes in Resígaro	\N	5	5	\N	\N	\N	1
2013-11-19 20:49:33.768355+01	2013-11-19 20:49:33.768358+01	t	\N	custom	1-25	3	Bora affixes in Resígaro	\N	6	6	\N	\N	\N	1
2013-11-19 20:49:33.76896+01	2013-11-19 20:49:33.768963+01	t	\N	custom	1-39	2	Bora affixes in Resígaro	\N	7	7	\N	\N	\N	1
2013-11-19 20:49:33.801947+01	2013-11-19 20:49:33.801953+01	t	\N	custom	2-7	1	Gurindji affixes in Gurindji Kriol	\N	8	8	\N	\N	\N	1
2013-11-19 20:49:33.802659+01	2013-11-19 20:49:33.802664+01	t	\N	custom	2-8	1	Gurindji affixes in Gurindji Kriol	\N	9	9	\N	\N	\N	1
2013-11-19 20:49:33.803431+01	2013-11-19 20:49:33.803436+01	t	\N	custom	2-10	3	Gurindji affixes in Gurindji Kriol	\N	10	10	\N	\N	\N	1
2013-11-19 20:49:33.804191+01	2013-11-19 20:49:33.804195+01	t	\N	custom	2-11	1	Gurindji affixes in Gurindji Kriol	\N	11	11	\N	\N	\N	1
2013-11-19 20:49:33.804989+01	2013-11-19 20:49:33.804994+01	t	\N	custom	2-17	1	Gurindji affixes in Gurindji Kriol	\N	12	12	\N	\N	\N	1
2013-11-19 20:49:33.805774+01	2013-11-19 20:49:33.805779+01	t	\N	custom	2-18	2	Gurindji affixes in Gurindji Kriol	\N	13	13	\N	\N	\N	1
2013-11-19 20:49:33.806532+01	2013-11-19 20:49:33.806537+01	t	\N	custom	2-19	1	Gurindji affixes in Gurindji Kriol	\N	14	14	\N	\N	\N	1
2013-11-19 20:49:33.807232+01	2013-11-19 20:49:33.807235+01	t	\N	custom	2-20	1	Gurindji affixes in Gurindji Kriol	\N	15	15	\N	\N	\N	1
2013-11-19 20:49:33.807857+01	2013-11-19 20:49:33.807861+01	t	\N	custom	2-24	2	Gurindji affixes in Gurindji Kriol	\N	16	16	\N	\N	\N	1
2013-11-19 20:49:33.808406+01	2013-11-19 20:49:33.80841+01	t	\N	custom	2-25	1	Gurindji affixes in Gurindji Kriol	\N	17	17	\N	\N	\N	1
2013-11-19 20:49:33.80899+01	2013-11-19 20:49:33.808993+01	t	\N	custom	2-27	4	Gurindji affixes in Gurindji Kriol	\N	18	18	\N	\N	\N	1
2013-11-19 20:49:33.809582+01	2013-11-19 20:49:33.809587+01	t	\N	custom	2-28	1	Gurindji affixes in Gurindji Kriol	\N	19	19	\N	\N	\N	1
2013-11-19 20:49:33.827661+01	2013-11-19 20:49:33.827665+01	t	\N	custom	4-39	1	Russian affixes in Copper Island Aleut	\N	20	20	\N	\N	\N	1
2013-11-19 20:49:33.828277+01	2013-11-19 20:49:33.828281+01	t	\N	custom	4-40	13	Russian affixes in Copper Island Aleut	\N	21	21	\N	\N	\N	1
2013-11-19 20:49:33.828882+01	2013-11-19 20:49:33.828885+01	t	\N	custom	4-43	1	Russian affixes in Copper Island Aleut	\N	22	22	\N	\N	\N	1
2013-11-19 20:49:33.852109+01	2013-11-19 20:49:33.852116+01	t	\N	custom	5-3	4	Mongolian affixes in Sakha	\N	23	23	\N	\N	\N	1
2013-11-19 20:49:33.852837+01	2013-11-19 20:49:33.852843+01	t	\N	custom	5-4	1	Mongolian affixes in Sakha	\N	24	24	\N	\N	\N	1
2013-11-19 20:49:33.853488+01	2013-11-19 20:49:33.853493+01	t	\N	custom	5-19	1	Mongolian affixes in Sakha	\N	25	25	\N	\N	\N	1
2013-11-19 20:49:33.85419+01	2013-11-19 20:49:33.854194+01	t	\N	custom	5-20	1	Mongolian affixes in Sakha	\N	26	26	\N	\N	\N	1
2013-11-19 20:49:33.854918+01	2013-11-19 20:49:33.854923+01	t	\N	custom	5-21	3	Mongolian affixes in Sakha	\N	27	27	\N	\N	\N	1
2013-11-19 20:49:33.855616+01	2013-11-19 20:49:33.855621+01	t	\N	custom	5-24	1	Mongolian affixes in Sakha	\N	28	28	\N	\N	\N	1
2013-11-19 20:49:33.856305+01	2013-11-19 20:49:33.856309+01	t	\N	custom	5-32	1	Mongolian affixes in Sakha	\N	29	29	\N	\N	\N	1
2013-11-19 20:49:33.857136+01	2013-11-19 20:49:33.857144+01	t	\N	custom	5-38	1	Mongolian affixes in Sakha	\N	30	30	\N	\N	\N	1
2013-11-19 20:49:33.857907+01	2013-11-19 20:49:33.857915+01	t	\N	custom	5-41	1	Mongolian affixes in Sakha	\N	31	31	\N	\N	\N	1
2013-11-19 20:49:33.886313+01	2013-11-19 20:49:33.886318+01	t	\N	custom	6-3	1	Romanian affixes in Kalderash Romani	\N	32	32	\N	\N	\N	1
2013-11-19 20:49:33.886674+01	2013-11-19 20:49:33.886678+01	t	\N	custom	6-14	1	Romanian affixes in Kalderash Romani	\N	33	33	\N	\N	\N	1
2013-11-19 20:49:33.886987+01	2013-11-19 20:49:33.88699+01	t	\N	custom	6-16	1	Romanian affixes in Kalderash Romani	\N	34	34	\N	\N	\N	1
2013-11-19 20:49:33.887328+01	2013-11-19 20:49:33.887331+01	t	\N	custom	6-20	6	Romanian affixes in Kalderash Romani	\N	35	35	\N	\N	\N	1
2013-11-19 20:49:33.887752+01	2013-11-19 20:49:33.887755+01	t	\N	custom	6-28	1	Romanian affixes in Kalderash Romani	\N	36	36	\N	\N	\N	1
2013-11-19 20:49:33.88813+01	2013-11-19 20:49:33.888132+01	t	\N	custom	6-31	1	Romanian affixes in Kalderash Romani	\N	37	37	\N	\N	\N	1
2013-11-19 20:49:33.902995+01	2013-11-19 20:49:33.903006+01	t	\N	custom	7-31	1	Sakha affixes in Sebjan‑Küöl Ėven	\N	38	38	\N	\N	\N	1
2013-11-19 20:49:33.904001+01	2013-11-19 20:49:33.904015+01	t	\N	custom	7-40	21	Sakha affixes in Sebjan‑Küöl Ėven	\N	39	39	\N	\N	\N	1
2013-11-19 20:49:33.922379+01	2013-11-19 20:49:33.922385+01	t	\N	custom	8-4	1	Uzbek affixes in Northern Tajik	\N	40	40	\N	\N	\N	1
2013-11-19 20:49:33.922934+01	2013-11-19 20:49:33.92294+01	t	\N	custom	8-7	1	Uzbek affixes in Northern Tajik	\N	41	41	\N	\N	\N	1
2013-11-19 20:49:33.923404+01	2013-11-19 20:49:33.923409+01	t	\N	custom	8-9	2	Uzbek affixes in Northern Tajik	\N	42	42	\N	\N	\N	1
2013-11-19 20:49:33.923828+01	2013-11-19 20:49:33.923833+01	t	\N	custom	8-10	2	Uzbek affixes in Northern Tajik	\N	43	43	\N	\N	\N	1
2013-11-19 20:49:33.924256+01	2013-11-19 20:49:33.92426+01	t	\N	custom	8-11	1	Uzbek affixes in Northern Tajik	\N	44	44	\N	\N	\N	1
2013-11-19 20:49:33.924711+01	2013-11-19 20:49:33.924716+01	t	\N	custom	8-20	1	Uzbek affixes in Northern Tajik	\N	45	45	\N	\N	\N	1
2013-11-19 20:49:33.925191+01	2013-11-19 20:49:33.925197+01	t	\N	custom	8-21	1	Uzbek affixes in Northern Tajik	\N	46	46	\N	\N	\N	1
2013-11-19 20:49:33.925669+01	2013-11-19 20:49:33.925675+01	t	\N	custom	8-32	2	Uzbek affixes in Northern Tajik	\N	47	47	\N	\N	\N	1
2013-11-19 20:49:33.93548+01	2013-11-19 20:49:33.935485+01	t	\N	custom	10-20	2	Sanskrit affixes in Indonesian	\N	48	48	\N	\N	\N	1
2013-11-19 20:49:33.935856+01	2013-11-19 20:49:33.935859+01	t	\N	custom	10-27	16	Sanskrit affixes in Indonesian	\N	49	49	\N	\N	\N	1
2013-11-19 20:49:33.945945+01	2013-11-19 20:49:33.945951+01	t	\N	custom	11-31	1	Sakha affixes in Uchur Ėvenki	\N	50	50	\N	\N	\N	1
2013-11-19 20:49:33.946356+01	2013-11-19 20:49:33.946359+01	t	\N	custom	11-38	1	Sakha affixes in Uchur Ėvenki	\N	51	51	\N	\N	\N	1
2013-11-19 20:49:33.94668+01	2013-11-19 20:49:33.946683+01	t	\N	custom	11-40	6	Sakha affixes in Uchur Ėvenki	\N	52	52	\N	\N	\N	1
2013-11-19 20:49:33.960091+01	2013-11-19 20:49:33.9601+01	t	\N	custom	12-3	1	Norman French affixes in Middle English	\N	53	53	\N	\N	\N	1
2013-11-19 20:49:33.960687+01	2013-11-19 20:49:33.960692+01	t	\N	custom	12-19	3	Norman French affixes in Middle English	\N	54	54	\N	\N	\N	1
2013-11-19 20:49:33.961046+01	2013-11-19 20:49:33.961049+01	t	\N	custom	12-21	4	Norman French affixes in Middle English	\N	55	55	\N	\N	\N	1
2013-11-19 20:49:33.978891+01	2013-11-19 20:49:33.9789+01	t	\N	custom	13-3	3	Visayan affixes in Chabacano	\N	56	56	\N	\N	\N	1
2013-11-19 20:49:33.979594+01	2013-11-19 20:49:33.979602+01	t	\N	custom	13-19	1	Visayan affixes in Chabacano	\N	57	57	\N	\N	\N	1
2013-11-19 20:49:33.980159+01	2013-11-19 20:49:33.980167+01	t	\N	custom	13-31	1	Visayan affixes in Chabacano	\N	58	58	\N	\N	\N	1
2013-11-19 20:49:33.980693+01	2013-11-19 20:49:33.980699+01	t	\N	custom	13-37	1	Visayan affixes in Chabacano	\N	59	59	\N	\N	\N	1
2013-11-19 20:49:33.981234+01	2013-11-19 20:49:33.98124+01	t	\N	custom	13-41	2	Visayan affixes in Chabacano	\N	60	60	\N	\N	\N	1
2013-11-19 20:49:33.994044+01	2013-11-19 20:49:33.994048+01	t	\N	custom	14-40	8	Tigre affixes in Bilin	\N	61	61	\N	\N	\N	1
2013-11-19 20:49:34.008061+01	2013-11-19 20:49:34.008068+01	t	\N	custom	15-3	4	Bosnian/Croatian/Serbian affixes in Albanian	\N	62	62	\N	\N	\N	1
2013-11-19 20:49:34.009088+01	2013-11-19 20:49:34.009095+01	t	\N	custom	15-19	6	Bosnian/Croatian/Serbian affixes in Albanian	\N	63	63	\N	\N	\N	1
2013-11-19 20:49:34.00969+01	2013-11-19 20:49:34.009699+01	t	\N	custom	15-20	1	Bosnian/Croatian/Serbian affixes in Albanian	\N	64	64	\N	\N	\N	1
2013-11-19 20:49:34.010325+01	2013-11-19 20:49:34.010333+01	t	\N	custom	15-23	2	Bosnian/Croatian/Serbian affixes in Albanian	\N	65	65	\N	\N	\N	1
2013-11-19 20:49:34.010937+01	2013-11-19 20:49:34.010946+01	t	\N	custom	15-41	1	Bosnian/Croatian/Serbian affixes in Albanian	\N	66	66	\N	\N	\N	1
2013-11-19 20:49:34.028973+01	2013-11-19 20:49:34.028977+01	t	\N	custom	16-3	3	Spanish affixes in Cajamarca Quechua	\N	67	67	\N	\N	\N	1
2013-11-19 20:49:34.029332+01	2013-11-19 20:49:34.029335+01	t	\N	custom	16-14	1	Spanish affixes in Cajamarca Quechua	\N	68	68	\N	\N	\N	1
2013-11-19 20:49:34.029695+01	2013-11-19 20:49:34.029699+01	t	\N	custom	16-19	1	Spanish affixes in Cajamarca Quechua	\N	69	69	\N	\N	\N	1
2013-11-19 20:49:34.030024+01	2013-11-19 20:49:34.030027+01	t	\N	custom	16-20	2	Spanish affixes in Cajamarca Quechua	\N	70	70	\N	\N	\N	1
2013-11-19 20:49:34.039873+01	2013-11-19 20:49:34.039876+01	t	\N	custom	17-5	2	Aymara affixes in Uru	\N	71	71	\N	\N	\N	1
2013-11-19 20:49:34.040232+01	2013-11-19 20:49:34.040235+01	t	\N	custom	17-9	2	Aymara affixes in Uru	\N	72	72	\N	\N	\N	1
2013-11-19 20:49:34.040663+01	2013-11-19 20:49:34.040666+01	t	\N	custom	17-10	1	Aymara affixes in Uru	\N	73	73	\N	\N	\N	1
2013-11-19 20:49:34.041256+01	2013-11-19 20:49:34.041259+01	t	\N	custom	17-24	1	Aymara affixes in Uru	\N	74	74	\N	\N	\N	1
2013-11-19 20:49:34.054319+01	2013-11-19 20:49:34.054323+01	t	\N	custom	18-14	1	Russian affixes in Israeli Hebrew	\N	75	75	\N	\N	\N	1
2013-11-19 20:49:34.054739+01	2013-11-19 20:49:34.054743+01	t	\N	custom	18-20	3	Russian affixes in Israeli Hebrew	\N	76	76	\N	\N	\N	1
2013-11-19 20:49:34.055088+01	2013-11-19 20:49:34.055091+01	t	\N	custom	18-21	2	Russian affixes in Israeli Hebrew	\N	77	77	\N	\N	\N	1
2013-11-19 20:49:34.064012+01	2013-11-19 20:49:34.064017+01	t	\N	custom	19-19	13	Dutch affixes in Indonesian	\N	78	78	\N	\N	\N	1
2013-11-19 20:49:34.07605+01	2013-11-19 20:49:34.076057+01	t	\N	custom	20-19	1	Turkish affixes in Cappadocian Greek	\N	79	79	\N	\N	\N	1
2013-11-19 20:49:34.07683+01	2013-11-19 20:49:34.076836+01	t	\N	custom	20-34	1	Turkish affixes in Cappadocian Greek	\N	80	80	\N	\N	\N	1
2013-11-19 20:49:34.077588+01	2013-11-19 20:49:34.077593+01	t	\N	custom	20-40	2	Turkish affixes in Cappadocian Greek	\N	81	81	\N	\N	\N	1
2013-11-19 20:49:34.078325+01	2013-11-19 20:49:34.07833+01	t	\N	custom	20-41	1	Turkish affixes in Cappadocian Greek	\N	82	82	\N	\N	\N	1
2013-11-19 20:49:34.101288+01	2013-11-19 20:49:34.101298+01	t	\N	custom	21-12	2	Greek affixes in Kormakiti	\N	83	83	\N	\N	\N	1
2013-11-19 20:49:34.102151+01	2013-11-19 20:49:34.10216+01	t	\N	custom	21-14	1	Greek affixes in Kormakiti	\N	84	84	\N	\N	\N	1
2013-11-19 20:49:34.10317+01	2013-11-19 20:49:34.103181+01	t	\N	custom	21-24	2	Greek affixes in Kormakiti	\N	85	85	\N	\N	\N	1
2013-11-19 20:49:34.128011+01	2013-11-19 20:49:34.128016+01	t	\N	custom	22-1	1	Libyan Arabic affixes in Siwi	\N	86	86	\N	\N	\N	1
2013-11-19 20:49:34.128632+01	2013-11-19 20:49:34.128635+01	t	\N	custom	22-2	1	Libyan Arabic affixes in Siwi	\N	87	87	\N	\N	\N	1
2013-11-19 20:49:34.129225+01	2013-11-19 20:49:34.129228+01	t	\N	custom	22-19	1	Libyan Arabic affixes in Siwi	\N	88	88	\N	\N	\N	1
2013-11-19 20:49:34.129888+01	2013-11-19 20:49:34.129891+01	t	\N	custom	22-20	1	Libyan Arabic affixes in Siwi	\N	89	89	\N	\N	\N	1
2013-11-19 20:49:34.130775+01	2013-11-19 20:49:34.130786+01	t	\N	custom	22-38	1	Libyan Arabic affixes in Siwi	\N	90	90	\N	\N	\N	1
2013-11-19 20:49:34.148326+01	2013-11-19 20:49:34.14833+01	t	\N	custom	23-9	2	Nunggubuyu affixes in Warndarang	\N	91	91	\N	\N	\N	1
2013-11-19 20:49:34.149079+01	2013-11-19 20:49:34.149083+01	t	\N	custom	23-13	3	Nunggubuyu affixes in Warndarang	\N	92	92	\N	\N	\N	1
2013-11-19 20:49:34.162976+01	2013-11-19 20:49:34.162988+01	t	\N	custom	25-3	1	Turkish affixes in Albanian	\N	93	62	\N	\N	\N	1
2013-11-19 20:49:34.164332+01	2013-11-19 20:49:34.164343+01	t	\N	custom	25-20	2	Turkish affixes in Albanian	\N	94	64	\N	\N	\N	1
2013-11-19 20:49:34.165514+01	2013-11-19 20:49:34.165524+01	t	\N	custom	25-21	1	Turkish affixes in Albanian	\N	95	93	\N	\N	\N	1
2013-11-19 20:49:34.166417+01	2013-11-19 20:49:34.166425+01	t	\N	custom	25-22	1	Turkish affixes in Albanian	\N	96	94	\N	\N	\N	1
2013-11-19 20:49:34.16738+01	2013-11-19 20:49:34.16739+01	t	\N	custom	25-24	1	Turkish affixes in Albanian	\N	97	95	\N	\N	\N	1
2013-11-19 20:49:34.186655+01	2013-11-19 20:49:34.186659+01	t	\N	custom	26-24	1	Carib affixes in Garifuna	\N	98	96	\N	\N	\N	1
2013-11-19 20:49:34.187423+01	2013-11-19 20:49:34.187427+01	t	\N	custom	26-29	1	Carib affixes in Garifuna	\N	99	97	\N	\N	\N	1
2013-11-19 20:49:34.210174+01	2013-11-19 20:49:34.210183+01	t	\N	custom	27-3	1	Chuvash affixes in Mari	\N	100	98	\N	\N	\N	1
2013-11-19 20:49:34.210781+01	2013-11-19 20:49:34.210787+01	t	\N	custom	27-9	4	Chuvash affixes in Mari	\N	101	99	\N	\N	\N	1
2013-11-19 20:49:34.211312+01	2013-11-19 20:49:34.211318+01	t	\N	custom	27-11	1	Chuvash affixes in Mari	\N	102	100	\N	\N	\N	1
2013-11-19 20:49:34.211812+01	2013-11-19 20:49:34.211818+01	t	\N	custom	27-16	1	Chuvash affixes in Mari	\N	103	101	\N	\N	\N	1
2013-11-19 20:49:34.212483+01	2013-11-19 20:49:34.212494+01	t	\N	custom	27-21	1	Chuvash affixes in Mari	\N	104	102	\N	\N	\N	1
2013-11-19 20:49:34.21323+01	2013-11-19 20:49:34.213236+01	t	\N	custom	27-31	1	Chuvash affixes in Mari	\N	105	103	\N	\N	\N	1
2013-11-19 20:49:34.213943+01	2013-11-19 20:49:34.213951+01	t	\N	custom	27-34	1	Chuvash affixes in Mari	\N	106	104	\N	\N	\N	1
2013-11-19 20:49:34.214696+01	2013-11-19 20:49:34.214704+01	t	\N	custom	27-35	1	Chuvash affixes in Mari	\N	107	105	\N	\N	\N	1
2013-11-19 20:49:34.21558+01	2013-11-19 20:49:34.215591+01	t	\N	custom	27-38	1	Chuvash affixes in Mari	\N	108	106	\N	\N	\N	1
2013-11-19 20:49:34.238054+01	2013-11-19 20:49:34.238063+01	t	\N	custom	28-9	3	Nepali affixes in Chantyal	\N	109	107	\N	\N	\N	1
2013-11-19 20:49:34.238832+01	2013-11-19 20:49:34.23884+01	t	\N	custom	28-11	1	Nepali affixes in Chantyal	\N	110	108	\N	\N	\N	1
2013-11-19 20:49:34.257473+01	2013-11-19 20:49:34.257476+01	t	\N	custom	29-9	1	Ngandi affixes in Ritharngu	\N	111	109	\N	\N	\N	1
2013-11-19 20:49:34.258045+01	2013-11-19 20:49:34.258049+01	t	\N	custom	29-25	1	Ngandi affixes in Ritharngu	\N	112	110	\N	\N	\N	1
2013-11-19 20:49:34.258608+01	2013-11-19 20:49:34.258612+01	t	\N	custom	29-27	1	Ngandi affixes in Ritharngu	\N	113	111	\N	\N	\N	1
2013-11-19 20:49:34.25917+01	2013-11-19 20:49:34.259174+01	t	\N	custom	29-43	1	Ngandi affixes in Ritharngu	\N	114	112	\N	\N	\N	1
2013-11-19 20:49:34.271131+01	2013-11-19 20:49:34.271136+01	t	\N	custom	31-22	1	Ilokano affixes in Guina‑ang Bontok	\N	115	113	\N	\N	\N	1
2013-11-19 20:49:34.271739+01	2013-11-19 20:49:34.271743+01	t	\N	custom	31-38	2	Ilokano affixes in Guina‑ang Bontok	\N	116	114	\N	\N	\N	1
2013-11-19 20:49:34.287767+01	2013-11-19 20:49:34.287779+01	t	\N	custom	33-1	1	Kurdish affixes in Sonqor Turkic	\N	117	115	\N	\N	\N	1
2013-11-19 20:49:34.288592+01	2013-11-19 20:49:34.288601+01	t	\N	custom	33-5	1	Kurdish affixes in Sonqor Turkic	\N	118	116	\N	\N	\N	1
2013-11-19 20:49:34.289446+01	2013-11-19 20:49:34.289455+01	t	\N	custom	33-16	1	Kurdish affixes in Sonqor Turkic	\N	119	117	\N	\N	\N	1
2013-11-19 20:49:34.290238+01	2013-11-19 20:49:34.290247+01	t	\N	custom	33-40	2	Kurdish affixes in Sonqor Turkic	\N	120	118	\N	\N	\N	1
2013-11-19 20:49:34.308505+01	2013-11-19 20:49:34.308517+01	t	\N	custom	34-7	1	Ritharngu affixes in Ngandi	\N	121	119	\N	\N	\N	1
2013-11-19 20:49:34.309367+01	2013-11-19 20:49:34.309378+01	t	\N	custom	34-8	1	Ritharngu affixes in Ngandi	\N	122	120	\N	\N	\N	1
2013-11-19 20:49:34.327774+01	2013-11-19 20:49:34.327777+01	t	\N	custom	35-39	2	Kxoe affixes in Danisi	\N	123	121	\N	\N	\N	1
2013-11-19 20:49:34.339074+01	2013-11-19 20:49:34.339078+01	t	\N	custom	37-38	8	Croatian affixes in Istro‑Romanian	\N	124	122	\N	\N	\N	1
2013-11-19 20:49:34.346997+01	2013-11-19 20:49:34.347002+01	t	\N	custom	39-32	1	Quapaw affixes in Koasati	\N	125	123	\N	\N	\N	1
2013-11-19 20:49:34.357726+01	2013-11-19 20:49:34.357732+01	t	\N	custom	40-24	1	Aramaic affixes in syrian‑lebanese‑mesopotamian Arabic	\N	126	124	\N	\N	\N	1
2013-11-19 20:49:34.358527+01	2013-11-19 20:49:34.358533+01	t	\N	custom	40-38	1	Aramaic affixes in syrian‑lebanese‑mesopotamian Arabic	\N	127	125	\N	\N	\N	1
2013-11-19 20:49:34.370909+01	2013-11-19 20:49:34.370916+01	t	\N	custom	41-38	1	Tamil affixes in Sri Lanka Portuguese	\N	128	126	\N	\N	\N	1
2013-11-19 20:49:34.371625+01	2013-11-19 20:49:34.37163+01	t	\N	custom	41-42	1	Tamil affixes in Sri Lanka Portuguese	\N	129	127	\N	\N	\N	1
2013-11-19 20:49:34.385573+01	2013-11-19 20:49:34.385582+01	t	\N	custom	42-3	1	Northern Nyungic affixes in Kayardild	\N	130	128	\N	\N	\N	1
2013-11-19 20:49:34.398968+01	2013-11-19 20:49:34.398979+01	t	\N	custom	43-31	1	Akkadian affixes in Sumerian	\N	131	129	\N	\N	\N	1
2013-11-19 20:49:34.411762+01	2013-11-19 20:49:34.411766+01	t	\N	custom	44-31	1	Naasioi affixes in Torau	\N	132	130	\N	\N	\N	1
2013-11-19 20:49:34.419732+01	2013-11-19 20:49:34.419736+01	t	\N	custom	46-3	1	Arabic affixes in Indonesian	\N	133	131	\N	\N	\N	1
2013-11-19 20:49:34.428252+01	2013-11-19 20:49:34.428256+01	t	\N	custom	67-3	1	Sicilian Italian affixes in Maltese	\N	134	132	\N	\N	\N	1
2013-11-19 20:49:34.428956+01	2013-11-19 20:49:34.428959+01	t	\N	custom	67-26	3	Sicilian Italian affixes in Maltese	\N	135	133	\N	\N	\N	1
2013-11-19 20:49:34.44339+01	2013-11-19 20:49:34.443403+01	t	\N	custom	68-42	2	Sadri affixes in Kharia	\N	136	134	\N	\N	\N	1
2013-11-19 20:49:34.4624+01	2013-11-19 20:49:34.462409+01	t	\N	custom	70-40	2	Estonian affixes in Ingrian Finnish	\N	137	135	\N	\N	\N	1
2013-11-19 20:49:34.475984+01	2013-11-19 20:49:34.475998+01	t	\N	custom	72-14	1	Swahili affixes in Malagasy	\N	138	136	\N	\N	\N	1
2013-11-19 20:49:34.478182+01	2013-11-19 20:49:34.478199+01	t	\N	custom	72-38	1	Swahili affixes in Malagasy	\N	139	137	\N	\N	\N	1
2013-11-19 20:49:34.497914+01	2013-11-19 20:49:34.497924+01	t	\N	custom	73-19	1	Banjar Malay affixes in Malagasy	\N	140	138	\N	\N	\N	1
2013-11-19 20:49:34.498673+01	2013-11-19 20:49:34.498681+01	t	\N	custom	73-22	1	Banjar Malay affixes in Malagasy	\N	141	139	\N	\N	\N	1
2013-11-19 20:49:34.499259+01	2013-11-19 20:49:34.499265+01	t	\N	custom	73-33	1	Banjar Malay affixes in Malagasy	\N	142	140	\N	\N	\N	1
2013-11-19 20:49:34.499865+01	2013-11-19 20:49:34.499873+01	t	\N	custom	73-38	1	Banjar Malay affixes in Malagasy	\N	143	137	\N	\N	\N	1
2013-11-19 20:49:34.818548+01	2013-11-19 20:49:34.818551+01	t	\N	custom	110-35	3	Komi‑Zyrian affixes in Khanty	\N	216	213	\N	\N	\N	1
2013-11-19 20:49:34.515213+01	2013-11-19 20:49:34.515222+01	t	\N	custom	75-24	1	intermediate Proto‑Carib affixes in Wayampi‑Emerillon‑Zo’é 	\N	144	141	\N	\N	\N	1
2013-11-19 20:49:34.52661+01	2013-11-19 20:49:34.526618+01	t	\N	custom	77-27	1	English affixes in Hawaiian	\N	145	142	\N	\N	\N	1
2013-11-19 20:49:34.541543+01	2013-11-19 20:49:34.541553+01	t	\N	custom	78-16	1	Russian affixes in Kola Saami	\N	146	143	\N	\N	\N	1
2013-11-19 20:49:34.542266+01	2013-11-19 20:49:34.542272+01	t	\N	custom	78-17	2	Russian affixes in Kola Saami	\N	147	144	\N	\N	\N	1
2013-11-19 20:49:34.542816+01	2013-11-19 20:49:34.542823+01	t	\N	custom	78-20	1	Russian affixes in Kola Saami	\N	148	145	\N	\N	\N	1
2013-11-19 20:49:34.543324+01	2013-11-19 20:49:34.543328+01	t	\N	custom	78-38	1	Russian affixes in Kola Saami	\N	149	146	\N	\N	\N	1
2013-11-19 20:49:34.551086+01	2013-11-19 20:49:34.551092+01	t	\N	custom	82-6	1	Turkish affixes in Western Kurmanji	\N	150	147	\N	\N	\N	1
2013-11-19 20:49:34.559186+01	2013-11-19 20:49:34.559191+01	t	\N	custom	83-30	1	Nepali affixes in Manange	\N	151	148	\N	\N	\N	1
2013-11-19 20:49:34.583535+01	2013-11-19 20:49:34.583541+01	t	\N	custom	85-3	2	Russian affixes in Yiddish	\N	152	149	\N	\N	\N	1
2013-11-19 20:49:34.583934+01	2013-11-19 20:49:34.583938+01	t	\N	custom	85-12	3	Russian affixes in Yiddish	\N	153	150	\N	\N	\N	1
2013-11-19 20:49:34.584255+01	2013-11-19 20:49:34.584259+01	t	\N	custom	85-14	3	Russian affixes in Yiddish	\N	154	151	\N	\N	\N	1
2013-11-19 20:49:34.584567+01	2013-11-19 20:49:34.58457+01	t	\N	custom	85-20	2	Russian affixes in Yiddish	\N	155	152	\N	\N	\N	1
2013-11-19 20:49:34.584889+01	2013-11-19 20:49:34.584893+01	t	\N	custom	85-23	1	Russian affixes in Yiddish	\N	156	153	\N	\N	\N	1
2013-11-19 20:49:34.585197+01	2013-11-19 20:49:34.5852+01	t	\N	custom	85-28	1	Russian affixes in Yiddish	\N	157	154	\N	\N	\N	1
2013-11-19 20:49:34.585503+01	2013-11-19 20:49:34.585506+01	t	\N	custom	85-41	1	Russian affixes in Yiddish	\N	158	155	\N	\N	\N	1
2013-11-19 20:49:34.604408+01	2013-11-19 20:49:34.604412+01	t	\N	custom	87-3	2	Bulgarian affixes in Megleno Romanian	\N	159	156	\N	\N	\N	1
2013-11-19 20:49:34.604825+01	2013-11-19 20:49:34.60483+01	t	\N	custom	87-14	12	Bulgarian affixes in Megleno Romanian	\N	160	157	\N	\N	\N	1
2013-11-19 20:49:34.605157+01	2013-11-19 20:49:34.605161+01	t	\N	custom	87-19	1	Bulgarian affixes in Megleno Romanian	\N	161	158	\N	\N	\N	1
2013-11-19 20:49:34.605467+01	2013-11-19 20:49:34.60547+01	t	\N	custom	87-21	4	Bulgarian affixes in Megleno Romanian	\N	162	159	\N	\N	\N	1
2013-11-19 20:49:34.605775+01	2013-11-19 20:49:34.605778+01	t	\N	custom	87-22	2	Bulgarian affixes in Megleno Romanian	\N	163	160	\N	\N	\N	1
2013-11-19 20:49:34.606076+01	2013-11-19 20:49:34.606079+01	t	\N	custom	87-23	2	Bulgarian affixes in Megleno Romanian	\N	164	161	\N	\N	\N	1
2013-11-19 20:49:34.606377+01	2013-11-19 20:49:34.60638+01	t	\N	custom	87-38	10	Bulgarian affixes in Megleno Romanian	\N	165	162	\N	\N	\N	1
2013-11-19 20:49:34.606676+01	2013-11-19 20:49:34.606679+01	t	\N	custom	87-40	2	Bulgarian affixes in Megleno Romanian	\N	166	163	\N	\N	\N	1
2013-11-19 20:49:34.618901+01	2013-11-19 20:49:34.618905+01	t	\N	custom	88-14	4	Greek affixes in Arvanitic Albanian	\N	167	164	\N	\N	\N	1
2013-11-19 20:49:34.61925+01	2013-11-19 20:49:34.619254+01	t	\N	custom	88-20	1	Greek affixes in Arvanitic Albanian	\N	168	165	\N	\N	\N	1
2013-11-19 20:49:34.619563+01	2013-11-19 20:49:34.619566+01	t	\N	custom	88-22	1	Greek affixes in Arvanitic Albanian	\N	169	166	\N	\N	\N	1
2013-11-19 20:49:34.61987+01	2013-11-19 20:49:34.619873+01	t	\N	custom	88-27	14	Greek affixes in Arvanitic Albanian	\N	170	167	\N	\N	\N	1
2013-11-19 20:49:34.620175+01	2013-11-19 20:49:34.620177+01	t	\N	custom	88-39	8	Greek affixes in Arvanitic Albanian	\N	171	168	\N	\N	\N	1
2013-11-19 20:49:34.620478+01	2013-11-19 20:49:34.620481+01	t	\N	custom	88-41	3	Greek affixes in Arvanitic Albanian	\N	172	169	\N	\N	\N	1
2013-11-19 20:49:34.629459+01	2013-11-19 20:49:34.629465+01	t	\N	custom	92-2	1	Russian affixes in Lithuanian Romani	\N	173	170	\N	\N	\N	1
2013-11-19 20:49:34.629933+01	2013-11-19 20:49:34.629938+01	t	\N	custom	92-38	5	Russian affixes in Lithuanian Romani	\N	174	171	\N	\N	\N	1
2013-11-19 20:49:34.639315+01	2013-11-19 20:49:34.639321+01	t	\N	custom	93-20	1	Spanish affixes in Sierra Popoluca	\N	175	172	\N	\N	\N	1
2013-11-19 20:49:34.651635+01	2013-11-19 20:49:34.65164+01	t	\N	custom	94-1	1	Makrān Baluchi affixes in Brahui	\N	176	173	\N	\N	\N	1
2013-11-19 20:49:34.652096+01	2013-11-19 20:49:34.6521+01	t	\N	custom	94-3	1	Makrān Baluchi affixes in Brahui	\N	177	174	\N	\N	\N	1
2013-11-19 20:49:34.652522+01	2013-11-19 20:49:34.652527+01	t	\N	custom	94-38	1	Makrān Baluchi affixes in Brahui	\N	178	175	\N	\N	\N	1
2013-11-19 20:49:34.668355+01	2013-11-19 20:49:34.668361+01	t	\N	custom	95-19	1	Malay affixes in Semelai	\N	179	176	\N	\N	\N	1
2013-11-19 20:49:34.668842+01	2013-11-19 20:49:34.668846+01	t	\N	custom	95-33	1	Malay affixes in Semelai	\N	180	177	\N	\N	\N	1
2013-11-19 20:49:34.669272+01	2013-11-19 20:49:34.669277+01	t	\N	custom	95-34	1	Malay affixes in Semelai	\N	181	178	\N	\N	\N	1
2013-11-19 20:49:34.6697+01	2013-11-19 20:49:34.669705+01	t	\N	custom	95-36	1	Malay affixes in Semelai	\N	182	179	\N	\N	\N	1
2013-11-19 20:49:34.670126+01	2013-11-19 20:49:34.67013+01	t	\N	custom	95-38	4	Malay affixes in Semelai	\N	183	180	\N	\N	\N	1
2013-11-19 20:49:34.679139+01	2013-11-19 20:49:34.679144+01	t	\N	custom	96-33	1	Indonesian affixes in Tukang Besi	\N	184	181	\N	\N	\N	1
2013-11-19 20:49:34.687522+01	2013-11-19 20:49:34.687528+01	t	\N	custom	97-40	3	Warembori affixes in Kwerba Kasonaweja	\N	185	182	\N	\N	\N	1
2013-11-19 20:49:34.698651+01	2013-11-19 20:49:34.698658+01	t	\N	custom	98-19	1	Farsi affixes in Lezgian	\N	186	183	\N	\N	\N	1
2013-11-19 20:49:34.699187+01	2013-11-19 20:49:34.699192+01	t	\N	custom	98-20	2	Farsi affixes in Lezgian	\N	187	184	\N	\N	\N	1
2013-11-19 20:49:34.710359+01	2013-11-19 20:49:34.710365+01	t	\N	custom	99-40	1	Shua‑Tshwa affixes in G|ui‑Gǁana 	\N	188	185	\N	\N	\N	1
2013-11-19 20:49:34.718365+01	2013-11-19 20:49:34.71837+01	t	\N	custom	100-5	3	Chukchi affixes in Central Siberian Yupik Eskimo	\N	189	186	\N	\N	\N	1
2013-11-19 20:49:34.730593+01	2013-11-19 20:49:34.730601+01	t	\N	custom	101-27	1	Karrwa affixes in Kayardild	\N	190	187	\N	\N	\N	1
2013-11-19 20:49:34.748179+01	2013-11-19 20:49:34.748186+01	t	\N	custom	102-3	4	Hindi affixes in Kurux	\N	191	188	\N	\N	\N	1
2013-11-19 20:49:34.748767+01	2013-11-19 20:49:34.748773+01	t	\N	custom	102-12	1	Hindi affixes in Kurux	\N	192	189	\N	\N	\N	1
2013-11-19 20:49:34.749243+01	2013-11-19 20:49:34.749249+01	t	\N	custom	102-32	2	Hindi affixes in Kurux	\N	193	190	\N	\N	\N	1
2013-11-19 20:49:34.749692+01	2013-11-19 20:49:34.749697+01	t	\N	custom	102-33	1	Hindi affixes in Kurux	\N	194	191	\N	\N	\N	1
2013-11-19 20:49:34.768793+01	2013-11-19 20:49:34.7688+01	t	\N	custom	107-3	1	Persian affixes in Turkish	\N	195	192	\N	\N	\N	1
2013-11-19 20:49:34.769342+01	2013-11-19 20:49:34.769348+01	t	\N	custom	107-19	1	Persian affixes in Turkish	\N	196	193	\N	\N	\N	1
2013-11-19 20:49:34.769794+01	2013-11-19 20:49:34.769799+01	t	\N	custom	107-20	3	Persian affixes in Turkish	\N	197	194	\N	\N	\N	1
2013-11-19 20:49:34.770239+01	2013-11-19 20:49:34.770244+01	t	\N	custom	107-23	1	Persian affixes in Turkish	\N	198	195	\N	\N	\N	1
2013-11-19 20:49:34.770677+01	2013-11-19 20:49:34.770682+01	t	\N	custom	107-27	1	Persian affixes in Turkish	\N	199	196	\N	\N	\N	1
2013-11-19 20:49:34.787449+01	2013-11-19 20:49:34.787453+01	t	\N	custom	108-3	3	Persian affixes in Azari	\N	200	197	\N	\N	\N	1
2013-11-19 20:49:34.787816+01	2013-11-19 20:49:34.787819+01	t	\N	custom	108-14	1	Persian affixes in Azari	\N	201	198	\N	\N	\N	1
2013-11-19 20:49:34.788133+01	2013-11-19 20:49:34.788137+01	t	\N	custom	108-20	4	Persian affixes in Azari	\N	202	199	\N	\N	\N	1
2013-11-19 20:49:34.788442+01	2013-11-19 20:49:34.788445+01	t	\N	custom	108-23	1	Persian affixes in Azari	\N	203	200	\N	\N	\N	1
2013-11-19 20:49:34.788759+01	2013-11-19 20:49:34.788763+01	t	\N	custom	108-27	1	Persian affixes in Azari	\N	204	201	\N	\N	\N	1
2013-11-19 20:49:34.800426+01	2013-11-19 20:49:34.80043+01	t	\N	custom	109-3	4	Persian affixes in Kashmiri	\N	205	202	\N	\N	\N	1
2013-11-19 20:49:34.800835+01	2013-11-19 20:49:34.800838+01	t	\N	custom	109-20	2	Persian affixes in Kashmiri	\N	206	203	\N	\N	\N	1
2013-11-19 20:49:34.801155+01	2013-11-19 20:49:34.801158+01	t	\N	custom	109-21	2	Persian affixes in Kashmiri	\N	207	204	\N	\N	\N	1
2013-11-19 20:49:34.801466+01	2013-11-19 20:49:34.80147+01	t	\N	custom	109-27	4	Persian affixes in Kashmiri	\N	208	205	\N	\N	\N	1
2013-11-19 20:49:34.801775+01	2013-11-19 20:49:34.801778+01	t	\N	custom	109-28	1	Persian affixes in Kashmiri	\N	209	206	\N	\N	\N	1
2013-11-19 20:49:34.816579+01	2013-11-19 20:49:34.816584+01	t	\N	custom	110-1	1	Komi‑Zyrian affixes in Khanty	\N	210	207	\N	\N	\N	1
2013-11-19 20:49:34.817001+01	2013-11-19 20:49:34.817004+01	t	\N	custom	110-2	1	Komi‑Zyrian affixes in Khanty	\N	211	208	\N	\N	\N	1
2013-11-19 20:49:34.817318+01	2013-11-19 20:49:34.817322+01	t	\N	custom	110-3	5	Komi‑Zyrian affixes in Khanty	\N	212	209	\N	\N	\N	1
2013-11-19 20:49:34.817631+01	2013-11-19 20:49:34.817634+01	t	\N	custom	110-14	1	Komi‑Zyrian affixes in Khanty	\N	213	210	\N	\N	\N	1
2013-11-19 20:49:34.817937+01	2013-11-19 20:49:34.81794+01	t	\N	custom	110-27	1	Komi‑Zyrian affixes in Khanty	\N	214	211	\N	\N	\N	1
2013-11-19 20:49:34.818244+01	2013-11-19 20:49:34.818247+01	t	\N	custom	110-34	1	Komi‑Zyrian affixes in Khanty	\N	215	212	\N	\N	\N	1
2013-11-19 20:49:34.818855+01	2013-11-19 20:49:34.818858+01	t	\N	custom	110-39	1	Komi‑Zyrian affixes in Khanty	\N	217	214	\N	\N	\N	1
2013-11-19 20:49:34.819206+01	2013-11-19 20:49:34.819209+01	t	\N	custom	110-41	1	Komi‑Zyrian affixes in Khanty	\N	218	215	\N	\N	\N	1
2013-11-19 20:49:34.827116+01	2013-11-19 20:49:34.82712+01	t	\N	custom	111-12	2	Swedish affixes in Finnish	\N	219	216	\N	\N	\N	1
2013-11-19 20:49:34.827471+01	2013-11-19 20:49:34.827474+01	t	\N	custom	111-20	1	Swedish affixes in Finnish	\N	220	217	\N	\N	\N	1
2013-11-19 20:49:34.848279+01	2013-11-19 20:49:34.848286+01	t	\N	custom	112-39	1	Yucuna and Cabiyarí affixes in Carapana, Tatuyo, Wáimaja, and Yurutí	\N	221	218	\N	\N	\N	1
2013-11-19 20:49:34.865182+01	2013-11-19 20:49:34.865187+01	t	\N	custom	113-3	2	Latin affixes in Basque	\N	222	219	\N	\N	\N	1
2013-11-19 20:49:34.86587+01	2013-11-19 20:49:34.865874+01	t	\N	custom	113-12	1	Latin affixes in Basque	\N	223	220	\N	\N	\N	1
2013-11-19 20:49:34.866507+01	2013-11-19 20:49:34.866511+01	t	\N	custom	113-14	2	Latin affixes in Basque	\N	224	221	\N	\N	\N	1
2013-11-19 20:49:34.867134+01	2013-11-19 20:49:34.867138+01	t	\N	custom	113-15	2	Latin affixes in Basque	\N	225	222	\N	\N	\N	1
2013-11-19 20:49:34.867754+01	2013-11-19 20:49:34.867759+01	t	\N	custom	113-20	4	Latin affixes in Basque	\N	226	223	\N	\N	\N	1
2013-11-19 20:49:34.868374+01	2013-11-19 20:49:34.868378+01	t	\N	custom	113-21	17	Latin affixes in Basque	\N	227	224	\N	\N	\N	1
2013-11-19 20:49:34.86902+01	2013-11-19 20:49:34.869023+01	t	\N	custom	113-22	2	Latin affixes in Basque	\N	228	225	\N	\N	\N	1
2013-11-19 20:49:34.869611+01	2013-11-19 20:49:34.869615+01	t	\N	custom	113-27	4	Latin affixes in Basque	\N	229	226	\N	\N	\N	1
2013-11-19 20:49:34.870228+01	2013-11-19 20:49:34.870232+01	t	\N	custom	113-28	1	Latin affixes in Basque	\N	230	227	\N	\N	\N	1
2013-11-19 20:49:34.882832+01	2013-11-19 20:49:34.882838+01	t	\N	custom	114-21	1	Moroccan Berber affixes in Moroccan Arabic	\N	231	228	\N	\N	\N	1
2013-11-19 20:49:34.903326+01	2013-11-19 20:49:34.903333+01	t	\N	custom	116-9	1	Tibetan affixes in Wutun	\N	232	229	\N	\N	\N	1
2013-11-19 20:49:34.904066+01	2013-11-19 20:49:34.904072+01	t	\N	custom	116-10	1	Tibetan affixes in Wutun	\N	233	230	\N	\N	\N	1
2013-11-19 20:49:34.904835+01	2013-11-19 20:49:34.904841+01	t	\N	custom	116-36	1	Tibetan affixes in Wutun	\N	234	231	\N	\N	\N	1
2013-11-19 20:49:34.905585+01	2013-11-19 20:49:34.905591+01	t	\N	custom	116-38	2	Tibetan affixes in Wutun	\N	235	232	\N	\N	\N	1
2013-11-19 20:49:34.906326+01	2013-11-19 20:49:34.906332+01	t	\N	custom	116-42	2	Tibetan affixes in Wutun	\N	236	233	\N	\N	\N	1
2013-11-19 20:49:34.924544+01	2013-11-19 20:49:34.924553+01	t	\N	custom	117-38	8	Aymara affixes in Quechua de Puno	\N	237	234	\N	\N	\N	1
2013-11-19 20:49:34.925453+01	2013-11-19 20:49:34.925461+01	t	\N	custom	117-39	1	Aymara affixes in Quechua de Puno	\N	238	235	\N	\N	\N	1
2013-11-19 20:49:34.94032+01	2013-11-19 20:49:34.940329+01	t	\N	custom	118-9	1	Santa affixes in Chinese of Línxìa/Hézōu	\N	239	236	\N	\N	\N	1
2013-11-19 20:49:34.965665+01	2013-11-19 20:49:34.965668+01	t	\N	custom	119-14	1	Turkish affixes in Judeo‑Spanish	\N	240	237	\N	\N	\N	1
2013-11-19 20:49:34.966302+01	2013-11-19 20:49:34.966305+01	t	\N	custom	119-19	1	Turkish affixes in Judeo‑Spanish	\N	241	238	\N	\N	\N	1
2013-11-19 20:49:34.966902+01	2013-11-19 20:49:34.966905+01	t	\N	custom	119-23	1	Turkish affixes in Judeo‑Spanish	\N	242	239	\N	\N	\N	1
2013-11-19 20:49:34.967493+01	2013-11-19 20:49:34.967496+01	t	\N	custom	119-27	2	Turkish affixes in Judeo‑Spanish	\N	243	240	\N	\N	\N	1
2013-11-19 20:49:34.968083+01	2013-11-19 20:49:34.968086+01	t	\N	custom	119-28	1	Turkish affixes in Judeo‑Spanish	\N	244	241	\N	\N	\N	1
2013-11-19 20:49:34.978155+01	2013-11-19 20:49:34.978162+01	t	\N	custom	124-16	6	Russian affixes in Karelien	\N	245	242	\N	\N	\N	1
2013-11-19 20:49:34.992109+01	2013-11-19 20:49:34.99212+01	t	\N	custom	125-5	1	Eastern Tucanoan affixes in Tariana	\N	246	243	\N	\N	\N	1
2013-11-19 20:49:34.992967+01	2013-11-19 20:49:34.992976+01	t	\N	custom	125-39	2	Eastern Tucanoan affixes in Tariana	\N	247	244	\N	\N	\N	1
2013-11-19 20:49:35.011347+01	2013-11-19 20:49:35.01135+01	t	\N	custom	126-3	1	Greek affixes in Kalderash Romani	\N	248	32	\N	\N	\N	1
2013-11-19 20:49:35.012055+01	2013-11-19 20:49:35.012058+01	t	\N	custom	126-14	1	Greek affixes in Kalderash Romani	\N	249	33	\N	\N	\N	1
2013-11-19 20:49:35.012726+01	2013-11-19 20:49:35.012729+01	t	\N	custom	126-21	2	Greek affixes in Kalderash Romani	\N	250	245	\N	\N	\N	1
2013-11-19 20:49:35.013301+01	2013-11-19 20:49:35.013304+01	t	\N	custom	126-31	1	Greek affixes in Kalderash Romani	\N	251	37	\N	\N	\N	1
2013-11-19 20:49:35.021044+01	2013-11-19 20:49:35.021049+01	t	\N	custom	127-39	3	Spanish affixes in Cho’ol	\N	252	246	\N	\N	\N	1
2013-11-19 20:49:35.029604+01	2013-11-19 20:49:35.029609+01	t	\N	custom	128-42	1	Zoquean affixes in Cho’ol	\N	253	247	\N	\N	\N	1
2013-11-19 20:49:35.047334+01	2013-11-19 20:49:35.047338+01	t	\N	custom	130-1	1	Arabic affixes in Western Neo‑Aramaic of Ma’lūla	\N	254	248	\N	\N	\N	1
2013-11-19 20:49:35.059908+01	2013-11-19 20:49:35.059912+01	t	\N	custom	132-30	15	Tibeto-Burman affixes in Assamese	\N	255	249	\N	\N	\N	1
2013-11-19 20:49:35.06775+01	2013-11-19 20:49:35.067762+01	t	\N	custom	133-20	1	Portuguese affixes in Tetun Dili	\N	256	250	\N	\N	\N	1
2013-11-19 20:49:35.082797+01	2013-11-19 20:49:35.082808+01	t	\N	custom	134-14	1	Spanish affixes in Purepecha/Tarascan	\N	257	251	\N	\N	\N	1
2013-11-19 20:49:35.100186+01	2013-11-19 20:49:35.100201+01	t	\N	custom	135-14	1	Spanish affixes in Mexicanero de la Sierra Madre Occidental	\N	258	252	\N	\N	\N	1
2013-11-19 20:49:35.11313+01	2013-11-19 20:49:35.113138+01	t	\N	custom	136-14	1	Spanish affixes in Yucatec Maya	\N	259	253	\N	\N	\N	1
2013-11-19 20:49:35.122936+01	2013-11-19 20:49:35.12294+01	t	\N	custom	137-20	1	Indonesian affixes in Kedang	\N	260	254	\N	\N	\N	1
2013-11-19 20:49:35.138181+01	2013-11-19 20:49:35.138192+01	t	\N	custom	138-20	1	Turkish affixes in Iraqi Arabic	\N	261	255	\N	\N	\N	1
2013-11-19 20:49:35.138806+01	2013-11-19 20:49:35.138811+01	t	\N	custom	138-21	1	Turkish affixes in Iraqi Arabic	\N	262	256	\N	\N	\N	1
2013-11-19 20:49:35.139157+01	2013-11-19 20:49:35.139161+01	t	\N	custom	138-22	1	Turkish affixes in Iraqi Arabic	\N	263	257	\N	\N	\N	1
2013-11-19 20:49:35.139493+01	2013-11-19 20:49:35.139496+01	t	\N	custom	138-28	1	Turkish affixes in Iraqi Arabic	\N	264	258	\N	\N	\N	1
2013-11-19 20:49:35.147752+01	2013-11-19 20:49:35.147758+01	t	\N	custom	139-31	1	Quapaw affixes in Alabama and Choctaw‑Chickasaw	\N	265	259	\N	\N	\N	1
2013-11-19 20:49:35.152836+01	2013-11-19 20:49:35.152842+01	t	\N	custom	140-42	1	Hindi affixes in Kharia	\N	266	134	\N	\N	\N	1
2013-11-19 20:49:35.160017+01	2013-11-19 20:49:35.160022+01	t	\N	custom	142-20	1	Latvian affixes in German	\N	267	260	\N	\N	\N	1
2013-11-19 20:49:35.170042+01	2013-11-19 20:49:35.170046+01	t	\N	custom	143-5	2	Quechua affixes in Amuesha	\N	268	261	\N	\N	\N	1
2013-11-19 20:49:35.170394+01	2013-11-19 20:49:35.170398+01	t	\N	custom	143-9	1	Quechua affixes in Amuesha	\N	269	262	\N	\N	\N	1
2013-11-19 20:49:35.179093+01	2013-11-19 20:49:35.179097+01	t	\N	custom	144-1	1	Tajik affixes in Moghol	\N	270	263	\N	\N	\N	1
2013-11-19 20:49:35.17946+01	2013-11-19 20:49:35.179464+01	t	\N	custom	144-2	1	Tajik affixes in Moghol	\N	271	264	\N	\N	\N	1
2013-11-19 20:49:35.179896+01	2013-11-19 20:49:35.179902+01	t	\N	custom	144-10	1	Tajik affixes in Moghol	\N	272	265	\N	\N	\N	1
2013-11-19 20:49:35.180365+01	2013-11-19 20:49:35.180369+01	t	\N	custom	144-24	4	Tajik affixes in Moghol	\N	273	266	\N	\N	\N	1
2013-11-19 20:49:35.186683+01	2013-11-19 20:49:35.186687+01	t	\N	custom	145-24	1	Chinese affixes in Dagur	\N	274	267	\N	\N	\N	1
2013-11-19 20:49:35.192271+01	2013-11-19 20:49:35.192274+01	t	\N	custom	146-2	1	Croatian affixes in Hungarian	\N	275	268	\N	\N	\N	1
2013-11-19 20:49:35.19725+01	2013-11-19 20:49:35.197254+01	t	\N	custom	147-24	3	Evenki affixes in Dagur	\N	276	267	\N	\N	\N	1
2013-11-19 20:49:35.209176+01	2013-11-19 20:49:35.20918+01	t	\N	custom	148-19	1	Chinese affixes in Santa	\N	277	269	\N	\N	\N	1
2013-11-19 20:49:35.209555+01	2013-11-19 20:49:35.209559+01	t	\N	custom	148-20	4	Chinese affixes in Santa	\N	278	270	\N	\N	\N	1
2013-11-19 20:49:35.209922+01	2013-11-19 20:49:35.209925+01	t	\N	custom	148-24	1	Chinese affixes in Santa	\N	279	271	\N	\N	\N	1
2013-11-19 20:49:35.21048+01	2013-11-19 20:49:35.210484+01	t	\N	custom	148-33	1	Chinese affixes in Santa	\N	280	272	\N	\N	\N	1
2013-11-19 20:49:35.224174+01	2013-11-19 20:49:35.224179+01	t	\N	custom	149-9	3	Turkic affixes in Middle Mongolic	\N	281	273	\N	\N	\N	1
2013-11-19 20:49:35.224925+01	2013-11-19 20:49:35.224929+01	t	\N	custom	149-20	1	Turkic affixes in Middle Mongolic	\N	282	274	\N	\N	\N	1
2013-11-19 20:49:35.22559+01	2013-11-19 20:49:35.225594+01	t	\N	custom	149-24	1	Turkic affixes in Middle Mongolic	\N	283	275	\N	\N	\N	1
2013-11-19 20:49:35.226099+01	2013-11-19 20:49:35.226102+01	t	\N	custom	149-41	1	Turkic affixes in Middle Mongolic	\N	284	276	\N	\N	\N	1
2013-11-19 20:49:35.233963+01	2013-11-19 20:49:35.233967+01	t	\N	custom	150-13	4	Lingala affixes in Ndunga-le	\N	285	277	\N	\N	\N	1
2013-11-19 20:49:35.240843+01	2013-11-19 20:49:35.240852+01	t	\N	custom	151-24	4	Cushitic affixes in Ilwana	\N	286	278	\N	\N	\N	1
2013-11-19 20:49:35.25163+01	2013-11-19 20:49:35.251634+01	t	\N	custom	152-38	2	North Swahili affixes in South Swahili	\N	287	279	\N	\N	\N	1
2013-11-19 20:49:35.263071+01	2013-11-19 20:49:35.263075+01	t	\N	custom	153-14	1	Spanish affixes in Central Mexicano Nahuatl	\N	288	280	\N	\N	\N	1
2013-11-19 20:49:35.26344+01	2013-11-19 20:49:35.263443+01	t	\N	custom	153-15	1	Spanish affixes in Central Mexicano Nahuatl	\N	289	281	\N	\N	\N	1
2013-11-19 20:49:35.263853+01	2013-11-19 20:49:35.263856+01	t	\N	custom	153-20	1	Spanish affixes in Central Mexicano Nahuatl	\N	290	282	\N	\N	\N	1
\.


--
-- Data for Name: value_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY value_data (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Data for Name: value_data_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY value_data_history (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Name: value_data_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('value_data_history_pk_seq', 1, false);


--
-- Name: value_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('value_data_pk_seq', 1, false);


--
-- Data for Name: value_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY value_files (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Data for Name: value_files_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY value_files_history (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Name: value_files_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('value_files_history_pk_seq', 1, false);


--
-- Name: value_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('value_files_pk_seq', 1, false);


--
-- Data for Name: value_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY value_history (created, updated, active, jsondata, polymorphic_type, id, name, description, markup_description, pk, valueset_pk, domainelement_pk, frequency, confidence, version) FROM stdin;
\.


--
-- Name: value_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('value_history_pk_seq', 1, false);


--
-- Name: value_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('value_pk_seq', 290, true);


--
-- Data for Name: valuesentence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY valuesentence (pk, created, updated, active, jsondata, polymorphic_type, value_pk, sentence_pk, description, version) FROM stdin;
\.


--
-- Data for Name: valuesentence_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY valuesentence_history (pk, created, updated, active, jsondata, polymorphic_type, value_pk, sentence_pk, description, version) FROM stdin;
\.


--
-- Name: valuesentence_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('valuesentence_history_pk_seq', 1, false);


--
-- Name: valuesentence_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('valuesentence_pk_seq', 1, false);


--
-- Data for Name: valueset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY valueset (pk, created, updated, active, jsondata, polymorphic_type, id, description, markup_description, language_pk, parameter_pk, contribution_pk, source, version) FROM stdin;
1	2013-11-19 20:49:33.756651+01	2013-11-19 20:49:33.756655+01	t	\N	base	128-7	\N	\N	128	7	1	\N	1
2	2013-11-19 20:49:33.758847+01	2013-11-19 20:49:33.758851+01	t	\N	base	128-12	\N	\N	128	12	1	\N	1
3	2013-11-19 20:49:33.75957+01	2013-11-19 20:49:33.759573+01	t	\N	base	128-13	\N	\N	128	13	1	\N	1
4	2013-11-19 20:49:33.760211+01	2013-11-19 20:49:33.760215+01	t	\N	base	128-15	\N	\N	128	15	1	\N	1
5	2013-11-19 20:49:33.760856+01	2013-11-19 20:49:33.760859+01	t	\N	base	128-24	\N	\N	128	24	1	\N	1
6	2013-11-19 20:49:33.761468+01	2013-11-19 20:49:33.761472+01	t	\N	base	128-25	\N	\N	128	25	1	\N	1
7	2013-11-19 20:49:33.762091+01	2013-11-19 20:49:33.762095+01	t	\N	base	128-39	\N	\N	128	39	1	\N	1
8	2013-11-19 20:49:33.791187+01	2013-11-19 20:49:33.791194+01	t	\N	base	54-7	\N	\N	54	7	1	\N	1
9	2013-11-19 20:49:33.792127+01	2013-11-19 20:49:33.792131+01	t	\N	base	54-8	\N	\N	54	8	1	\N	1
10	2013-11-19 20:49:33.792873+01	2013-11-19 20:49:33.792877+01	t	\N	base	54-10	\N	\N	54	10	1	\N	1
11	2013-11-19 20:49:33.793635+01	2013-11-19 20:49:33.793639+01	t	\N	base	54-11	\N	\N	54	11	1	\N	1
12	2013-11-19 20:49:33.794269+01	2013-11-19 20:49:33.794273+01	t	\N	base	54-17	\N	\N	54	17	1	\N	1
13	2013-11-19 20:49:33.794888+01	2013-11-19 20:49:33.794892+01	t	\N	base	54-18	\N	\N	54	18	1	\N	1
14	2013-11-19 20:49:33.795498+01	2013-11-19 20:49:33.795502+01	t	\N	base	54-19	\N	\N	54	19	1	\N	1
15	2013-11-19 20:49:33.796088+01	2013-11-19 20:49:33.796092+01	t	\N	base	54-20	\N	\N	54	20	1	\N	1
16	2013-11-19 20:49:33.7967+01	2013-11-19 20:49:33.796704+01	t	\N	base	54-24	\N	\N	54	24	1	\N	1
17	2013-11-19 20:49:33.79731+01	2013-11-19 20:49:33.797314+01	t	\N	base	54-25	\N	\N	54	25	1	\N	1
18	2013-11-19 20:49:33.79791+01	2013-11-19 20:49:33.797913+01	t	\N	base	54-27	\N	\N	54	27	1	\N	1
19	2013-11-19 20:49:33.79861+01	2013-11-19 20:49:33.798614+01	t	\N	base	54-28	\N	\N	54	28	1	\N	1
20	2013-11-19 20:49:33.825361+01	2013-11-19 20:49:33.825365+01	t	\N	base	73-39	\N	\N	73	39	1	\N	1
21	2013-11-19 20:49:33.826045+01	2013-11-19 20:49:33.826049+01	t	\N	base	73-40	\N	\N	73	40	1	\N	1
22	2013-11-19 20:49:33.826682+01	2013-11-19 20:49:33.826686+01	t	\N	base	73-43	\N	\N	73	43	1	\N	1
23	2013-11-19 20:49:33.844747+01	2013-11-19 20:49:33.844753+01	t	\N	base	46-3	\N	\N	46	3	1	\N	1
24	2013-11-19 20:49:33.845516+01	2013-11-19 20:49:33.845521+01	t	\N	base	46-4	\N	\N	46	4	1	\N	1
25	2013-11-19 20:49:33.846175+01	2013-11-19 20:49:33.84618+01	t	\N	base	46-19	\N	\N	46	19	1	\N	1
26	2013-11-19 20:49:33.846789+01	2013-11-19 20:49:33.846793+01	t	\N	base	46-20	\N	\N	46	20	1	\N	1
27	2013-11-19 20:49:33.847516+01	2013-11-19 20:49:33.84752+01	t	\N	base	46-21	\N	\N	46	21	1	\N	1
28	2013-11-19 20:49:33.848199+01	2013-11-19 20:49:33.848204+01	t	\N	base	46-24	\N	\N	46	24	1	\N	1
29	2013-11-19 20:49:33.848961+01	2013-11-19 20:49:33.848966+01	t	\N	base	46-32	\N	\N	46	32	1	\N	1
30	2013-11-19 20:49:33.849601+01	2013-11-19 20:49:33.849605+01	t	\N	base	46-38	\N	\N	46	38	1	\N	1
31	2013-11-19 20:49:33.850258+01	2013-11-19 20:49:33.850264+01	t	\N	base	46-41	\N	\N	46	41	1	\N	1
32	2013-11-19 20:49:33.883568+01	2013-11-19 20:49:33.883572+01	t	\N	base	13-3	\N	\N	13	3	1	\N	1
33	2013-11-19 20:49:33.883948+01	2013-11-19 20:49:33.883951+01	t	\N	base	13-14	\N	\N	13	14	1	\N	1
34	2013-11-19 20:49:33.884239+01	2013-11-19 20:49:33.884242+01	t	\N	base	13-16	\N	\N	13	16	1	\N	1
35	2013-11-19 20:49:33.884515+01	2013-11-19 20:49:33.884518+01	t	\N	base	13-20	\N	\N	13	20	1	\N	1
36	2013-11-19 20:49:33.884801+01	2013-11-19 20:49:33.884804+01	t	\N	base	13-28	\N	\N	13	28	1	\N	1
37	2013-11-19 20:49:33.885196+01	2013-11-19 20:49:33.8852+01	t	\N	base	13-31	\N	\N	13	31	1	\N	1
38	2013-11-19 20:49:33.899945+01	2013-11-19 20:49:33.899955+01	t	\N	base	153-31	\N	\N	153	31	1	\N	1
39	2013-11-19 20:49:33.900698+01	2013-11-19 20:49:33.900705+01	t	\N	base	153-40	\N	\N	153	40	1	\N	1
40	2013-11-19 20:49:33.919017+01	2013-11-19 20:49:33.919023+01	t	\N	base	135-4	\N	\N	135	4	1	\N	1
41	2013-11-19 20:49:33.919424+01	2013-11-19 20:49:33.919428+01	t	\N	base	135-7	\N	\N	135	7	1	\N	1
42	2013-11-19 20:49:33.919762+01	2013-11-19 20:49:33.919766+01	t	\N	base	135-9	\N	\N	135	9	1	\N	1
43	2013-11-19 20:49:33.920082+01	2013-11-19 20:49:33.920085+01	t	\N	base	135-10	\N	\N	135	10	1	\N	1
44	2013-11-19 20:49:33.920396+01	2013-11-19 20:49:33.920399+01	t	\N	base	135-11	\N	\N	135	11	1	\N	1
45	2013-11-19 20:49:33.920715+01	2013-11-19 20:49:33.920718+01	t	\N	base	135-20	\N	\N	135	20	1	\N	1
46	2013-11-19 20:49:33.921022+01	2013-11-19 20:49:33.921025+01	t	\N	base	135-21	\N	\N	135	21	1	\N	1
47	2013-11-19 20:49:33.921329+01	2013-11-19 20:49:33.921332+01	t	\N	base	135-32	\N	\N	135	32	1	\N	1
48	2013-11-19 20:49:33.933431+01	2013-11-19 20:49:33.933438+01	t	\N	base	42-20	\N	\N	42	20	1	\N	1
49	2013-11-19 20:49:33.934024+01	2013-11-19 20:49:33.934028+01	t	\N	base	42-27	\N	\N	42	27	1	\N	1
50	2013-11-19 20:49:33.943433+01	2013-11-19 20:49:33.943441+01	t	\N	base	21-31	\N	\N	21	31	1	\N	1
51	2013-11-19 20:49:33.944152+01	2013-11-19 20:49:33.944159+01	t	\N	base	21-38	\N	\N	21	38	1	\N	1
52	2013-11-19 20:49:33.944522+01	2013-11-19 20:49:33.944525+01	t	\N	base	21-40	\N	\N	21	40	1	\N	1
53	2013-11-19 20:49:33.9579+01	2013-11-19 20:49:33.957907+01	t	\N	base	83-3	\N	\N	83	3	1	\N	1
54	2013-11-19 20:49:33.958422+01	2013-11-19 20:49:33.958428+01	t	\N	base	83-19	\N	\N	83	19	1	\N	1
55	2013-11-19 20:49:33.958952+01	2013-11-19 20:49:33.958958+01	t	\N	base	83-21	\N	\N	83	21	1	\N	1
56	2013-11-19 20:49:33.97475+01	2013-11-19 20:49:33.974761+01	t	\N	base	23-3	\N	\N	23	3	1	\N	1
57	2013-11-19 20:49:33.975446+01	2013-11-19 20:49:33.975451+01	t	\N	base	23-19	\N	\N	23	19	1	\N	1
58	2013-11-19 20:49:33.975832+01	2013-11-19 20:49:33.975836+01	t	\N	base	23-31	\N	\N	23	31	1	\N	1
59	2013-11-19 20:49:33.976161+01	2013-11-19 20:49:33.976165+01	t	\N	base	23-37	\N	\N	23	37	1	\N	1
60	2013-11-19 20:49:33.976572+01	2013-11-19 20:49:33.976578+01	t	\N	base	23-41	\N	\N	23	41	1	\N	1
61	2013-11-19 20:49:33.993511+01	2013-11-19 20:49:33.993517+01	t	\N	base	51-40	\N	\N	51	40	1	\N	1
62	2013-11-19 20:49:34.002742+01	2013-11-19 20:49:34.002748+01	t	\N	base	18-3	\N	\N	18	3	1	\N	1
63	2013-11-19 20:49:34.00418+01	2013-11-19 20:49:34.004183+01	t	\N	base	18-19	\N	\N	18	19	1	\N	1
64	2013-11-19 20:49:34.004561+01	2013-11-19 20:49:34.004563+01	t	\N	base	18-20	\N	\N	18	20	1	\N	1
65	2013-11-19 20:49:34.005005+01	2013-11-19 20:49:34.005011+01	t	\N	base	18-23	\N	\N	18	23	1	\N	1
66	2013-11-19 20:49:34.005522+01	2013-11-19 20:49:34.005526+01	t	\N	base	18-41	\N	\N	18	41	1	\N	1
67	2013-11-19 20:49:34.026129+01	2013-11-19 20:49:34.026135+01	t	\N	base	33-3	\N	\N	33	3	1	\N	1
68	2013-11-19 20:49:34.026695+01	2013-11-19 20:49:34.026699+01	t	\N	base	33-14	\N	\N	33	14	1	\N	1
69	2013-11-19 20:49:34.027123+01	2013-11-19 20:49:34.027126+01	t	\N	base	33-19	\N	\N	33	19	1	\N	1
70	2013-11-19 20:49:34.027548+01	2013-11-19 20:49:34.027552+01	t	\N	base	33-20	\N	\N	33	20	1	\N	1
71	2013-11-19 20:49:34.037369+01	2013-11-19 20:49:34.037374+01	t	\N	base	147-5	\N	\N	147	5	1	\N	1
72	2013-11-19 20:49:34.037856+01	2013-11-19 20:49:34.037859+01	t	\N	base	147-9	\N	\N	147	9	1	\N	1
73	2013-11-19 20:49:34.038207+01	2013-11-19 20:49:34.03821+01	t	\N	base	147-10	\N	\N	147	10	1	\N	1
74	2013-11-19 20:49:34.038551+01	2013-11-19 20:49:34.038554+01	t	\N	base	147-24	\N	\N	147	24	1	\N	1
75	2013-11-19 20:49:34.051474+01	2013-11-19 20:49:34.051481+01	t	\N	base	104-14	\N	\N	104	14	1	\N	1
76	2013-11-19 20:49:34.05212+01	2013-11-19 20:49:34.052124+01	t	\N	base	104-20	\N	\N	104	20	1	\N	1
77	2013-11-19 20:49:34.052484+01	2013-11-19 20:49:34.052489+01	t	\N	base	104-21	\N	\N	104	21	1	\N	1
78	2013-11-19 20:49:34.062431+01	2013-11-19 20:49:34.062437+01	t	\N	base	42-19	\N	\N	42	19	1	\N	1
79	2013-11-19 20:49:34.073574+01	2013-11-19 20:49:34.073578+01	t	\N	base	80-19	\N	\N	80	19	1	\N	1
80	2013-11-19 20:49:34.073973+01	2013-11-19 20:49:34.073976+01	t	\N	base	80-34	\N	\N	80	34	1	\N	1
81	2013-11-19 20:49:34.074304+01	2013-11-19 20:49:34.074308+01	t	\N	base	80-40	\N	\N	80	40	1	\N	1
82	2013-11-19 20:49:34.074688+01	2013-11-19 20:49:34.074692+01	t	\N	base	80-41	\N	\N	80	41	1	\N	1
83	2013-11-19 20:49:34.097235+01	2013-11-19 20:49:34.097244+01	t	\N	base	77-12	\N	\N	77	12	1	\N	1
84	2013-11-19 20:49:34.098265+01	2013-11-19 20:49:34.098277+01	t	\N	base	77-14	\N	\N	77	14	1	\N	1
85	2013-11-19 20:49:34.099379+01	2013-11-19 20:49:34.099395+01	t	\N	base	77-24	\N	\N	77	24	1	\N	1
86	2013-11-19 20:49:34.123847+01	2013-11-19 20:49:34.123852+01	t	\N	base	12-1	\N	\N	12	1	1	\N	1
87	2013-11-19 20:49:34.124644+01	2013-11-19 20:49:34.124649+01	t	\N	base	12-2	\N	\N	12	2	1	\N	1
88	2013-11-19 20:49:34.125394+01	2013-11-19 20:49:34.125398+01	t	\N	base	12-19	\N	\N	12	19	1	\N	1
89	2013-11-19 20:49:34.126143+01	2013-11-19 20:49:34.126147+01	t	\N	base	12-20	\N	\N	12	20	1	\N	1
90	2013-11-19 20:49:34.127046+01	2013-11-19 20:49:34.12705+01	t	\N	base	12-38	\N	\N	12	38	1	\N	1
91	2013-11-19 20:49:34.144891+01	2013-11-19 20:49:34.144897+01	t	\N	base	19-9	\N	\N	19	9	1	\N	1
92	2013-11-19 20:49:34.145798+01	2013-11-19 20:49:34.145802+01	t	\N	base	19-13	\N	\N	19	13	1	\N	1
93	2013-11-19 20:49:34.15903+01	2013-11-19 20:49:34.159035+01	t	\N	base	18-21	\N	\N	18	21	1	\N	1
94	2013-11-19 20:49:34.159781+01	2013-11-19 20:49:34.159785+01	t	\N	base	18-22	\N	\N	18	22	1	\N	1
95	2013-11-19 20:49:34.160681+01	2013-11-19 20:49:34.160693+01	t	\N	base	18-24	\N	\N	18	24	1	\N	1
96	2013-11-19 20:49:34.183066+01	2013-11-19 20:49:34.183072+01	t	\N	base	133-24	\N	\N	133	24	1	\N	1
97	2013-11-19 20:49:34.184034+01	2013-11-19 20:49:34.184039+01	t	\N	base	133-29	\N	\N	133	29	1	\N	1
98	2013-11-19 20:49:34.202397+01	2013-11-19 20:49:34.202402+01	t	\N	base	35-3	\N	\N	35	3	1	\N	1
99	2013-11-19 20:49:34.203257+01	2013-11-19 20:49:34.203262+01	t	\N	base	35-9	\N	\N	35	9	1	\N	1
100	2013-11-19 20:49:34.204055+01	2013-11-19 20:49:34.20406+01	t	\N	base	35-11	\N	\N	35	11	1	\N	1
101	2013-11-19 20:49:34.20491+01	2013-11-19 20:49:34.204915+01	t	\N	base	35-16	\N	\N	35	16	1	\N	1
102	2013-11-19 20:49:34.205702+01	2013-11-19 20:49:34.205707+01	t	\N	base	35-21	\N	\N	35	21	1	\N	1
103	2013-11-19 20:49:34.206499+01	2013-11-19 20:49:34.206504+01	t	\N	base	35-31	\N	\N	35	31	1	\N	1
104	2013-11-19 20:49:34.207186+01	2013-11-19 20:49:34.207191+01	t	\N	base	35-34	\N	\N	35	34	1	\N	1
105	2013-11-19 20:49:34.207854+01	2013-11-19 20:49:34.20786+01	t	\N	base	35-35	\N	\N	35	35	1	\N	1
106	2013-11-19 20:49:34.208312+01	2013-11-19 20:49:34.208316+01	t	\N	base	35-38	\N	\N	35	38	1	\N	1
107	2013-11-19 20:49:34.235758+01	2013-11-19 20:49:34.23577+01	t	\N	base	5-9	\N	\N	5	9	1	\N	1
108	2013-11-19 20:49:34.236623+01	2013-11-19 20:49:34.236632+01	t	\N	base	5-11	\N	\N	5	11	1	\N	1
109	2013-11-19 20:49:34.254022+01	2013-11-19 20:49:34.254028+01	t	\N	base	17-9	\N	\N	17	9	1	\N	1
110	2013-11-19 20:49:34.254729+01	2013-11-19 20:49:34.254732+01	t	\N	base	17-25	\N	\N	17	25	1	\N	1
111	2013-11-19 20:49:34.255286+01	2013-11-19 20:49:34.255289+01	t	\N	base	17-27	\N	\N	17	27	1	\N	1
112	2013-11-19 20:49:34.255807+01	2013-11-19 20:49:34.25581+01	t	\N	base	17-43	\N	\N	17	43	1	\N	1
113	2013-11-19 20:49:34.269438+01	2013-11-19 20:49:34.269444+01	t	\N	base	110-22	\N	\N	110	22	1	\N	1
114	2013-11-19 20:49:34.270137+01	2013-11-19 20:49:34.270141+01	t	\N	base	110-38	\N	\N	110	38	1	\N	1
115	2013-11-19 20:49:34.282737+01	2013-11-19 20:49:34.282745+01	t	\N	base	90-1	\N	\N	90	1	1	\N	1
116	2013-11-19 20:49:34.283647+01	2013-11-19 20:49:34.283653+01	t	\N	base	90-5	\N	\N	90	5	1	\N	1
117	2013-11-19 20:49:34.284334+01	2013-11-19 20:49:34.284339+01	t	\N	base	90-16	\N	\N	90	16	1	\N	1
118	2013-11-19 20:49:34.285129+01	2013-11-19 20:49:34.285134+01	t	\N	base	90-40	\N	\N	90	40	1	\N	1
119	2013-11-19 20:49:34.3042+01	2013-11-19 20:49:34.304209+01	t	\N	base	150-7	\N	\N	150	7	1	\N	1
120	2013-11-19 20:49:34.305248+01	2013-11-19 20:49:34.305259+01	t	\N	base	150-8	\N	\N	150	8	1	\N	1
121	2013-11-19 20:49:34.32694+01	2013-11-19 20:49:34.326943+01	t	\N	base	41-39	\N	\N	41	39	1	\N	1
122	2013-11-19 20:49:34.337278+01	2013-11-19 20:49:34.337285+01	t	\N	base	129-38	\N	\N	129	38	1	\N	1
123	2013-11-19 20:49:34.346035+01	2013-11-19 20:49:34.346041+01	t	\N	base	105-32	\N	\N	105	32	1	\N	1
124	2013-11-19 20:49:34.355749+01	2013-11-19 20:49:34.355754+01	t	\N	base	96-24	\N	\N	96	24	1	\N	1
125	2013-11-19 20:49:34.35656+01	2013-11-19 20:49:34.356566+01	t	\N	base	96-38	\N	\N	96	38	1	\N	1
126	2013-11-19 20:49:34.3688+01	2013-11-19 20:49:34.368807+01	t	\N	base	154-38	\N	\N	154	38	1	\N	1
127	2013-11-19 20:49:34.369679+01	2013-11-19 20:49:34.369685+01	t	\N	base	154-42	\N	\N	154	42	1	\N	1
128	2013-11-19 20:49:34.384285+01	2013-11-19 20:49:34.384293+01	t	\N	base	124-3	\N	\N	124	3	1	\N	1
129	2013-11-19 20:49:34.39748+01	2013-11-19 20:49:34.397491+01	t	\N	base	91-31	\N	\N	91	31	1	\N	1
130	2013-11-19 20:49:34.410814+01	2013-11-19 20:49:34.410818+01	t	\N	base	74-31	\N	\N	74	31	1	\N	1
131	2013-11-19 20:49:34.418737+01	2013-11-19 20:49:34.418742+01	t	\N	base	42-3	\N	\N	42	3	1	\N	1
132	2013-11-19 20:49:34.426519+01	2013-11-19 20:49:34.426523+01	t	\N	base	141-3	\N	\N	141	3	1	\N	1
133	2013-11-19 20:49:34.427244+01	2013-11-19 20:49:34.427248+01	t	\N	base	141-26	\N	\N	141	26	1	\N	1
134	2013-11-19 20:49:34.44083+01	2013-11-19 20:49:34.440842+01	t	\N	base	6-42	\N	\N	6	42	1	\N	1
135	2013-11-19 20:49:34.455508+01	2013-11-19 20:49:34.455516+01	t	\N	base	107-40	\N	\N	107	40	1	\N	1
136	2013-11-19 20:49:34.472532+01	2013-11-19 20:49:34.472543+01	t	\N	base	92-14	\N	\N	92	14	1	\N	1
137	2013-11-19 20:49:34.473331+01	2013-11-19 20:49:34.473339+01	t	\N	base	92-38	\N	\N	92	38	1	\N	1
138	2013-11-19 20:49:34.494027+01	2013-11-19 20:49:34.494039+01	t	\N	base	92-19	\N	\N	92	19	1	\N	1
139	2013-11-19 20:49:34.494869+01	2013-11-19 20:49:34.494877+01	t	\N	base	92-22	\N	\N	92	22	1	\N	1
140	2013-11-19 20:49:34.495526+01	2013-11-19 20:49:34.495534+01	t	\N	base	92-33	\N	\N	92	33	1	\N	1
141	2013-11-19 20:49:34.513851+01	2013-11-19 20:49:34.513863+01	t	\N	base	71-24	\N	\N	71	24	1	\N	1
142	2013-11-19 20:49:34.524433+01	2013-11-19 20:49:34.524443+01	t	\N	base	45-27	\N	\N	45	27	1	\N	1
143	2013-11-19 20:49:34.537437+01	2013-11-19 20:49:34.537447+01	t	\N	base	48-16	\N	\N	48	16	1	\N	1
144	2013-11-19 20:49:34.538237+01	2013-11-19 20:49:34.538244+01	t	\N	base	48-17	\N	\N	48	17	1	\N	1
145	2013-11-19 20:49:34.538816+01	2013-11-19 20:49:34.538823+01	t	\N	base	48-20	\N	\N	48	20	1	\N	1
146	2013-11-19 20:49:34.539387+01	2013-11-19 20:49:34.539392+01	t	\N	base	48-38	\N	\N	48	38	1	\N	1
147	2013-11-19 20:49:34.550247+01	2013-11-19 20:49:34.550254+01	t	\N	base	84-6	\N	\N	84	6	1	\N	1
148	2013-11-19 20:49:34.557706+01	2013-11-19 20:49:34.557713+01	t	\N	base	40-30	\N	\N	40	30	1	\N	1
149	2013-11-19 20:49:34.578049+01	2013-11-19 20:49:34.578058+01	t	\N	base	27-3	\N	\N	27	3	1	\N	1
150	2013-11-19 20:49:34.57876+01	2013-11-19 20:49:34.578766+01	t	\N	base	27-12	\N	\N	27	12	1	\N	1
151	2013-11-19 20:49:34.579228+01	2013-11-19 20:49:34.579234+01	t	\N	base	27-14	\N	\N	27	14	1	\N	1
152	2013-11-19 20:49:34.579699+01	2013-11-19 20:49:34.579704+01	t	\N	base	27-20	\N	\N	27	20	1	\N	1
153	2013-11-19 20:49:34.580156+01	2013-11-19 20:49:34.580161+01	t	\N	base	27-23	\N	\N	27	23	1	\N	1
154	2013-11-19 20:49:34.580648+01	2013-11-19 20:49:34.580654+01	t	\N	base	27-28	\N	\N	27	28	1	\N	1
155	2013-11-19 20:49:34.581126+01	2013-11-19 20:49:34.581131+01	t	\N	base	27-41	\N	\N	27	41	1	\N	1
156	2013-11-19 20:49:34.601069+01	2013-11-19 20:49:34.601075+01	t	\N	base	7-3	\N	\N	7	3	1	\N	1
157	2013-11-19 20:49:34.601462+01	2013-11-19 20:49:34.601468+01	t	\N	base	7-14	\N	\N	7	14	1	\N	1
158	2013-11-19 20:49:34.601862+01	2013-11-19 20:49:34.601866+01	t	\N	base	7-19	\N	\N	7	19	1	\N	1
159	2013-11-19 20:49:34.602179+01	2013-11-19 20:49:34.602183+01	t	\N	base	7-21	\N	\N	7	21	1	\N	1
160	2013-11-19 20:49:34.602487+01	2013-11-19 20:49:34.60249+01	t	\N	base	7-22	\N	\N	7	22	1	\N	1
161	2013-11-19 20:49:34.602793+01	2013-11-19 20:49:34.602796+01	t	\N	base	7-23	\N	\N	7	23	1	\N	1
162	2013-11-19 20:49:34.603095+01	2013-11-19 20:49:34.603098+01	t	\N	base	7-38	\N	\N	7	38	1	\N	1
163	2013-11-19 20:49:34.603396+01	2013-11-19 20:49:34.603399+01	t	\N	base	7-40	\N	\N	7	40	1	\N	1
164	2013-11-19 20:49:34.615427+01	2013-11-19 20:49:34.615434+01	t	\N	base	87-14	\N	\N	87	14	1	\N	1
165	2013-11-19 20:49:34.615958+01	2013-11-19 20:49:34.615961+01	t	\N	base	87-20	\N	\N	87	20	1	\N	1
166	2013-11-19 20:49:34.616277+01	2013-11-19 20:49:34.616281+01	t	\N	base	87-22	\N	\N	87	22	1	\N	1
167	2013-11-19 20:49:34.616614+01	2013-11-19 20:49:34.616619+01	t	\N	base	87-27	\N	\N	87	27	1	\N	1
168	2013-11-19 20:49:34.616927+01	2013-11-19 20:49:34.61693+01	t	\N	base	87-39	\N	\N	87	39	1	\N	1
169	2013-11-19 20:49:34.617235+01	2013-11-19 20:49:34.617238+01	t	\N	base	87-41	\N	\N	87	41	1	\N	1
170	2013-11-19 20:49:34.628135+01	2013-11-19 20:49:34.628141+01	t	\N	base	55-2	\N	\N	55	2	1	\N	1
171	2013-11-19 20:49:34.628617+01	2013-11-19 20:49:34.628622+01	t	\N	base	55-38	\N	\N	55	38	1	\N	1
172	2013-11-19 20:49:34.638545+01	2013-11-19 20:49:34.63855+01	t	\N	base	70-20	\N	\N	70	20	1	\N	1
173	2013-11-19 20:49:34.649778+01	2013-11-19 20:49:34.649784+01	t	\N	base	37-1	\N	\N	37	1	1	\N	1
174	2013-11-19 20:49:34.650259+01	2013-11-19 20:49:34.650265+01	t	\N	base	37-3	\N	\N	37	3	1	\N	1
175	2013-11-19 20:49:34.650696+01	2013-11-19 20:49:34.6507+01	t	\N	base	37-38	\N	\N	37	38	1	\N	1
176	2013-11-19 20:49:34.66428+01	2013-11-19 20:49:34.664289+01	t	\N	base	28-19	\N	\N	28	19	1	\N	1
177	2013-11-19 20:49:34.664988+01	2013-11-19 20:49:34.664994+01	t	\N	base	28-33	\N	\N	28	33	1	\N	1
178	2013-11-19 20:49:34.665496+01	2013-11-19 20:49:34.665501+01	t	\N	base	28-34	\N	\N	28	34	1	\N	1
179	2013-11-19 20:49:34.665938+01	2013-11-19 20:49:34.665942+01	t	\N	base	28-36	\N	\N	28	36	1	\N	1
180	2013-11-19 20:49:34.666369+01	2013-11-19 20:49:34.666374+01	t	\N	base	28-38	\N	\N	28	38	1	\N	1
181	2013-11-19 20:49:34.678417+01	2013-11-19 20:49:34.678422+01	t	\N	base	149-33	\N	\N	149	33	1	\N	1
182	2013-11-19 20:49:34.686771+01	2013-11-19 20:49:34.686776+01	t	\N	base	2-40	\N	\N	2	40	1	\N	1
183	2013-11-19 20:49:34.696048+01	2013-11-19 20:49:34.696058+01	t	\N	base	113-19	\N	\N	113	19	1	\N	1
184	2013-11-19 20:49:34.696824+01	2013-11-19 20:49:34.696831+01	t	\N	base	113-20	\N	\N	113	20	1	\N	1
185	2013-11-19 20:49:34.70952+01	2013-11-19 20:49:34.709528+01	t	\N	base	47-40	\N	\N	47	40	1	\N	1
186	2013-11-19 20:49:34.717585+01	2013-11-19 20:49:34.717591+01	t	\N	base	11-5	\N	\N	11	5	1	\N	1
187	2013-11-19 20:49:34.728532+01	2013-11-19 20:49:34.728543+01	t	\N	base	124-27	\N	\N	124	27	1	\N	1
188	2013-11-19 20:49:34.74433+01	2013-11-19 20:49:34.744339+01	t	\N	base	134-3	\N	\N	134	3	1	\N	1
189	2013-11-19 20:49:34.745085+01	2013-11-19 20:49:34.745091+01	t	\N	base	134-12	\N	\N	134	12	1	\N	1
190	2013-11-19 20:49:34.745561+01	2013-11-19 20:49:34.745566+01	t	\N	base	134-32	\N	\N	134	32	1	\N	1
191	2013-11-19 20:49:34.746014+01	2013-11-19 20:49:34.746019+01	t	\N	base	134-33	\N	\N	134	33	1	\N	1
192	2013-11-19 20:49:34.765569+01	2013-11-19 20:49:34.765578+01	t	\N	base	81-3	\N	\N	81	3	1	\N	1
193	2013-11-19 20:49:34.766137+01	2013-11-19 20:49:34.766143+01	t	\N	base	81-19	\N	\N	81	19	1	\N	1
194	2013-11-19 20:49:34.766592+01	2013-11-19 20:49:34.766598+01	t	\N	base	81-20	\N	\N	81	20	1	\N	1
195	2013-11-19 20:49:34.76704+01	2013-11-19 20:49:34.767045+01	t	\N	base	81-23	\N	\N	81	23	1	\N	1
196	2013-11-19 20:49:34.767486+01	2013-11-19 20:49:34.767491+01	t	\N	base	81-27	\N	\N	81	27	1	\N	1
197	2013-11-19 20:49:34.785286+01	2013-11-19 20:49:34.785292+01	t	\N	base	118-3	\N	\N	118	3	1	\N	1
198	2013-11-19 20:49:34.785677+01	2013-11-19 20:49:34.78568+01	t	\N	base	118-14	\N	\N	118	14	1	\N	1
199	2013-11-19 20:49:34.786001+01	2013-11-19 20:49:34.786004+01	t	\N	base	118-20	\N	\N	118	20	1	\N	1
200	2013-11-19 20:49:34.786315+01	2013-11-19 20:49:34.786318+01	t	\N	base	118-23	\N	\N	118	23	1	\N	1
201	2013-11-19 20:49:34.786625+01	2013-11-19 20:49:34.786628+01	t	\N	base	118-27	\N	\N	118	27	1	\N	1
202	2013-11-19 20:49:34.797376+01	2013-11-19 20:49:34.797384+01	t	\N	base	106-3	\N	\N	106	3	1	\N	1
203	2013-11-19 20:49:34.79793+01	2013-11-19 20:49:34.797935+01	t	\N	base	106-20	\N	\N	106	20	1	\N	1
204	2013-11-19 20:49:34.798265+01	2013-11-19 20:49:34.798268+01	t	\N	base	106-21	\N	\N	106	21	1	\N	1
205	2013-11-19 20:49:34.798595+01	2013-11-19 20:49:34.798598+01	t	\N	base	106-27	\N	\N	106	27	1	\N	1
206	2013-11-19 20:49:34.798909+01	2013-11-19 20:49:34.798913+01	t	\N	base	106-28	\N	\N	106	28	1	\N	1
207	2013-11-19 20:49:34.812143+01	2013-11-19 20:49:34.812151+01	t	\N	base	137-1	\N	\N	137	1	1	\N	1
208	2013-11-19 20:49:34.812712+01	2013-11-19 20:49:34.812716+01	t	\N	base	137-2	\N	\N	137	2	1	\N	1
209	2013-11-19 20:49:34.813066+01	2013-11-19 20:49:34.81307+01	t	\N	base	137-3	\N	\N	137	3	1	\N	1
210	2013-11-19 20:49:34.813385+01	2013-11-19 20:49:34.813389+01	t	\N	base	137-14	\N	\N	137	14	1	\N	1
211	2013-11-19 20:49:34.8137+01	2013-11-19 20:49:34.813703+01	t	\N	base	137-27	\N	\N	137	27	1	\N	1
212	2013-11-19 20:49:34.814012+01	2013-11-19 20:49:34.814015+01	t	\N	base	137-34	\N	\N	137	34	1	\N	1
213	2013-11-19 20:49:34.814321+01	2013-11-19 20:49:34.814324+01	t	\N	base	137-35	\N	\N	137	35	1	\N	1
214	2013-11-19 20:49:34.814629+01	2013-11-19 20:49:34.814632+01	t	\N	base	137-39	\N	\N	137	39	1	\N	1
215	2013-11-19 20:49:34.814945+01	2013-11-19 20:49:34.814948+01	t	\N	base	137-41	\N	\N	137	41	1	\N	1
216	2013-11-19 20:49:34.826141+01	2013-11-19 20:49:34.826146+01	t	\N	base	16-12	\N	\N	16	12	1	\N	1
217	2013-11-19 20:49:34.826508+01	2013-11-19 20:49:34.826511+01	t	\N	base	16-20	\N	\N	16	20	1	\N	1
218	2013-11-19 20:49:34.84501+01	2013-11-19 20:49:34.845017+01	t	\N	base	112-39	\N	\N	112	39	1	\N	1
219	2013-11-19 20:49:34.859083+01	2013-11-19 20:49:34.859089+01	t	\N	base	121-3	\N	\N	121	3	1	\N	1
220	2013-11-19 20:49:34.859569+01	2013-11-19 20:49:34.859573+01	t	\N	base	121-12	\N	\N	121	12	1	\N	1
221	2013-11-19 20:49:34.859968+01	2013-11-19 20:49:34.859972+01	t	\N	base	121-14	\N	\N	121	14	1	\N	1
222	2013-11-19 20:49:34.860518+01	2013-11-19 20:49:34.860521+01	t	\N	base	121-15	\N	\N	121	15	1	\N	1
223	2013-11-19 20:49:34.861198+01	2013-11-19 20:49:34.861201+01	t	\N	base	121-20	\N	\N	121	20	1	\N	1
224	2013-11-19 20:49:34.861821+01	2013-11-19 20:49:34.861825+01	t	\N	base	121-21	\N	\N	121	21	1	\N	1
225	2013-11-19 20:49:34.862454+01	2013-11-19 20:49:34.862457+01	t	\N	base	121-22	\N	\N	121	22	1	\N	1
226	2013-11-19 20:49:34.863067+01	2013-11-19 20:49:34.86307+01	t	\N	base	121-27	\N	\N	121	27	1	\N	1
227	2013-11-19 20:49:34.863597+01	2013-11-19 20:49:34.8636+01	t	\N	base	121-28	\N	\N	121	28	1	\N	1
228	2013-11-19 20:49:34.881682+01	2013-11-19 20:49:34.88169+01	t	\N	base	152-21	\N	\N	152	21	1	\N	1
229	2013-11-19 20:49:34.898761+01	2013-11-19 20:49:34.898768+01	t	\N	base	68-9	\N	\N	68	9	1	\N	1
230	2013-11-19 20:49:34.899545+01	2013-11-19 20:49:34.899551+01	t	\N	base	68-10	\N	\N	68	10	1	\N	1
231	2013-11-19 20:49:34.900281+01	2013-11-19 20:49:34.900287+01	t	\N	base	68-36	\N	\N	68	36	1	\N	1
232	2013-11-19 20:49:34.901044+01	2013-11-19 20:49:34.90105+01	t	\N	base	68-38	\N	\N	68	38	1	\N	1
233	2013-11-19 20:49:34.901775+01	2013-11-19 20:49:34.901781+01	t	\N	base	68-42	\N	\N	68	42	1	\N	1
234	2013-11-19 20:49:34.920507+01	2013-11-19 20:49:34.920518+01	t	\N	base	100-38	\N	\N	100	38	1	\N	1
235	2013-11-19 20:49:34.921577+01	2013-11-19 20:49:34.921586+01	t	\N	base	100-39	\N	\N	100	39	1	\N	1
236	2013-11-19 20:49:34.939035+01	2013-11-19 20:49:34.939044+01	t	\N	base	146-9	\N	\N	146	9	1	\N	1
237	2013-11-19 20:49:34.960776+01	2013-11-19 20:49:34.960782+01	t	\N	base	95-14	\N	\N	95	14	1	\N	1
238	2013-11-19 20:49:34.961611+01	2013-11-19 20:49:34.961615+01	t	\N	base	95-19	\N	\N	95	19	1	\N	1
239	2013-11-19 20:49:34.962253+01	2013-11-19 20:49:34.962256+01	t	\N	base	95-23	\N	\N	95	23	1	\N	1
240	2013-11-19 20:49:34.962882+01	2013-11-19 20:49:34.962885+01	t	\N	base	95-27	\N	\N	95	27	1	\N	1
241	2013-11-19 20:49:34.963506+01	2013-11-19 20:49:34.963509+01	t	\N	base	95-28	\N	\N	95	28	1	\N	1
242	2013-11-19 20:49:34.977005+01	2013-11-19 20:49:34.977012+01	t	\N	base	99-16	\N	\N	99	16	1	\N	1
243	2013-11-19 20:49:34.989592+01	2013-11-19 20:49:34.989599+01	t	\N	base	58-5	\N	\N	58	5	1	\N	1
244	2013-11-19 20:49:34.990558+01	2013-11-19 20:49:34.990569+01	t	\N	base	58-39	\N	\N	58	39	1	\N	1
245	2013-11-19 20:49:35.010249+01	2013-11-19 20:49:35.010253+01	t	\N	base	13-21	\N	\N	13	21	1	\N	1
246	2013-11-19 20:49:35.019019+01	2013-11-19 20:49:35.019024+01	t	\N	base	136-39	\N	\N	136	39	1	\N	1
247	2013-11-19 20:49:35.028592+01	2013-11-19 20:49:35.028597+01	t	\N	base	136-42	\N	\N	136	42	1	\N	1
248	2013-11-19 20:49:35.045576+01	2013-11-19 20:49:35.045582+01	t	\N	base	111-1	\N	\N	111	1	1	\N	1
249	2013-11-19 20:49:35.059185+01	2013-11-19 20:49:35.059189+01	t	\N	base	142-30	\N	\N	142	30	1	\N	1
250	2013-11-19 20:49:35.064627+01	2013-11-19 20:49:35.064647+01	t	\N	base	57-20	\N	\N	57	20	1	\N	1
251	2013-11-19 20:49:35.081251+01	2013-11-19 20:49:35.081262+01	t	\N	base	60-14	\N	\N	60	14	1	\N	1
252	2013-11-19 20:49:35.095154+01	2013-11-19 20:49:35.095167+01	t	\N	base	22-14	\N	\N	22	14	1	\N	1
253	2013-11-19 20:49:35.111117+01	2013-11-19 20:49:35.111128+01	t	\N	base	158-14	\N	\N	158	14	1	\N	1
254	2013-11-19 20:49:35.121498+01	2013-11-19 20:49:35.121507+01	t	\N	base	85-20	\N	\N	85	20	1	\N	1
255	2013-11-19 20:49:35.133112+01	2013-11-19 20:49:35.133126+01	t	\N	base	3-20	\N	\N	3	20	1	\N	1
256	2013-11-19 20:49:35.135081+01	2013-11-19 20:49:35.135093+01	t	\N	base	3-21	\N	\N	3	21	1	\N	1
257	2013-11-19 20:49:35.136+01	2013-11-19 20:49:35.136011+01	t	\N	base	3-22	\N	\N	3	22	1	\N	1
258	2013-11-19 20:49:35.136764+01	2013-11-19 20:49:35.136774+01	t	\N	base	3-28	\N	\N	3	28	1	\N	1
259	2013-11-19 20:49:35.146471+01	2013-11-19 20:49:35.146486+01	t	\N	base	86-31	\N	\N	86	31	1	\N	1
260	2013-11-19 20:49:35.159348+01	2013-11-19 20:49:35.159354+01	t	\N	base	115-20	\N	\N	115	20	1	\N	1
261	2013-11-19 20:49:35.168734+01	2013-11-19 20:49:35.168741+01	t	\N	base	72-5	\N	\N	72	5	1	\N	1
262	2013-11-19 20:49:35.169363+01	2013-11-19 20:49:35.169368+01	t	\N	base	72-9	\N	\N	72	9	1	\N	1
263	2013-11-19 20:49:35.177395+01	2013-11-19 20:49:35.177399+01	t	\N	base	8-1	\N	\N	8	1	1	\N	1
264	2013-11-19 20:49:35.177737+01	2013-11-19 20:49:35.177741+01	t	\N	base	8-2	\N	\N	8	2	1	\N	1
265	2013-11-19 20:49:35.178053+01	2013-11-19 20:49:35.178056+01	t	\N	base	8-10	\N	\N	8	10	1	\N	1
266	2013-11-19 20:49:35.178402+01	2013-11-19 20:49:35.178406+01	t	\N	base	8-24	\N	\N	8	24	1	\N	1
267	2013-11-19 20:49:35.185493+01	2013-11-19 20:49:35.185499+01	t	\N	base	82-24	\N	\N	82	24	1	\N	1
268	2013-11-19 20:49:35.191209+01	2013-11-19 20:49:35.191214+01	t	\N	base	94-2	\N	\N	94	2	1	\N	1
269	2013-11-19 20:49:35.206648+01	2013-11-19 20:49:35.206652+01	t	\N	base	24-19	\N	\N	24	19	1	\N	1
270	2013-11-19 20:49:35.207362+01	2013-11-19 20:49:35.207366+01	t	\N	base	24-20	\N	\N	24	20	1	\N	1
271	2013-11-19 20:49:35.208019+01	2013-11-19 20:49:35.208023+01	t	\N	base	24-24	\N	\N	24	24	1	\N	1
272	2013-11-19 20:49:35.208346+01	2013-11-19 20:49:35.20835+01	t	\N	base	24-33	\N	\N	24	33	1	\N	1
273	2013-11-19 20:49:35.220871+01	2013-11-19 20:49:35.220877+01	t	\N	base	34-9	\N	\N	34	9	1	\N	1
274	2013-11-19 20:49:35.221613+01	2013-11-19 20:49:35.221618+01	t	\N	base	34-20	\N	\N	34	20	1	\N	1
275	2013-11-19 20:49:35.222291+01	2013-11-19 20:49:35.222296+01	t	\N	base	34-24	\N	\N	34	24	1	\N	1
276	2013-11-19 20:49:35.222957+01	2013-11-19 20:49:35.222961+01	t	\N	base	34-41	\N	\N	34	41	1	\N	1
277	2013-11-19 20:49:35.232211+01	2013-11-19 20:49:35.232217+01	t	\N	base	44-13	\N	\N	44	13	1	\N	1
278	2013-11-19 20:49:35.23959+01	2013-11-19 20:49:35.239598+01	t	\N	base	114-24	\N	\N	114	24	1	\N	1
279	2013-11-19 20:49:35.251074+01	2013-11-19 20:49:35.251078+01	t	\N	base	127-38	\N	\N	127	38	1	\N	1
280	2013-11-19 20:49:35.26155+01	2013-11-19 20:49:35.261556+01	t	\N	base	144-14	\N	\N	144	14	1	\N	1
281	2013-11-19 20:49:35.262115+01	2013-11-19 20:49:35.262118+01	t	\N	base	144-15	\N	\N	144	15	1	\N	1
282	2013-11-19 20:49:35.262442+01	2013-11-19 20:49:35.262445+01	t	\N	base	144-20	\N	\N	144	20	1	\N	1
\.


--
-- Data for Name: valueset_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY valueset_data (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Data for Name: valueset_data_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY valueset_data_history (pk, created, updated, active, jsondata, key, value, ord, object_pk, version) FROM stdin;
\.


--
-- Name: valueset_data_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('valueset_data_history_pk_seq', 1, false);


--
-- Name: valueset_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('valueset_data_pk_seq', 1, false);


--
-- Data for Name: valueset_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY valueset_files (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Data for Name: valueset_files_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY valueset_files_history (pk, created, updated, active, jsondata, id, name, description, markup_description, ord, mime_type, object_pk, version) FROM stdin;
\.


--
-- Name: valueset_files_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('valueset_files_history_pk_seq', 1, false);


--
-- Name: valueset_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('valueset_files_pk_seq', 1, false);


--
-- Data for Name: valueset_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY valueset_history (pk, created, updated, active, jsondata, polymorphic_type, id, description, markup_description, language_pk, parameter_pk, contribution_pk, source, version) FROM stdin;
\.


--
-- Name: valueset_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('valueset_history_pk_seq', 1, false);


--
-- Name: valueset_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('valueset_pk_seq', 282, true);


--
-- Data for Name: valuesetreference; Type: TABLE DATA; Schema: public; Owner: -
--

COPY valuesetreference (pk, created, updated, active, jsondata, key, description, valueset_pk, source_pk, version) FROM stdin;
\.


--
-- Data for Name: valuesetreference_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY valuesetreference_history (pk, created, updated, active, jsondata, key, description, valueset_pk, source_pk, version) FROM stdin;
\.


--
-- Name: valuesetreference_history_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('valuesetreference_history_pk_seq', 1, false);


--
-- Name: valuesetreference_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('valuesetreference_pk_seq', 1, false);


--
-- Data for Name: waabvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY waabvalue (pk, pair_pk, "numeric") FROM stdin;
1	1	1
2	1	2
3	1	38
4	1	1
5	1	3
6	1	3
7	1	2
8	2	1
9	2	1
10	2	3
11	2	1
12	2	1
13	2	2
14	2	1
15	2	1
16	2	2
17	2	1
18	2	4
19	2	1
20	3	1
21	3	13
22	3	1
23	4	4
24	4	1
25	4	1
26	4	1
27	4	3
28	4	1
29	4	1
30	4	1
31	4	1
32	5	1
33	5	1
34	5	1
35	5	6
36	5	1
37	5	1
38	6	1
39	6	21
40	7	1
41	7	1
42	7	2
43	7	2
44	7	1
45	7	1
46	7	1
47	7	2
48	8	2
49	8	16
50	9	1
51	9	1
52	9	6
53	10	1
54	10	3
55	10	4
56	11	3
57	11	1
58	11	1
59	11	1
60	11	2
61	12	8
62	13	4
63	13	6
64	13	1
65	13	2
66	13	1
67	14	3
68	14	1
69	14	1
70	14	2
71	15	2
72	15	2
73	15	1
74	15	1
75	16	1
76	16	3
77	16	2
78	17	13
79	18	1
80	18	1
81	18	2
82	18	1
83	19	2
84	19	1
85	19	2
86	20	1
87	20	1
88	20	1
89	20	1
90	20	1
91	21	2
92	21	3
93	22	1
94	22	2
95	22	1
96	22	1
97	22	1
98	23	1
99	23	1
100	24	1
101	24	4
102	24	1
103	24	1
104	24	1
105	24	1
106	24	1
107	24	1
108	24	1
109	25	3
110	25	1
111	26	1
112	26	1
113	26	1
114	26	1
115	27	1
116	27	2
117	28	1
118	28	1
119	28	1
120	28	2
121	29	1
122	29	1
123	30	2
124	31	8
125	32	1
126	33	1
127	33	1
128	34	1
129	34	1
130	35	1
131	36	1
132	37	1
133	38	1
134	39	1
135	39	3
136	40	2
137	41	2
138	42	1
139	42	1
140	43	1
141	43	1
142	43	1
143	43	1
144	44	1
145	45	1
146	46	1
147	46	2
148	46	1
149	46	1
150	47	1
151	48	1
152	49	2
153	49	3
154	49	3
155	49	2
156	49	1
157	49	1
158	49	1
159	50	2
160	50	12
161	50	1
162	50	4
163	50	2
164	50	2
165	50	10
166	50	2
167	51	4
168	51	1
169	51	1
170	51	14
171	51	8
172	51	3
173	52	1
174	52	5
175	53	1
176	54	1
177	54	1
178	54	1
179	55	1
180	55	1
181	55	1
182	55	1
183	55	4
184	56	1
185	57	3
186	58	1
187	58	2
188	59	1
189	60	3
190	61	1
191	62	4
192	62	1
193	62	2
194	62	1
195	63	1
196	63	1
197	63	3
198	63	1
199	63	1
200	64	3
201	64	1
202	64	4
203	64	1
204	64	1
205	65	4
206	65	2
207	65	2
208	65	4
209	65	1
210	66	1
211	66	1
212	66	5
213	66	1
214	66	1
215	66	1
216	66	3
217	66	1
218	66	1
219	67	2
220	67	1
221	68	1
222	69	2
223	69	1
224	69	2
225	69	2
226	69	4
227	69	17
228	69	2
229	69	4
230	69	1
231	70	1
232	71	1
233	71	1
234	71	1
235	71	2
236	71	2
237	72	8
238	72	1
239	73	1
240	74	1
241	74	1
242	74	1
243	74	2
244	74	1
245	75	6
246	76	1
247	76	2
248	77	1
249	77	1
250	77	2
251	77	1
252	78	3
253	79	1
254	80	1
255	81	15
256	82	1
257	83	1
258	84	1
259	85	1
260	86	1
261	87	1
262	87	1
263	87	1
264	87	1
265	88	1
266	89	1
267	90	1
268	91	2
269	91	1
270	92	1
271	92	1
272	92	1
273	92	4
274	93	1
275	94	1
276	95	3
277	96	1
278	96	4
279	96	1
280	96	1
281	97	3
282	97	1
283	97	1
284	97	1
285	98	4
286	99	4
287	100	2
288	101	1
289	101	1
290	101	1
\.


--
-- Data for Name: waabvalue_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY waabvalue_history (pk, pair_pk, "numeric", version) FROM stdin;
\.


--
-- Name: affixfunction_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY affixfunction_history
    ADD CONSTRAINT affixfunction_history_pkey PRIMARY KEY (pk, version);


--
-- Name: affixfunction_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY affixfunction
    ADD CONSTRAINT affixfunction_pkey PRIMARY KEY (pk);


--
-- Name: config_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY config
    ADD CONSTRAINT config_pkey PRIMARY KEY (pk);


--
-- Name: contribution_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contribution_data_history
    ADD CONSTRAINT contribution_data_history_pkey PRIMARY KEY (pk, version);


--
-- Name: contribution_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contribution_data
    ADD CONSTRAINT contribution_data_pkey PRIMARY KEY (pk);


--
-- Name: contribution_files_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contribution_files_history
    ADD CONSTRAINT contribution_files_history_pkey PRIMARY KEY (pk, version);


--
-- Name: contribution_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contribution_files
    ADD CONSTRAINT contribution_files_id_key UNIQUE (id);


--
-- Name: contribution_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contribution_files
    ADD CONSTRAINT contribution_files_pkey PRIMARY KEY (pk);


--
-- Name: contribution_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contribution_history
    ADD CONSTRAINT contribution_history_pkey PRIMARY KEY (pk, version);


--
-- Name: contribution_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contribution
    ADD CONSTRAINT contribution_id_key UNIQUE (id);


--
-- Name: contribution_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contribution
    ADD CONSTRAINT contribution_name_key UNIQUE (name);


--
-- Name: contribution_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contribution
    ADD CONSTRAINT contribution_pkey PRIMARY KEY (pk);


--
-- Name: contributioncontributor_contribution_pk_contributor_pk_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contributioncontributor
    ADD CONSTRAINT contributioncontributor_contribution_pk_contributor_pk_key UNIQUE (contribution_pk, contributor_pk);


--
-- Name: contributioncontributor_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contributioncontributor_history
    ADD CONSTRAINT contributioncontributor_history_pkey PRIMARY KEY (pk, version);


--
-- Name: contributioncontributor_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contributioncontributor
    ADD CONSTRAINT contributioncontributor_pkey PRIMARY KEY (pk);


--
-- Name: contributionreference_contribution_pk_source_pk_description_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contributionreference
    ADD CONSTRAINT contributionreference_contribution_pk_source_pk_description_key UNIQUE (contribution_pk, source_pk, description);


--
-- Name: contributionreference_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contributionreference_history
    ADD CONSTRAINT contributionreference_history_pkey PRIMARY KEY (pk, version);


--
-- Name: contributionreference_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contributionreference
    ADD CONSTRAINT contributionreference_pkey PRIMARY KEY (pk);


--
-- Name: contributor_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contributor_data_history
    ADD CONSTRAINT contributor_data_history_pkey PRIMARY KEY (pk, version);


--
-- Name: contributor_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contributor_data
    ADD CONSTRAINT contributor_data_pkey PRIMARY KEY (pk);


--
-- Name: contributor_files_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contributor_files_history
    ADD CONSTRAINT contributor_files_history_pkey PRIMARY KEY (pk, version);


--
-- Name: contributor_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contributor_files
    ADD CONSTRAINT contributor_files_id_key UNIQUE (id);


--
-- Name: contributor_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contributor_files
    ADD CONSTRAINT contributor_files_pkey PRIMARY KEY (pk);


--
-- Name: contributor_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contributor_history
    ADD CONSTRAINT contributor_history_pkey PRIMARY KEY (pk, version);


--
-- Name: contributor_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contributor
    ADD CONSTRAINT contributor_id_key UNIQUE (id);


--
-- Name: contributor_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contributor
    ADD CONSTRAINT contributor_name_key UNIQUE (name);


--
-- Name: contributor_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contributor
    ADD CONSTRAINT contributor_pkey PRIMARY KEY (pk);


--
-- Name: dataset_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataset_data_history
    ADD CONSTRAINT dataset_data_history_pkey PRIMARY KEY (pk, version);


--
-- Name: dataset_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataset_data
    ADD CONSTRAINT dataset_data_pkey PRIMARY KEY (pk);


--
-- Name: dataset_files_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataset_files_history
    ADD CONSTRAINT dataset_files_history_pkey PRIMARY KEY (pk, version);


--
-- Name: dataset_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataset_files
    ADD CONSTRAINT dataset_files_id_key UNIQUE (id);


--
-- Name: dataset_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataset_files
    ADD CONSTRAINT dataset_files_pkey PRIMARY KEY (pk);


--
-- Name: dataset_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataset_history
    ADD CONSTRAINT dataset_history_pkey PRIMARY KEY (pk, version);


--
-- Name: dataset_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT dataset_id_key UNIQUE (id);


--
-- Name: dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT dataset_pkey PRIMARY KEY (pk);


--
-- Name: domainelement_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY domainelement_data_history
    ADD CONSTRAINT domainelement_data_history_pkey PRIMARY KEY (pk, version);


--
-- Name: domainelement_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY domainelement_data
    ADD CONSTRAINT domainelement_data_pkey PRIMARY KEY (pk);


--
-- Name: domainelement_files_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY domainelement_files_history
    ADD CONSTRAINT domainelement_files_history_pkey PRIMARY KEY (pk, version);


--
-- Name: domainelement_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY domainelement_files
    ADD CONSTRAINT domainelement_files_id_key UNIQUE (id);


--
-- Name: domainelement_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY domainelement_files
    ADD CONSTRAINT domainelement_files_pkey PRIMARY KEY (pk);


--
-- Name: domainelement_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY domainelement_history
    ADD CONSTRAINT domainelement_history_pkey PRIMARY KEY (pk, version);


--
-- Name: domainelement_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY domainelement
    ADD CONSTRAINT domainelement_id_key UNIQUE (id);


--
-- Name: domainelement_parameter_pk_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY domainelement
    ADD CONSTRAINT domainelement_parameter_pk_name_key UNIQUE (parameter_pk, name);


--
-- Name: domainelement_parameter_pk_number_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY domainelement
    ADD CONSTRAINT domainelement_parameter_pk_number_key UNIQUE (parameter_pk, number);


--
-- Name: domainelement_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY domainelement
    ADD CONSTRAINT domainelement_pkey PRIMARY KEY (pk);


--
-- Name: editor_dataset_pk_contributor_pk_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY editor
    ADD CONSTRAINT editor_dataset_pk_contributor_pk_key UNIQUE (dataset_pk, contributor_pk);


--
-- Name: editor_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY editor_history
    ADD CONSTRAINT editor_history_pkey PRIMARY KEY (pk, version);


--
-- Name: editor_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY editor
    ADD CONSTRAINT editor_pkey PRIMARY KEY (pk);


--
-- Name: glossabbreviation_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY glossabbreviation_history
    ADD CONSTRAINT glossabbreviation_history_pkey PRIMARY KEY (pk, version);


--
-- Name: glossabbreviation_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY glossabbreviation
    ADD CONSTRAINT glossabbreviation_id_key UNIQUE (id);


--
-- Name: glossabbreviation_id_language_pk_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY glossabbreviation
    ADD CONSTRAINT glossabbreviation_id_language_pk_key UNIQUE (id, language_pk);


--
-- Name: glossabbreviation_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY glossabbreviation
    ADD CONSTRAINT glossabbreviation_pkey PRIMARY KEY (pk);


--
-- Name: identifier_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY identifier_history
    ADD CONSTRAINT identifier_history_pkey PRIMARY KEY (pk, version);


--
-- Name: identifier_name_type_description_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY identifier
    ADD CONSTRAINT identifier_name_type_description_key UNIQUE (name, type, description);


--
-- Name: identifier_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY identifier
    ADD CONSTRAINT identifier_pkey PRIMARY KEY (pk);


--
-- Name: language_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY language_data_history
    ADD CONSTRAINT language_data_history_pkey PRIMARY KEY (pk, version);


--
-- Name: language_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY language_data
    ADD CONSTRAINT language_data_pkey PRIMARY KEY (pk);


--
-- Name: language_files_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY language_files_history
    ADD CONSTRAINT language_files_history_pkey PRIMARY KEY (pk, version);


--
-- Name: language_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY language_files
    ADD CONSTRAINT language_files_id_key UNIQUE (id);


--
-- Name: language_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY language_files
    ADD CONSTRAINT language_files_pkey PRIMARY KEY (pk);


--
-- Name: language_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY language_history
    ADD CONSTRAINT language_history_pkey PRIMARY KEY (pk, version);


--
-- Name: language_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY language
    ADD CONSTRAINT language_id_key UNIQUE (id);


--
-- Name: language_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY language
    ADD CONSTRAINT language_pkey PRIMARY KEY (pk);


--
-- Name: languageidentifier_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY languageidentifier_history
    ADD CONSTRAINT languageidentifier_history_pkey PRIMARY KEY (pk, version);


--
-- Name: languageidentifier_language_pk_identifier_pk_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY languageidentifier
    ADD CONSTRAINT languageidentifier_language_pk_identifier_pk_key UNIQUE (language_pk, identifier_pk);


--
-- Name: languageidentifier_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY languageidentifier
    ADD CONSTRAINT languageidentifier_pkey PRIMARY KEY (pk);


--
-- Name: languagesource_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY languagesource_history
    ADD CONSTRAINT languagesource_history_pkey PRIMARY KEY (pk, version);


--
-- Name: languagesource_language_pk_source_pk_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY languagesource
    ADD CONSTRAINT languagesource_language_pk_source_pk_key UNIQUE (language_pk, source_pk);


--
-- Name: languagesource_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY languagesource
    ADD CONSTRAINT languagesource_pkey PRIMARY KEY (pk);


--
-- Name: pair_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pair
    ADD CONSTRAINT pair_id_key UNIQUE (id);


--
-- Name: pair_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pair
    ADD CONSTRAINT pair_pkey PRIMARY KEY (pk);


--
-- Name: pairsource_pair_pk_source_pk_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pairsource
    ADD CONSTRAINT pairsource_pair_pk_source_pk_key UNIQUE (pair_pk, source_pk);


--
-- Name: pairsource_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pairsource
    ADD CONSTRAINT pairsource_pkey PRIMARY KEY (pk);


--
-- Name: parameter_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parameter_data_history
    ADD CONSTRAINT parameter_data_history_pkey PRIMARY KEY (pk, version);


--
-- Name: parameter_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parameter_data
    ADD CONSTRAINT parameter_data_pkey PRIMARY KEY (pk);


--
-- Name: parameter_files_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parameter_files_history
    ADD CONSTRAINT parameter_files_history_pkey PRIMARY KEY (pk, version);


--
-- Name: parameter_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parameter_files
    ADD CONSTRAINT parameter_files_id_key UNIQUE (id);


--
-- Name: parameter_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parameter_files
    ADD CONSTRAINT parameter_files_pkey PRIMARY KEY (pk);


--
-- Name: parameter_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parameter_history
    ADD CONSTRAINT parameter_history_pkey PRIMARY KEY (pk, version);


--
-- Name: parameter_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parameter
    ADD CONSTRAINT parameter_id_key UNIQUE (id);


--
-- Name: parameter_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parameter
    ADD CONSTRAINT parameter_name_key UNIQUE (name);


--
-- Name: parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parameter
    ADD CONSTRAINT parameter_pkey PRIMARY KEY (pk);


--
-- Name: sentence_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sentence_data_history
    ADD CONSTRAINT sentence_data_history_pkey PRIMARY KEY (pk, version);


--
-- Name: sentence_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sentence_data
    ADD CONSTRAINT sentence_data_pkey PRIMARY KEY (pk);


--
-- Name: sentence_files_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sentence_files_history
    ADD CONSTRAINT sentence_files_history_pkey PRIMARY KEY (pk, version);


--
-- Name: sentence_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sentence_files
    ADD CONSTRAINT sentence_files_id_key UNIQUE (id);


--
-- Name: sentence_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sentence_files
    ADD CONSTRAINT sentence_files_pkey PRIMARY KEY (pk);


--
-- Name: sentence_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sentence_history
    ADD CONSTRAINT sentence_history_pkey PRIMARY KEY (pk, version);


--
-- Name: sentence_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sentence
    ADD CONSTRAINT sentence_id_key UNIQUE (id);


--
-- Name: sentence_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sentence
    ADD CONSTRAINT sentence_pkey PRIMARY KEY (pk);


--
-- Name: sentencereference_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sentencereference_history
    ADD CONSTRAINT sentencereference_history_pkey PRIMARY KEY (pk, version);


--
-- Name: sentencereference_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sentencereference
    ADD CONSTRAINT sentencereference_pkey PRIMARY KEY (pk);


--
-- Name: sentencereference_sentence_pk_source_pk_description_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sentencereference
    ADD CONSTRAINT sentencereference_sentence_pk_source_pk_description_key UNIQUE (sentence_pk, source_pk, description);


--
-- Name: source_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY source_data_history
    ADD CONSTRAINT source_data_history_pkey PRIMARY KEY (pk, version);


--
-- Name: source_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY source_data
    ADD CONSTRAINT source_data_pkey PRIMARY KEY (pk);


--
-- Name: source_files_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY source_files_history
    ADD CONSTRAINT source_files_history_pkey PRIMARY KEY (pk, version);


--
-- Name: source_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY source_files
    ADD CONSTRAINT source_files_id_key UNIQUE (id);


--
-- Name: source_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY source_files
    ADD CONSTRAINT source_files_pkey PRIMARY KEY (pk);


--
-- Name: source_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY source_history
    ADD CONSTRAINT source_history_pkey PRIMARY KEY (pk, version);


--
-- Name: source_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY source
    ADD CONSTRAINT source_id_key UNIQUE (id);


--
-- Name: source_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY source
    ADD CONSTRAINT source_pkey PRIMARY KEY (pk);


--
-- Name: unit_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unit_data_history
    ADD CONSTRAINT unit_data_history_pkey PRIMARY KEY (pk, version);


--
-- Name: unit_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unit_data
    ADD CONSTRAINT unit_data_pkey PRIMARY KEY (pk);


--
-- Name: unit_files_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unit_files_history
    ADD CONSTRAINT unit_files_history_pkey PRIMARY KEY (pk, version);


--
-- Name: unit_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unit_files
    ADD CONSTRAINT unit_files_id_key UNIQUE (id);


--
-- Name: unit_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unit_files
    ADD CONSTRAINT unit_files_pkey PRIMARY KEY (pk);


--
-- Name: unit_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unit_history
    ADD CONSTRAINT unit_history_pkey PRIMARY KEY (pk, version);


--
-- Name: unit_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT unit_id_key UNIQUE (id);


--
-- Name: unit_language_pk_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT unit_language_pk_id_key UNIQUE (language_pk, id);


--
-- Name: unit_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (pk);


--
-- Name: unitdomainelement_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitdomainelement_data_history
    ADD CONSTRAINT unitdomainelement_data_history_pkey PRIMARY KEY (pk, version);


--
-- Name: unitdomainelement_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitdomainelement_data
    ADD CONSTRAINT unitdomainelement_data_pkey PRIMARY KEY (pk);


--
-- Name: unitdomainelement_files_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitdomainelement_files_history
    ADD CONSTRAINT unitdomainelement_files_history_pkey PRIMARY KEY (pk, version);


--
-- Name: unitdomainelement_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitdomainelement_files
    ADD CONSTRAINT unitdomainelement_files_id_key UNIQUE (id);


--
-- Name: unitdomainelement_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitdomainelement_files
    ADD CONSTRAINT unitdomainelement_files_pkey PRIMARY KEY (pk);


--
-- Name: unitdomainelement_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitdomainelement_history
    ADD CONSTRAINT unitdomainelement_history_pkey PRIMARY KEY (pk, version);


--
-- Name: unitdomainelement_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitdomainelement
    ADD CONSTRAINT unitdomainelement_id_key UNIQUE (id);


--
-- Name: unitdomainelement_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitdomainelement
    ADD CONSTRAINT unitdomainelement_pkey PRIMARY KEY (pk);


--
-- Name: unitdomainelement_unitparameter_pk_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitdomainelement
    ADD CONSTRAINT unitdomainelement_unitparameter_pk_name_key UNIQUE (unitparameter_pk, name);


--
-- Name: unitdomainelement_unitparameter_pk_ord_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitdomainelement
    ADD CONSTRAINT unitdomainelement_unitparameter_pk_ord_key UNIQUE (unitparameter_pk, ord);


--
-- Name: unitparameter_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitparameter_data_history
    ADD CONSTRAINT unitparameter_data_history_pkey PRIMARY KEY (pk, version);


--
-- Name: unitparameter_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitparameter_data
    ADD CONSTRAINT unitparameter_data_pkey PRIMARY KEY (pk);


--
-- Name: unitparameter_files_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitparameter_files_history
    ADD CONSTRAINT unitparameter_files_history_pkey PRIMARY KEY (pk, version);


--
-- Name: unitparameter_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitparameter_files
    ADD CONSTRAINT unitparameter_files_id_key UNIQUE (id);


--
-- Name: unitparameter_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitparameter_files
    ADD CONSTRAINT unitparameter_files_pkey PRIMARY KEY (pk);


--
-- Name: unitparameter_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitparameter_history
    ADD CONSTRAINT unitparameter_history_pkey PRIMARY KEY (pk, version);


--
-- Name: unitparameter_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitparameter
    ADD CONSTRAINT unitparameter_id_key UNIQUE (id);


--
-- Name: unitparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitparameter
    ADD CONSTRAINT unitparameter_pkey PRIMARY KEY (pk);


--
-- Name: unitparameterunit_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitparameterunit_history
    ADD CONSTRAINT unitparameterunit_history_pkey PRIMARY KEY (pk, version);


--
-- Name: unitparameterunit_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitparameterunit
    ADD CONSTRAINT unitparameterunit_id_key UNIQUE (id);


--
-- Name: unitparameterunit_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitparameterunit
    ADD CONSTRAINT unitparameterunit_pkey PRIMARY KEY (pk);


--
-- Name: unitvalue_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitvalue_data_history
    ADD CONSTRAINT unitvalue_data_history_pkey PRIMARY KEY (pk, version);


--
-- Name: unitvalue_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitvalue_data
    ADD CONSTRAINT unitvalue_data_pkey PRIMARY KEY (pk);


--
-- Name: unitvalue_files_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitvalue_files_history
    ADD CONSTRAINT unitvalue_files_history_pkey PRIMARY KEY (pk, version);


--
-- Name: unitvalue_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitvalue_files
    ADD CONSTRAINT unitvalue_files_id_key UNIQUE (id);


--
-- Name: unitvalue_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitvalue_files
    ADD CONSTRAINT unitvalue_files_pkey PRIMARY KEY (pk);


--
-- Name: unitvalue_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitvalue_history
    ADD CONSTRAINT unitvalue_history_pkey PRIMARY KEY (pk, version);


--
-- Name: unitvalue_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitvalue
    ADD CONSTRAINT unitvalue_id_key UNIQUE (id);


--
-- Name: unitvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitvalue
    ADD CONSTRAINT unitvalue_pkey PRIMARY KEY (pk);


--
-- Name: unitvalue_unit_pk_unitparameter_pk_contribution_pk_name_unitdom; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unitvalue
    ADD CONSTRAINT unitvalue_unit_pk_unitparameter_pk_contribution_pk_name_unitdom UNIQUE (unit_pk, unitparameter_pk, contribution_pk, name, unitdomainelement_pk);


--
-- Name: value_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY value_data_history
    ADD CONSTRAINT value_data_history_pkey PRIMARY KEY (pk, version);


--
-- Name: value_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY value_data
    ADD CONSTRAINT value_data_pkey PRIMARY KEY (pk);


--
-- Name: value_files_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY value_files_history
    ADD CONSTRAINT value_files_history_pkey PRIMARY KEY (pk, version);


--
-- Name: value_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY value_files
    ADD CONSTRAINT value_files_id_key UNIQUE (id);


--
-- Name: value_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY value_files
    ADD CONSTRAINT value_files_pkey PRIMARY KEY (pk);


--
-- Name: value_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY value_history
    ADD CONSTRAINT value_history_pkey PRIMARY KEY (pk, version);


--
-- Name: value_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY value
    ADD CONSTRAINT value_id_key UNIQUE (id);


--
-- Name: value_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY value
    ADD CONSTRAINT value_pkey PRIMARY KEY (pk);


--
-- Name: value_valueset_pk_name_domainelement_pk_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY value
    ADD CONSTRAINT value_valueset_pk_name_domainelement_pk_key UNIQUE (valueset_pk, name, domainelement_pk);


--
-- Name: valuesentence_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY valuesentence_history
    ADD CONSTRAINT valuesentence_history_pkey PRIMARY KEY (pk, version);


--
-- Name: valuesentence_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY valuesentence
    ADD CONSTRAINT valuesentence_pkey PRIMARY KEY (pk);


--
-- Name: valuesentence_value_pk_sentence_pk_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY valuesentence
    ADD CONSTRAINT valuesentence_value_pk_sentence_pk_key UNIQUE (value_pk, sentence_pk);


--
-- Name: valueset_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY valueset_data_history
    ADD CONSTRAINT valueset_data_history_pkey PRIMARY KEY (pk, version);


--
-- Name: valueset_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY valueset_data
    ADD CONSTRAINT valueset_data_pkey PRIMARY KEY (pk);


--
-- Name: valueset_files_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY valueset_files_history
    ADD CONSTRAINT valueset_files_history_pkey PRIMARY KEY (pk, version);


--
-- Name: valueset_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY valueset_files
    ADD CONSTRAINT valueset_files_id_key UNIQUE (id);


--
-- Name: valueset_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY valueset_files
    ADD CONSTRAINT valueset_files_pkey PRIMARY KEY (pk);


--
-- Name: valueset_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY valueset_history
    ADD CONSTRAINT valueset_history_pkey PRIMARY KEY (pk, version);


--
-- Name: valueset_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY valueset
    ADD CONSTRAINT valueset_id_key UNIQUE (id);


--
-- Name: valueset_language_pk_parameter_pk_contribution_pk_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY valueset
    ADD CONSTRAINT valueset_language_pk_parameter_pk_contribution_pk_key UNIQUE (language_pk, parameter_pk, contribution_pk);


--
-- Name: valueset_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY valueset
    ADD CONSTRAINT valueset_pkey PRIMARY KEY (pk);


--
-- Name: valuesetreference_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY valuesetreference_history
    ADD CONSTRAINT valuesetreference_history_pkey PRIMARY KEY (pk, version);


--
-- Name: valuesetreference_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY valuesetreference
    ADD CONSTRAINT valuesetreference_pkey PRIMARY KEY (pk);


--
-- Name: valuesetreference_valueset_pk_source_pk_description_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY valuesetreference
    ADD CONSTRAINT valuesetreference_valueset_pk_source_pk_description_key UNIQUE (valueset_pk, source_pk, description);


--
-- Name: waabvalue_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY waabvalue_history
    ADD CONSTRAINT waabvalue_history_pkey PRIMARY KEY (pk, version);


--
-- Name: waabvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY waabvalue
    ADD CONSTRAINT waabvalue_pkey PRIMARY KEY (pk);


--
-- Name: affixfunction_history_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY affixfunction_history
    ADD CONSTRAINT affixfunction_history_pk_fkey FOREIGN KEY (pk, version) REFERENCES parameter_history(pk, version);


--
-- Name: affixfunction_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY affixfunction
    ADD CONSTRAINT affixfunction_pk_fkey FOREIGN KEY (pk) REFERENCES parameter(pk);


--
-- Name: contribution_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contribution_data
    ADD CONSTRAINT contribution_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES contribution(pk);


--
-- Name: contribution_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contribution_files
    ADD CONSTRAINT contribution_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES contribution(pk);


--
-- Name: contributioncontributor_contribution_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributioncontributor
    ADD CONSTRAINT contributioncontributor_contribution_pk_fkey FOREIGN KEY (contribution_pk) REFERENCES contribution(pk);


--
-- Name: contributioncontributor_contributor_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributioncontributor
    ADD CONSTRAINT contributioncontributor_contributor_pk_fkey FOREIGN KEY (contributor_pk) REFERENCES contributor(pk);


--
-- Name: contributionreference_contribution_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributionreference
    ADD CONSTRAINT contributionreference_contribution_pk_fkey FOREIGN KEY (contribution_pk) REFERENCES contribution(pk);


--
-- Name: contributionreference_source_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributionreference
    ADD CONSTRAINT contributionreference_source_pk_fkey FOREIGN KEY (source_pk) REFERENCES source(pk);


--
-- Name: contributor_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributor_data
    ADD CONSTRAINT contributor_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES contributor(pk);


--
-- Name: contributor_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contributor_files
    ADD CONSTRAINT contributor_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES contributor(pk);


--
-- Name: dataset_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataset_data
    ADD CONSTRAINT dataset_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES dataset(pk);


--
-- Name: dataset_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataset_files
    ADD CONSTRAINT dataset_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES dataset(pk);


--
-- Name: domainelement_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY domainelement_data
    ADD CONSTRAINT domainelement_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES domainelement(pk);


--
-- Name: domainelement_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY domainelement_files
    ADD CONSTRAINT domainelement_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES domainelement(pk);


--
-- Name: domainelement_parameter_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY domainelement
    ADD CONSTRAINT domainelement_parameter_pk_fkey FOREIGN KEY (parameter_pk) REFERENCES parameter(pk);


--
-- Name: editor_contributor_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY editor
    ADD CONSTRAINT editor_contributor_pk_fkey FOREIGN KEY (contributor_pk) REFERENCES contributor(pk);


--
-- Name: editor_dataset_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY editor
    ADD CONSTRAINT editor_dataset_pk_fkey FOREIGN KEY (dataset_pk) REFERENCES dataset(pk);


--
-- Name: glossabbreviation_language_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY glossabbreviation
    ADD CONSTRAINT glossabbreviation_language_pk_fkey FOREIGN KEY (language_pk) REFERENCES language(pk);


--
-- Name: language_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY language_data
    ADD CONSTRAINT language_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES language(pk);


--
-- Name: language_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY language_files
    ADD CONSTRAINT language_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES language(pk);


--
-- Name: languageidentifier_identifier_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY languageidentifier
    ADD CONSTRAINT languageidentifier_identifier_pk_fkey FOREIGN KEY (identifier_pk) REFERENCES identifier(pk);


--
-- Name: languageidentifier_language_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY languageidentifier
    ADD CONSTRAINT languageidentifier_language_pk_fkey FOREIGN KEY (language_pk) REFERENCES language(pk);


--
-- Name: languagesource_language_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY languagesource
    ADD CONSTRAINT languagesource_language_pk_fkey FOREIGN KEY (language_pk) REFERENCES language(pk);


--
-- Name: languagesource_source_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY languagesource
    ADD CONSTRAINT languagesource_source_pk_fkey FOREIGN KEY (source_pk) REFERENCES source(pk);


--
-- Name: pair_donor_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pair
    ADD CONSTRAINT pair_donor_pk_fkey FOREIGN KEY (donor_pk) REFERENCES language(pk);


--
-- Name: pair_recipient_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pair
    ADD CONSTRAINT pair_recipient_pk_fkey FOREIGN KEY (recipient_pk) REFERENCES language(pk);


--
-- Name: pairsource_pair_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pairsource
    ADD CONSTRAINT pairsource_pair_pk_fkey FOREIGN KEY (pair_pk) REFERENCES pair(pk);


--
-- Name: pairsource_source_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pairsource
    ADD CONSTRAINT pairsource_source_pk_fkey FOREIGN KEY (source_pk) REFERENCES source(pk);


--
-- Name: parameter_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY parameter_data
    ADD CONSTRAINT parameter_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES parameter(pk);


--
-- Name: parameter_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY parameter_files
    ADD CONSTRAINT parameter_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES parameter(pk);


--
-- Name: sentence_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sentence_data
    ADD CONSTRAINT sentence_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES sentence(pk);


--
-- Name: sentence_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sentence_files
    ADD CONSTRAINT sentence_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES sentence(pk);


--
-- Name: sentence_language_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sentence
    ADD CONSTRAINT sentence_language_pk_fkey FOREIGN KEY (language_pk) REFERENCES language(pk);


--
-- Name: sentencereference_sentence_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sentencereference
    ADD CONSTRAINT sentencereference_sentence_pk_fkey FOREIGN KEY (sentence_pk) REFERENCES sentence(pk);


--
-- Name: sentencereference_source_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sentencereference
    ADD CONSTRAINT sentencereference_source_pk_fkey FOREIGN KEY (source_pk) REFERENCES source(pk);


--
-- Name: source_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY source_data
    ADD CONSTRAINT source_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES source(pk);


--
-- Name: source_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY source_files
    ADD CONSTRAINT source_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES source(pk);


--
-- Name: unit_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unit_data
    ADD CONSTRAINT unit_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES unit(pk);


--
-- Name: unit_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unit_files
    ADD CONSTRAINT unit_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES unit(pk);


--
-- Name: unit_language_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT unit_language_pk_fkey FOREIGN KEY (language_pk) REFERENCES language(pk);


--
-- Name: unitdomainelement_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitdomainelement_data
    ADD CONSTRAINT unitdomainelement_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES unitdomainelement(pk);


--
-- Name: unitdomainelement_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitdomainelement_files
    ADD CONSTRAINT unitdomainelement_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES unitdomainelement(pk);


--
-- Name: unitdomainelement_unitparameter_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitdomainelement
    ADD CONSTRAINT unitdomainelement_unitparameter_pk_fkey FOREIGN KEY (unitparameter_pk) REFERENCES unitparameter(pk);


--
-- Name: unitparameter_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitparameter_data
    ADD CONSTRAINT unitparameter_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES unitparameter(pk);


--
-- Name: unitparameter_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitparameter_files
    ADD CONSTRAINT unitparameter_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES unitparameter(pk);


--
-- Name: unitparameterunit_unit_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitparameterunit
    ADD CONSTRAINT unitparameterunit_unit_pk_fkey FOREIGN KEY (unit_pk) REFERENCES unit(pk);


--
-- Name: unitparameterunit_unitparameter_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitparameterunit
    ADD CONSTRAINT unitparameterunit_unitparameter_pk_fkey FOREIGN KEY (unitparameter_pk) REFERENCES unitparameter(pk);


--
-- Name: unitvalue_contribution_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitvalue
    ADD CONSTRAINT unitvalue_contribution_pk_fkey FOREIGN KEY (contribution_pk) REFERENCES contribution(pk);


--
-- Name: unitvalue_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitvalue_data
    ADD CONSTRAINT unitvalue_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES unitvalue(pk);


--
-- Name: unitvalue_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitvalue_files
    ADD CONSTRAINT unitvalue_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES unitvalue(pk);


--
-- Name: unitvalue_unit_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitvalue
    ADD CONSTRAINT unitvalue_unit_pk_fkey FOREIGN KEY (unit_pk) REFERENCES unit(pk);


--
-- Name: unitvalue_unitdomainelement_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitvalue
    ADD CONSTRAINT unitvalue_unitdomainelement_pk_fkey FOREIGN KEY (unitdomainelement_pk) REFERENCES unitdomainelement(pk);


--
-- Name: unitvalue_unitparameter_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unitvalue
    ADD CONSTRAINT unitvalue_unitparameter_pk_fkey FOREIGN KEY (unitparameter_pk) REFERENCES unitparameter(pk);


--
-- Name: value_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY value_data
    ADD CONSTRAINT value_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES value(pk);


--
-- Name: value_domainelement_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY value
    ADD CONSTRAINT value_domainelement_pk_fkey FOREIGN KEY (domainelement_pk) REFERENCES domainelement(pk);


--
-- Name: value_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY value_files
    ADD CONSTRAINT value_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES value(pk);


--
-- Name: value_valueset_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY value
    ADD CONSTRAINT value_valueset_pk_fkey FOREIGN KEY (valueset_pk) REFERENCES valueset(pk);


--
-- Name: valuesentence_sentence_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY valuesentence
    ADD CONSTRAINT valuesentence_sentence_pk_fkey FOREIGN KEY (sentence_pk) REFERENCES sentence(pk);


--
-- Name: valuesentence_value_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY valuesentence
    ADD CONSTRAINT valuesentence_value_pk_fkey FOREIGN KEY (value_pk) REFERENCES value(pk);


--
-- Name: valueset_contribution_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY valueset
    ADD CONSTRAINT valueset_contribution_pk_fkey FOREIGN KEY (contribution_pk) REFERENCES contribution(pk);


--
-- Name: valueset_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY valueset_data
    ADD CONSTRAINT valueset_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES valueset(pk);


--
-- Name: valueset_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY valueset_files
    ADD CONSTRAINT valueset_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES valueset(pk);


--
-- Name: valueset_language_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY valueset
    ADD CONSTRAINT valueset_language_pk_fkey FOREIGN KEY (language_pk) REFERENCES language(pk);


--
-- Name: valueset_parameter_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY valueset
    ADD CONSTRAINT valueset_parameter_pk_fkey FOREIGN KEY (parameter_pk) REFERENCES parameter(pk);


--
-- Name: valuesetreference_source_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY valuesetreference
    ADD CONSTRAINT valuesetreference_source_pk_fkey FOREIGN KEY (source_pk) REFERENCES source(pk);


--
-- Name: valuesetreference_valueset_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY valuesetreference
    ADD CONSTRAINT valuesetreference_valueset_pk_fkey FOREIGN KEY (valueset_pk) REFERENCES valueset(pk);


--
-- Name: waabvalue_history_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY waabvalue_history
    ADD CONSTRAINT waabvalue_history_pk_fkey FOREIGN KEY (pk, version) REFERENCES value_history(pk, version);


--
-- Name: waabvalue_pair_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY waabvalue
    ADD CONSTRAINT waabvalue_pair_pk_fkey FOREIGN KEY (pair_pk) REFERENCES pair(pk);


--
-- Name: waabvalue_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY waabvalue
    ADD CONSTRAINT waabvalue_pk_fkey FOREIGN KEY (pk) REFERENCES value(pk);


--
-- PostgreSQL database dump complete
--

