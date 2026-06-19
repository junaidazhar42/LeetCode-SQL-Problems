# 1097. Game Play Analysis V (Premium)

WITH cte AS
(SELECT *, DENSE_RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS rnk, LEAD(event_date, 1) OVER(PARTITION BY player_id ORDER BY event_date) AS nxt_login
FROM Activity)

SELECT event_date AS install_dt, COUNT(*) AS installs, ROUND(SUM(CASE WHEN DATEDIFF(nxt_login, event_date) = 1 THEN 1 ELSE 0 END)/COUNT(*), 2) AS Day1_retention
FROM cte 
WHERE rnk = 1
GROUP BY event_date;