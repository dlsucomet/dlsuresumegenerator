--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO resumegeneratordba;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO resumegeneratordba;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO resumegeneratordba;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO resumegeneratordba;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO resumegeneratordba;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO resumegeneratordba;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO resumegeneratordba;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO resumegeneratordba;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO resumegeneratordba;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO resumegeneratordba;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO resumegeneratordba;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO resumegeneratordba;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO resumegeneratordba;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO resumegeneratordba;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO resumegeneratordba;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO resumegeneratordba;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO resumegeneratordba;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO resumegeneratordba;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_achievement; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE resumegeneratormain_achievement (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE resumegeneratormain_achievement OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_achievement_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE resumegeneratormain_achievement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resumegeneratormain_achievement_id_seq OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_achievement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE resumegeneratormain_achievement_id_seq OWNED BY resumegeneratormain_achievement.id;


--
-- Name: resumegeneratormain_address; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE resumegeneratormain_address (
    id integer NOT NULL,
    address_line_one text NOT NULL,
    address_line_two text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE resumegeneratormain_address OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_address_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE resumegeneratormain_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resumegeneratormain_address_id_seq OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE resumegeneratormain_address_id_seq OWNED BY resumegeneratormain_address.id;


--
-- Name: resumegeneratormain_cellphonenumber; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE resumegeneratormain_cellphonenumber (
    id integer NOT NULL,
    number character varying(20) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE resumegeneratormain_cellphonenumber OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_cellphonenumber_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE resumegeneratormain_cellphonenumber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resumegeneratormain_cellphonenumber_id_seq OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_cellphonenumber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE resumegeneratormain_cellphonenumber_id_seq OWNED BY resumegeneratormain_cellphonenumber.id;


--
-- Name: resumegeneratormain_education; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE resumegeneratormain_education (
    id integer NOT NULL,
    school character varying(45) NOT NULL,
    education_attained character varying(45) NOT NULL,
    year_start integer NOT NULL,
    year_finish integer NOT NULL,
    month_attained character varying(45) NOT NULL,
    year_attained character varying(45) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE resumegeneratormain_education OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_education_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE resumegeneratormain_education_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resumegeneratormain_education_id_seq OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_education_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE resumegeneratormain_education_id_seq OWNED BY resumegeneratormain_education.id;


--
-- Name: resumegeneratormain_educationaward; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE resumegeneratormain_educationaward (
    id integer NOT NULL,
    award_description character varying(45),
    award_date character varying(45),
    school_id integer
);


ALTER TABLE resumegeneratormain_educationaward OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_educationaward_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE resumegeneratormain_educationaward_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resumegeneratormain_educationaward_id_seq OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_educationaward_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE resumegeneratormain_educationaward_id_seq OWNED BY resumegeneratormain_educationaward.id;


--
-- Name: resumegeneratormain_extracurricular; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE resumegeneratormain_extracurricular (
    id integer NOT NULL,
    organization character varying(45) NOT NULL,
    "position" character varying(45) NOT NULL,
    work_done text NOT NULL,
    year_start character varying(4) NOT NULL,
    year_finish character varying(4) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE resumegeneratormain_extracurricular OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_extracurricular_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE resumegeneratormain_extracurricular_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resumegeneratormain_extracurricular_id_seq OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_extracurricular_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE resumegeneratormain_extracurricular_id_seq OWNED BY resumegeneratormain_extracurricular.id;


--
-- Name: resumegeneratormain_researchpaper; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE resumegeneratormain_researchpaper (
    id integer NOT NULL,
    month character varying(45) NOT NULL,
    year character varying(4) NOT NULL,
    title character varying(70) NOT NULL,
    summary text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE resumegeneratormain_researchpaper OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_researchpaper_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE resumegeneratormain_researchpaper_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resumegeneratormain_researchpaper_id_seq OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_researchpaper_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE resumegeneratormain_researchpaper_id_seq OWNED BY resumegeneratormain_researchpaper.id;


--
-- Name: resumegeneratormain_seminarattended; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE resumegeneratormain_seminarattended (
    id integer NOT NULL,
    month character varying(45) NOT NULL,
    year character varying(4) NOT NULL,
    title character varying(45) NOT NULL,
    seminar_head character varying(45) NOT NULL,
    venue character varying(45) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE resumegeneratormain_seminarattended OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_seminarattended_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE resumegeneratormain_seminarattended_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resumegeneratormain_seminarattended_id_seq OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_seminarattended_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE resumegeneratormain_seminarattended_id_seq OWNED BY resumegeneratormain_seminarattended.id;


--
-- Name: resumegeneratormain_seminarconducted; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE resumegeneratormain_seminarconducted (
    id integer NOT NULL,
    month character varying(45) NOT NULL,
    year character varying(4) NOT NULL,
    "position" character varying(45) NOT NULL,
    title character varying(45) NOT NULL,
    seminar_head character varying(45) NOT NULL,
    venue character varying(45) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE resumegeneratormain_seminarconducted OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_seminarconducted_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE resumegeneratormain_seminarconducted_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resumegeneratormain_seminarconducted_id_seq OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_seminarconducted_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE resumegeneratormain_seminarconducted_id_seq OWNED BY resumegeneratormain_seminarconducted.id;


--
-- Name: resumegeneratormain_telephonenumber; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE resumegeneratormain_telephonenumber (
    id integer NOT NULL,
    number character varying(20) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE resumegeneratormain_telephonenumber OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_telephonenumber_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE resumegeneratormain_telephonenumber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resumegeneratormain_telephonenumber_id_seq OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_telephonenumber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE resumegeneratormain_telephonenumber_id_seq OWNED BY resumegeneratormain_telephonenumber.id;


--
-- Name: resumegeneratormain_userprofile; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE resumegeneratormain_userprofile (
    id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    middle_initial character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    objective text,
    background text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE resumegeneratormain_userprofile OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE resumegeneratormain_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resumegeneratormain_userprofile_id_seq OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE resumegeneratormain_userprofile_id_seq OWNED BY resumegeneratormain_userprofile.id;


--
-- Name: resumegeneratormain_workexperience; Type: TABLE; Schema: public; Owner: resumegeneratordba
--

CREATE TABLE resumegeneratormain_workexperience (
    id integer NOT NULL,
    month_start character varying(45) NOT NULL,
    month_finish character varying(45) NOT NULL,
    year_finish character varying(4) NOT NULL,
    "position" character varying(45) NOT NULL,
    company character varying(45) NOT NULL,
    workdone text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE resumegeneratormain_workexperience OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_workexperience_id_seq; Type: SEQUENCE; Schema: public; Owner: resumegeneratordba
--

CREATE SEQUENCE resumegeneratormain_workexperience_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resumegeneratormain_workexperience_id_seq OWNER TO resumegeneratordba;

--
-- Name: resumegeneratormain_workexperience_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: resumegeneratordba
--

ALTER SEQUENCE resumegeneratormain_workexperience_id_seq OWNED BY resumegeneratormain_workexperience.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_achievement ALTER COLUMN id SET DEFAULT nextval('resumegeneratormain_achievement_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_address ALTER COLUMN id SET DEFAULT nextval('resumegeneratormain_address_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_cellphonenumber ALTER COLUMN id SET DEFAULT nextval('resumegeneratormain_cellphonenumber_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_education ALTER COLUMN id SET DEFAULT nextval('resumegeneratormain_education_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_educationaward ALTER COLUMN id SET DEFAULT nextval('resumegeneratormain_educationaward_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_extracurricular ALTER COLUMN id SET DEFAULT nextval('resumegeneratormain_extracurricular_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_researchpaper ALTER COLUMN id SET DEFAULT nextval('resumegeneratormain_researchpaper_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_seminarattended ALTER COLUMN id SET DEFAULT nextval('resumegeneratormain_seminarattended_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_seminarconducted ALTER COLUMN id SET DEFAULT nextval('resumegeneratormain_seminarconducted_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_telephonenumber ALTER COLUMN id SET DEFAULT nextval('resumegeneratormain_telephonenumber_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_userprofile ALTER COLUMN id SET DEFAULT nextval('resumegeneratormain_userprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_workexperience ALTER COLUMN id SET DEFAULT nextval('resumegeneratormain_workexperience_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add achievement	7	add_achievement
20	Can change achievement	7	change_achievement
21	Can delete achievement	7	delete_achievement
22	Can add address	8	add_address
23	Can change address	8	change_address
24	Can delete address	8	delete_address
25	Can add cellphone number	9	add_cellphonenumber
26	Can change cellphone number	9	change_cellphonenumber
27	Can delete cellphone number	9	delete_cellphonenumber
28	Can add extra curricular	10	add_extracurricular
29	Can change extra curricular	10	change_extracurricular
30	Can delete extra curricular	10	delete_extracurricular
31	Can add education	11	add_education
32	Can change education	11	change_education
33	Can delete education	11	delete_education
34	Can add education award	12	add_educationaward
35	Can change education award	12	change_educationaward
36	Can delete education award	12	delete_educationaward
37	Can add research paper	13	add_researchpaper
38	Can change research paper	13	change_researchpaper
39	Can delete research paper	13	delete_researchpaper
40	Can add seminar attended	14	add_seminarattended
41	Can change seminar attended	14	change_seminarattended
42	Can delete seminar attended	14	delete_seminarattended
43	Can add seminar conducted	15	add_seminarconducted
44	Can change seminar conducted	15	change_seminarconducted
45	Can delete seminar conducted	15	delete_seminarconducted
46	Can add telephone number	16	add_telephonenumber
47	Can change telephone number	16	change_telephonenumber
48	Can delete telephone number	16	delete_telephonenumber
49	Can add user profile	17	add_userprofile
50	Can change user profile	17	change_userprofile
51	Can delete user profile	17	delete_userprofile
52	Can add work experience	18	add_workexperience
53	Can change work experience	18	change_workexperience
54	Can delete work experience	18	delete_workexperience
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('auth_permission_id_seq', 54, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$y4Q5q65GCQlp$3nFiqsIsQI0yrLN9nc7COznenvFxNg67QalwLjNGbC4=	2016-10-11 10:20:51.993672+08	t	rparayno				t	t	2016-10-11 10:20:41.159573+08
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	resumegeneratormain	achievement
8	resumegeneratormain	address
9	resumegeneratormain	cellphonenumber
10	resumegeneratormain	extracurricular
11	resumegeneratormain	education
12	resumegeneratormain	educationaward
13	resumegeneratormain	researchpaper
14	resumegeneratormain	seminarattended
15	resumegeneratormain	seminarconducted
16	resumegeneratormain	telephonenumber
17	resumegeneratormain	userprofile
18	resumegeneratormain	workexperience
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('django_content_type_id_seq', 18, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-10-11 10:06:42.191811+08
2	auth	0001_initial	2016-10-11 10:06:42.45563+08
3	admin	0001_initial	2016-10-11 10:06:42.50905+08
4	admin	0002_logentry_remove_auto_add	2016-10-11 10:06:42.528573+08
5	contenttypes	0002_remove_content_type_name	2016-10-11 10:06:42.560335+08
6	auth	0002_alter_permission_name_max_length	2016-10-11 10:06:42.57854+08
7	auth	0003_alter_user_email_max_length	2016-10-11 10:06:42.595918+08
8	auth	0004_alter_user_username_opts	2016-10-11 10:06:42.619524+08
9	auth	0005_alter_user_last_login_null	2016-10-11 10:06:42.635348+08
10	auth	0006_require_contenttypes_0002	2016-10-11 10:06:42.6384+08
11	auth	0007_alter_validators_add_error_messages	2016-10-11 10:06:42.651886+08
12	resumegeneratormain	0001_initial	2016-10-11 10:06:43.064255+08
13	resumegeneratormain	0002_remove_workexperience_year_start	2016-10-11 10:06:43.114068+08
14	resumegeneratormain	0003_auto_20160723_0816	2016-10-11 10:06:43.247182+08
15	resumegeneratormain	0004_remove_address_address_line_two	2016-10-11 10:06:43.296564+08
16	resumegeneratormain	0005_remove_address_address_line_one	2016-10-11 10:06:43.327613+08
17	resumegeneratormain	0006_auto_20160723_0822	2016-10-11 10:06:43.415539+08
18	resumegeneratormain	0007_address	2016-10-11 10:06:43.456436+08
19	resumegeneratormain	0008_auto_20160723_0833	2016-10-11 10:06:43.574288+08
20	resumegeneratormain	0009_auto_20160723_0835	2016-10-11 10:06:43.670295+08
21	resumegeneratormain	0010_educationaward_school	2016-10-11 10:06:43.715697+08
22	resumegeneratormain	0011_remove_educationaward_school	2016-10-11 10:06:43.77457+08
23	resumegeneratormain	0012_auto_20160723_0943	2016-10-11 10:06:43.867699+08
24	sessions	0001_initial	2016-10-11 10:14:26.734838+08
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('django_migrations_id_seq', 24, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
2a8f58ubjjlwsd3zvsndl6e4q762ai3c	MWE5OTZhNmY5YmYzZTkwYTBhZWVhNWJiZThkMzVlZmRlNzFiYThhZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMzBlMzAwYzZjMTM5ZDNmNjRmYWZmZTExZjVmZjc4MmRmNjRmNmRjIn0=	2016-10-25 10:20:51.996307+08
\.


--
-- Data for Name: resumegeneratormain_achievement; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY resumegeneratormain_achievement (id, name, user_id) FROM stdin;
\.


--
-- Name: resumegeneratormain_achievement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('resumegeneratormain_achievement_id_seq', 1, false);


--
-- Data for Name: resumegeneratormain_address; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY resumegeneratormain_address (id, address_line_one, address_line_two, user_id) FROM stdin;
\.


--
-- Name: resumegeneratormain_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('resumegeneratormain_address_id_seq', 1, false);


--
-- Data for Name: resumegeneratormain_cellphonenumber; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY resumegeneratormain_cellphonenumber (id, number, user_id) FROM stdin;
\.


--
-- Name: resumegeneratormain_cellphonenumber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('resumegeneratormain_cellphonenumber_id_seq', 1, false);


--
-- Data for Name: resumegeneratormain_education; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY resumegeneratormain_education (id, school, education_attained, year_start, year_finish, month_attained, year_attained, user_id) FROM stdin;
\.


--
-- Name: resumegeneratormain_education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('resumegeneratormain_education_id_seq', 1, false);


--
-- Data for Name: resumegeneratormain_educationaward; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY resumegeneratormain_educationaward (id, award_description, award_date, school_id) FROM stdin;
\.


--
-- Name: resumegeneratormain_educationaward_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('resumegeneratormain_educationaward_id_seq', 1, false);


--
-- Data for Name: resumegeneratormain_extracurricular; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY resumegeneratormain_extracurricular (id, organization, "position", work_done, year_start, year_finish, user_id) FROM stdin;
\.


--
-- Name: resumegeneratormain_extracurricular_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('resumegeneratormain_extracurricular_id_seq', 1, false);


--
-- Data for Name: resumegeneratormain_researchpaper; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY resumegeneratormain_researchpaper (id, month, year, title, summary, user_id) FROM stdin;
\.


--
-- Name: resumegeneratormain_researchpaper_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('resumegeneratormain_researchpaper_id_seq', 1, false);


--
-- Data for Name: resumegeneratormain_seminarattended; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY resumegeneratormain_seminarattended (id, month, year, title, seminar_head, venue, user_id) FROM stdin;
\.


--
-- Name: resumegeneratormain_seminarattended_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('resumegeneratormain_seminarattended_id_seq', 1, false);


--
-- Data for Name: resumegeneratormain_seminarconducted; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY resumegeneratormain_seminarconducted (id, month, year, "position", title, seminar_head, venue, user_id) FROM stdin;
\.


--
-- Name: resumegeneratormain_seminarconducted_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('resumegeneratormain_seminarconducted_id_seq', 1, false);


--
-- Data for Name: resumegeneratormain_telephonenumber; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY resumegeneratormain_telephonenumber (id, number, user_id) FROM stdin;
\.


--
-- Name: resumegeneratormain_telephonenumber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('resumegeneratormain_telephonenumber_id_seq', 1, false);


--
-- Data for Name: resumegeneratormain_userprofile; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY resumegeneratormain_userprofile (id, first_name, middle_initial, last_name, email, objective, background, user_id) FROM stdin;
\.


--
-- Name: resumegeneratormain_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('resumegeneratormain_userprofile_id_seq', 1, false);


--
-- Data for Name: resumegeneratormain_workexperience; Type: TABLE DATA; Schema: public; Owner: resumegeneratordba
--

COPY resumegeneratormain_workexperience (id, month_start, month_finish, year_finish, "position", company, workdone, user_id) FROM stdin;
\.


--
-- Name: resumegeneratormain_workexperience_id_seq; Type: SEQUENCE SET; Schema: public; Owner: resumegeneratordba
--

SELECT pg_catalog.setval('resumegeneratormain_workexperience_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: resumegeneratormain_achievement_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_achievement
    ADD CONSTRAINT resumegeneratormain_achievement_pkey PRIMARY KEY (id);


--
-- Name: resumegeneratormain_address_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_address
    ADD CONSTRAINT resumegeneratormain_address_pkey PRIMARY KEY (id);


--
-- Name: resumegeneratormain_cellphonenumber_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_cellphonenumber
    ADD CONSTRAINT resumegeneratormain_cellphonenumber_pkey PRIMARY KEY (id);


--
-- Name: resumegeneratormain_education_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_education
    ADD CONSTRAINT resumegeneratormain_education_pkey PRIMARY KEY (id);


--
-- Name: resumegeneratormain_educationaward_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_educationaward
    ADD CONSTRAINT resumegeneratormain_educationaward_pkey PRIMARY KEY (id);


--
-- Name: resumegeneratormain_extracurricular_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_extracurricular
    ADD CONSTRAINT resumegeneratormain_extracurricular_pkey PRIMARY KEY (id);


--
-- Name: resumegeneratormain_researchpaper_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_researchpaper
    ADD CONSTRAINT resumegeneratormain_researchpaper_pkey PRIMARY KEY (id);


--
-- Name: resumegeneratormain_seminarattended_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_seminarattended
    ADD CONSTRAINT resumegeneratormain_seminarattended_pkey PRIMARY KEY (id);


--
-- Name: resumegeneratormain_seminarconducted_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_seminarconducted
    ADD CONSTRAINT resumegeneratormain_seminarconducted_pkey PRIMARY KEY (id);


--
-- Name: resumegeneratormain_telephonenumber_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_telephonenumber
    ADD CONSTRAINT resumegeneratormain_telephonenumber_pkey PRIMARY KEY (id);


--
-- Name: resumegeneratormain_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_userprofile
    ADD CONSTRAINT resumegeneratormain_userprofile_pkey PRIMARY KEY (id);


--
-- Name: resumegeneratormain_workexperience_pkey; Type: CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_workexperience
    ADD CONSTRAINT resumegeneratormain_workexperience_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: resumegeneratormain_achievement_e8701ad4; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX resumegeneratormain_achievement_e8701ad4 ON resumegeneratormain_achievement USING btree (user_id);


--
-- Name: resumegeneratormain_address_e8701ad4; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX resumegeneratormain_address_e8701ad4 ON resumegeneratormain_address USING btree (user_id);


--
-- Name: resumegeneratormain_cellphonenumber_e8701ad4; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX resumegeneratormain_cellphonenumber_e8701ad4 ON resumegeneratormain_cellphonenumber USING btree (user_id);


--
-- Name: resumegeneratormain_education_e8701ad4; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX resumegeneratormain_education_e8701ad4 ON resumegeneratormain_education USING btree (user_id);


--
-- Name: resumegeneratormain_educationaward_5fc7164b; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX resumegeneratormain_educationaward_5fc7164b ON resumegeneratormain_educationaward USING btree (school_id);


--
-- Name: resumegeneratormain_extracurricular_e8701ad4; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX resumegeneratormain_extracurricular_e8701ad4 ON resumegeneratormain_extracurricular USING btree (user_id);


--
-- Name: resumegeneratormain_researchpaper_e8701ad4; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX resumegeneratormain_researchpaper_e8701ad4 ON resumegeneratormain_researchpaper USING btree (user_id);


--
-- Name: resumegeneratormain_seminarattended_e8701ad4; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX resumegeneratormain_seminarattended_e8701ad4 ON resumegeneratormain_seminarattended USING btree (user_id);


--
-- Name: resumegeneratormain_seminarconducted_e8701ad4; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX resumegeneratormain_seminarconducted_e8701ad4 ON resumegeneratormain_seminarconducted USING btree (user_id);


--
-- Name: resumegeneratormain_telephonenumber_e8701ad4; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX resumegeneratormain_telephonenumber_e8701ad4 ON resumegeneratormain_telephonenumber USING btree (user_id);


--
-- Name: resumegeneratormain_userprofile_e8701ad4; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX resumegeneratormain_userprofile_e8701ad4 ON resumegeneratormain_userprofile USING btree (user_id);


--
-- Name: resumegeneratormain_workexperience_e8701ad4; Type: INDEX; Schema: public; Owner: resumegeneratordba
--

CREATE INDEX resumegeneratormain_workexperience_e8701ad4 ON resumegeneratormain_workexperience USING btree (user_id);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: resumege_school_id_6af2c88e_fk_resumegeneratormain_education_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_educationaward
    ADD CONSTRAINT resumege_school_id_6af2c88e_fk_resumegeneratormain_education_id FOREIGN KEY (school_id) REFERENCES resumegeneratormain_education(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: resumegeneratormain_achievemen_user_id_39ffe8aa_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_achievement
    ADD CONSTRAINT resumegeneratormain_achievemen_user_id_39ffe8aa_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: resumegeneratormain_address_user_id_97b258db_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_address
    ADD CONSTRAINT resumegeneratormain_address_user_id_97b258db_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: resumegeneratormain_cellphonen_user_id_1e0f2e18_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_cellphonenumber
    ADD CONSTRAINT resumegeneratormain_cellphonen_user_id_1e0f2e18_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: resumegeneratormain_education_user_id_cde16761_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_education
    ADD CONSTRAINT resumegeneratormain_education_user_id_cde16761_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: resumegeneratormain_extracurri_user_id_85808e36_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_extracurricular
    ADD CONSTRAINT resumegeneratormain_extracurri_user_id_85808e36_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: resumegeneratormain_researchpa_user_id_0fcf953a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_researchpaper
    ADD CONSTRAINT resumegeneratormain_researchpa_user_id_0fcf953a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: resumegeneratormain_seminaratt_user_id_8e5054d5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_seminarattended
    ADD CONSTRAINT resumegeneratormain_seminaratt_user_id_8e5054d5_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: resumegeneratormain_seminarcon_user_id_d0e3809d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_seminarconducted
    ADD CONSTRAINT resumegeneratormain_seminarcon_user_id_d0e3809d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: resumegeneratormain_telephonen_user_id_18e58c15_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_telephonenumber
    ADD CONSTRAINT resumegeneratormain_telephonen_user_id_18e58c15_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: resumegeneratormain_userprofil_user_id_6011c459_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_userprofile
    ADD CONSTRAINT resumegeneratormain_userprofil_user_id_6011c459_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: resumegeneratormain_workexperi_user_id_cc89e857_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: resumegeneratordba
--

ALTER TABLE ONLY resumegeneratormain_workexperience
    ADD CONSTRAINT resumegeneratormain_workexperi_user_id_cc89e857_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

