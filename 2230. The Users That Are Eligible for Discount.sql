# 2230. The Users That Are Eligible for Discount


SELECT DISTINCT user_id
FROM Purchases
WHERE time_stamp BETWEEN startDate AND endDate
AND amount >= minAmount
ORDER BY user_id