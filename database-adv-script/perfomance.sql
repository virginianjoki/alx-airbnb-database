-- ❌ Initial Query: Complex and inefficient
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
    payments pay ON b.id = pay.booking_id;

-- 🔍 EXPLAIN plan for initial query
EXPLAIN
SELECT 
    b.id, u.name, p.title, pay.amount
FROM 
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;

-- ✅ Refactored Query: Optimized
-- Assumes relevant indexes are already in place
-- Avoids SELECT * and selects only needed fields
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
    payments pay ON b.id = pay.booking_id;
