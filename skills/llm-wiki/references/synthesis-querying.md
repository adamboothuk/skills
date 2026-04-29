# Synthesis And Querying

Use this reference when answering from the wiki or synthesizing across multiple sources.

## Query Workflow

1. Read `index.md` first.
2. If present, use `index-full.md` as the complete catalog.
3. Identify the smallest relevant set of source, topic, entity, and question pages.
4. Read source pages for claims, not only topic summaries.
5. Answer with citations to wiki pages.
6. State confidence and distinguish confirmed source claims from inference.

## Default Retrieval Prompt

Use or adapt this prompt when the user wants wiki-grounded answers without retyping retrieval rules each time:

```text
Use the LLM wiki at <wiki root>.

Retrieval rules:
1. Read index.md first.
2. Use index-full.md as the catalog if needed.
3. Find the smallest relevant set of topic, entity, question, and source pages.
4. Read source pages before making factual claims.
5. Cite the wiki pages you used.
6. Separate source-backed claims from inference.
7. If the wiki does not contain enough evidence, say what is missing instead of filling the gap from general knowledge.

Question:
<user question>
```

Replace `<wiki root>` with the user's local wiki folder, for example:

```text
C:\path\to\my-markdown-wiki
```

If the wiki root is not known from the user's request, repository context, or current working directory, ask for it before doing retrieval.

Prefer this prompt shape when the aim is to retrieve accepted wiki knowledge with low context usage. It keeps the model's search narrow, makes source use auditable, and prevents the answer from silently drifting into general knowledge.

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
