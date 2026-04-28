# YouTube Transcript Ingestion

Use this reference when a user drops a single YouTube URL, a YouTube transcript, or a raw transcript file that should become a traceable wiki source.

## Core Rules

- Do not treat the video as ingested until the transcript text is present or the user confirms the transcript source.
- Do not infer a published date from upload order, comments, or memory. Record confidence.
- Keep creator claims separate from the wiki's interpretation.
- Treat auto captions as lower-confidence raw text until checked for obvious transcription errors.
- Preserve the transcript in `raw/` and create a maintained source page in `wiki/sources/`.
- If the video is mostly opinion, tutorial, vendor/product messaging, or interview, say so in reliability notes.

## Intake Workflow

1. If the user provides only a YouTube URL, create or suggest a raw intake note in `raw/inbox/` using the header below.
2. Ask for or capture the transcript before summarizing source claims.
3. Fill unknown fields with `unknown`, not guesses.
4. Validate the intake header if the script is available.
5. Ingest the source using `references/source-ingestion.md`.
6. Update topic/entity/question pages only if the transcript adds durable value.
7. Move the completed raw intake/transcript file from `raw/inbox/` to `raw/ingested/` once the source page represents it.
8. Update `index.md` or `index-full.md` and append to `log.md`, including the raw file move.

## Suggested Raw Intake Header

Use this when a single YouTube URL is dropped as a source, or when a transcript arrives without enough context:

```markdown
# YouTube Transcript Intake

Title:
YouTube URL:
Channel / creator:
Published date:
Published date confidence: high / medium / low
Transcript captured date:
Transcript source: YouTube auto captions / manual transcript / third-party tool / unknown
Language:
Duration:

## Human Context

Reason for interest:
Relevant wiki area:
Initial confidence: high / medium / low
Source stance: neutral / opinion / tutorial / product/vendor / interview / unclear
Priority: high / medium / low
Ingest intent: source page only / update existing topics / create new synthesis if useful

## Notes for Ingest

Key questions I want this source to help answer:
- 

Known caveats:
- 

Links mentioned or related:
- 

## Transcript
```

## Source Page Pattern

For the maintained source page, adapt the normal source template:

```markdown
# <Video Title>

## Source
- Title:
- Creator/channel:
- Platform: YouTube
- URL:
- Published date:
- Published date confidence:
- Transcript captured date:
- Transcript source:
- Language:
- Duration:
- Source type: video transcript
- Local file: `raw/ingested/<file>.md`

## Human Context
- Reason for interest:
- Relevant wiki area:
- Initial confidence:
- Source stance:
- Priority:
- Ingest intent:

## Short Summary

## Key Points

## Notable Claims
- Confirmed:
- Inference:

## Reliability Notes

## Transcript Quality Notes

## Open Questions

## Related Topics

## Related Entities

## Evidence Tier
- Tier:
- Retrieval priority:
- Basis:
```

## Evidence Guidance

Use evidence tiers conservatively:

- `A`: official talk from a primary creator/organization, with a clean manual transcript and clear date.
- `B`: expert talk, conference session, or interview with clear provenance and usable transcript.
- `C`: informal video, tutorial, opinion video, vendor/product content, auto-caption transcript, or unclear date.
- `D`: transcript with major gaps, unknown creator, uncertain URL, or poor provenance.

## Topic And Entity Updates

Topic pages should not become video notes. Add only durable claims or useful examples, and link back to the source page.

Entity pages are useful for:

- recurring creators or channels
- products/tools discussed in the video
- companies or projects that are the subject of the video
- games or books mentioned as durable references

## Completion Checklist

- Source page exists in `wiki/sources/` and links to the YouTube URL.
- Source page `Local file` points to `raw/ingested/<file>.md`.
- Completed raw intake/transcript file has been moved from `raw/inbox/` to `raw/ingested/`.
- Topic/entity/question pages were updated only where the transcript adds durable value.
- `index.md` or `index-full.md` includes the source page if the wiki uses an index catalog.
- `log.md` records the source page, related wiki updates, and raw file move.

## Stop Conditions

Stop before ingestion when:

- there is no transcript text
- the transcript source is unknown and the video cannot be checked
- the transcript is too noisy to support reliable claims
- the video is long and should be split into sections
- the URL, title, or creator cannot be identified
