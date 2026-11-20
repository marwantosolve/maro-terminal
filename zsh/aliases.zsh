# GNU ls aliases: colorize output and put directories first.
if ls --version >/dev/null 2>&1; then
    alias ls='ls --color=auto --group-directories-first'
    alias ll='ls -lah --color=auto --group-directories-first'
    alias la='ls -A --color=auto --group-directories-first'
else
    alias ll='ls -lah'
    alias la='ls -A'
fi
