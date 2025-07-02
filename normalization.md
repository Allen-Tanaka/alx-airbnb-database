# Normalization Process for Airbnb Clone Database

## Introduction

Normalization is a design process used in relational databases to reduce redundancy and ensure data integrity. This project normalizes the Airbnb clone database up to the Third Normal Form (3NF), resulting in a clean, efficient, and scalable schema. The main entities considered include: `User`, `Property`, `Booking`, `Payment`, and `Review`.

---

## Step-by-Step Normalization

### 1. User Entity

#### Unnormalized:
- UserID, FullName, Email, PhoneNumber, Location (Street, City, Country)

#### 1NF:
- Atomic columns:
  - UserID, FullName, Email, PhoneNumber, Street, City, Country

#### 2NF:
- No partial dependencies (UserID is primary key)

#### 3NF:
- Move location info to a new table:
  - `Location(LocationID, Street, City, Country)`
  - `User(UserID, FullName, Email, PhoneNumber, LocationID)`

---

### 2. Property Entity

#### Unnormalized:
- PropertyID, HostName, Title, Description, PricePerNight, Address, City, Country

#### 1NF:
- Atomic structure:
  - PropertyID, HostID (linked to User), Title, Description, PricePerNight, Address, City, Country

#### 2NF:
- No partial dependency (PropertyID is the primary key)

#### 3NF:
- Move address info to a separate table:
  - `PropertyLocation(LocationID, Address, City, Country)`
  - `Property(PropertyID, HostID, Title, Description, PricePerNight, LocationID)`

---

### 3. Booking Entity

#### Unnormalized:
- BookingID, UserFullName, PropertyTitle, CheckIn, CheckOut, PaymentAmount

#### 1NF:
- Replace full names/titles with foreign keys:
  - BookingID, UserID, PropertyID, CheckIn, CheckOut, PaymentID

#### 2NF:
- Composite key not needed; BookingID is unique

#### 3NF:
- Move payment info to a new table:
  - `Payment(PaymentID, Amount, PaymentMethod, PaymentStatus)`
  - `Booking(BookingID, UserID, PropertyID, CheckIn, CheckOut, PaymentID)`

---

### 4. Review Entity

#### Unnormalized:
- ReviewID, UserName, PropertyTitle, Rating, Comment, DatePosted

#### 1NF:
- Use IDs:
  - ReviewID, UserID, PropertyID, Rating, Comment, DatePosted

#### 2NF:
- No partial dependencies

#### 3NF:
- No transitive dependencies

---

## Final Normalized Schema Summary (3NF)

| Table             | Description                                |
|------------------|--------------------------------------------|
| User             | Stores user credentials and contact info   |
| Location         | Stores city/location details               |
| Property         | Listings created by users (hosts)          |
| PropertyLocation | Address info for each property             |
| Booking          | User bookings for properties               |
| Payment          | Payment details linked to bookings         |
| Review           | Feedback by users on properties            |

---

## Conclusion

The normalization process ensured that:
- Each table has a clear and single purpose.
- Redundant data is eliminated through relationships.
- Updates and deletions are safe and efficient.
- The schema is scalable for production use.

This normalized design forms the foundation for efficient data retrieval, integrity, and maintainability in the Airbnb clone application.

