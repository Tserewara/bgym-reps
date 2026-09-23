# 06 · Keep the orphan author

Show every author with the number of distinct books they wrote, including authors with no rows in the join table. Order by book count, highest first, then by name.

`answer.sql` is a query an assistant might well write. Before running it, predict how many rows it returns and what count it gives Rowan Byrne. Then say which side of the join lost Rowan, and fix it.

Expected once fixed: 7 rows. Rowan Byrne is there with 0, Georgi Gospodinov has 3 books and Yoko Tawada has 2. The shipped file returns 6 rows, because its inner join drops the author who has no book.
