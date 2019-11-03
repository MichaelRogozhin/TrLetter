--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

-- Started on 2019-11-03 23:15:34

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 17451)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: trletteruser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO trletteruser;

--
-- TOC entry 197 (class 1259 OID 17454)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: trletteruser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO trletteruser;

--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: trletteruser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 198 (class 1259 OID 17456)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: trletteruser
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO trletteruser;

--
-- TOC entry 199 (class 1259 OID 17459)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: trletteruser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO trletteruser;

--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: trletteruser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 200 (class 1259 OID 17461)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: trletteruser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO trletteruser;

--
-- TOC entry 201 (class 1259 OID 17464)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: trletteruser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO trletteruser;

--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 201
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: trletteruser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 202 (class 1259 OID 17466)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: trletteruser
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO trletteruser;

--
-- TOC entry 203 (class 1259 OID 17472)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: trletteruser
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO trletteruser;

--
-- TOC entry 204 (class 1259 OID 17475)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: trletteruser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO trletteruser;

--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: trletteruser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 205 (class 1259 OID 17477)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: trletteruser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO trletteruser;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: trletteruser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 206 (class 1259 OID 17479)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: trletteruser
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO trletteruser;

--
-- TOC entry 207 (class 1259 OID 17482)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: trletteruser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO trletteruser;

--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: trletteruser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 208 (class 1259 OID 17484)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: trletteruser
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO trletteruser;

--
-- TOC entry 209 (class 1259 OID 17491)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: trletteruser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO trletteruser;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 209
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: trletteruser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 210 (class 1259 OID 17493)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: trletteruser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO trletteruser;

--
-- TOC entry 211 (class 1259 OID 17496)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: trletteruser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO trletteruser;

--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 211
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: trletteruser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 212 (class 1259 OID 17498)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: trletteruser
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO trletteruser;

--
-- TOC entry 213 (class 1259 OID 17504)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: trletteruser
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO trletteruser;

--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 213
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: trletteruser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 214 (class 1259 OID 17506)
-- Name: django_session; Type: TABLE; Schema: public; Owner: trletteruser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO trletteruser;

--
-- TOC entry 216 (class 1259 OID 17615)
-- Name: main_letter; Type: TABLE; Schema: public; Owner: trletteruser
--

CREATE TABLE public.main_letter (
    id integer NOT NULL,
    typel integer NOT NULL,
    subject character varying(200),
    body character varying(4000),
    dt timestamp with time zone NOT NULL,
    count_open integer NOT NULL,
    count_send integer NOT NULL,
    shop_id integer
);


ALTER TABLE public.main_letter OWNER TO trletteruser;

--
-- TOC entry 215 (class 1259 OID 17613)
-- Name: main_letter_id_seq; Type: SEQUENCE; Schema: public; Owner: trletteruser
--

CREATE SEQUENCE public.main_letter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_letter_id_seq OWNER TO trletteruser;

--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 215
-- Name: main_letter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: trletteruser
--

ALTER SEQUENCE public.main_letter_id_seq OWNED BY public.main_letter.id;


--
-- TOC entry 2733 (class 2604 OID 17512)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2734 (class 2604 OID 17513)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2735 (class 2604 OID 17514)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2736 (class 2604 OID 17515)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2737 (class 2604 OID 17516)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2738 (class 2604 OID 17517)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2739 (class 2604 OID 17518)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2741 (class 2604 OID 17519)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2742 (class 2604 OID 17520)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2743 (class 2604 OID 17618)
-- Name: main_letter id; Type: DEFAULT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.main_letter ALTER COLUMN id SET DEFAULT nextval('public.main_letter_id_seq'::regclass);


--
-- TOC entry 2923 (class 0 OID 17451)
-- Dependencies: 196
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: trletteruser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 17456)
-- Dependencies: 198
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: trletteruser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 17461)
-- Dependencies: 200
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: trletteruser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add letter	7	add_letter
20	Can change letter	7	change_letter
21	Can delete letter	7	delete_letter
\.


--
-- TOC entry 2929 (class 0 OID 17466)
-- Dependencies: 202
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: trletteruser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$2Mdsa0Vnnxu9$cJ5LamD6ZQ73+p1eVf7/ingvuFOR9nCZqssN2m6N15U=	\N	t	admin			r_mv@mail.ru	t	t	2019-10-30 23:20:20.592+03
\.


--
-- TOC entry 2930 (class 0 OID 17472)
-- Dependencies: 203
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: trletteruser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 17479)
-- Dependencies: 206
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: trletteruser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 17484)
-- Dependencies: 208
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: trletteruser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 17493)
-- Dependencies: 210
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: trletteruser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	main	letter
\.


--
-- TOC entry 2939 (class 0 OID 17498)
-- Dependencies: 212
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: trletteruser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-10-30 23:17:41.156+03
2	auth	0001_initial	2019-10-30 23:17:42.75+03
3	admin	0001_initial	2019-10-30 23:17:43.093+03
4	admin	0002_logentry_remove_auto_add	2019-10-30 23:17:43.14+03
5	contenttypes	0002_remove_content_type_name	2019-10-30 23:17:43.233+03
6	auth	0002_alter_permission_name_max_length	2019-10-30 23:17:43.264+03
7	auth	0003_alter_user_email_max_length	2019-10-30 23:17:43.296+03
8	auth	0004_alter_user_username_opts	2019-10-30 23:17:43.311+03
9	auth	0005_alter_user_last_login_null	2019-10-30 23:17:43.327+03
10	auth	0006_require_contenttypes_0002	2019-10-30 23:17:43.342+03
11	auth	0007_alter_validators_add_error_messages	2019-10-30 23:17:43.358+03
12	auth	0008_alter_user_username_max_length	2019-10-30 23:17:43.436+03
13	sessions	0001_initial	2019-10-30 23:17:43.639+03
14	main	0001_initial	2019-11-02 13:48:59.184+03
\.


--
-- TOC entry 2941 (class 0 OID 17506)
-- Dependencies: 214
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: trletteruser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 17615)
-- Dependencies: 216
-- Data for Name: main_letter; Type: TABLE DATA; Schema: public; Owner: trletteruser
--

COPY public.main_letter (id, typel, subject, body, dt, count_open, count_send, shop_id) FROM stdin;
4	1	Тема1	Текст письма 1	2019-11-02 21:19:05.655288+03	10	1	\N
7	3	Тема4	Текст письма 4	2019-11-02 23:49:44.754295+03	25	2	\N
5	1	Тема2	Текст письма 2	2019-11-02 21:19:59.621375+03	15	1	345
6	2	Тема3	Текст письма 3	2019-11-02 21:21:34.914826+03	20	2	26
\.


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: trletteruser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: trletteruser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 201
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: trletteruser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 21, true);


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: trletteruser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: trletteruser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: trletteruser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 209
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: trletteruser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 211
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: trletteruser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 7, true);


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 213
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: trletteruser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 14, true);


--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 215
-- Name: main_letter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: trletteruser
--

SELECT pg_catalog.setval('public.main_letter_id_seq', 13, true);


--
-- TOC entry 2746 (class 2606 OID 17522)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2751 (class 2606 OID 17524)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2754 (class 2606 OID 17526)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 17528)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 17530)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2759 (class 2606 OID 17532)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 17534)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 17536)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2761 (class 2606 OID 17538)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 17540)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 17542)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2764 (class 2606 OID 17544)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2779 (class 2606 OID 17546)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 17548)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2784 (class 2606 OID 17550)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 17552)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 17554)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2792 (class 2606 OID 17623)
-- Name: main_letter main_letter_pkey; Type: CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.main_letter
    ADD CONSTRAINT main_letter_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 1259 OID 17555)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: trletteruser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2749 (class 1259 OID 17556)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: trletteruser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2752 (class 1259 OID 17557)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: trletteruser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2755 (class 1259 OID 17558)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: trletteruser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2765 (class 1259 OID 17559)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: trletteruser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2768 (class 1259 OID 17560)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: trletteruser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2771 (class 1259 OID 17561)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: trletteruser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2774 (class 1259 OID 17562)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: trletteruser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2762 (class 1259 OID 17563)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: trletteruser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2777 (class 1259 OID 17564)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: trletteruser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2780 (class 1259 OID 17565)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: trletteruser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2787 (class 1259 OID 17566)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: trletteruser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2790 (class 1259 OID 17567)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: trletteruser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2793 (class 2606 OID 17568)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2794 (class 2606 OID 17573)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2795 (class 2606 OID 17578)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2796 (class 2606 OID 17583)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2797 (class 2606 OID 17588)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2798 (class 2606 OID 17593)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2799 (class 2606 OID 17598)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2800 (class 2606 OID 17603)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2801 (class 2606 OID 17608)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: trletteruser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2019-11-03 23:15:36

--
-- PostgreSQL database dump complete
--

