# 02 · Make the lookup selective

Create an index on `movies.title`, run `ANALYZE`, and repeat the exact-title plan from rep 1. Return the movie as well as the plan.

Expected: one movie row and normally an `Index Scan` using the title index. The index plan should be visibly faster than the sequential scan on this table; compare the two actual times rather than trusting the index name.
