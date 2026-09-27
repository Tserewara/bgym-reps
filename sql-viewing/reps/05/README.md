# 05 · Soft-delete through a view

Inside one transaction: create a view named `recent_collections` for the active collections created in 2022 or later, a slice of the table by date, and query it. Then give `current_collections` an `INSTEAD OF DELETE` trigger that sets `deleted_at` on the base row. Delete collection 2 through the view, return its base row and the number of rows in `current_collections`, and roll back.

Expected: `recent_collections` returns *Blue Room* and *Bronze Dog*. Collection 2 is still in `collections`, now with a `deleted_at`, and `current_collections` has 3 rows inside the transaction. If collection 2 is gone from `collections`, the delete went through as a real delete instead of an update.
