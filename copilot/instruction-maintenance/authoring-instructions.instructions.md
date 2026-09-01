---
type: Convention
title: Authoring Instruction Concepts
description: How to add, change, or retire an instruction concept in this OKF bundle
tags: [instruction-maintenance, okf, metadata, discovery]
status: stable
applyTo: "**/*.instructions.md,**/AGENTS.md,**/CLAUDE.md,**/GEMINI.md,**/copilot-instructions.md,**/copilot/index.md,**/copilot/*/index.md"
---

# Authoring Instruction Concepts

**TL;DR:** one concept per file, treat its path as permanent, scope `applyTo`
to the files the rules govern, deprecate rather than delete, and — inside this
bundle — carry OKF metadata, update the indexes in the same change, and
validate both OKF conformance and Copilot discovery before committing.

Applies when adding, editing, moving, or retiring an agent instruction file.

## Any instruction file

- One concept per file: a single convention, process, or review lens. When a
  file grows a second unrelated subject, split it instead of appending.
- Treat the file's path as permanent, because other files, notes, and links
  refer to it. If a move is unavoidable, update every link pointing at the old
  path in the same change.
- Keep the filename the consuming tool discovers — `*.instructions.md` for
  Copilot custom instruction directories, or the fixed name the tool expects
  (`AGENTS.md`, `copilot-instructions.md`) — and keep it under a directory the
  tool scans.
- Give every `*.instructions.md` file an `applyTo` glob selecting the files its
  rules govern. Use `"**"` only for rules that genuinely apply to every task;
  scope anything narrower so unrelated tasks are not burdened. Prefer patterns
  anchored on filenames over patterns anchored on a directory name, which also
  match unrelated files that happen to live under that name. Fixed-name formats
  have no scoping key, so restrict them to rules that hold repository-wide.
- Link to other instruction files with relative markdown links, not bare
  filenames, so the reference resolves for a reader who follows it.
- Retire a rule by marking it deprecated and naming its replacement, rather
  than deleting the file, whenever anything may still link to its path. Delete
  only once no link remains.
- Preserve frontmatter keys you do not recognize; another consumer may rely on
  them.
- Never fabricate provenance or trust metadata. Omit fields such as `sources`,
  `generated`, `verified`, and `stale_after` rather than inventing actors,
  citations, or timestamps.

## Inside this bundle

`$HOME/.config/copilot` is an [Open Knowledge Format v0.2](https://github.com/GoogleCloudPlatform/knowledge-catalog/blob/main/okf/SPEC.md)
knowledge bundle, so concepts here additionally:

- Carry a non-empty `type`: `Convention` for normative rules an artifact must
  satisfy, or `Process` for ordered steps to follow. Keep the vocabulary
  orthogonal to subject matter; subject lives in the path and `tags`. Introduce
  a third value only when neither fits.
- Carry `title`, `tags`, `description`, and `status`. Write `description` as one
  sentence summarizing what the concept governs, and reuse it verbatim as the
  concept's index entry. Set `status` to `draft`, `stable`, or `deprecated`, and
  leave a `draft` rule out of the required set until
  [improving instructions after a missed issue](improving-instructions.instructions.md)
  has validated it.
- Are identified by their bundle-relative path with the `.md` suffix removed, so
  a group directory and filename should still be accurate later.
- Are listed in their directory's `index.md` and, for a directory, in the root
  `index.md`; update both whenever a concept is added, moved, or retired.
- Leave `index.md` and `log.md` free of rules. They are OKF reserved filenames
  and Copilot never loads them.

## Validation

Before committing a change to the bundle, confirm:

- Every non-reserved `.md` file parses as YAML frontmatter plus body and carries
  a non-empty `type` and `applyTo`.
- Every index link resolves to a file that exists.
- Copilot still discovers the affected files, by running
  `copilot -p "Without using any tools, list the file paths of every custom
  instruction file loaded into your context."` and checking that the expected
  paths appear.
