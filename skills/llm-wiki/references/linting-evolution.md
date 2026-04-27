# Linting And Evolution

Use this reference for wiki health checks and maintenance.

## Audit Targets

Look for:

- broken local links
- pages missing source traceability
- topic pages that summarize without source links
- duplicate or overlapping concepts
- stale active trackers
- orphan source pages not linked from topics, entities, questions, or indexes
- question pages with weak confidence notes
- raw inbox items that need triage
- book trackers with extracted drafts that were never ingested
- index entries missing for durable pages

## Health Check Workflow

1. Read `index.md`, `index-full.md` if present, and recent `log.md` entries.
2. Run link validation if scripts are available.
3. Sample high-value topic/question pages for source traceability.
4. Inspect active book trackers and inbox queues.
5. Make small corrective edits where the fix is obvious.
6. For larger conceptual changes, create a question or audit note rather than rewriting many pages.
7. Append a dated `log.md` entry summarizing findings and changes.

## Duplicate Concept Handling

When pages overlap:

- Do not merge automatically if both have distinct source histories.
- Add "See also" links first.
- Add a distinction note explaining when to use each page.
- Merge only when one page is clearly redundant and all links can be updated safely.
- Record merges in `log.md`.

## Traceability Repair

If a page has unsupported claims:

- Search source pages for support.
- Add source links when support exists.
- Move unsupported but useful ideas into `Synthesis / Inference` or `Open Questions`.
- Remove or soften claims that cannot be supported.

## Staleness Checks

A stale page is not automatically wrong. Treat it as stale when:

- it references active work that is no longer active
- it has open questions answered elsewhere
- it duplicates a newer page
- it points to missing raw files
- it lacks links to later stronger sources

## Recommended Report Shape

```markdown
# Wiki Health Check - <date>

## Summary

## Findings

## Fixes Applied

## Needs User Decision

## Follow-Up Queue
```

For quick audits, report findings directly to the user and only create a page if the wiki already keeps audit notes.
