Partitioning Performance Report

 Objective
Optimize query performance on the `bookings` table by partitioning it based on `start_date`.

---

Partitioning Strategy

 Used RANGE partitioning on `start_date`.
 Created separate partitions for each year (2023, 2024, 2025).
 Data copied from original `bookings` table into partitioned structure.

---

 Performance Test

 Test Query

```sql
SELECT * FROM bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
