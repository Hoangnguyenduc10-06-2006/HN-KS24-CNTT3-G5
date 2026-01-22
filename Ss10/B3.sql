create database social_network_pro;
use social_network_pro;
create table users (
    user_id int auto_increment primary key,
    username varchar(50),
    full_name varchar(100),
    hometown varchar(100),
    email varchar(100),
    created_at datetime
);

insert into users (username, full_name, hometown, email, created_at) values
('user1', 'Nguyễn Văn A', 'Hà Nội', 'a@gmail.com', now()),
('user2', 'Trần Thị B', 'Hồ Chí Minh', 'b@gmail.com', now()),
('user3', 'Lê Văn C', 'Đà Nẵng', 'c@gmail.com', now()),
('user4', 'Phạm Thị D', 'Hà Nội', 'd@gmail.com', now()),
('user5', 'Hoàng Văn E', 'Cần Thơ', 'e@gmail.com', now()),
('user6', 'Nguyễn Văn F', 'Hà Nội', 'f@gmail.com', now()),
('user7', 'Trần Văn G', 'Hải Phòng', 'g@gmail.com', now()),
('user8', 'Lê Thị H', 'Hà Nội', 'h@gmail.com', now()),
('user9', 'Phạm Văn I', 'Huế', 'i@gmail.com', now()),
('user10', 'Đỗ Thị K', 'Hà Nội', 'k@gmail.com', now());

explain analyze
select *
from users
where hometown = 'Hà Nội';

create index idx_hometown
on users(hometown);
explain analyze
select *
from users
where hometown = 'Hà Nội';

drop index idx_hometown on users;
