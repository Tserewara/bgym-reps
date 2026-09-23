# 04 · Compare temporary and inline

For the active collections created in 2022 or later, return the titles twice: once through a temporary view and once through a CTE. Then query `pg_views` to see where each view lives.

Expected: both results have 2 rows, *Blue Room* and *Bronze Dog*. In `pg_views`, `collection_analysis` is under the `public` schema (along with any views you kept from earlier reps), while the temporary view is under a `pg_temp_N` schema and disappears when the session ends.
