# 2987. Find Expensive Cities

WITH cte AS
(SELECT *, AVG(price) OVER() AS national_avg, AVG(price) OVER(PARTITION BY city) AS city_avg
FROM Listings)

SELECT city
FROM cte
WHERE city_avg > national_avg
ORDER BY city;
