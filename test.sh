#!/usr/bin/env bash
# Self-check di sync-links.sh e link-skill.sh su una HOME finta, cosi' non
# tocca ~/.claude reale. Esegui: ./test.sh
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
export HOME="$TMP"
DST="$TMP/.claude/skills"

fail() { echo "FAIL: $1" >&2; exit 1; }

first_non_core() {
    for d in "$REPO_DIR/.claude/skills"/*/; do
        n="$(basename "$d")"
        grep -qxF "$n" <(sed -e 's/#.*//' -e 's/[[:space:]]//g' "$REPO_DIR/core.txt" | grep -v '^$') || { echo "$n"; return; }
    done
}
CORE1="$(sed -e 's/#.*//' -e 's/[[:space:]]//g' "$REPO_DIR/core.txt" | grep -v '^$' | head -1)"
VAULT1="$(first_non_core)"
[[ -n "$CORE1" && -n "$VAULT1" ]] || fail "servono almeno una skill core e una nel vault"

bash "$REPO_DIR/sync-links.sh" >/dev/null
[[ -L "$DST/$CORE1" ]] || fail "sync non ha linkato la core '$CORE1'"
[[ ! -e "$DST/$VAULT1" ]] || fail "sync ha linkato '$VAULT1', che non e' core"

bash "$REPO_DIR/link-skill.sh" "$VAULT1" >/dev/null
[[ -L "$DST/$VAULT1" ]] || fail "link-skill non ha attivato '$VAULT1'"

# un sync normale non deve disfare un'attivazione deliberata
bash "$REPO_DIR/sync-links.sh" >/dev/null
[[ -L "$DST/$VAULT1" ]] || fail "sync ha disattivato '$VAULT1' (deve farlo solo --prune)"

bash "$REPO_DIR/sync-links.sh" --prune >/dev/null
[[ ! -e "$DST/$VAULT1" ]] || fail "--prune non ha rimosso '$VAULT1'"
[[ -L "$DST/$CORE1" ]] || fail "--prune ha rimosso la core '$CORE1'"

bash "$REPO_DIR/link-skill.sh" "$VAULT1" >/dev/null
bash "$REPO_DIR/link-skill.sh" -r "$VAULT1" >/dev/null
[[ ! -e "$DST/$VAULT1" ]] || fail "-r non ha disattivato '$VAULT1'"

# skill inesistente: deve fallire, non creare un link rotto
if bash "$REPO_DIR/link-skill.sh" __nonesiste__ >/dev/null 2>&1; then
    fail "link-skill ha accettato un nome inesistente"
fi

# symlink rotto verso il repo: va rimosso
ln -s "$REPO_DIR/.claude/skills/__cancellata__" "$DST/__cancellata__"
bash "$REPO_DIR/sync-links.sh" >/dev/null
[[ ! -L "$DST/__cancellata__" ]] || fail "symlink rotto non rimosso"

# file reale con lo stesso nome: non va sovrascritto
echo locale > "$DST/$VAULT1"
if bash "$REPO_DIR/link-skill.sh" "$VAULT1" >/dev/null 2>&1; then
    fail "link-skill ha sovrascritto un file reale"
fi
[[ "$(cat "$DST/$VAULT1")" == "locale" ]] || fail "file reale alterato"

echo "OK: tutti i check passano (core='$CORE1', vault='$VAULT1')"
