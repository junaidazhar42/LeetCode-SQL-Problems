# 3570. Find Books with No Available Copies

WITH cte AS
(SELECT book_id, COUNT(*) AS current_borrowers
FROM borrowing_records
WHERE return_date IS NULL
GROUP BY book_id)

SELECT b.book_id, b.title, b.author, b.genre, b.publication_year, c.current_borrowers
FROM library_books b
LEFT JOIN cte c
ON b.book_id = c.book_id
WHERE b.total_copies = c.current_borrowers
ORDER BY c.current_borrowers DESC, b.title;