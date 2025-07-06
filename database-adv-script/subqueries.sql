-- Task 1.1: Non-Correlated Subquery

SELECT 
    id,
    title,
    location
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- Task 1.2: Correlated Subquery

SELECT 
    id,
    name,
    email
FROM users
WHERE (
    SELECT COUNT(*)
    FROM bookings
    WHERE bookings.user_id = users.id
) > 3;
