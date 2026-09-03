# 09 · Preserve both sides

Return every publisher record beside its books, including the publisher with no books and the book with no publisher if one exists. Show publisher name and book title, with unmatched values as `NULL`.

`answer.sql` is assistant-written. Read it and predict how many rows it returns and what relationship its join is actually using. Run it, then replace the implicit join with the relationship in the schema.

Expected if it were right: 10 rows, including `Midnight Press` with a `NULL` book. The shipped query returns 7 rows because `NATURAL JOIN` matches the unrelated `id` columns instead of `publishers.id = books.publisher_id`.
