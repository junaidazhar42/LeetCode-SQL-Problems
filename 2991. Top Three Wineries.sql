# 2991. Top Three Wineries (Premium)

WITH cte AS
(SELECT country, winery, SUM(points) AS total, ROW_NUMBER() OVER(PARTITION BY country ORDER BY SUM(points) DESC, winery) AS rnk
FROM Wineries
GROUP BY country, winery),

cte2 AS
(SELECT *, CONCAT(winery, "(", total, ")") AS wwp
FROM cte
WHERE rnk <= 3)

SELECT country, MAX(CASE WHEN rnk = 1 THEN wwp ELSE NULL END) AS top_winery, IFNULL(MAX(CASE WHEN rnk = 2 THEN wwp ELSE NULL END), 'No second winery') AS second_winery, 
IFNULL(MAX(CASE WHEN rnk = 3 THEN wwp ELSE NULL END), 'No third winery') AS third_winery
FROM cte2
GROUP BY country
ORDER BY country;