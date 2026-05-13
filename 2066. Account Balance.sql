# 2066. Account Balance (Premium)

WITH cte AS
(SELECT *, CASE WHEN type = 'Deposit' THEN amount 
ELSE -1*amount END AS amount_with_sign
FROM Transactions)

SELECT account_id, day, SUM(amount_with_sign) OVER(PARTITION BY account_id ORDER BY day ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS balance
FROM cte
ORDER BY account_id, day 