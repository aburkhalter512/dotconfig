---
type: Process
title: Improving Instructions After a Missed Issue
description: How to turn an issue that review missed into a validated, generic instruction
tags: [instruction-maintenance, review-lenses, evaluation]
status: stable
applyTo: "**"
---

# Improving Instructions After a Missed Issue

When any instruction file (code review, testing, error handling, etc.) fails to catch a real issue — a bug or design flaw is only found/fixed later, e.g. during a manual refactor or a later round of feedback — capture a new generic rule so the same class of issue is caught next time, rather than only fixing the one instance.

1. **Generalize the miss.** State the issue in generic terms that don't reference the specific code changed (e.g. "the same conditional decision is re-implemented at multiple call sites" rather than "the import branch in `SomeSpecificType` is duplicated").
2. **Draft 2-3 candidate instructions.** Phrase each as a standalone, generic criterion an agent could apply to any file, independent of the code that originally exposed the gap.
3. **Pre-register the evaluation.** Record the target failure mode, expected evidence, scoring rubric, case-selection rule, candidate lenses, confirmatory endpoints, minimum target-hit improvement, maximum false-positive count, and run count before running reviewers. Require at least three runs per condition and a target-hit improvement spanning at least two runs. Treat misses used to draft a lens as training cases and reserve at least one separate miss as a held-out case.
4. **Validate against controls.** Create a git worktree per candidate at the commit before the fix. Run an unchanged baseline, each candidate, and at least one non-matching lens with identical minimal file context and no rationale or hint about the known issue. Use the pre-registered run count for every condition.
5. **Isolate diagnostic evidence.** Supply runtime failures, generated plans, or other diagnostic artifacts only to a condition designed to evaluate artifact reconciliation, or test artifact-present and artifact-absent conditions separately.
6. **Measure finding quality and cost.** Run promising candidates against the post-fix state and a case where that failure mode is absent. In every condition, classify findings as target-relevant, valid but off-target, or false positive. Report reviewer cost when available and do not attribute off-target findings to a lens without a baseline comparison.
7. **Test held-out generalization.** Refine promising instructions, then test each reserved case with the unchanged baseline and candidate using the pre-registered run count; add a non-matching condition when practical. Adopt only instructions that meet the pre-registered target-hit improvement and false-positive limits on held-out cases without duplicating an existing lens.
8. **Adopt the best-performing instruction(s)** into the relevant instructions file and clean up only the experiment worktrees created for the study (`git worktree remove <path>`).
