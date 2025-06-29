# Airbnb Clone - Sample Data Seeder

## 📝 Overview

This file seeds the Airbnb database with realistic sample data for development and testing.

## 🧩 Entities Populated

### 👤 Users
- 3 users: 1 guest, 2 hosts
- UUIDs used for realistic IDs

### 🏠 Properties
- Each host owns 1 property (Cape Town, Johannesburg)

### 📅 Bookings
- Guest has made 2 bookings (1 confirmed, 1 pending)

### 💳 Payments
- One confirmed payment linked to a booking

### ⭐ Reviews
- Guest reviewed both properties after staying

### ✉️ Messages
- Guest and host exchanged messages

## ⚙️ Usage

After running `schema.sql`, execute this script:
```bash
psql -U your_user -d your_db -f seed.sql
