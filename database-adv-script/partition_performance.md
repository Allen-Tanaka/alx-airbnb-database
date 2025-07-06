# Partitioning Performance Report

## 🗂️ Context
The `bookings` table had millions of rows, making date-range queries slow.

---

## 🧱 Partitioning Strategy
- Table: `bookings_partitioned`
- Column: `start_date`
- Method: RANGE partitioning by year (2023, 2024, 2025)

---

## 🔬 Query Tested

```sql
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
