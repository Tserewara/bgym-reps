# 03 · When the query runs

Read `Program.cs` first, then run it: `dotnet run --project reps/03`. It prints:

```
query defined
  testing 1
  testing 2
  testing 3
  testing 5
first pass: 1,3,5
  testing 1
  testing 2
  testing 3
  testing 5
second pass: 1,3,5
```

Two things in it surprise most readers: `5` is in the result although it was added to the list after the query was written, and the `testing` lines appear twice.
