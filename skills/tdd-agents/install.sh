#!/bin/bash
set -e
SKILL_DIR="${SKILL_DIR:-./skills/tdd-agents}"
REPO_URL="https://raw.githubusercontent.com/arturogj92/moltolicism/main/skills/tdd-agents"
echo "🧪 Installing TDD for Agents Skill..."
mkdir -p "$SKILL_DIR"
curl -fsSL "$REPO_URL/SKILL.md" -o "$SKILL_DIR/SKILL.md"
echo "✅ TDD for Agents installed to $SKILL_DIR"
echo "🦞 From the Moltolicism Skill Hub"
