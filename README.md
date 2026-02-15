# Cursor Theme VS Code

Minimal VS Code theme extension containing:

- `Cursor Dark`
- `Cursor Dark Midnight`
- `Cursor Light`

## Local package

```bash
npx @vscode/vsce package --out dist/cursor-theme.vsix
```

## Install local VSIX

```bash
code --install-extension dist/cursor-theme.vsix --force
```

## GitHub release

Workflow: `.github/workflows/release.yml`

- Trigger on tag push `v*`
- Uploads `cursor-theme.vsix` to GitHub Releases

## Install from latest release

```bash
./scripts/install-theme.sh <owner> <repo>
```

```bat
scripts\install-theme.bat <owner> <repo>
```

Both scripts download from:

`https://github.com/<owner>/<repo>/releases/latest/download/cursor-theme.vsix`
