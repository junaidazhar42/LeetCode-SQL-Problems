# 1445. Apples and Oranges

WITH cte AS
(SELECT *
FROM Sales
ORDER BY sale_date, fruit),
cte2 AS
(SELECT *, LEAD(sold_num,1)  OVER(PARTITION BY sale_date) AS orange_num
FROM cte)


SELECT sale_date, (sold_num - orange_num) AS diff
FROM cte2
WHERE orange_num IS NOT NULL
ORDER BY sale_date;
