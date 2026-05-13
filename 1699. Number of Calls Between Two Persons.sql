# 1699. Number of Calls Between Two Persons (Premium)

WITH cte AS
(SELECT CASE WHEN from_id < to_id THEN from_id ELSE to_id AS person1, 
CASE WHEN from_id < to_id THEN to_id ELSE from_id AS person2
FROM Calls)


SELECT person1, person2, COUNT(*) AS call_count, SUM(duration) AS total_duration
FROM cte
GROUP BY person1, person2