# 1083. Sales Analysis II

WITH cte AS
(SELECT s.*, p.product_name
FROM Sales s
LEFT JOIN Product p
ON s.product_id = p.product_id)


SELECT DISTINCT buyer_id
FROM cte
WHERE product_name = 'S8'
AND buyer_id NOT IN (SELECT DISTINCT buyer_id FROM cte WHERE product_name = 'iPhone')
