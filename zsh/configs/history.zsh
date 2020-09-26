setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
export HISTSIZE=150000
export SAVEHIST=100000

export ERL_AFLAGS="-kernel shell_history enabled"
