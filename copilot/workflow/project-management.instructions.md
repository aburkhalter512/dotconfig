---
type: Process
title: Project Management
description: How to plan, sequence, and track long-running work with GitHub issues, milestones, and projects
tags: [workflow, planning, github-projects, tracking-issues]
status: stable
applyTo: "**"
---

# Project Management

Track any multi-step or long-running effort in GitHub issues, milestones, and projects rather than in ad-hoc documents, so its status and ownership stay visible to everyone working on it.

## Planning process (iterative research loop)

1. **Initial research session.** Run a research pass to produce a prototype plan: a rough breakdown of the project into sub-tasks.
2. **Sub-task research.** For each sub-task in the prototype plan, research it individually to confirm it is scoped and designed correctly (feasible, correctly bounded, dependencies identified).
3. **Report back to the orchestrator.** Each sub-task researcher reports its findings back to the orchestrating agent, which synthesizes the information and produces a revised plan.
4. **Repeat.** Continue the research → report → replan loop until the plan is likely to be accurate and complete for the work needed.

## Task graph and execution

- Once the plan is stable, break the project into a **DAG of tasks** capturing dependencies between them (not just a flat list).
- Create a tracking issue per task (linked to the relevant GitHub milestone/project), sized so it can be completed independently.
- Each task should be pickable by a separate agent that has **minimal context** about the overall project — the issue itself must contain enough detail (goal, constraints, dependencies, acceptance criteria) for that agent to complete it independently.
- Only start a task once its dependencies (per the DAG) are complete.

## Issue hygiene

- Post comments on each task issue to capture: open questions, answers to those questions, and general progress updates as work proceeds.
- Keep issue status (and the GitHub Project board/milestone) up to date as tasks move through states (not started, in progress, blocked, done).
- When a task uncovers new work or re-scoping, reflect that back into the DAG/plan (new issues, updated dependencies) rather than silently expanding scope within the existing issue.
