# 3626. Find Stores with Inventory Imbalance

WITH cte AS
(SELECT *, ROW_NUMBER() OVER(PARTITION BY store_id ORDER BY price DESC) AS exp_rnk, ROW_NUMBER() OVER(PARTITION BY store_id ORDER BY price) AS chp_rnk
FROM inventory),

cte2 AS
(SELECT store_id, MAX(CASE WHEN exp_rnk = 1 THEN product_name ELSE null END) AS most_exp_product, MAX(CASE WHEN chp_rnk = 1 THEN product_name ELSE null END) AS cheapest_product, SUM(CASE WHEN exp_rnk = 1 THEN quantity ELSE 0 END) AS exp_quantity, SUM(CASE WHEN chp_rnk = 1 THEN quantity ELSE 0 END) AS chp_quantity, ROUND(SUM(CASE WHEN chp_rnk = 1 THEN quantity ELSE 0 END)/ SUM(CASE WHEN exp_rnk = 1 THEN quantity ELSE 0 END),2) AS imbalance_ratio
FROM cte
GROUP BY store_id
HAVING COUNT(product_name) >= 3)

SELECT s.*, c.most_exp_product, c.cheapest_product, c.imbalance_ratio
FROM cte2 AS c
LEFT JOIN stores s
ON c.store_id = s.store_id
WHERE c.exp_quantity < c.chp_quantity
ORDER BY c.imbalance_ratio DESC, store_name;