# 2205. Number of Users Eligible for Discount

SELECT COUNT(DISTINCT user_id) AS user_cnt
FROM Purchases
WHERE time_stamp BETWEEN startDate AND endDate
AND amount >= minAmount
