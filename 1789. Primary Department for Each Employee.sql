# 1789. Primary Department for Each Employee

SELECT employee_id, department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(department_id) = 1

UNION

SELECT DISTINCT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'


Alternate Solution
SELECT employee_id, CASE WHEN COUNT(department_id) = 1 THEN department_id 
WHEN COUNT(department_id) > 1 THEN SUM((primary_flag = 'Y')*department_id) 
END AS department_id
FROM Employee
GROUP BY employee_id;