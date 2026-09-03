# 07 · Clean station names

Find station names with trailing whitespace, normalise them in a transaction, and return the before and after values. Use a pattern to find the bad row and a string function for the correction. Roll back at the end.

Expected: 1 changed row: `Harvard ` becomes `Harvard`. A search for the exact clean spelling before the update should not find it.
