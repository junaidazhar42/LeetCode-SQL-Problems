# 3611. Find Overbooked Employees 

WITH cte AS
(SELECT employee_id, WEEK(meeting_date, 1) AS week_monday, SUM(duration_hours) AS meeting_hours, CASE WHEN (SUM(duration_hours)/40) > 0.5 THEN 'Y' ELSE 'N' END AS meeting_heavy
FROM meetings
GROUP by employee_id, WEEK(meeting_date, 1))

SELECT c.employee_id, e.employee_name, e.department, COUNT(*) AS meeting_heavy_weeks
FROM cte AS c
LEFT JOIN employees AS e
ON c.employee_id = e.employee_id
WHERE meeting_heavy = 'Y'
GROUP BY c.employee_id, e.employee_name, e.department
HAVING COUNT(*) > 1
ORDER BY meeting_heavy_weeks DESC, e.employee_name