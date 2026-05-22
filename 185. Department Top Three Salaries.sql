# 185. Department Top Three Salaries 

WITH cte AS
(SELECT *, DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rnk
FROM Employee)

SELECT d.name AS Department, c.name AS Employee, c.salary AS Salary
FROM cte AS c
LEFT JOIN Department AS d
ON c.departmentId = d.id
WHERE c.rnk IN (1, 2, 3)