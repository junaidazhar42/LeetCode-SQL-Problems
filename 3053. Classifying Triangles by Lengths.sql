# 3053. Classifying Triangles by Lengths

WITH cte AS
(SELECT *, CASE WHEN A+B>C AND B+C>A AND A+C>B THEN 'Yes' ELSE 'No' END AS triangle
FROM Triangles)

SELECT CASE WHEN triangle = 'Yes' AND A=B AND B=C THEN 'Equilateral'
WHEN triangle = 'Yes' AND A<>B AND B<>C AND A<>C THEN 'Scalene'
WHEN triangle = 'Yes' AND ((A=B AND B<>C) OR (B=C AND C<>A) OR (A=C AND C<>B)) THEN 'Isosceles' 
WHEN triangle = 'No' THEN 'Not A Triangle'
END AS triangle_type
FROM cte
