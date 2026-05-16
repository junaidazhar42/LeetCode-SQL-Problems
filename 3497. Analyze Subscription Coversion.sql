# 3497. Analyze Subscription Coversion

SELECT user_id, ROUND(AVG(CASE WHEN activity_type = 'free_trial' THEN activity_duration ELSE NULL END), 2) AS trial_avg_duration, ROUND(AVG(CASE WHEN activity_type = 'paid' THEN activity_duration ELSE NULL END), 2) AS paid_avg_duration 
FROM UserActivity
GROUP BY user_id
HAVING AVG(CASE WHEN activity_type = 'paid' THEN activity_duration ELSE NULL END) IS NOT NULL 
ORDER BY user_id;