# Synthesis And Querying

Use this reference when answering from the wiki or synthesizing across multiple sources.

## Query Workflow

1. Read `index.md` first.
2. If present, use `index-full.md` as the complete catalog.
3. Identify the smallest relevant set of source, topic, entity, and question pages.
4. Read source pages for claims, not only topic summaries.
5. Answer with citations to wiki pages.
6. State confidence and distinguish confirmed source claims from inference.

## Citation Style

Use normal markdown links to wiki pages. Prefer citing source pages for factual claims and topic/question pages for existing syntheses.

Example:

```markdown
The strongest source-backed pattern is that documentation works best as a living communication tool, not a one-time artifact (cite the relevant `wiki/sources/...` page). My synthesis is that this supports lightweight design notes for AI-assisted prototypes, but that inference depends on project context.
```

## Synthesis Rules

- Do not collapse disagreement between sources. Name the disagreement.
- Prefer "Source A says..." and "Source B adds..." when evidence differs in authority or scope.
- Label your own conclusion as synthesis, inference, or recommendation.
- Preserve minority or low-confidence signals if they may matter later.
- Do not upgrade low-authority sources into strong guidance because they are convenient.

## Creating Question Pages

Create or update a `wiki/questions/` page when:

- the answer is likely to be reused
- multiple sources need to be compared
- the user is making a decision
- the synthesis is too large for a topic page

Include:

- short answer
- source-backed answer
- comparison/synthesis
- confidence
- sources consulted
- follow-up questions

## Query Completion Checklist

- `index.md` was checked first.
- Relevant source pages were opened before giving factual claims.
- The answer cites wiki pages.
- Inferences are labeled.
- Any missing source coverage is named as a gap, not silently filled.
