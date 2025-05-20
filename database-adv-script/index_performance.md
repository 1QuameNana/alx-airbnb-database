-- ===============================
-- Step 1: Analyze Before Indexing
-- ===============================

-- Analyze query performance before adding indexes
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 123;

EXPLAIN ANALYZE
SELECT * FROM properties WHERE location = 'New York';

EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'user@example.com';

-- ======================
-- Step 2: Create Indexes
-- ======================

-- Users Table Indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_name ON users(name);

-- Bookings Table Indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Properties Table Indexes
CREATE INDEX idx_properties_title ON properties(title);
CREATE INDEX idx_properties_location ON properties(location);

-- ===============================================
-- Step 3: Analyze After Indexing (Performance Test)
-- ===============================================

EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 123;

EXPLAIN ANALYZE
SELECT * FROM properties WHERE location = 'New York';

EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'user@example.com';







Users Table
id – used in JOINs with bookings

email – likely used in login/auth queries

name – used in ORDER BY or filters

Bookings Table
user_id – JOIN with users

property_id – JOIN with properties

booking_date – used in filters or sorting

Properties Table
id – JOIN with bookings and reviews

title – used in ORDER BY or search

location – commonly filtered






