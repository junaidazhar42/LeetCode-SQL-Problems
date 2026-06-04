# 1972. First and Last Call on Same Day (Premium)

WITH cte AS
(SELECT *
FROM Calls
UNION 
SELECT recipient_id, caller_id, call_time
FROM Calls),

cte2 AS
(SELECT *, FIRST_VALUE(recipient_id) OVER(PARTITION BY caller_id, DATE(call_time) ORDER BY call_time ASC) AS fcw, FIRST_VALUE(recipient_id) OVER(PARTITION BY caller_id, DATE(call_time) ORDER BY call_time ASC) AS lcw
FROM cte)

SELECT DISTINCT caller_id AS user_id
FROM cte2
WHERE fcw = lcw;