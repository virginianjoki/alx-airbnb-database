-- INNER JOIN: Only returns bookings that are linked to existing users
SELECT 
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name AS user_name
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;

-- LEFT JOIN: Returns all properties with matching reviews (if any)
SELECT 
    properties.id AS property_id,
    properties.title,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.id = reviews.property_id;

-- FULL OUTER JOIN (PostgreSQL-style; adjust for MySQL if needed)
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.start_date
FROM 
    users
FULL OUTER JOIN 
    bookings ON users.id = bookings.user_id;

-- FULL OUTER JOIN simulation using UNION in MySQL
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.start_date
FROM 
    users
LEFT JOIN 
    bookings ON users.id = bookings.user_id

UNION

SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.start_date
FROM 
    bookings
LEFT JOIN 
    users ON users.id = bookings.user_id;