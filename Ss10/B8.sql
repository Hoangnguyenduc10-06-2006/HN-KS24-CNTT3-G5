use social_network_pro;

create index idx_user_gender
on users(gender);

create table if not exists likes (
    like_id int auto_increment primary key,
    user_id int,
    post_id int,
    created_at datetime,
    foreign key (user_id) references users(user_id),
    foreign key (post_id) references posts(post_id)
);

insert into likes (user_id, post_id, created_at) values
(1, 1, now()),
(2, 1, now()),
(3, 1, now()),
(4, 1, now()),
(5, 1, now()),
(6, 2, now()),
(7, 2, now()),
(8, 2, now()),
(9, 2, now()),
(10, 2, now()),
(1, 3, now()),
(2, 3, now()),
(3, 3, now()),
(4, 3, now()),
(5, 3, now()),
(6, 3, now());

create view view_popular_posts as
select
    p.post_id,
    u.username,
    p.content,
    count(distinct l.like_id) as total_likes,
    count(distinct c.comment_id) as total_comments
from posts p
join users u
    on p.user_id = u.user_id
left join likes l
    on p.post_id = l.post_id
left join comments c
    on p.post_id = c.post_id
group by p.post_id, u.username, p.content;

select *
from view_popular_posts;

select
    post_id,
    username,
    content,
    total_likes,
    total_comments,
    total_likes + total_comments as total_interactions
from view_popular_posts
where total_likes + total_comments > 10
order by total_interactions desc;
