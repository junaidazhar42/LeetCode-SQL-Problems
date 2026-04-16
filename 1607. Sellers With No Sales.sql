# 1607. Sellers With No Sales


WITH cte AS 
(SELECT DISTINCT seller_id
FROM Ordes
WHERE YEAR(sale_date) = 2020)

SELECT seller_name
FROM Seller
WHERE seller_id NOT IN (SELECT seller_id FROM cte)
ORDER BY seller_name;
