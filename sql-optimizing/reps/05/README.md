# 05 · Measure index write cost

Create two temporary tables with the same single integer column, and index only one of them. Insert the same 10,000 generated rows into each under `EXPLAIN (ANALYZE)`. Keep all of it in `answer.sql`: temporary tables disappear when the session ends.

Expected: each plan shows 10,000 rows coming out of `generate_series`, and the insert into the indexed table takes longer. That extra time is what every write pays so that reads can be faster later. Timings move from run to run; run it twice if the gap is small.
