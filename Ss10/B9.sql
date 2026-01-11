use social_network_pro;

create index idx_user_gender
on users(gender);

create table if not exists posts (
    post_id int auto_increment primary key,
    user_id int,
    content text,
    created_at datetime,
    foreign key (user_id) references users(user_id)
);

create table if not exists comments (
    comment_id int auto_increment primary key,
    post_id int,
    user_id int,
    content text,
    created_at datetime,
    foreign key (post_id) references posts(post_id),
    foreign key (user_id) references users(user_id)
);

insert into posts (user_id, content, created_at) values
(1, 'post 1', now()),
(1, 'post 2', now()),
(1, 'post 3', now()),
(1, 'post 4', now()),
(1, 'post 5', now()),
(1, 'post 6', now()),
(2, 'post 7', now()),
(2, 'post 8', now()),
(2, 'post 9', now()),
(3, 'post 10', now());

insert into comments (post_id, user_id, content, created_at) values
(1, 1, 'c1', now()), (1, 1, 'c2', now()), (1, 1, 'c3', now()), (1, 1, 'c4', now()),
(1, 1, 'c5', now()), (1, 1, 'c6', now()), (1, 1, 'c7', now()), (1, 1, 'c8', now()),
(1, 1, 'c9', now()), (1, 1, 'c10', now()), (1, 1, 'c11', now()), (1, 1, 'c12', now()),
(1, 1, 'c13', now()), (1, 1, 'c14', now()), (1, 1, 'c15', now()), (1, 1, 'c16', now()),
(1, 1, 'c17', now()), (1, 1, 'c18', now()), (1, 1, 'c19', now()), (1, 1, 'c20', now()),
(1, 1, 'c21', now()), (1, 1, 'c22', now()), (1, 1, 'c23', now()), (1, 1, 'c24', now()),
(1, 1, 'c25', now());

create view view_user_activity as
select
    u.user_id,
    count(distinct p.post_id) as total_posts,
    count(distinct c.comment_id) as total_comments
from users u
left join posts p
    on u.user_id = p.user_id
left join comments c
    on u.user_id = c.user_id
group by u.user_id;

select *
from view_user_activity;

select
    u.user_id,
    u.username,
    v.total_posts,
    v.total_comments
from view_user_activity v
join users u
    on v.user_id = u.user_id
where v.total_posts > 5
  and v.total_comments > 20
order by v.total_comments desc
limit 5;
