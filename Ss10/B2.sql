
create database database_b2;
use database_b2;

create table users (
    user_id int auto_increment primary key,
    username varchar(50),
    full_name varchar(100),
    email varchar(100),
    created_at datetime
);

create table posts (
    post_id int auto_increment primary key,
    user_id int,
    title varchar(255),
    content text,
    created_at datetime,
    foreign key (user_id) references users(user_id)
);
insert into users (username, full_name, email, created_at) values
('user1', 'Nguyễn Văn A', 'a@gmail.com', now()),
('user2', 'Trần Thị B', 'b@gmail.com', now()),
('user3', 'Nguyễn Văn C', 'c@gmail.com', now()),
('user4', 'Lê Văn D', 'd@gmail.com', now());
insert into posts (user_id, title, content, created_at) values
(1, 'bài viết 1', 'nội dung 1', now()),
(1, 'bài viết 2', 'nội dung 2', now()),
(3, 'bài viết 3', 'nội dung 3', now()),
(3, 'bài viết 4', 'nội dung 4', now()),
(3, 'bài viết 5', 'nội dung 5', now());

-- tạo view hiển thị user có họ "nguyễn"
create view view_users_firstname as
select
    user_id,
    username,
    full_name,
    email,
    created_at
from users
where full_name like 'nguyễn%';

-- hiển thị view vừa tạo
select * from view_users_firstname;

-- thêm nhân viên mới có họ nguyễn
insert into users (username, full_name, email, created_at)
values ('user5', 'Nguyễn Văn E', 'e@gmail.com', now());

-- kiểm tra view sau khi thêm
select * from view_users_firstname;

-- xóa nhân viên vừa thêm
delete from users
where username = 'user5';

-- kiểm tra view sau khi xóa
select * from view_users_firstname;

-- =====================================================
-- bài tập 2: join trong view
-- =====================================================

-- tạo view thống kê số bài viết của từng user
create view view_user_post as
select
    u.user_id,
    count(p.post_id) as total_user_post
from users u
left join posts p
    on u.user_id = p.user_id
group by u.user_id;

-- hiển thị view_user_post
select * from view_user_post;

-- join view với bảng users để lấy họ tên
select
    u.full_name,
    v.total_user_post
from users u
join view_user_post v
    on u.user_id = v.user_id;