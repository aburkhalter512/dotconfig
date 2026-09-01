---
type: Convention
title: Naming Conventions
description: How to choose intention-revealing, consistent names for code symbols
tags: [code-quality, naming, readability]
status: stable
applyTo: "**"
---

# Naming Conventions

- Use descriptive, intention-revealing names for variables, functions, classes, and files; avoid abbreviations unless they are widely understood (e.g., `id`, `url`, `db`).
- Follow the prevailing naming case convention of the language/ecosystem in use (e.g., `camelCase` for JS/TS variables and functions, `PascalCase` for classes/types, `snake_case` for Python, `SCREAMING_SNAKE_CASE` for constants).
- Boolean variables and functions should read as predicates (e.g., `isValid`, `hasPermission`, `canEdit`).
- Function/method names should be verbs or verb phrases describing the action (e.g., `calculateTotal`, `fetchUser`); avoid vague names like `handle`, `process`, `data`, `temp`, `foo`.
- Avoid single-letter names except for trivial loop counters (`i`, `j`) or well-established math/algorithm contexts.
- Keep names consistent across the codebase: use the same term for the same concept everywhere (don't mix `user`/`account`/`client` for the same entity).
- Prefer clarity over brevity; a slightly longer, unambiguous name is better than a short, cryptic one.
- Match existing naming patterns already used in the surrounding file/module rather than introducing a new convention.
