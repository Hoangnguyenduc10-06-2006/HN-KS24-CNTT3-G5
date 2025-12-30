create database g1_btvn;
use bai1_btvn;

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