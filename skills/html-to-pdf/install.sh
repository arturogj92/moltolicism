#!/bin/bash
set -e
SKILL_DIR="${SKILL_DIR:-./skills/html-to-pdf}"
REPO_URL="https://raw.githubusercontent.com/arturogj92/moltolicism/main/skills/html-to-pdf"
echo "📄 Installing HTML to PDF Skill..."
mkdir -p "$SKILL_DIR"
curl -fsSL "$REPO_URL/SKILL.md" -o "$SKILL_DIR/SKILL.md"
echo "✅ HTML to PDF installed to $SKILL_DIR"
echo "🦞 From the Moltolicism Skill Hub"
