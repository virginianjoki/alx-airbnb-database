Normalization Steps
1. First Normal Form (1NF)
Requirements:

Each table cell should contain a single value

Each record needs to be unique

Actions Taken:

Ensured all tables have primary keys

Verified no repeating groups or arrays in any columns

Split any multi-valued attributes into separate tables

Example:
If a property had multiple amenities stored in a comma-separated string, this was normalized by creating:

A properties table

An amenities table

A junction table property_amenities with foreign keys to both

2. Second Normal Form (2NF)
Requirements:

Be in 1NF

All non-key attributes must depend on the entire primary key

Actions Taken:

For tables with composite primary keys, verified all attributes depend on the entire key

Moved attributes that depend on only part of the composite key to separate tables

Example:
In a booking table with composite key (guest_id, property_id, check_in_date):

Booking details like total_price depend on the entire key

Guest details like name were moved to a guests table since they depend only on guest_id

3. Third Normal Form (3NF)
Requirements:

Be in 2NF

No transitive dependencies (non-key attributes shouldn't depend on other non-key attributes)

Actions Taken:

Identified and removed transitive dependencies

Created new tables for attributes that were dependent on other non-key attributes

Example:
In the original properties table:

property had city and city had country (property → city → country)

Created separate tables for cities and countries

Properties table now references city_id instead of storing city/country directly

Final Schema Structure
The normalized schema now includes these main tables:

users - User information

properties - Property listings

locations - Geographic hierarchy

amenities - Available amenities

property_amenities - Junction table (many-to-many)

bookings - Reservation records

reviews - Guest reviews

payments - Payment transactions

Benefits of 3NF
Reduced data redundancy: Each piece of information is stored in only one place

Improved data integrity: Updates only need to be made in one location

Simpler queries: More focused tables make queries more straightforward

Better scalability: The schema can accommodate growth more easily

Potential Trade-offs
While 3NF provides excellent data integrity, some complex queries may require more joins. For read-heavy operations, we might consider controlled denormalization in the future while maintaining the normalized structure as the source of truth.

This normalized structure provides a solid foundation for the Airbnb database that is flexible, maintainable, and scalable.