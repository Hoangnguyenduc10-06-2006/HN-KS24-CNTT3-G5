use ss13_k1;

create table post_history (
    history_id int primary key auto_increment,
    post_id int,
    old_content text,
    new_content text,
    changed_at datetime default current_timestamp,
    changed_by_user_id int,
    
    constraint fk_history_posts foreign key (post_id) references posts(post_id) on delete cascade
);

delimiter //
create trigger tg_before_update_posts
before update on posts
for each row
begin
    if old.content <> new.content then
        insert into post_history ( post_id,  old_content, new_content,  changed_by_user_id ) 
        values ( old.post_id, old.content, new.content, old.user_id );
    end if;
end //
delimiter ;

update posts 
set content = 'noi dung da duoc chinh sua lan 1' 
where post_id = 1;

update posts 
set content = 'alice thay doi noi dung lan 2' 
where post_id = 1;

select * from post_history;

-- like hiện tại
select post_id, content, like_count from posts where post_id = 1;

update likes set post_id = 2 where post_id = 1 limit 1;
select post_id, like_count from posts where post_id in (1, 2);