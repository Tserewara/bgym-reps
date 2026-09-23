# 01 · Expose current collections

Create a view named `current_collections` with the collection ID, title and artist name of every collection that hasn't been soft-deleted. Query it, ordered by ID.

Expected: 4 rows, IDs 1, 2, 3 and 5. ID 4, *Hidden Study*, is missing. A view stores the query, not the rows, so if the base table changes, the next query through the view sees the change.
