# 05 · Find translated books

Return the titles and years of books translated by an author whose country is Japan. Find the matching book IDs through a subquery, and order by year then title.

Expected: 2 rows. *Tomb of Sand* (2022) comes before *Love in the Big City* (2021) when ordered by year descending. The subquery returns a set of IDs, not one value.
