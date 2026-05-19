# 3220. Odd and Even Transactions

WITH cte AS
(SELECT *, CASE WHEN amount % 2 = 0 THEN amount ELSE 0 END AS even_amount, 
CASE WHEN amount % 2 <> 0 THEN amount ELSE 0 END AS odd_amount
FROM transactions)

SELECT transaction_date, SUM(odd_amount) AS odd_sum, SUM(even_amount) AS even_sum
FROM cte
GROUP BY transaction_date
ORDER BY transaction_date;