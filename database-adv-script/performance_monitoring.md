Database Performance Monitoring Report

 Objective

Continuously monitor and refine the database by analyzing query execution plans using `EXPLAIN ANALYZE`. Based on findings, propose and implement optimizations such as indexing and schema restructuring.

---

 Queries Monitored

 Retrieve Bookings by User Email

```sql
EXPLAIN ANALYZE
SELECT b.*
FROM bookings b
JOIN users u ON b.user_id = u.id
WHERE u.email = 'jane@example.com';
