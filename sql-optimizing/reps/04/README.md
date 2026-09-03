# 04 · Shape advanced indexes

Create a partial covering index for movies with rating at least 4.0, ordered by `genre` then `release_year`, with `title` available from the index. Explain one selective query that repeats the partial predicate and one that omits it.

Expected: for `genre = 'Drama'` and `release_year = 1981`, the matching query can use an `Index Only Scan` and report few heap fetches; the query without `rating >= 4.0` cannot rely on that partial index. The order matters when a query filters a genre and ranges over years.
