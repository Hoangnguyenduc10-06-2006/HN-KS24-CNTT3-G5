use social_network_pro;

alter table users
add column if not exists gender varchar(10);

create table if not exists posts (
    post_id int auto_increment primary key,
    user_id int,
    content text,
    created_at datetime,
    foreign key (user_id) references users(user_id)
);

create table if not exists comments (
    comment_id int auto_increment primary key,
    user_id int,
    post_id int,
    content text,
    created_at datetime,
    foreign key (user_id) references users(user_id),
    foreign key (post_id) references posts(post_id)
);

update users set gender = 'male' where user_id in (1,3,5,7,9);
update users set gender = 'female' where user_id in (2,4,6,8,10);

insert into posts (user_id, content, created_at) values
(1, 'post a', now()),
(2, 'post b', now()),
(3, 'post c', now()),
(5, 'post d', now());

insert into comments (user_id, post_id, content, created_at) values
(4, 1, 'comment 1', now()),
(6, 2, 'comment 2', now()),
(1, 3, 'comment 3', now());

create view view_user_activity_status as
select
    u.user_id,
    u.username,
    u.gender,
    u.created_at,
    case
        when count(distinct p.post_id) > 0
          or count(distinct c.comment_id) > 0
        then 'active'
        else 'inactive'
    end as status
from users u
left join posts p
    on u.user_id = p.user_id
left join comments c
    on u.user_id = c.user_id
group by u.user_id, u.username, u.gender, u.created_at;

select *
from view_user_activity_status;

select
    status,
    count(*) as user_count
from view_user_activity_status
group by status
having count(*) > 0
order by user_count desc;
