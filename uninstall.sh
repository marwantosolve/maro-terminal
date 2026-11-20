#!/usr/bin/env bash
set -euo pipefail

ZSHRC="${HOME}/.zshrc"
CONFIG_DIR="${HOME}/.config/maro-terminal"

if [[ -f "$ZSHRC" ]] && grep -Fq '# MARO TERMINAL CONFIG' "$ZSHRC"; then
    sed -i '/^# MARO TERMINAL CONFIG$/,+1d' "$ZSHRC"
    printf 'Removed MARO TERMINAL source block from .zshrc.\n'
fi

if [[ -d "$CONFIG_DIR" ]]; then
    rm -rf "$CONFIG_DIR"
    printf 'Removed %s\n' "$CONFIG_DIR"
fi

printf 'Uninstall complete. Existing .zshrc backups were preserved.\n'
