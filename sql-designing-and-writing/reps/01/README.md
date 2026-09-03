# 01 · Shape a staging table

Create a temporary CSV staging table for a CharlieCard import with a card code, station name, fare and tap time. Give fare a numeric type with a nonnegative check and make the other required fields non-null. Then add a `source` column with a default of `csv` and load two rows directly in the statement.

Keep the staging table temporary. Return the two loaded rows with the new source value.

Expected: 2 rows, both with `source = 'csv'`; the fare values are numeric and the tap times are timestamptz values. The table disappears when the connection ends.
