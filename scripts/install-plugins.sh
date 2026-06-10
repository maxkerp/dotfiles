#!/bin/sh
# Installs zsh plugins that are sourced as zsh scripts.
# These aren't binary tools (mise manages those), so we clone them
# to the XDG data dir and source them from config-post/*.zsh.
#
# Run this once on a new machine after `rcup`.
# Idempotent — safe to re-run.

set -eu

PLUGIN_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins"
mkdir -p "$PLUGIN_DIR"

echo "==> Installing zsh plugins to $PLUGIN_DIR"

install_plugin() {
  local name="$1" repo="$2"
  if [ -d "$PLUGIN_DIR/$name" ]; then
    echo "  ✔ $name already installed"
  else
    echo "  + cloning $name..."
    git clone --depth 1 "https://github.com/$repo" "$PLUGIN_DIR/$name"
  fi
}

install_plugin zsh-autosuggestions zsh-users/zsh-autosuggestions
install_plugin fzf-tab                Aloxaf/fzf-tab

echo "==> Done"
