# 1194. Tournament Winners (Premium)

WITH cte AS
(SELECT p.group_id, p.player_id, 
SUM(CASE WHEN p.player_id = m.first_player THEN m.first_score
WHEN p.player_id = m.second_player THEN m.second_score 
ELSE NULL END) AS total_points
FROM Players AS p
LEFT JOIN Matches AS m
ON p.player_id = m.first_player
OR p.player_id = m.second_player
GROUP BY p.group_id, p.player_id),

cte2 AS
(SELECT *, DENSE_RANK() OVER(PARTITION BY group_id ORDER BY total_points DESC, player_id) AS rnk
FROM cte)

SELECT group_id, player_id
FROM cte2
WHERE rnk = 1;