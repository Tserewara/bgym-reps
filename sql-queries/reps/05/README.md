# 05 · Running time

Total running time per album, in minutes and seconds, for the albums that have
tracks. Order by total, longest first.

**Expected: 4 rows.**

| album | total |
|---|---|
| Kind of Blue | 45:30 |
| Head Hunters | 41:49 |
| Waltz for Debby | 37:48 |
| A Love Supreme | 25:25 |

Now look at *A Love Supreme*. It has four tracks and the record runs about
33 minutes. Your total says 25:25 and it is not a bug — one track has no
duration recorded, and `SUM` skipped it without comment.

So: is 25:25 the right answer to *"how long is this album"*? Write, in a
comment, what you would return instead and why — and what the difference is
between "we know it is 25 minutes" and "we do not know how long it is".
