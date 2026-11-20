# Username, current directory, and Git branch.
# No success/failure glyph: command errors remain in command output.
autoload -Uz vcs_info add-zsh-hook
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:git:*' formats ' %F{yellow}(%b)%f'
setopt PROMPT_SUBST

PROMPT='%F{cyan}%n%f %F{blue}%~%f${vcs_info_msg_0_} %F{green}❯%f '
