
This document defines the normalized database tables for a property rental platform.

---

##  User

| Column         | Type           | Constraints                        |
|----------------|----------------|------------------------------------|
| user_id        | VARCHAR        | Primary Key                        |
| first_name     | VARCHAR        | NOT NULL                           |
| last_name      | VARCHAR        | NOT NULL                           |
| email          | VARCHAR        | UNIQUE, NOT NULL                   |
| password_hash  | VARCHAR        | NOT NULL                           |
| phone_number   | VARCHAR        | Nullable                           |
| role           | ENUM           | ('guest', 'host', 'admin'), NOT NULL |
| created_at     | TIMESTAMP      | DEFAULT CURRENT_TIMESTAMP          |

---

##  Property

| Column          | Type      | Constraints                                  |
|------------------|-----------|----------------------------------------------|
| property_id      | VARCHAR   | Primary Key                                  |
| host_id          | VARCHAR   | Foreign Key → User(user_id), NOT NULL        |
| name             | VARCHAR   | NOT NULL                                     |
| description      | TEXT      | NOT NULL                                     |
| location         | VARCHAR   | NOT NULL                                     |
| price_per_night  | DECIMAL   | NOT NULL                                     |
| created_at       | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP                    |
| updated_at       | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE          |

---

##  Booking

| Column        | Type      | Constraints                                  |
|----------------|-----------|----------------------------------------------|
| booking_id     | VARCHAR   | Primary Key                                  |
| property_id    | VARCHAR   | Foreign Key → Property(property_id), NOT NULL|
| user_id        | VARCHAR   | Foreign Key → User(user_id), NOT NULL        |
| start_date     | DATE      | NOT NULL                                     |
| end_date       | DATE      | NOT NULL                                     |
| total_price    | DECIMAL   | NOT NULL                                     |
| status         | ENUM      | ('pending', 'confirmed', 'canceled'), NOT NULL|
| created_at     | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP                    |

---
## Payment

| Column         | Type      | Constraints                               |
|----------------|-----------|-------------------------------------------|
| payment_id     | VARCHAR   | Primary Key                               |
| booking_id     | VARCHAR   | Foreign Key → Booking(booking_id), NOT NULL|
| amount         | DECIMAL   | NOT NULL                                  |
| payment_date   | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP                 |
| payment_method | ENUM      | ('credit_card', 'paypal', 'stripe'), NOT NULL |

---

##  Review

| Column       | Type      | Constraints                                           |
|--------------|-----------|-------------------------------------------------------|
| review_id    | VARCHAR   | Primary Key                                           |
| property_id  | VARCHAR   | Foreign Key → Property(property_id), NOT NULL         |
| user_id      | VARCHAR   | Foreign Key → User(user_id), NOT NULL                 |
| rating       | INTEGER   | NOT NULL, CHECK (rating >= 1 AND rating <= 5)        |
| comment      | TEXT      | NOT NULL                                              |
| created_at   | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP                             |

---

##  Message

| Column        | Type      | Constraints                                  |
|----------------|-----------|----------------------------------------------|
| message_id     | VARCHAR   | Primary Key                                  |
| sender_id      | VARCHAR   | Foreign Key → User(user_id), NOT NULL        |
| recipient_id   | VARCHAR   | Foreign Key → User(user_id), NOT NULL        |
| message_body   | TEXT      | NOT NULL                                     |
| sent_at        | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP                    |