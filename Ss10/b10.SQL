drop database if exists social_network_pro;
create database social_network_pro;
use social_network_pro;

create table users (
    user_id int auto_increment primary key,
    username varchar(50),
    full_name varchar(100),
    gender enum('nam','nu'),
    email varchar(100),
    password varchar(100),
    birthdate date,
    hometown varchar(100),
    created_at datetime
);

create table posts (
    post_id int auto_increment primary key,
    user_id int,
    content text,
    created_at datetime
);

create table comments (
    comment_id int auto_increment primary key,
    post_id int,
    user_id int,
    content text,
    created_at datetime
);

create table likes (
    post_id int,
    user_id int,
    created_at datetime
);

create table friends (
    user_id int,
    friend_id int,
    status enum('pending','accepted'),
    created_at datetime
);

create table messages (
    message_id int auto_increment primary key,
    sender_id int,
    receiver_id int,
    content text,
    created_at datetime
);

create table notifications (
    notification_id int auto_increment primary key,
    user_id int,
    type varchar(50),
    content varchar(255),
    is_read tinyint(1),
    created_at datetime
);

insert into users (username, full_name, gender, email, password, birthdate, hometown, created_at) values
('anhtuan','anh tuấn','nam','tuan@gmail.com','123','2000-01-01','ha noi',now()),
('minhhoa','minh hòa','nu','hoa@gmail.com','123','2001-02-02','da nang',now()),
('quang','quang vũ','nam','quang@gmail.com','123','1999-03-03','hcm',now()),
('lan','lan anh','nu','lan@gmail.com','123','2002-04-04','ha noi',now()),
('nam','nam le','nam','nam@gmail.com','123','1998-05-05','can tho',now());

insert into posts (user_id, content, created_at) values
(1,'bai viet 1',now()),
(1,'bai viet 2',now()),
(2,'bai viet 3',now()),
(3,'bai viet 4',now()),
(3,'bai viet 5',now()),
(3,'bai viet 6',now());

insert into comments (post_id, user_id, content, created_at) values
(1,2,'hay',now()),
(1,3,'tot',now()),
(1,4,'like',now()),
(2,3,'hay',now()),
(3,1,'ok',now()),
(3,4,'dep',now()),
(3,5,'ngon',now()),
(4,1,'good',now()),
(4,2,'nice',now());

insert into likes (post_id, user_id, created_at) values
(1,2,now()),
(1,3,now()),
(1,4,now()),
(1,5,now()),
(2,3,now()),
(2,4,now()),
(3,1,now()),
(3,2,now()),
(3,3,now()),
(3,4,now()),
(3,5,now()),
(4,1,now()),
(4,2,now()),
(4,3,now());

insert into friends (user_id, friend_id, status, created_at) values
(1,2,'accepted',now()),
(1,3,'accepted',now()),
(1,4,'accepted',now()),
(1,5,'accepted',now()),
(2,3,'accepted',now()),
(2,4,'pending',now()),
(3,4,'accepted',now()),
(3,5,'accepted',now());

create index idx_user_gender on users(gender);
create index idx_user_username on users(username);

create view view_popular_posts as
select 
    p.post_id,
    u.username,
    p.content,
    count(distinct l.user_id) as total_likes,
    count(distinct c.comment_id) as total_comments
from posts p
join users u on p.user_id = u.user_id
left join likes l on p.post_id = l.post_id
left join comments c on p.post_id = c.post_id
group by p.post_id, u.username, p.content;

select * from view_popular_posts;

select *,
(total_likes + total_comments) as total_interaction
from view_popular_posts
where (total_likes + total_comments) > 10
order by total_interaction desc;

create view view_user_activity_2 as
select 
    u.user_id,
    count(distinct p.post_id) as total_posts,
    count(distinct f.friend_id) as total_friends
from users u
left join posts p on u.user_id = p.user_id
left join friends f on u.user_id = f.user_id and f.status = 'accepted'
group by u.user_id;

select * from view_user_activity_2;

select 
    u.full_name,
    v.total_posts,
    v.total_friends,
    case
        when v.total_friends > 5 then 'nhiều bạn bè'
        when v.total_friends between 2 and 5 then 'vừa đủ bạn bè'
        else 'ít bạn bè'
    end as friend_description,
    case
        when v.total_posts > 10 then v.total_posts * 1.1
        when v.total_posts between 5 and 10 then v.total_posts
        else v.total_posts * 0.9
    end as post_activity_score
from view_user_activity_2 v
join users u on v.user_id = u.user_id
where v.total_posts > 0
order by v.total_posts desc;
