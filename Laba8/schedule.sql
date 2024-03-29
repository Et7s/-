CREATE TABLE bot.subject
(
	id serial PRIMARY KEY,
	name varchar(128) NOT NULL
);

CREATE TABLE bot.subject_type
(
	id serial PRIMARY KEY,
	name varchar(128) NOT NULL
);

CREATE TABLE bot.class
(
	id serial PRIMARY KEY,
	subject int NOT NULL REFERENCES bot.subject(id),
	subject_type int NOT NULL REFERENCES bot.subject_type(id)
);

CREATE TABLE bot.time
(
	id serial PRIMARY KEY,
	start_time varchar(64) NOT NULL
);


CREATE TABLE bot.teacher
(
	id serial PRIMARY KEY,
	full_name varchar(256) NOT NULL
);

CREATE TABLE bot.teacher_subject
(
	id serial PRIMARY KEY,
	teacher int NOT NULL REFERENCES bot.teacher(id),
	class int NOT NULL REFERENCES bot.class(id)
);

CREATE TABLE bot.timetable
(
	id serial PRIMARY KEY,
	week int NOT NULL,
	day int NOT NULL,
	class int NOT NULL REFERENCES bot.class(id),
	class_time int NOT NULL REFERENCES bot.time(id),
	room_number varchar(64) NOT NULL
);

INSERT INTO bot.subject (id, name)
VALUES
(1, 'Основы DevOps'), (2, 'Введение в информационные технологии'), (3,'Физика'),
(4, 'Игровые виды спорта'), (5, 'Высшая математика'), (6, 'Основы баз данных'),
(7, 'Проектный практикум'), (8, 'История'), (9, 'Иностранный язык');

INSERT INTO bot.subject_type (id, name)
VALUES
(1, 'Лекция'), (2, 'Практика'), (3, 'Лабораторная работа');

INSERT INTO bot.time (id, start_time)
VALUES
(1, '9:30 - 11:05'), (2, '11:20 - 12:55'), (3, '13:10 - 14:45'),
(4, '15:25 - 17:00'), (5, '17:15 - 18:50');

INSERT INTO bot.teacher (id, full_name)
VALUES
(1, 'Городничев М.Г.'), (2, 'Фурлетов Ю.М.'), (3, 'Сирко И.В.'), (4, 'Королев И.В.'),
(5, 'Гетманская И.В.'), (6, 'Полищук Ю.В.'), (7, 'Потапченко Т.Д.'), (8, 'Фурлетов Ю.М.'),
(9, 'Липатов В.Н.'), (10, 'Шуралев А.В.'), (11, 'Вальковский С.Н.'), (12, 'Кожевникова Т.В.'),
(13, 'Изотова А.А.');

INSERT INTO bot.class (id, subject, subject_type)
VALUES
(1, 1, 1), (2, 1, 3), (3, 2, 2), (4, 2, 3), (5, 3, 3), (6, 3, 1), (7, 3, 2), (8, 4, 2),
(9, 5, 1), (10, 5, 2), (11, 6, 1), (12, 6, 2), (13, 6, 3), (14, 7, 2), (15, 8, 1), (16, 8, 2),
(17, 9, 2), (18, 7, 3);

INSERT INTO bot.teacher_subject (id, teacher, class)
VALUES
(1, 1, 1), (2, 2, 3), (3, 3, 5), (4, 4, 8), (5, 5, 9), (6, 5, 10), (7, 6, 11), (8, 7, 14),
(9, 2, 18), (10, 9, 2), (11, 10, 15), (12, 11, 6), (13, 11, 7), (14, 10, 16), (15, 6, 12), (16, 12, 17),
(17, 13, 13);

INSERT INTO bot.timetable (week, day, class, class_time, room_number)
VALUES
--Нечет--
--Понедельник -- 
(1, 1, 1, 4, 'А-502'), (1, 1, 3, 5, 'A-Л-203'),
--Вторник--
(1, 2, 5, 2, 'Н-340'), (1, 2, 8, 3, 'Н-С/Зал'),
--Среда--

--Четверг--
(1, 4, 8, 2, 'Н-С/Зал'), (1, 4, 9, 3, 'Н-514'), (1, 4, 10, 4, 'Н-410'), (1, 4, 11, 5, 'Н-310'),
--Пятница--
(1, 5, 14, 1, 'А-Л-207'), (1, 5, 4, 2, 'A-406'), (1, 5, 2, 3, 'А-ВЦ-302'),
--Суббота--


--Чет--
--Понедельник--
(2, 1, 2, 1, 'А-ВЦ-302'), (2, 1, 4, 2, 'А-Л-203'), (2, 1, 8, 3, 'А-С/Зал'),
--Вторрник--
(2, 2, 8, 1, 'Н-С/Зал'), (2, 2, 9, 2, 'Н-514'), (2, 2, 15, 3, 'Н-227'), (2, 2, 10, 4, 'Н-324'),
--Среда--
(2, 3, 6, 2, 'Н-226'), (2, 3, 7, 3, 'Н-332а'), (2, 3, 16, 4, 'Н-318'),
--Четверг--
(2, 4, 16, 1, 'Н-316'), (2, 4, 12, 2, 'Н-519'), (2, 4, 17, 3, 'Н-322'), (2, 4, 17, 4, 'Н-322'), (2, 4, 13, 5, 'Н-519');
--Пятница--

--Суббота--

--End.

INSERT INTO bot.teacher_subject (id, teacher, class)
VALUES
(18, 8, 4)
