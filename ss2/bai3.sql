create database ss01_btvn;
use bai3_btvn;

create table Class (
	id int primary key auto_increment,
    class_name nvarchar(50) not null,
    school_year int not null,
    
    constraint chb_01 check(school_year > 0)
);

create table Student (
	id varchar(10) primary key,
    full_name nvarchar(50) not null,
    dob date,
    class_id int,
    
    constraint fk_class foreign key(class_id) references Class(id)
);


