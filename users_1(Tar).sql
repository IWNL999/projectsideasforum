toc.dat                                                                                             0000600 0004000 0002000 00000055325 14577055067 0014471 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                       |            users_1    16.1    16.1 \    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    19311    users_1    DATABASE     {   CREATE DATABASE users_1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE users_1;
                postgres    false                     2615    18722    tiger    SCHEMA        CREATE SCHEMA tiger;
    DROP SCHEMA tiger;
                postgres    false                     2615    18978 
   tiger_data    SCHEMA        CREATE SCHEMA tiger_data;
    DROP SCHEMA tiger_data;
                postgres    false                     2615    18361    topology    SCHEMA        CREATE SCHEMA topology;
    DROP SCHEMA topology;
                postgres    false         �           0    0    SCHEMA topology    COMMENT     9   COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';
                   postgres    false    20                     3079    18528    address_standardizer 	   EXTENSION     H   CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;
 %   DROP EXTENSION address_standardizer;
                   false         �           0    0    EXTENSION address_standardizer    COMMENT     �   COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';
                        false    6                     3079    18536    address_standardizer_data_us 	   EXTENSION     P   CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us WITH SCHEMA public;
 -   DROP EXTENSION address_standardizer_data_us;
                   false         �           0    0 &   EXTENSION address_standardizer_data_us    COMMENT     `   COMMENT ON EXTENSION address_standardizer_data_us IS 'Address Standardizer US dataset example';
                        false    7                     3079    18710    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                   false         �           0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                        false    12                     3079    19122    h3 	   EXTENSION     6   CREATE EXTENSION IF NOT EXISTS h3 WITH SCHEMA public;
    DROP EXTENSION h3;
                   false         �           0    0    EXTENSION h3    COMMENT     9   COMMENT ON EXTENSION h3 IS 'H3 bindings for PostgreSQL';
                        false    14                     3079    16399    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false         �           0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    2                     3079    17475    postgis_raster 	   EXTENSION     B   CREATE EXTENSION IF NOT EXISTS postgis_raster WITH SCHEMA public;
    DROP EXTENSION postgis_raster;
                   false    2         �           0    0    EXTENSION postgis_raster    COMMENT     M   COMMENT ON EXTENSION postgis_raster IS 'PostGIS raster types and functions';
                        false    3                     3079    19236 
   h3_postgis 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS h3_postgis WITH SCHEMA public;
    DROP EXTENSION h3_postgis;
                   false    3    14    2         �           0    0    EXTENSION h3_postgis    COMMENT     =   COMMENT ON EXTENSION h3_postgis IS 'H3 PostGIS integration';
                        false    15                     3079    18704    ogr_fdw 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS ogr_fdw WITH SCHEMA public;
    DROP EXTENSION ogr_fdw;
                   false         �           0    0    EXTENSION ogr_fdw    COMMENT     L   COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';
                        false    11                     3079    18032 	   pgrouting 	   EXTENSION     =   CREATE EXTENSION IF NOT EXISTS pgrouting WITH SCHEMA public;
    DROP EXTENSION pgrouting;
                   false    2         �           0    0    EXTENSION pgrouting    COMMENT     9   COMMENT ON EXTENSION pgrouting IS 'pgRouting Extension';
                        false    4         	            3079    18598 
   pointcloud 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS pointcloud WITH SCHEMA public;
    DROP EXTENSION pointcloud;
                   false         �           0    0    EXTENSION pointcloud    COMMENT     G   COMMENT ON EXTENSION pointcloud IS 'data type for lidar point clouds';
                        false    9         
            3079    18693    pointcloud_postgis 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS pointcloud_postgis WITH SCHEMA public;
 #   DROP EXTENSION pointcloud_postgis;
                   false    9    2         �           0    0    EXTENSION pointcloud_postgis    COMMENT     n   COMMENT ON EXTENSION pointcloud_postgis IS 'integration for pointcloud LIDAR data and PostGIS geometry data';
                        false    10                     3079    18573    postgis_sfcgal 	   EXTENSION     B   CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;
    DROP EXTENSION postgis_sfcgal;
                   false    2         �           0    0    EXTENSION postgis_sfcgal    COMMENT     C   COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';
                        false    8                     3079    18723    postgis_tiger_geocoder 	   EXTENSION     I   CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;
 '   DROP EXTENSION postgis_tiger_geocoder;
                   false    2    21    12         �           0    0     EXTENSION postgis_tiger_geocoder    COMMENT     ^   COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';
                        false    13                     3079    18362    postgis_topology 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;
 !   DROP EXTENSION postgis_topology;
                   false    2    20         �           0    0    EXTENSION postgis_topology    COMMENT     Y   COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';
                        false    5         =           1259    19323    article    TABLE     <  CREATE TABLE public.article (
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
    DROP TABLE public.article;
       public         heap    postgres    false         <           1259    19322    article_id_seq    SEQUENCE     �   CREATE SEQUENCE public.article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.article_id_seq;
       public          postgres    false    317         �           0    0    article_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.article_id_seq OWNED BY public.article.id;
          public          postgres    false    316         @           1259    19396    comment    TABLE     �   CREATE TABLE public.comment (
    id integer NOT NULL,
    text text NOT NULL,
    date timestamp without time zone,
    user_id integer NOT NULL,
    article_id integer NOT NULL
);
    DROP TABLE public.comment;
       public         heap    postgres    false         ?           1259    19395    comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.comment_id_seq;
       public          postgres    false    320         �           0    0    comment_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;
          public          postgres    false    319         D           1259    19424    groups    TABLE     �   CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    author_id integer,
    posts text,
    join_code character varying(20) DEFAULT 'default_code'::character varying NOT NULL
);
    DROP TABLE public.groups;
       public         heap    postgres    false         C           1259    19423    groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public          postgres    false    324         �           0    0    groups_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;
          public          postgres    false    323         B           1259    19415    like    TABLE     g   CREATE TABLE public."like" (
    id integer NOT NULL,
    user_id integer,
    recipient_id integer
);
    DROP TABLE public."like";
       public         heap    postgres    false         A           1259    19414    like_id_seq    SEQUENCE     �   ALTER TABLE public."like" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.like_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    322         E           1259    19444 
   user_group    TABLE     �   CREATE TABLE public.user_group (
    user_id integer NOT NULL,
    group_id integer NOT NULL,
    group_name character varying(255),
    teacher_name character varying(255)
);
    DROP TABLE public.user_group;
       public         heap    postgres    false         ;           1259    19313    users1    TABLE     .  CREATE TABLE public.users1 (
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
    DROP TABLE public.users1;
       public         heap    postgres    false         �           0    0    TABLE users1    COMMENT     a   COMMENT ON TABLE public.users1 IS 'таблица с данными пользователей';
          public          postgres    false    315         >           1259    19331    users1_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users1_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.users1_id_seq;
       public          postgres    false    315         �           0    0    users1_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.users1_id_seq OWNED BY public.users1.id;
          public          postgres    false    318                     2604    19326 
   article id    DEFAULT     h   ALTER TABLE ONLY public.article ALTER COLUMN id SET DEFAULT nextval('public.article_id_seq'::regclass);
 9   ALTER TABLE public.article ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    317    316    317                    2604    19399 
   comment id    DEFAULT     h   ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);
 9   ALTER TABLE public.comment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    319    320    320                    2604    19427 	   groups id    DEFAULT     f   ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    323    324    324         �           2604    19549 	   users1 id    DEFAULT     f   ALTER TABLE ONLY public.users1 ALTER COLUMN id SET DEFAULT nextval('public.users1_id_seq'::regclass);
 8   ALTER TABLE public.users1 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    318    315         �          0    19323    article 
   TABLE DATA           `   COPY public.article (id, title, intro, text, date, user_id, file, hidden, group_id) FROM stdin;
    public          postgres    false    317       7374.dat �          0    19396    comment 
   TABLE DATA           F   COPY public.comment (id, text, date, user_id, article_id) FROM stdin;
    public          postgres    false    320       7377.dat �          0    19424    groups 
   TABLE DATA           G   COPY public.groups (id, name, author_id, posts, join_code) FROM stdin;
    public          postgres    false    324       7381.dat �          0    19415    like 
   TABLE DATA           ;   COPY public."like" (id, user_id, recipient_id) FROM stdin;
    public          postgres    false    322       7379.dat �          0    18600    pointcloud_formats 
   TABLE DATA           @   COPY public.pointcloud_formats (pcid, srid, schema) FROM stdin;
    public          postgres    false    260       7147.dat �          0    16717    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    233       7140.dat �          0    18550    us_gaz 
   TABLE DATA           J   COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
    public          postgres    false    257       7146.dat �          0    18538    us_lex 
   TABLE DATA           J   COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
    public          postgres    false    255       7144.dat �          0    18562    us_rules 
   TABLE DATA           7   COPY public.us_rules (id, rule, is_custom) FROM stdin;
    public          postgres    false    259       7145.dat �          0    19444 
   user_group 
   TABLE DATA           Q   COPY public.user_group (user_id, group_id, group_name, teacher_name) FROM stdin;
    public          postgres    false    325       7382.dat �          0    19313    users1 
   TABLE DATA           q   COPY public.users1 (id, login, password, email, file, description, comments, recipient_id, group_id) FROM stdin;
    public          postgres    false    315       7372.dat �          0    18729    geocode_settings 
   TABLE DATA           T   COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
    tiger          postgres    false    263       7148.dat �          0    19061    pagc_gaz 
   TABLE DATA           K   COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger          postgres    false    308       7149.dat �          0    19071    pagc_lex 
   TABLE DATA           K   COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger          postgres    false    310       7150.dat �          0    19081 
   pagc_rules 
   TABLE DATA           8   COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
    tiger          postgres    false    312       7151.dat �          0    18364    topology 
   TABLE DATA           G   COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
    topology          postgres    false    248       7142.dat �          0    18376    layer 
   TABLE DATA           �   COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
    topology          postgres    false    249       7143.dat �           0    0    article_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.article_id_seq', 51, true);
          public          postgres    false    316         �           0    0    comment_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.comment_id_seq', 21, true);
          public          postgres    false    319         �           0    0    groups_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.groups_id_seq', 11, true);
          public          postgres    false    323         �           0    0    like_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.like_id_seq', 57, true);
          public          postgres    false    321         �           0    0    users1_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.users1_id_seq', 101, true);
          public          postgres    false    318         �           0    0    topology_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);
          topology          postgres    false    247         %           2606    19330    article article_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.article DROP CONSTRAINT article_pkey;
       public            postgres    false    317         '           2606    19403    comment comment_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            postgres    false    320         )           2606    19431    groups groups_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_name_key;
       public            postgres    false    324         +           2606    19429    groups groups_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public            postgres    false    324         #           2606    19551    users1 unique_user_id 
   CONSTRAINT     N   ALTER TABLE ONLY public.users1
    ADD CONSTRAINT unique_user_id UNIQUE (id);
 ?   ALTER TABLE ONLY public.users1 DROP CONSTRAINT unique_user_id;
       public            postgres    false    315         -           2606    19448    user_group user_group_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (user_id, group_id);
 D   ALTER TABLE ONLY public.user_group DROP CONSTRAINT user_group_pkey;
       public            postgres    false    325    325         0           2606    19409    comment comment_article_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.article(id);
 I   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_article_id_fkey;
       public          postgres    false    7205    320    317         1           2606    19557    comment comment_user_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);
 F   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_user_id_fkey;
       public          postgres    false    320    7203    315         2           2606    19577    groups groups_teacher_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_teacher_id_fkey FOREIGN KEY (author_id) REFERENCES public.users1(id);
 G   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_teacher_id_fkey;
       public          postgres    false    324    315    7203         3           2606    19454 #   user_group user_group_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);
 M   ALTER TABLE ONLY public.user_group DROP CONSTRAINT user_group_group_id_fkey;
       public          postgres    false    325    324    7211         4           2606    19562 "   user_group user_group_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);
 L   ALTER TABLE ONLY public.user_group DROP CONSTRAINT user_group_user_id_fkey;
       public          postgres    false    325    7203    315         .           2606    19434    users1 users1_group_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.users1
    ADD CONSTRAINT users1_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);
 E   ALTER TABLE ONLY public.users1 DROP CONSTRAINT users1_group_id_fkey;
       public          postgres    false    324    315    7211         /           2606    19552    users1 users1_recipient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users1
    ADD CONSTRAINT users1_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.users1(id);
 I   ALTER TABLE ONLY public.users1 DROP CONSTRAINT users1_recipient_id_fkey;
       public          postgres    false    7203    315    315                                                                                                                                                                                                                                                                                                                   7374.dat                                                                                            0000600 0004000 0002000 00000002321 14577055067 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	123	123	123	2023-12-07 19:14:45.469628	42	\N	f	\N
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


                                                                                                                                                                                                                                                                                                               7377.dat                                                                                            0000600 0004000 0002000 00000000373 14577055067 0014304 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        11	комментарий	2024-01-25 19:24:28.789345	96	11
12	насколько твой мангал умный?	2024-01-25 19:26:32.499312	96	13
19	Привет	2024-02-08 05:44:08.291672	96	12
21	рапапр	2024-03-20 17:22:51.354459	96	51
\.


                                                                                                                                                                                                                                                                     7381.dat                                                                                            0000600 0004000 0002000 00000000265 14577055067 0014277 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	gfhdgfh	96	\N	default_value
3	название	96	\N	default_value
6	5	96	\N	default_value
7	hujvhb	96	\N	default_value
8	5 группа	96	\N	PPd1MPhU
9	bbbb	96	\N	QFkBQeNA
\.


                                                                                                                                                                                                                                                                                                                                           7379.dat                                                                                            0000600 0004000 0002000 00000000203 14577055067 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	96	65
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


                                                                                                                                                                                                                                                                                                                                                                                             7147.dat                                                                                            0000600 0004000 0002000 00000000005 14577055067 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7140.dat                                                                                            0000600 0004000 0002000 00000000005 14577055067 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7146.dat                                                                                            0000600 0004000 0002000 00000000005 14577055067 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7144.dat                                                                                            0000600 0004000 0002000 00000000005 14577055067 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7145.dat                                                                                            0000600 0004000 0002000 00000000005 14577055067 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7382.dat                                                                                            0000600 0004000 0002000 00000000074 14577055067 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        96	3	\N	\N
96	6	\N	\N
96	7	\N	\N
96	8	\N	\N
96	9	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                    7372.dat                                                                                            0000600 0004000 0002000 00000016154 14577055067 0014303 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        23	123	123	123	\N	\N	\N	\N	\N
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


                                                                                                                                                                                                                                                                                                                                                                                                                    7148.dat                                                                                            0000600 0004000 0002000 00000000005 14577055067 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7149.dat                                                                                            0000600 0004000 0002000 00000000005 14577055067 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7150.dat                                                                                            0000600 0004000 0002000 00000000005 14577055067 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7151.dat                                                                                            0000600 0004000 0002000 00000000005 14577055067 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7142.dat                                                                                            0000600 0004000 0002000 00000000005 14577055067 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7143.dat                                                                                            0000600 0004000 0002000 00000000005 14577055067 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000045006 14577055067 0015411 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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

DROP DATABASE users_1;
--
-- Name: users_1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE users_1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE users_1 OWNER TO postgres;

\connect users_1

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
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- Name: address_standardizer; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;


--
-- Name: EXTENSION address_standardizer; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';


--
-- Name: address_standardizer_data_us; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us WITH SCHEMA public;


--
-- Name: EXTENSION address_standardizer_data_us; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer_data_us IS 'Address Standardizer US dataset example';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: h3; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS h3 WITH SCHEMA public;


--
-- Name: EXTENSION h3; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION h3 IS 'H3 bindings for PostgreSQL';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: postgis_raster; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_raster WITH SCHEMA public;


--
-- Name: EXTENSION postgis_raster; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_raster IS 'PostGIS raster types and functions';


--
-- Name: h3_postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS h3_postgis WITH SCHEMA public;


--
-- Name: EXTENSION h3_postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION h3_postgis IS 'H3 PostGIS integration';


--
-- Name: ogr_fdw; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ogr_fdw WITH SCHEMA public;


--
-- Name: EXTENSION ogr_fdw; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';


--
-- Name: pgrouting; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrouting WITH SCHEMA public;


--
-- Name: EXTENSION pgrouting; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgrouting IS 'pgRouting Extension';


--
-- Name: pointcloud; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pointcloud WITH SCHEMA public;


--
-- Name: EXTENSION pointcloud; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pointcloud IS 'data type for lidar point clouds';


--
-- Name: pointcloud_postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pointcloud_postgis WITH SCHEMA public;


--
-- Name: EXTENSION pointcloud_postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pointcloud_postgis IS 'integration for pointcloud LIDAR data and PostGIS geometry data';


--
-- Name: postgis_sfcgal; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;


--
-- Name: EXTENSION postgis_sfcgal; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';


--
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
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
-- Name: article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_id_seq OWNED BY public.article.id;


--
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
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
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
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."like" (
    id integer NOT NULL,
    user_id integer,
    recipient_id integer
);


ALTER TABLE public."like" OWNER TO postgres;

--
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
-- Name: TABLE users1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.users1 IS 'таблица с данными пользователей';


--
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
-- Name: users1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users1_id_seq OWNED BY public.users1.id;


--
-- Name: article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article ALTER COLUMN id SET DEFAULT nextval('public.article_id_seq'::regclass);


--
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: users1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1 ALTER COLUMN id SET DEFAULT nextval('public.users1_id_seq'::regclass);


--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article (id, title, intro, text, date, user_id, file, hidden, group_id) FROM stdin;
\.
COPY public.article (id, title, intro, text, date, user_id, file, hidden, group_id) FROM '$$PATH$$/7374.dat';

--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, text, date, user_id, article_id) FROM stdin;
\.
COPY public.comment (id, text, date, user_id, article_id) FROM '$$PATH$$/7377.dat';

--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, name, author_id, posts, join_code) FROM stdin;
\.
COPY public.groups (id, name, author_id, posts, join_code) FROM '$$PATH$$/7381.dat';

--
-- Data for Name: like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."like" (id, user_id, recipient_id) FROM stdin;
\.
COPY public."like" (id, user_id, recipient_id) FROM '$$PATH$$/7379.dat';

--
-- Data for Name: pointcloud_formats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pointcloud_formats (pcid, srid, schema) FROM stdin;
\.
COPY public.pointcloud_formats (pcid, srid, schema) FROM '$$PATH$$/7147.dat';

--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.
COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM '$$PATH$$/7140.dat';

--
-- Data for Name: us_gaz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.
COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM '$$PATH$$/7146.dat';

--
-- Data for Name: us_lex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.
COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM '$$PATH$$/7144.dat';

--
-- Data for Name: us_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_rules (id, rule, is_custom) FROM stdin;
\.
COPY public.us_rules (id, rule, is_custom) FROM '$$PATH$$/7145.dat';

--
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_group (user_id, group_id, group_name, teacher_name) FROM stdin;
\.
COPY public.user_group (user_id, group_id, group_name, teacher_name) FROM '$$PATH$$/7382.dat';

--
-- Data for Name: users1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users1 (id, login, password, email, file, description, comments, recipient_id, group_id) FROM stdin;
\.
COPY public.users1 (id, login, password, email, file, description, comments, recipient_id, group_id) FROM '$$PATH$$/7372.dat';

--
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.
COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM '$$PATH$$/7148.dat';

--
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.
COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM '$$PATH$$/7149.dat';

--
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.
COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM '$$PATH$$/7150.dat';

--
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.
COPY tiger.pagc_rules (id, rule, is_custom) FROM '$$PATH$$/7151.dat';

--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.
COPY topology.topology (id, name, srid, "precision", hasz) FROM '$$PATH$$/7142.dat';

--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.
COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM '$$PATH$$/7143.dat';

--
-- Name: article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_id_seq', 51, true);


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 21, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 11, true);


--
-- Name: like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.like_id_seq', 57, true);


--
-- Name: users1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users1_id_seq', 101, true);


--
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: postgres
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


--
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: groups groups_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_name_key UNIQUE (name);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: users1 unique_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1
    ADD CONSTRAINT unique_user_id UNIQUE (id);


--
-- Name: user_group user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (user_id, group_id);


--
-- Name: comment comment_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- Name: comment comment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);


--
-- Name: groups groups_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_teacher_id_fkey FOREIGN KEY (author_id) REFERENCES public.users1(id);


--
-- Name: user_group user_group_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: user_group user_group_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);


--
-- Name: users1 users1_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1
    ADD CONSTRAINT users1_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: users1 users1_recipient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1
    ADD CONSTRAINT users1_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.users1(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          