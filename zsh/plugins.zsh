# Optional plugins. Missing plugins are skipped, so the base setup remains portable.

if (( ! $+functions[_zsh_autosuggest_start] )); then
    for plugin in \
        /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
        /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh \
        /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    do
        if [[ -r "$plugin" ]]; then
            source "$plugin"
            break
        fi
    done
fi

# Syntax highlighting should be loaded after other interactive Zsh configuration.
if (( ! $+functions[_zsh_highlight] )); then
    for plugin in \
        /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
        /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    do
        if [[ -r "$plugin" ]]; then
            source "$plugin"
            break
        fi
    done
fi
