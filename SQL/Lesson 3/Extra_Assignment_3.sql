drop database if exists fresher;
create database fresher;
use fresher;
drop table if exists Fresher_Management;
CREATE TABLE Fresher_Management (
    TraineeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Full_Name NVARCHAR(30) NOT NULL,
    Birth_Date DATE NOT NULL,
    Gender ENUM('male', 'female', 'unknown') NOT NULL,
    ET_IQ TINYINT UNSIGNED CHECK (ET_IQ <= 20),
    ET_Gmath TINYINT UNSIGNED CHECK (ET_Gmath <= 20),
    ET_English TINYINT UNSIGNED CHECK (ET_English <= 50),
    Training_Class CHAR(10),
    Evaluation_Note TEXT
);

ALTER TABLE Fresher_Management
ADD COLUMN VTI_account VARCHAR(30) NOT NULL UNIQUE;


-- question 1: nhập dữ liệu 
INSERT INTO Fresher_Management (Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Note, VTI_account)
VALUES                       --  nvarchar      date      enum              tinyint                 char           text          varchar
(N'Phan Văn Phúc', '1999-1-1', 'male', 19, 19, 49, 'class01', 'online', 'account01'), 
(N'Nguyễn Lan Phương', '1974-11-2', 'female', 18, 10, 40, 'class02', 'offline', 'account02'),
(N'Phạm Quang Thắng', '1970-12-21', 'male', 17, 5, 29, 'class03', 'offline', 'account03'),
(N'Trần Công Lý', '1972-2-13', 'male', 16, 4, 12, 'class04', 'offline', 'account04'),         -- không cần nhập dữ liệu cho cột ID vì có AUTO_INCREMENT
(N'Nguyễn Thị Vân Dung', '1972-12-29', 'female', 14, 5, 23, 'class05', 'online', 'account05'),-- dữ liệu kiểu nvarchar khi nhập có N 
(N'Phan Trí Trung', '1965-7-15', 'male', 15, 9, 17, 'class06', 'online', 'account06'),        -- dữ liệu kiểu số không cần đặt trong dấu ' '
(N'Trần Mỹ Quỳnh', '2003-12-31', 'female', 20, 19, 49, 'class07', 'offline', 'account07'),
(N'Minh Vương', '1981-9-18', 'male', 16, 7, 31, 'class08', 'offline', 'account08'),
(N'Anh Tú', '1993-1-6', 'male', 19, 15, 42, 'class09', 'online', 'account09'),
(N'Duy Mạnh', '1971-4-28', 'male', 9, 12, 43, 'class10', 'offline', 'account10'),
(N'Duy Mạnh Nguyễn', '1971-4-9', 'male', 9, 12, 43, 'class10', 'offline', 'account11');


select* from Fresher_Management;
select TraineeID, Full_Name, Birth_Date from Fresher_Management; -- TraineeID không được nhập bằng lệnh INSERT INTO VALUES - vẫn hiển thị
set sql_safe_updates=0; -- tắt safemode mới có thể xóa hoặc cập nhật dữ liệu trong bảng
delete from Fresher_Management;
drop table Fresher_Management;


-- question 2: nhóm các thực tập sinh có cùng tháng sinh trong một hàng
select group_concat(Full_Name), month(Birth_Date) from Fresher_Management -- group_concat() 
group by month(Birth_Date);


-- question 3: lấy ra thông tin thực tập sinh có tên dài nhất
SELECT TraineeID, Full_Name, Birth_Date, Gender, CHAR_LENGTH(Full_Name) FROM Fresher_Management 
WHERE CHAR_LENGTH(Full_Name) = (SELECT MAX(CHAR_LENGTH(Full_Name)) FROM Fresher_Management);


-- question 4:
select* from Fresher_Management
where ET_IQ+ET_Gmath >= 20 and ET_IQ >= 8 and ET_Gmath >= 8 and ET_English >= 18;


-- question 5: 
delete from Fresher_Management where TraineeID = 3;
select* from Fresher_Management;


-- question 6: cập nhật bảng dữ liệu, thực tập sinh có traineeid = 5 chuyển sang lớp 2
update Fresher_Management
set Training_Class = '02'
where TraineeID = '5';
select* from Fresher_Management;
             
