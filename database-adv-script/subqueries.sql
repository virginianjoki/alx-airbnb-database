-- Non-correlated subquery: Properties with average rating > 4.0
SELECT 
    id, title
FROM 
    properties
WHERE 
    id IN (
        SELECT 
            property_id
        FROM 
            reviews
        GROUP BY 
            property_id
        HAVING 
            AVG(rating) > 4.0
    )
ORDER BY 
    id;

-- Correlated subquery: Users with more than 3 bookings
SELECT 
    id, name
FROM 
    users u
WHERE 
    (
        SELECT 
            COUNT(*) 
        FROM 
            bookings b 
        WHERE 
            b.user_id = u.id
    ) > 3
ORDER BY 
    id;
