# 3057. Employees Project Workload (Premium)

WITH cte AS
(SELECT p.*, e.name, e.team, AVG(p.workload) OVER(PARTITIION BY e.team) AS avg_load
FROM Project p
LEFT JOIN Employees e
USING (employee_id))

SELECT employee_id, project_id, name AS employee_name, workload AS project_workload
FROM cte
WHERE workload > avg_load
ORDER BY employee_id, project_id