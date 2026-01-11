CREATE VIEW V_User_Public_Profile AS
SELECT username, email, created_at
FROM users;

CREATE VIEW V_Public_NewsFeed AS
SELECT 
    u.username,
    p.content,
    p.created_at,
    COUNT(l.id) AS like_count
FROM posts p
JOIN users u ON p.user_id = u.id
LEFT JOIN likes l ON p.id = l.post_id
WHERE p.privacy = 'PUBLIC'
GROUP BY p.id, u.username, p.content, p.created_at;

CREATE VIEW V_Public_Posts_Check AS
SELECT *
FROM posts
WHERE privacy = 'PUBLIC'
WITH CHECK OPTION;

EXPLAIN
SELECT *
FROM posts
WHERE privacy = 'PUBLIC'
ORDER BY created_at DESC;

CREATE INDEX idx_posts_privacy_created
ON posts(privacy, created_at);

CREATE INDEX idx_posts_user
ON posts(user_id);

EXPLAIN
SELECT *
FROM posts
WHERE privacy = 'PUBLIC'
ORDER BY created_at DESC;

EXPLAIN
SELECT *
FROM posts
WHERE user_id = 1;
