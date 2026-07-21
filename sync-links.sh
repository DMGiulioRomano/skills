#!/usr/bin/env bash
# Linka in ~/.claude/skills/ solo le skill elencate in core.txt.
# Le altre restano nel vault e si attivano on-demand con link-skill.sh.
# Rimuove i symlink rotti che puntano in questo repo (skill cancellate).
# Con --prune rimuove anche i link validi a skill NON core: serve per la
# migrazione una tantum, non nell'uso normale — un link on-demand attivato
# di proposito non va disfatto da un sync.
set -euo pipefail

PRUNE=0
[[ "${1:-}" == "--prune" ]] && PRUNE=1

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$REPO_DIR/vault"
SKILLS_DST="$HOME/.claude/skills"
CORE_FILE="$REPO_DIR/core.txt"

mkdir -p "$SKILLS_DST"

# core.txt -> lista, senza commenti e righe vuote
core_skills() {
    [[ -f "$CORE_FILE" ]] || return 0
    sed -e 's/#.*//' -e 's/[[:space:]]//g' "$CORE_FILE" | grep -v '^$' || true
}

is_core() {
    core_skills | grep -qxF "$1"
}

# Remove broken symlinks that point into this repo
for link in "$SKILLS_DST"/*; do
    if [[ -L "$link" && ! -e "$link" ]]; then
        target="$(readlink "$link")"
        # $REPO_DIR, non $SKILLS_SRC: così ripulisce anche i link a percorsi
        # vecchi dentro il repo (es. il precedente .claude/skills/)
        if [[ "$target" == "$REPO_DIR"* ]]; then
            echo "Removing broken symlink: $link"
            rm "$link"
        fi
    fi
done

# Con --prune: slinka le skill non-core ancora presenti (migrazione una tantum)
if [[ $PRUNE -eq 1 ]]; then
    for link in "$SKILLS_DST"/*; do
        [[ -L "$link" ]] || continue
        target="$(readlink "$link")"
        [[ "$target" == "$SKILLS_SRC"* ]] || continue
        name="$(basename "$link")"
        if ! is_core "$name"; then
            echo "Pruned (torna nel vault): $name"
            rm "$link"
        fi
    done
fi

# Linka le skill core mancanti
for skill_name in $(core_skills); do
    skill_dir="$SKILLS_SRC/$skill_name"
    target="$SKILLS_DST/$skill_name"
    if [[ ! -d "$skill_dir" ]]; then
        echo "Attenzione: core.txt elenca '$skill_name' ma non esiste nel vault" >&2
        continue
    fi
    if [[ ! -e "$target" && ! -L "$target" ]]; then
        ln -s "$skill_dir/" "$target"
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
