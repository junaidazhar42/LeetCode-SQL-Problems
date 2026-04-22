# 183. Customers Who Never Order

SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o 
ON c.id = o.customerid
WHERE o.customerId IS NULL


# Alternate Solution
SELECT c.name AS Customers
FROM Customers c
WHERE c.id NOT IN 
(SELECT c.id
FROM Customers c
INNER JOIN Orders o
ON c.id = o.customerId)