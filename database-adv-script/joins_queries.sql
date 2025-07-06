-- INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name,
    users.email
FROM bookings
INNER JOIN users ON bookings.user_id = users.id
ORDER BY bookings.start_date DESC;


-- LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    properties.id AS property_id,
    properties.title,
    properties.location,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id
ORDER BY properties.title ASC;


-- FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
-- NOTE: If using MySQL, use UNION version below

-- PostgreSQL / SQL Server version:
SELECT 
    users.id AS user_id,
    users.name,
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.property_id
FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id
ORDER BY users.name ASC, bookings.start_date DESC;


-- MySQL version using UNION to simulate FULL OUTER JOIN
SELECT 
    users.id AS user_id,
    users.name,
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.property_id
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id

UNION

SELECT 
    users.id AS user_id,
    users.name,
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.property_id
FROM users
RIGHT JOIN bookings ON users.id = bookings.user_id
ORDER BY user_id ASC, start_date DESC;

