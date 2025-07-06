# Performance Monitoring Report

## 🧪 Tools Used
- `EXPLAIN ANALYZE` (PostgreSQL)
- `SHOW PROFILE` (MySQL)
- Manual benchmarking with execution time

---

## 📌 Queries Tested

### 1. Count User Bookings (JOIN + GROUP BY)

```sql
SELECT u.name, COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id;
