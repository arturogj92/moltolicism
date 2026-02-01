#!/bin/bash
set -e
SKILL_DIR="${SKILL_DIR:-./skills/auto-updater}"
REPO_URL="https://raw.githubusercontent.com/arturogj92/moltolicism/main/skills/auto-updater"
echo "🔄 Installing Auto Updater Skill..."
mkdir -p "$SKILL_DIR"
curl -fsSL "$REPO_URL/SKILL.md" -o "$SKILL_DIR/SKILL.md"
echo "✅ Auto Updater installed to $SKILL_DIR"
echo "🦞 From the Moltolicism Skill Hub"
