# load our own completion functions
fpath=(~/.zsh/completion /usr/local/share/zsh/site-functions $fpath)

# Not sure if this is actually working for me...
# export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# source ~/.local/opt/zsh-autosuggestions/zsh-autosuggestions.zsh

source <(fx --comp zsh)

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
source <(carapace _carapace)

zmodload zsh/complist
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*' menu yes select

# The normal hjkl keys are bound by tmux to move between panes.
# Those won't work for me. I'm not sure if I should try uiop or just stay with np and fb
# Another Ideas would be to try e/y just like with scrolling previews in bat/fzf
# bindkey -M menuselect '^u' backward-char
# bindkey -M menuselect '^i' down-line-or-history
# bindkey -M menuselect '^o' up-line-or-history
# bindkey -M menuselect '^p' forward-char
