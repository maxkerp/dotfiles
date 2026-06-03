
# ── prompt / integrations ──────────────────────────────────────────────────────
eval "$(mise activate zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"
