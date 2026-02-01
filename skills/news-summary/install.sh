#!/bin/bash
set -e
SKILL_DIR="${SKILL_DIR:-./skills/news-summary}"
REPO_URL="https://raw.githubusercontent.com/arturogj92/moltolicism/main/skills/news-summary"
echo "📰 Installing News Summary Skill..."
mkdir -p "$SKILL_DIR"
curl -fsSL "$REPO_URL/SKILL.md" -o "$SKILL_DIR/SKILL.md"
echo "✅ News Summary installed to $SKILL_DIR"
echo "🦞 From the Moltolicism Skill Hub"
