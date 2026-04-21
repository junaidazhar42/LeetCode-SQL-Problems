# 2480. Form a Chemical Bond

SELECT *
FROM (SELECT symbol AS metal
FROM Elements
WHERE type = "Metal") AS M
CROSS JOIN
(SELECT symbol AS nonmetal
FROM Elements
WHERE type = "Nonmetal") AS N;