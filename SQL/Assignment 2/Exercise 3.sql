CREATE TABLE fresher.exercise3 (
    ID MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    ten VARCHAR(30),
    BirthDate DATE,
    Gender ENUM('male', 'famale', 'unknown'),
    IsDeletedFlag bool check( IsDeletedFlag=0 or IsDeletedFlag=1)
);