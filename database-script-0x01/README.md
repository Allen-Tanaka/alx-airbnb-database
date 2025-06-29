# Airbnb Clone Database Schema

## 📍 Overview

This schema defines the relational database for an Airbnb-like platform. It includes users, properties, bookings, payments, reviews, and messaging.

## 📂 Tables

### User
Stores platform users (guests, hosts, and admins).
- Indexed: `email`

### Property
Represents listed properties by hosts.
- FK: `host_id → User(user_id)`

### Booking
Tracks user reservations.
- FK: `property_id → Property`
- FK: `user_id → User`

### Payment
Links to bookings and records transaction details.
- FK: `booking_id → Booking`

### Review
User-generated ratings and comments on properties.
- Constraints: `rating` between 1–5

### Message
Internal messaging between users (guests, hosts, support).
- FK: `sender_id`, `recipient_id → User`

## 📈 Indexes
- Primary keys auto-indexed
- Additional indexes:
  - `User.email`
  - `Property.property_id`
  - `Booking.property_id`, `Booking.user_id`
  - `Payment.booking_id`
  - `Review.property_id`
  - `Message.sender_id`, `Message.recipient_id`

## 📦 File Structure

