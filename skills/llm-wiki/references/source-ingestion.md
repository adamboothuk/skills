# Source Ingestion

Use this reference when turning raw source material into maintained wiki pages.

## Ingestion Principles

- Ingest one coherent source unit at a time: one article, chapter, paper section, transcript, or note.
- Preserve raw source material. Do not replace raw text with summaries.
- Create or update `wiki/sources/` first, then update topics, entities, questions, index, and log.
- Prefer adding a small traceable claim to an existing topic over creating a near-duplicate topic.
- Mark weaker claims as weak. Do not make vendor blogs, forum posts, or unsupported opinion sound authoritative.

## Triage

Before ingestion:

1. Identify source type: article, PDF chapter, book, paper, YouTube transcript, internal note, URL queue list, URL queue item.
2. Check whether the source already has a `wiki/sources/` page.
3. Check `index.md`, `index-full.md`, and relevant topic/entity pages for overlap.
4. Decide whether to create:
   - a source page only
   - source page plus topic updates
   - source page plus entity updates
   - a question/synthesis page

If the source is a single YouTube URL or YouTube transcript, use `references/youtube-transcript-ingestion.md` before creating wiki pages.

If the source is a queue file such as `raw/inbox/URLs for import.txt`, use `references/url-list-import.md` before ingesting individual URLs.

## Source Page Workflow

1. Read the raw file or extracted text.
2. Capture bibliographic/source metadata.
3. Write a short summary in plain language.
4. List key points that are directly supported by the source.
5. Separate notable confirmed claims from inference.
6. Add reliability notes.
7. Add open questions.
8. Link related topics/entities.
9. Assign an evidence tier if the wiki uses tiers.

Suggested evidence tiers:

- `A`: primary source, official documentation, canonical book chapter, peer-reviewed paper, or direct artifact.
- `B`: reputable secondary source, expert article, high-quality case study.
- `C`: vendor glossary, marketing content, forum/reddit thread, anecdotal post, or low-authority source.
- `D`: unverified note, rough transcript, unclear provenance.

## Updating Topics And Entities

When updating a topic or entity:

- Add source-backed claims with links to source pages.
- Keep the page as a synthesis layer, not a dumping ground for every source summary.
- Use headings such as `Source-Backed Claims`, `Synthesis / Inference`, and `Open Questions`.
- If two concepts overlap, add a short distinction instead of duplicating both pages.
- If a new topic/entity is created, add it to the relevant index.

## Moving Processed Files

If the wiki has `raw/inbox/` and `raw/ingested/`:

- Move only discrete raw files that are fully represented by wiki pages.
- Do not move book PDFs after a single chapter is ingested.
- Record moves in `log.md`.

## Completion Checklist

- Source page exists and links back to raw source.
- Topic/entity/question pages were updated only where useful.
- Every synthesis claim links to at least one source page or is labeled as inference.
- `index.md` or `index-full.md` includes new durable pages.
- `log.md` records the ingest and any blockers.
