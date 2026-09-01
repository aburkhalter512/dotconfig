---
okf_version: "0.2"
---

# Copilot Instruction Bundle

* [Code Quality](code-quality/) - Conventions the code itself must follow
* [Workflow](workflow/) - How work moves from a request to an open pull request
* [Review](review/) - How changes are reviewed before they land
* [Instruction Maintenance](instruction-maintenance/) - How this bundle is written and improved

# Scope

* Personal, user-level guidance, loaded into every Copilot CLI session via
  `COPILOT_CUSTOM_INSTRUCTIONS_DIRS=$HOME/.config/copilot`.
* Repository-specific rules belong in that repository's `.github/instructions/`,
  not here.

# Conventions

* Concepts are `*.instructions.md` files, the suffix Copilot discovers
  recursively. `index.md` files are [OKF](https://github.com/GoogleCloudPlatform/knowledge-catalog/blob/main/okf/SPEC.md)
  directory listings that orient a reader; the binding rules live only in the
  concepts they link to, and each concept's `applyTo` decides when it binds.
* Change history lives in git, so this bundle has no `log.md`.
* Adding or changing a concept follows
  [authoring instruction concepts](instruction-maintenance/authoring-instructions.instructions.md).
