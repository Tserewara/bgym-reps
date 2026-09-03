# 01 · Expose current collections

Create a view named `current_collections` with the collection ID, title and artist name for records that have not been soft-deleted. Query the view ordered by ID.

Expected: 4 rows. IDs 1, 2, 3 and 5 appear; ID 4, *Hidden Study*, does not. Querying the view again after a base-table change should use the current data.
