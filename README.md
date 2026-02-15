# Cursor Theme VS Code

Themes:
- `Cursor Dark`
- `Cursor Dark Midnight`
- `Cursor Light`

## Install from latest release

Linux/macOS (`curl`):

```bash
curl -fsSL https://raw.githubusercontent.com/udit-001/cursor-theme-vscode/main/scripts/install-theme.sh | bash -s -- udit-001 cursor-theme-vscode
```

Linux/macOS (`wget`):

```bash
wget -qO- https://raw.githubusercontent.com/udit-001/cursor-theme-vscode/main/scripts/install-theme.sh | bash -s -- udit-001 cursor-theme-vscode
```

Windows (CMD):

```cmd
curl -fL "https://raw.githubusercontent.com/udit-001/cursor-theme-vscode/main/scripts/install-theme.cmd" -o "%TEMP%\\install-theme.cmd" && "%TEMP%\\install-theme.cmd" udit-001 cursor-theme-vscode
```

## Build VSIX locally

```bash
npx @vscode/vsce package --out dist/cursor-theme.vsix
```

## Releases

Push a tag like `v0.0.2` to trigger `.github/workflows/release.yml` and upload `cursor-theme.vsix`.
