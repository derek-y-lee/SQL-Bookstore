/* Derek Lee 
CS 31A Final Project Part 1
dlee_finalproject1.sql*/

SHOW warnings; /* enable warnings!*/ 

/*Creates the University database*/
CREATE DATABASE IF NOT EXISTS University;

USE University;

/*Drops the following tables if they already exist: Department, Course, Faculty, Student
Term, Section, Registration, Major, Location*/
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Faculty;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Term;
DROP TABLE IF EXISTS Section;
DROP TABLE IF EXISTS Registration;
DROP TABLE IF EXISTS Major;
DROP TABLE IF EXISTS Location;


/*Creates tables for: Department, Course, Faculty, Student
Term, Section, Registration, Major, Location*/
CREATE TABLE Department(
dept_id VARCHAR (20) NOT NULL,
dept_name VARCHAR (30),
budget VARCHAR (20),
PRIMARY KEY (dept_id)
)ENGINE = INNODB;

CREATE TABLE Course(
course_id VARCHAR (20) NOT NULL,
title VARCHAR (100),
credits VARCHAR (20),
dept_id VARCHAR (20),
prerequisite VARCHAR (20),
PRIMARY KEY (course_id)
)ENGINE = INNODB;

CREATE TABLE Faculty(
faculty_id VARCHAR (20) NOT NULL,
name VARCHAR (30),
room_id VARCHAR (20),
dept_id VARCHAR (20),
salary INT,
PRIMARY KEY (faculty_id)
)ENGINE = INNODB;

CREATE TABLE Student(
student_id VARCHAR (20) NOT NULL,
last_name VARCHAR (30),
first_name VARCHAR (20),
street VARCHAR (20),
city VARCHAR (20),
state VARCHAR (20),
zip INT,
birth_date date,
major_id VARCHAR (20),
phone VARCHAR (10),
student_type VARCHAR (20),
PRIMARY KEY (student_id)
)ENGINE = INNODB;

CREATE TABLE Term(
term_id VARCHAR (20) NOT NULL,
term_desc VARCHAR (30),
start_date date,
end_date date,
PRIMARY KEY (term_id)
)ENGINE = INNODB;

CREATE TABLE Section(
section_id VARCHAR (20) NOT NULL,
course_id VARCHAR (20),
section_number VARCHAR (20),
term_id VARCHAR (20),
faculty_id VARCHAR (20),
day VARCHAR (20),
max_count INT,
start_time TIME,
end_time TIME,
room_id VARCHAR(20),
PRIMARY KEY (section_id)
)ENGINE = INNODB;

CREATE TABLE Registration(
student_id VARCHAR (20) NOT NULL,
section_id VARCHAR (20) NOT NULL,
midterm_grade VARCHAR (20),
final_grade VARCHAR (20),
PRIMARY KEY (student_id, section_id)
)ENGINE = INNODB;

CREATE TABLE Major(
major_id VARCHAR (20) NOT NULL,
major_desc VARCHAR (150),
PRIMARY KEY (major_id)
)ENGINE = INNODB;

CREATE TABLE Location(
room_id VARCHAR (20) NOT NULL,
building VARCHAR (20),
room_no INT,
capacity VARCHAR (20),
room_type VARCHAR (20),
room_description VARCHAR (20),
PRIMARY KEY (room_id)
)ENGINE = INNODB;

/*Inserts data for the following tables: Department, Course, Faculty, Student
Term, Section, Registration, Major, Location*/

INSERT INTO Department (dept_id, dept_name, budget) 
VALUES (1, 'Computer Science', 90000),
(2, 'Telecommunications', 100000),
(3, 'Accounting', 85000),
(4, 'Math and Science', 120000),
(5, 'Liberal Arts', 800000),
(6, 'English', 70000);


INSERT INTO Course (course_id, title, credits, dept_id, prerequisite) 
VALUES ('AC101', 'Accounting', 3, 3, 'EN100'),
('CIS253', 'Database Systems', 3, 1, NULL),
('AC265', 'Systems Analysis', 3, 3, 'CIS253'),
('EN100', 'Basic English', 0, 6, NULL),
('LA123', 'English Literature', 3, 4, 'EN100'),
('MA150', 'College Algebra', 3, 4, 'EN100');



INSERT INTO Faculty (faculty_id, name, room_id, dept_id, salary) 
VALUES (63395, 'Jones', 11, 1, 94333.99),
(78699, 'Mobley', 11, 1, 59303.62),
(96895, 'Williams', 20, 2, 119921.41),
(79653, 'Vajpayee', 12, 2, 88791.45),
(97302, 'Collins', 17, 3, 61387.56),
(57180, 'Sen', 12, 3, 32570.50),
(74420, 'Rivera', 21, 4, 89805.83),
(35579, 'Chang', 17, 5, 108011.81),
(98377, 'Brad', 12, 6, 35570.50); 



INSERT INTO Student (student_id, last_name, first_name, street, city, 
state, zip, birth_date, major_id, phone, student_type) 
VALUES (24746, 'Diaz', 'Jose', '1 Ford Avenue #7', 'Hill', 'NJ', 08863, '1993-02-12', 100, 9735551111, 'ugrad'), 
(79352, 'Tyler', 'Kee', '12 Morris Avenue', 'Bronx', 'NY', 10468, '1994-03-18', 500, 7185552222, 'grad'), 
(76672, 'Miliko', 'Rajesh', '25 River Road #3', 'Edison', 'NJ', 08837, '1995-12-12', 400, 7325553333, 'ugrad'),
(14182, 'Rickles', 'Alex', '100 Main Street', 'Iselin', 'NJ', 08838, '1990-10-20', 500, 7325554444, 'grad'),  
(44985, 'Lee', 'Ho', '2845 First Lane', 'Hope', 'NY', 11373, '1995-10-28', 600, 2125555555, 'grad'), 
(96052, 'Holn', 'Amir', '213 Broadway', 'Clifton', 'NJ', 07222, '1994-07-07', 200, 2015556666, 'ugrad');


INSERT INTO Term (term_id, term_desc, start_date, end_date) 
VALUES ('FL16', 'Fall 2016', '2016-09-08', '2016-12-20'),
('FL17', 'Fall 2017', '2017-09-07', '2017-12-19'),
('SP16', 'Spring 2016', '2016-04-28', '2016-07-16'),
('SP17', 'Spring 2017', '2017-03-27', '2017-07-15'),
('WN17', 'Winter 2017', '2017-01-05', '2017-04-18'); 


INSERT INTO Section (section_id, course_id, section_number, term_id, faculty_id,
day, max_count, start_time, end_time, room_id) 
VALUES (1101, 'AC265', 01, 'WN17', 97302, 'MW', 30, '9:00', '10:30', 13),
(1102, 'CIS253', 01, 'WN17', 78699, 'TR', 40, '9:00', '10:30', 18),
(1103, 'MA150', 02, 'WN17', 74420, 'F', 25, '9:00', '12:00', 15),
(1104, 'AC101', 01, 'FL17', 57180, 'MW', 35, '10:30', '12:00', 16),
(1205, 'AC265', 01, 'SP17', 97302, 'MW', 35, '9:00', '10:30', 14),
(1206, 'AC265', 02, 'SP17', 97302, 'TR', 30, '9:00', '10:30', 18),
(1207, 'LA123', 05, 'SP17', NULL, 'MW', 35, '9:00', '10:30', 15),
(1208, 'CIS253', 21, 'SP17', 78699, 'TR', 40, '9:00', '10:30', 14),
(1209, 'CIS253', 11, 'FL17', 63395, 'MW', 40, '9:00', '10:30', 18),
(1210, 'CIS253', 31, 'FL17', 78699, 'F', 45, '9:00', '12:00', 19),
(1311, 'EN100', 01, 'FL17', 98377, 'MW', 50, '9:00', '10:30', 14);


INSERT INTO Registration (student_id, section_id, midterm_grade, final_grade) 
VALUES(24746, 1102, 'B', 'B'),
(24746, 1103, 'C', 'F'),
(24746, 1104, 'B', 'A'), 
(24746, 1207, NULL, NULL),
(79352, 1205, NULL, NULL),
(76672, 1102, 'F', 'D'),
(76672, 1103, 'A', 'A'),
(76672, 1206, 'B', 'C'),
(76672, 1207, NULL, NULL),
(76672, 1210, NULL, NULL),
(14182, 1101, 'F', 'W'),
(14182, 1104, 'D', 'D'),
(14182, 1206, 'A', 'B'),
(14182, 1311, 'A', 'A'),
(44985, 1206, NULL, NULL),
(44985, 1207, NULL, NULL),
(44985, 1210, NULL, NULL),
(96052, 1208, NULL, NULL),
(96052, 1209, NULL, NULL),
(96052, 1311, 'B', 'B');


INSERT INTO Major (major_id, major_desc) 
VALUES (100, 'AAS-Accounting'),
(200, 'AAS-Computer Science'),
(300, 'AAS-Telecommunications'),
(400, 'BS-Accounting'),
(500, 'BS-Computer Science'),
(600, 'BS-Telecommunications');


INSERT INTO Location (room_id, building, room_no, capacity, room_type, room_description) 
VALUES (11, 'Gandhi', 101, 2, 'O', 'Office'),
(12, 'Gandhi', 103, 2, 'O', 'Office'),
(13, 'Kennedy', 202, 35, 'L', 'Lab'),
(14, 'Kennedy', 204, 50, 'L', 'Lab'),
(15, 'Nehru', 301, 50, 'C', 'Classroom'),
(16, 'Nehru', 309, 45, 'C', 'Classroom'),
(17, 'Gandhi', 105, 2, 'O', 'Office'),
(18, 'Kennedy', 206, 40, 'L', 'Lab'),
(19, 'Kennedy', 210, 30, 'C', 'Classroom'),
(20, 'Gandhi', 107, 2, 'O', 'Office'),
(21, 'Gandhi', 109, 2, 'O', 'Office'); 

