# Use emacs/readline cli keybindings
bindkey -e

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-z\C-e' edit-command-line
