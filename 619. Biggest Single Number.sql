# 619. Biggest Single Number

WITH cte AS
(SELECT num
FROM MyNumbers
GROUP BY num
HAVING COUNT(num) = 1)

SELECT MAX(num) AS num
FROM cte;


# Alternate Solution
WITH cte AS
(SELECT num
FROM MyNumbers
GROUP BY num
HAVING COUNT(num) = 1)

SELECT CASE WHEN COUNT(*) THEN MAX(num)
ELSE NULL END AS num
FROM cte;