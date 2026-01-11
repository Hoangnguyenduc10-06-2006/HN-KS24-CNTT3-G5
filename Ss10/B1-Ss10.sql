CREATE DATABASE b1;
USE b1;

CREATE VIEW view_users_firstname AS
SELECT user_id, username, full_name, email, created_at
FROM users
WHERE full_name LIKE 'Nguyễn%';

SELECT * FROM view_users_firstname;

INSERT INTO users (username, full_name, gender, email, password)
VALUES ('nguyen_test', 'Nguyễn Văn Test', 'Nam', 'nguyentest@gmail.com', '123');

SELECT * FROM view_users_firstname;

DELETE FROM users
WHERE username = 'nguyen_test';

SELECT * FROM view_users_firstname;
