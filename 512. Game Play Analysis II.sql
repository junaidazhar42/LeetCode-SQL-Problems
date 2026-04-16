# 512. Game Play Analysis II

WITH cte AS
(SELECT *, ROW_NUMBER() OVER(PARTITION BY player_id
ORDER BY event_date) AS rnk
FROM Activity)


SELECT player_id, device_id
FROM cte
WHERE rnk = 1
