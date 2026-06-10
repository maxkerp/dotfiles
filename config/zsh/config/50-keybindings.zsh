# Use emacs/readline cli keybindings
bindkey -e

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# TODO: Find a good keybind
# function _append_less () {
#     BUFFER="$BUFFER | $PAGER"
#     zle .accept-line
# }
# 
# zle -N _append_less
# bindkey '^[l' _append_less
