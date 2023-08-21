USE  extra_assignment_6;

DROP TRIGGER IF EXISTS exercise_1;
DELIMITER $$
	CREATE TRIGGER exercise_1
    BEFORE INSERT ON project_modules
    FOR EACH ROW
    BEGIN
		DECLARE p_start_date DATETIME;        -- p_start_date là ngày bắt đầu project
		DECLARE p_completed_on_date DATETIME; -- p_completed_on_date là ngày hoàn thành project
		    SELECT project_start_date, project_completed_on INTO p_start_date, p_completed_on_date
		    FROM projects
		    WHERE project_id = NEW.project_id;
        IF (NEW.project_modules_date < p_start_date -- project_modules_date phải LỚN HƠN p_start_date 
                                                    -- vì project modules là một phần nhỏ trong một project
                                                    -- nên ngày hoàn thành một project_modules phải là sau ngày project được bắt đầu
                                                    
        AND NEW.project_modules_completed_on > p_completed_on_date)-- project_modules_completed_on phải NHỎ HƠN p_completed_on_date 
                                                                   -- vì ngày hoàn thành project_modules phải là trước ngày hoàn thành project
        THEN 
            SIGNAL SQLSTATE '11122'
            SET MESSAGE_TEXT = 'NHẬP SAI THÔNG TIN NGÀY BẮT ĐẦU VÀ HOÀN THÀNH MODULE';
		END IF;
    END$$
DELIMITER ;

set foreign_key_checks = 0;
set sql_safe_updates = 0;
delete from project_modules;

-- them du lieu vao bang project_modules
/*insert into project_modules (module_id, project_id, employee_id, project_modules_date, project_modules_completed_on, project_modules_description)
values
('md01', 'p01', 'e01', '2019-1-1', '2023-2-1', 'Không hợp lệ'),
('md02', 'p02', 'e02', '2022-2-2', '2022-2-1', 'som hon du kien'),
('md03', 'p03', 'e03', '2022-3-3', '2022-3-3', 'dung thoi han'),
('md04', 'p03', 'e04', '2022-4-4', '2022-4-10', 'tre thoi han'),
('md05', 'p02', 'e01', '2022-5-5', '2022-5-1', 'som hon du kien');*/

INSERT INTO project_modules (module_id, project_id, employee_id, project_modules_date, project_modules_completed_on, project_modules_description)
VALUE						 ('md01', 'p01', 'e01', '2019-1-1', '2023-2-1', 'Không hợp lệ');

SELECT * FROM project_modules;

-- Error Code: 1644. NHẬP SAI THÔNG TIN NGÀY BẮT ĐẦU VÀ HOÀN THÀNH MODULE

