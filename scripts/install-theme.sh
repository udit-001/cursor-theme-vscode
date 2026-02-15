#!/usr/bin/env bash
set -euo pipefail

OWNER="${1:-${GITHUB_OWNER:-}}"
REPO="${2:-${GITHUB_REPO:-}}"
ASSET_NAME="${ASSET_NAME:-cursor-theme.vsix}"

if [[ -z "$OWNER" || -z "$REPO" ]]; then
  echo "Usage: $0 <github-owner> <github-repo>"
  echo "Or set GITHUB_OWNER and GITHUB_REPO environment variables."
  exit 1
fi

URL="https://github.com/${OWNER}/${REPO}/releases/latest/download/${ASSET_NAME}"
TMP_VSIX="$(mktemp /tmp/${REPO}-XXXXXX.vsix)"

echo "Downloading: $URL"
if command -v curl >/dev/null 2>&1; then
  curl -fL "$URL" -o "$TMP_VSIX"
elif command -v wget >/dev/null 2>&1; then
  wget -O "$TMP_VSIX" "$URL"
else
  echo "Error: curl or wget is required."
  exit 1
fi

if command -v code >/dev/null 2>&1; then
  code --install-extension "$TMP_VSIX" --force
  echo "Installed via VS Code CLI."
else
  EXT_ROOT="${HOME}/.vscode/extensions"
  mkdir -p "$EXT_ROOT"
  TARGET_DIR="$EXT_ROOT/${REPO}-latest"
  rm -rf "$TARGET_DIR"
  mkdir -p "$TARGET_DIR"
  unzip -q "$TMP_VSIX" -d "$TARGET_DIR"
  echo "Installed by extracting to: $TARGET_DIR"
fi

echo "Done. Restart VS Code and choose the theme from Preferences: Color Theme."
