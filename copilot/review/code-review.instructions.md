---
type: Process
title: Code Review
description: How to run independent review sub-agents and which lenses to give each one
tags: [review, sub-agents, review-lenses]
status: stable
applyTo: "**"
---

# Code Review

- Give the reviewer **minimal context**: the diff/file list and the review lens only — not the original task description or rationale — so it evaluates the change on its own merits, like a fresh human reviewer.
- Do not skip independent review, even for small changes, unless explicitly told to.
- Ensure tests/linting pass before requesting review and before pushing.
- Iterate on valid feedback until the reviewer has no material objections.

## Local review with independent specialized sub-agents

For a thorough local review pass, run a separate `code-review` sub-agent for each applicable lens in parallel. Give each reviewer minimal context: the diff/file list and its lens only, with no shared rationale or findings.

1. **Comments and documentation lens.** Review for brevity and intent per [comments](../code-quality/comments.instructions.md): comments should explain *why*, not *what*; remove comments on self-describing code; long documents should include a TL;DR summarizing their contents.
2. **Type safety and API design lens.** Review for type precision and how it shapes the public API surface. Favor designs that make it easy to do the right thing — avoid exposing alternative/parallel APIs that could confuse a caller about which one to use.
3. **Single source of truth for conditional business rules.** When the same conditional decision (e.g. "should X use approach A or approach B") appears at multiple call sites in a file, flag it as a maintainability risk: the branching condition and both outcomes should be centralized in one function so the rule is defined and tested in exactly one place, rather than re-implemented at each call site.

Add these reviewers only when their lens applies:

4. **Transformation fidelity and negative space.** For serializers, generators, migrations, format-preserving editors, and read-modify-write code, verify that untouched content, comments, ordering, formatting, unknown fields, and omitted values survive unchanged unless explicitly intended. Require tests that assert only the expected region changes, using realistic fixtures rather than substring-presence checks.
5. **Generated-artifact reconciliation.** When a plan, preview, migration diff, rendered output, or other generated artifact exists, review it alongside the source. Enumerate every destructive or mutating operation, inspect each removed or overwritten value, and verify that an equivalent value is intentionally removed or recreated elsewhere. Treat the artifact as stronger evidence than prose describing intended behavior.
6. **Refactor behavior preservation.** A refactor must preserve behavior. Flag changed outputs, errors, ordering, side effects, or edge cases.

Address findings from all reviewers before considering the review complete.

## Adding a new review lens after a missed issue

If a bug or design flaw slips past local review and is only caught later, follow [improving instructions after a missed issue](../instruction-maintenance/improving-instructions.instructions.md) to generalize it into a new review lens above.
