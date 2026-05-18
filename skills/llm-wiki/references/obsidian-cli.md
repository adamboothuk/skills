# Obsidian CLI

Use this reference when a markdown wiki is an Obsidian vault and the task benefits from Obsidian-aware behavior rather than file-only reads. Keep plain markdown as the durable source of truth; use Obsidian CLI when vault semantics matter.

## When To Use It

Use Obsidian CLI for:

- vault-aware health checks such as unresolved links, orphan notes, dead-end notes, tag counts, and property counts
- Obsidian search with app/vault context
- wikilink-aware file targeting and link graph inspection
- checking active vault, vault list, file totals, backlinks, outgoing links, tags, properties, tasks, history, and sync state
- cautious Obsidian-aware moves or renames when the user explicitly wants Obsidian to update internal links
- plugin, workspace, or developer diagnostics when working on Obsidian integrations

Do not use it as ceremony. Direct file reads and edits are simpler when the task only needs markdown text and normal filesystem behavior.

## Read-Only First

Start with read-only commands. Treat all mutation commands as opt-in, even if they seem harmless.

Before any mutation:

1. Confirm the vault target explicitly.
2. Explain the intended command and affected file(s).
3. Prefer a disposable-file trial for move/rename/link-update behavior.
4. Check git or backup state where available.
5. Record meaningful changes in the wiki log if the command changes wiki content or structure.

## Explicit Vault Targeting

Prefer explicit vault targeting over active-vault assumptions:

```powershell
obsidian vault="<vault-name>" <command>
```

Use placeholders in reusable prompts and docs:

```text
<vault-name>
<vault-id>
<vault-relative-path>
<Obsidian.com path>
```

If the vault name is unknown, start with a read-only vault discovery command, then ask the user which vault to use if more than one plausible target exists.

## Command Syntax

Use command-first syntax:

```powershell
obsidian search query="design documentation"
obsidian vault="<vault-name>" search query="design documentation"
obsidian vault="<vault-name>" search:context query="technical debt"
```

Do not assume Unix-style flags are available. Prefer the syntax shown by local `obsidian help` or command-specific help.

## Windows Redirector

On Windows, Obsidian may expose a terminal redirector named `Obsidian.com` because the GUI app does not normally connect cleanly to stdin/stdout.

Examples:

```powershell
Obsidian.com version
Obsidian.com vaults
Obsidian.com vault="<vault-name>" unresolved total
```

If `Obsidian.com` is not on PATH for the agent shell, use the direct redirector path as a placeholder:

```powershell
& "<Obsidian.com path>" vault="<vault-name>" unresolved total
```

Do not hard-code a user's Windows username or install path in shared skill docs.

## Codex And Sandbox Lesson

Treat CLI failures as execution-environment issues before assuming Obsidian is missing or broken.

Observed reusable pattern:

- a user's normal PowerShell may find `Obsidian.com` and open the interactive TUI
- a coding agent's default shell may not have `Obsidian.com` on PATH
- sandboxed direct calls may fail to connect to the running Obsidian desktop app
- approved out-of-sandbox direct calls to the Windows redirector may work for read-only commands

When this happens, report it as a session/PATH/sandbox boundary issue. Ask for approval to run the direct redirector path outside the sandbox only when the command is needed for the task.

## Starter Read-Only Commands

Use local help to confirm exact command names and output formats for the installed version.

```powershell
obsidian version
obsidian vaults
obsidian vault
obsidian vault="<vault-name>" files total
obsidian vault="<vault-name>" unresolved total
obsidian vault="<vault-name>" orphans total
obsidian vault="<vault-name>" deadends total
obsidian vault="<vault-name>" tags counts
obsidian vault="<vault-name>" properties counts
obsidian vault="<vault-name>" search:context query="<query>"
```

Useful read-only families:

- `vault`, `vaults`, `version`
- `files total`
- `unresolved total`
- `orphans total`
- `deadends total`
- `tags counts`
- `properties counts`
- `search query="<query>"`
- `search:context query="<query>"`
- `backlinks`, `links`, `outline`, `recents`, `random:read`
- `history`, `history:read`, `sync:history`, `sync:read`

## Mutation Guardrails

Use extra caution with:

- `create`, `append`, `prepend`, `daily:append`
- `move`, `rename`, `delete`
- `property:set`, property mutation commands
- `task` mutation commands
- `template` commands that write files
- plugin enable/disable/reload or command-palette execution
- `history` restore commands
- `sync` restore commands
- publish, workspace, theme, snippet, or developer commands that alter app or vault state

Guidelines:

- Prefer read-only inspection before mutation.
- Never delete, restore, sync-restore, bulk rename, or bulk move without explicit user approval.
- Do not rely on automatic internal-link updates until tested in that vault.
- After Obsidian-aware move/rename operations, run link checks and inspect affected pages.
- For normal content edits, direct markdown file edits may be clearer and easier to review than CLI mutation commands.

## Troubleshooting Checklist

Check these in order:

1. Obsidian desktop app is installed.
2. Obsidian is running when the normal CLI needs a running app.
3. CLI feature is enabled inside Obsidian.
4. Installed Obsidian/installer version supports the CLI; version `1.12.7+` is the useful baseline from the captured lessons.
5. `obsidian` or `Obsidian.com` is on PATH for the current shell, or the direct redirector path is known.
6. The command uses command-first syntax.
7. The target vault is explicit: `vault="<vault-name>"`.
8. The command is being run from the same desktop/session context that can reach Obsidian.
9. If running in Codex, distinguish normal shell PATH failure from sandbox/session connection failure.
10. If sandboxed calls cannot reach Obsidian, request approved out-of-sandbox execution for the minimal read-only command needed.

## Output Use

Use CLI output as vault-aware evidence, not as a replacement for source reading.

- Use unresolved/orphan/dead-end counts to guide maintenance.
- Use search/context to find candidate pages, then read the markdown pages before answering.
- Use tag/property counts to identify structure drift.
- Cite wiki pages in final answers, not just CLI output.
