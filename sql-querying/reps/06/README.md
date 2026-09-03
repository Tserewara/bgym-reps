# 06 · Keep the orphan author

Show every author and the number of distinct books they authored. Include authors with no matching row in the join table, and order by book count descending then name.

`answer.sql` is a plausible assistant query. Predict its row count and Rowan Byrne's count before running it. Then name the join side that lost Rowan and fix the file.

Expected if it were right: 7 rows. Rowan Byrne is present with 0; Georgi Gospodinov has 3 books, and Yoko Tawada has 2. The shipped file returns 6 rows because its inner join removes the author with no book.
