bindkey -e

maro-select() {
    (( REGION_ACTIVE )) || zle set-mark-command
    zle "$1"
}

maro-deselect() {
    REGION_ACTIVE=0
    zle "$1"
}

maro-shift-left()  { maro-select backward-char }
maro-shift-right() { maro-select forward-char }
maro-shift-home()  { maro-select beginning-of-line }
maro-shift-end()   { maro-select end-of-line }

maro-shift-ctrl-left()  { maro-select beginning-of-line }
maro-shift-ctrl-right() { maro-select end-of-line }

maro-ctrl-left()  { maro-deselect backward-word }
maro-ctrl-right() { maro-deselect forward-word }

maro-left()  { maro-deselect backward-char }
maro-right() { maro-deselect forward-char }

maro-backspace() {
    if (( REGION_ACTIVE )); then
        zle kill-region
    else
        zle backward-delete-char
    fi
}

maro-delete() {
    if (( REGION_ACTIVE )); then
        zle kill-region
    else
        zle delete-char
    fi
}

for widget in \
    maro-shift-left maro-shift-right \
    maro-shift-home maro-shift-end \
    maro-shift-ctrl-left maro-shift-ctrl-right \
    maro-ctrl-left maro-ctrl-right \
    maro-left maro-right maro-backspace maro-delete
do
    zle -N "$widget"
done

bindkey '\e[1;2D' maro-shift-left
bindkey '\e[1;2C' maro-shift-right
bindkey '\e[1;2H' maro-shift-home
bindkey '\e[1;2F' maro-shift-end

bindkey '\e[1;6D' maro-shift-ctrl-left
bindkey '\e[1;6C' maro-shift-ctrl-right

bindkey '\e[1;5D' maro-ctrl-left
bindkey '\e[1;5C' maro-ctrl-right

bindkey '\e[D' maro-left
bindkey '\e[C' maro-right

bindkey '^?' maro-backspace
bindkey '\e[3~' maro-delete

zle_highlight+=(region:standout)
