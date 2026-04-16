# 1495. Friendly Movies Streamed Last Month

SELECT DISTINCT c.title AS title
FROM TVProgram t
LEFT JOIN Content c
on t.content_id = c.content_id
WHERE DATE_FORMAT(program_date, "%Y-%m") = '2020-06'
AND c.Kids_content = 'Y'
AND c.content_type = 'Movies'