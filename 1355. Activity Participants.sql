# 1355. Activity Participants (Premium)

WITH cte AS
(SELECT activity, COUNT(id) AS num_part
FROM Friends
GROUP BY activity),

cte2 AS
(SELECT a.name, CASE WHEN c.num_part IS NOT NULL THEN c.num_part
FROM Activities a
LEFT JOIN cte c
ON a.name = c.activity)

SELECT name AS activity
FROM cte2
WHERE frequency <> (SELECT MAX(frequency) FROM cte2)
AND frequency <> (SELECT MIN(frequency) FROM cte2)