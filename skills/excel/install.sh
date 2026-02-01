#!/bin/bash
set -e
SKILL_DIR="${SKILL_DIR:-./skills/excel}"
REPO_URL="https://raw.githubusercontent.com/arturogj92/moltolicism/main/skills/excel"
echo "📊 Installing Excel Manager Skill..."
mkdir -p "$SKILL_DIR"
curl -fsSL "$REPO_URL/SKILL.md" -o "$SKILL_DIR/SKILL.md"
echo "✅ Excel Manager installed to $SKILL_DIR"
echo "🦞 From the Moltolicism Skill Hub"
