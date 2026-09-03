# 01 · Filter the longlist

Return the title, release year and translator ID for books whose title begins with `The` and whose release year is from 2019 through 2022. Order newest first, then title, and show at most five rows.

Use one query in `answer.sql`. Do not replace the missing translator with a made-up value.

Expected: 5 rows, ordered by year descending. The first is *The Seven Moons of Maali Almeida* (2022, `NULL`); the last is *The Enlightenment of the Greengage Tree* (2019, `NULL`).
