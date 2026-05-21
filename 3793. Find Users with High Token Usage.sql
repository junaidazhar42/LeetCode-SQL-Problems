# 3793. Find Users with High Token Usage 

WITH cte AS
(SELECT user_id, COUNT(prompt) AS prompt_count, MAX(tokens) AS max_token, ROUND(AVG(tokens), 2) AS avg_tokens
FROM prompts
GROUP BY user_id
HAVING COUNT(prompt) >= 3)

SELECT user_id, prompt_count, avg_tokens
FROM cte
WHERE max_token > avg_tokens
ORDER BY avg_tokens DESC, user_id;