#!/usr/bin/env python3
"""Create or update a rep set's starter template from this repository.

The starter is what a learner generates their own copy from: the set's
`starter/` directory (the README with the setup task, and any support code),
the data in `seed/`, and every `reps/NN/` directory (the statement and the
file the answer goes in). Never the environment: `compose.yaml`, Dockerfiles
and the manifests stay here as the author's reference, because bringing the
environment up is part of the set.

    scripts/sync_starter.py sql-querying            # build, show, push
    scripts/sync_starter.py sql-querying --dry-run  # build and show only

The target is `starter_repo` in the set's `bench.toml`. A repository that does
not exist yet is created public and marked as a template. One source: the
template is regenerated from here on every sync, never edited by hand.
"""

import argparse
import shutil
import subprocess
import sys
import tempfile
import tomllib
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
# What goes into the template, relative to the set directory. `starter/` is
# copied to the template's root; the others keep their names.
SHIPPED = ("seed", "reps")


def run(*args: str, cwd: Path | None = None, check: bool = True) -> str:
    result = subprocess.run(
        args, cwd=cwd, check=check, capture_output=True, text=True
    )
    return result.stdout.strip()


def assemble(set_dir: Path, into: Path) -> None:
    starter = set_dir / "starter"
    if not (starter / "README.md").is_file():
        sys.exit(f"{set_dir.name}: starter/README.md is missing")
    shutil.copytree(starter, into, dirs_exist_ok=True)
    for name in SHIPPED:
        source = set_dir / name
        if source.is_dir():
            shutil.copytree(source, into / name, dirs_exist_ok=True)


def starter_repo(set_dir: Path) -> str:
    bench = tomllib.loads((set_dir / "bench.toml").read_text())
    repo = str(bench.get("starter_repo") or "")
    if not repo:
        sys.exit(f"{set_dir.name}: bench.toml has no starter_repo")
    return repo


def repo_exists(repo: str) -> bool:
    return (
        subprocess.run(
            ("gh", "repo", "view", repo), capture_output=True, text=True
        ).returncode
        == 0
    )


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("rep_set", help="the set's directory name, e.g. sql-querying")
    parser.add_argument("--dry-run", action="store_true", help="build and list only")
    args = parser.parse_args()

    set_dir = ROOT / args.rep_set
    repo = starter_repo(set_dir)
    source_commit = run("git", "rev-parse", "--short", "HEAD", cwd=ROOT)

    with tempfile.TemporaryDirectory(prefix="starter-") as temporary:
        work = Path(temporary) / "template"
        if args.dry_run or not repo_exists(repo):
            work.mkdir()
        else:
            run("gh", "repo", "clone", repo, str(work), "--", "--quiet")
            for child in work.iterdir():
                if child.name != ".git":
                    shutil.rmtree(child) if child.is_dir() else child.unlink()
        assemble(set_dir, work)

        files = sorted(
            str(path.relative_to(work))
            for path in work.rglob("*")
            if path.is_file() and ".git" not in path.parts
        )
        print(f"{repo} from {args.rep_set} @ {source_commit}:")
        for name in files:
            print(f"  {name}")
        if args.dry_run:
            return

        if not (work / ".git").is_dir():
            run("git", "init", "--quiet", "--initial-branch=main", cwd=work)
            run(
                "gh", "repo", "create", repo, "--public",
                "--description", f"Starter for the {args.rep_set} rep set on BackendGym",
            )
            run("gh", "api", "-X", "PATCH", f"repos/{repo}", "-F", "is_template=true")
            run("git", "remote", "add", "origin", f"https://github.com/{repo}.git", cwd=work)
        run("git", "add", "--all", cwd=work)
        if not run("git", "status", "--porcelain", cwd=work):
            print("already up to date")
            return
        run(
            "git", "commit", "--quiet", "-m",
            f"Sync from bgym-reps {source_commit} ({args.rep_set})",
            cwd=work,
        )
        run("git", "push", "--quiet", "-u", "origin", "main", cwd=work)
        print(f"pushed: https://github.com/{repo}")


if __name__ == "__main__":
    main()
