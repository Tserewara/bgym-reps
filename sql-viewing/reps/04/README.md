# 04 · Compare temporary and inline

For collections created in 2022 or later, return the same two titles twice: once through a temporary view and once through a CTE. Also query `pg_views` to show that only the permanent view remains in the catalog after the temporary object is created.

Expected: each result has 2 rows, *Blue Room* and *Bronze Dog*. The catalog query lists `collection_analysis` but not the temporary view as a permanent public view.
