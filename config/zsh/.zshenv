# ── ~/.config/zsh/.zshenv ──────────────────────────────────────────────────────
# Runs for ALL zsh sessions (including non-interactive, scripts).
# Keep this minimal — only env vars that must exist everywhere.
# Interactive-only setup goes in .zshrc.
# ───────────────────────────────────────────────────────────────────────────────

export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.local/cache}/zsh"
[[ -d "$ZSH_CACHE_DIR" ]] || mkdir -p "$ZSH_CACHE_DIR"

export PATH="$HOME/.local/bin:$HOME/.local/share/mise/shims:$PATH"
