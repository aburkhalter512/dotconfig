---
type: Convention
title: Commit Messages
description: How to write focused, imperative commit messages that explain why a change was made
tags: [workflow, git, commit-messages]
status: stable
applyTo: "**"
---

# Commit Messages

- Write commit messages in the imperative mood (e.g., "Add retry logic", not "Added" or "Adds retry logic").
- Keep the summary line concise (ideally 50-72 characters) and capitalized, without a trailing period.
- Follow Conventional Commits style when the project already uses it (e.g., `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`); otherwise match the existing repo convention.
- Use the commit body to explain *why* a change was made and any important context/trade-offs, not just a restatement of the diff.
- Keep commits focused and atomic: one logical change per commit; avoid bundling unrelated changes together.
- Reference related issues/PRs where relevant (e.g., `Fixes #123`).
- Do not include secrets, credentials, or sensitive data in commit messages.
