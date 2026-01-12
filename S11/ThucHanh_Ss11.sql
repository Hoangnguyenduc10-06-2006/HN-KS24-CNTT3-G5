
CREATE DATABASE SocialLab;
USE SocialLab;

DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT,
    author VARCHAR(100),
    likes_count INT DEFAULT 0
);


DELIMITER //

CREATE PROCEDURE sp_CreatePost (
    IN p_content TEXT,
    IN p_author VARCHAR(100),
    OUT p_post_id INT
)
BEGIN
    INSERT INTO posts (content, author)
    VALUES (p_content, p_author);

    SET p_post_id = LAST_INSERT_ID();
END //

CREATE PROCEDURE sp_SearchPost (
    IN p_keyword VARCHAR(100)
)
BEGIN
    SELECT *
    FROM posts
    WHERE content LIKE CONCAT('%', p_keyword, '%');
END //

CREATE PROCEDURE sp_IncreaseLike (
    IN p_post_id INT,
    INOUT p_likes INT
)
BEGIN
    UPDATE posts
    SET likes_count = likes_count + 1
    WHERE post_id = p_post_id;

    SELECT likes_count INTO p_likes
    FROM posts
    WHERE post_id = p_post_id;
END //

CREATE PROCEDURE sp_DeletePost (
    IN p_post_id INT
)
BEGIN
    DELETE FROM posts
    WHERE post_id = p_post_id;
END //

DELIMITER ;

CALL sp_CreatePost('hello world first post', 'Dung', @id1);
CALL sp_CreatePost('this is a hello post', 'Dung', @id2);

SELECT @id1 AS PostID1, @id2 AS PostID2;

CALL sp_SearchPost('hello');

SET @likes = 0;
CALL sp_IncreaseLike(@id1, @likes);
SELECT @likes AS Likes_After_Update;

CALL sp_DeletePost(@id2);

DROP PROCEDURE IF EXISTS sp_CreatePost;
DROP PROCEDURE IF EXISTS sp_SearchPost;
DROP PROCEDURE IF EXISTS sp_IncreaseLike;
DROP PROCEDURE IF EXISTS sp_DeletePost;
