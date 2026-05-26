# 1767. Find the Subtasks That Did Not Evaluate (Premium)

WITH RECURSIVE cte AS
(
	SELECT *
	FROM Tasks
	UNION
	SELECT task_id, subtasks_count - 1
	FROM cte
	WHERE subtasks_count > 1
)

SELECT task_id, subtasks_count AS subtask_id
FROM cte
WHERE (task_id, subtasks_count) NOT IN (SELECT * FROM Executed);