@echo off
setlocal enabledelayedexpansion

set "OWNER=%~1"
set "REPO=%~2"
set "ASSET_NAME=cursor-theme.vsix"

if "%OWNER%"=="" set "OWNER=%GITHUB_OWNER%"
if "%REPO%"=="" set "REPO=%GITHUB_REPO%"

if "%OWNER%"=="" goto :usage
if "%REPO%"=="" goto :usage

echo Downloading latest VSIX from github.com...
set "URL=https://github.com/%OWNER%/%REPO%/releases/latest/download/%ASSET_NAME%"
set "TMP_VSIX=%TEMP%\%REPO%-theme.vsix"

powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -UseBasicParsing -Uri '%URL%' -OutFile '%TMP_VSIX%'"
if errorlevel 1 (
  echo Failed to download VSIX from %URL%
  exit /b 1
)

where code >nul 2>nul
if %errorlevel%==0 (
  code --install-extension "%TMP_VSIX%" --force
  if errorlevel 1 (
    echo VS Code CLI install failed.
    exit /b 1
  )
  echo Installed via VS Code CLI.
) else (
  echo VS Code CLI not found in PATH.
  echo Install manually with: Extensions ^> ... ^> Install from VSIX...
  echo VSIX path: %TMP_VSIX%
)

echo Done.
exit /b 0

:usage
echo Usage: install-theme.bat ^<github-owner^> ^<github-repo^>
echo Or set GITHUB_OWNER and GITHUB_REPO environment variables.
exit /b 1
