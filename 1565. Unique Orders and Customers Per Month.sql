# 1565. Warehouse Manager

SELECT SUBSTRING(order_date, 1, 7) AS month, 
COUNT(order_id) AS order_count, COUNT(DISTINCT customer_id) AS customer_count
FROM Orders
WHERE invoice > 20
GROUP BY SUBSTRING(order_date, 1, 7)