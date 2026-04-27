# Wiki Structure

Use this reference when creating or reshaping a markdown wiki.

## Default Layout

```text
raw/
  inbox/
  books/
  assets/
  ingested/
wiki/
  sources/
  topics/
  entities/
  questions/
  templates/
index.md
log.md
```

Optional additions:

- `index-full.md` for a complete catalog when `index.md` needs to stay compact.
- `raw/processed/` instead of `raw/ingested/` if the existing wiki already uses that name.
- `log/YYYY-MM.md` archives when `log.md` becomes too large, with `log.md` remaining the current entry point.

## Directory Purposes

- `raw/`: source material as captured. Do not rewrite raw source text for style.
- `raw/inbox/`: unprocessed sources waiting for triage.
- `raw/books/`: long PDFs or books that need tracker-first import.
- `raw/assets/`: extracted text, images, OCR output, and intermediate artifacts.
- `raw/ingested/`: discrete source files already represented by wiki pages.
- `wiki/sources/`: one page per article, chapter, paper, transcript, or other source unit.
- `wiki/topics/`: cross-source concepts and themes.
- `wiki/entities/`: people, books, tools, companies, games, methods, products, and named things.
- `wiki/questions/`: reusable answers, comparisons, decision notes, and syntheses.
- `wiki/templates/`: reusable prompts and page templates.

## Required Root Pages

`index.md` should be short and navigational:

- link to overview or purpose page if one exists
- link to `index-full.md` if the wiki has one
- link to high-value question pages or active trackers
- list main sections
- avoid becoming a full catalog unless the wiki is very small

`log.md` should be append-only:

- use dated entries
- state sources added, wiki pages updated, files moved, blockers, and follow-up queue
- do not rewrite history except to fix a clear typo or broken link

## Starter Page Templates

Source page:

```markdown
# <Source Title>

## Source
- Title:
- Author:
- Publication:
- URL:
- Ingest date:
- Source type:
- Local file:

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

Topic page:

```markdown
# <Topic>

## Working Definition

## Why It Matters

## Source-Backed Claims

## Synthesis / Inference

## Related Sources

## Related Topics

## Open Questions
```

Question page:

```markdown
# <Question>

## Short Answer

## Source-Backed Answer

## Comparison / Synthesis

## Confidence

## Sources Consulted

## Follow-Up Questions
```
