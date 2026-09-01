---
type: Convention
title: Testing Practices
description: What to cover with tests, and how to keep them isolated, deterministic, and fake-based
tags: [code-quality, testing, fixtures]
status: stable
applyTo: "**"
---

# Testing Practices

- Write tests for new functionality and for bug fixes (a regression test that reproduces the bug before fixing it, where practical).
- Prefer the testing framework and conventions already used in the project; do not introduce a new test runner or assertion library without a strong reason.
- Test behavior and public contracts, not implementation details; avoid over-mocking internals such that tests break on harmless refactors.
- Cover the happy path, edge cases (empty input, boundary values, nulls), and expected error/failure conditions.
- Keep tests isolated and deterministic: no reliance on execution order, shared mutable state, real network calls, or system time without mocking/faking.
- Use clear, descriptive test names that state what is being tested and the expected outcome (e.g., `returns 404 when user does not exist`).
- Prefer the smallest test scope that gives confidence (unit tests over integration tests over end-to-end tests) unless the behavior specifically requires broader coverage.
- Run the relevant test suite after making changes and ensure it passes before considering the task complete.
- Avoid disabling, skipping, or deleting failing tests to make a suite pass; fix the underlying issue or update the test if the expected behavior legitimately changed.
- When heavy mocking around IO (networking, file, DB, etc.) is needed to unit test code, consider refactoring the non-test code to dependency inject these IO functions/classes.
- Prefer implementing fakes over mocks. For example, when testing code that interacts with a NoSQL DB, implement a test-only fake class that stores creates/updates in memory and serves that same data via gets.
- Prefer the test fixture pattern over mocking to ensure we are testing public APIs and not relying on internals.
- Each test should be entirely isolated. All test setup should be done in the test itself, using helper functions as needed to reduce boilerplate.
