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

## Task 2: Aggregations and Window Functions

### 1. Total Bookings Per User
```sql
SELECT users.id, users.name, COUNT(bookings.id) AS total_bookings
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id, users.name
ORDER BY total_bookings DESC;
