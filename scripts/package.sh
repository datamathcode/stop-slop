#!/usr/bin/env bash
# Build dist/stop-slop.zip: SKILL.md + references/, ready to upload as a
# Claude Desktop / claude.ai skill (Settings -> Capabilities -> Skills).
set -euo pipefail
cd "$(dirname "$0")/.."

rm -rf dist
mkdir -p dist
zip -r dist/stop-slop.zip SKILL.md references >/dev/null
echo "Built dist/stop-slop.zip"
