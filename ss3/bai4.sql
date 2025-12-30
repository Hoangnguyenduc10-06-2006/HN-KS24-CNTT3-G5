create database bai4;
use bai4;
drop database bai4;

update Student
set email = 'abc@gmail.com' where student_id = 'b24dtcn202';

update Student 
set dob = '2000-11-20' where student_id = 'b24dtcn201';

delete from Student where student_id = 'b24dtcn203';

select * from Student;