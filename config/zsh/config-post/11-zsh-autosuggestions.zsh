# zsh-autosuggestions: fish-like command suggestions from history
# Must be loaded after fzf-tab (which it wraps).
local zsh_autosuggest="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "$zsh_autosuggest" ]] && source "$zsh_autosuggest"
