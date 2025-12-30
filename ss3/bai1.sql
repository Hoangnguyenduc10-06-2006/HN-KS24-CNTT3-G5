create database ss3_g1;
use ss3_g1;
drop database ss3_g1;

create table Subjects (
	subject_id varchar(10) primary key,
    subject_name varchar(50) not null,
    credits int not null check(credits > 0)
);

insert into Subjects values 
('INT1329', 'Toán rời rạc 1', 3 ),
('INT1328', 'Toán rời rạc 2', 4 ),
('INT1327', 'Toán cao cấp', 3 ),
('INT1326', 'Cơ sở dữ liệu', 3 ),
('INT1325', 'Lâp trình web', 3 );

select * from Subjects;

update Subjects
set credits = 5 where subject_id = 'INT1325';

update Subjects
set subject_name = 'Lập trình Python' where subject_id = 'INT1325'; 	