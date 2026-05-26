# 1159. Market Analysis II (Premium)

WITH cte AS
(SELECT u.user_id, u.favorite_brand, o.order_date, i.item_brand, DENSE_RANK() OVER(PARTITION BY u.user_id ORDER BY o.order_date) AS rnk, COUNT(*) OVER(PARTITION BY u.user_id) AS count_items
FROM Users AS u
LEFT JOIN Orders AS o
ON u.user_id = o.seller_id
LEFT JOIN Items AS i
ON o.item_id = i.item_id),

cte2 AS
(SELECT user_id AS seller_id, CASE WHEN count_items < 2 THEN 'no'
WHEN count_items >=2 AND rnk = 2 AND favorite_brand = item_brand THEN 'yes'
WHEN count_items >=2 AND rnk = 2 AND favorite_brand <> item_brand THEN 'no'
ELSE NULL END AS 2nd_item_fav_brand
FROM cte)

SELECT * 
FROM cte2
WHERE 2nd_item_fav_brand IS NOT NULL;
