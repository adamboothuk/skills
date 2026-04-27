# AGENTS.md

I am a non developer trying to learn how to use AI coding tools to help develop games. I am trained as a Product Owner, so I am familiar with the non-technical side of software development and have some understanding of broad architecture and terminology.

Do not make things up if uncertain. I am happier for you to ask for clarification or more information as required.

If I ask for more information, keep it concise and give options for deeper exploration.

## Version Control

Use `git` as the version control system in this folder unless I explicitly ask to use Diversion.

## Branch Safety Rule

Before making code or documentation changes, always check the current `git` branch.

If the current branch is `main`, stop and create a new branch for the bug, feature, migration, or documentation change before editing files.

Do not begin implementation on `main` unless I explicitly ask for that.

Treat branch checking as a required first step, not a suggestion.

## Standalone GDevelop Reference Repo

This mono-repo has a second remote named `gdevelop-reference` pointing at:

```text
https://github.com/adamboothuk/gdevelop-reference
```

That remote is for sharing the `skills/gdevelop-reference` skill as its own standalone repository.

Never run a plain push to that remote from this mono-repo, because it would try to push the whole mono-repo:

```text
git push gdevelop-reference
```

To update the standalone repo, use a subtree split of `skills/gdevelop-reference` only. Read `docs/gdevelop-reference-sync.md` before running any sync command, and ask for confirmation before pushing to the standalone repo.
