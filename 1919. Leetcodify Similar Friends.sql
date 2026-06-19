# 1919. Leetcodify Similar Friends (Premium)

WITH cte AS
(SELECT l1.user_id AS user1_id, l2.user_id AS user2_id
FROM Listens AS l1
LEFT JOIN Listens AS l2
ON l1.song_id = l2.song_id
AND l1.day = l2.day
AND l1.user_id <> l2.user_id
GROUP BY l1.user_id, l2.user_id, l1.day
HAVING COUNT(DISTINCT l1.song_id) >= 3)

SELECT DISTINCT user1_id, user2_id
FROM cte
WHERE (user1_id, user2_id) IN (SELECT * FROM Friendship)
AND user1_id < user2_id; 