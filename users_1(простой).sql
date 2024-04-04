--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-04-04 07:19:49

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
-- TOC entry 21 (class 2615 OID 18722)
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- TOC entry 22 (class 2615 OID 18978)
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- TOC entry 20 (class 2615 OID 18361)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- TOC entry 7438 (class 0 OID 0)
-- Dependencies: 20
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- TOC entry 6 (class 3079 OID 18528)
-- Name: address_standardizer; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;


--
-- TOC entry 7439 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION address_standardizer; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';


--
-- TOC entry 7 (class 3079 OID 18536)
-- Name: address_standardizer_data_us; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us WITH SCHEMA public;


--
-- TOC entry 7440 (class 0 OID 0)
-- Dependencies: 7
-- Name: EXTENSION address_standardizer_data_us; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer_data_us IS 'Address Standardizer US dataset example';


--
-- TOC entry 12 (class 3079 OID 18710)
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- TOC entry 7441 (class 0 OID 0)
-- Dependencies: 12
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- TOC entry 14 (class 3079 OID 19122)
-- Name: h3; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS h3 WITH SCHEMA public;


--
-- TOC entry 7442 (class 0 OID 0)
-- Dependencies: 14
-- Name: EXTENSION h3; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION h3 IS 'H3 bindings for PostgreSQL';


--
-- TOC entry 2 (class 3079 OID 16399)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 7443 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- TOC entry 3 (class 3079 OID 17475)
-- Name: postgis_raster; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_raster WITH SCHEMA public;


--
-- TOC entry 7444 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION postgis_raster; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_raster IS 'PostGIS raster types and functions';


--
-- TOC entry 15 (class 3079 OID 19236)
-- Name: h3_postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS h3_postgis WITH SCHEMA public;


--
-- TOC entry 7445 (class 0 OID 0)
-- Dependencies: 15
-- Name: EXTENSION h3_postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION h3_postgis IS 'H3 PostGIS integration';


--
-- TOC entry 11 (class 3079 OID 18704)
-- Name: ogr_fdw; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ogr_fdw WITH SCHEMA public;


--
-- TOC entry 7446 (class 0 OID 0)
-- Dependencies: 11
-- Name: EXTENSION ogr_fdw; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';


--
-- TOC entry 4 (class 3079 OID 18032)
-- Name: pgrouting; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrouting WITH SCHEMA public;


--
-- TOC entry 7447 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION pgrouting; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgrouting IS 'pgRouting Extension';


--
-- TOC entry 9 (class 3079 OID 18598)
-- Name: pointcloud; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pointcloud WITH SCHEMA public;


--
-- TOC entry 7448 (class 0 OID 0)
-- Dependencies: 9
-- Name: EXTENSION pointcloud; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pointcloud IS 'data type for lidar point clouds';


--
-- TOC entry 10 (class 3079 OID 18693)
-- Name: pointcloud_postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pointcloud_postgis WITH SCHEMA public;


--
-- TOC entry 7449 (class 0 OID 0)
-- Dependencies: 10
-- Name: EXTENSION pointcloud_postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pointcloud_postgis IS 'integration for pointcloud LIDAR data and PostGIS geometry data';


--
-- TOC entry 8 (class 3079 OID 18573)
-- Name: postgis_sfcgal; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;


--
-- TOC entry 7450 (class 0 OID 0)
-- Dependencies: 8
-- Name: EXTENSION postgis_sfcgal; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';


--
-- TOC entry 13 (class 3079 OID 18723)
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- TOC entry 7451 (class 0 OID 0)
-- Dependencies: 13
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- TOC entry 5 (class 3079 OID 18362)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 7452 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 330 (class 1259 OID 22648)
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- TOC entry 329 (class 1259 OID 22647)
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admins_id_seq OWNER TO postgres;

--
-- TOC entry 7453 (class 0 OID 0)
-- Dependencies: 329
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- TOC entry 317 (class 1259 OID 19323)
-- Name: article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    intro character varying(300) NOT NULL,
    text text NOT NULL,
    date timestamp without time zone,
    user_id integer,
    file character varying(1000),
    hidden boolean DEFAULT false,
    group_id character varying(255)
);


ALTER TABLE public.article OWNER TO postgres;

--
-- TOC entry 326 (class 1259 OID 22611)
-- Name: article_group_association; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article_group_association (
    article_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.article_group_association OWNER TO postgres;

--
-- TOC entry 316 (class 1259 OID 19322)
-- Name: article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.article_id_seq OWNER TO postgres;

--
-- TOC entry 7454 (class 0 OID 0)
-- Dependencies: 316
-- Name: article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_id_seq OWNED BY public.article.id;


--
-- TOC entry 332 (class 1259 OID 22665)
-- Name: banned_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banned_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    reason character varying(255) NOT NULL,
    banned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.banned_users OWNER TO postgres;

--
-- TOC entry 331 (class 1259 OID 22664)
-- Name: banned_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banned_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banned_users_id_seq OWNER TO postgres;

--
-- TOC entry 7455 (class 0 OID 0)
-- Dependencies: 331
-- Name: banned_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banned_users_id_seq OWNED BY public.banned_users.id;


--
-- TOC entry 320 (class 1259 OID 19396)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    text text NOT NULL,
    date timestamp without time zone,
    user_id integer NOT NULL,
    article_id integer NOT NULL
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- TOC entry 319 (class 1259 OID 19395)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comment_id_seq OWNER TO postgres;

--
-- TOC entry 7456 (class 0 OID 0)
-- Dependencies: 319
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- TOC entry 324 (class 1259 OID 19424)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    author_id integer,
    posts text,
    join_code character varying(20) DEFAULT 'default_code'::character varying NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 323 (class 1259 OID 19423)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_id_seq OWNER TO postgres;

--
-- TOC entry 7457 (class 0 OID 0)
-- Dependencies: 323
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- TOC entry 322 (class 1259 OID 19415)
-- Name: like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."like" (
    id integer NOT NULL,
    user_id integer,
    recipient_id integer
);


ALTER TABLE public."like" OWNER TO postgres;

--
-- TOC entry 321 (class 1259 OID 19414)
-- Name: like_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."like" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.like_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 328 (class 1259 OID 22634)
-- Name: moderators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moderators (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.moderators OWNER TO postgres;

--
-- TOC entry 327 (class 1259 OID 22633)
-- Name: moderators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moderators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moderators_id_seq OWNER TO postgres;

--
-- TOC entry 7458 (class 0 OID 0)
-- Dependencies: 327
-- Name: moderators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moderators_id_seq OWNED BY public.moderators.id;


--
-- TOC entry 325 (class 1259 OID 19444)
-- Name: user_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_group (
    user_id integer NOT NULL,
    group_id integer NOT NULL,
    group_name character varying(255),
    teacher_name character varying(255)
);


ALTER TABLE public.user_group OWNER TO postgres;

--
-- TOC entry 315 (class 1259 OID 19313)
-- Name: users1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users1 (
    id smallint NOT NULL,
    login character varying(100),
    password character varying(100),
    email character varying(100),
    file character varying(100),
    description character varying(255),
    comments text,
    recipient_id integer,
    group_id integer,
    is_admin boolean DEFAULT false,
    is_moderator boolean DEFAULT false,
    is_banned boolean DEFAULT false
);


ALTER TABLE public.users1 OWNER TO postgres;

--
-- TOC entry 7459 (class 0 OID 0)
-- Dependencies: 315
-- Name: TABLE users1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.users1 IS 'таблица с данными пользователей';


--
-- TOC entry 318 (class 1259 OID 19331)
-- Name: users1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users1_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users1_id_seq OWNER TO postgres;

--
-- TOC entry 7460 (class 0 OID 0)
-- Dependencies: 318
-- Name: users1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users1_id_seq OWNED BY public.users1.id;


--
-- TOC entry 7196 (class 2604 OID 22651)
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- TOC entry 7190 (class 2604 OID 19326)
-- Name: article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article ALTER COLUMN id SET DEFAULT nextval('public.article_id_seq'::regclass);


--
-- TOC entry 7197 (class 2604 OID 22668)
-- Name: banned_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banned_users ALTER COLUMN id SET DEFAULT nextval('public.banned_users_id_seq'::regclass);


--
-- TOC entry 7192 (class 2604 OID 19399)
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- TOC entry 7193 (class 2604 OID 19427)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- TOC entry 7195 (class 2604 OID 22637)
-- Name: moderators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderators ALTER COLUMN id SET DEFAULT nextval('public.moderators_id_seq'::regclass);


--
-- TOC entry 7186 (class 2604 OID 19549)
-- Name: users1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1 ALTER COLUMN id SET DEFAULT nextval('public.users1_id_seq'::regclass);


--
-- TOC entry 7430 (class 0 OID 22648)
-- Dependencies: 330
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, user_id) FROM stdin;
1	96
2	65
\.


--
-- TOC entry 7417 (class 0 OID 19323)
-- Dependencies: 317
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article (id, title, intro, text, date, user_id, file, hidden, group_id) FROM stdin;
5	123	123	123	2023-12-07 19:14:45.469628	42	\N	f	\N
7	123	123	123	2023-12-07 19:22:43.29417	42	\N	f	\N
8	777	777	777	2023-12-09 21:05:05.879613	60	\N	f	\N
9	987	987	987	2023-12-10 10:16:07.980082	61	\N	f	\N
11	Здравствуйте!	Это мой первый пост	А здесь основной текст 	2023-12-12 20:04:09.302982	63	\N	f	\N
12	Это мой первый пост на этом форуме	Где я?	Что	2023-12-12 20:58:22.754797	64	\N	f	\N
13	Умный мангал	Более подробно о моём проекте	Вся информация о проекте	2023-12-12 21:02:04.651081	65	\N	f	\N
53	1	2	3	2024-03-27 17:23:41.376779	96	IMG-20230403-WA0013.jpg,IMG-20230912-WA0001.jpg,nix.jpg	f	\N
\.


--
-- TOC entry 7426 (class 0 OID 22611)
-- Dependencies: 326
-- Data for Name: article_group_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article_group_association (article_id, group_id) FROM stdin;
53	12
53	16
53	17
\.


--
-- TOC entry 7432 (class 0 OID 22665)
-- Dependencies: 332
-- Data for Name: banned_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banned_users (id, user_id, reason, banned_at) FROM stdin;
5	63	reason1	2024-04-02 17:40:41.310012
\.


--
-- TOC entry 7420 (class 0 OID 19396)
-- Dependencies: 320
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, text, date, user_id, article_id) FROM stdin;
11	комментарий	2024-01-25 19:24:28.789345	96	11
12	насколько твой мангал умный?	2024-01-25 19:26:32.499312	96	13
19	Привет	2024-02-08 05:44:08.291672	96	12
22	jn k hn	2024-03-28 08:52:22.769056	96	53
23	робиоьррпол	2024-03-30 11:07:28.049421	96	53
\.


--
-- TOC entry 7424 (class 0 OID 19424)
-- Dependencies: 324
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, name, author_id, posts, join_code) FROM stdin;
12	нн	96	\N	MoMll9y6
15	11	96	\N	APDqzSz0
16	112	96	\N	xqIn0o8A
17	вапвапвап	96	\N	EmzpzUMG
\.


--
-- TOC entry 7422 (class 0 OID 19415)
-- Dependencies: 322
-- Data for Name: like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."like" (id, user_id, recipient_id) FROM stdin;
1	96	65
2	96	65
3	96	65
4	96	65
5	96	65
6	96	65
7	96	65
8	96	65
9	96	65
10	96	65
11	96	65
12	96	65
13	96	65
47	60	96
57	96	64
\.


--
-- TOC entry 7428 (class 0 OID 22634)
-- Dependencies: 328
-- Data for Name: moderators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moderators (id, user_id) FROM stdin;
4	63
\.


--
-- TOC entry 7166 (class 0 OID 18600)
-- Dependencies: 260
-- Data for Name: pointcloud_formats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pointcloud_formats (pcid, srid, schema) FROM stdin;
\.


--
-- TOC entry 7159 (class 0 OID 16717)
-- Dependencies: 233
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 7165 (class 0 OID 18550)
-- Dependencies: 257
-- Data for Name: us_gaz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 7163 (class 0 OID 18538)
-- Dependencies: 255
-- Data for Name: us_lex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 7164 (class 0 OID 18562)
-- Dependencies: 259
-- Data for Name: us_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_rules (id, rule, is_custom) FROM stdin;
\.


--
-- TOC entry 7425 (class 0 OID 19444)
-- Dependencies: 325
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_group (user_id, group_id, group_name, teacher_name) FROM stdin;
96	12	\N	\N
96	15	\N	\N
96	16	\N	\N
96	17	\N	\N
\.


--
-- TOC entry 7415 (class 0 OID 19313)
-- Dependencies: 315
-- Data for Name: users1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users1 (id, login, password, email, file, description, comments, recipient_id, group_id, is_admin, is_moderator, is_banned) FROM stdin;
64	VladimirT	$2b$12$/uODEi9dEE2rv7FQi.OVq.gQOM9aEqRMRUOM85DpocY140TX.YHZ2	Titchev2007@yandex.ru	IMG_20230925_105616.jpg	\N	\N	\N	\N	f	f	f
63	Egor	$2b$12$CtXiiZUfbHR9rNBxHD9n4e6T.zd.TtrdyDWMU18A8GjnibMI3hJHm	Mashakov0707@yandex.ru	photo_2023-04-20_21-56-06.jpg	\N	\N	\N	\N	f	t	t
65	AlexanderL	$2b$12$upBAU9KDTsZry0W3.8gE4OjUGyPPTuHMD3WQCFvtyfzncoYXWmqne	LoyAlexander111@yandex.ru	IMG_20230802_190006.jpg	\N	\N	\N	\N	t	f	f
96	887	$2b$12$mr7J1TSiqMyjp0/IFA9ZW.xxJtec0PHc/U6ufBMWB4mZGWyQWCJN.	887	2.PNG	описание профиля ограничено и пааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааа	\N	\N	\N	t	f	f
\.


--
-- TOC entry 7167 (class 0 OID 18729)
-- Dependencies: 263
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- TOC entry 7168 (class 0 OID 19061)
-- Dependencies: 308
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 7169 (class 0 OID 19071)
-- Dependencies: 310
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 7170 (class 0 OID 19081)
-- Dependencies: 312
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- TOC entry 7161 (class 0 OID 18364)
-- Dependencies: 248
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- TOC entry 7162 (class 0 OID 18376)
-- Dependencies: 249
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- TOC entry 7461 (class 0 OID 0)
-- Dependencies: 329
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 2, true);


--
-- TOC entry 7462 (class 0 OID 0)
-- Dependencies: 316
-- Name: article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_id_seq', 53, true);


--
-- TOC entry 7463 (class 0 OID 0)
-- Dependencies: 331
-- Name: banned_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banned_users_id_seq', 5, true);


--
-- TOC entry 7464 (class 0 OID 0)
-- Dependencies: 319
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 23, true);


--
-- TOC entry 7465 (class 0 OID 0)
-- Dependencies: 323
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 17, true);


--
-- TOC entry 7466 (class 0 OID 0)
-- Dependencies: 321
-- Name: like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.like_id_seq', 57, true);


--
-- TOC entry 7467 (class 0 OID 0)
-- Dependencies: 327
-- Name: moderators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moderators_id_seq', 4, true);


--
-- TOC entry 7468 (class 0 OID 0)
-- Dependencies: 318
-- Name: users1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users1_id_seq', 101, true);


--
-- TOC entry 7469 (class 0 OID 0)
-- Dependencies: 247
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: postgres
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


--
-- TOC entry 7247 (class 2606 OID 22653)
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- TOC entry 7249 (class 2606 OID 22655)
-- Name: admins admins_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_user_id_key UNIQUE (user_id);


--
-- TOC entry 7241 (class 2606 OID 22615)
-- Name: article_group_association article_group_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_group_association
    ADD CONSTRAINT article_group_association_pkey PRIMARY KEY (article_id, group_id);


--
-- TOC entry 7231 (class 2606 OID 19330)
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);


--
-- TOC entry 7251 (class 2606 OID 22671)
-- Name: banned_users banned_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banned_users
    ADD CONSTRAINT banned_users_pkey PRIMARY KEY (id);


--
-- TOC entry 7233 (class 2606 OID 19403)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- TOC entry 7235 (class 2606 OID 19431)
-- Name: groups groups_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_name_key UNIQUE (name);


--
-- TOC entry 7237 (class 2606 OID 19429)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 7243 (class 2606 OID 22639)
-- Name: moderators moderators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT moderators_pkey PRIMARY KEY (id);


--
-- TOC entry 7245 (class 2606 OID 22641)
-- Name: moderators moderators_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT moderators_user_id_key UNIQUE (user_id);


--
-- TOC entry 7229 (class 2606 OID 19551)
-- Name: users1 unique_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1
    ADD CONSTRAINT unique_user_id UNIQUE (id);


--
-- TOC entry 7239 (class 2606 OID 19448)
-- Name: user_group user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (user_id, group_id);


--
-- TOC entry 7262 (class 2606 OID 22656)
-- Name: admins admins_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);


--
-- TOC entry 7259 (class 2606 OID 22616)
-- Name: article_group_association article_group_association_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_group_association
    ADD CONSTRAINT article_group_association_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- TOC entry 7260 (class 2606 OID 22621)
-- Name: article_group_association article_group_association_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_group_association
    ADD CONSTRAINT article_group_association_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 7263 (class 2606 OID 22672)
-- Name: banned_users banned_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banned_users
    ADD CONSTRAINT banned_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);


--
-- TOC entry 7254 (class 2606 OID 19409)
-- Name: comment comment_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- TOC entry 7255 (class 2606 OID 19557)
-- Name: comment comment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);


--
-- TOC entry 7256 (class 2606 OID 19577)
-- Name: groups groups_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_teacher_id_fkey FOREIGN KEY (author_id) REFERENCES public.users1(id);


--
-- TOC entry 7261 (class 2606 OID 22642)
-- Name: moderators moderators_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT moderators_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);


--
-- TOC entry 7257 (class 2606 OID 19454)
-- Name: user_group user_group_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 7258 (class 2606 OID 19562)
-- Name: user_group user_group_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);


--
-- TOC entry 7252 (class 2606 OID 19434)
-- Name: users1 users1_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1
    ADD CONSTRAINT users1_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 7253 (class 2606 OID 19552)
-- Name: users1 users1_recipient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1
    ADD CONSTRAINT users1_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.users1(id);


-- Completed on 2024-04-04 07:19:50

--
-- PostgreSQL database dump complete
--

