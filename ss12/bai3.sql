use ss13_k1;

-- trigger before insert: chặn tự like bài của chính mình
delimiter //

create trigger tg_before_insert_likes
before insert on likes
for each row
begin
    declare post_author_id int;

    select user_id into post_author_id 
    from posts 
    where post_id = new.post_id;

    if new.user_id = post_author_id then
        signal sqlstate '45000'
        set message_text = 'loi: ban khong the like bai viet cua chinh minh!';
    end if;
end //

delimiter ;

-- cập nhật like_count (insert, delete, update)
delimiter //

-- insert
drop trigger if exists trigger_increase_likes_count //
create trigger trigger_increase_likes_count
after insert on likes
for each row
begin
    update posts set like_count = like_count + 1 where post_id = new.post_id;
end //

-- delete
drop trigger if exists trigger_decrease_likes_count //
create trigger trigger_decrease_likes_count
after delete on likes
for each row
begin
    update posts set like_count = like_count - 1 where post_id = old.post_id;
end //

-- update post_id
drop trigger if exists trigger_update_likes_count //
create trigger trigger_update_likes_count
after update on likes
for each row
begin
    if old.post_id <> new.post_id then
        update posts set like_count = like_count - 1 where post_id = old.post_id;
        update posts set like_count = like_count + 1 where post_id = new.post_id;
    end if;
end //

delimiter ;