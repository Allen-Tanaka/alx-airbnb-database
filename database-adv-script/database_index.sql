-- Task 3: Create Indexes to Improve Query Performance

-- Index on user_id in bookings table (for joins & filters)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on property_id in bookings table (for property analysis)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on start_date in bookings table (for date-range queries)
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Index on property_id in reviews table (for joins with properties)
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Index on email in users table (for login/search use cases)
CREATE INDEX idx_users_email ON users(email);
