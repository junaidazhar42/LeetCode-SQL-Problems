# 3172. Second Day Verification

SELECT user_id
FROM emails e
INNER JOIN texts t
USING (email_id)
WHERE t.signup_action = 'Verified'
AND DATEDIFF(action_date, signup_date) = 1
ORDER BY user_id;