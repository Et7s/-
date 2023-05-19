CREATE SCHEMA service;
CREATE TABLE service.users ( id serial PRIMARY KEY, full_name varchar (55) NOT NULL, login varchar (120) NOT NULL, password varchar (120) NOT NULL);

INSERT INTO service.users (id, full_name, login, password) VALUES (1, 'Ivanov Ivan', 'ivanov', '123456'); 
INSERT INTO service.users (id, full_name, login, password) VALUES (2, 'Tina Sanders', 'TiSa', '123456');
INSERT INTO service.users (id, full_name, login, password) VALUES (3, 'Steven Brown', 'StBr', '111111'); 
INSERT INTO service.users (id, full_name, login, password) VALUES (4, 'Charles Stone', 'ChSt', '222222');
INSERT INTO service.users (id, full_name, login, password) VALUES (5, 'Deborah Barker', 'DeBa', '333333'); 
INSERT INTO service.users (id, full_name, login, password) VALUES (6, 'Ruby Allen', 'RuAl', '555555');
INSERT INTO service.users (id, full_name, login, password) VALUES (7, 'Margaret Carroll', 'MaCa', '121212'); 
INSERT INTO service.users (id, full_name, login, password) VALUES (8, 'Christopher Arnold', 'ChAr', '323232');
INSERT INTO service.users (id, full_name, login, password) VALUES (9, 'Martha Andrews', 'MaAn', '010101'); 
INSERT INTO service.users (id, full_name, login, password) VALUES (10, 'Shannon Evans', 'ShEv', '999999');
