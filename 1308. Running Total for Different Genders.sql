# 1308. Running Total for Different Genders (PREMIUM)

SELECT gender, day, SUM(score_points) OVER(PARTITION BY gender, day ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS total 
FROM Scores