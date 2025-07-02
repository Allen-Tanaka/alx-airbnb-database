# Normalization Process for Airbnb Clone Database

## Introduction

Normalization is the process of organizing data to minimize redundancy and dependency. This document describes how the Airbnb Clone database schema was normalized up to the Third Normal Form (3NF), ensuring efficiency, integrity, and scalability. The database includes entities such as `User`, `Property`, `Booking`, `Payment`, `Review`, and `Message`.

---

## 1. User Table

### Unnormalized (UNF):
- Contains multivalued attributes like full name and role-related duplication.

### 1NF:
- All values are atomic.
- Separated full name into `first_name` and `last_name`.

### 2NF:
- All non-key attributes are fully functionally dependent on the primary key `user_id`.

### 3NF:
- All fields (email, password, phone number, etc.) are dependent only on the primary key.
- No transitive dependencies.
- ✅ Already in 3NF.

---

## 2. Property Table

### Unnormalized:
- Location stored as a full string, potentially leading to repetition.

### 1NF:
- Atomic fields: `name`, `description`, `pricepernight`, `location`, etc.

### 2NF:
- All non-key fields are dependent on `property_id`.

### 3NF:
- To fully comply, location could be split into a separate `Location` table if more detailed queries (e.g., filtering by country, city) are anticipated.

**Optional Improvement (not required but scalable):**
```sql
CREATE TABLE Location (
    location_id UUID PRIMARY KEY,
    address_line VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100)
);
