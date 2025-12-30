create database bai5;
use bai5;
drop database bai5;

create table Student(
	student_id varchar(10) primary key ,
    full_name varchar(50) not null,
    dob date not null,
    email varchar(50) not null unique
);
create table Subjects (
	subject_id varchar(10) primary key,
    subject_name varchar(50) not null,
    credits int not null check(credits > 0)
);
create table Enrollment (
	student_id varchar(10),
    subject_id varchar(10),
    enroll_date date not null,
    
    constraint pk primary key(student_id, subject_id),
    constraint fk_enroll_student foreign key(student_id) references Student(student_id),
    constraint fk_enroll_subject foreign key(subject_id) references Subjects(subject_id)
);

create table Score (
	id int primary key auto_increment,
    student_id varchar(10),
    subject_id varchar(10),
    progress_grade int not null,
    final_grade int not null,
    
    constraint fk_score_student foreign key(student_id) references Student(student_id),
    constraint fk_score_subject foreign key(subject_id) references Subjects(subject_id),
    constraint chb_progress_grade check(progress_grade >= 0 and progress_grade <= 10),
    constraint chb_final_grade check(final_grade >= 0 and final_grade <= 10)
);
alter table Score
modify progress_grade decimal(4,2),
modify final_grade decimal(4,2);

insert into Subjects values 
('INT1329', 'Toán rời rạc 1', 3 ),
('INT1328', 'Toán rời rạc 2', 4 ),
('INT1327', 'Toán cao cấp', 3 ),
('INT1326', 'Cơ sở dữ liệu', 3 ),
('INT1325', 'Lâp trình web', 3 );

insert into Student values 
('b24dtcn200', 'Hoàng nguyên đưc', '2000-11-11', 'ducg@gmail.com'),
('b24dtcn201', 'Hoàng nguyên đưc2', '2000-11-12', 'ducg@gmail.com'),
('b24dtcn202', 'Hoàng nguyên đưc3', '2000-11-13', 'ducgo@gmail.com'),
('b24dtcn203', 'Hoàng nguyên đưc4', '2000-11-14', 'ducgoi@gmail.com');

insert into Enrollment values 
('b24dtcn200', 'INT1329', '2025-12-29'),
('b24dtcn200', 'INT1328', '2025-12-29'),
('b24dtcn200', 'INT1327', '2025-12-29'),
('b24dtcn201', 'INT1329', '2025-12-29'),
('b24dtcn201', 'INT1325', '2025-12-29');

select * from Enrollment;
select * from Enrollment where student_id = 'b24dtcn201';

insert into Score(student_id, subject_id, progress_grade, final_grade) values
('b24dtcn200', 'INT1329', 8, 9),
('b24dtcn200', 'INT1328', 7, 8.5),
('b24dtcn200', 'INT1327', 5, 9),
('b24dtcn201', 'INT1329', 10, 9.5),
('b24dtcn201', 'INT1325', 7.5, 8);

update  Score
set final_grade = 10 where student_id = 'b24dtcn200' and subject_id = 'INT1327';
select * from Score where student_id = 'b24dtcn200';
select * from Score where final_grade >= 9;
select * from Score;