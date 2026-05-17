# 3580. Find Consistently Improving Employees 

WITH cte AS
(SELECT p.employee_id,  e.name, rating, ROW_NUMBER() OVER(PARTITION BY p.employee_id ORDER BY review_date DESC) AS date_rnk
FROM performance_reviews p
LEFT JOIN employees e
ON p.employee_id = e.employee_id),

cte2 AS
(SELECT employee_id, name, SUM(CASE WHEN date_rnk = 1 THEN rating END) AS r1,
SUM(CASE WHEN date_rnk = 2 THEN rating END) AS r2,
SUM(CASE WHEN date_rnk = 3 THEN rating END) AS r3
FROM cte
GROUP BY employee_id)

SELECT employee_id, name, (r1 - r3) AS improvement_score
FROM cte2
WHERE r1 IS NOT NULL AND r2 IS NOT NULL AND r3 IS NOT NULL AND r1 > r2 AND r2 > r3
ORDER BY improvement_score DESC, name;


# Alternate Solution
WITH cte AS
(SELECT *, ROW_NUMBER() OVER(PARTITION BY employee_id ORDER BY review_date DESC) AS rnk
FROM performance_review AS p),

cte2 AS
(SELECT employee_id, SUM(CASE WHEN rnk = 1 THEN rating END) AS r1, SUM(CASE WHEN rnk = 2 THEN rating END) AS r2, SUM(CASE WHEN rnk = 3 THEN rating END) AS r3
FROM cte 
WHERE rnk <= 3
GROUP BY employee_id)

SELECT c1.employee_id, e.name, (c1.r1 - c1.r3) AS improvement_score
FROM cte2 AS c1
LEFT JOIN employees AS e
ON c1.employee_id = e.employee_id
WHERE c1.r1 IS NOT NULL 
AND c2.r2 IS NOT NULL
AND c3.r3 IS NOT NULL
AND c1.r1 > c1.r2 
AND c1.r2 > c1.r3;