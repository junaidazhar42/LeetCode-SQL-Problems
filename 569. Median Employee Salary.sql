# 569. Median Employee Salary (Premium)

WITH cte AS
(SELECT *, ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary) AS rnk, COUNT(id) OVER(PARTITION BY company) AS n
FROM Employee


SELECT id, company, salary
FROM cte
WHERE rnk BETWEEN n/2 AND (n/2) + 1;