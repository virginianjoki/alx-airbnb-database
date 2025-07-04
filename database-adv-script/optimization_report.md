 Query Optimization Report
 Objective
Optimize a complex query that joins bookings, users, properties, and payments tables by analyzing and reducing inefficiencies.

---

 Initial Query

```sql
SELECT 
    b.id, u.name, p.title, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;
