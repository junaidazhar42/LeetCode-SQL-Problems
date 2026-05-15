# 2238. Number of Times Driver Was a Passenger (Premium)

WITH cte AS
(SELECT passenger_id, COUNT(*) AS num_of_times
FROM Rides
GROUP BY passenger_id)


SELECT DISTINCT r.driver_id, CASE WHEN c.num_of_times IS NOT NULL THEN c.num_of_times
FROM Rides r
LEFT JOIN cte c
ON r.driver_id = c.passenger_id