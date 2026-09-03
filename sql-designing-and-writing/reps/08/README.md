# 08 · Audit a status change

Retire card 4 without deleting its row, then return the card's old and new status from `card_status_events` and the count of rows still present. Roll back after inspecting both results.

Expected: one audit row, `blocked` to `retired`, and 5 cards still present. The trigger records `OLD` and `NEW`; a physical delete would leave no status transition to audit.
