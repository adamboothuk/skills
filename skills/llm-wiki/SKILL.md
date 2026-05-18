---
name: llm-wiki
description: Build, populate, query, synthesize, audit, and maintain LLM-managed markdown or Obsidian-style knowledge bases. Use when Codex needs to create a traceable wiki from raw source material, ingest articles, notes, clippings, URL queue lists, YouTube URLs or transcripts into source/topic/entity/question pages, import PDF books chapter by chapter, validate extracted text, answer questions from a markdown wiki, use Obsidian CLI for vault-aware checks, preserve citations back to source pages, maintain index.md and log.md, or lint/evolve a wiki for stale pages, duplicate concepts, weak links, missing traceability, and knowledge gaps.
---

# LLM Wiki

Use this skill to work on a markdown knowledge base where raw sources are preserved and wiki pages are the maintained knowledge layer. Favor small, reliable edits with clear traceability over broad rewrites.

## Core Rules

- Do not invent facts. If a source does not support a claim, label it as an inference, question, or hypothesis.
- Treat `raw/` as immutable after capture. Move or copy raw files only when the local workflow explicitly uses inbox/processed folders.
- Keep source claims traceable from topic/entity/question pages back to `wiki/sources/` pages.
- Separate confirmed source claims from synthesis and inference.
- Update `index.md` or `index-full.md` according to the wiki convention, and append to `log.md` after meaningful changes.
- Read the existing wiki's `index.md` first before querying or editing, then open only the relevant pages.
- Write for a non-developer unless the wiki's existing style clearly says otherwise.

## Workflow Router

Open only the reference files needed for the task:

| Task | Read |
|---|---|
| Create a new wiki, repair structure, or add templates | `references/wiki-structure.md` |
| Ingest articles, notes, clippings, transcripts, or extracted chapter text | `references/source-ingestion.md` |
| Import URLs from a `raw/inbox/` queue file with `New URLs` and `Ingested URLs` sections | `references/url-list-import.md` |
| Ingest a single YouTube URL or YouTube transcript | `references/youtube-transcript-ingestion.md` |
| Import a PDF/book over time, create trackers, map chapters, extract batches, or validate extracted text | `references/pdf-book-import.md` |
| Query the wiki, answer questions, compare sources, or synthesize across pages | `references/synthesis-querying.md` |
| Audit wiki health, find stale pages, duplicate concepts, weak links, missing traceability, or gaps | `references/linting-evolution.md` |
| Use Obsidian CLI for vault-aware checks, graph health, tags/properties, or Obsidian-aware operations | `references/obsidian-cli.md` |

## Example References

Load examples only when format or staging is unclear:

- `references/example-web-clipper-ingest.md` shows a Web Clipper clipping moving from `raw/inbox/` to `raw/ingested/`, then into source/topic/entity/index/log updates.
- `references/example-book-import.md` shows a PDF book tracker and staged chapter import flow using source, topic, entity, index, and log updates.

## Useful Scripts

Run these from the wiki root when useful:

- `scripts/validate-wiki-links.ps1 -WikiRoot <path>` checks local markdown links for missing files.
- `scripts/validate-book-tracker.ps1 -TrackerPath <path>` checks that a book tracker has the required workflow sections.
- `scripts/validate-extracted-text.ps1 -Path <raw/assets/file.txt>` checks extraction-quality headers before ingestion.
- `scripts/validate-url-import-list.ps1 -Path <raw/inbox/URLs for import.txt>` checks the URL queue sections and URL lines.
- `scripts/validate-youtube-transcript-intake.ps1 -Path <raw/inbox/file.md>` checks the YouTube transcript intake header.

Scripts are guardrails, not substitutes for judgment. If a script reports uncertainty, inspect the relevant files before editing.
