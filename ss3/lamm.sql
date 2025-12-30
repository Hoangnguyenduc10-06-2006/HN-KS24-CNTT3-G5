create database ptit_cntt3_it202_session03;
use ptit_cntt3_it202_session03;


create table students(
student_id int auto_increment primary key,
full_name varchar(50) not null,
date_of_birth date not null,
email varchar(50) not null unique
);
insert into students(full_name,date_of_birth,email) value 	('duc','2006-06-10','duc@gmail.com'),
															('duc2','2006-06-10','duc2@gmail.com'),
                                                            ('duc3','2006-06-10','duc3@gmail.com');

create table subjects(
subjects_id int auto_increment primary key,
subjects_name varchar(50) not null,
credit int not null check(credit > 0)
);

insert into subjects(subjects_name,credit) value('toan','6'),
												('van','2'),
												('anh','20');

create table enrollment (
Student_id int not null , foreign key(Student_id)  references students(student_id),
Subject_id int  not null, foreign key(Subject_id)  references subjects(subjects_id),
primary key(Student_id,Subject_id),
Enroll_date datetime default current_timestamp
);

create table Score (
student_id int ,foreign key(student_id) references students(student_id),
subject_id int ,foreign key(subject_id) references subjects(subjects_id),
mid_score float not null check(mid_score >=0 and mid_score <=10),
final_score float not null check(final_score >=0 and final_score <=10)
); 

insert into Score value('1','1',7,8),('2','2',9,8)

