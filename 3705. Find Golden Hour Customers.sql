# 3705. Find Golden Hour Customers

WITH cte AS
(SELECT customer_id, order_rating, CASE
WHEN TIME(order_timestamp) BETWEEN '11:00:00' AND '13:59:59' 
OR TIME(order_timestamp) BETWEEN '18:00:00' AND '20:59:59'
THEN 1 ELSE 0 END AS peak_order
FROM restaurant_orders)

SELECT customer_id, COUNT(*) AS total_orders, ROUND(AVG(peak_order) * 100) AS peak_hour_percentage, ROUND(AVG(order_rating), 2) AS average_rating
FROM cte 
GROUP BY customer_id
HAVING COUNT(*) >= 3
AND AVG(peak_order) >= 0.60
AND AVG(order_rating) >= 4.0
AND COUNT(order_rating) * 1.0 / COUNT(*) >= 0.50
ORDER BY average_rating DESC, customer_id DESC;