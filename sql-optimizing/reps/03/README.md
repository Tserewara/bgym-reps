# 03 · Judge an over-broad lookup

`answer.sql` was generated to find the one movie titled `The Quiet Harbor`. Read it and predict its row count before running it. Then name the predicate that changes equality into a prefix search and fix the file.

Expected if it were right: 1 row. The shipped query returns 2 because `LIKE 'The Quiet Harbor%'` also includes *The Quiet Harbor II*. The index from rep 2 may or may not help this pattern; the returned rows reveal the defect.
