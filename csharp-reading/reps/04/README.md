# 04 · The deadlock that isn't there

`FetchAsync().Result` blocks on an async call, and every article about async in .NET says this deadlocks.

Read `Program.cs` first, then run it: `dotnet run --project reps/04`. It prints:

```
before
after: done
```

No deadlock, and no hang either.
