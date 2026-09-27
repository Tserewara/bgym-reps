# 05 · Two handles, one dispose

Read `Program.cs` first, then run it: `dotnet run --project reps/05`. It prints:

```
open a
open b
dispose a
caught boom
finally
end
```

`b` is never disposed, not even after `GC.Collect()`.
