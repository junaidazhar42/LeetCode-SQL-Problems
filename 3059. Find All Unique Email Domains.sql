# 3059. Find All Unique Email Domains (Premium)

SELECT SUBSTRING_INDEX(email, '@', -1) AS email_domain, COUNT(DISTINCT) AS count
FROM Emails
WHERE email REGEXP "^[a-z0-9]+@[a-z0-9]+(\.com)$"
GROUP BY SUBSTRING_INDEX(email, '@', -1)
ORDER BY email_domain;