#!/usr/bin/env bash
# Genera CATALOG.md dai frontmatter delle skill nel vault.
# Generato, non scritto a mano: altrimenti diverge al primo update-skill.sh.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$REPO_DIR/vault"
OUT="$REPO_DIR/CATALOG.md"

# Description del frontmatter, appiattita su una riga.
desc_of() {
    awk '
        /^---[[:space:]]*$/ { d++; if (d == 2) exit; next }
        d == 1 && /^description:[[:space:]]*/ {
            sub(/^description:[[:space:]]*/, ""); buf = $0; grab = 1; next
        }
        d == 1 && grab && /^[a-zA-Z_-]+:/ { grab = 0 }
        d == 1 && grab { sub(/^[[:space:]]+/, " "); buf = buf $0 }
        END { print buf }
    ' "$1" |
        # scalari YAML folded/literal: 'description: >' lascia il marcatore
        sed -e 's/^[>|][-+0-9]*[[:space:]]*//' \
            -e 's/^["'"'"']//' -e 's/["'"'"']$//' \
            -e 's/[[:space:]]\{2,\}/ /g' -e 's/^[[:space:]]*//' |
        cut -c1-160
}

{
    echo "# Catalogo skill"
    echo
    echo "Generato da \`gen-catalog.sh\`. Non modificare a mano."
    echo
    echo "Attiva con \`./link-skill.sh <nome>\` — disponibile subito, senza riavvio."
    echo
    echo "Per sapere quali sono attive ora: \`./link-skill.sh -l\` (stato locale,"
    echo "non elencato qui per non sporcare il diff a ogni attivazione)."
    echo
    echo "| Skill | Cosa fa |"
    echo "|---|---|"
    for d in "$SKILLS_SRC"/*/; do
        name="$(basename "$d")"
        [[ -f "$d/SKILL.md" ]] || continue
        printf '| `%s` | %s |\n' "$name" "$(desc_of "$d/SKILL.md" | tr '|' '/')"
    done
} > "$OUT"

echo "Scritto: $OUT ($(grep -c '^| `' "$OUT") skill)"
