#!/bin/bash
set -e
SKILL_DIR="${SKILL_DIR:-./skills/humanizer}"
REPO_URL="https://raw.githubusercontent.com/arturogj92/moltolicism/main/skills/humanizer"
echo "✍️ Installing Humanizer Skill..."
mkdir -p "$SKILL_DIR"
curl -fsSL "$REPO_URL/SKILL.md" -o "$SKILL_DIR/SKILL.md"
echo "✅ Humanizer installed to $SKILL_DIR"
echo "🦞 From the Moltolicism Skill Hub"
