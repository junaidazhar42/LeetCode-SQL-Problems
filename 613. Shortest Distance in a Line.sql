# 613. Shortest Distance in a Line

SELECT MIN(ABS(p1.x - p2.x)) AS shortest
FROM Point p1
CROSS JOIN p2
WHERE p1.x <> p2.x;


# Alternate Solution
SELECT MIN(ABS(p1.x - p2.x)) AS shortest
FROM Point p1
INNER JOIN p2
WHERE p1.x < p2.x;