# 05 · Delete through foreign keys

Remove Bruno's swipes and then Bruno's card in one transaction. Return the number of cards and swipes left before rolling the transaction back.

Expected: 4 cards and 3 swipes remain inside the transaction. Deleting the card first should fail because the foreign key uses `ON DELETE RESTRICT`; deleting the dependent rows first is the decision you are testing.
