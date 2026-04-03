# 586. Customer Placing the Largest Number of Orders
WITH cte AS
(
    SELECT customer_number, COUNT(order_number) AS NumberofOrders
    FROM Orders
    GROUP BY customer_number
)

SELECT customer_number
FROM cte
WHERE NumberofOrders = (SELECT MAX(NumberofOrders) FROM cte);