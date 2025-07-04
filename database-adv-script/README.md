## Task 0: Write Complex Queries with Joins

### INNER JOIN: Bookings and Users
```sql
SELECT bookings.id, bookings.start_date, users.name
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;
