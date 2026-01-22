use social_network_pro;

create table if not exists posts (
    post_id int auto_increment primary key,
    user_id int,
    content text,
    created_at datetime,
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
(3, 'post 9', now()),
(3, 'post 10', now()),
(3, 'post 11', now()),
(3, 'post 12', now()),
(3, 'post 13', now()),
(3, 'post 14', now());

create view view_users_summary as
select
    u.user_id,
    u.username,
    count(p.post_id) as total_posts
from users u
left join posts p
    on u.user_id = p.user_id
group by u.user_id, u.username;

select
    user_id,
    username,
    total_posts
from view_users_summary
where total_posts > 5;
