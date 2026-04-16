# 1076. Project Employees II

WITH cte AS
(SELECT project_id, COUNT(employee_id) AS num_of_emp
FROM Project
GROUP BY project_id)

SELECT project_id
FROM cte 
WHERE num_of_emp = (SELECT MAX(num_of_emp) FROM cte)