## Task 0: Write Complex Queries with Joins

### INNER JOIN: Bookings and Users
```sql
SELECT bookings.id, bookings.start_date, users.name
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

## Task 1: Practice Subqueries

### 1. Properties with Average Rating > 4.0 (Non-Correlated Subquery)
```sql
SELECT id, title
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
)
ORDER BY id;
