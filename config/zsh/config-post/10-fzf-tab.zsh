# fzf-tab: replace zsh completion menu with fzf
# Must be loaded after compinit but before zsh-autosuggestions.
local fzf_tab="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh"
[[ -f "$fzf_tab" ]] && source "$fzf_tab"
