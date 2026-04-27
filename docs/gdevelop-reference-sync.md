# GDevelop Reference Standalone Sync

The `gdevelop-reference` remote points to the standalone sharing repository:

```text
https://github.com/adamboothuk/gdevelop-reference
```

The standalone repo should contain only the contents of:

```text
skills/gdevelop-reference
```

## Safety Rule

Do not run a plain push to the `gdevelop-reference` remote from this mono-repo.

Wrong:

```powershell
git push gdevelop-reference
```

That tries to push the whole mono-repo. Use a subtree split instead.

## Check First

```powershell
git branch --show-current
git status --short
git remote -v
```

Only continue if the working tree is clean and the `gdevelop-reference` remote points to `https://github.com/adamboothuk/gdevelop-reference`.

## Create Or Refresh The Split Branch

Delete any old local split branch if it exists, then recreate it from the current mono-repo branch:

```powershell
git branch -D gdevelop-reference-split
git subtree split --prefix=skills/gdevelop-reference -b gdevelop-reference-split
```

## Push The Split

Ask the user for confirmation before pushing.

The intended push target is:

```powershell
git push gdevelop-reference gdevelop-reference-split:main
```

If Git rejects the push because the standalone repo has unrelated or rewritten history, stop and explain the situation. Do not force-push unless the user explicitly approves `--force-with-lease`.

## After Pushing

Return to the mono-repo branch you started from:

```powershell
git checkout <your-mono-repo-branch>
```

Then verify:

```powershell
git status --short
```
