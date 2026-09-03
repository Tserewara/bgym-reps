# 03 · Include cards with no swipes

For every card, return its ID and total fare, including cards that have never been used. `answer.sql` is an assistant-written query. Predict its row count and which card disappears before running it. Then fix the file.

Expected if it were right: 5 rows. Card 5 has total fare `0` and card 4 has total fare `0`; the shipped query returns only 3 rows because its inner join starts from swipes.
