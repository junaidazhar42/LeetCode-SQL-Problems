# 1741. Find Total Time Spent By Each Employee

SELECT event_day AS day, emp_id, SUM(out_time-in_time) AS total_time
FROM Employees
GROUP BY event_day, emp_id