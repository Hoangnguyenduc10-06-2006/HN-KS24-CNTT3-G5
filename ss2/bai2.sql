create database g2_btvn;
use bai2_btvn;

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
create table Enrollment (
	student_id int,
    subject_id int,
    date_enrollment date,
    
    constraint fk_student foreign key(student_id) references Student(id),
    constraint fk_subject foreign key(subject_id) references Subjects(id)
);
create table Teacher (
	id int primary key auto_increment,
	full_name nvarchar(50) not null,
    email nvarchar(50) not null
);

alter table Subjects
add column teacher_id int,
add constraint fk_teacher foreign key(teacher_id) references Teacher(id);

drop database ss02_ex;