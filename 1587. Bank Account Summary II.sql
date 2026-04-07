# 1587. Bank Account Summary II

WITH cte AS
(SELECT *, SUM(amount) AS balance
FROM Transactions
GROUP BY account)

SELECT u.name, c.balance
FROM cte c
LEFT JOIN Users u
ON c.account = u.account
WHERE c.balance > 10000


-- Alternate Solution
-- SELECT u.name, SUM(amount) AS balance
-- FROM Transactions t
-- INNER JOIN Users u
-- ON t.account = u.account
-- GROUP BY u.name
-- HAVING SUM(amount) > 10000