USE social_network_pro;

DELIMITER $$

CREATE PROCEDURE NotifyFriendsOnNewPost(
    IN p_user_id INT,
    IN p_content TEXT
)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_friend_id INT;
    DECLARE v_full_name VARCHAR(255);
    DECLARE v_post_id INT;

    DECLARE friend_cursor CURSOR FOR
        SELECT friend_id FROM friends
        WHERE user_id = p_user_id AND status = 'accepted'
        UNION
        SELECT user_id FROM friends
        WHERE friend_id = p_user_id AND status = 'accepted';

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    SELECT full_name INTO v_full_name
    FROM users
    WHERE user_id = p_user_id;

    INSERT INTO posts(user_id, content, created_at)
    VALUES (p_user_id, p_content, NOW());

    SET v_post_id = LAST_INSERT_ID();

    OPEN friend_cursor;

    read_loop: LOOP
        FETCH friend_cursor INTO v_friend_id;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        IF v_friend_id <> p_user_id THEN
            INSERT INTO notifications(user_id, type, content, created_at)
            VALUES (
                v_friend_id,
                'new_post',
                CONCAT(v_full_name, ' đã đăng một bài viết mới'),
                NOW()
            );
        END IF;
    END LOOP;

    CLOSE friend_cursor;
END $$

DELIMITER ;

CALL NotifyFriendsOnNewPost(1, 'Đây là bài viết mới để test thông báo');

SELECT *
FROM notifications
ORDER BY created_at DESC;

DROP PROCEDURE NotifyFriendsOnNewPost;
