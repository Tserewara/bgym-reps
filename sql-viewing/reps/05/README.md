# 05 · Soft-delete through a view

Create a partitioning view named `recent_collections` for active collections created in 2022 or later. Add an `INSTEAD OF DELETE` trigger to `current_collections` that sets `deleted_at` on the base row. Delete collection 2 through the view, then return its base row and the current-view count; roll back.

Expected: collection 2 remains in `collections` with a non-null `deleted_at`, and `current_collections` has 3 rows inside the transaction. The delete must become an update, not a physical removal.
