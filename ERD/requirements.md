Entities and Relationships

Core Entities
User

Attributes: user_id (PK), first_name, last_name, email, password_hash, phone_number, role, created_at

Relationships:

One-to-many with Property (as host)

One-to-many with Booking (as guest)

One-to-many with Review

Many-to-many with Message (sender/recipient relationships)

Property

Attributes: property_id (PK), host_id (FK), name, description, location, pricepernight, created_at, updated_at

Relationships:

Many-to-one with User (host)

One-to-many with Booking

One-to-many with Review

Booking

Attributes: booking_id (PK), property_id (FK), user_id (FK), start_date, end_date, total_price, status, created_at

Relationships:

Many-to-one with Property

Many-to-one with User (guest)

One-to-one with Payment

Payment

Attributes: payment_id (PK), booking_id (FK), amount, payment_date, payment_method

Relationships:

Many-to-one with Booking

Review

Attributes: review_id (PK), property_id (FK), user_id (FK), rating, comment, created_at

Relationships:

Many-to-one with Property

Many-to-one with User

Message

Attributes: message_id (PK), sender_id (FK), recipient_id (FK), message_body, sent_at

Relationships:

Many-to-one with User (as sender)

Many-to-one with User (as recipient)