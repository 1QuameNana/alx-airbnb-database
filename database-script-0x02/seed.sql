-- USERS
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
  ('USR001', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest', CURRENT_TIMESTAMP),
  ('USR002', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pw_2', '2345678901', 'host', CURRENT_TIMESTAMP),
  ('USR003', 'Carol', 'Williams', 'carol@example.com', 'hashed_pw_3', NULL, 'admin', CURRENT_TIMESTAMP)
-- PROPERTIES
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES 
  ('PROP001', 'USR002', 'Seaside Cottage', 'Cozy beachfront cottage with 2 bedrooms.', 'Malibu, CA', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('PROP002', 'USR002', 'Mountain Cabin', 'Quiet cabin in the mountains with a hot tub.', 'Aspen, CO', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- BOOKINGS
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES 
  ('BOOK001', 'PROP001', 'USR001', '2025-06-01', '2025-06-05', 600.00, 'confirmed', CURRENT_TIMESTAMP),
  ('BOOK002', 'PROP002', 'USR001', '2025-07-10', '2025-07-15', 1000.00, 'pending', CURRENT_TIMESTAMP);

-- PAYMENTS
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES 
  ('PAY001', 'BOOK001', 600.00, CURRENT_TIMESTAMP, 'credit_card');


-- REVIEWS
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES 
  ('REV001', 'PROP001', 'USR001', 5, 'Amazing place, great host!', CURRENT_TIMESTAMP);


-- MESSAGES
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES 
  ('MSG001', 'USR001', 'USR002', 'Hi Bob, is the cottage available in July?', CURRENT_TIMESTAMP),
  ('MSG002', 'USR002', 'USR001', 'Yes, it is! Feel free to book.', CURRENT_TIMESTAMP);
