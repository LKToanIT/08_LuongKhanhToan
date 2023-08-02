CREATE DATABASE `fresher`;
CREATE TABLE `fresher.Trainee` (
    TraineeID TINYINT AUTO_INCREMENT PRIMARY KEY,
    Full_Name NVARCHAR(30) NOT NULL,
    Birth_Date DATE NOT NULL,
    Gender ENUM('male', 'famale', 'unknown') NOT NULL,
    ET_IQ TINYINT CHECK (0 <= ET_IQ <= 20),
    ET_Gmath TINYINT CHECK (0 <= ET_IQ <= 20),
    ET_English TINYINT CHECK (0 <= ET_IQ <= 50),
    Training_Class CHAR(10),
    Evaluation_Note TEXT
);
             
ALTER TABLE `fresher.trainee`
ADD COLUMN VTI_account VARCHAR(50) NOT NULL UNIQUE;
