# 1369. Get the Second Most Recent Activity (Premium)

WITH cte AS
(SELECT DISTINCT *
FROM UserActivity),

cte2 AS
(SELECT *, ROW_NUMBER() OVER(PARTITION BY username ORDER BY startDate DESC) AS rnk, COUNT(activity) OVER(PARTITION BY username) AS num_of_activity
FROM cte)

SELECT username, activity, startDate, endDate
FROM cte2
WHERE rnk = 2 
OR num_of_activity = 1
