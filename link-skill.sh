#!/usr/bin/env bash
# Attiva/disattiva on-demand una skill del vault.
# Il caricamento e' a caldo: la skill e' invocabile subito, senza riavviare
# la sessione (verificato). Uso:
#   ./link-skill.sh <nome>          attiva
#   ./link-skill.sh -r <nome>       disattiva
#   ./link-skill.sh -l              elenca vault e stato
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$REPO_DIR/.claude/skills"
SKILLS_DST="$HOME/.claude/skills"

if [[ "${1:-}" == "-l" ]]; then
    for d in "$SKILLS_SRC"/*/; do
        name="$(basename "$d")"
        [[ -L "$SKILLS_DST/$name" ]] && echo "  [attiva] $name" || echo "  [vault]  $name"
    done
    exit 0
fi

remove=0
if [[ "${1:-}" == "-r" ]]; then
    remove=1
    shift
fi

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 [-r] <nome-skill> | $0 -l" >&2
    exit 1
fi

name="$1"
src="$SKILLS_SRC/$name"
dst="$SKILLS_DST/$name"

if [[ $remove -eq 1 ]]; then
    if [[ -L "$dst" ]]; then
        rm "$dst"
        echo "Disattivata: $name"
    else
        echo "Non era attiva: $name"
    fi
    exit 0
fi

if [[ ! -d "$src" ]]; then
    echo "Errore: '$name' non esiste nel vault. Elenco: $0 -l" >&2
    exit 1
fi

# Un file reale con quel nome non va sovrascritto: e' config locale.
if [[ -e "$dst" && ! -L "$dst" ]]; then
    echo "Errore: $dst esiste e non e' un symlink. Non lo tocco." >&2
    exit 1
fi

ln -sfn "$src/" "$dst"
echo "Attivata: $name (invocabile subito)"
