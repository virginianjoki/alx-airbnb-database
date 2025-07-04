# 🧠 Index Optimization Report

## 🎯 Objective
Improve query performance by identifying frequently queried columns and creating indexes to reduce scan time and optimize database execution plans.

---

## 🔍 Indexes Created

| Table      | Column           | Index Name                  | Reason for Indexing                             |
|------------|------------------|-----------------------------|-------------------------------------------------|
| bookings   | user_id          | idx_bookings_user_id        | Used in WHERE filters and JOINs with users      |
| bookings   | property_id      | idx_bookings_property_id    | Frequently used in JOINs and aggregation        |
| bookings   | start_date       | idx_bookings_start_date     | Used in date range filters and partitioning     |
| reviews    | property_id      | idx_reviews_property_id     | Used in aggregating reviews per property        |
| users      | email            | idx_users_email             | Often used for user lookup or login             |

---

## 🧪 Performance Testing with `EXPLAIN ANALYZE`

### ✅ Example Query

```sql
SELECT COUNT(*) FROM bookings WHERE user_id = 10;
--before index--
EXPLAIN ANALYZE
SELECT COUNT(*) FROM bookings WHERE user_id = 10;
--output--
Seq Scan on bookings  (cost=0.00..1000.00 rows=5000 width=8)
Execution Time: 12.745 ms
--after axecution--
EXPLAIN ANALYZE
SELECT COUNT(*) FROM bookings WHERE user_id = 10;
-- output--
Index Scan using idx_bookings_user_id on bookings  (cost=0.29..8.37 rows=500 width=8)
Execution Time: 1.002 ms

