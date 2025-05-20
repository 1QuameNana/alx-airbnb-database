Step 1: Monitor Query Performance
PostgreSQL Example: Use EXPLAIN ANALYZE
Run this on your frequently used query:

sql
Copy
Edit
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 123;
This shows actual execution time, row counts, and scan types.

MySQL Example: Use SHOW PROFILE
sql
Copy
Edit
SET profiling = 1;

SELECT * FROM bookings WHERE user_id = 123;

SHOW PROFILE FOR QUERY 1;
This gives detailed timing breakdowns per query stage.

Step 2: Identify Bottlenecks
Look for:

Sequential scans on large tables — indicates missing indexes.

High row counts scanned relative to rows returned.

Nested loops on large datasets — might be slow without indexes.

High CPU or I/O wait times.

Step 3: Suggest Changes
Common improvements:

Add indexes on frequently filtered/joined columns.

Partition large tables by date or relevant keys.

Denormalize some data if joins are very expensive.

Rewrite queries to fetch only necessary columns.

Use materialized views or caching for complex aggregates.

Step 4: Implement Changes
Example SQL commands to add indexes:

sql
Copy
Edit
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_properties_location ON properties(location);
Or for partitions, see previous partitioning.sql.

Step 5: Re-measure Performance
Run EXPLAIN ANALYZE or SHOW PROFILE again on the optimized queries.

| Query                                        | Before Optimization                 | After Optimization                     | Notes                      |
| -------------------------------------------- | ----------------------------------- | -------------------------------------- | -------------------------- |
| `SELECT * FROM bookings WHERE user_id = 123` | Seq Scan, 10 sec, 100k rows scanned | Index Scan, 0.05 sec, 100 rows scanned | Added index on `user_id`   |
| Complex join on bookings + users             | Nested loop join, high I/O          | Hash join with indexes                 | Added indexes on join keys |
