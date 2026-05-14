# 1934. Confirmation Rate

WITH cte AS(
SELECT s.user_id, c.action, CASE WHEN action = 'confirmed' THEN 1 
ELSE 0 END AS conf
FROM Signups s 
LEFT JOIN Confirmations c
ON s.user_id = c.user_id)


SELECT user_id, IFNULL(ROUND(SUM(conf) / COUNT(action), 2), 0) AS confirmation_rate
FROM cte
GROUP BY user_id


# Alternate Solution

SELECT s.user_id, CASE WHEN c.time_stamp IS NULL THEN 0.00
ELSE ROUND(SUM(c.action = 'confirmed')/COUNT(*),2) END AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id