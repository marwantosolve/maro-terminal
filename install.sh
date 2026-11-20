#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${HOME}/.config/maro-terminal"
ZSHRC="${HOME}/.zshrc"
SOURCE_LINE='[[ -f "$HOME/.config/maro-terminal/init.zsh" ]] && source "$HOME/.config/maro-terminal/init.zsh"'

if ! command -v zsh >/dev/null 2>&1; then
    printf 'Error: zsh is not installed. Install zsh first.\n' >&2
    exit 1
fi

mkdir -p "${HOME}/.config"

if [[ -f "$ZSHRC" ]]; then
    BACKUP="${ZSHRC}.backup.$(date +%Y%m%d-%H%M%S)"
    cp -p "$ZSHRC" "$BACKUP"
    printf 'Backed up existing .zshrc to: %s\n' "$BACKUP"
else
    touch "$ZSHRC"
fi

mkdir -p "$CONFIG_DIR"
cp -R "${REPO_DIR}/zsh/." "$CONFIG_DIR/"

if ! grep -Fq '# MARO TERMINAL CONFIG' "$ZSHRC"; then
    {
        printf '\n# MARO TERMINAL CONFIG\n'
        printf '%s\n' "$SOURCE_LINE"
    } >> "$ZSHRC"
fi

printf '\nInstalled maro-terminal configuration.\n'
printf 'Start it now with: exec zsh\n'
