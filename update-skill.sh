#!/usr/bin/env bash
# Aggiorna una skill scaricando i file dal repo upstream e aggiornando il SHA.
# Uso: ./update-skill.sh <nome-skill>
set -euo pipefail

GH="$(command -v gh || echo /opt/homebrew/bin/gh)"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$REPO_DIR/.claude/skills"

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 <nome-skill>"
    exit 1
fi

skill_name="$1"
skill_dir="$SKILLS_SRC/$skill_name"
source_file="$skill_dir/.source.json"

if [[ ! -f "$source_file" ]]; then
    echo "Errore: $skill_dir non esiste o non ha un .source.json"
    exit 1
fi

repo="$(jq -r '.repo' "$source_file")"
path="$(jq -r '.path' "$source_file")"

echo "Aggiornamento $skill_name da $repo/$path ..."

# Scarica la lista aggiornata dei file nel path
files="$($GH api "repos/$repo/git/trees/main?recursive=1" --jq ".tree[] | select(.path | startswith(\"$path/\")) | select(.type == \"blob\") | .path")"

if [[ -z "$files" ]]; then
    echo "Errore: nessun file trovato in $repo/$path"
    exit 1
fi

while IFS= read -r file_path; do
    filename="$(basename "$file_path")"
    # Salta .source.json se presente upstream (lo gestiamo noi)
    [[ "$filename" == ".source.json" ]] && continue

    $GH api "repos/$repo/contents/$file_path" --jq '.content' | base64 -d > "$skill_dir/$filename"
    echo "  aggiornato: $filename"
done <<< "$files"

# Aggiorna il SHA nel .source.json
new_sha="$($GH api "repos/$repo/commits?path=$path&per_page=1" --jq '.[0].sha')"
jq --arg sha "$new_sha" '.sha = $sha' "$source_file" > "$source_file.tmp" && mv "$source_file.tmp" "$source_file"
echo "SHA aggiornato: ${new_sha:0:8}"

echo ""
echo "Fatto. Esegui 'git add' e 'git commit' per salvare le modifiche."
