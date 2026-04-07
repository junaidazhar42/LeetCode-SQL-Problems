# 1821. Find Customers With Positive Revenue This Year

SELECT customer_id
FROM Customers
WHERE year = '2021'
AND revenue > 0