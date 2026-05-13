# 1596. The Most Frequently Ordered Products for Each Customer (Premium)

WITH cte AS
(SELECT customer_id, product_id, COUNT(*) AS num_ordered
FROM Orders
GROUP BY customer_id, product_id),

cte2 AS
(SELECT *, FIRST_VALUE(num_ordered) OVER(PARTITION BY customer_id ORDER BY num_ordered DESC) AS most_frequent 
FROM cte)

SELECT c.customer_id, c.product_id, p.product_name
FROM cte2 c
LEFT JOIN Products p
ON c.product_id = p.product_id
WHERE c.num_ordered = c.most_frequent