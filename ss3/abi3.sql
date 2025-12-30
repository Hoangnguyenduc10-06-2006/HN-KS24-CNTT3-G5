create database abi3;
use abi3;
drop database abi3;

create table Student(
	student_id varchar(10) primary key ,
    full_name varchar(50) not null,
    dob date not null,
    email varchar(50) not null unique
);

insert into Student values 
('b24dtcn200', 'Hoàng nguyên đưc', '2000-11-11', 'ducg@gmail.com'),
('b24dtcn201', 'Hoàng nguyên đưc2', '2000-11-12', 'ducg@gmail.com'),
('b24dtcn202', 'Hoàng nguyên đưc3', '2000-11-13', 'ducgo@gmail.com'),
('b24dtcn203', 'Hoàng nguyên đưc4', '2000-11-14', 'ducgoi@gmail.com');

select * from Student;
select student_id as `Mã SV`, full_name as `Họ tên` from Student;