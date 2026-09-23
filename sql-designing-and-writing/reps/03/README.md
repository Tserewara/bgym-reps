# 03 · Include cards with no swipes

For every card, return its ID and total fare, including cards that were never used. An assistant wrote `answer.sql`. Before running it, predict its row count and which cards go missing. Then fix the file.

Expected once fixed: 5 rows, with cards 4 and 5 at a total fare of `0`. The shipped query returns 3 rows, because its inner join throws away every card with no swipe before the `COALESCE` can do anything.
