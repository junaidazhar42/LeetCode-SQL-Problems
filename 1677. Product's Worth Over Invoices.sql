# 1677. Product's Worth Over Invoices

SELECT p.name AS name, IFNULL(SUM(i.rest),0) AS rest, IFNULL(SUM(i.paid),0) AS paid, IFNULL(SUM(i.cancelled),0) AS cancelled, IFNULL(SUM(i.refunded),0) AS refunded
FROM Product p
LEFT JOIN Invoice i
ON p.product_id = i.product_id
GROUP BY p.name
ORDER BY p.name