-- Task 4: Initial Complex Query (Unoptimized)
-- Retrieve all bookings with user, property, and payment details
-- Includes WHERE and AND clauses for proper filtering

SELECT 
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name,
    users.email,
    properties.id AS property_id,
    properties.title,
    properties.location,
    payments.amount,
    payments.status
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.id = payments.booking_id
WHERE bookings.start_date >= '2024-01-01'
  AND payments.status = 'completed'
ORDER BY bookings.start_date DESC;


-- Analyze the performance of the above query
EXPLAIN ANALYZE
SELECT 
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name,
    users.email,
    properties.id AS property_id,
    properties.title,
    properties.location,
    payments.amount,
    payments.status
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.id = payments.booking_id
WHERE bookings.start_date >= '2024-01-01'
  AND payments.status = 'completed'
ORDER BY bookings.start_date DESC;
