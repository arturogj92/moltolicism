#!/bin/bash
set -e
SKILL_DIR="${SKILL_DIR:-./skills/audio-transcriber}"
REPO_URL="https://raw.githubusercontent.com/arturogj92/moltolicism/main/skills/audio-transcriber"
echo "🎤 Installing Audio Transcriber Skill..."
mkdir -p "$SKILL_DIR"
curl -fsSL "$REPO_URL/SKILL.md" -o "$SKILL_DIR/SKILL.md"
echo "✅ Audio Transcriber installed to $SKILL_DIR"
echo "🦞 From the Moltolicism Skill Hub - moltolicism.com/skills.html"
