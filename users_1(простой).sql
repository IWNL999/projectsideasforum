--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-03-21 19:02:35

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
-- TOC entry 7388 (class 0 OID 0)
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
-- TOC entry 7389 (class 0 OID 0)
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
-- TOC entry 7390 (class 0 OID 0)
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
-- TOC entry 7391 (class 0 OID 0)
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
-- TOC entry 7392 (class 0 OID 0)
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
-- TOC entry 7393 (class 0 OID 0)
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
-- TOC entry 7394 (class 0 OID 0)
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
-- TOC entry 7395 (class 0 OID 0)
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
-- TOC entry 7396 (class 0 OID 0)
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
-- TOC entry 7397 (class 0 OID 0)
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
-- TOC entry 7398 (class 0 OID 0)
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
-- TOC entry 7399 (class 0 OID 0)
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
-- TOC entry 7400 (class 0 OID 0)
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
-- TOC entry 7401 (class 0 OID 0)
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
-- TOC entry 7402 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

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
    group_id integer
);


ALTER TABLE public.article OWNER TO postgres;

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
-- TOC entry 7403 (class 0 OID 0)
-- Dependencies: 316
-- Name: article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_id_seq OWNED BY public.article.id;


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
-- TOC entry 7404 (class 0 OID 0)
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
-- TOC entry 7405 (class 0 OID 0)
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
    group_id integer
);


ALTER TABLE public.users1 OWNER TO postgres;

--
-- TOC entry 7406 (class 0 OID 0)
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
-- TOC entry 7407 (class 0 OID 0)
-- Dependencies: 318
-- Name: users1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users1_id_seq OWNED BY public.users1.id;


--
-- TOC entry 7168 (class 2604 OID 19326)
-- Name: article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article ALTER COLUMN id SET DEFAULT nextval('public.article_id_seq'::regclass);


--
-- TOC entry 7170 (class 2604 OID 19399)
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- TOC entry 7171 (class 2604 OID 19427)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- TOC entry 7167 (class 2604 OID 19549)
-- Name: users1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1 ALTER COLUMN id SET DEFAULT nextval('public.users1_id_seq'::regclass);


--
-- TOC entry 7374 (class 0 OID 19323)
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
50				2024-03-19 15:38:36.629157	96	IMG_20230925_105616.jpg,IMG-20230403-WA0013.jpg,IMG-20230912-WA0001.jpg,nix.jpg,ns.png	f	\N
51				2024-03-19 16:16:50.25149	96	anime-naruto-sharingan-chernyy.jpg,I48zujt9RvE.jpg,Screenshot_2023-06-18-23-04-44-241_com.miui.gallery.jpg	f	8
48				2024-03-18 18:48:25.608385	96	ns.png,photo_2023-04-20_21-56-06.jpg,Screenshot_2023-06-18-23-05-03-977_com.miui.gallery.jpg,Screenshot_2023-06-18-23-05-13-757_com.miui.gallery.jpg,22222.PNG	f	\N
49				2024-03-18 19:05:27.804432	96	IMG_20230925_105616.jpg,IMG-20230403-WA0013.jpg,IMG-20230912-WA0001.jpg	f	\N
\.


--
-- TOC entry 7377 (class 0 OID 19396)
-- Dependencies: 320
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, text, date, user_id, article_id) FROM stdin;
11	комментарий	2024-01-25 19:24:28.789345	96	11
12	насколько твой мангал умный?	2024-01-25 19:26:32.499312	96	13
19	Привет	2024-02-08 05:44:08.291672	96	12
21	рапапр	2024-03-20 17:22:51.354459	96	51
\.


--
-- TOC entry 7381 (class 0 OID 19424)
-- Dependencies: 324
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, name, author_id, posts, join_code) FROM stdin;
1	gfhdgfh	96	\N	default_value
3	название	96	\N	default_value
6	5	96	\N	default_value
7	hujvhb	96	\N	default_value
8	5 группа	96	\N	PPd1MPhU
9	bbbb	96	\N	QFkBQeNA
\.


--
-- TOC entry 7379 (class 0 OID 19415)
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
-- TOC entry 7147 (class 0 OID 18600)
-- Dependencies: 260
-- Data for Name: pointcloud_formats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pointcloud_formats (pcid, srid, schema) FROM stdin;
\.


--
-- TOC entry 7140 (class 0 OID 16717)
-- Dependencies: 233
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 7146 (class 0 OID 18550)
-- Dependencies: 257
-- Data for Name: us_gaz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 7144 (class 0 OID 18538)
-- Dependencies: 255
-- Data for Name: us_lex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 7145 (class 0 OID 18562)
-- Dependencies: 259
-- Data for Name: us_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_rules (id, rule, is_custom) FROM stdin;
\.


--
-- TOC entry 7382 (class 0 OID 19444)
-- Dependencies: 325
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_group (user_id, group_id, group_name, teacher_name) FROM stdin;
96	3	\N	\N
96	6	\N	\N
96	7	\N	\N
96	8	\N	\N
96	9	\N	\N
\.


--
-- TOC entry 7372 (class 0 OID 19313)
-- Dependencies: 315
-- Data for Name: users1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users1 (id, login, password, email, file, description, comments, recipient_id, group_id) FROM stdin;
23	123	123	123	\N	\N	\N	\N	\N
24	123	123	123	\N	\N	\N	\N	\N
25	123	123	123	\N	\N	\N	\N	\N
26	123	123	123	\N	\N	\N	\N	\N
27	123	123	123	\N	\N	\N	\N	\N
28	123	123	123	\N	\N	\N	\N	\N
29	123	123	123	\N	\N	\N	\N	\N
30	123	123	123	\N	\N	\N	\N	\N
31	123	123	123	\N	\N	\N	\N	\N
32	123	123	123	\N	\N	\N	\N	\N
33	1234	1234	1234	\N	\N	\N	\N	\N
34	1234	1234	1234	\N	\N	\N	\N	\N
35	123	123	123	\N	\N	\N	\N	\N
36	123	123	123	\N	\N	\N	\N	\N
37	123	123	123	\N	\N	\N	\N	\N
38	123	123	123	\N	\N	\N	\N	\N
39	1341314	114	124	\N	\N	\N	\N	\N
40	213312123	213213	132312312213	\N	\N	\N	\N	\N
41	12345	12345	123	\N	\N	\N	\N	\N
42	6666	$2b$12$V4T4eF/GPe6bGBgN7g3g2.VvgFeyOtKWpmuu5mPgoG.sIKNFKmzmi	6666	\N	\N	\N	\N	\N
43	12345	12345	12345	jpg	\N	\N	\N	\N
44	12345	12345	12345	228460.jpg	\N	\N	\N	\N
45	login	$2b$12$7TXi1uDHEtmeLGNtTscH6eE4zkkz8ogh2/aaxnI3HZfbuV3ldY5Be	email	228460.jpg	\N	\N	\N	\N
46	123	$2b$12$pdGUQgiWEJIApzq9nnUWNOHhHY0hpptjICraZKygl5xx517V93jj6	123	jpg	\N	\N	\N	\N
47	123	$2b$12$ePB40GOl8/0YUYXFZOr19.RAyExUpb6U/868kTgv1B7DS10YNaNW6	123	228460.jpg	\N	\N	\N	\N
48	123	$2b$12$TeoieFGZ1/cJZ7l01Azl4euNbVPPTWN1ZEf5RTY9HAVVthmGYKQ6O	123	228460.jpg	\N	\N	\N	\N
49	123	$2b$12$cPkFqF6R2fo0kS3TOvd9/ewG0bb1fk58D/ZE4bNfaujOdvQJeH7hO	123	228460.jpg	\N	\N	\N	\N
50	123	$2b$12$0D0eu0fwz42FZ1XR7FgyA.fzUDumiSKwTRgpGTV3ozmM/Yiccfho.	123	jpg	\N	\N	\N	\N
51	123	$2b$12$.YA2XiHD9nSg93bVtsboIO8xkVZouHgOmUlkgCZGhOrAEic2On6zi	123	jpg	\N	\N	\N	\N
52	123	$2b$12$beLzlJ1/HEctf9ioHdXVdOMXAOmGINNYUtA2v5ZwNhCFSf.MrifVe	123	jpg	\N	\N	\N	\N
53	123	$2b$12$1slTwJCt8v5Y2lGPhH/0D.Mo6lHIFtj.iCgXDGVdeA3iKrH6NMd4a	123	jpg	\N	\N	\N	\N
54	6666	$2b$12$9duraombeyYrqOrv5yDqRO13Ye6UMVVFCvb4zqItQvqH7oWehoZL6	6666	jpg	\N	\N	\N	\N
55	123	$2b$12$0/M4jjs0X3qlCScbdTc8medAFPkbhtS0RJQ2xa63jHmxUkV/jKkoa	123	PNG	\N	\N	\N	\N
56	123	$2b$12$6Pbg5HxTGt0QXPQ8wREtSe8SRzKoFjjP3lKK5/iCODJBxgoxqOG1K	123	PNG	\N	\N	\N	\N
57	999	$2b$12$gRCSPcCpaMU56hZv6BpQNulY0W02SaJD.Ybntg6/lpe57h9rgeQ7e	999	jpg	\N	\N	\N	\N
58	123	$2b$12$A9sf2MHSQtV9jqVeZs0QSuBOytQ78i1MNiEfxT0wWW7FqiUXkqbwe	123	PNG	\N	\N	\N	\N
59	888	$2b$12$yvJqgQdGMGWp/qxaDaaje.KDAeUlDM54UR5kfQ9YwUWy69HZm65Ge	888	jpg	\N	\N	\N	\N
60	777	$2b$12$sZdgfq.DBCa.XLYH2mbiseks0CzW.Mg4T4ZDayLBw1TuPws/wuyk6	777	amnyam.jpg	\N	\N	\N	\N
73	misha5	$2b$12$oESx8i/lqvuwFXhWUxbf4uuiDE9wvTKVH51T90q5tDziP2a8EVKNG	misha5@gmail.com	static/avatars\\1634464728170974557.png	\N	\N	\N	\N
74	misha6	$2b$12$nL4AWYi6VZMEM.wBsGQ.Uuv2juZ4PSTBewktytZshDhCOmBCo/KYi	misha6@gmail.com	static/avatars\\HT2sJmX8yC8.jpg	\N	\N	\N	\N
75	misha7	$2b$12$5SGxuPyVQscwLyjxTb.EC.YppRF/nM1.IZCX9DVAVYoeFMyB61bQK	misha7@gmail.com	static/avatars\\Screenshot_2023-06-18-23-04-34-870_com.miui.gallery.jpg	\N	\N	\N	\N
76	misha8	$2b$12$yEoMAdBNGhwq1ZUHGlWXfO41ycUHPsHhmELp7k3UdfpyeMs8VaHIq	misha8@gmail.com	static/avatars/default_avatar.jpg	\N	\N	\N	\N
77	misha9	$2b$12$wYeIV3qHxhpPcYABuPE8COSBH0ADypdjE7fp7WUkT0oLqN1r/uEI2	misha9@gmail.com	22222.PNG	\N	\N	\N	\N
78	misha10	$2b$12$/QEeatOHkajK.6eYeaLsG.oFQHd67H8DLojB3Ljv5szao3pFh.x36	misha10@gmail.com	default_avatar.jpg	\N	\N	\N	\N
79	misha10	$2b$12$9cskD5BMGNZzzyPlz9dtwem8rjWQH7HorJKe9Q.8f6CoT11cHuSa6	misha10@gmail.com	default_avatar.jpg	\N	\N	\N	\N
80	misha11	$2b$12$d7mOx/CpsSY0W7.q9nMQXO7VYPHDtzq9qiIPchhcC/4D.mXZXmndO	misha11@gmail.com	default_avatar.jpg	\N	\N	\N	\N
81	misha12	$2b$12$eiqhBfkG6KGR6w5Ew.wFPufwwfWmj4gmX.FMdYnCzipGUL5XWIn4u	misha12@gmail.com	\N	\N	\N	\N	\N
82	misha13	$2b$12$hdEii6ReCgVeS.N/Se82XuxFSeUZAscn.m0c4cK2xDuMt12tKkxV.	misha13@gmail.com	default-avatar.png	\N	\N	\N	\N
83	misha14	$2b$12$HSo0M3EbSo5boohzzVY95em9hM2ViByRLP6Pjebkt.hVYj/wW1V9K	misha14@gmail.com	anime-naruto-sharingan-chernyy.jpg	\N	\N	\N	\N
61	987	$2b$12$jpe9Q8iap/qrRQEVHuKuNuqmjKeDfEKaNzKoLWGizIuKaWDGVrlXO	987	amnyam.jpg	\N	\N	\N	\N
84	login	$2b$12$lcjBNmEvMFmxN9DXvjTHsery6fyMzsz0zkk80YJEwoGfc/VP5txvi	email@gmail.com	default-avatar.png	\N	\N	\N	\N
85	login	$2b$12$A5UM2gkJ1yDyyaMAiYq02O7flhUxZtIkLxjGlFE1dwTiy5SfLkx3y	email@gmail.com	PNG	\N	\N	\N	\N
86	Nikolay	$2b$12$/gbYnCq6jyaq7qr9qMD14OGW8t0sy8zzrtxSxorOaHHiug0J375EG	Nikolay@yandex.ru	PNG	\N	\N	\N	\N
87	Ivan	$2b$12$8Lg5kSAGVYWUL8vt3dHefuU84chWklPvWnEQU2muhZsOdi1A4FhyO	Ivan@yandex.ru	PNG	\N	\N	\N	\N
88	123	$2b$12$UTmTF1xH0wSY.2fg0zaBv.t99tHx7WFCTjX6beMGS3J0UQ01vQkjK	123	default-avatar.png	\N	\N	\N	\N
89	12341	$2b$12$K1Tt7Sbs7EUIIj4fI7RfVeZ2n3bN0zA2yG1AghsnnQW4kMFntHKIy	12341	default-avatar.png	\N	\N	\N	\N
62	999999999999999	$2b$12$dF6uvfg7TB2i5zhmH4/xtOZT6RyQfBwwpCx7enjxBoZd.PVnYsoK2	999999999999999	PNG	\N	\N	\N	\N
63	Egor	$2b$12$CtXiiZUfbHR9rNBxHD9n4e6T.zd.TtrdyDWMU18A8GjnibMI3hJHm	Mashakov0707@yandex.ru	photo_2023-04-20_21-56-06.jpg	\N	\N	\N	\N
64	VladimirT	$2b$12$/uODEi9dEE2rv7FQi.OVq.gQOM9aEqRMRUOM85DpocY140TX.YHZ2	Titchev2007@yandex.ru	IMG_20230925_105616.jpg	\N	\N	\N	\N
65	AlexanderL	$2b$12$upBAU9KDTsZry0W3.8gE4OjUGyPPTuHMD3WQCFvtyfzncoYXWmqne	LoyAlexander111@yandex.ru	IMG_20230802_190006.jpg	\N	\N	\N	\N
66	логин	$2b$12$fXo38ZCjPFlU07ON/qu7ZeLDfFT45Y4fCiucA.DH7m6YVD01z7GHW	ывпы	CCI20112023.jpg	\N	\N	\N	\N
67	логин	$2b$12$SV0aVoT7V0PfN5rnEqyPe.oOmiyy/nQlER86xzTEmOoP.YczGEVKe	вапаппав	CCI20112023.jpg	\N	\N	\N	\N
68	Misha	$2b$12$jNpvaHP8PR/0minq/t6tUOZUhQELiuJmjC.e9MQlobWcU6pcIoNGm	Misha@gmail.com	static/avatars\\I48zujt9RvE.jpg	\N	\N	\N	\N
69	misha	$2b$12$p6umZDscESFUTAffzx8xhe1leal5BY/fk0BcucT4ij8RRi15rRYqa	misha@gmail.com	static/avatars\\Screenshot_2023-06-18-23-04-55-024_com.miui.gallery.jpg	\N	\N	\N	\N
70	misha2	$2b$12$WslX3UaKHhazjyw2VambvOJs..Zvx0GuhN//CsrMTFb2wGY4Xf7A.	misha2@gmail.com	static/avatars\\photo_2023-04-20_21-56-06.jpg	\N	\N	\N	\N
71	misha3	$2b$12$.C/bKP5Pj26xhH.GQ00bWu6c6gthetVVes4WKYt7zs9FIZsG4HG9C	misha3@gmail.com	static/avatars\\228460.jpg	\N	\N	\N	\N
72	misha4	$2b$12$46BTS7nIUrv0Rk8CK.10nef1rFCU/ZAY9ieP4jJqapqN7Rqw7K2Ii	misha4@gmail.com	static/avatars\\I48zujt9RvE.jpg	\N	\N	\N	\N
90	12341	$2b$12$Di3irVLVmTHAdcRroB4Ql.zl8.7Giv76FJWozKhMLNX0giwS0IqAa	12341	default-avatar.png	\N	\N	\N	\N
91	677	$2b$12$D3I3q92TtJ1TXahWtKq2Xuyr1h8MT8ijVGTNblMVamRjOJZCrISpu	677	7e40cfc5-bc1d-4f31-ba09-e9aeb48bb48b.jpg	\N	\N	\N	\N
93	0000	$2b$12$ux3uelt3keJcZ2FT1c2j2.LEenKY/djuC11R/R44KupHSWSWVvzk.	0000	\N	\N	\N	\N	\N
94	990	$2b$12$VmEXDKjc8iMK4sN7K70GFepVCZiiKMWxdqZL9fk/BfKW6FFr8mpL.	990	\N	\N	\N	\N	\N
95	990	$2b$12$NV.8oAZTJxKWqMAKVavKNuCcZ/rUzC4e7tRhkb/7k1axI15rOJeBG	990	\N	\N	\N	\N	\N
97	776	$2b$12$vFN1b.3KvvsbzCX6DJC2PuqNfDJXnprO83mQTm4EvqTWWeBBHBwte	776	\N		[]	\N	\N
92	776	$2b$12$AsbIvgFmL.txQWlq/lIyu.rSQ/WbL4JQQYFSs44p/HidZyhyKKb2m	776	5.PNG	Здесь можно оставить описание профиля	\N	\N	\N
96	887	$2b$12$mr7J1TSiqMyjp0/IFA9ZW.xxJtec0PHc/U6ufBMWB4mZGWyQWCJN.	887	2.PNG	описание профиля ограничено и пааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааа	\N	\N	\N
99	990	$2b$12$GZemlURSPJ5bT6o6Jl6eUOHHg1Pi6rDhojEklqcbdDp1nlLRiK8EK	990	app\\static\\avatars\\d6165c932ccd0faf5334f35a45066829.jpg		[]	\N	\N
100	9988	$2b$12$pqTU0ig6954X1mpDHy.EjeQ6Lek5uI/KhmTd8VfFme/L071kcP57i	9988	app\\static\\avatars\\d6165c932ccd0faf5334f35a45066829.jpg		[]	\N	\N
101	665	$2b$12$dlbS8zxEPKGCvDdKzlrt6e5b13x.CxLxRDscP8vHX9M42LXB/MzKm	665	HT2sJmX8yC8.jpg		[]	\N	\N
\.


--
-- TOC entry 7148 (class 0 OID 18729)
-- Dependencies: 263
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- TOC entry 7149 (class 0 OID 19061)
-- Dependencies: 308
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 7150 (class 0 OID 19071)
-- Dependencies: 310
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 7151 (class 0 OID 19081)
-- Dependencies: 312
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- TOC entry 7142 (class 0 OID 18364)
-- Dependencies: 248
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- TOC entry 7143 (class 0 OID 18376)
-- Dependencies: 249
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- TOC entry 7408 (class 0 OID 0)
-- Dependencies: 316
-- Name: article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_id_seq', 51, true);


--
-- TOC entry 7409 (class 0 OID 0)
-- Dependencies: 319
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 21, true);


--
-- TOC entry 7410 (class 0 OID 0)
-- Dependencies: 323
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 11, true);


--
-- TOC entry 7411 (class 0 OID 0)
-- Dependencies: 321
-- Name: like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.like_id_seq', 57, true);


--
-- TOC entry 7412 (class 0 OID 0)
-- Dependencies: 318
-- Name: users1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users1_id_seq', 101, true);


--
-- TOC entry 7413 (class 0 OID 0)
-- Dependencies: 247
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: postgres
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


--
-- TOC entry 7205 (class 2606 OID 19330)
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);


--
-- TOC entry 7207 (class 2606 OID 19403)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- TOC entry 7209 (class 2606 OID 19431)
-- Name: groups groups_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_name_key UNIQUE (name);


--
-- TOC entry 7211 (class 2606 OID 19429)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 7203 (class 2606 OID 19551)
-- Name: users1 unique_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1
    ADD CONSTRAINT unique_user_id UNIQUE (id);


--
-- TOC entry 7213 (class 2606 OID 19448)
-- Name: user_group user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (user_id, group_id);


--
-- TOC entry 7216 (class 2606 OID 19409)
-- Name: comment comment_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- TOC entry 7217 (class 2606 OID 19557)
-- Name: comment comment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);


--
-- TOC entry 7218 (class 2606 OID 19577)
-- Name: groups groups_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_teacher_id_fkey FOREIGN KEY (author_id) REFERENCES public.users1(id);


--
-- TOC entry 7219 (class 2606 OID 19454)
-- Name: user_group user_group_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 7220 (class 2606 OID 19562)
-- Name: user_group user_group_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);


--
-- TOC entry 7214 (class 2606 OID 19434)
-- Name: users1 users1_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1
    ADD CONSTRAINT users1_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 7215 (class 2606 OID 19552)
-- Name: users1 users1_recipient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1
    ADD CONSTRAINT users1_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.users1(id);


-- Completed on 2024-03-21 19:02:36

--
-- PostgreSQL database dump complete
--

