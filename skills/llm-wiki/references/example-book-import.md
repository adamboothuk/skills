# Example: PDF Book Import

Use this as a format reference for staged book import. Do not ingest a whole book in one pass.

## Case

Observed example book:

- PDF: `raw/books/scrum-anti-patterns-guide-v-570-2023-09-23.pdf`
- Tracker/entity page: `wiki/entities/the-scrum-anti-patterns-guide.md`
- Author entity: `wiki/entities/stefan-wolpers.md`
- First source pages:
  - `wiki/sources/scrum-anti-patterns-scrum-mastery-in-300-words.md`
  - `wiki/sources/scrum-anti-patterns-daily-scrum.md`
  - `wiki/sources/scrum-anti-patterns-product-backlog-and-refinement.md`
  - `wiki/sources/scrum-anti-patterns-sprint-planning.md`
- Associated topics:
  - `wiki/topics/product-backlog-refinement.md`
  - `wiki/topics/ai-assisted-project-management.md`
  - `wiki/topics/product-owner-practice.md`
- Log entries: `log.md` or monthly archive such as `log/2026-04.md`

## Stage 1: Tracker Setup

Create the book tracker before chapter ingestion:

```markdown
# The Scrum Anti-Patterns Guide

## What It Is
One-paragraph description of the book and its domain.

## Bibliographic Details
- Title: The Scrum Anti-Patterns Guide: A Hands-on Manual from the Trenches
- Author: Stefan Wolpers
- Version: 5.70
- Date: 2023-09-23
- Publication/site context: Age-of-Product.com
- Local PDF path: `raw/books/scrum-anti-patterns-guide-v-570-2023-09-23.pdf`
- Source status: local PDF provided by the user
- Extracted page count: 109 PDF pages visible to `pypdf`

## Ingest Strategy
- Treat the guide as a source collection, not as one source.
- Ingest one major section at a time.
- Create one source page per ingested section.
- Update shared topic pages as recurring ideas appear.

## Ingested
- None yet.

## Queue By Section
### Front Matter
- Queued: Preface
- Queued: The Scrum Anti-Patterns Guide Is Available for Preorder
- Queued: Scrum Mastery in 300 Words

### Scrum Event Anti-Patterns
- Queued: 24 Daily Scrum Anti-Patterns
- Queued: 27 Product Backlog and Refinement Anti-Patterns
- Queued: 20 Sprint Planning Anti-Patterns

## Major Themes To Watch
- product backlog health
- stakeholder interference
- Scrum event purpose
- technical debt and Definition of Done
```

The important pattern is the queue. The tracker is not only a book description; it is the import control surface.

## Stage 2: Chapter Or Section Source Page

Each imported section becomes its own source page:

```markdown
# The Scrum Anti-Patterns Guide - Daily Scrum Anti-Patterns

## Source Details
- Source: *The Scrum Anti-Patterns Guide: A Hands-on Manual from the Trenches*
- Author: [Stefan Wolpers](../entities/stefan-wolpers.md)
- Source type: PDF book section
- Version/date: 5.70, 2023-09-23
- Ingest date: 2026-04-11
- Local source: `raw/books/scrum-anti-patterns-guide-v-570-2023-09-23.pdf`
- PDF page range used: pages 7-12

## Short Summary
Plain-language summary of what this section contributes.

## Key Points
- Directly supported point from the section.

## Notable Claims
- Confirmed: Claim supported by the section.
- Inference: Transferable interpretation for the target wiki.

## Product Owner Interpretation
Optional section when the book source needs translation for the user's context.

## AI-Assisted Game Development Interpretation
Optional section when the wiki has a recurring local use case.

## Tensions and Limits
- State scope limits and translation risks.

## Related Topics
- [Product Backlog Refinement](../topics/product-backlog-refinement.md)

## Related Entities
- [The Scrum Anti-Patterns Guide](../entities/the-scrum-anti-patterns-guide.md)
- [Stefan Wolpers](../entities/stefan-wolpers.md)

## Evidence Tier
- Tier: `B`
- Retrieval priority: Medium
- Basis: Practitioner book section with useful domain guidance.
```

## Stage 3: Tracker Update

After each section is ingested, update the tracker mechanically:

```markdown
## Ingested
- [Scrum Mastery in 300 Words](../sources/scrum-anti-patterns-scrum-mastery-in-300-words.md) - PDF page 6; ingested 2026-04-11.
- [24 Daily Scrum Anti-Patterns](../sources/scrum-anti-patterns-daily-scrum.md) - PDF pages 7-12; ingested 2026-04-11.

## Priority Next
- Continue with Product Backlog and Refinement if Product Owner practice is the current focus.

## Queue By Section
### Front Matter
- Queued: Preface
- Queued: The Scrum Anti-Patterns Guide Is Available for Preorder
- Ingested: Scrum Mastery in 300 Words

### Scrum Event Anti-Patterns
- Ingested: 24 Daily Scrum Anti-Patterns
- Queued: 27 Product Backlog and Refinement Anti-Patterns
- Queued: 20 Sprint Planning Anti-Patterns
```

Keep completed items visible until the tracker is clearly stable. This helps future agents avoid duplicate ingestion.

## Stage 4: Topic And Entity Updates

Topic updates should synthesize recurring lessons across source pages. For example, `Product Backlog Refinement` absorbed repeated guidance from the book about:

- separating discovery artifacts from actionable backlog work
- avoiding over-large, stale, over-detailed, or title-only backlogs
- treating refinement as collaborative, not clerical
- protecting the Sprint Backlog from uncontrolled new work

Entity updates stay simpler:

```markdown
# Stefan Wolpers

## Supporting Sources
- [The Scrum Anti-Patterns Guide - Scrum Mastery in 300 Words](../sources/scrum-anti-patterns-scrum-mastery-in-300-words.md)
- [The Scrum Anti-Patterns Guide - Daily Scrum Anti-Patterns](../sources/scrum-anti-patterns-daily-scrum.md)
```

## Stage 5: Log Entry

```markdown
## [2026-04-11] ingest | scrum anti-patterns daily scrum
- Ingested `24 Daily Scrum Anti-Patterns` from *The Scrum Anti-Patterns Guide* using PDF pages 7-12.
- Created `wiki/sources/scrum-anti-patterns-daily-scrum.md`.
- Updated `wiki/topics/product-owner-practice.md`, `wiki/topics/ai-assisted-project-management.md`, `wiki/topics/design-communication.md`, `wiki/topics/product-backlog-refinement.md`, the Scrum Anti-Patterns tracker, `Stefan Wolpers`, and `index.md`.
- Captured the Daily Scrum as a Developer-owned inspection and adaptation event for the next 24 hours, not a status report, task-assignment forum, stakeholder performance check, or problem-solving meeting.
- Noted the solo AI-assisted equivalent as a short goal/blocker/next-plan checkpoint rather than a copied Scrum ceremony.
```

## Stage Checklist

- Tracker exists before import.
- Each book section has its own source page.
- Source page records PDF page range used.
- Tracker marks each section as ingested.
- Topic pages receive durable cross-source lessons, not pasted chapter summaries.
- Entity pages link to the book and author where useful.
- Index and log are updated after each batch.
