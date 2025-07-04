--  Initial Query: Includes WHERE and AND for filtering
SELECT 
    b.id AS booking_id,
    u.id AS user_id,
    u.name AS user_name,
    p.id AS property_id,
    p.title AS property_title,
    pay.id AS payment_id,
    pay.amount
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pay ON b.id = pay.booking_id
WHERE 
    p.location = 'Nairobi' AND u.email IS NOT NULL;

--  EXPLAIN plan for the above query
EXPLAIN
SELECT 
    b.id, u.name, p.title, pay.amount
FROM 
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE 
    p.location = 'Nairobi' AND u.email IS NOT NULL;

--  Refactored Query: Optimized and uses LEFT JOIN and indexing assumptions
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.title AS property_title,
    pay.amount
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
LEFT JOIN 
    payments pay ON b.id = pay.booking_id
WHERE 
    p.location = 'Nairobi' AND u.email IS NOT NULL;
