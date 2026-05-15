
# ── prompt / integrations ──────────────────────────────────────────────────────
eval "$(starship init zsh)"
source <(fzf --zsh)
eval "$(mise activate zsh)"
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"
