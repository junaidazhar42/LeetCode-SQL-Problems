# 1322. Ads Performance

WITH cte AS
(SELECT ad_id, SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END) AS Clicked, SUM(CASE WHEN action = 'Viewed' THEN 1 ELSE 0 END) AS Viewed 
FROM Ads
GROUP BY ad_id)

SELECT ad_id, CASE WHEN Clicked + Viewed = 0 THEN 0.00 
ELSE ROUND((Clicked/(Clicked+Viewed))*100,2) AS ctr
FROM cte
ORDER BY ctr DESC, ad_id