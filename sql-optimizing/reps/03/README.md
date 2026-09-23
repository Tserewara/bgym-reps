# 03 · Judge an over-broad lookup

`answer.sql` was generated to find the one movie titled `The Quiet Harbor`. Read it and predict how many rows it returns before you run it. Then name the predicate that turned an equality check into a prefix search, and fix the file.

Expected once fixed: 1 row. The shipped query returns 2, because `LIKE 'The Quiet Harbor%'` also matches *The Quiet Harbor II*. Whether rep 2's index helps a `LIKE` depends on the database's collation; the extra row is what gives the bug away.
