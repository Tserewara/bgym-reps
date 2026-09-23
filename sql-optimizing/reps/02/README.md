# 02 · Make the lookup selective

Create an index on `movies.title`, run `ANALYZE`, and repeat the exact-title plan from rep 1. Also run the query itself, so you see the movie as well as the plan.

Expected: one movie, and usually an `Index Scan` using your title index. Compare the two execution times, rep 1's and this one. The index name in the plan tells you what the planner picked; the times tell you whether it helped.
