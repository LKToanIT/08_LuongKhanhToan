DROP DATABASE IF EXISTS muoimotbang;
CREATE DATABASE muoimotbang;
USE muoimotbang;


-- tạo bảng department
CREATE TABLE department (
    departmentid TINYINT AUTO_INCREMENT PRIMARY KEY,
    departmentname VARCHAR(20) NOT NULL             -- vi du: sale, marketing
);

drop table department;
SET FOREIGN_KEY_CHECKS=0;
-- thêm dữ liệu cho bảng department
INSERT INTO Department	(DepartmentName) VALUE
						(N'Marketing'	),
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc'),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Phòng chờ'	);



-- tạo bảng position
CREATE TABLE position (
    positionid TINYINT AUTO_INCREMENT PRIMARY KEY,
    positionname ENUM('dev', 'test', 'scrum master', 'pm') NOT NULL
);
-- thêm dữ liêu cho bảng position
INSERT INTO position	( PositionName	)
VALUE 					('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			);
drop table position;



-- tạo bảng accounttable
CREATE TABLE accounttable (
    accountid TINYINT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(20) NOT NULL,
    username VARCHAR(30) NOT NULL,
    fullname VARCHAR(30) NOT NULL,
    departmentid TINYINT NOT NULL,
    positionid TINYINT NOT NULL,
    createdate DATETIME DEFAULT NOW()          -- now() được sử dụng với kiểu dữ liệu datetime
);
DROP TABLE accounttable;

ALTER TABLE accounttable
ADD CONSTRAINT fk_department FOREIGN KEY (departmentid)
		REFERENCES department (departmentid),	
ADD CONSTRAINT fk_positiontable FOREIGN KEY (positionid)
        REFERENCES positiontable (positionid);
        
ALTER TABLE accounttable
MODIFY COLUMN email VARCHAR(50) NOT NULL; -- đầu vào dữ liệu email lớn hơn so với khai báo ban đầu

INSERT INTO accounttable(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUE 				('haidang29productions@gmail.com'	, 'dangblack'		,'Nguyen Hai Dang'		,   '5'			,   '1'		,'2020-03-05'),
					('account1@gmail.com'				, 'quanganh'		,'Tong Quang Anh'		,   '1'			,   '2'		,'2020-03-05'),
                    ('`Account`@gmail.com'				, 'vanchien'		,'Nguyen Van Chien'		,   '2'			,   '3'		,'2020-03-07'),
                    ('account3@gmail.com'				, 'cocoduongqua'	,'Duong Do'				,   '3'			,   '4'		,'2020-03-08'),
                    ('account4@gmail.com'				, 'doccocaubai'		,'Nguyen Chien Thang'	,   '5'			,   '4'		,'2020-03-10'),
                    ('dapphatchetngay@gmail.com'		, 'khabanh'			,'Ngo Ba Kha'			,   '5'			,   '3'		,'2020-04-05'),
                    ('songcodaoly@gmail.com'			, 'huanhoahong'		,'Bui Xuan Huan'		,   '7'			,   '2'		,'2020-04-05'),
                    ('sontungmtp@gmail.com'				, 'tungnui'			,'Nguyen Thanh Tung'	,   '5'			,   '1'		,'2020-04-07'),
                    ('duongghuu@gmail.com'				, 'duongghuu'		,'Duong Van Huu'		,   '9'			,   '2'		,'2020-04-07'),
                    ('vtiaccademy@gmail.com'			, 'vtiaccademy'		,'Vi Ti Ai'				,   '10'		,   '1'		,'2020-04-09');



-- tạo bảng grouptable
CREATE TABLE grouptable (
    groupid TINYINT AUTO_INCREMENT PRIMARY KEY,
    groupname VARCHAR(30) NOT NULL,
    creatorid TINYINT NOT NULL,
    createdate DATETIME DEFAULT NOW()
);
DROP TABLE grouptable;
-- thêm dữ liệu cho bảng grouptable
INSERT INTO grouptable (  GroupName			, CreatorID		, CreateDate)
VALUE 				('Testing System'		,   5			,'2019-03-05'),
					('Developement'		,   1			,'2020-03-07'),
                    ('VTI Sale 01'			,   2			,'2020-03-09'),
                    ('VTI Sale 02'			,   3			,'2020-03-10'),
                    ('VTI Sale 02'			,   4			,'2020-03-28'),
                    ('VTI Creator'			,   6			,'2020-04-06'),
                    ('VTI Marketing 01'	,   7			,'2020-04-07'),
                    ('Management'			,   8			,'2020-04-08'),
                    ('Chat with love'		,   9			,'2020-04-09'),
                    ('Vi Ti Ai'			,   10			,'2020-04-10');



-- tạo bảng groupacc
CREATE TABLE groupacc (
    groupid TINYINT,
    accountid TINYINT NOT NULL,
    joindate DATETIME DEFAULT NOW(),
    CONSTRAINT fk_grouptable FOREIGN KEY (groupid)
        REFERENCES grouptable (groupid)
);
DROP TABLE groupacc;
-- thêm dữ liệu cho bảng groupacc
INSERT INTO groupacc	(  groupid	, accountid	, joindate	 )
VALUE 						(	1		,    1		,'2019-03-05'),
							(	1		,    2		,'2020-03-07'),
							(	3		,    3		,'2020-03-09'),
							(	3		,    4		,'2020-03-10'),
							(	5		,    5		,'2020-03-28'),
							(	1		,    3		,'2020-04-06'),
							(	1		,    7		,'2020-04-07'),
							(	8		,    3		,'2020-04-08'),
							(	1		,    9		,'2020-04-09'),
							(	10		,    10		,'2020-04-10');



-- tạo bảng typequestion
CREATE TABLE typequestion (
    typeid TINYINT AUTO_INCREMENT PRIMARY KEY,
    typename ENUM('essay', 'multiple-choice')
);
-- thêm dữ liệu chon bảng typequestion
INSERT INTO TypeQuestion	(TypeName			)
VALUE 						('Essay'			),
							('Multiple-Choice'	);



-- tạo bảng categoryquestion
CREATE TABLE categoryquestion (
    categoryid TINYINT AUTO_INCREMENT PRIMARY KEY,
    categoryname VARCHAR(20) NOT NULL             -- vi du: java, ruby, python, sql, .dotnet, postman,...
);
-- thêm dữ liệu cho bảng categoryquestion
INSERT INTO CategoryQuestion		(CategoryName	)
VALUE 								('Java'			),
									('ASP.NET'		),
									('ADO.NET'		),
									('SQL'			),
									('Postman'		),
									('Ruby'			),
									('Python'		),
									('C++'			),
									('C Sharp'		),
									('PHP'			);



-- tạo bảng question
CREATE TABLE question (
    questionid TINYINT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(50) NOT NULL,
    categoryid TINYINT NOT NULL,
    typeid TINYINT NOT NULL,
    creatorid TINYINT NOT NULL,
    createdate DATETIME DEFAULT NOW(),
    CONSTRAINT fk_categoryquestion FOREIGN KEY (categoryid) REFERENCES categoryquestion(categoryid)
);
-- thêm dữ liệu cho bảng question
INSERT INTO Question	(Content			, CategoryID, TypeID	, CreatorID	, CreateDate )
VALUE 					(N'Câu hỏi về Java'	,	10		,   '1'		,   '1'		,'2019-03-05'),
						(N'Câu Hỏi về PHP'	,	10		,   '2'		,   '2'		,'2019-03-05'),
						(N'Hỏi về C#'		,	10		,   '2'		,   '3'		,'2020-03-06'),
						(N'Hỏi về Ruby'		,	6		,   '1'		,   '4'		,'2020-03-06'),
						(N'Hỏi về Postman'	,	1		,   '1'		,   '5'		,'2020-04-06'),
						(N'Hỏi về ADO.NET'	,	3		,   '2'		,   '6'		,'2020-04-06'),
						(N'Hỏi về ASP.NET'	,	2		,   '1'		,   '7'		,'2020-04-06'),
						(N'Hỏi về C++'		,	8		,   '1'		,   '8'		,'2020-04-07'),
						(N'Hỏi về SQL'		,	4		,   '2'		,   '9'		,'2020-04-07'),
						(N'Hỏi về Python'	,	7		,   '1'		,   '10'	,'2020-04-07');
                        
                        
-- tạo bảng answer
CREATE TABLE answer (
    answerid TINYINT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(50) NOT NULL,
    questionid TINYINT NOT NULL,
    iscorrect ENUM('0', '1'),
	CONSTRAINT fk_question FOREIGN KEY (questionid) REFERENCES question(questionid)
);
-- thêm dữ liệu cho bảng answer

INSERT INTO answer	(  content		, questionid	, iscorrect	) -- dữ liệu kiểu enum luôn phải đặt trong dấu nháy đơn
VALUE 				('Trả lời 01'	,   2			,	'0'		),
					('Trả lời 02'	,   2			,	'1'		),
                    ('Trả lời 03'	,   2			,	'0'		),
                    ('Trả lời 04'	,   1			,	'1'		),
                    ('Trả lời 05'	,   2			,	'1'		),
                    ('Trả lời 06'	,   3			,	'1'		),
                    ('Trả lời 07'	,   4			,	'0'		),
                    ('Trả lời 08'	,   8			,	'0'		),
                    ('Trả lời 09'	,   9			,	'1'		),
                    ('Trả lời 10'	,   10			,	'1'		);
                    
                    
-- tạo bảng exam
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
MODIFY COLUMN examcode char(7)  NOT NULL;
ALTER TABLE exam
ADD CONSTRAINT fk_categoryquestion2 FOREIGN KEY (categoryid) REFERENCES categoryquestion(categoryid);
-- thêm dữ liệu cho bảng exam
INSERT INTO exam	(examcode			, title					, categoryid	, duration	, creatorid		, createdate )
VALUE 				('VTIQ001'		, 'Đề thi C#'			,	1			,	60		,   '5'			,'2014-04-05'),
					('VTIQ002'		, 'Đề thi PHP'			,	10			,	60		,   '1'			,'2016-04-05'),
                    ('VTIQ003'		, 'Đề thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    ('VTIQ004'		, 'Đề thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ005'		, 'Đề thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ006'		, 'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ007'		, 'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ008'		, 'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ009'		, 'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ010'		, 'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');



-- tạo bảng examquestion
CREATE TABLE examquestion (
    examid TINYINT AUTO_INCREMENT NOT NULL,
    questionid TINYINT NOT NULL,
    CONSTRAINT fk_examid FOREIGN KEY (examid) REFERENCES exam(examid)
);
-- thêm dữ liệu cho bảng examquestion
INSERT INTO examquestion(questionid)
VALUE 						(1),
							(10),
							(1),
							(1),
							(5),
							(10),
							(7),
							(8),
							(9),
							(10);