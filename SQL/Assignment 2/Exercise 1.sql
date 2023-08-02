create database fresher;
create table fresher.Trainee(
             TraineeID bit auto_increment primary key,
             Full_Name varchar(30),
             Birth_Date date,
             Gender varchar(10),
             ET_IQ bit,
             ET_Gmath bit,
             ET_English bit,
             Training_Class varchar(10),
             Evaluation_Note varchar(100)
             );
             
alter table fresher.trainee
add VTI_account varchar(50) not null unique;
