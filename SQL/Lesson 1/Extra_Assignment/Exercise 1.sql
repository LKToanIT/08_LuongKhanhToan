CREATE DATABASE fresher;
USE fresher;
CREATE TABLE fresher_management (
    TraineeID TINYINT AUTO_INCREMENT PRIMARY KEY,
    Full_Name NVARCHAR(30) NOT NULL,
    Birth_Date DATE NOT NULL,
    Gender ENUM('male', 'female', 'unknown') NOT NULL,
    ET_IQ TINYINT UNSIGNED CHECK (ET_IQ <= 20),
    ET_Gmath TINYINT UNSIGNED CHECK (ET_Gmath <= 20),
    ET_English TINYINT UNSIGNED CHECK (ET_English <= 50),
    Training_Class CHAR(10),
    Evaluation_Note TEXT
);

ALTER TABLE fresher_management
ADD COLUMN VTI_account VARCHAR(30) NOT NULL UNIQUE;
             
