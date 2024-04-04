toc.dat                                                                                             0000600 0004000 0002000 00000077770 14603425165 0014467 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                       |            users_1    16.1    16.1 {               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    19311    users_1    DATABASE     {   CREATE DATABASE users_1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE users_1;
                postgres    false                     2615    18722    tiger    SCHEMA        CREATE SCHEMA tiger;
    DROP SCHEMA tiger;
                postgres    false                     2615    18978 
   tiger_data    SCHEMA        CREATE SCHEMA tiger_data;
    DROP SCHEMA tiger_data;
                postgres    false                     2615    18361    topology    SCHEMA        CREATE SCHEMA topology;
    DROP SCHEMA topology;
                postgres    false                    0    0    SCHEMA topology    COMMENT     9   COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';
                   postgres    false    20                     3079    18528    address_standardizer 	   EXTENSION     H   CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;
 %   DROP EXTENSION address_standardizer;
                   false                    0    0    EXTENSION address_standardizer    COMMENT     �   COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';
                        false    6                     3079    18536    address_standardizer_data_us 	   EXTENSION     P   CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us WITH SCHEMA public;
 -   DROP EXTENSION address_standardizer_data_us;
                   false                    0    0 &   EXTENSION address_standardizer_data_us    COMMENT     `   COMMENT ON EXTENSION address_standardizer_data_us IS 'Address Standardizer US dataset example';
                        false    7                     3079    18710    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                   false                    0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                        false    12                     3079    19122    h3 	   EXTENSION     6   CREATE EXTENSION IF NOT EXISTS h3 WITH SCHEMA public;
    DROP EXTENSION h3;
                   false                    0    0    EXTENSION h3    COMMENT     9   COMMENT ON EXTENSION h3 IS 'H3 bindings for PostgreSQL';
                        false    14                     3079    16399    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false                    0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    2                     3079    17475    postgis_raster 	   EXTENSION     B   CREATE EXTENSION IF NOT EXISTS postgis_raster WITH SCHEMA public;
    DROP EXTENSION postgis_raster;
                   false    2                    0    0    EXTENSION postgis_raster    COMMENT     M   COMMENT ON EXTENSION postgis_raster IS 'PostGIS raster types and functions';
                        false    3                     3079    19236 
   h3_postgis 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS h3_postgis WITH SCHEMA public;
    DROP EXTENSION h3_postgis;
                   false    2    14    3                    0    0    EXTENSION h3_postgis    COMMENT     =   COMMENT ON EXTENSION h3_postgis IS 'H3 PostGIS integration';
                        false    15                     3079    18704    ogr_fdw 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS ogr_fdw WITH SCHEMA public;
    DROP EXTENSION ogr_fdw;
                   false                    0    0    EXTENSION ogr_fdw    COMMENT     L   COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';
                        false    11                     3079    18032 	   pgrouting 	   EXTENSION     =   CREATE EXTENSION IF NOT EXISTS pgrouting WITH SCHEMA public;
    DROP EXTENSION pgrouting;
                   false    2                    0    0    EXTENSION pgrouting    COMMENT     9   COMMENT ON EXTENSION pgrouting IS 'pgRouting Extension';
                        false    4         	            3079    18598 
   pointcloud 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS pointcloud WITH SCHEMA public;
    DROP EXTENSION pointcloud;
                   false                    0    0    EXTENSION pointcloud    COMMENT     G   COMMENT ON EXTENSION pointcloud IS 'data type for lidar point clouds';
                        false    9         
            3079    18693    pointcloud_postgis 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS pointcloud_postgis WITH SCHEMA public;
 #   DROP EXTENSION pointcloud_postgis;
                   false    9    2                    0    0    EXTENSION pointcloud_postgis    COMMENT     n   COMMENT ON EXTENSION pointcloud_postgis IS 'integration for pointcloud LIDAR data and PostGIS geometry data';
                        false    10                     3079    18573    postgis_sfcgal 	   EXTENSION     B   CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;
    DROP EXTENSION postgis_sfcgal;
                   false    2                    0    0    EXTENSION postgis_sfcgal    COMMENT     C   COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';
                        false    8                     3079    18723    postgis_tiger_geocoder 	   EXTENSION     I   CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;
 '   DROP EXTENSION postgis_tiger_geocoder;
                   false    2    21    12                    0    0     EXTENSION postgis_tiger_geocoder    COMMENT     ^   COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';
                        false    13                     3079    18362    postgis_topology 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;
 !   DROP EXTENSION postgis_topology;
                   false    2    20                    0    0    EXTENSION postgis_topology    COMMENT     Y   COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';
                        false    5         J           1259    22648    admins    TABLE     V   CREATE TABLE public.admins (
    id integer NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.admins;
       public         heap    postgres    false         I           1259    22647    admins_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.admins_id_seq;
       public          postgres    false    330                    0    0    admins_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;
          public          postgres    false    329         =           1259    19323    article    TABLE     K  CREATE TABLE public.article (
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
    DROP TABLE public.article;
       public         heap    postgres    false         F           1259    22611    article_group_association    TABLE     r   CREATE TABLE public.article_group_association (
    article_id integer NOT NULL,
    group_id integer NOT NULL
);
 -   DROP TABLE public.article_group_association;
       public         heap    postgres    false         <           1259    19322    article_id_seq    SEQUENCE     �   CREATE SEQUENCE public.article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.article_id_seq;
       public          postgres    false    317                    0    0    article_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.article_id_seq OWNED BY public.article.id;
          public          postgres    false    316         L           1259    22665    banned_users    TABLE     �   CREATE TABLE public.banned_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    reason character varying(255) NOT NULL,
    banned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.banned_users;
       public         heap    postgres    false         K           1259    22664    banned_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.banned_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.banned_users_id_seq;
       public          postgres    false    332                     0    0    banned_users_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.banned_users_id_seq OWNED BY public.banned_users.id;
          public          postgres    false    331         @           1259    19396    comment    TABLE     �   CREATE TABLE public.comment (
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
       public          postgres    false    320         !           0    0    comment_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;
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
       public          postgres    false    324         "           0    0    groups_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;
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
            public          postgres    false    322         H           1259    22634 
   moderators    TABLE     Z   CREATE TABLE public.moderators (
    id integer NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.moderators;
       public         heap    postgres    false         G           1259    22633    moderators_id_seq    SEQUENCE     �   CREATE SEQUENCE public.moderators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.moderators_id_seq;
       public          postgres    false    328         #           0    0    moderators_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.moderators_id_seq OWNED BY public.moderators.id;
          public          postgres    false    327         E           1259    19444 
   user_group    TABLE     �   CREATE TABLE public.user_group (
    user_id integer NOT NULL,
    group_id integer NOT NULL,
    group_name character varying(255),
    teacher_name character varying(255)
);
    DROP TABLE public.user_group;
       public         heap    postgres    false         ;           1259    19313    users1    TABLE     �  CREATE TABLE public.users1 (
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
    DROP TABLE public.users1;
       public         heap    postgres    false         $           0    0    TABLE users1    COMMENT     a   COMMENT ON TABLE public.users1 IS 'таблица с данными пользователей';
          public          postgres    false    315         >           1259    19331    users1_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users1_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.users1_id_seq;
       public          postgres    false    315         %           0    0    users1_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.users1_id_seq OWNED BY public.users1.id;
          public          postgres    false    318                    2604    22651 	   admins id    DEFAULT     f   ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);
 8   ALTER TABLE public.admins ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    329    330    330                    2604    19326 
   article id    DEFAULT     h   ALTER TABLE ONLY public.article ALTER COLUMN id SET DEFAULT nextval('public.article_id_seq'::regclass);
 9   ALTER TABLE public.article ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    316    317    317                    2604    22668    banned_users id    DEFAULT     r   ALTER TABLE ONLY public.banned_users ALTER COLUMN id SET DEFAULT nextval('public.banned_users_id_seq'::regclass);
 >   ALTER TABLE public.banned_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    332    331    332                    2604    19399 
   comment id    DEFAULT     h   ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);
 9   ALTER TABLE public.comment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    319    320    320                    2604    19427 	   groups id    DEFAULT     f   ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    324    323    324                    2604    22637    moderators id    DEFAULT     n   ALTER TABLE ONLY public.moderators ALTER COLUMN id SET DEFAULT nextval('public.moderators_id_seq'::regclass);
 <   ALTER TABLE public.moderators ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    327    328    328                    2604    19549 	   users1 id    DEFAULT     f   ALTER TABLE ONLY public.users1 ALTER COLUMN id SET DEFAULT nextval('public.users1_id_seq'::regclass);
 8   ALTER TABLE public.users1 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    318    315                   0    22648    admins 
   TABLE DATA           -   COPY public.admins (id, user_id) FROM stdin;
    public          postgres    false    330       7430.dat �          0    19323    article 
   TABLE DATA           `   COPY public.article (id, title, intro, text, date, user_id, file, hidden, group_id) FROM stdin;
    public          postgres    false    317       7417.dat           0    22611    article_group_association 
   TABLE DATA           I   COPY public.article_group_association (article_id, group_id) FROM stdin;
    public          postgres    false    326       7426.dat           0    22665    banned_users 
   TABLE DATA           F   COPY public.banned_users (id, user_id, reason, banned_at) FROM stdin;
    public          postgres    false    332       7432.dat �          0    19396    comment 
   TABLE DATA           F   COPY public.comment (id, text, date, user_id, article_id) FROM stdin;
    public          postgres    false    320       7420.dat            0    19424    groups 
   TABLE DATA           G   COPY public.groups (id, name, author_id, posts, join_code) FROM stdin;
    public          postgres    false    324       7424.dat �          0    19415    like 
   TABLE DATA           ;   COPY public."like" (id, user_id, recipient_id) FROM stdin;
    public          postgres    false    322       7422.dat           0    22634 
   moderators 
   TABLE DATA           1   COPY public.moderators (id, user_id) FROM stdin;
    public          postgres    false    328       7428.dat �          0    18600    pointcloud_formats 
   TABLE DATA           @   COPY public.pointcloud_formats (pcid, srid, schema) FROM stdin;
    public          postgres    false    260       7166.dat �          0    16717    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    233       7159.dat �          0    18550    us_gaz 
   TABLE DATA           J   COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
    public          postgres    false    257       7165.dat �          0    18538    us_lex 
   TABLE DATA           J   COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
    public          postgres    false    255       7163.dat �          0    18562    us_rules 
   TABLE DATA           7   COPY public.us_rules (id, rule, is_custom) FROM stdin;
    public          postgres    false    259       7164.dat           0    19444 
   user_group 
   TABLE DATA           Q   COPY public.user_group (user_id, group_id, group_name, teacher_name) FROM stdin;
    public          postgres    false    325       7425.dat �          0    19313    users1 
   TABLE DATA           �   COPY public.users1 (id, login, password, email, file, description, comments, recipient_id, group_id, is_admin, is_moderator, is_banned) FROM stdin;
    public          postgres    false    315       7415.dat �          0    18729    geocode_settings 
   TABLE DATA           T   COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
    tiger          postgres    false    263       7167.dat            0    19061    pagc_gaz 
   TABLE DATA           K   COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger          postgres    false    308       7168.dat           0    19071    pagc_lex 
   TABLE DATA           K   COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger          postgres    false    310       7169.dat           0    19081 
   pagc_rules 
   TABLE DATA           8   COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
    tiger          postgres    false    312       7170.dat �          0    18364    topology 
   TABLE DATA           G   COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
    topology          postgres    false    248       7161.dat �          0    18376    layer 
   TABLE DATA           �   COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
    topology          postgres    false    249       7162.dat &           0    0    admins_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.admins_id_seq', 2, true);
          public          postgres    false    329         '           0    0    article_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.article_id_seq', 53, true);
          public          postgres    false    316         (           0    0    banned_users_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.banned_users_id_seq', 5, true);
          public          postgres    false    331         )           0    0    comment_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.comment_id_seq', 23, true);
          public          postgres    false    319         *           0    0    groups_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.groups_id_seq', 17, true);
          public          postgres    false    323         +           0    0    like_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.like_id_seq', 57, true);
          public          postgres    false    321         ,           0    0    moderators_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.moderators_id_seq', 4, true);
          public          postgres    false    327         -           0    0    users1_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.users1_id_seq', 101, true);
          public          postgres    false    318         .           0    0    topology_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);
          topology          postgres    false    247         O           2606    22653    admins admins_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_pkey;
       public            postgres    false    330         Q           2606    22655    admins admins_user_id_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_user_id_key UNIQUE (user_id);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_user_id_key;
       public            postgres    false    330         I           2606    22615 8   article_group_association article_group_association_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.article_group_association
    ADD CONSTRAINT article_group_association_pkey PRIMARY KEY (article_id, group_id);
 b   ALTER TABLE ONLY public.article_group_association DROP CONSTRAINT article_group_association_pkey;
       public            postgres    false    326    326         ?           2606    19330    article article_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.article DROP CONSTRAINT article_pkey;
       public            postgres    false    317         S           2606    22671    banned_users banned_users_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.banned_users
    ADD CONSTRAINT banned_users_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.banned_users DROP CONSTRAINT banned_users_pkey;
       public            postgres    false    332         A           2606    19403    comment comment_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            postgres    false    320         C           2606    19431    groups groups_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_name_key;
       public            postgres    false    324         E           2606    19429    groups groups_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public            postgres    false    324         K           2606    22639    moderators moderators_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT moderators_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.moderators DROP CONSTRAINT moderators_pkey;
       public            postgres    false    328         M           2606    22641 !   moderators moderators_user_id_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT moderators_user_id_key UNIQUE (user_id);
 K   ALTER TABLE ONLY public.moderators DROP CONSTRAINT moderators_user_id_key;
       public            postgres    false    328         =           2606    19551    users1 unique_user_id 
   CONSTRAINT     N   ALTER TABLE ONLY public.users1
    ADD CONSTRAINT unique_user_id UNIQUE (id);
 ?   ALTER TABLE ONLY public.users1 DROP CONSTRAINT unique_user_id;
       public            postgres    false    315         G           2606    19448    user_group user_group_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (user_id, group_id);
 D   ALTER TABLE ONLY public.user_group DROP CONSTRAINT user_group_pkey;
       public            postgres    false    325    325         ^           2606    22656    admins admins_user_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_user_id_fkey;
       public          postgres    false    7229    330    315         [           2606    22616 C   article_group_association article_group_association_article_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.article_group_association
    ADD CONSTRAINT article_group_association_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.article(id);
 m   ALTER TABLE ONLY public.article_group_association DROP CONSTRAINT article_group_association_article_id_fkey;
       public          postgres    false    7231    326    317         \           2606    22621 A   article_group_association article_group_association_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.article_group_association
    ADD CONSTRAINT article_group_association_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);
 k   ALTER TABLE ONLY public.article_group_association DROP CONSTRAINT article_group_association_group_id_fkey;
       public          postgres    false    324    326    7237         _           2606    22672 &   banned_users banned_users_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.banned_users
    ADD CONSTRAINT banned_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);
 P   ALTER TABLE ONLY public.banned_users DROP CONSTRAINT banned_users_user_id_fkey;
       public          postgres    false    7229    315    332         V           2606    19409    comment comment_article_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.article(id);
 I   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_article_id_fkey;
       public          postgres    false    317    320    7231         W           2606    19557    comment comment_user_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);
 F   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_user_id_fkey;
       public          postgres    false    320    315    7229         X           2606    19577    groups groups_teacher_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_teacher_id_fkey FOREIGN KEY (author_id) REFERENCES public.users1(id);
 G   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_teacher_id_fkey;
       public          postgres    false    315    7229    324         ]           2606    22642 "   moderators moderators_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT moderators_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);
 L   ALTER TABLE ONLY public.moderators DROP CONSTRAINT moderators_user_id_fkey;
       public          postgres    false    7229    315    328         Y           2606    19454 #   user_group user_group_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);
 M   ALTER TABLE ONLY public.user_group DROP CONSTRAINT user_group_group_id_fkey;
       public          postgres    false    7237    324    325         Z           2606    19562 "   user_group user_group_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);
 L   ALTER TABLE ONLY public.user_group DROP CONSTRAINT user_group_user_id_fkey;
       public          postgres    false    7229    315    325         T           2606    19434    users1 users1_group_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.users1
    ADD CONSTRAINT users1_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);
 E   ALTER TABLE ONLY public.users1 DROP CONSTRAINT users1_group_id_fkey;
       public          postgres    false    315    324    7237         U           2606    19552    users1 users1_recipient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users1
    ADD CONSTRAINT users1_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.users1(id);
 I   ALTER TABLE ONLY public.users1 DROP CONSTRAINT users1_recipient_id_fkey;
       public          postgres    false    7229    315    315                7430.dat                                                                                            0000600 0004000 0002000 00000000017 14603425165 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	96
2	65
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 7417.dat                                                                                            0000600 0004000 0002000 00000001352 14603425165 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	123	123	123	2023-12-07 19:14:45.469628	42	\N	f	\N
7	123	123	123	2023-12-07 19:22:43.29417	42	\N	f	\N
8	777	777	777	2023-12-09 21:05:05.879613	60	\N	f	\N
9	987	987	987	2023-12-10 10:16:07.980082	61	\N	f	\N
11	Здравствуйте!	Это мой первый пост	А здесь основной текст 	2023-12-12 20:04:09.302982	63	\N	f	\N
12	Это мой первый пост на этом форуме	Где я?	Что	2023-12-12 20:58:22.754797	64	\N	f	\N
13	Умный мангал	Более подробно о моём проекте	Вся информация о проекте	2023-12-12 21:02:04.651081	65	\N	f	\N
53	1	2	3	2024-03-27 17:23:41.376779	96	IMG-20230403-WA0013.jpg,IMG-20230912-WA0001.jpg,nix.jpg	f	\N
\.


                                                                                                                                                                                                                                                                                      7426.dat                                                                                            0000600 0004000 0002000 00000000027 14603425165 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        53	12
53	16
53	17
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         7432.dat                                                                                            0000600 0004000 0002000 00000000055 14603425165 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	63	reason1	2024-04-02 17:40:41.310012
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   7420.dat                                                                                            0000600 0004000 0002000 00000000461 14603425165 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        11	комментарий	2024-01-25 19:24:28.789345	96	11
12	насколько твой мангал умный?	2024-01-25 19:26:32.499312	96	13
19	Привет	2024-02-08 05:44:08.291672	96	12
22	jn k hn	2024-03-28 08:52:22.769056	96	53
23	робиоьррпол	2024-03-30 11:07:28.049421	96	53
\.


                                                                                                                                                                                                               7424.dat                                                                                            0000600 0004000 0002000 00000000154 14603425165 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        12	нн	96	\N	MoMll9y6
15	11	96	\N	APDqzSz0
16	112	96	\N	xqIn0o8A
17	вапвапвап	96	\N	EmzpzUMG
\.


                                                                                                                                                                                                                                                                                                                                                                                                                    7422.dat                                                                                            0000600 0004000 0002000 00000000203 14603425165 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	96	65
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


                                                                                                                                                                                                                                                                                                                                                                                             7428.dat                                                                                            0000600 0004000 0002000 00000000012 14603425165 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	63
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      7166.dat                                                                                            0000600 0004000 0002000 00000000005 14603425165 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7159.dat                                                                                            0000600 0004000 0002000 00000000005 14603425165 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7165.dat                                                                                            0000600 0004000 0002000 00000000005 14603425165 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7163.dat                                                                                            0000600 0004000 0002000 00000000005 14603425165 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7164.dat                                                                                            0000600 0004000 0002000 00000000005 14603425165 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7425.dat                                                                                            0000600 0004000 0002000 00000000065 14603425165 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        96	12	\N	\N
96	15	\N	\N
96	16	\N	\N
96	17	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7415.dat                                                                                            0000600 0004000 0002000 00000001374 14603425165 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        64	VladimirT	$2b$12$/uODEi9dEE2rv7FQi.OVq.gQOM9aEqRMRUOM85DpocY140TX.YHZ2	Titchev2007@yandex.ru	IMG_20230925_105616.jpg	\N	\N	\N	\N	f	f	f
63	Egor	$2b$12$CtXiiZUfbHR9rNBxHD9n4e6T.zd.TtrdyDWMU18A8GjnibMI3hJHm	Mashakov0707@yandex.ru	photo_2023-04-20_21-56-06.jpg	\N	\N	\N	\N	f	t	t
65	AlexanderL	$2b$12$upBAU9KDTsZry0W3.8gE4OjUGyPPTuHMD3WQCFvtyfzncoYXWmqne	LoyAlexander111@yandex.ru	IMG_20230802_190006.jpg	\N	\N	\N	\N	t	f	f
96	887	$2b$12$mr7J1TSiqMyjp0/IFA9ZW.xxJtec0PHc/U6ufBMWB4mZGWyQWCJN.	887	2.PNG	описание профиля ограничено и пааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааа	\N	\N	\N	t	f	f
\.


                                                                                                                                                                                                                                                                    7167.dat                                                                                            0000600 0004000 0002000 00000000005 14603425165 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7168.dat                                                                                            0000600 0004000 0002000 00000000005 14603425165 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7169.dat                                                                                            0000600 0004000 0002000 00000000005 14603425165 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7170.dat                                                                                            0000600 0004000 0002000 00000000005 14603425165 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7161.dat                                                                                            0000600 0004000 0002000 00000000005 14603425165 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           7162.dat                                                                                            0000600 0004000 0002000 00000000005 14603425165 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000062475 14603425165 0015410 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
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
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.admins OWNER TO postgres;

--
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
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


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
    group_id character varying(255)
);


ALTER TABLE public.article OWNER TO postgres;

--
-- Name: article_group_association; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article_group_association (
    article_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.article_group_association OWNER TO postgres;

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
-- Name: banned_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banned_users_id_seq OWNED BY public.banned_users.id;


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
-- Name: moderators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moderators (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.moderators OWNER TO postgres;

--
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
-- Name: moderators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moderators_id_seq OWNED BY public.moderators.id;


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
    group_id integer,
    is_admin boolean DEFAULT false,
    is_moderator boolean DEFAULT false,
    is_banned boolean DEFAULT false
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
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article ALTER COLUMN id SET DEFAULT nextval('public.article_id_seq'::regclass);


--
-- Name: banned_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banned_users ALTER COLUMN id SET DEFAULT nextval('public.banned_users_id_seq'::regclass);


--
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: moderators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderators ALTER COLUMN id SET DEFAULT nextval('public.moderators_id_seq'::regclass);


--
-- Name: users1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users1 ALTER COLUMN id SET DEFAULT nextval('public.users1_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, user_id) FROM stdin;
\.
COPY public.admins (id, user_id) FROM '$$PATH$$/7430.dat';

--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article (id, title, intro, text, date, user_id, file, hidden, group_id) FROM stdin;
\.
COPY public.article (id, title, intro, text, date, user_id, file, hidden, group_id) FROM '$$PATH$$/7417.dat';

--
-- Data for Name: article_group_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article_group_association (article_id, group_id) FROM stdin;
\.
COPY public.article_group_association (article_id, group_id) FROM '$$PATH$$/7426.dat';

--
-- Data for Name: banned_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banned_users (id, user_id, reason, banned_at) FROM stdin;
\.
COPY public.banned_users (id, user_id, reason, banned_at) FROM '$$PATH$$/7432.dat';

--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, text, date, user_id, article_id) FROM stdin;
\.
COPY public.comment (id, text, date, user_id, article_id) FROM '$$PATH$$/7420.dat';

--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, name, author_id, posts, join_code) FROM stdin;
\.
COPY public.groups (id, name, author_id, posts, join_code) FROM '$$PATH$$/7424.dat';

--
-- Data for Name: like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."like" (id, user_id, recipient_id) FROM stdin;
\.
COPY public."like" (id, user_id, recipient_id) FROM '$$PATH$$/7422.dat';

--
-- Data for Name: moderators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moderators (id, user_id) FROM stdin;
\.
COPY public.moderators (id, user_id) FROM '$$PATH$$/7428.dat';

--
-- Data for Name: pointcloud_formats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pointcloud_formats (pcid, srid, schema) FROM stdin;
\.
COPY public.pointcloud_formats (pcid, srid, schema) FROM '$$PATH$$/7166.dat';

--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.
COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM '$$PATH$$/7159.dat';

--
-- Data for Name: us_gaz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.
COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM '$$PATH$$/7165.dat';

--
-- Data for Name: us_lex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.
COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM '$$PATH$$/7163.dat';

--
-- Data for Name: us_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_rules (id, rule, is_custom) FROM stdin;
\.
COPY public.us_rules (id, rule, is_custom) FROM '$$PATH$$/7164.dat';

--
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_group (user_id, group_id, group_name, teacher_name) FROM stdin;
\.
COPY public.user_group (user_id, group_id, group_name, teacher_name) FROM '$$PATH$$/7425.dat';

--
-- Data for Name: users1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users1 (id, login, password, email, file, description, comments, recipient_id, group_id, is_admin, is_moderator, is_banned) FROM stdin;
\.
COPY public.users1 (id, login, password, email, file, description, comments, recipient_id, group_id, is_admin, is_moderator, is_banned) FROM '$$PATH$$/7415.dat';

--
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.
COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM '$$PATH$$/7167.dat';

--
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.
COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM '$$PATH$$/7168.dat';

--
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.
COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM '$$PATH$$/7169.dat';

--
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.
COPY tiger.pagc_rules (id, rule, is_custom) FROM '$$PATH$$/7170.dat';

--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.
COPY topology.topology (id, name, srid, "precision", hasz) FROM '$$PATH$$/7161.dat';

--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.
COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM '$$PATH$$/7162.dat';

--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 2, true);


--
-- Name: article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_id_seq', 53, true);


--
-- Name: banned_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banned_users_id_seq', 5, true);


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 23, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 17, true);


--
-- Name: like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.like_id_seq', 57, true);


--
-- Name: moderators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moderators_id_seq', 4, true);


--
-- Name: users1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users1_id_seq', 101, true);


--
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: postgres
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: admins admins_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_user_id_key UNIQUE (user_id);


--
-- Name: article_group_association article_group_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_group_association
    ADD CONSTRAINT article_group_association_pkey PRIMARY KEY (article_id, group_id);


--
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);


--
-- Name: banned_users banned_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banned_users
    ADD CONSTRAINT banned_users_pkey PRIMARY KEY (id);


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
-- Name: moderators moderators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT moderators_pkey PRIMARY KEY (id);


--
-- Name: moderators moderators_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT moderators_user_id_key UNIQUE (user_id);


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
-- Name: admins admins_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);


--
-- Name: article_group_association article_group_association_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_group_association
    ADD CONSTRAINT article_group_association_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- Name: article_group_association article_group_association_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_group_association
    ADD CONSTRAINT article_group_association_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: banned_users banned_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banned_users
    ADD CONSTRAINT banned_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);


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
-- Name: moderators moderators_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT moderators_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);


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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   