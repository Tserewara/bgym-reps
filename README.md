# bgym-reps

The runnable content behind BackendGym's rep sets, one directory per set. The bench keeps the catalogue and your progress; everything that executes lives here (`backendgym/docs/DECISIONS.md` §34).

```sh
bgym start sql-querying
```

You never write in this repository. `bgym` clones it into a cache and copies the answer files into a working directory of your own.

| Rep set | Stack | Reps |
|---|---|---|
| `sql-querying` | postgresql | 9 |
| `sql-designing-and-writing` | postgresql | 9 |
| `sql-viewing` | postgresql | 6 |
| `sql-optimizing` | postgresql | 8 |
| `sql-scaling-and-security` | postgresql | 6 |
| `csharp-reading` | csharp | 7 |
