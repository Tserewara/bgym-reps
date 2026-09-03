# 03 · Judge a stale view

`answer.sql` is an assistant-written definition for an artist collection count. Read it and predict Chen Wei's count before running it. Then name the missing condition and fix the view inside the transaction.

Expected if it were right: Chen Wei has 1 active collection. The shipped query reports 2 because it counts the soft-deleted row as well. Its row count is still 3, so inspect the value, not only the shape.
