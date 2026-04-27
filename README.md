# Skills Mono-Repo

This repository is the public home for Adam Booth's Codex skills.

## Layout

```text
skills/
  diversion/
  gdevelop-reference/
  scrum/
```

Each folder under `skills/` is an individual Codex skill with its own `SKILL.md` file. The `scrum` skill keeps the main trigger and routing guidance in `SKILL.md`, with detailed Scrum workflows in `references/`.

## Current Skills

- `diversion` - guidance for working safely with Diversion version control.
- `gdevelop-reference` - GDevelop JSON, events, objects, instances, and reference lookup guidance.
- `scrum` - Scrum best-practice coaching and facilitation workflows.

## Installing Locally

Copy or sync the individual skill folders you want into your Codex skills directory. Keep each skill folder intact so relative paths such as `references/...` continue to work.

Example target layout:

```text
%USERPROFILE%\.codex\skills\diversion\SKILL.md
%USERPROFILE%\.codex\skills\gdevelop-reference\SKILL.md
%USERPROFILE%\.codex\skills\scrum\SKILL.md
```

## Migration Notes

This mono-repo starts fresh from the current file contents of the previous individual repositories. Historical Git commits from the older repos were intentionally not imported.
