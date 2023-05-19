CREATE TABLE public.classs (
    id integer NOT NULL,
    subject integer,
    subject_type integer
);


ALTER TABLE public.classs OWNER TO postgres;


CREATE TABLE public.subject (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.subject OWNER TO postgres;


CREATE TABLE public.subject_type (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.subject_type OWNER TO postgres;


CREATE TABLE public.teacher (
    id integer NOT NULL,
    full_name character varying NOT NULL
);


ALTER TABLE public.teacher OWNER TO postgres;


CREATE TABLE public.teacher_subject (
    id integer NOT NULL,
    teacher integer,
    clas integer
);


ALTER TABLE public.teacher_subject OWNER TO postgres;

CREATE TABLE public.timee (
    id integer NOT NULL,
    start_time character varying NOT NULL
);


ALTER TABLE public.timee OWNER TO postgres;


CREATE TABLE public.timetable (
    id integer NOT NULL,
    class integer,
    class_time integer,
    room_number character varying NOT NULL,
    day character varying NOT NULL,
    week character varying,
    gggg integer,
    qqqw integer
);


ALTER TABLE public.timetable OWNER TO postgres;


COPY public.classs (id, subject, subject_type) FROM stdin;
1	1	1
2	1	3
3	2	3
4	3	1
5	3	2
6	3	3
7	4	2
8	5	1
9	5	2
10	6	1
11	6	2
12	7	2
13	8	1
14	8	2
15	9	2
\.



COPY public.subject (id, name) FROM stdin;
1	Основы DevOps
2	ВВИТ
3	Физика
4	Игровые виды спорта
5	Высшая математика
6	Математические основы баз данных
7	Проектный практикум
8	История
9	Иностранный язык
\.




COPY public.subject_type (id, name) FROM stdin;
1	Л
2	П
3	Лаб
\.




COPY public.teacher (id, full_name) FROM stdin;
1	Городничев М.Г.
2	Фурлетов Ю.М.
3	Вальковский С.Н.
4	Симкачева Т.В.
5	Гетманская И.В.
6	Полищук Ю.В.
7	Потапченко Т.Д.
8	Шуралев А.В.
9	Кожевникова Т.В
\.



COPY public.teacher_subject (id, teacher, clas) FROM stdin;
1	1	1
2	1	2
3	2	3
4	3	4
5	3	5
6	3	6
7	4	7
8	5	8
9	5	9
10	6	10
11	6	11
12	7	12
13	8	13
14	8	14
15	9	15
\.



COPY public.timee (id, start_time) FROM stdin;
1	09.30-11.05
2	11.20-12.55
3	13.10-14.45
4	15.25-17.05
\.




COPY public.timetable (id, class, class_time, room_number, day, week, gggg, qqqw) FROM stdin;
1	1	4	310	1	1	1	1
2	3	3	306	1	1	1	1
3	6	2	340	2	1	2	1
4	7	3	Зал	2	1	2	1
5	7	1	Зал	4	1	4	1
6	8	2	514	4	1	4	1
7	9	3	410	4	1	4	1
8	10	4	310	4	1	4	1
9	12	1	208	5	1	5	1
10	3	2	406	5	1	5	1
11	2	3	302	5	1	5	1
12	2	1	302	1	2	1	2
13	3	2	203	1	2	1	2
14	7	3	Зал	1	2	1	2
15	7	1	Зал	2	2	2	2
16	8	2	514	2	2	2	2
17	13	3	227	2	2	2	2
18	9	4	324	2	2	2	2
19	4	2	226	3	2	3	2
20	5	3	332	3	2	3	2
21	14	4	318	3	2	3	2
22	14	1	316	4	2	4	2
23	11	3	519	4	2	4	2
24	15	4	332	4	2	4	2
25	15	4	332	4	2	4	2
\.
