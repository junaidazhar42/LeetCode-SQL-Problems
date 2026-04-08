# 1173. Food Delivery I

SELECT ROUND((SUM(CASE WHEN order_date = customer_pref_delivery_data THEN 1 ELSE 0 END)) / COUNT(*) * 100, 2) AS immediate_percentage
FROM Delivery



# Alternate Solution
WITH cte AS
(
SELECT *, CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END AS temp
FROM Delivery
)

SELECT ROUND((SUM(temp)) / COUNT(*) * 100, 2) AS immediate_percentage
FROM cte