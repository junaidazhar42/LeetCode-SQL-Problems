# 1251. Average Selling Price

SELECT p.product_id AS product_id , CASE WHEN u.units is NOT NULL THEN 
ROUND(SUM(p.price*u.units)/SUM(u.units),2)
 ELSE 0 END AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON p.product_id=u.product_id
WHERE u.purchase_date BETWEEN p.start_date 
AND p.end_date OR u.purchase_date IS NULL
GROUP BY p.product_id