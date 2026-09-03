# 07 · Compare title sets

Print three result sets, each with a single `title` column: translated books intersected with books released in 2021 or later; the union of those two sets; and translated books released before 2021.

Use `INTERSECT`, `UNION` and `EXCEPT` as set operations. Do not make the three queries a join.

Expected: the three result sets contain 4, 6 and 1 rows respectively. The last result is *At Night All Blood Is Black*. Set operations compare compatible result columns and remove duplicate rows by default.
