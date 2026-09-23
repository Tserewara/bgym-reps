# 01 · Filter the longlist

Return the title, release year and translator ID of every book whose title starts with `The` and that came out between 2019 and 2022, inclusive. Newest first, then by title, at most five rows.

One query in `answer.sql`. Leave a missing translator missing; don't fill it in.

Expected: 5 rows, newest first. The first is *The Seven Moons of Maali Almeida* (2022, `NULL`), the last *The Enlightenment of the Greengage Tree* (2019, `NULL`).
