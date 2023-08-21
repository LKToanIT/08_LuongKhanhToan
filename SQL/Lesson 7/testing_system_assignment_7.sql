use muoimotbang;


-- question 1: tạo trigger không cho phép người dùng nhập vào group có ngày tạo trước 1 năm trước
-- ngày tạo group phải NHỎ HƠN thời điểm hiện tại trừ đi khoảng thời gian 1 năm
drop trigger if exists question_1;
delimiter //
create trigger question_1
before insert on grouptable
for each row
begin
     if new.createdate < date_sub(curdate(), interval 1 year) -- date_sub(): là hàm trừ thời gian, curdate(): lấy ra ngày hiện tại
     then signal sqlstate '11314'                         -- theo sau interval là khoảng thời gian và đơn vị thời gian
														  -- ex: interval 1 day
     set message_text = 'ngày tạo group là hơn một năm trước';
     end if;
end//
delimiter ;

insert into grouptable 
values (11, 'new_group', 11, '2021-12-31');

set foreign_key_checks = 0;
set sql_safe_updates = 0;
delete from grouptable
where groupid = '11';


-- question 2: tạo trigger không cho phép người dùng thêm bất kì user nào vào phòng ban Sale nữa
		    -- khi thêm thì hiện thông báo : "Department "Sale" can not add more user"
            -- idea: không được thêm một record nào có departmentid = 2 tương đương với departmentname = sale vào bảng accounttable
drop trigger if exists question_2;
delimiter //
create trigger question_2
before insert on accounttable
for each row
begin
     if new.departmentid = 2 then
     signal sqlstate '11212'
     set message_text = 'Department "Sale" can not add more user';
     end if;
end//
delimiter ;

insert into accounttable (accountid,   email  , username , fullname     , departmentid, positionid, createdate)
values                   (    11   ,'newemail', 'newuser', 'newfullname',      2      ,      3    , '2022-2-2');

insert into accounttable (accountid,   email  , username , fullname     , departmentid, positionid, createdate)
values                   (    11   ,'newemail', 'newuser', 'newfullname',      3      ,      3    , '2022-2-2');

delete from accounttable where accountid = 11;


-- question 3: cấu hình một group có nhiều nhất là 5 user
-- idea : đếm số groupid trong bảng groupacc rồi nhóm chúng theo groupid với điều kiện count(groupid) >= 5
drop trigger if exists question_3;
delimiter //
create trigger question_3
before insert on groupacc
for each row
begin
	if 
        (select groupid from groupacc group by groupid having count(groupid) >= 5)
    then 
        signal sqlstate '12312'
        set message_text = 'Một group chỉ có tối đa 5 user';
	end if;
end//
delimiter ;

insert into groupacc (groupid, accountid, joindate)
values (1, 8, '2023-8-18'); 


-- question 4: cấu hình một bài thi có nhiều nhất là 10 question,alter
			-- ĐỀ BÀI KHÔNG ỔN SO VỚI DATABASE BAN ĐẦU
drop trigger if exists question_4;
delimiter //
create trigger question_4
before insert on examquestion
for each row
begin
     if(select questionid from examquestion group by examid having count(questionid) >= 10)
     then 
         signal sqlstate '11213'
         set message_text = 'Một exam có tối đa là 10 câu hỏi';
         end if;
end//
delimiter ;


-- question 5: tạo trigger không cho phép người dùng xóa tài khoản email là admin@gmail.com, còn các email khác sẽ cho xóa
			-- và xóa tất cả các thông tin liên quan đến tài khoản đó
drop trigger if exists question_5;
delimiter //
create trigger question_5
before delete on accounttable
for each row
begin
     if old.email = 'admin@gmail.com'
     then 
         signal sqlstate '12123'
         set message_text = 'KHÔNG ĐƯỢC XÓA TÀI KHOẢN ADMIN';
         end if;
end//
delimiter ;

insert into accounttable (accountid, email, username, fullname, departmentid, positionid, createdate)
values (11, 'admin@gmail.com', 'admin', 'admin', 1, 1, '2023-8-18');
set sql_safe_updates = 0;
delete from accounttable
where email = 'admin@gmail.com';


-- question 6:tạo trigger cho phép người dùng nhập thông tin vào bảng accounttable nếu không điền vào departmentid
		--    thì sẽ được động được phân vào phòng có tên 'phòng chờ' trong bảng department
drop trigger if exists question_6;
delimiter //
create trigger question_6
before insert on accounttable
for each row
begin
	 declare waiting_id tinyint;
     select departmentid into waiting_id
         from department where departmentname = 'phòng chờ';
     if new.departmentid is null 
         then set new.departmentid = waiting_id;
     end if;
end //
delimiter ;
insert into accounttable (accountid,         email       , username , fullname , gender   ,  positionid, createdate)
values                   (    12   ,  'newuser@gmail.com', 'newuser', 'newuser', 'female' ,            1    , '2023-8-18');


-- question 7: cấu hình một bài thi chỉ cho phép user tạo tối đa 4 answer cho mỗi question trong đó có tối đa 2 correct answer
drop trigger if exists question_7;
delimiter //
create trigger question_7
before insert on answer
for each row
begin
     	declare number_answer tinyint unsigned;
        declare number_correct_answer tinyint unsigned;
			select COUNT(answerid) into number_answer
            from answer
            where questionid = new.questionid;

			select COUNT(answerid) into number_correct_answer
            from answer
            where questionid = new.questionid and iscorrect = 'Yes';

		if number_answer >= 4 and number_correct_answer >= 2 then
        signal sqlstate '12345'
		set message_text = 'can not insert data';
		end if;
end //
delimiter ;



-- question 8: viết trigger sửa lại dữ liệu cho đúng khi: người dùng nhập vào trường Gender là nam, nữ và chưa xác định
		    -- sửa lại thành Male, Female, Unknow cho đúng định dạng enum ban đầu của trường Gender
drop trigger if exists question_8;

-- cách 1: cách này sẽ hoạt động chính xác nếu kiểu dữ liệu ban đầu của trường Gender là kiểu kí tự (char, varchar, nvarchar...)
      --   còn với kiểu dữ liệu ban đầu của Gender mà là ENUM thì cách này không hoạt động
	  --   vì kiểu dữ liệu ở new.Gender và set new.Gender là kiểu kí tự (char, varchar, nvarchar...)
delimiter //
create trigger question_8
before insert on accounttable
for each row
begin
     if new.gender = 'nam' then set new.gender = 'M';      
     elseif new.gender = 'nữ' then set new.gender = 'F';
     elseif new.gender = 'chưa xác định' then set new.gender = 'U';
     end if;
end//
delimiter ;

-- cách 2: KHÔNG HOẠT ĐỘNG
drop trigger if exists question_8_2;
delimiter //
create trigger question_8_2
before insert on accounttable
for each row
begin
     declare newgender enum('nam', 'nữ', 'chưa xác định');
     -- select gender into newgender 
--      from acccouttable
--      where accountid = new.accountid;
     if new.gender = newgender(0)
         then set new.gender = 'Male';
     elseif new.gender = newgender(1)
         then set new.gender = 'Female';
     elseif new.gender = newgender(2)
         then set new.gender = 'Unknown';
     elseif new.gender <> newgender
		 then signal sqlstate '11212'
         set message_text = "không hợp lệ";
     end if;
end//
delimiter ;

insert into accounttable (accountid,         email       , username , fullname , gender   , departmentid, positionid, createdate)
values                   (    12   ,  'newuser@gmail.com', 'newuser', 'newuser', 'nam' ,       1     ,      1    , '2023-8-18');
delete from accounttable
where accountid = '12';


-- question 9: viết trigger không cho phép người dùng xóa bài thi mới được tạo 2 ngày
drop trigger if exists question_9;
delimiter //
create trigger question_9
before delete on exam
for each row
begin
     if old.createdate = date_sub(curdate(), interval 2 day)
     then signal sqlstate '12121'
		  set message_text = 'can not delete';
     end if;
end //
delimiter ;
insert into exam (examid, examcode,  title   , categoryid, duration, creatorid, createdate)
values           (11    ,'VTIQ011','no title',      3    ,   120   ,      5   ,'2023-8-18');
delete from exam
where examid = 11;


-- question 10: viết trigger cho phép người dùng chỉ được update, delete các question khi question đó chưa nằm trong exam nào
drop trigger if exists question_10;
delimiter //
create trigger question_10
before delete on question
for each row
begin
	declare not_on_exam tinyint;
	select q.questionid into not_on_exam
	from question q
	left join examquestion eq on q.questionid = eq.questionid -- left join lấy ra toàn bộ thông tin bảng question
    -- bao gồm cả những questionid mà chưa có examid nào, tương ứng với việc lấy ra những question chưa thuộc exam nào
	where eq.examid is null;-- điều kiện này để lấy ra những question không thuộc exam nào
		if old.questionid != not_on_exam then
		signal sqlstate '12345'
		set message_text = 'can not insert or delete';
		end if ;
end //
delimiter ;
set foreign_key_checks = 0;
delete from question
where questionid = '2';


-- KHÔNG CÓ QUESTION 11
-- question 12: lấy ra thông tin exam trong đó : duration <= 30 thì giá trị đổi thành shortime
											  -- 30 < duration <= 60 đổi giá trị thành mediumtime
                                              -- duration >= 60 giá trị đổi thành longtime
select examid,
		case
			when duration <= 30 then 'Short time'
            when duration <= 60 and duration >30 then 'Medium time'
            else 'Longtime'
		end as exam_duration
from exam;


-- question 13: thống kê số account trong mỗi group và in ra thêm một cột nữa có tên the_number_user_amout và mang giá trị được quy định như sau
             -- số lượng user <= 5 thì giá trị của cột mới là few
             -- > 5 và <= 20 thì giá trị là normal
             -- > 20 thì giá trị là higher
select GroupID,
		case
			when count(accountid) <=5 then 'Few'
            when count(accountid) <=20 and count(accountid)>5 then 'Normal'
            else 'Higher'
		end as the_number_user_amount
from groupacc
group by groupid;


-- question 14: thống kê mỗi phòng ban có bao nhiêu user, nếu phòng ban nào không có user thì đổi giá trị 0 thành 'không có user nào'
select d.departmentname,
       case
			when count(a.accountid) = 0 then 'Khong co User'
            else count(a.accountid)
		end as Number_of_Account
from department d
join accounttable a on d.departmentid = a.departmentid
group by d.departmentname;