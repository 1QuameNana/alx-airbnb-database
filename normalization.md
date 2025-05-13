# Database Normalization Explanation (Achieving 3NF)

## First Normal Form (1NF)

**Goal**: Ensure all attributes contain only atomic (indivisible) values and each record is unique.

**Application**:
- All columns in every table hold atomic values (e.g., `first_name`, `email`, `price_per_night`).
- No repeating groups or arrays.
- Each table has a primary key (`user_id`, `property_id`, etc.) ensuring unique records.

**Result**: All tables comply with 1NF.

---

## Second Normal Form (2NF)

**Goal**: Eliminate partial dependencies — every non-key attribute must be fully functionally dependent on the entire primary key.

**Application**:
- All primary keys are single-column UUIDs (no composite keys).
- Therefore, no partial dependencies exist.

**Result**: All tables comply with 2NF.

---

## Third Normal Form (3NF)

**Goal**: Eliminate transitive dependencies — non-key attributes must depend only on the primary key and not on other non-key attributes.

### Table-by-Table Breakdown

### User
- All fields (`email`, `role`, `created_at`) depend solely on `user_id`.
- No transitive dependencies.

#Property
- `host_id` is a foreign key to `User`.
- All other attributes depend on `property_id`.

Booking
- References both `property_id` and `user_id`.
- `total_price` is stored directly (not derived from price * days).
- All attributes depend only on `booking_id`.

Payment
- Each record belongs to one `booking_id`.
- `amount`, `payment_method`, etc., depend only on `payment_id`.

Review
- Each review is tied to a `user_id` and `property_id`.
- `rating`, `comment` depend solely on `review_id`.

💬 Message
- `sender_id` and `recipient_id` refer back to `User`.
- `message_body`, `sent_at` depend only on `message_id`.

All transitive dependencies have been removed — 3NF is achieved.

Benefits of 3NF Design

- Avoids redundant data (e.g., user info only stored in one place)
- Prevents update anomalies
- Improves data integrity through foreign key relationships
- Optimizes performance for relational queries


