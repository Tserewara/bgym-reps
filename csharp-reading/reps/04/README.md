# 04 · The deadlock that isn't there

`FetchAsync().Result` blocks on an async call. Every article about async in .NET says this deadlocks.

Predict what happens. Then `bgym run 4`.

Expected:

```
before
after: done
```

No deadlock, and no hang either. If you predicted one, you were wrong in the safe direction, and that's the worse way to be wrong: you now hold a rule that's only true some of the time.

Work out why this one is fine. It has to do with something a console application doesn't have and other applications do.

Then find where it would deadlock. There's a kind of application where this code would hang forever if it weren't for one detail it already contains. If you maintain anything written before 2019, you'll probably meet that kind of application. Name it, and name the detail.
