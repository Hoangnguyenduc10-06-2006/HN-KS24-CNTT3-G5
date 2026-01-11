use social_network_pro;

create table if not exists posts (
    post_id int auto_increment primary key,
    user_id int,
    content text,
    created_at datetime,
    foreign key (user_id) references users(user_id)
);
insert into posts (user_id, content, created_at) values
(1, 'bài viết năm 2025 - 1', '2025-03-10 10:00:00'),
(1, 'bài viết năm 2026 - 1', '2026-01-15 09:00:00'),
(1, 'bài viết năm 2026 - 2', '2026-06-20 14:30:00'),
(2, 'bài viết năm 2026 - user 2', '2026-02-11 08:00:00'),
(3, 'bài viết năm 2024', '2024-11-01 20:00:00');
-- truy vấn tìm bài viết năm 2026 của user_id = 1 (chưa có index)
explain analyze
select post_id, content, created_at
from posts
where user_id = 1
  and year(created_at) = 2026;

-- tạo composite index
create index idx_created_at_user_id
on posts(created_at, user_id);

-- truy vấn lại sau khi có composite index
explain analyze
select post_id, content, created_at
from posts
where user_id = 1
  and created_at between '2026-01-01' and '2026-12-31';

-- truy vấn tìm user có email = 'an@gmail.com' (chưa có index)
explain analyze
select user_id, username, email
from users
where email = 'an@gmail.com';

-- tạo unique index cho email
create unique index idx_email
on users(email);

-- truy vấn lại sau khi có unique index
explain analyze
select user_id, username, email
from users
where email = 'an@gmail.com';

drop index idx_created_at_user_id on posts;
drop index idx_email on users;
