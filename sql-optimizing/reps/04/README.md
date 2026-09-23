# 04 · Shape advanced indexes

Create one index that is partial, covering the movies rated 4.0 or higher; keyed on `genre` then `release_year`; and carrying `title`, so a query can read it from the index alone. Run `VACUUM (ANALYZE) movies` after creating it. Then explain two queries for `genre = 'Drama'` and `release_year = 1981`: one that repeats `rating >= 4.0`, and one that leaves it out.

Expected: the query with `rating >= 4.0` gets an `Index Only Scan` on your index with `Heap Fetches: 0`. The query without it can't use the partial index and scans the table. If you skipped the vacuum you'll probably see a `Bitmap Heap Scan` instead, because an index-only scan relies on the visibility map that vacuum writes. Key order matters too: this index serves a query that fixes the genre and ranges over years.
