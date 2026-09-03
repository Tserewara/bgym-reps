# 02 · Aggregate through a view

Build an aggregated view on `current_collections` that returns each artist and their active collection count. Query it in descending count order. Keep the aggregation behind the view so the next query does not repeat the join.

Expected: 3 rows. Maya Lin has 2, Chen Wei has 1, and Amina Diallo has 1. The result must come from the view created in rep 1, not from the deleted row in the base table.
