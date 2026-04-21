# 3415. Find Products with Three Consecutive Digits

SELECT *
FROM products
WHERE REGEXP_LIKE(name, '[0-9]{3}')
AND NOT REGEXP_LIKE(name, '[0-9]{4, }')
ORDER BY product_id;