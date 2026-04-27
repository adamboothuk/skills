# PDF Book Import

Use this reference for long PDFs and books. Do not ingest a whole book in one pass.

## Tracker-First Workflow

1. Move or copy the PDF into `raw/books/` according to the local wiki convention.
2. Create a book tracker page, usually in `wiki/entities/`.
3. Extract or verify the table of contents/chapter map.
4. Add verified page ranges before extraction. If ranges are uncertain, label them uncertain and stop before ingest.
5. Extract a small batch of chapters or sections into `raw/assets/`.
6. Validate extracted text before ingestion.
7. Ingest one chapter or section into `wiki/sources/`.
8. Update recurring topic/entity pages as patterns appear.
9. Update tracker, index, and log after each meaningful step.

## Book Tracker Template

```markdown
# <Book Title>

## What It Is

## Bibliographic Details
- Title:
- Subtitle:
- Authors:
- Publisher:
- Publication year:
- Edition:
- Local PDF path: `raw/books/<file>.pdf`
- Source status:
- Extracted page count:

## Why It Matters Here

## Ingest Strategy
- Treat the book as a source collection, not as one source.
- Ingest one chapter, major part, or named section at a time.
- Create one source page per ingested chapter or section.
- Verify PDF page ranges before extraction.

## Table Of Contents / Chapter Map
- Status:

## Extracted Drafts
- None yet.

## Ingested
- None yet.

## Priority Next

## Remaining Queue

## Major Themes

## Extraction Or OCR Notes

## Related Topics

## Related Entities

## Open Questions
```

## Chapter Map Rules

- Distinguish printed page numbers from PDF page indexes.
- Store the exact ranges the extraction workflow should use.
- Mark uncertain ranges explicitly.
- Do not guess missing chapters from memory.
- If the PDF has noisy TOC extraction, verify against visible headings near the target pages.

## Small Batch Extraction

Extract two to four queued chapters or sections at a time. For each output file in `raw/assets/`, use:

```text
Extraction Quality: <clean | minor-noise | noisy | partial>
Known Issues:
- <issue or "none">
Coverage:
- PDF pages <start-end>
Source:
- raw/books/<file>.pdf
Tracker:
- wiki/entities/<tracker>.md

<extracted text>
```

Rules:

- Do not summarize during extraction.
- Do not rewrite source prose for style.
- Preserve headings and section boundaries where possible.
- If extraction is messy, keep best-effort raw text and label quality honestly.
- Do not ingest extracted text until headers, coverage, and target page range have been checked.

## Chapter Ingestion

When ingesting an extracted chapter:

1. Read the tracker and extracted text.
2. Validate extraction quality and page coverage.
3. Create one `wiki/sources/` page for the chapter or section.
4. Link the source page to the book tracker and extracted text file.
5. Update topics/entities only for durable recurring ideas.
6. Mark the chapter as ingested in the tracker.
7. Keep remaining queued items intact.
8. Update `index.md` or `index-full.md`.
9. Append a dated `log.md` entry.

## Stop Conditions

Stop and ask or report a blocker when:

- the tracker has no verified page range for the next item
- the extracted text is too noisy to support reliable claims
- the PDF appears to be scanned images and OCR is not available
- chapter boundaries conflict between TOC and visible headings
- the requested batch would create too many wiki edits to review safely
