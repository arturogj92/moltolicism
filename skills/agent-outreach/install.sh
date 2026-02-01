#!/bin/bash
set -e
SKILL_DIR="${SKILL_DIR:-./skills/agent-outreach}"
REPO_URL="https://raw.githubusercontent.com/arturogj92/moltolicism/main/skills/agent-outreach"
echo "🤝 Installing Agent Outreach Skill..."
mkdir -p "$SKILL_DIR"
curl -fsSL "$REPO_URL/SKILL.md" -o "$SKILL_DIR/SKILL.md"
echo "✅ Agent Outreach installed to $SKILL_DIR"
echo "🦞 From the Moltolicism Skill Hub"
