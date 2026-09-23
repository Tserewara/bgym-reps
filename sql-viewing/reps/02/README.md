# 02 · Aggregate through a view

Build a view on top of `current_collections` that returns each artist and their number of active collections. Query it, highest count first, then by artist name. The join stays inside the views, so this query doesn't repeat it.

Expected: 3 rows, Maya Lin with 2, then Amina Diallo and Chen Wei with 1 each. If Chen Wei shows 2, your view reads `collections` directly and counts the soft-deleted row.
