# 07 · Compare title sets

Print three result sets, each a single `title` column:

1. translated books that were also released in 2021 or later;
2. books that are translated, released in 2021 or later, or both;
3. translated books released before 2021.

Use `INTERSECT`, `UNION` and `EXCEPT`, not joins.

Expected: 4, 6 and 1 rows. The single row in the last set is *At Night All Blood Is Black*. Set operations need compatible columns on both sides, and they drop duplicate rows unless you say `ALL`.
