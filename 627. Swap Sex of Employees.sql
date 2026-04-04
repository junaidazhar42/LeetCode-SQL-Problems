# 627. Swap Sex of Employees

UPDATE Salary
SET sex = CASE WHEN sex = 'f' THEN 'm'
WHEN sex = 'm' THEN 'f' END;