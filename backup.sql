PGDMP  7    $                |            users_1    16.1    16.1 {               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    19311    users_1    DATABASE     {   CREATE DATABASE users_1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE users_1;
                postgres    false                        2615    18722    tiger    SCHEMA        CREATE SCHEMA tiger;
    DROP SCHEMA tiger;
                postgres    false                        2615    18978 
   tiger_data    SCHEMA        CREATE SCHEMA tiger_data;
    DROP SCHEMA tiger_data;
                postgres    false                        2615    18361    topology    SCHEMA        CREATE SCHEMA topology;
    DROP SCHEMA topology;
                postgres    false                       0    0    SCHEMA topology    COMMENT     9   COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';
                   postgres    false    20                        3079    18528    address_standardizer 	   EXTENSION     H   CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;
 %   DROP EXTENSION address_standardizer;
                   false                       0    0    EXTENSION address_standardizer    COMMENT     �   COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';
                        false    6                        3079    18536    address_standardizer_data_us 	   EXTENSION     P   CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us WITH SCHEMA public;
 -   DROP EXTENSION address_standardizer_data_us;
                   false                       0    0 &   EXTENSION address_standardizer_data_us    COMMENT     `   COMMENT ON EXTENSION address_standardizer_data_us IS 'Address Standardizer US dataset example';
                        false    7                        3079    18710    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                   false                       0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                        false    12                        3079    19122    h3 	   EXTENSION     6   CREATE EXTENSION IF NOT EXISTS h3 WITH SCHEMA public;
    DROP EXTENSION h3;
                   false                       0    0    EXTENSION h3    COMMENT     9   COMMENT ON EXTENSION h3 IS 'H3 bindings for PostgreSQL';
                        false    14                        3079    16399    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false                       0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    2                        3079    17475    postgis_raster 	   EXTENSION     B   CREATE EXTENSION IF NOT EXISTS postgis_raster WITH SCHEMA public;
    DROP EXTENSION postgis_raster;
                   false    2                       0    0    EXTENSION postgis_raster    COMMENT     M   COMMENT ON EXTENSION postgis_raster IS 'PostGIS raster types and functions';
                        false    3                        3079    19236 
   h3_postgis 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS h3_postgis WITH SCHEMA public;
    DROP EXTENSION h3_postgis;
                   false    2    14    3                       0    0    EXTENSION h3_postgis    COMMENT     =   COMMENT ON EXTENSION h3_postgis IS 'H3 PostGIS integration';
                        false    15                        3079    18704    ogr_fdw 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS ogr_fdw WITH SCHEMA public;
    DROP EXTENSION ogr_fdw;
                   false                       0    0    EXTENSION ogr_fdw    COMMENT     L   COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';
                        false    11                        3079    18032 	   pgrouting 	   EXTENSION     =   CREATE EXTENSION IF NOT EXISTS pgrouting WITH SCHEMA public;
    DROP EXTENSION pgrouting;
                   false    2                       0    0    EXTENSION pgrouting    COMMENT     9   COMMENT ON EXTENSION pgrouting IS 'pgRouting Extension';
                        false    4            	            3079    18598 
   pointcloud 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS pointcloud WITH SCHEMA public;
    DROP EXTENSION pointcloud;
                   false                       0    0    EXTENSION pointcloud    COMMENT     G   COMMENT ON EXTENSION pointcloud IS 'data type for lidar point clouds';
                        false    9            
            3079    18693    pointcloud_postgis 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS pointcloud_postgis WITH SCHEMA public;
 #   DROP EXTENSION pointcloud_postgis;
                   false    9    2                       0    0    EXTENSION pointcloud_postgis    COMMENT     n   COMMENT ON EXTENSION pointcloud_postgis IS 'integration for pointcloud LIDAR data and PostGIS geometry data';
                        false    10                        3079    18573    postgis_sfcgal 	   EXTENSION     B   CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;
    DROP EXTENSION postgis_sfcgal;
                   false    2                       0    0    EXTENSION postgis_sfcgal    COMMENT     C   COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';
                        false    8                        3079    18723    postgis_tiger_geocoder 	   EXTENSION     I   CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;
 '   DROP EXTENSION postgis_tiger_geocoder;
                   false    2    21    12                       0    0     EXTENSION postgis_tiger_geocoder    COMMENT     ^   COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';
                        false    13                        3079    18362    postgis_topology 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;
 !   DROP EXTENSION postgis_topology;
                   false    2    20                       0    0    EXTENSION postgis_topology    COMMENT     Y   COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';
                        false    5            J           1259    22648    admins    TABLE     V   CREATE TABLE public.admins (
    id integer NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.admins;
       public         heap    postgres    false            I           1259    22647    admins_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.admins_id_seq;
       public          postgres    false    330                       0    0    admins_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;
          public          postgres    false    329            =           1259    19323    article    TABLE     K  CREATE TABLE public.article (
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
       public         heap    postgres    false            F           1259    22611    article_group_association    TABLE     r   CREATE TABLE public.article_group_association (
    article_id integer NOT NULL,
    group_id integer NOT NULL
);
 -   DROP TABLE public.article_group_association;
       public         heap    postgres    false            <           1259    19322    article_id_seq    SEQUENCE     �   CREATE SEQUENCE public.article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.article_id_seq;
       public          postgres    false    317                       0    0    article_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.article_id_seq OWNED BY public.article.id;
          public          postgres    false    316            L           1259    22665    banned_users    TABLE     �   CREATE TABLE public.banned_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    reason character varying(255) NOT NULL,
    banned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.banned_users;
       public         heap    postgres    false            K           1259    22664    banned_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.banned_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.banned_users_id_seq;
       public          postgres    false    332                        0    0    banned_users_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.banned_users_id_seq OWNED BY public.banned_users.id;
          public          postgres    false    331            @           1259    19396    comment    TABLE     �   CREATE TABLE public.comment (
    id integer NOT NULL,
    text text NOT NULL,
    date timestamp without time zone,
    user_id integer NOT NULL,
    article_id integer NOT NULL
);
    DROP TABLE public.comment;
       public         heap    postgres    false            ?           1259    19395    comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.comment_id_seq;
       public          postgres    false    320            !           0    0    comment_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;
          public          postgres    false    319            D           1259    19424    groups    TABLE     �   CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    author_id integer,
    posts text,
    join_code character varying(20) DEFAULT 'default_code'::character varying NOT NULL
);
    DROP TABLE public.groups;
       public         heap    postgres    false            C           1259    19423    groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public          postgres    false    324            "           0    0    groups_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;
          public          postgres    false    323            B           1259    19415    like    TABLE     g   CREATE TABLE public."like" (
    id integer NOT NULL,
    user_id integer,
    recipient_id integer
);
    DROP TABLE public."like";
       public         heap    postgres    false            A           1259    19414    like_id_seq    SEQUENCE     �   ALTER TABLE public."like" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.like_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    322            H           1259    22634 
   moderators    TABLE     Z   CREATE TABLE public.moderators (
    id integer NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.moderators;
       public         heap    postgres    false            G           1259    22633    moderators_id_seq    SEQUENCE     �   CREATE SEQUENCE public.moderators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.moderators_id_seq;
       public          postgres    false    328            #           0    0    moderators_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.moderators_id_seq OWNED BY public.moderators.id;
          public          postgres    false    327            E           1259    19444 
   user_group    TABLE     �   CREATE TABLE public.user_group (
    user_id integer NOT NULL,
    group_id integer NOT NULL,
    group_name character varying(255),
    teacher_name character varying(255)
);
    DROP TABLE public.user_group;
       public         heap    postgres    false            ;           1259    19313    users1    TABLE     �  CREATE TABLE public.users1 (
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
       public         heap    postgres    false            $           0    0    TABLE users1    COMMENT     a   COMMENT ON TABLE public.users1 IS 'таблица с данными пользователей';
          public          postgres    false    315            >           1259    19331    users1_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users1_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.users1_id_seq;
       public          postgres    false    315            %           0    0    users1_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.users1_id_seq OWNED BY public.users1.id;
          public          postgres    false    318                       2604    22651 	   admins id    DEFAULT     f   ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);
 8   ALTER TABLE public.admins ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    329    330    330                       2604    19326 
   article id    DEFAULT     h   ALTER TABLE ONLY public.article ALTER COLUMN id SET DEFAULT nextval('public.article_id_seq'::regclass);
 9   ALTER TABLE public.article ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    316    317    317                       2604    22668    banned_users id    DEFAULT     r   ALTER TABLE ONLY public.banned_users ALTER COLUMN id SET DEFAULT nextval('public.banned_users_id_seq'::regclass);
 >   ALTER TABLE public.banned_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    332    331    332                       2604    19399 
   comment id    DEFAULT     h   ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);
 9   ALTER TABLE public.comment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    319    320    320                       2604    19427 	   groups id    DEFAULT     f   ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    324    323    324                       2604    22637    moderators id    DEFAULT     n   ALTER TABLE ONLY public.moderators ALTER COLUMN id SET DEFAULT nextval('public.moderators_id_seq'::regclass);
 <   ALTER TABLE public.moderators ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    327    328    328                       2604    19549 	   users1 id    DEFAULT     f   ALTER TABLE ONLY public.users1 ALTER COLUMN id SET DEFAULT nextval('public.users1_id_seq'::regclass);
 8   ALTER TABLE public.users1 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    318    315                      0    22648    admins 
   TABLE DATA           -   COPY public.admins (id, user_id) FROM stdin;
    public          postgres    false    330   <�       �          0    19323    article 
   TABLE DATA           `   COPY public.article (id, title, intro, text, date, user_id, file, hidden, group_id) FROM stdin;
    public          postgres    false    317   c�                 0    22611    article_group_association 
   TABLE DATA           I   COPY public.article_group_association (article_id, group_id) FROM stdin;
    public          postgres    false    326   �                 0    22665    banned_users 
   TABLE DATA           F   COPY public.banned_users (id, user_id, reason, banned_at) FROM stdin;
    public          postgres    false    332   :�       �          0    19396    comment 
   TABLE DATA           F   COPY public.comment (id, text, date, user_id, article_id) FROM stdin;
    public          postgres    false    320   }�                  0    19424    groups 
   TABLE DATA           G   COPY public.groups (id, name, author_id, posts, join_code) FROM stdin;
    public          postgres    false    324   g�       �          0    19415    like 
   TABLE DATA           ;   COPY public."like" (id, user_id, recipient_id) FROM stdin;
    public          postgres    false    322   ф                 0    22634 
   moderators 
   TABLE DATA           1   COPY public.moderators (id, user_id) FROM stdin;
    public          postgres    false    328   �       �          0    18600    pointcloud_formats 
   TABLE DATA           @   COPY public.pointcloud_formats (pcid, srid, schema) FROM stdin;
    public          postgres    false    260   A�       �          0    16717    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    233   ^�       �          0    18550    us_gaz 
   TABLE DATA           J   COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
    public          postgres    false    257   {�       �          0    18538    us_lex 
   TABLE DATA           J   COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
    public          postgres    false    255   ��       �          0    18562    us_rules 
   TABLE DATA           7   COPY public.us_rules (id, rule, is_custom) FROM stdin;
    public          postgres    false    259   ��                 0    19444 
   user_group 
   TABLE DATA           Q   COPY public.user_group (user_id, group_id, group_name, teacher_name) FROM stdin;
    public          postgres    false    325   ҅       �          0    19313    users1 
   TABLE DATA           �   COPY public.users1 (id, login, password, email, file, description, comments, recipient_id, group_id, is_admin, is_moderator, is_banned) FROM stdin;
    public          postgres    false    315   �       �          0    18729    geocode_settings 
   TABLE DATA           T   COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
    tiger          postgres    false    263   Ƈ                  0    19061    pagc_gaz 
   TABLE DATA           K   COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger          postgres    false    308   �                 0    19071    pagc_lex 
   TABLE DATA           K   COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger          postgres    false    310    �                 0    19081 
   pagc_rules 
   TABLE DATA           8   COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
    tiger          postgres    false    312   �       �          0    18364    topology 
   TABLE DATA           G   COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
    topology          postgres    false    248   :�       �          0    18376    layer 
   TABLE DATA           �   COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
    topology          postgres    false    249   W�       &           0    0    admins_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.admins_id_seq', 2, true);
          public          postgres    false    329            '           0    0    article_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.article_id_seq', 53, true);
          public          postgres    false    316            (           0    0    banned_users_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.banned_users_id_seq', 5, true);
          public          postgres    false    331            )           0    0    comment_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.comment_id_seq', 23, true);
          public          postgres    false    319            *           0    0    groups_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.groups_id_seq', 17, true);
          public          postgres    false    323            +           0    0    like_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.like_id_seq', 57, true);
          public          postgres    false    321            ,           0    0    moderators_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.moderators_id_seq', 4, true);
          public          postgres    false    327            -           0    0    users1_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.users1_id_seq', 101, true);
          public          postgres    false    318            .           0    0    topology_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);
          topology          postgres    false    247            O           2606    22653    admins admins_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_pkey;
       public            postgres    false    330            Q           2606    22655    admins admins_user_id_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_user_id_key UNIQUE (user_id);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_user_id_key;
       public            postgres    false    330            I           2606    22615 8   article_group_association article_group_association_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.article_group_association
    ADD CONSTRAINT article_group_association_pkey PRIMARY KEY (article_id, group_id);
 b   ALTER TABLE ONLY public.article_group_association DROP CONSTRAINT article_group_association_pkey;
       public            postgres    false    326    326            ?           2606    19330    article article_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.article DROP CONSTRAINT article_pkey;
       public            postgres    false    317            S           2606    22671    banned_users banned_users_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.banned_users
    ADD CONSTRAINT banned_users_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.banned_users DROP CONSTRAINT banned_users_pkey;
       public            postgres    false    332            A           2606    19403    comment comment_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            postgres    false    320            C           2606    19431    groups groups_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_name_key;
       public            postgres    false    324            E           2606    19429    groups groups_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public            postgres    false    324            K           2606    22639    moderators moderators_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT moderators_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.moderators DROP CONSTRAINT moderators_pkey;
       public            postgres    false    328            M           2606    22641 !   moderators moderators_user_id_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT moderators_user_id_key UNIQUE (user_id);
 K   ALTER TABLE ONLY public.moderators DROP CONSTRAINT moderators_user_id_key;
       public            postgres    false    328            =           2606    19551    users1 unique_user_id 
   CONSTRAINT     N   ALTER TABLE ONLY public.users1
    ADD CONSTRAINT unique_user_id UNIQUE (id);
 ?   ALTER TABLE ONLY public.users1 DROP CONSTRAINT unique_user_id;
       public            postgres    false    315            G           2606    19448    user_group user_group_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (user_id, group_id);
 D   ALTER TABLE ONLY public.user_group DROP CONSTRAINT user_group_pkey;
       public            postgres    false    325    325            ^           2606    22656    admins admins_user_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_user_id_fkey;
       public          postgres    false    7229    330    315            [           2606    22616 C   article_group_association article_group_association_article_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.article_group_association
    ADD CONSTRAINT article_group_association_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.article(id);
 m   ALTER TABLE ONLY public.article_group_association DROP CONSTRAINT article_group_association_article_id_fkey;
       public          postgres    false    7231    326    317            \           2606    22621 A   article_group_association article_group_association_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.article_group_association
    ADD CONSTRAINT article_group_association_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);
 k   ALTER TABLE ONLY public.article_group_association DROP CONSTRAINT article_group_association_group_id_fkey;
       public          postgres    false    324    326    7237            _           2606    22672 &   banned_users banned_users_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.banned_users
    ADD CONSTRAINT banned_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);
 P   ALTER TABLE ONLY public.banned_users DROP CONSTRAINT banned_users_user_id_fkey;
       public          postgres    false    7229    315    332            V           2606    19409    comment comment_article_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.article(id);
 I   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_article_id_fkey;
       public          postgres    false    317    320    7231            W           2606    19557    comment comment_user_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);
 F   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_user_id_fkey;
       public          postgres    false    320    315    7229            X           2606    19577    groups groups_teacher_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_teacher_id_fkey FOREIGN KEY (author_id) REFERENCES public.users1(id);
 G   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_teacher_id_fkey;
       public          postgres    false    315    7229    324            ]           2606    22642 "   moderators moderators_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT moderators_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);
 L   ALTER TABLE ONLY public.moderators DROP CONSTRAINT moderators_user_id_fkey;
       public          postgres    false    7229    315    328            Y           2606    19454 #   user_group user_group_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);
 M   ALTER TABLE ONLY public.user_group DROP CONSTRAINT user_group_group_id_fkey;
       public          postgres    false    7237    324    325            Z           2606    19562 "   user_group user_group_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users1(id);
 L   ALTER TABLE ONLY public.user_group DROP CONSTRAINT user_group_user_id_fkey;
       public          postgres    false    7229    315    325            T           2606    19434    users1 users1_group_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.users1
    ADD CONSTRAINT users1_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);
 E   ALTER TABLE ONLY public.users1 DROP CONSTRAINT users1_group_id_fkey;
       public          postgres    false    315    324    7237            U           2606    19552    users1 users1_recipient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users1
    ADD CONSTRAINT users1_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.users1(id);
 I   ALTER TABLE ONLY public.users1 DROP CONSTRAINT users1_recipient_id_fkey;
       public          postgres    false    7229    315    315                  x�3�4�2�43����� �      �   �  x��R�nA�}O1�ّ홝ٙ��(��I
��̟h�($)x 
*�p�D.��{�ųG��imk<��}�u�n4Fvq��P��o�)p�a��S7���a��YN��Ӓb���%�0el��]L�k�.��XCh3��Ѧ�c4��|���/�2-�P���5ζ@~j�,������7-'�C_� _����:(��&e�����6���4El3���:�T��"�^���M9�@Y�r��}U���U�c��K�����t�6�>��o��w��\3-t$K����Bi��)�A�0�^~�G��J˅��pQ�|X�\��s#��sPX��/r[��s�S���YGdCK��vT��ðG�Aװ�Q��'�b�Q� ���;Mm�^!o����޿�I�ji���\�c�N&�C�$`            x�35�44�2�f`Ҝ+F��� )�L         3   x�3�43�,JM,��3�4202�5 "#Cs++C=cCC#�=... ��	'      �   �   x�]��MA��3UL;�=?;��P@Rj�Hz���(K�K����d�֓��d#��EnZ��^�m'�2��@�!W�����g�h���j���ЧS�I��x��Y�յW�s{���?8�@>2�up��F��W����k�(R��B�Ę�� Y"�u�n�]�a �����13�ܽ)X
Fы|(~i��S�����p���0D��k��[k hsqR          Z   x�34⼰��^NK3�?N�|ߜ�J3.CSNCC��c�KaUp���P�*ZQ�g�o��eh�yaӅ�#�PE��UU���\1z\\\ 6$]      �   >   x�=��  C�3ƈ�.�?�1O��櫬�p4کQ�A�tQ�94G&�7�Ľ�_Ű��RK            x�3�43����� tY      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �         "   x��4�44��".K ��m��6��c���� �	�      �   �  x�Ր݊�@ǯ'Oᅷ�3��U�Q�lTD�����Q�^m���}�BYJ�WߨY��_�������_�����0�A�̫�T�[K�C��u���� ���.Ug�fH��EQKo�d��؜`���
v!����~���t�1%��H%�#Q�\�Kp������$��$�@��QN����Y��755ɆO>���/4�:Xi(�:�ï�f��q5����E�J���QCB��)�5Q��k,9�9I��`����^��i��4�q��塲�k�E�ooM��������)���ȍ6q n�����5
"S�"t'?[�J@Q�G��]l7�X���i7ԉ��nx�ozuG�.��m
��p������Y��~� �������}c?ف�V���O_����R��������Xa��������_2�I�      �      x������ � �             x������ � �            x������ � �            x������ � �      �      x������ � �      �      x������ � �     