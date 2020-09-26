# load our own completion functions
fpath=(~/.zsh/completion /usr/local/share/zsh/site-functions $fpath)


# FIXME This is adding about 300ms to the startup time so lets not do this for
# now and try to fix it

# completion; use cache if updated within 24h
# autoload -Uz compinit
# if [[ -n $HOME/.zcompdump ]]; then
#   compinit -d $HOME/.zcompdump;
# else
#   compinit -C;
# fi;

# disable zsh bundled function mtools command mcd
# which causes a conflict.
compdef -d mcd
