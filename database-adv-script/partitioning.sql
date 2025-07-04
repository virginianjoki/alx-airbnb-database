-- STEP 1: Rename existing bookings table
ALTER TABLE bookings RENAME TO bookings_old;

-- STEP 2: Create partitioned bookings table (range partitioning)
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(50)
) PARTITION BY RANGE (start_date);

-- STEP 3: Create partitions (yearly partitions as example)
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- STEP 4: Copy data from old table
INSERT INTO bookings (id, user_id, property_id, start_date, end_date, status)
SELECT id, user_id, property_id, start_date, end_date, status
FROM bookings_old;

-- STEP 5: (Optional) Drop old table if needed
-- DROP TABLE bookings_old;

-- STEP 6: Test query with EXPLAIN ANALYZE on partitioned table
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
