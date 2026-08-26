# 05 · Two handles, one dispose

Predict every line and its order. Then `bgym run 5`.

**Expected:**

```
open a
open b
dispose a
caught boom
finally
end
```

`b` is never disposed. Not late, not at `GC.Collect()` — never.

Two things to be sure about before you move on. First: why `dispose a` appears
*before* `caught boom` rather than after. Second: why forcing a collection did
not clean up `b`, when "the garbage collector will get it eventually" is what
everybody says.

The second one has a precise answer and it is the reason `IDisposable` exists
at all. If your explanation contains the word "eventually", you have not found
it yet.

Review question: what is the smallest change that would have disposed `b`, and
what is the smallest change that would have made the class safe even when
somebody forgets?
