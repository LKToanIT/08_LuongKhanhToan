CREATE TABLE `fresher.exercise3` (
    ID MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    Ten VARCHAR(30) NOT NULL,
    BirthDate DATE NOT NULL,
    Gender ENUM('0', '1', 'unknown') NOT NULL,
    IsDeletedFlag BOOL CHECK( IsDeletedFlag=0 OR IsDeletedFlag=1)
);