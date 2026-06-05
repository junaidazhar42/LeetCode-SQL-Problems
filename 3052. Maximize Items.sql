# 3052. Maximize Items (Premium)

WITH cte AS
(SELECT item_type, SUM(square_footage) AS area, COUNT(item_id) AS num, FLOOR(500000/SUM(square_footage)) AS max_comb
FROM Inventory
GROUP BY item_type)

SELECT item_type, CASE WHEN item_type = 'prime_eligible' THEN num*max_comb
ELSE FLOOR((500000 - (SELECT area*max_comb 
FROM cte 
WHERE item_type = 'prime_eligible'))/(SELECT area FROM cte WHERE item_type = 'not_prime')) * num END AS item_count
FROM cte 
ORDER BY item_count;