# zsh-patina: blazingly fast Rust-based syntax highlighter
# Load last since it wraps ZLE widgets.
if command -v zsh-patina >/dev/null 2>&1; then
  eval "$(zsh-patina activate)"
fi
