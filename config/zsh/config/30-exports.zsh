# Dotfiles root (overridable via env before sourcing)
export DOTFILES_ROOT_DIR="${DOTFILES_ROOT_DIR:-$HOME/Git/dotfiles}"
export ZSHARE="$DOTFILES_ROOT_DIR/share/zsh"

# Dotfiles scripts on PATH (avoids rcm linking each file in local/bin)
export PATH="$DOTFILES_ROOT_DIR/local/bin:$PATH"

export VISUAL=nvim
export EDITOR=$VISUAL
export PAGER=bat

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1

# Use nvim for manpages
export MANPAGER='nvim +Man!'

export GIT_FUZZY_BRANCH_WORKING_COPY_KEY="Ctrl-T"
export GIT_FUZZY_LOG_WORKING_COPY_KEY="Ctrl-T"
export GIT_FUZZY_REFLOG_WORKING_COPY_KEY="Ctrl-T"

# Carapace bridges: borrow completions from other shells as fallback
export CARAPACE_BRIDGES='zsh,fish,bash'

# Tinted-shell: emit BASE16_COLOR_{00..0F}_HEX env vars when sourced
export TINTED_SHELL_ENABLE_BASE16_VARS=1
export TINTED_SHELL_ENABLE_BASE16_VARS=1
export TINTED_SHELL_ENABLE_BASE24_VARS=1
export TINTED_SHELL_ENABLE_TINDET8_VARS=1


export TINTED_TMUX_OPTION_ACTIVE=1
export TINTED_TMUX_OPTION_STATUSBAR=1
