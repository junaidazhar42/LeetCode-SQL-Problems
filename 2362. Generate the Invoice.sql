# 2362. Generate the Invoice (Premium)

WITH cte AS
(SELECT pu.invoice_id, SUM(pu.quantity*po.price) AS total
FROM Purchases pu
LEFT JOIN Products po
ON pu.product_id = po.product_id
GROUP BY pu.invoice_id
ORDER BY total DESC, pu.invoice_id
LIMIT 1)

SELECT pu.product_id, pu.quantity, pu.quantity*po.price AS price
FROM Purchases pu
LEFT JOIN Products po
ON pu.product_id = po.product_id
WHERE pu.invoice_id IN (SELECT invoice_id FROM cte);