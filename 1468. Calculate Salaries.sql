# 1468. Calculate Salaries (Premium)

WITH cte AS
(SELECT *, MAX(salary) OVER(PARTITION BY company_id) AS max_salary
FROM Salaries)

SELECT compnany_id, employee_id, employee_name, ROUND(CASE WHEN max_salary < 1000 THEN salary 
WHEN max_salary BETWEEN 1000 AND 10000 THEN 0.76*salary
ELSE 0.51*salary END, 0) AS salary
FROM cte