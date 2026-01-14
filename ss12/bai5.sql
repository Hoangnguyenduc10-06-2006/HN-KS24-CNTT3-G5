use ss13_k1;

delimiter //
create trigger tg_before_insert_users
before insert on users
for each row
begin
    if new.email not like '%@%.%' then
        signal sqlstate '45000'
        set message_text = 'loi: dinh dang email khong hop le (thieu @ hoac .)!';
    end if;

    if new.username not regexp '^[a-za-z0-9_]+$' then
        signal sqlstate '45000'
        set message_text = 'loi: username chi duoc chua chu cai, so va dau gach duoi (_)!';
    end if;
end //
delimiter ;

delimiter //
create procedure add_user( p_username varchar(50), p_email varchar(100), p_created_at datetime)
begin
    insert into users (username, email, created_at) 
    values (p_username, p_email, p_created_at);
end //
delimiter ;

call add_user('nguyen_van_a', 'vanya@example.com', now());
call add_user('user_01', 'email_loi@gmailcom', now());
call add_user('user 02!', 'user02@example.com', now());
select * from users;