create database ss13_k1;
use ss13_k1;
drop database ss13_k1;

create table users (
	user_id int primary key auto_increment,
    username varchar(50) not null unique,
    email varchar(100) not null unique,
    created_at datetime default current_timestamp,
    follower_count int default(0),
    post_count int default(0)
);

create table posts (
	post_id int primary key auto_increment,
    user_id int,
    content text,
    created_at datetime default current_timestamp,
    like_count int default(0),
    
    constraint fk_posts_users foreign key(user_id) references users(user_id) on delete cascade
);

INSERT INTO users (username, email, created_at) VALUES
('alice', 'alice@example.com', '2025-01-01'),
('bob', 'bob@example.com', '2025-01-02'),
('charlie', 'charlie@example.com', '2025-01-03');

INSERT INTO posts (user_id, content, created_at) VALUES
(1, 'Hello world from Alice!', '2025-01-10 10:00:00'),
(1, 'Second post by Alice', '2025-01-10 12:00:00'),
(2, 'Bob first post', '2025-01-11 09:00:00'),
(3, 'Charlie sharing thoughts', '2025-01-12 15:00:00');

SELECT * FROM users;

-- Trigger AFTER INSERT trên posts: Khi thêm bài đăng mới, tăng post_count của người dùng tương ứng lên 1
delimiter //
create  trigger trigger_increase_posts_count
after insert on posts
for each row
begin
	update users
    set post_count = post_count + 1
    where user_id = new.user_id;
end //

-- Trigger AFTER DELETE trên posts: Khi xóa bài đăng, giảm post_count của người dùng tương ứng đi 1
create trigger trigger_decrease_post_count
after delete on posts
for each row
begin
	update users
    set post_count = post_count - 1
    where user_id = old.user_id;
end //
delimiter ;


drop trigger if exists trigger_increase_posts_count;
drop trigger if exists trigger_decrease_post_count;