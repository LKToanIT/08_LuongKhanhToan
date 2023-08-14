CREATE TABLE fresher_department (
    department_number TINYINT UNSIGNED PRIMARY KEY,
    department_name VARCHAR(20) NOT NULL
);
INSERT INTO fresher_department (department_number, department_name)
VALUES
(1, 'department01'),
(2, 'department02'),
(3, 'department03'),
(4, 'department04'),
(5, 'department05'),
(6, 'department06'),
(7, 'department07'),
(8, 'department08'),
(9, 'department09'),
(10, 'department10');
SELECT 
    *
FROM
    fresher_department;

CREATE TABLE employee_table (
    employee_number TINYINT UNSIGNED PRIMARY KEY,
    employee_name VARCHAR(20) NOT NULL,
    department_number TINYINT UNSIGNED NOT NULL,
    CONSTRAINT fk_department_number FOREIGN KEY (department_number)
        REFERENCES fresher_department (department_number)
);
INSERT INTO employee_table (employee_number, employee_name, department_number)
VALUES
(001,'nguyen van mot',10),
(002,'nguyen van hai',8),
(003,'nguyen van ba',9),
(004,'nguyen van bon',1),
(005,'nguyen van nam',2),
(006,'nguyen van sau',8),
(007,'nguyen van bay',9),
(008,'nguyen van tam',3),
(009,'nguyen van chin',8),
(010,'nguyen van muoi',7);
SELECT 
    *
FROM
    employee_table;

CREATE TABLE employee_skill_table (
    employee_number TINYINT UNSIGNED NOT NULL,
    skill_code VARCHAR(20) NOT NULL,
    date_registered DATE NOT NULL,
    CONSTRAINT fk_employee_number FOREIGN KEY (employee_number)
        REFERENCES employee_table (employee_number)
);
INSERT INTO employee_skill_table (employee_number, skill_code, date_registered)
VALUES
(001, 'java', '2023-1-2'),
(002, 'java, c++', '2023-1-29'),
(003, 'c#', '2023-2-12'),
(004, 'khong', '2023-9-21'),
(005, 'c++', '2023-10-9'),
(006, 'python', '2023-11-2'),
(007, 'khong co', '2023-12-31'),
(008, 'java, python', '2023-8-15'),
(009, 'c', '2023-7-15'),
(010, 'java, python, c#', '2023-5-3');
SELECT 
    *
FROM
    employee_skill_table;


-- question 3: lấy ra danh sách nhân viên có skill java
-- không dùng join
SELECT t1.employee_name, t2.skill_code
FROM employee_table as t1, employee_skill_table as t2
where t1.employee_number = t2.employee_number and skill_code LIKE '%java%';

-- dùng inner join        NÊN DÙNG JOIN VÌ TỐC ĐỘ TRUY VẤN NHANH HƠN SO VỚI CÂU LỆNH TRUY VẤN THÔNG THƯỜNG Ở TRÊN
SELECT 
    t1.employee_name, t2.skill_code
FROM
    employee_table t1
        INNER JOIN
    employee_skill_table t2 ON t1.employee_number = t2.employee_number WHERE t2.skill_code LIKE '%java%';


-- question 4: lấy ra danh sách phòng ban có >=3 nhân viên
SELECT 
    COUNT(employee_name), department_name
FROM
    fresher_department t1
        INNER JOIN
    employee_table t2 ON t1.department_number = t2.department_number
GROUP BY department_name
HAVING COUNT(employee_name) >= 3;


-- question 5: lấy ra danh sách nhân viên của mỗi phòng ban
SELECT 
    GROUP_CONCAT(t2.employee_name), t1.department_name
FROM
    fresher_department t1
        LEFT JOIN
    employee_table t2 ON t1.department_number = t2.department_number
GROUP BY t1.department_name;


-- question 6: lấy ra danh sách nhân viên có hơn 1 skill
SELECT 
    ET.*, -- lẩy ra toàn bộ các cột trong bảng employee
    COUNT(EST.employee_number) AS TOTAL
FROM
    employee_table ET
        JOIN
    employee_skill_table EST ON ET.employee_number = EST.employee_number
GROUP BY ET.employee_number
HAVING COUNT(EST.employee_number) > 1;

