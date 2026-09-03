# 09 · Soft-delete one card

The support request names card 4. `answer.sql` is an assistant-written soft-delete update. Read it and predict how many cards it marks and how many remain active. Run it, then narrow the predicate to the named card and keep the row for audit.

Expected if it were right: 1 card marked deleted and 4 active cards remain. The shipped file marks 5 cards because it updates every row whose `deleted` flag is false.
