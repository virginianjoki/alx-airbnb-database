 User
user_id (PK, UUID, Indexed)

first_name (VARCHAR, NOT NULL)

last_name (VARCHAR, NOT NULL)

email (VARCHAR, UNIQUE, NOT NULL)

password_hash (VARCHAR, NOT NULL)

phone_number (VARCHAR, NULL)

role (ENUM: guest, host, admin, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

 Property
property_id (PK, UUID, Indexed)

host_id (FK → User.user_id)

name (VARCHAR, NOT NULL)

description (TEXT, NOT NULL)

location (VARCHAR, NOT NULL)

pricepernight (DECIMAL, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

 Booking
booking_id (PK, UUID, Indexed)

property_id (FK → Property.property_id)

user_id (FK → User.user_id)

start_date (DATE, NOT NULL)

end_date (DATE, NOT NULL)

total_price (DECIMAL, NOT NULL)

status (ENUM: pending, confirmed, canceled, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

 Payment
payment_id (PK, UUID, Indexed)

booking_id (FK → Booking.booking_id)

amount (DECIMAL, NOT NULL)

payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)

 Review
review_id (PK, UUID, Indexed)

property_id (FK → Property.property_id)

user_id (FK → User.user_id)

rating (INTEGER, 1-5, NOT NULL)

comment (TEXT, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

 Message
message_id (PK, UUID, Indexed)

sender_id (FK → User.user_id)

recipient_id (FK → User.user_id)

message_body (TEXT, NOT NULL)

sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

Relationships
User to Property: One-to-Many (One user (host) can have many properties)

User to Booking: One-to-Many (One user can have many bookings)

Property to Booking: One-to-Many (One property can have many bookings)

Booking to Payment: One-to-Many (One booking can have multiple payments)

User to Review: One-to-Many (One user can write many reviews)

Property to Review: One-to-Many (One property can have many reviews)

User to Message: One-to-Many (One user can send/receive many messages)