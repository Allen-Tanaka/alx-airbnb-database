-- Task 4: Original Complex Query (before optimization)

SELECT 
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date,
    users.name AS user_name,
    users.email,
    properties.title AS property_title,
    properties.location,
    payments.amount,
    payments.status
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.id = payments.booking_id
ORDER BY bookings.start_date DESC;
