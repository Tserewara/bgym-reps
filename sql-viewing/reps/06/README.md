# 06 · Judge least privilege

`mfa_reader` should read four active title and artist pairs through `collection_analysis` and have no reason to read `collections`. `answer.sql` is assistant-written. Predict its visible row count, run it, then revoke the accidental table access and leave the role with the view-only permission.

Expected if it were right: 4 rows. The shipped file grants the role the base table and returns 5 rows, including the soft-deleted *Hidden Study*. The defect is the object named in the `GRANT`.
