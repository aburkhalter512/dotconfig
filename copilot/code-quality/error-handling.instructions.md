---
type: Convention
title: Error Handling
description: How to raise, propagate, contextualize, and recover from errors
tags: [code-quality, error-handling, reliability]
status: stable
applyTo: "**"
---

# Error Handling

- Never silently swallow errors (empty catch blocks); at minimum log them with enough context to diagnose the issue.
- Fail fast and explicitly: validate inputs and preconditions early, and raise/throw clear errors rather than letting invalid state propagate.
- Use the language/ecosystem's idiomatic error mechanism (exceptions, `Result`/`Either` types, error return values, etc.) consistently with the rest of the codebase.
- Include actionable context in error messages: what failed, relevant identifiers/values, and (when helpful) what to do next. Avoid vague messages like "something went wrong".
- Catch errors at the level where you can meaningfully handle or recover from them; avoid catching broad exception types just to suppress them.
- Do not use exceptions/errors for normal control flow.
- Clean up resources (files, connections, locks) in `finally`/`defer`/`using`/context-manager blocks so cleanup happens even when errors occur.
- Distinguish between recoverable errors (retry, fallback, user-facing message) and unrecoverable ones (crash, alert, escalate) and handle each appropriately.
- When wrapping/rethrowing errors, preserve the original error/stack trace as the cause rather than discarding it.
