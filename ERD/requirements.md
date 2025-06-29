# Airbnb Database Specification – ERD

## 📘 Overview

This document describes the entity-relationship design for an Airbnb-like system. The database supports users, property listings, bookings, payments, reviews, and messaging functionality.

---

## 🗃️ Entities and Attributes

### 1. User
- `user_id` (PK, UUID, Indexed)
- `first_name`, `last_name` (NOT NULL)
- `email` (UNIQUE, NOT NULL, Indexed)
- `password_hash` (NOT NULL)
- `phone_number` (NULL)
- `role` (ENUM: guest, host, admin)
- `created_at` (TIMESTAMP, default current)

### 2. Property
- `property_id` (PK, UUID, Indexed)
- `host_id` (FK → User)
- `name`, `description`, `location`, `pricepernight` (NOT NULL)
- `created_at`, `updated_at`

### 3. Booking
- `booking_id` (PK, UUID, Indexed)
- `property_id` (FK → Property)
- `user_id` (FK → User)
- `start_date`, `end_date`, `total_price` (NOT NULL)
- `status` (ENUM: pending, confirmed, canceled)
- `created_at`

### 4. Payment
- `payment_id` (PK, UUID, Indexed)
- `booking_id` (FK → Booking)
- `amount` (DECIMAL, NOT NULL)
- `payment_date` (DEFAULT CURRENT_TIMESTAMP)
- `payment_method` (ENUM: credit_card, paypal, stripe)

### 5. Review
- `review_id` (PK, UUID, Indexed)
- `property_id` (FK → Property)
- `user_id` (FK → User)
- `rating` (1–5, NOT NULL)
- `comment`, `created_at`

### 6. Message
- `message_id` (PK, UUID, Indexed)
- `sender_id` (FK → User)
- `recipient_id` (FK → User)
- `message_body` (NOT NULL)
- `sent_at`

---

## 🔗 Relationships

| From       | To         | Type         | Description                            |
|------------|------------|--------------|----------------------------------------|
| User       | Property   | 1 → N        | A user (host) can list many properties |
| User       | Booking    | 1 → N        | A user (guest) can make bookings       |
| Property   | Booking    | 1 → N        | One property can be booked many times  |
| Booking    | Payment    | 1 → 1        | One booking has one payment            |
| Property   | Review     | 1 → N        | A property can have many reviews       |
| User       | Review     | 1 → N        | A user can write many reviews          |
| User       | Message    | 1 → N        | A user can send/receive messages       |

---

## 🧩 Indexes and Constraints

### Indexes
- `user_id`, `email` in `User`
- `property_id` in `Property`, `Booking`
- `booking_id` in `Payment`
- Primary keys are indexed automatically

### Constraints
- `email` is UNIQUE in `User`
- Foreign keys:
  - `host_id` in `Property` → `User.user_id`
  - `user_id` in `Booking`, `Review` → `User.user_id`
  - `property_id` in `Booking`, `Review` → `Property.property_id`
  - `booking_id` in `Payment` → `Booking.booking_id`
  - `sender_id`, `recipient_id` in `Message` → `User.user_id`
- `Review.rating` CHECK constraint: must be between 1 and 5

---

## 📍 File Structure

```bash
ERD/
├── airbnb_erd.png         # Final visual ER diagram
└── requirements.md        # This file (schema summary)
