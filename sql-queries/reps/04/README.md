# 04 · The longest track on each album

Only four albums have tracks. For each of them, give the album title and the
title of its **longest** track, with that track's duration in seconds.

**Expected: 4 rows.**

| album | longest track | seconds |
|---|---|---|
| Kind of Blue | All Blues | 693 |
| A Love Supreme | Pursuance | 642 |
| Head Hunters | Chameleon | 941 |
| Waltz for Debby | My Romance | 446 |

The trap here is not the maximum — it is getting the *title that goes with it*.
`MAX(duration_seconds)` gives you a number; grouping by album and also
selecting `tracks.title` will not give you the title of that row. Postgres will
tell you so, in an error worth reading carefully.

There are three shapes that work. Write one; name the other two in a comment.
