# 01 · Where the copy happened

`Program.cs` is already written. Read it and predict all three lines before you run anything. Write the prediction down; the rep is the gap between what you wrote and what comes out.

Then `bgym run 1`.

Expected:

```
a: 0
b: 0, 1
c: 1
```

If you predicted `a: 1`, you read `Bump()` as changing the counter in the list. It changed a copy, and that copy was thrown away right after. The compiler accepted it without a warning.

Spend some time on line `c`: same struct, same method, different answer. Work out what an array does differently before you look it up, then look it up and check.

Last question, and the one that matters most: `counters[0].Bump()` compiled silently. What would you need to know to catch it in somebody else's pull request?
