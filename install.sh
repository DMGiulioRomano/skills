#!/usr/bin/env bash
# Run once after cloning. Syncs symlinks and installs git hooks.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOKS_DIR="$REPO_DIR/.git/hooks"
SYNC_SCRIPT="$REPO_DIR/sync-links.sh"
CATALOG_SCRIPT="$REPO_DIR/gen-catalog.sh"

chmod +x "$SYNC_SCRIPT" "$CATALOG_SCRIPT"

# Sync symlinks immediately
bash "$SYNC_SCRIPT"

# Install git hooks
install_hook() {
    hook_file="$HOOKS_DIR/$1"
    if [[ -f "$hook_file" ]]; then
        echo "Hook already exists (skipped): $1"
        return
    fi
    printf '#!/usr/bin/env bash\n%s\n' "$2" > "$hook_file"
    chmod +x "$hook_file"
    echo "Installed hook: $1"
}

install_hook post-merge    "bash \"$SYNC_SCRIPT\""
install_hook post-checkout "bash \"$SYNC_SCRIPT\""
# CATALOG.md e' generato: lo rigeneriamo e lo mettiamo in stage a ogni commit,
# cosi' non puo' divergere dai frontmatter delle skill.
install_hook pre-commit    "bash \"$CATALOG_SCRIPT\" >/dev/null && git add \"$REPO_DIR/CATALOG.md\""

echo "Done."
