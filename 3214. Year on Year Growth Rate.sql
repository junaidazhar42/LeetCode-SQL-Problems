# 3214. Year on Year Growth Rate (Premium)

WITH cte AS
(SELECT YEAR(transaction_date) AS year, product_id, SUM(spend) AS curr_year_spend
FROM user_transactions
GROUP BY YEAR(transaction_date), product_id),

cte2 AS
(SELECT *, LAG(curr_year_spend, 1) OVER(PARTITION BY product_id ORDER BY year) AS prev_year_spend
FROM cte)

SELECT *, ROUND((curr_year_spend - prev_year_spend)/(prev_year_spend)*100, 2) AS yoy_rate
FROM cte2
ORDER BY product_id, year;