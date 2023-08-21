use muoimotbang;

-- question 2: lấy ra tất cả các phòng ban
select* from department;

-- question 3: lấy ra id của phòng ban Sale
select departmentname, departmentid from department
where departmentname = 'Sale';

-- question 4: lấy ra thông tin account có fullname dài nhất
select acc.*, max(char_length(fullname)) from accounttable acc
where char_length(fullname) = (select max(char_length(fullname)) from accounttable); 
-- Error Code: 1140. In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'muoimotbang.acc.accountid'; this is incompatible with sql_mode=only_full_group_by
-- cách 2:
select * from accounttable acc
where char_length(fullname) = (select max(char_length(fullname)) from accounttable);

-- question 5: lấy ra thông tin account có fullname dài nhất và có departmentid = 3
select* from accounttable
-- cần có hai điều kiện departmentid = 3 thì mới ra kết quả đúng
where char_length(fullname) = (select max(char_length(fullname)) from accounttable where departmentid = 3 ) and departmentid = 3; 

-- question 6: lấy ra tên group đã tham gia trước ngày 20/12/2019
select groupname, gt.groupid, joindate as joindate_before_20_12_2019 -- groupid cần chỉ định tên bảng phía trước vì cả 2 bảng groupacc và grouptable đều có groupid
from grouptable as gt
join groupacc as gacc on gt.groupid = gacc.groupid
where joindate < '2019-12-20'; -- định dạng ngày trong mysql là năm-tháng-ngày và phải đặt trong dấu ' '

-- question 7: lấy ra questionid có >= 4 câu trả lời
select questionid, count(answerid) as number_of_answers
from answer
group by questionid
having count(answerid) >= 4;

-- question 8: lấy ra các examid có duration >= 60 và được tạo trước ngày 20/12/2019
select examid, duration, createdate from exam 
where duration >= 60 and createdate < '2019-12-20';

-- question 9: lấy ra 5 group được tạo gần đây
select * from grouptable
order by createdate desc
limit 5;

-- question 10: đếm số nhân viên thuộc departmentid = 2
select  count(accountid) as so_nhan_vien
from accounttable
where departmentid = 2;

-- question 11: lấy ra tên nhân viên bắt đầu bằng chữ 'D' và kết thúc bằng chữ 'o'
select fullname as Ten_nv from accounttable
where substring_index(fullname,' ',-1) like 'D%o';

-- question 12: xóa tất cả các exam được tạo trước ngày 20/12/2019
set sql_safe_updates = 0;
set foreign_key_checks = 0;
delete from exam 
where createdate < '2019-12-20';

-- question 13: xóa các question có nội dung bắt đầu bằng cụm từ 'câu hỏi'
delete from question
where substring_index(content,' ',2) = 'Câu hỏi'; -- ở đây không phải là so sánh với một chuỗi nào đó nên sẽ không dùng LIKE

-- question 14: update thông tin của account có accountid = 5 thành tên 'nguyễn bá lộc' và email là 'loc.nguyenba@vti.com.vn'
update accounttable set fullname = 'nguyễn bá lộc' , email = 'loc.nguyenba@vti.com.vn'
where accountid = 5;

-- question 15: update accountid = 5 thuộc groupid = 4
update groupacc set groupid = 4
where accountid = 5;