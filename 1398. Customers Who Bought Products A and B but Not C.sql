# 1398. Customers Who Bought Products A and B but Not C (Premium)

WITH cte AS
(SELECT customer_id
FROM Orders
GROUP BY customer_id
HAVING SUM(product_name = 'A')>0 AND SUM(product_name = 'B')>0 AND SUM(product_name = 'C') = 0)

SELECT *
FROM Customers
WHERE customer_id IN (SELECT customer_id FROM cte)
ORDER BY customer_id
