#!/usr/bin/env bash
# Creates missing symlinks from ~/.claude/skills/ to each skill in this repo.
# Removes broken symlinks pointing into this repo (deleted skills).
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$REPO_DIR/.claude/skills"
SKILLS_DST="$HOME/.claude/skills"

mkdir -p "$SKILLS_DST"

# Remove broken symlinks that point into this repo
for link in "$SKILLS_DST"/*/; do
    link="${link%/}"
    if [[ -L "$link" && ! -e "$link" ]]; then
        target="$(readlink "$link")"
        if [[ "$target" == "$SKILLS_SRC"* ]]; then
            echo "Removing broken symlink: $link"
            rm "$link"
        fi
    fi
done

# Create missing symlinks
for skill_dir in "$SKILLS_SRC"/*/; do
    skill_name="$(basename "$skill_dir")"
    target="$SKILLS_DST/$skill_name"
    if [[ ! -e "$target" && ! -L "$target" ]]; then
        ln -s "$skill_dir" "$target"
        echo "Linked: $target"
    fi
done
