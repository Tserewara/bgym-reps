# 03 · Judge a stale view

An assistant wrote the view in `answer.sql`, which counts collections per artist. Read it and predict Chen Wei's count before running it. Then name the missing condition and fix the view inside the transaction.

Expected once fixed: Chen Wei has 1 active collection. The shipped view says 2, because it counts the soft-deleted row. It still returns 3 rows, so the shape of the result looks fine; the error is in one value.
