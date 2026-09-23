# Changelog

## 2026-09-23

### Changed

- Removed nonstandard `metadata` block from SKILL.md frontmatter (`trigger`, `author`) — Claude Code only reads `name`/`description` to trigger a skill, and `author` duplicated the README's Author section.
- Added `scripts/package.sh` to build `dist/stop-slop.zip` (SKILL.md + references/ only) for uploading as a Claude Desktop / claude.ai skill.
- Rewrote README Quick Start with concrete install paths for Claude Code (`~/.claude/skills/stop-slop` personal, or `.claude/skills/stop-slop` project-scoped) and Claude Desktop.
- Added CLAUDE.md documenting the skill's file responsibilities and distribution surfaces for future contributors.

## 2026-01-13

### Added

**Phrases (references/phrases.md)**
- Throat-clearing: "Here's what I find interesting", "Here's the problem though"
- Performative emphasis: "creeps in", "I promise", "They exist, I promise"
- Telling instead of showing: "This is genuinely hard", "This is what leadership actually looks like"

**Structures (references/structures.md)**
- Binary contrasts: "Not X. But Y.", "It's not this. It's that.", "stops being X and starts being Y"
- Rhythm patterns: staccato fragmentation, dashes for dramatic pause, hedging as reassurance
- Word patterns: absolute words (always, never, everyone, etc.), AI-overused intensifiers (deeply, truly, fundamentally, inherently, simply, literally, inevitably)

## 2026-01-12

- Restructured skill following Claude Code best practices (PR #1)
- Split into SKILL.md and references/ folder

## 2025-01-12

- Initial release
