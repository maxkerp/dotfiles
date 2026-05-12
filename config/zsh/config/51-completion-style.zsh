# Enable menu-style completion navigable with arrow keys, Ctrl-P, Ctrl-N
zstyle ':completion:*' menu select

# Dim group descriptions in the completion menu
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
