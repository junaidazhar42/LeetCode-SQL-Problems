# 1867. Orders With Maximum Quantity Above Average (Premium)

WITH cte AS(
SELECT order_id, MAX(quantity) AS max_order, AVG(quantity) AS avg_order
FROM OrderDetails
GROUP BY order_id)

SELECT order_id
FROM cte 
WHERE max_order > (SELECT MAX(avg_order) FROM cte)