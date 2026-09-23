# 05 · Find translated books

Translators are rows in `authors`. Return the title and year of every book translated by someone whose country is Japan. Get the matching book IDs from a subquery. Order by year, newest first, then by title.

Expected: 2 rows, *Tomb of Sand* (2022) and then *Love in the Big City* (2021). Two translators match, so the subquery returns two IDs, and `=` will fail where `IN` won't.
