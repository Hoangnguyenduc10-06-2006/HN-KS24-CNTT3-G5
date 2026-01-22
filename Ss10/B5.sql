use social_network_pro;

create table if not exists posts (
    post_id int auto_increment primary key,
    user_id int,
    content text,
    created_at datetime,
    foreign key (user_id) references users(user_id)
);

insert into posts (user_id, content, created_at) values
(1, 'bài viết hà nội 1', now()),
(1, 'bài viết hà nội 2', now()),
(4, 'bài viết hà nội 3', now()),
(6, 'bài viết hà nội 4', now()),
(8, 'bài viết hà nội 5', now()),
(10, 'bài viết hà nội 6', now()),
(1, 'bài viết hà nội 7', now()),
(4, 'bài viết hà nội 8', now()),
(6, 'bài viết hà nội 9', now()),
(8, 'bài viết hà nội 10', now()),
(10, 'bài viết hà nội 11', now());

explain analyze
select
    u.user_id,
    u.username,
    p.post_id,
    p.content
from users u
join posts p
    on u.user_id = p.user_id
where u.hometown = 'Hà Nội'
order by u.username desc
limit 10;

create index idx_hometown
on users(hometown);

explain analyze
select
    u.user_id,
    u.username,
    p.post_id,
    p.content
from users u
join posts p
    on u.user_id = p.user_id
where u.hometown = 'Hà Nội'
order by u.username desc
limit 10;
