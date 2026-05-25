# 1412. Find the Quiet Students in All Exams (Premium)

WITH cte AS
(SELECT *, MAX(score) OVER(PARTITION BY exam_id) AS max_score, MIN(score) OVER(PARTITION BY exam_id) AS min_score
FROM Exam),

cte2 AS
(SELECT DISTINCT student_id
FROM cte
WHERE score = max_score 
OR score = min_score), 

cte3 AS
(SELECT DISTINCT student_id
FROM cte
WHERE (score <> max_score 
OR score <> min_score)
AND student_id NOT IN (SELECT student_id FROM cte2))

SELECT *
FROM cte3
WHERE student_id IN (SELECT student_id FROM cte3)
ORDER BY student_id