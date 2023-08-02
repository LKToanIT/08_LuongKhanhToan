create table fresher.exercise3 (
             ID mediumint auto_increment primary key,
             ten varchar(30),
			 BirthDate date,
             Gender enum('male','famale','unknown'),
             IsDeletedFlag bool
             );