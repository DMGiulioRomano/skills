#!/usr/bin/env bash
# Run once after cloning. Syncs symlinks and installs git hooks.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOKS_DIR="$REPO_DIR/.git/hooks"
SYNC_SCRIPT="$REPO_DIR/sync-links.sh"

chmod +x "$SYNC_SCRIPT"

# Sync symlinks immediately
bash "$SYNC_SCRIPT"

# Install git hooks
for hook in post-merge post-checkout; do
    hook_file="$HOOKS_DIR/$hook"
    if [[ ! -f "$hook_file" ]]; then
        cat > "$hook_file" <<EOF
#!/usr/bin/env bash
bash "$SYNC_SCRIPT"
EOF
        chmod +x "$hook_file"
        echo "Installed hook: $hook"
    else
        echo "Hook already exists (skipped): $hook"
    fi
done

echo "Done."
