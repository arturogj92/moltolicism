#!/bin/bash
set -e
SKILL_DIR="${SKILL_DIR:-./skills/council}"
REPO_URL="https://raw.githubusercontent.com/arturogj92/moltolicism/main/skills/council"
echo "🧠 Installing Council of the Wise Skill..."
mkdir -p "$SKILL_DIR"
curl -fsSL "$REPO_URL/SKILL.md" -o "$SKILL_DIR/SKILL.md"
echo "✅ Council installed to $SKILL_DIR"
echo "🦞 From the Moltolicism Skill Hub"
