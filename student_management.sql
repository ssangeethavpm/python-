CREATE DATABASE STUDENT_MANAGEMENT;
USE STUDENT_MANAGEMENT;
-- TABLE STUDENT
CREATE TABLE student(
s_id varchar(10) primary key,
s_fname char(20) NOT NULL,
s_lname char(20) NOT NULL
);

-- INSERT STUDENT
INSERT INTO student(s_id,s_fname,s_lname) VALUES
("S_001","ALAN","SMITH"),
("S_002","BON","JONES"),
("S_003","EVA","LEE"),
("S_004","BON","JONES"),
("S_005","JOHN","LENNON");
-- TABLE DEPARTMENT
CREATE TABLE department(
dep_code char(5) PRIMARY KEY,
dep_name char(40) NOT NULL UNIQUE
);
drop table department;
-- INSERT DEPARTMENT
INSERT INTO department(dep_code,dep_name) VALUES
("d_01","English"),
("d_02","physics"),
("d_03","computer"),
("d_04","science"),
("d_05","maths");
-- TABLE INSTRUCTOR
CREATE TABLE instructor(
ins_id char(9) PRIMARY KEY,
ins_fname char(20) NOT NULL,
ins_lname char(20) NOT NULL,
dep_code char(5) NOT NULL REFERENCES department(dep_code)
);
drop table instructor;
-- INSERT INSTRUCTOR
INSERT INTO instructor(ins_id,ins_fname,ins_lname,dep_code) VALUES
("I1","DAVID","JORDAN","S_001"),
("I2","HURRY","SMITH","S_001"),
("I3","CARRY","CHAN","S_002"),
("I4","KEVIN","ROBIN","S_003"),
("I5","JOHN","KEN","S_004"),
("I6","TIM","SMITH","S_005");
-- TABLE LOCATION
CREATE TABLE  location(
loc_code char(5) PRIMARY KEY,
loc_name char(30) NOT NULL,
loc_country char(20) NOT NULL
);

-- INSERT LOCATION
INSERT INTO location(loc_code,loc_name,loc_country) VALUES 
("loc_1","Birmingham","united kingdom"),
("loc_2","london","united kingdom"),
("loc_3","chennai","india");
select * from location;

-- TABLE COURSE
CREATE TABLE course(
c_code char(10) PRIMARY KEY,
c_title varchar(30) NOT NULL,
dep_code char(4) NOT NULL REFERENCES department(dep_code)
);
-- INSERT COURSE
INSERT INTO course(c_code,c_title,dep_code) VALUES
("c1","java","d_03"),
("c2","python","d_03"),
("c3","phonics","d_01"),
("c4","algebra","d_05"),
("c5","plants","d_04"),
("c6","python","d_03");

-- TABLE SECTION
CREATE TABLE section(
sec_id int PRIMARY KEY,
sec_term char(8),
sec_room char(10),
sec_time char(10),
c_code char(10) NOT NULL REFERENCES course(c_code),
loc_code char(5) NOT NULL REFERENCES location(loc_code),
ins_id char(9) REFERENCES instructor(ins_id)
);
DROP TABLE SECTION;
-- INSERT SECTION
INSERT INTO section(sec_id,sec_term,sec_room,sec_time,c_code,loc_code,ins_id) VALUES
(001,"A","A","12AM","C1","LOC_1","I1"),
(002,"A","A","2AM","C1","LOC_2","I2"),
(003,"B","B","12AM","C2","LOC_3","I3"),
(004,"C","C","12AM","C3","LOC_4","I2"),
(005,"D","D","12AM","C5","LOC_5","I1"),
(006,"E","E","12AM","C6","LOC_6","I3");

-- TABLE ENROLLMENT

CREATE TABLE enrollment(
s_id char(9) REFERENCES student(s_id),
sec_id int REFERENCES section(sec_id),
grade_code char(2),
PRIMARY KEY(s_id,sec_id)
);
-- INSERT ENROLLMENT
INSERT INTO enrollment(s_id,sec_id,grade_code) VALUES
("S_001",001,"A+"),
("S_002",002,"A"),
("S_003",003,"B"),
("S_004",004,"C"),
("S_005",005,"D");


-- TABLE QUALIFIED
CREATE TABLE qualified(
ins_id char(9) REFERENCES instructor(ins_id),
c_code char(10) REFERENCES course(c_code),
PRIMARY KEY(INS_ID,C_CODE)
);
-- INSERT QUALIFIED
INSERT INTO qualified(ins_id,c_code) VALUES
("I1","C6"),
("I2","C5"),
("I3","C4"),
("I4","C3"),
("I5","C2"),
("I6","C1");

-- REQUIREMENT: USE JOINS THAT COMBINES MULTIPLE TABLES USING VIEW.
-- INNER JOIN
CREATE VIEW vw_student
AS
SELECT student.*,sec_id,grade_code from student INNER JOIN enrollment ON student.s_id=enrollment.s_id;

SELECT * FROM vw_student;

-- REQUIREMENT 2:
DELIMITER //
CALL procedurestudent();
DELIMITER //
ALTER PROCEDURE pro()
BEGIN
SELECT * FROM COURSE;
END //
DELIMITER ;
-- calling procedure 'pro'
call pro();
call show_qualified();


-- Requirement 3
-- Query with the subquery to demonstate data analysis
-- List the student id ,name whose grade code=A.
SELECT * FROM STUDENT WHERE s_id= (SELECT s_id FROM enrollment WHERE grade_code='A');

-- Retrive the instructor name whose  department name which is equal to s_001


INSERT INTO location(loc_code,loc_name,loc_country) VALUES 
("loc_1","Birmingham","united kingdom"),
("loc_2","london","united kingdom"),
("loc_3","chennai","india");
drop table location;

INSERT INTO location(loc_code,loc_name,loc_country) VALUES 
("loc_4","Birmingham","Ireland");

INSERT INTO section(sec_id,sec_term,sec_room,sec_time,c_code,loc_code,ins_id) VALUES
(001,"A","A","12AM","C1","LOC_1","I1"),
(002,"A","A","2AM","C1","LOC_2","I2"),
(003,"B","B","12AM","C2","LOC_3","I3"),
(004,"C","C","12AM","C3","LOC_4","I2"),
(005,"D","D","12AM","C5","LOC_5","I1"),
(006,"E","E","12AM","C6","LOC_6","I3");
-- select the location where the location code is c2
SELECT * FROM LOCATION WHERE LOC_CODE=(SELECT LOC_CODE FROM SECTION WHERE C_CODE='C2');

-- Query with group by and having
SELECT sec_id,sec_term,sec_room,sec_time,c_code,loc_code,ins_id FROM SECTION  GROUP BY ins_id HAVING sec_id=001;

-- Using trigger
CREATE TRIGGER trig_loc
BEFORE
INSERT
ON LOCATION
FOR each row
BEGIN
 IF NEW.loc_country="united kingdom" THEN SET NEW.loc_country="France";
 END IF;
END




