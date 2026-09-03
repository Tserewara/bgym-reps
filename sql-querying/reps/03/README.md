# 03 · Count publisher records

How many publisher records have at least one book? Return the publisher ID and name, one row per publisher record, ordered by ID.

`answer.sql` is an assistant-written query. Read it first and predict both the row count and which two publisher IDs it will collapse together. Run it, then fix the file so it answers the question about records rather than names.

Expected if the query were right: 6 rows, IDs 1 through 6. The shipped query returns 5 because `DISTINCT` is applied to the name and IDs 2 and 3 both say `Harvill Secker`.
