# 06 · Judge least privilege

`mfa_reader` should see the four active title and artist pairs through `collection_analysis`, and has no reason to read `collections`. An assistant wrote `answer.sql`. Predict how many rows the role can see, run it, then revoke the table access it shouldn't have and count through `collection_analysis` instead, which the role can already read.

Expected once fixed: 4 rows. The shipped file grants the role the base table and counts 5 rows, soft-deleted *Hidden Study* included. The mistake is the object named in the `GRANT`.
