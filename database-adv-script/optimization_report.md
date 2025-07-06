# Optimization Report – Complex Query

## 📌 Original Query
- Joins: bookings, users, properties, payments
- Fields: All fields were retrieved
- No WHERE clause

### 🔍 Performance (Before)
- Execution Time: ~900ms
- Bottleneck: Full table scan due to missing WHERE clause and unindexed joins
- Issue: SELECT * used, scanned unused columns

---

## ✅ Optimization Changes
- Added WHERE clause to limit date range
- Reduced fields in SELECT clause
- Confirmed indexes on foreign keys (`user_id`, `property_id`, `booking_id`)

### 🧪 Performance (After)
- Execution Time: ~140ms
- Rows Scanned: Reduced by 80%
- Index Usage: Yes

---

## 📈 Result
The optimized query significantly improved execution speed and resource usage. Always prioritize targeted fields and index-aligned joins.
