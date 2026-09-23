# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

This is a Claude Code **skill package**, not application code. It's pure Markdown: a set of writing rules that teach an LLM to detect and remove "AI tells" (throat-clearing, binary contrasts, passive voice, etc.) from prose. There is no build, lint, or test tooling — the only artifact is the rule content itself, and the only way to "test" a change is to apply the skill to sample text and check whether the output still reads as slop.

## Architecture: how the skill loads

This follows the standard Claude Code skill pattern of a thin entry point plus on-demand references, which matters when editing:

- **`SKILL.md`** is always loaded into context when the skill triggers. Its YAML frontmatter has exactly two fields — `name` and `description` — and `description` is the whole trigger: Claude Code reads it to decide *when* to activate the skill, so it must carry the invocation conditions itself, not defer them to a custom field. Below the frontmatter sits the condensed "Core Rules" and "Quick Checks" — short enough to keep resident.
- **`references/*.md`** are *not* auto-loaded. SKILL.md links to them (`See [references/phrases.md](references/phrases.md)`), and Claude pulls them in only when it needs the detail. This means:
  - SKILL.md should stay a compressed summary/index, not grow full pattern tables itself.
  - New patterns get their full detail (table row, "Instead:" fix) in the matching reference file, with at most a one-line pointer added to SKILL.md's Core Rules or Quick Checks if it's significant enough to always be resident.

## File responsibilities

- **`references/phrases.md`** — word/phrase-level bans: throat-clearing openers, emphasis crutches, business jargon (as an Avoid/Use-instead table).
- **`references/structures.md`** — sentence- and paragraph-level structural patterns (binary contrasts, negative listing, dramatic fragmentation, rhetorical setups, false agency, narrator-from-a-distance, passive voice, sentence starters, rhythm patterns, word patterns). Each pattern is a `| Pattern | Problem/Fix |` table row followed by an **Instead:** line stating the fix.
- **`references/examples.md`** — full before/after prose transformations with a **Changes:** line explaining what was cut and why. Add a new numbered example here whenever a reference file gains a pattern substantial enough to need one.
- **`README.md`** — user-facing overview and quick-start instructions for different Claude surfaces (Claude Code, Claude Desktop/claude.ai, Projects, custom instructions, API). Keep its "What it catches" summary in sync when references gain new categories.
- **`scripts/package.sh`** — builds `dist/stop-slop.zip` (SKILL.md + `references/` only) for uploading as a Claude Desktop / claude.ai skill. Run it after any content change meant to ship there; `dist/` is gitignored.
- **`CHANGELOG.md`** — dated entries grouped by which file changed (e.g. `**Phrases (references/phrases.md)**`, `**Structures (references/structures.md)**`), each a bullet list of the new patterns/phrases added.

## Distribution surfaces

- **Claude Code** loads this repo directly off disk — it needs to live at `~/.claude/skills/stop-slop/` (personal) or `<project>/.claude/skills/stop-slop/` (project-scoped), so a symlink back to this checkout is the usual setup. The directory name must match `name` in SKILL.md's frontmatter.
- **Claude Desktop / claude.ai** takes an uploaded zip (Settings → Capabilities → Skills), built by `scripts/package.sh`. It only needs `SKILL.md` and `references/` — repo meta files (README, LICENSE, CHANGELOG, this file) stay out of the archive.

## Conventions when adding a rule

1. Add the full pattern to the relevant `references/*.md` file, matching the existing table format (`Pattern | Problem` or `Pattern | Fix`) and always closing with an **Instead:** sentence.
2. If the pattern is common/severe enough to need a worked transformation, add a numbered example to `references/examples.md`.
3. Update `CHANGELOG.md` with a new dated entry (or add to today's if one exists), under a subheading naming the file that changed.
4. Only touch `SKILL.md` itself if the rule needs to be in the always-loaded Core Rules/Quick Checks — most new patterns just live in the references.
