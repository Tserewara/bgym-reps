# 09 · Soft-delete one card

The support request names card 4. An assistant wrote the soft-delete in `answer.sql`. Read it and predict how many cards it marks and how many stay active. Run it, then narrow the condition to the named card, keeping the row for the audit trail.

Expected once fixed: 1 card marked deleted and 4 still active. The shipped file marks all 5 and leaves 0 active, because it updates every row whose `deleted` flag is false.
