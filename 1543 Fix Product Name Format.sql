# 1543 Fix Product Name Format
 

SELECT LOWER(TRIM(BOTH ' ' FROM product_name)) AS product_name, DATE_FORMAT(sale_date, '%Y-%m') AS sale_date, COUNT(sale_id) AS total
FROM Sales
GROUP BY LOWER(TRIM(BOTH ' ' FROM product_name)), DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY product_name, sale_date