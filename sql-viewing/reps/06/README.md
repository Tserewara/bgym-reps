# 06 · Judge least privilege

`mfa_reader` should see the four active title and artist pairs, and nothing else. An assistant wrote `answer.sql` to count what the role sees. Read it first, then run it and compare with the expected result below. Fix it so the role reads only what it should: the fix grants nothing new.

Expected once fixed: 4 rows. The shipped file counts 5.
