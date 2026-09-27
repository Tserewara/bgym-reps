# 03 · Count publisher records

How many publisher records have at least one book? Return the publisher ID and name, one row per record, ordered by ID.

An assistant wrote the query in `answer.sql`. Read it first, then run it and compare with the expected result below. Fix it so it counts records instead of names.

Expected once fixed: 6 rows, IDs 1 to 6. The shipped query returns 5, because its `DISTINCT` works on the name, and IDs 2 and 3 are both `Harvill Secker`.
