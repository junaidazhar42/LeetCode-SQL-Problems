# 1831. Maximum Transaction Each Day (Premium)

WITH cte AS
(SELECT transaction_id, DATE_FORMAT(day, '%Y-%m-%d') AS day, amount
FROM Transactions),

cte2 AS 
(SELECT *, MAX(amount) OVER(PARTITION BY DAY) AS maximum_amount
FROM cte)

SELECT transaction_id
FROM cte2
WHERE amount = maximum_amount
ORDER BY transaction_id


# solution without using MAX() function 
WITH cte AS
(SELECT transaction_id, DATE_FORMAT(day, '%Y-%m-%d') AS day, amount
FROM Transactions),

cte2 AS 
(SELECT *, FIRST_VALUE(amount) OVER(PARTITION BY DAY ORDER BY amount DESC) AS maximum_amount
FROM cte)

SELECT transaction_id
FROM cte2
WHERE amount = maximum_amount
ORDER BY transaction_id