# 3246. Premier League Table Ranking

SELECT team_id, team_name, wins*3+draws*1+losses*0 AS points, RANK() OVER(ORDER BY wins*3+draws*1+losses*0 DESC) AS position
FROM TeamStats
ORDER BY points, team_name;
