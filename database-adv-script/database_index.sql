Indexing for Optimization

EXPLAIN ANALYZE
SELECT users.name, COUNT(bookings.id) AS total_bookings
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id;


-- On foreign key columns used in JOINs
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- On columns used in WHERE or filtering
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_users_email ON users(email);


EXPLAIN ANALYZE
SELECT users.name, COUNT(bookings.id) AS total_bookings
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id;

