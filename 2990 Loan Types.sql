# 2990 Loan Types

SELECT user_id
FROM Loans
WHERE loan_type = 'Mortgage' AND loan_type = 'Refinance'
GROUP BY user_id
HAVING COUNT(DISTINCT loan_type) = 2
ORDER BY user_id;