# 1285. Find the Start and End Number of Continuous Ranges (Premium)
WITH cte AS
(SELECT log_id, log_id - ROW_NUMBER() OVER(ORDER BY log_id) AS diff
FROM Logs)

SELECT MIN(log_id) AS start_id, MAX(log_id) AS end_id
FROM cte
GROUP BY diff
ORDER BY start_id


# ROW_NUMBER() assigns a unique number to each row. 
# cte looks like:
# log_id	diff
# 1		0
# 2		0
# 3		0
# 7		3
# 8		3
# 10		4