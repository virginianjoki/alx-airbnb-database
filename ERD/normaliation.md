Normalization Steps

 First Normal Form (1NF)
Issues Identified:

The location field in Properties appears to be a single text field that might contain composite data (address, city, country, etc.)

Actions Taken:

Split the location into atomic components:

street_address

city

state/province

postal_code

country

 Second Normal Form (2NF)
Issues Identified:

The total_price in Bookings is calculated from pricepernight and date difference

City/country information in Properties might have transitive dependencies

Actions Taken:

Removed total_price from Bookings as it can be calculated

Created separate tables for geographic data:

countries (country_id, country_name)

states (state_id, state_name, country_id)

cities (city_id, city_name, state_id)

Modified Properties to reference city_id instead of storing location data

 Third Normal Form (3NF)
Issues Identified:

Potential transitive dependency in Property: property → city → country

Rating constraints in Reviews could be better handled

Actions Taken:

Fully normalized geographic data as described above

Created a review_ratings lookup table to standardize rating values

Added proper foreign key constraints for all relationships
