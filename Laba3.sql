PGDMP                          {            mtuci_db    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    mtuci_db    DATABASE     |   CREATE DATABASE mtuci_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE mtuci_db;
                postgres    false            �            1255    16947    astrig_hotel_before_del()    FUNCTION     �   CREATE FUNCTION public.astrig_hotel_before_del() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
Begin
if (select count(*)FROM stutent
WHERE stutent.id = OLD.id)>0
    then DELETE FROM room
where stutent.id = OLD.id;
end if;
return OLD;
END;
$$;
 0   DROP FUNCTION public.astrig_hotel_before_del();
       public          postgres    false            �            1259    16400    faculty    TABLE     �   CREATE TABLE public.faculty (
    id integer NOT NULL,
    nname character varying(55) NOT NULL,
    decanat character varying(120) NOT NULL
);
    DROP TABLE public.faculty;
       public         heap    postgres    false            �            1259    16399    faculty_id_seq    SEQUENCE     �   CREATE SEQUENCE public.faculty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.faculty_id_seq;
       public          postgres    false    215                       0    0    faculty_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.faculty_id_seq OWNED BY public.faculty.id;
          public          postgres    false    214            �            1259    16407    student_group    TABLE     �   CREATE TABLE public.student_group (
    id integer NOT NULL,
    nname character varying(70) NOT NULL,
    faculty character varying(120) NOT NULL,
    fk_groupa_faculty integer
);
 !   DROP TABLE public.student_group;
       public         heap    postgres    false            �            1259    16406    student_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.student_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.student_group_id_seq;
       public          postgres    false    217                       0    0    student_group_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.student_group_id_seq OWNED BY public.student_group.id;
          public          postgres    false    216            �            1259    16454    stutents    TABLE     �   CREATE TABLE public.stutents (
    id integer NOT NULL,
    naame character varying(150) NOT NULL,
    passport integer NOT NULL,
    student_group character varying(50) NOT NULL,
    fk_students_groupa integer
);
    DROP TABLE public.stutents;
       public         heap    postgres    false            �            1259    16453    stutents_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stutents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.stutents_id_seq;
       public          postgres    false    219                       0    0    stutents_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.stutents_id_seq OWNED BY public.stutents.id;
          public          postgres    false    218            p           2604    16403 
   faculty id    DEFAULT     h   ALTER TABLE ONLY public.faculty ALTER COLUMN id SET DEFAULT nextval('public.faculty_id_seq'::regclass);
 9   ALTER TABLE public.faculty ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            q           2604    16410    student_group id    DEFAULT     t   ALTER TABLE ONLY public.student_group ALTER COLUMN id SET DEFAULT nextval('public.student_group_id_seq'::regclass);
 ?   ALTER TABLE public.student_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            r           2604    16457    stutents id    DEFAULT     j   ALTER TABLE ONLY public.stutents ALTER COLUMN id SET DEFAULT nextval('public.stutents_id_seq'::regclass);
 :   ALTER TABLE public.stutents ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219                      0    16400    faculty 
   TABLE DATA           5   COPY public.faculty (id, nname, decanat) FROM stdin;
    public          postgres    false    215   �                  0    16407    student_group 
   TABLE DATA           N   COPY public.student_group (id, nname, faculty, fk_groupa_faculty) FROM stdin;
    public          postgres    false    217   s!                 0    16454    stutents 
   TABLE DATA           Z   COPY public.stutents (id, naame, passport, student_group, fk_students_groupa) FROM stdin;
    public          postgres    false    219   "                  0    0    faculty_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.faculty_id_seq', 2, true);
          public          postgres    false    214                       0    0    student_group_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.student_group_id_seq', 4, true);
          public          postgres    false    216                       0    0    stutents_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.stutents_id_seq', 16, true);
          public          postgres    false    218            t           2606    16405    faculty faculty_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT faculty_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.faculty DROP CONSTRAINT faculty_pkey;
       public            postgres    false    215            v           2606    16412     student_group student_group_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.student_group
    ADD CONSTRAINT student_group_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.student_group DROP CONSTRAINT student_group_pkey;
       public            postgres    false    217            x           2606    16459    stutents stutents_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.stutents
    ADD CONSTRAINT stutents_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.stutents DROP CONSTRAINT stutents_pkey;
       public            postgres    false    219            {           2620    16948    faculty ttrig_hotel_before_del    TRIGGER     �   CREATE TRIGGER ttrig_hotel_before_del BEFORE DELETE ON public.faculty FOR EACH ROW EXECUTE FUNCTION public.astrig_hotel_before_del();
 7   DROP TRIGGER ttrig_hotel_before_del ON public.faculty;
       public          postgres    false    220    215            y           2606    16413 2   student_group student_group_fk_groupa_faculty_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student_group
    ADD CONSTRAINT student_group_fk_groupa_faculty_fkey FOREIGN KEY (fk_groupa_faculty) REFERENCES public.faculty(id);
 \   ALTER TABLE ONLY public.student_group DROP CONSTRAINT student_group_fk_groupa_faculty_fkey;
       public          postgres    false    215    217    3188            z           2606    16460 )   stutents stutents_fk_students_groupa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stutents
    ADD CONSTRAINT stutents_fk_students_groupa_fkey FOREIGN KEY (fk_students_groupa) REFERENCES public.student_group(id);
 S   ALTER TABLE ONLY public.stutents DROP CONSTRAINT stutents_fk_students_groupa_fkey;
       public          postgres    false    217    219    3190               �   x�uN��0��)4A ��2��[�0��E�x�<"Ėf8n��U�HI���;�2��;xLsz��o��2�IԈ�,g��QH�d�8�'����O��	#ߓ�`��R�������L���-^e8QЦl�.o��9�Tq���1�jc����g��JD>����         �   x��MK
�P[�;EO �S�e<����Bp%����p�מ!s#�]�$��IF'��-z_!��{zt�j���H��4<i߸M4D��_ɹ����Ϭ�
W?�N:��ՐG�����L��5}1�a�)��E|�.��EZ
�����h����{�         g  x�U�QN�@E�߬�L�鴥{q1(?&E�H��?��"Z�pgG�� oҏfN��Z��?�[�5�Qw0�j�,�ĈQ�`J�: 4޴d�t���R�M �����\0�=��g��t0�����"x��lCO_tv݌�,�V�*/�ph�N5&ZJV���?��u�i�uY	��l�����fZ*V�I��
�Zh16s-e�U�X�zr4�Z�h$���L�yO�����6���(��1co��a�qX[�՞��q��2��5Q����UvL2�E��X-9�Bm��?���ȅ�ĕ"�g�;�B��+�����6&��k��Wޭ�5�]���Ŕ�T+�~xH     