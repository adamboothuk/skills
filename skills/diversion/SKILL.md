---
name: diversion
description: Use this skill whenever the user wants to do anything with Diversion version control, including saving their work, checking what's changed, creating or switching branches, merging, viewing history, managing repos, collaborating with others, or undoing changes. Trigger on any mention of "Diversion", "dv", "source control", "version control", "commit", "branch", "merge", "repo", or "working copy" in the context of Diversion. Also trigger if the user says things like "save my work", "undo my changes", "share my code", or "see what I changed", even if they don't use technical terms.
---

# Diversion Version Control Skill

Diversion is a simplified cloud-based version control system. The CLI tool is `dv`. Commands are plain English and designed to be approachable. Always explain what a command does in plain language before running it, so non-technical users understand what's happening.

---

## Safety Rules

- Default to read-only commands first, such as `dv status`, `dv diff`, `dv log`, `dv branch-name`, and `dv branch`.
- Before any write action, explain in plain language what will change and why that command is the safest fit.
- Ask for confirmation before running write actions such as `dv commit`, `dv checkout`, `dv merge`, `dv revert`, `dv reset`, `dv clean`, `dv workspace delete`, and `dv branch -d`.
- Always report the current repo, workspace, and branch before making changes.
- If the user wants to make changes while on `main`, pause and suggest creating or switching to a non-main branch first unless they explicitly want to work on `main`.
- If there are uncommitted changes, warn the user before switching branches, merging, reverting, or resetting.
- Never use destructive options such as `-f`, `--discard-changes`, `dv reset --all`, or `dv clean -f` unless the user explicitly asks for that behavior.
- For undo requests, first determine whether the change is committed or uncommitted before choosing a command.
- Prefer `dv revert <commit_id>` for committed work because it preserves history.
- Suggest shelves when the user may want to come back to their work later.

## Recommended Response Pattern

For Diversion tasks, respond in this order when practical:

1. State what you are about to do in plain English.
2. Explain why the chosen command is safe or appropriate.
3. Run the command.
4. Summarize what happened in beginner-friendly language.
5. Offer the next sensible options.

---

## Account

| What | Command |
|---|---|
| Log in | `dv login` |
| Log in to enterprise | `dv login --enterprise <name>` |
| Log out | `dv logout` |
| Authenticate with token | `dv authenticate <refresh_token>` |

---

## Setting Up a Repository

A repository (repo) is where Diversion stores all your files and their history.

| What | Command |
|---|---|
| Create a new repo in a folder | `dv init <path> <repo_name>` |
| Get a copy of an existing repo | `dv clone <repo_id> <path>` |
| Clone a specific branch | `dv clone <repo_id> <path> --ref <branch_name>` |
| Import from GitHub | `dv import <github_https_url> <repo_name>` |
| Import from GitHub with full history | `dv import <github_https_url> <repo_name> --with-history` |
| Stop syncing a local folder (keep cloud copy) | `dv unregister` |
| List your repos | `dv repo` |
| Delete a repo | `dv repo` (see sub-commands) |
| Open repo in browser | `dv view` |

---

## Saving Work (Committing)

A commit is a snapshot of your files saved to the repo history. Always include a short message describing what changed.

Before committing:
- Check `dv status`.
- Summarize which files are about to be included.
- Encourage a specific commit message.
- If the changes look unrelated, suggest splitting them into separate commits.
- In PowerShell, prefer single quotes around multi-word commit messages, for example `dv commit file.txt -m 'Fix respawn state leak'`, because double-quoted messages may be misparsed as extra file paths in this environment.

| What | Command |
|---|---|
| Save specific files | `dv commit file1.txt file2.txt -m 'what I changed'` |
| Save all changed files | `dv commit -a -m 'what I changed'` |
| See what has changed (not yet saved) | `dv status` |
| See exactly what changed in files | `dv diff` |
| See what changed in a specific file | `dv diff path/to/file.txt` |

> Tip for new users: Think of `dv commit -a -m 'message'` as hitting "Save" with a note about what you did.

---

## Viewing History

| What | Command |
|---|---|
| See recent commits | `dv log` |
| See last N commits | `dv log -n 10` |
| See one line per commit | `dv log --oneline` |
| See commits since a date | `dv log --since "1 week ago"` |
| See commits for a specific file | `dv log path/to/file.txt` |
| See details of a specific commit | `dv show <commit_id>` |
| See which commit changed each line | `dv annotate path/to/file.txt` |

---

## Undoing Changes

| What | Command |
|---|---|
| Undo changes to a file (not yet committed) | `dv reset path/to/file.txt` |
| Undo all uncommitted changes | `dv reset --all` |
| Undo a specific commit (creates new undo commit) | `dv revert <commit_id>` |
| Go back to exactly how things were at a commit | `dv revert-to-commit <commit_id>` |
| Restore a file from an earlier commit/branch | `dv restore path/to/file.txt --source <commit_or_branch>` |
| Remove untracked/ignored files | `dv clean -f` |

Safer undo guidance:
- For committed work, prefer `dv revert <commit_id>`.
- For uncommitted work, inspect with `dv status` and `dv diff` before choosing `dv reset`.
- Treat `dv reset --all`, `dv clean -f`, and `dv checkout <branch_name> --discard-changes` as high-risk actions.
- If the user sounds unsure, suggest using a shelf before destructive cleanup.

Conflict resolution options (used with `revert` and `update`):
- `--conflict_resolution manual` - you resolve conflicts yourself (default)
- `--conflict_resolution keep-current` - keep your current version
- `--conflict_resolution accept-incoming` - accept the incoming version

---

## Branches

A branch is a separate line of work. Use branches to try things out without affecting the main version.

Branch safety:
- Prefer a non-main branch for experiments and AI-assisted changes.
- Before switching branches, check whether the workspace has uncommitted changes.
- If the user asks to "try something" or "test something", suggest creating a fresh branch first.

| What | Command |
|---|---|
| See current branch | `dv branch-name` |
| List all branches | `dv branch` |
| Create a branch | `dv branch -c <branch_name>` |
| Create a branch without switching to it | `dv branch -c <branch_name> --no-checkout` |
| Rename a branch | `dv branch -r <branch_id> <new_name>` |
| Delete a branch | `dv branch -d <branch_id>` |
| Delete a branch without confirmation | `dv branch -d <branch_id> -f` |
| Switch to a branch | `dv checkout <branch_name>` |
| Switch and bring your current changes with you | `dv checkout <branch_name> --take-changes` |
| Switch and shelve (save aside) your changes | `dv checkout <branch_name> --shelve-changes` |
| Switch and discard your changes | `dv checkout <branch_name> --discard-changes` |
| Preview what a merge would look like | `dv merge-preview <other_branch>` |
| Merge another branch into current branch | `dv merge <other_branch>` |
| Copy a single commit to current branch | `dv cherry-pick <commit_id>` |
| Get latest changes from your branch | `dv update` |

---

## Shelves

A shelf temporarily sets aside your uncommitted changes so you can switch context, then come back to them later.

| What | Command |
|---|---|
| List all shelves | `dv shelf` |
| Shelve all current changes | `dv shelf create <name>` |
| Shelve specific files only | `dv shelf create <name> path/to/file.txt` |
| Shelve but keep changes in workspace too | `dv shelf create <name> --no-reset` |
| See what's in a shelf | `dv shelf show <name>` |
| Apply a shelf (and delete it afterwards) | `dv shelf apply <name>` |
| Apply a shelf and keep it | `dv shelf apply <name> --keep` |
| Rename a shelf | `dv shelf rename <name> <new_name>` |
| Delete a shelf | `dv shelf delete <name>` |
| Delete without confirmation | `dv shelf delete <name> -f` |

---

## Collaborating

| What | Command |
|---|---|
| Invite someone to the repo | `dv invite their@email.com --access WRITE` |
| Access levels | `READ`, `WRITE`, `ADMIN`, `OWNER` |
| Share your workspace with someone | `dv share <username>` |
| Share with read/write access | `dv share <username> --rw` |

---

## Workspaces

A workspace is your personal working copy of a branch. Most users have one workspace per branch.

| What | Command |
|---|---|
| List workspaces | `dv workspace` |
| Pause syncing | `dv workspace pause` |
| Resume syncing | `dv workspace resume` |
| Rename current workspace | `dv workspace rename <new_name>` |
| Delete a workspace | `dv workspace delete <workspace_id>` |
| Delete without confirmation | `dv workspace delete <workspace_id> -f` |
| Get or set workspace preferences | `dv preferences` |

> Warning: Deleting a workspace will also delete any uncommitted changes in it.

---

## Tags

A tag marks a specific commit with a name (for example `v1.0`).

| What | Command |
|---|---|
| List/manage tags | `dv tag` |
| List tags as JSON | `dv tag --json` |

---

## Help & Support

| What | Command |
|---|---|
| Get help on any command | `dv help <command>` |
| Send feedback to Diversion | `dv feedback` |
| Create a support bundle | `dv support -m "description of issue"` |

---

## Plain-Language Reminders for Non-Technical Users

When helping a user who is unfamiliar with version control, map their everyday language to commands:

| User says... | They probably want... |
|---|---|
| "Save my work" | `dv commit -a -m '...'` |
| "What did I change?" | `dv status` then `dv diff` |
| "Undo what I did" | `dv reset --all` (if not committed) or `dv revert <id>` |
| "See the history" | `dv log --oneline` |
| "Work on something new without breaking things" | `dv branch` then `dv checkout <new_branch>` |
| "Get the latest version" | `dv update` |
| "Give someone else access" | `dv invite their@email.com --access WRITE` |
