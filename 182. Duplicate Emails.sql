# 182. Duplicate Emails
SELECT email as Email
FROM Person
GROUP BY email
HAVING COUNT(DISTINCT id) > 1;