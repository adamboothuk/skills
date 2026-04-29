# URL List Import

Use this reference when a wiki keeps a quick-capture URL list in `raw/inbox/`, usually named something like `URLs for import.txt`.

## Core Rules

- Treat the URL list as an inbox queue, not as the source content itself.
- Ingest only URLs under `New URLs`.
- Preserve the original URL in the source page metadata.
- Do not move a URL line to `Ingested URLs` until the source page exists and index/log updates are complete.
- If a URL cannot be fetched, is paywalled, redirects unexpectedly, or needs a transcript/PDF/book workflow, leave it under `New URLs` and add a blocker note if the local format supports notes.
- If a URL is YouTube, switch to `references/youtube-transcript-ingestion.md`.
- Prefer small batches. A URL list can grow quickly; avoid turning one queue sweep into a huge speculative rewrite.

## Expected Queue Shape

The simplest supported format is:

```text
URLs for import.txt

New URLs

https://example.com/source-one
https://example.com/source-two

Ingested URLs

https://example.com/already-done
```

After ingestion, move each completed URL line under `Ingested URLs` with a compact audit suffix:

```text
Ingested URLs

2026-04-28 12:45 - https://example.com/source-one -> wiki/sources/source-one.md
```

If the existing file already uses plain URL lines under `Ingested URLs`, preserve them. Use the dated format for new moves.

## Batch Workflow

1. Read the URL queue file.
2. Identify URLs under `New URLs`.
3. Check `index.md`, `index-full.md`, and `wiki/sources/` for existing source pages before fetching.
4. Process one URL at a time, or a small batch if the sources are short and similar.
5. Capture the source content into `raw/inbox/` or directly into a maintained raw file if the wiki has that convention.
6. Ingest the captured source using `references/source-ingestion.md`, similarly to a Web Clipper clipping.
7. Move the captured raw source file to `raw/ingested/` if the wiki uses that folder.
8. Move the URL line from `New URLs` to `Ingested URLs` with date/time and destination source page.
9. Update `index.md` or `index-full.md`.
10. Append to `log.md`, including source page, related wiki updates, raw file move if any, and URL queue move.

## Source Page Pattern

For most web URLs, use the normal source page template with web metadata:

```markdown
# <Source Title>

## Source
- Title:
- Author:
- Publication:
- URL:
- Ingest date:
- Source type: web article / blog post / vendor page / documentation / forum thread / other
- Publication date:
- Local file: `raw/ingested/<captured-source-file>.md`
- Queue source: `raw/inbox/URLs for import.txt`

## Short Summary

## Key Points

## Notable Claims
- Confirmed:
- Inference:

## Reliability Notes

## Open Questions

## Related Topics

## Related Entities

## Evidence Tier
- Tier:
- Retrieval priority:
- Basis:
```

## Updating The Queue File

When a URL is successfully ingested, remove the bare URL line from `New URLs` and append a dated line under `Ingested URLs`.

Recommended format:

```text
YYYY-MM-DD HH:mm - <url> -> wiki/sources/<source-page>.md
```

Use local time unless the wiki has another convention. If only the date is known or desired, use:

```text
YYYY-MM-DD - <url> -> wiki/sources/<source-page>.md
```

Do not add a URL to `Ingested URLs` if the source page is only drafted or blocked.

## Blocked URL Handling

If a URL cannot be ingested, leave it under `New URLs` and report the blocker. If the list supports notes, use a short indented note:

```text
https://example.com/paywalled-source
  Blocked 2026-04-28: paywall; user needs to provide clipping or text.
```

Do not let blocker notes become long research logs. Put substantial notes in `log.md` or a question page.

## Completion Checklist

- URL was under `New URLs` before ingestion.
- Source page exists in `wiki/sources/`.
- Source page includes the original URL and queue file path.
- Captured raw content is preserved and moved to `raw/ingested/` if applicable.
- Topic/entity/question updates are traceable to the source page.
- URL line moved under `Ingested URLs` with date/time and destination file.
- Index and log are updated.
