# 2173. Longest Winning Streak (Premium)

WITH cte AS
(SELECT *, ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY match_day) AS match_seq, ROW_NUMBER() OVER(PARTITION BY player_id, result ORDER BY match_day) AS result_seq
FROM Matches),

cte2 AS
(SELECT player_id, (match_seq - res_seq) AS diff, COUNT(*) AS streak, ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY COUNT(*) DESC) AS rnk
FROM cte
WHERE result = 'Win'
GROUP BY player_id, (match_seq - res_seq))

SELECT DISTINCT m.player_id, IFNULL(T.streak, 0) AS longest_streak
FROM Matches AS m
LEFT JOIN (SELECT player_id, streak
FROM cte2
WHERE rnk = 1) AS T
USING (player_id); 