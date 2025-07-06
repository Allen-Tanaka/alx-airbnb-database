# Index Performance Report

## ✅ Tables & Indexed Columns

| Table      | Indexed Column     | Reason                                   |
|------------|--------------------|------------------------------------------|
| bookings   | user_id            | Frequently joined with users             |
| bookings   | property_id        | Used in aggregations and filtering       |
| bookings   | start_date         | Date-based partitioning & range queries  |
| reviews    | property_id        | Joined with properties                   |
| users      | email              | For search and login scenarios           |

---

## 🔍 Query Tested

```sql
SELECT users.name, COUNT(bookings.id) AS total
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id;
