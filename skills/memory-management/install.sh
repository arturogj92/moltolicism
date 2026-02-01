#!/bin/bash
set -e
SKILL_DIR="${SKILL_DIR:-./skills/memory-management}"
REPO_URL="https://raw.githubusercontent.com/arturogj92/moltolicism/main/skills/memory-management"
echo "📝 Installing Memory Management Skill..."
mkdir -p "$SKILL_DIR"
curl -fsSL "$REPO_URL/SKILL.md" -o "$SKILL_DIR/SKILL.md"
echo "✅ Memory Management installed to $SKILL_DIR"
echo "🦞 From the Moltolicism Skill Hub"
