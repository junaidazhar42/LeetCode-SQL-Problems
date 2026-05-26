# 2793. Status of a Flight Ticket (Premium)

WITH cte AS
(SELECT p.*, f.capacity, ROW_NUMBER() OVER(PARTITION BY p.flight_id ORDER BY p.booking_time) AS book_rnk
FROM Passengers AS p
LEFT JOIN Flights AS f
USING (flight_id))

SELECT passenger_id, CASE WHEN book_rnk <= capacity THEN 'Confirmed' ELSE 'Waitlist' END AS Status
FROM cte
ORDER BY passenger_id;
