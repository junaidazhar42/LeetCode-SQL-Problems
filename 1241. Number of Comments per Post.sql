# 1241. Number of Comments per Post

WITH posts AS
(SELECT DISTINCT sub_id
FROM Submissions 
WHERE parent_id IS NULL)

WITH com AS
(SELECT parent_id, COUNT(DISTINCT sub_id) AS Num
FROM Submissions
WHERE parent_id IS NOT NULL
GROUP BY parent_id)

SELECT sub_id AS post_id CASE WHEN Num IS NOT NULL THEN Num ELSE 0 END AS number_of_comments
FROM posts
LEFT JOIN com
ON posts.sub_id = com.parent_id
ORDER BY post_id;