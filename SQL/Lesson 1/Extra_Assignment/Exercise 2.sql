CREATE TABLE `fresher.exercise2` (
    `IDAcc` MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(20) NOT NULL,
    `Code` CHAR(5) NOT NULL,
    `ModifiedDate` DATETIME DEFAULT NOW() -- kiểu dữ liệu DATETIME thì mới dùng được now(), DATE không dùng được now()
);
            
