# bgym-reps

The content behind BackendGym's rep sets, one directory per set. The bench keeps the catalogue and your progress; the statements, the data and the starters live here (`backendgym/docs/DECISIONS.md` §34).

You never work in this repository. Each set has a starter, a template you generate your own copy from on GitHub: that copy is where you set up the environment and write your answers. The set's page on the bench links to it.

| Rep set | Stack | Reps | Starter |
|---|---|---|---|
| `sql-querying` | postgresql | 9 | [`reps-sql-querying`](https://github.com/Tserewara/reps-sql-querying) |
| `sql-designing-and-writing` | postgresql | 9 | not yet |
| `sql-viewing` | postgresql | 6 | not yet |
| `sql-optimizing` | postgresql | 8 | not yet |
| `sql-scaling-and-security` | postgresql | 6 | not yet |
| `csharp-reading` | csharp | 7 | not yet |

## For authors

A set directory holds:

- `README.md`, the set's introduction on the bench, and `reps/NN/README.md`, one statement per rep with its expected result;
- `reps/NN/` also holds the file the answer goes in (an empty `answer.sql`, or the assistant's code in a judge rep);
- `seed/`, the data the set runs on;
- `starter/README.md`, the learner's first task (bring the environment up, and how to check it) and how a rep is done;
- `reps.toml`, the set's slug and, per rep, `closing_questions` asked on the bench after the rep;
- `bench.toml`, the catalogue fields and `starter_repo`;
- `compose.yaml` and friends: the author's reference environment, used to check the expected results. It never ships in the starter, because bringing the environment up is part of the set.

`scripts/sync_starter.py <set>` builds the template from `starter/`, `seed/` and `reps/` and pushes it to `starter_repo`, creating it as a public template the first time. The template is regenerated on every sync; never edit it by hand. The bench publishes a set from this repository with `backendgym/scripts/publish_content.py`.
