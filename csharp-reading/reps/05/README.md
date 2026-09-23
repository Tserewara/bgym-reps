# 05 · Two handles, one dispose

Predict every line and its order. Then `bgym run 5`.

Expected:

```
open a
open b
dispose a
caught boom
finally
end
```

`b` is never disposed, not even after `GC.Collect()`.

Before you move on, be sure of two things. First, why `dispose a` comes before `caught boom` and not after it. Second, why forcing a collection didn't clean up `b`, when everybody says the garbage collector will get to it eventually.

The second one has a precise answer, and it's the reason `IDisposable` exists. If your explanation uses the word "eventually", keep looking.

Review question: what's the smallest change that would have disposed `b`? And what's the smallest change that would make the class safe even when somebody forgets?
