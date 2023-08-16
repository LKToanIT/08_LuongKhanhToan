drop database if exists extra_assignment_6;
create database extra_assignment_6;
use extra_assignment_6;

-- tạo bảng project_modules
drop table if exists project_modules;
set foreign_key_checks = 0;-- cần set foreign_key_checks = 0; vì có 2 liên kết khóa ngoại trong bảng mà các bảng cần liên kết chưa tạo
create table project_modules(
module_id char(5) primary key,
project_id char(5) not null,
employee_id char(5) not null,
project_modules_date date not null, -- ngày hoàn thành module theo kế hoạch ban đầu
project_modules_completed_on datetime not null default now(), -- thời điểm hoàn thành module thực tế (không theo kế hoạch)
project_modules_description varchar(50) not null,
constraint fk_projects foreign key (project_id) references projects(project_id),
constraint fk_employee1 foreign key (employee_id) references employee(employee_id)
);

-- tạo bảng work_done
drop table if exists work_done;
create table work_done(
work_done_id char(5) primary key,
module_id char(5) not null,
employee_id char(5) not null,
work_done_date date, -- date = null nếu chưa hoàn thành
work_done_description varchar(50) not null,
work_done_status varchar(50) not null,
constraint fk_project_modules foreign key (module_id) references project_modules(module_id));

-- tạo bảng projects
drop table if exists projects;
create table projects(
project_id char(5) primary key,
manager_id char(5) not null,
project_name varchar(50) not null,
project_start_date date not null,
project_description varchar(50) not null,
project_detail varchar(50) not null,
project_completed_on varchar(50) not null, -- ngày thực tế hoàn thành project
constraint fk_employee2 foreign key (manager_id) references employee(employee_id)
);

-- tạo bảng employee
drop table if exists employee;
create table employee(
employee_id char(5) primary key,
employee_last_name varchar(10) not null, 
employee_first_name varchar(10) not null,
employee_hire_date date not null,
employee_status varchar(50) not null, 
supervisor_id char(5) not null unique, -- cũng chính là employee_id
social_security_number char(10) not null unique,
constraint check (supervisor_id = employee_id) -- kiểm tra supervisor_id có bằng employee_id hay không
);
alter table employee
add constraint fk_employee3 foreign key (supervisor_id) references employee(employee_id);

-- thêm dữ liệu cho bảng project_modules
insert into project_modules (module_id, project_id, employee_id , project_modules_date , project_modules_completed_on , project_modules_description)
values
('md01', 'p01', 'e01', '2022-1-1', '2022-2-1', 'tre thoi han'),
('md02', 'p02', 'e02', '2022-2-2', '2022-2-1', 'som hon du kien'),
('md03', 'p03', 'e03', '2022-3-3', '2022-3-3', 'dung thoi han'),
('md04', 'p03', 'e04', '2022-4-4', '2022-4-10', 'tre thoi han'),
('md05', 'p02', 'e01', '2022-5-5', '2022-5-1', 'som hon du kien');

-- thêm dữ liệu cho bảng work_done
insert into work_done (work_done_id, module_id, employee_id, work_done_date, work_done_description, work_done_status)
values
('w01','md02','e03', '2022-1-1', 'hoan thanh som', 'da hoan thanh'),
('w02','md03','e02', '2022-2-2', 'hoan thanh tre', 'da hoan thanh'),
('w03','md04','e03', '2022-3-3', 'hoan thanh som', 'da hoan thanh'),
('w04','md05','e01', '2022-4-4', 'hoan thanh tre', 'da hoan thanh'),
('w05','md01','e04', '2022-5-4', 'hoan thanh som', 'da hoan thanh');

-- thêm dữ liệu cho bảng projects
insert into projects (project_id, manager_id, project_name, project_start_date, project_description, project_detail, project_completed_on)
values
('p01', 'e01', 'app ngan hang', '2020-1-1', 'da hoan thanh', '2 nam', '2022-1-1'),
('p02', 'e02', 'app cho vay lai', '2022-2-3', 'da hoan thanh', '1 nam 6 thang', '2023-8-16'),
('p03', 'e03', 'du an game', '2021-11-5', 'da hoan thanh', '4 thang', '2022-3-14'),
('p04', 'e04', 'app bao thuc', '2022-12-1', 'da hoan thanh', '1 thang', '2022-12-31'),
('p05', 'e05', 'game offline', '2023-6-4', 'chua hoan thanh', 'dang tiep tuc', '2023-12-12');
delete from projects;

-- thêm dữ liệu cho bảng employee
insert into employee (employee_id, employee_last_name, employee_first_name, employee_hire_date, employee_status, supervisor_id, social_security_number)
values
('e01', 'nguyen', 'thi ha', '2020-12-3', 'nv cu', 'e01', 'n01'),
('e02', 'tran', 'van phuc', '2023-8-16', 'nv moi', 'e02', 'n02'),
('e03', 'pham', 'tu uyen', '2019-3-6', 'nv cu', 'e03', 'n03'),
('e04', 'phan', 'van phuc', '2021-11-2', 'nv cu', 'e04', 'n04'),
('e05', 'le', 'anh tu', '2022-9-14', 'nv cu', 'e05', 'n05');
select* from employee;
delete from employee;


-- question b:
DROP PROCEDURE IF EXISTS remove_project_done;
DELIMITER $$
CREATE PROCEDURE remove_project_done()
BEGIN
    DECLARE deleted_count INT;
	DELETE FROM projects WHERE project_completed_on IS NOT NULL AND DATE_ADD(project_start_date, INTERVAL 3 MONTH) > CURDATE();
    SET deleted_count = ROW_COUNT();
    -- Print the count of deleted records
    -- PRINT CONCAT('Deleted ', deleted_count, ' records.');
    SELECT deleted_count;
    
END$$
DELIMITER ;

CALL remove_project_done();


-- question c:
DROP PROCEDURE IF EXISTS module_inprogress;
DELIMITER $$
CREATE PROCEDURE module_inprogress(IN in_projectid TINYINT UNSIGNED)
BEGIN

	SELECT 		project_id, module_id
    FROM		project_modules
    WHERE		project_id = in_projectid AND project_modules_completed_on is NULL;

END$$
DELIMITER ;

call module_inprogress(1);


-- question d:
DROP PROCEDURE IF EXISTS employee_joined;
DELIMITER $$
CREATE PROCEDURE employee_joined(IN in_employee_id TINYINT UNSIGNED)
BEGIN

	SELECT 		employee_id, CONCAT(employee_last_name, ' ', employee_first_name)
    FROM		employee
    WHERE		employee_id NOT IN (SELECT employee_id FROM work_done);

END$$
DELIMITER ;

call employee_joined(1);