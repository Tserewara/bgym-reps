# 06 · Busy years

Which years saw albums from more than one artist? Give the year, how many
artists released that year, and the album titles.

**Expected: 4 rows.**

| year | artists |
|---|---|
| 1957 | 3 |
| 1959 | 2 |
| 1960 | 3 |
| 1965 | 2 |

Two things to get right. First, *more than one **artist***, not more than one
album — an artist releasing twice in a year does not make the year busy.
Second, the album with no release year must not become its own group; check
what your query does with `NULL` before you assume it is excluded.

Getting the titles into the same row means an aggregate you may not have met.
Find it; the shape you want reads like "collect these into one value".
