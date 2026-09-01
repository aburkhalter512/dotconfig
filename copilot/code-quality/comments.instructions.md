---
type: Convention
title: Comments and Documentation
description: When to write a comment, what it should say, and how to document public API surfaces
tags: [code-quality, comments, documentation]
status: stable
applyTo: "**"
---

# Comments and Documentation

- Write comments that explain *why*, not *what* — the code itself should make the "what" clear through good naming and structure.
- Only add a comment when the logic is non-obvious (e.g., a workaround, a non-trivial algorithm, a business-rule nuance, or a subtle edge case); do not narrate obvious code line by line.
- Keep comments up to date with the code; a stale or misleading comment is worse than no comment. Remove comments that no longer apply when editing nearby code.
- Avoid commented-out code; delete dead code instead (version control preserves history).
- Document public APIs (functions, classes, modules) with concise docstrings/doc comments describing purpose, parameters, return values, and thrown errors, following the convention of the language (e.g., JSDoc, docstrings, Godoc).
- Avoid redundant comments that just restate the code (e.g., `// increment i` above `i++`).
- Use TODO/FIXME comments sparingly and include enough context (and ideally an issue reference) for someone else to act on them later.
- Don't add comments purely to explain a change was made by an AI assistant.
- Prefer brevity over verbosity. Comments inside functions should be direct and minimal, relying upon the code itself to explain what it does.
- If a comment for non-public APIs is more than one short sentence long, consider rewriting the code to be more self-explanatory.

## Documentation for public schema/config/API surfaces

Applies to any language's consumer-facing field/parameter documentation: Pydantic/dataclass field descriptions, JSDoc on exported types, struct/interface field docs, GraphQL/OpenAPI/protobuf field comments, CLI flag help text, etc.

- These target the *consumer* of the interface, not a future code-maintainer — keep them to one plain sentence describing the value's purpose/format/allowed values.
- Never explain internal implementation, derivation logic, or "mirrors X internal type" provenance notes in these audience-facing docs — that belongs in code comments near the implementation, if anywhere.
- Avoid parenthetical asides and em-dash tangents; state the one fact plainly instead of hedging with an aside.
- Treat the docstring/description as opt-in, not default — omit it entirely when the field/parameter name is already self-explanatory.
