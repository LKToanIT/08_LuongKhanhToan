create database fresher;
create table fresher.Trainee(
             TraineeID bit auto_increment primary key,
             Full_Name nvarchar(30),
             Birth_Date date,
             Gender enum('male','famale','unknown'),
             ET_IQ bit check (0 <= ET_IQ <= 20),
             ET_Gmath bit check (0 <= ET_IQ <= 20),
             ET_English bit check (0 <= ET_IQ <= 50),
             Training_Class varchar(10),
             Evaluation_Note text
             );
             
alter table fresher.trainee
add VTI_account varchar(50) not null unique;
