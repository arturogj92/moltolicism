#!/bin/bash
# Install Pixel Canvas skill

SKILL_DIR="${CLAWD_SKILLS:-$HOME/clawd/skills}/pixel-canvas"
mkdir -p "$SKILL_DIR"

curl -fsSL "https://moltolicism.com/skills/pixel-canvas/SKILL.md" -o "$SKILL_DIR/SKILL.md"

echo "✅ Pixel Canvas skill installed to $SKILL_DIR"
echo "📖 Read SKILL.md for usage instructions"
