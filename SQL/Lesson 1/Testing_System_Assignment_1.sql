DROP DATABASE IF EXISTS muoimotbang;
CREATE DATABASE muoimotbang;
USE muoimotbang;

CREATE TABLE department (
    departmentid TINYINT AUTO_INCREMENT PRIMARY KEY,
    departmentname VARCHAR(20) NOT NULL             -- vi du: sale, marketing
);
drop table department;
SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE positiontable (
    positionid TINYINT AUTO_INCREMENT PRIMARY KEY,
    positionname ENUM('dev', 'test', 'scrum master', 'pm') NOT NULL
);

CREATE TABLE accounttable (
    accountid TINYINT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(20) NOT NULL,
    username VARCHAR(30) NOT NULL,
    fullname VARCHAR(30) NOT NULL,
    departmentid TINYINT NOT NULL,
    positionid TINYINT NOT NULL,
    createdate DATETIME DEFAULT NOW()          -- now() được sử dụng với kiểu dữ liệu datetimE
);
DROP TABLE accounttable;
ALTER TABLE accounttable
ADD CONSTRAINT fk_department FOREIGN KEY (departmentid)
		REFERENCES department (departmentid),	
ADD CONSTRAINT fk_positiontable FOREIGN KEY (positionid)
        REFERENCES positiontable (positionid);

CREATE TABLE grouptable (
    groupid TINYINT AUTO_INCREMENT PRIMARY KEY,
    groupname VARCHAR(30) NOT NULL,
    creatorid TINYINT NOT NULL,
    createdate DATETIME DEFAULT NOW()
);

CREATE TABLE groupacc (
    groupid TINYINT,
    acccountid TINYINT NOT NULL,
    joindate DATETIME DEFAULT NOW(),
    CONSTRAINT fk_grouptable FOREIGN KEY (groupid)
        REFERENCES grouptable (groupid)
);
DROP TABLE groupacc;

CREATE TABLE typequestion (
    typeid TINYINT AUTO_INCREMENT PRIMARY KEY,
    typename ENUM('essay', 'multiple-choice')
);

CREATE TABLE categoryquestion (
    categoryid TINYINT AUTO_INCREMENT PRIMARY KEY,
    categoryname VARCHAR(20) NOT NULL             -- vi du: java, ruby, python, sql, .dotnet, postman,...
);

CREATE TABLE question (
    questionid TINYINT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(50) NOT NULL,
    categoryid TINYINT NOT NULL,
    typeid TINYINT NOT NULL,
    creatorid TINYINT NOT NULL,
    createdate DATETIME DEFAULT NOW(),
    CONSTRAINT fk_categoryquestion FOREIGN KEY (categoryid) REFERENCES categoryquestion(categoryid)
);

CREATE TABLE answer (
    answerid TINYINT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(50) NOT NULL,
    questionid TINYINT NOT NULL,
    iscorrect ENUM('correct', 'incorrect'),
	CONSTRAINT fk_question FOREIGN KEY (questionid) REFERENCES question(questionid)
);

CREATE TABLE exam (
    examid TINYINT AUTO_INCREMENT PRIMARY KEY,
    examcode TINYINT NOT NULL,
    title VARCHAR(30) NOT NULL,
    categoryid TINYINT NOT NULL,
    duration TINYINT NOT NULL,
    creatorid TINYINT NOT NULL,
    createdate DATETIME DEFAULT NOW()
);
ALTER TABLE exam
ADD CONSTRAINT fk_categoryid FOREIGN KEY (categoryid) REFERENCES categoryquestion(categoryid);

CREATE TABLE examquestion (
    examid TINYINT NOT NULL,
    questionid TINYINT NOT NULL,
    CONSTRAINT fk_examid FOREIGN KEY (examid) REFERENCES exam(examid)
);