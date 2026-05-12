# ── reload ─────────────────────────────────────────────────────────────────────
alias reload='exec zsh'

# ── navigation ─────────────────────────────────────────────────────────────────
alias ..='cd ..'
alias files='ls | grep -v /'
alias path='echo $PATH | tr -s ":" "\n"'

# ── ls (eza) ───────────────────────────────────────────────────────────────────
alias ls='eza --group-directories-first'
alias l='ls -1'
alias la='ls -1 -A'
alias ll='ls -l -A'

# ── safety / verbosity ─────────────────────────────────────────────────────────
alias ln='ln -iv'
alias rm='rm -Iv'
alias cp='cp -iv'
alias mkdir='mkdir -vp'
alias rmdir='rmdir -v'

# ── grep ───────────────────────────────────────────────────────────────────────
alias grep='grep --color'
alias ip='ip -color'

# ── editors ────────────────────────────────────────────────────────────────────
alias v="$VISUAL"
alias vi='v'
alias e="$EDITOR"
alias gopen='gnome-open'
alias open='xdg-open'

# ── git ────────────────────────────────────────────────────────────────────────
alias gs='git fuzzy status'
alias dh='git diff HEAD'
alias s='git status -s'
alias staged='git diff --staged'
alias unstaged='git diff'
alias u='git add -u'

# ── fzf helpers ────────────────────────────────────────────────────────────────
alias aptinfo='apt list --installed | fzf | cut -d'/' -f1 | xargs apt show'
alias br='git branch | grep -v '^\*' | fzf --reverse --height=40% | xargs git checkout'
alias tldrs='tldr -l | tr -s ", " "\n" | fzf --reverse --preview="tldr {}" --preview-window 70%'

function aptexplore(){
  apt search "$1" 2> /dev/null | \
    grep -v -e "^ " | \
    grep -v -e "^$" | \
    cut -d"/" -f1 | \
    fzf --reverse --preview="apt show 2> /dev/null {}" --preview-window=60%
}

function manexplore(){
  apropos "$1" | fzf --reverse +s | cut -d' ' -f1 | xargs man
}
