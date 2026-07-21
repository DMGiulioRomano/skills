---
name: gdrive-sync
description: Download files from Google Drive into the current local project. Files on Drive are organized under ClaudeCode/<github-owner>/<repo-name>/ mirroring the local structure. Use when user wants to sync, download, or pull large binary files (PDFs, audio, video, datasets) from Google Drive that are gitignored locally. Trigger: /gdrive-sync.
---

# gdrive-sync

Downloads files from Google Drive into the current project. Drive layout mirrors local: `ClaudeCode/<owner>/<repo>/`.

## Prerequisites

### rclone installed?

```bash
~/.local/bin/rclone version || rclone version
```

If missing, install to `~/.local/bin`:

```bash
mkdir -p ~/.local/bin
cd /tmp && curl -sO https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip -q rclone-current-linux-amd64.zip
cp rclone-*/rclone ~/.local/bin/ && chmod +x ~/.local/bin/rclone
```

### `gdrive` remote configured?

```bash
~/.local/bin/rclone listremotes | grep gdrive
```

If missing, run `~/.local/bin/rclone config`, create a new remote named `gdrive`, type `drive`, leave client id/secret empty, scope `1` (full), auto-config `y` → authenticate in browser with the target Google account.

## Workflow

### 1. Detect repo owner + name

```bash
git remote get-url origin
```

Parse result:
- SSH: `git@github.com:owner/repo.git` → owner=`owner`, repo=`repo`
- HTTPS: `https://github.com/owner/repo.git` → owner=`owner`, repo=`repo`

### 2. List available folders on Drive

```bash
~/.local/bin/rclone lsf "gdrive:ClaudeCode/<owner>/<repo>/"
```

Show the user what folders/files are available.

### 3. Ask user

Ask which folders to download and where to place them locally (default: same relative path from repo root).

### 4. Download

```bash
~/.local/bin/rclone copy "gdrive:ClaudeCode/<owner>/<repo>/<folder>/" /local/path/ --progress
```

Run once per selected folder.

### 5. Report

Report total files transferred per folder.

## Notes

- Large files (PDFs, audio, video) are typically gitignored — check `.gitignore` to confirm.
- rclone skips files already present and identical (content-addressed).
- If Drive folder path differs from expected, list parent: `rclone lsf "gdrive:ClaudeCode/"` to explore.
