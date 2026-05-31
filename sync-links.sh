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

# --- Config deliberata: CLAUDE.md globale e regole modulari ---
# Propaga il layer scritto a mano (non la auto memory, che resta locale).
CONFIG_SRC="$REPO_DIR/.claude"
CONFIG_DST="$HOME/.claude"
RULES_SRC="$CONFIG_SRC/rules"
RULES_DST="$CONFIG_DST/rules"

# CLAUDE.md globale: ln -sfn è idempotente e forza la sostituzione di un symlink
# esistente. Se c'è un file REALE (non-symlink), ne facciamo backup per non
# distruggere config locale preesistente.
if [[ -f "$CONFIG_SRC/CLAUDE.md" ]]; then
    if [[ -f "$CONFIG_DST/CLAUDE.md" && ! -L "$CONFIG_DST/CLAUDE.md" ]]; then
        mv "$CONFIG_DST/CLAUDE.md" "$CONFIG_DST/CLAUDE.md.bak"
        echo "Backed up existing CLAUDE.md -> $CONFIG_DST/CLAUDE.md.bak"
    fi
    ln -sfn "$CONFIG_SRC/CLAUDE.md" "$CONFIG_DST/CLAUDE.md"
    echo "Linked: $CONFIG_DST/CLAUDE.md"
fi

# Regole modulari: symlink per-file, così eventuali regole locali per-macchina
# possono convivere in ~/.claude/rules/ senza essere toccate.
if [[ -d "$RULES_SRC" ]]; then
    mkdir -p "$RULES_DST"

    # Remove broken symlinks that point into this repo (deleted rules)
    for link in "$RULES_DST"/*; do
        if [[ -L "$link" && ! -e "$link" ]]; then
            target="$(readlink "$link")"
            if [[ "$target" == "$RULES_SRC"* ]]; then
                echo "Removing broken symlink: $link"
                rm "$link"
            fi
        fi
    done

    for rule_file in "$RULES_SRC"/*.md; do
        [[ -e "$rule_file" ]] || continue
        rule_name="$(basename "$rule_file")"
        target="$RULES_DST/$rule_name"
        if [[ -f "$target" && ! -L "$target" ]]; then
            mv "$target" "$target.bak"
            echo "Backed up existing rule -> $target.bak"
        fi
        ln -sfn "$rule_file" "$target"
        echo "Linked: $target"
    done
fi
