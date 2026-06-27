#!/usr/bin/env bash
# Controlla se le skill tracciate hanno aggiornamenti nel repo upstream.
# Ogni skill con un .source.json viene verificata tramite la GitHub API.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$REPO_DIR/.claude/skills"

has_updates=0

for skill_dir in "$SKILLS_SRC"/*/; do
    source_file="$skill_dir.source.json"
    [[ -f "$source_file" ]] || continue

    skill_name="$(basename "$skill_dir")"
    repo="$(jq -r '.repo' "$source_file")"
    path="$(jq -r '.path' "$source_file")"
    local_sha="$(jq -r '.sha' "$source_file")"

    upstream_sha="$(gh api "repos/$repo/commits?path=$path&per_page=1" --jq '.[0].sha' 2>/dev/null || true)"

    if [[ -z "$upstream_sha" ]]; then
        echo "[$skill_name] impossibile raggiungere $repo — salto"
        continue
    fi

    if [[ "$local_sha" == "$upstream_sha" ]]; then
        echo "[$skill_name] aggiornato ($repo)"
    else
        echo "[$skill_name] AGGIORNAMENTO DISPONIBILE"
        echo "  repo:     $repo"
        echo "  path:     $path"
        echo "  locale:   ${local_sha:0:8}"
        echo "  upstream: ${upstream_sha:0:8}"
        echo "  Esegui: ./update-skill.sh $skill_name"
        has_updates=1
    fi
done

exit $has_updates
