
use ss13_k1;

create table friendships (
    follower_id int,
    followee_id int,
    status enum('pending', 'accepted') default 'accepted',
    primary key (follower_id, followee_id),
    constraint fk_follower foreign key (follower_id) references users(user_id) on delete cascade,
    constraint fk_followee foreign key (followee_id) references users(user_id) on delete cascade
);

delimiter //
-- tăng follower_count khi có một hàng mới được chèn vào friendships
drop trigger if exists trigger_increase_follower_count //
create trigger trigger_increase_follower_count
after insert on friendships
for each row
begin
    if new.status = 'accepted' then
        update users 
        set follower_count = follower_count + 1 
        where user_id = new.followee_id;
    end if;
end //

-- giảm follower_count khi một hàng bị xóa khỏi friendships
drop trigger if exists trigger_decrease_follower_count //
create trigger trigger_decrease_follower_count
after delete on friendships
for each row
begin
    if old.status = 'accepted' then
        update users 
        set follower_count = follower_count - 1 
        where user_id = old.followee_id;
    end if;
end //
delimiter ;

-- 
delimiter //
create procedure follow_user(
    in p_follower_id int,
    in p_followee_id int,
    in p_status enum('pending', 'accepted')
)
begin
    -- tự follow chính mình
    if p_follower_id = p_followee_id then
        signal sqlstate '45000'
        set message_text = 'loi: ban khong the tu theo doi chinh minh!';
    end if;

    -- chèn 
    insert into friendships (follower_id, followee_id, status)
    values (p_follower_id, p_followee_id, p_status);
end //
delimiter ;

-- view
create or replace view user_profile as
select  u.user_id, u.username, u.follower_count, u.post_count,
    coalesce(sum(p.like_count), 0) as total_likes,
    (select group_concat(content order by created_at desc separator ' | ') 
     from posts 
     where user_id = u.user_id 
     limit 3) as recent_posts
from users u
left join posts p on u.user_id = p.user_id
group by u.user_id;

-- test
call follow_user(1, 2, 'accepted');
call follow_user(3, 2, 'accepted');

select user_id, username, follower_count from users where user_id = 2;

delete from friendships where follower_id = 1 and followee_id = 2;

-- kiểm tra lại follower_count của bob (- 1)
select user_id, username, follower_count from users where user_id = 2;
select * from user_profile;
