# 3642. Find Books with Polarized Opinions 

WITH cte AS
(SELECT book_id, MAX(session_rating) AS max_rating, MIN(session_rating) AS min_rating, SUM(CASE WHEN session_rating >=4 THEN 1 ELSE 0 END) AS high_rating_num,  
SUM(CASE WHEN session_rating <= 2 THEN 1 ELSE 0 END) AS low_rating_num, COUNT(session_id) AS total_sessions
FROM reading_sessions
GROUP BY book_id
HAVING COUNT(session_id) >= 5),

cte2 AS
(SELECT book_id, (max_rating - min_rating) AS rating_spread, ((high_rating_num + low_rating_num) / total_sessions) AS polarization_score
FROM cte
WHERE high_rating_num != 0 
AND low_rating_num != 0)

SELECT b.*, c.rating_spread, ROUND(c.polarization_score, 2) AS polarization_score
FROM cte2 AS c
LEFT JOIN books AS b
ON c.book_id = b.book_id
WHERE c.polarization_score >= 0.6
ORDER BY c.polarization_score DESC, b.title DESC