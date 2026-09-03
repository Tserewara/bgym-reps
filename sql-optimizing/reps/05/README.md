# 05 · Measure index write cost

Create two temporary tables with the same integer payload, put an index on only one, and insert the same 10,000 generated rows into each under `EXPLAIN (ANALYZE)`. Keep the test in one statement.

Expected: both inserts add 10,000 rows, while the indexed insert takes longer than the plain insert. The difference is the maintenance cost paid by writes for a faster future read.
