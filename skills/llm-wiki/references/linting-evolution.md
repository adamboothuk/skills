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
- topic/entity/question pages that do not link to newer stronger sources
- source pages whose claims are now outdated, superseded, or contradicted
- renamed or moved pages that left old inbound links behind
- raw inbox items that need triage
- book trackers with extracted drafts that were never ingested
- index entries missing for durable pages

## Health Check Workflow

1. Read `index.md`, `index-full.md` if present, and recent `log.md` entries.
2. Run link validation if scripts are available.
3. Sample high-value topic/question pages for source traceability.
4. Inspect active book trackers and inbox queues.
5. Check whether recent source pages are reflected in relevant topic/entity/question pages.
6. Check whether older pages need status notes because newer sources changed the current understanding.
7. Make small corrective edits where the fix is obvious.
8. For larger conceptual changes, create a question or audit note rather than rewriting many pages.
9. Append a dated `log.md` entry summarizing findings and changes.

## Link Health

Check two kinds of links:

- Mechanical links: broken markdown paths, moved pages, renamed pages, missing index entries.
- Conceptual links: pages that should reference each other but do not, old syntheses that do not link to newer stronger sources, source pages that are not discoverable from topics/entities/questions.

Mechanical workflow:

1. Run `scripts/validate-wiki-links.ps1 -WikiRoot <path>` if available.
2. Fix broken relative links directly when the intended target is clear.
3. If a target page was renamed or merged, update inbound links to the surviving page.
4. Update `index.md` or `index-full.md` when durable pages were added, renamed, merged, or removed.
5. Record link repairs in `log.md` when they are more than trivial typo fixes.

Conceptual workflow after ingesting new sources:

1. For each new source page, identify related topic/entity/question pages.
2. Add links from those pages to the new source where it strengthens, corrects, or complicates existing synthesis.
3. Add links from the source page back to relevant topics/entities/questions.
4. If the new source supersedes older guidance, add status notes rather than deleting the older source.
5. If no existing topic/entity/question page fits, either leave the source discoverable through the index or create a narrowly named page only when reuse is likely.

Avoid large link rewrites unless the page structure is clearly wrong and all affected links can be updated safely.

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

## Outdated Or Superseded Information

Do not delete old information just because it is old. Preserve the source history and update the maintained synthesis layer.

Use these statuses:

- `current`: still aligned with the strongest known sources.
- `partially outdated`: some claims still help, but important details changed.
- `superseded`: a newer or stronger source should now be preferred.
- `historical`: useful for understanding prior thinking, not current guidance.
- `unsupported`: no source support was found; soften, move to inference/open questions, or remove.

Source pages:

- Keep the original source page.
- Add `Status Notes` when the page is outdated, superseded, contradicted, or weak.
- Link to newer or stronger source pages.
- Do not rewrite the source summary to pretend the old source said something newer.

Topic/entity/question pages:

- Put current synthesis near the top.
- Move older but useful material into `Older Guidance`, `Historical Notes`, or `Superseded Guidance`.
- Add a concise note explaining what changed and which source changed it.
- Remove or soften claims that are unsupported or contradicted.

Recommended status note:

```markdown
## Status Notes
- Current status: current / partially outdated / superseded / historical / unsupported
- Reason:
- Newer or stronger source:
- What changed:
```

When evidence conflicts:

- Do not force agreement.
- Identify which source is newer, more authoritative, more directly relevant, or more limited.
- Keep minority or low-confidence signals if they may matter later, but label them clearly.
- Create or update a question page when the conflict affects a reusable decision.

## After-Ingest Link Update Checklist

After adding source pages, check:

- Does each new source appear in `index.md` or `index-full.md` according to local convention?
- Does each new source link to related topics/entities/questions?
- Do related topics/entities/questions link back to the new source?
- Did the new source make any older topic synthesis outdated or incomplete?
- Did it create a duplicate or near-duplicate concept page?
- Did any active tracker, queue, or log entry need updating?
- Does `validate-wiki-links.ps1` still pass?

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
