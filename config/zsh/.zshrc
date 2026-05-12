# ── ~/.config/zsh/.zshrc ──────────────────────────────────────────────────────
# Entry point for interactive zsh shells.  Delegates to modular files in
# config/, adds functions/ + completions/ to fpath, and launches integrations.
# Drop a new NN-name.zsh into config/ to add functionality — nothing else
# to wire up.
# ───────────────────────────────────────────────────────────────────────────────

# ── options (must come first) ──────────────────────────────────────────────────
setopt extendedglob

# ── config modules (sourced in sorted order) ───────────────────────────────────
for f in "$ZDOTDIR"/config/*.zsh(N-.); do source "$f"; done

# ── fpath: functions (autoloaded lazily) and completions (picked up by compinit)
fpath=(
  "$ZDOTDIR/functions"
  "$ZDOTDIR/completions"
  $fpath
)

# autoload user functions by file name
for f in "$ZDOTDIR"/functions/*(N-.); do autoload -Uz "${f:t}"; done

# ── completions ────────────────────────────────────────────────────────────────
autoload -Uz compinit
if [[ -n "$ZSH_CACHE_DIR/.zcompdump"(#qNmh-20) ]]; then
  compinit -C -d "$ZSH_CACHE_DIR/.zcompdump"
else
  compinit -d "$ZSH_CACHE_DIR/.zcompdump"
  # compile the dump for even faster subsequent loads
  zcompile "$ZSH_CACHE_DIR/.zcompdump" 2>/dev/null
fi

# ── local machine config (not tracked in git) ──────────────────────────────────
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# ── secrets / API keys (not tracked, chmod 0600) ───────────────────────────────
[[ -f ~/.zsh.secrets ]] && source ~/.zsh.secrets
