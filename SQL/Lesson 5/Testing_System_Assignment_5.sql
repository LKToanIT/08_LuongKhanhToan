USE muoimotbang; 


-- question 1: tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE OR REPLACE VIEW view_nv_sale AS
    SELECT A.*, D.departmentname
    FROM accounttable A INNER JOIN department D ON A.departmentid = D.departmentid
    WHERE D.departmentname = 'Sale';

SELECT * FROM 	view_nv_sale;
drop view view_nv_sale;



-- question 2: tạo view có chứa thông tin các account tham gia vào nhiều group nhất
-- dùng cte
WITH max_group AS(
	SELECT 		COUNT(ga.groupid)
	FROM		accounttable a
	INNER JOIN 	groupacc ga ON a.accountid = ga.accountid
	GROUP BY	a.accountid
	ORDER BY	COUNT(ga.accountid) DESC
	LIMIT		1
)
SELECT a.*, COUNT(ga.groupid) AS soluong
FROM accounttable a INNER JOIN groupacc ga ON a.accountid = ga.accountid
GROUP BY accountid
HAVING soluong = (SELECT * FROM max_group);



-- question 3: tạo view có chứa danh sách các câu hỏi có content quá dài (quá 12 kí tự được coi là dài) sau đó xóa view
CREATE OR REPLACE VIEW view_q3 AS
    SELECT question.*, CHAR_LENGTH(content) AS length
    FROM question
    WHERE CHAR_LENGTH(content) > 12;
SELECT * FROM view_q3;
DROP VIEW view_q3; -- không thể DELETE dữ liệu bảng question thông qua view_q3, 
SELECT * FROM question;
    

    
-- question 4: tạo view chứa danh sách các phòng ban có nhiều nhân viên nhất
-- cách 1:
CREATE OR REPLACE VIEW view_q4 AS
    SELECT d.departmentname, COUNT(a.accountid)
    FROM department d INNER JOIN accounttable a ON d.departmentid = a.departmentid
    GROUP BY d.departmentname
    ORDER BY COUNT(a.accountid) DESC
    LIMIT 1;
SELECT * FROM view_q4;

-- cách 2:
CREATE OR REPLACE VIEW vw_DepartmentMaxAccount AS
	SELECT 		D.*, COUNT(A.DepartmentID)
	FROM		Department D
	INNER JOIN 	`Accounttable` A ON D.DepartmentID = A.DepartmentID
	GROUP BY	D.DepartmentID
	HAVING		COUNT(A.DepartmentID) = (
										SELECT 		COUNT(A.DepartmentID)
										FROM		Department D
										INNER JOIN 	`Accounttable` A ON D.DepartmentID = A.DepartmentID
										GROUP BY	D.DepartmentID
										HAVING		COUNT(A.DepartmentID)
										ORDER BY	COUNT(A.DepartmentID) DESC
										LIMIT		1
										);
SELECT * FROM vw_DepartmentMaxAccount;


-- question 5: tạo view chứa tất cả các câu hỏi do user họ Nguyễn tạo
CREATE OR REPLACE VIEW view_q5 AS
	SELECT 		q.*, a.fullname
	FROM 		question q
	INNER JOIN 	accounttable a ON q.creatorid = a.accountid -- hai bảng question và accounttable liên kết qua creatorid = accountid
	WHERE		SUBSTRING_INDEX(fullname,' ',1) = 'Nguyen';

SELECT * FROM 	view_q5;


-- CTE
WITH view_q5 AS
(
	SELECT 		Q.*, A.FullName
	FROM 		Question Q
	INNER JOIN 	`accounttable` A ON Q.CreatorID = A.AccountID
	WHERE		SUBSTRING_INDEX(FullName,' ',1) = 'Nguyen'
)
SELECT 	*
FROM 	view_q5;
