create database k2_btvn;
use bai4_btvn;

create table Student (
	id int primary key auto_increment,
    full_name nvarchar(50) not null
);
create table Subjects (
	id int primary key auto_increment,
    subject_name nvarchar(50) not null,
    credits int not null,
    
    constraint chb_01 check(credits > 0)
);
