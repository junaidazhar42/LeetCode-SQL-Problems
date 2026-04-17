# 1939. Users That Actively Request Confirmation Messages

WITH cte AS
(SELECT *, LEAD(time_stamp) OVER(PARTITION BY user_id ORDER BY time_stamp) AS next_confirmation_request_time
FROM Confirmations)

SELECT DISTINCT user_id
FROM cte
WHERE next_confirmation_request_time BETWEEN time_stamp AND DATE_ADD(time_stamp, INTERVAL 24 HOUR)
