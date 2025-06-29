📌 Entities Identified
Here are the entities you must model in your ERD:

User

Property

Booking

Payment

Review

Message

🔗 Relationships Between Entities
Relationship	Cardinality	Notes
User ↔ Booking	One-to-Many	A user can make many bookings.
Property ↔ Booking	One-to-Many	A property can have many bookings.
Booking ↔ Payment	One-to-One	Each booking can have one payment.
User ↔ Review	One-to-Many	A user can write many reviews.
Property ↔ Review	One-to-Many	A property can have many reviews.
User ↔ Property	One-to-Many	A user (host) can own many properties.
User ↔ Message (sender and recipient)	Many-to-Many (via Message table)	Messages are between users.

