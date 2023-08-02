CREATE DATABASE fresher;
CREATE TABLE fresher.Trainee (
    TraineeID BIT AUTO_INCREMENT PRIMARY KEY,
    Full_Name NVARCHAR(30),
    Birth_Date DATE,
    Gender ENUM('male', 'famale', 'unknown'),
    ET_IQ BIT CHECK (0 <= ET_IQ <= 20),
    ET_Gmath BIT CHECK (0 <= ET_IQ <= 20),
    ET_English BIT CHECK (0 <= ET_IQ <= 50),
    Training_Class VARCHAR(10),
    Evaluation_Note TEXT
);
             
ALTER TABLE fresher.trainee
ADD VTI_account VARCHAR(50) NOT NULL UNIQUE;
