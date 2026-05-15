# 1077. Project Employees III (Premium)

WITH cte AS 
(SELECT p.project_id, p.employee_id, e.experience_years, MAX(e.experience_years) OVER(PARTITION BY p.project_id) AS max_exp
FROM Project p
LEFT JOIN Employee e
ON p.employee_id = e.employee_id)

SELECT project_id, employee_id
FROM cte
WHERE experience_years = max_exp