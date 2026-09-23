# 09 · Preserve both sides

Return every publisher record next to its books, keeping a publisher with no books and a book with no publisher if there is one. Show the publisher name and the book title, with `NULL` where there's no match.

An assistant wrote `answer.sql`. Read it and predict how many rows it returns and which columns its join is really matching on. Run it, then replace the implicit join with the relationship the schema defines.

Expected once fixed: 10 rows, one of them `Midnight Press` with a `NULL` book. The shipped query returns 7, because `NATURAL JOIN` matches the two unrelated `id` columns instead of `publishers.id = books.publisher_id`.
