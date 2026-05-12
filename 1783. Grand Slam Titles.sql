# 1783. Grand Slam Titles (Premium)


WITH cte AS
(SELECT year, 'Wimbledon' AS championship, Wimbledon AS player_id
FROM Championships
UNION
SELECT year, 'Fr_open' AS championship, Fr_open AS player_id
FROM Championships
UNION
SELECT year, 'US_open' AS championship, US_open AS player_id
FROM Championships
UNION
SELECT year, 'Au_open' AS championship, Au_open AS player_id
FROM Championships),

cte2 AS 
(SELECT player_id, COUNT(player_id) AS grand_slams_count
FROM cte
GROUP BY player_id)

SELECT c.player_id, p.player_name, c.grand_slams_count
FROM cte2 AS c
LEFT JOIN Players AS p
ON c.player_id = p.player_id
