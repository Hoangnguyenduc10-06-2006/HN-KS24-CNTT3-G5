use ss13_k1;

create table likes(
	like_id int primary key auto_increment,
    user_id int,
    post_id int,
    liked_at datetime default current_timestamp,
    
    constraint fk_likes_users foreign key(user_id) references users(user_id),
    constraint fk_likes_posts foreign key(post_id) references posts(post_id)
);

drop table likes;	

select * from posts;
INSERT INTO likes (user_id, post_id) VALUES
(2, 1), (3, 1), (1, 2), (3, 4);

INSERT INTO likes (user_id, post_id) VALUE
(3, 1);

-- Tạo trigger AFTER INSERT và AFTER DELETE trên likes để tự động cập nhật like_count trong bảng posts.
drop trigger if exists trigger_increase_likes_count;
delimiter //
create  trigger trigger_increase_likes_count
after insert on likes
for each row
begin
	update posts
    set like_count = like_count + 1
    where post_id = new.post_id;
end //

-- AFTER DELETE
create trigger trigger_decrease_likes_count
after delete on likes
for each row
begin
	update posts
    set like_count = like_count - 1
    where post_id = old.post_id;
end //
delimiter ;

-- view
create or replace view user_statistics 
as 
select u.user_id, u.username, u.post_count, sum(like_count) as total_likes 
from users u
join posts p on u.user_id = p.user_id
join likes l on l.post_id = p.post_id
group by p.user_id;

select * from user_statistics;