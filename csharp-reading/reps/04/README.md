# 04 · The deadlock that is not there

`FetchAsync().Result` — blocking on an async call. Every article about async in
.NET says this deadlocks.

Predict what happens. Then `bgym run 4`.

**Expected:**

```
before
after: done
```

It does not deadlock. It does not even hang. Your prediction was probably wrong
in the safe direction, which is worse than being wrong in the dangerous one:
you now believe a rule that is only true sometimes.

Work out **why this one is fine**. The answer is not "because `.Result` is
safe" — it is about what is not present in a console application that would be
present somewhere else.

Then find out where it *would* deadlock. There is a specific kind of
application where this exact code hangs forever, and if you maintain anything
written before 2019 you are likely to meet it. Name it, and name the one thing
in the code above that is quietly preventing the problem even there.
