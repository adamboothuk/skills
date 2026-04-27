# Example: Web Clipper Ingest

Use this as a format reference for a discrete article captured with Obsidian Web Clipper. Do not copy the example facts into a target wiki unless the target source actually contains them.

## Case

Observed example source:

- Raw clipping in inbox: `raw/inbox/How I Learned to Stop Worrying and Love the LLM in Agile.md`
- Processed raw clipping: `raw/ingested/How I Learned to Stop Worrying and Love the LLM in Agile.md`
- Source page: `wiki/sources/how-i-learned-to-stop-worrying-and-love-the-llm-in-agile.md`
- Related topic: `wiki/topics/ai-assisted-project-management.md`
- Related entities: `wiki/entities/stefan-wolpers.md`, `wiki/entities/scrum-org.md`
- Index entry: `index-full.md`
- Log entry: `log.md`

## Raw Clipping Shape

Web Clipper files often contain YAML frontmatter plus captured article markdown:

```markdown
---
title: "How I Learned to Stop Worrying and Love the LLM in Agile"
source: "https://www.scrum.org/resources/blog/how-i-learned-stop-worrying-and-love-llm-agile"
author:
  - "[[Subscribe]]"
published: 2026-03-01
created: 2026-04-22
description: "..."
tags:
  - "clippings"
---

[author or page metadata]

## Article Heading

Captured article body...
```

Watch for noisy metadata. In this example, the Web Clipper `author` field captured `Subscribe`, while the article body and resulting source page identified Stefan Wolpers. Verify author metadata from the page content before treating it as fact.

## Source Page Shape

The maintained source page should be shorter than the raw clipping and should preserve traceability:

```markdown
# How I Learned to Stop Worrying and Love the LLM in Agile

## Source
- Title: How I Learned to Stop Worrying and Love the LLM in Agile
- Author: Stefan Wolpers
- Publication: Scrum.org
- URL: https://www.scrum.org/resources/blog/how-i-learned-stop-worrying-and-love-llm-agile
- Ingest date: 2026-04-22
- Source type: web article
- Publication date: 2026-03-01
- Local file: `raw/ingested/How I Learned to Stop Worrying and Love the LLM in Agile.md`

## Short Summary
Plain-language summary of what the article contributes to the wiki.

## Key Points
- Directly supported point.
- Directly supported point.

## Notable Claims
- Confirmed: A claim clearly supported by the article.
- Inference: The wiki's interpretation of why the source matters.

## Reliability Notes
- Note source type, author context, and limits.

## Open Questions
- Reusable follow-up question.

## Related Topics
- [AI-Assisted Project Management](../topics/ai-assisted-project-management.md)

## Related Entities
- [Stefan Wolpers](../entities/stefan-wolpers.md)
- [Scrum.org](../entities/scrum-org.md)

## Evidence Tier
- Tier: `B`
- Retrieval priority: Medium
- Basis: Practitioner source from a trusted existing entity, but experience-based rather than neutral research.
```

## Topic Update Pattern

Topic pages should absorb only durable, reusable lessons. For this example, the related topic did not paste the source summary. It added a source-backed paragraph about AI as assistance for project work and kept human oversight/accountability as the controlling principle.

Good topic update:

- names what the source adds
- links to the source page
- distinguishes source-backed claims from local synthesis
- avoids repeating all key points from the source page

## Entity Update Pattern

Entity pages can stay compact:

```markdown
## Supporting Sources
- [How I Learned to Stop Worrying and Love the LLM in Agile](../sources/how-i-learned-to-stop-worrying-and-love-the-llm-in-agile.md)
```

Update entities only when the source strengthens a durable person, organization, tool, book, or publication node.

## Log Entry Shape

```markdown
## [2026-04-22] ingest | inbox sweep batch on mvp architecture and llm-in-agile clippings
- Added source page:
  - `wiki/sources/how-i-learned-to-stop-worrying-and-love-the-llm-in-agile.md`
- Updated topic page:
  - `wiki/topics/ai-assisted-project-management.md`
- Updated `index-full.md` with the new source entry.
- Moved processed discrete file from inbox to ingested:
  - `raw/inbox/How I Learned to Stop Worrying and Love the LLM in Agile.md` -> `raw/ingested/`
```

## Completion Notes

- The raw clipping stays available after processing.
- The source page is the citation target for future synthesis.
- The topic/entity pages are the maintained knowledge layer.
- `index-full.md` records the durable page.
- `log.md` records what changed and which raw file moved.
