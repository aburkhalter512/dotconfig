---
type: Process
title: Standard Coding Task Process
description: End-to-end flow for a non-trivial coding task, from dedicated worktree to draft pull request
tags: [workflow, process, worktree, pull-request]
status: stable
applyTo: "**"
---

# Standard Coding Task Process

For non-trivial coding tasks, follow this end-to-end process:

1. **Delegate to a sub-agent.** Spin up a sub-agent to own the task from setup through PR creation, rather than making changes directly in the current working tree/branch.
2. **Create a new git worktree.** The sub-agent creates a dedicated git worktree for the task so it doesn't disturb the current branch/working directory.
3. **Create a new branch.** Use the naming style `[project-name]/[feature-name]` (e.g., `payments-api/fix-retry-logic`), branching off the appropriate base branch.
4. **Implement the coding changes.** Make the required changes in the worktree, following all other applicable instruction files (naming, testing, error handling, comments, commit messages).
5. **Review locally with a separate sub-agent.** Launch a second, independent sub-agent to review the changes, following [code review](../review/code-review.instructions.md).
6. **Address review feedback.** Incorporate valid feedback from the reviewer sub-agent; iterate until the reviewer has no material objections.
7. **Push and open a draft PR.** Push the branch and open the pull request as a **draft**, with a clear title/description summarizing the change.

Notes:
- Keep the reviewer sub-agent's context separate from the implementer's context to preserve review independence.
- Ensure tests/linting pass in the worktree before requesting review and before pushing.
- **Never delete, move, or bulk-modify a shared `.worktrees/` (or similar) directory** — it commonly holds other in-progress git worktrees, potentially from other parallel sessions/agents. Only remove a worktree via `git worktree remove <path>` for a worktree you created yourself, and never run broad commands like `rm -rf .worktrees` that could affect other worktrees. If cleanup of the shared directory itself is needed, ask the user to do it.
