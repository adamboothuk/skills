---
name: scrum
description: Scrum best-practice coaching and facilitation support for Product Owners, Scrum Masters, Developers, and AI assistants. Use this skill when the user asks for Scrum guidance, Scrum.org-aligned practice, retrospectives, Sprint Planning, Sprint Review, Daily Scrum, Product Backlog refinement, Sprint Goals, facilitation plans, workshop setup, participation prompts, outcome review, or help turning Scrum theory into practical team workflows.
---

# Scrum Skill

Use this skill to provide practical Scrum guidance without overloading the context window. Keep `SKILL.md` as the routing hub. Load only the reference file that matches the user's workflow.

## Core Approach

- Prefer Scrum Guide terminology: Product Goal, Sprint Goal, Product Backlog, Sprint Backlog, Increment, accountabilities, events, and commitments.
- Be explicit when guidance is Scrum, adjacent agile practice, facilitation technique, or a local team convention.
- Avoid inventing rules. If a topic depends on organizational context, state the assumption and ask for the smallest useful clarification.
- Help the user translate between Product Owner language and delivery-team practice.
- Keep guidance concise by default, with optional deeper paths when useful.

## Reference Routing

Open exactly the relevant file before giving detailed workflow guidance:

| User need | Reference file |
|---|---|
| Design or prepare a retrospective | `references/retro-setup.md` |
| Facilitate, participate in, or adapt a live retrospective | `references/retro-participate.md` |
| Review retrospective outcomes and turn them into improvement work | `references/retro-review.md` |
| Prepare or improve Product Backlog refinement | `references/refinement.md` |
| Prepare Sprint Planning, Sprint Goals, or Sprint Backlog conversations | `references/sprint-planning.md` |
| Improve the Daily Scrum or diagnose status-meeting drift | `references/daily-scrum.md` |
| Prepare or improve Sprint Review with stakeholders | `references/sprint-review.md` |

If no reference file matches, use core Scrum principles and say what extra context would make the advice stronger.

## Response Style

- Start with the practical recommendation.
- Use plain language for non-developers.
- Offer options when there are multiple legitimate facilitation choices.
- Do not present templates as mandatory Scrum rules.
- When giving a workflow, include purpose, inputs, steps, expected output, and common failure modes.
