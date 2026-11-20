# GNU ls filename colors.
if command -v dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b)"
fi

LS_COLORS="${LS_COLORS:-}"
LS_COLORS+=":di=1;38;5;111:ln=1;38;5;116:ex=1;38;5;150"
LS_COLORS+=":*.py=38;5;114:*.ipynb=38;5;114"
LS_COLORS+=":*.js=38;5;221:*.ts=38;5;221"
LS_COLORS+=":*.json=38;5;179:*.yaml=38;5;179:*.yml=38;5;179"
LS_COLORS+=":*.md=38;5;117:*.txt=38;5;252:*.sh=38;5;150"
LS_COLORS+=":*.zip=38;5;203:*.tar=38;5;203:*.gz=38;5;203"
LS_COLORS+=":*.png=38;5;213:*.jpg=38;5;213:*.jpeg=38;5;213:*.svg=38;5;213"
export LS_COLORS
