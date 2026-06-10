# dotfiles

Personal dotfiles managed with [rcm](https://github.com/thoughtbot/rcm).

## Auto-setup

```sh
git clone git@github.com:maxkerp/dotfiles.git ~/Git/dotfiles
env RCRC=$HOME/Git/dotfiles/rcrc rcup   # first time only
rcup                                      # subsequent
```

## Structure

| Repo path | Linked to | Purpose |
|---|---|---|
| `zshenv` (root) | `~/.zshenv` | Sets `ZDOTDIR=~/.config/zsh`, sources `$ZDOTDIR/.zshenv` |
| `config/zsh/zshrc` → `$ZDOTDIR/.zshrc` | | Sources `config/*.zsh` before compinit, `config-post/*.zsh` after |
| `config/zsh/zshenv` → `$ZDOTDIR/.zshenv` | | Minimal env (`ZSH_CACHE_DIR`), for all zsh sessions |
| `config/zsh/config/` | | Sourced pre-compinit, sorted (`NN-name.zsh`) |
| `config/zsh/config-post/` | | Sourced post-compinit |
| `config/zsh/completions/` | | In `fpath`, picked up by compinit |
| `config/tmux/` | `~/.config/tmux/` | Tmux config (prefix: `C-s`, not `C-b`) |
| `config/git/` | `~/.config/git/` | Git config (XDG), pager=`delta`, conflict=`zdiff3` |
| `local/bin/` | `~/.local/bin/` via `PATH` (not rcm) | Portable sh scripts on `$PATH` |
| `share/zsh/functions/` | via `fpath` + `autoload` | Version-controlled zsh functions |
| `config/mise/config.toml` | mise config | Tools managed by mise (fzf, ripgrep, lazygit, etc.) |
| `config/tinted-theming/tinty/config.toml` | `~/.config/tinted-theming/tinty/config.toml` | tinty theme manager (shell, fzf, delta, alacritty, tmux) |
| `scripts/` | Not rcm-synced | Bootstrap / install scripts for new machines (see Bootstrapping) |

## Key env vars

- `DOTFILES_ROOT_DIR` — defaults to `$HOME/Git/dotfiles`, overridable
- `ZSHARE` — `$DOTFILES_ROOT_DIR/share/zsh` shorthand

## rcm notes

- `rcrc` EXCLUDES: `.gitignore`, `Aptfile`, `AGENTS.md`, `README*.md`, `LICENSE`, `docs`, `utils`, `local/bin`, `scripts/`
- `local/bin/` is on `$PATH` via `config/zsh/config/30-exports.zsh`, not via rcm symlinks
- Additionally scans `$HOME/dotfiles-local/` for host-local overrides
- If repo is at `~/Git/dotfiles`, needs `ln -s ~/Git/dotfiles ~/dotfiles` (otherwise `~/.rcrc` won't resolve)

## Bootstrapping a new machine

1. `git clone git@github.com:maxkerp/dotfiles.git ~/Git/dotfiles`
2. Run `scripts/install-plugins.sh` to clone zsh plugins (fzf-tab, zsh-autosuggestions) and sync tinty templates
3. `env RCRC=$HOME/Git/dotfiles/rcrc rcup`
4. `mise install` to install all binary tools (tinty, zsh-patina, fzf, ripgrep, starship, etc.)
5. `tinty sync && tinty apply base16-catppuccin-mocha` to sync templates/schemes and apply the default theme

## Zsh plugins (not managed by rcm / mise)

Tracked via `scripts/install-plugins.sh`, sourced from `~/.local/share/zsh/plugins/`:

| Plugin | Source in | Purpose |
|---|---|---|
| `Aloxaf/fzf-tab` | `config-post/10-fzf-tab.zsh` | fzf-powered completion UI |
| `zsh-users/zsh-autosuggestions` | `config-post/11-zsh-autosuggestions.zsh` | Fish-like command suggestions |
| `michel-kraemer/zsh-patina` | `config-post/12-zsh-patina.zsh` (via mise) | Rust syntax highlighting |

## Adding a zsh config module

Drop `NN-name.zsh` into `config/zsh/config/` (pre-compinit) or `config/zsh/config-post/` (post-compinit). No wiring needed.

## Adding a zsh function (body-only)

Drop a file (name = function name) into `share/zsh/functions/`. Body-only syntax — no `function name() {` wrapper. Autoloaded by filename.

Host-local alternative: `~/.local/share/zsh/functions/`.

**Keep in sync**: the `fpath` + `autoload` loop is duplicated in `config/zsh/zshrc` and `share/zsh/zsh.functions.require` (for standalone scripts). Update both.

## Adding a bin script

Drop a portable sh/bash script into `local/bin/`. Callable from any context.

## Local overrides (not tracked)

- `~/.zshrc.local` — sourced at end of `.zshrc`
- `~/.zsh.secrets` — API keys, chmod 0600
- `~/.local/share/zsh/functions/` — host-local functions

## Tmux

- Prefix: `C-s` (send-prefix: `C-s` again)
- Keybinds: see `config/tmux/keybinds.conf`
- TPM bootstraps automatically on first launch
- Tmux theme colors managed by [tinty](https://github.com/tinted-theming/tinty) via `tinted-tmux`, not catppuccin/tpm

## Theming (tinty)

Theme management via [tinty](https://github.com/tinted-theming/tinty). Config: `config/tinted-theming/tinty/config.toml`.

| Command | What it does |
|---|---|
| `tinty sync` | Clone/update all template repos and schemes |
| `tinty apply base16-catppuccin-mocha` | Apply a scheme across shell, fzf, delta, alacritty, tmux |
| `tinty cycle` | Cycle to next scheme |
| `tinty init` | Re-apply last scheme (runs automatically at shell start) |
| `tinty list` | List all available schemes |

Managed tools: shell ANSI colors (tinted-shell), fzf (custom mapping via bootstrap hook), git/delta (tinted-delta), alacritty (tinted-alacritty), tmux (tinted-tmux), lsd (via bootstrap hook).

**tinty env vars**: `TINTY_SCHEME_PALETTE_BASE{00..0F}_HEX` (no suffix) holds only the **red** component, not the full 6-digit hex. Use `_HEX_R + _HEX_G + _HEX_B` concatenation for the full value. This applies to bootstrap hooks and any other place consuming palette env vars.

**fzf custom mapping**: The `tinted-fzf` template is NOT used. Instead, `local/bin/tinty.bootstrap` generates a custom `tinted-fzf-sh-file.sh` from tinty env vars with this mapping:
| fzf role | base16 slot | Intention |
|---|---|---|
| `hl`, `hl+` | `base0A` | Match highlight (bold yellow) |
| `fg+` | `base0D` | Current line text (regular blue) |
| `fg` | `base05` | Normal body text (readable, not dim base04) |
| `bg+` | `base01` | Current line background |
| `header` | `base0D` | Header text |
| `info`, `prompt` | `base0A` | Info/prompt (yellow) |
| `pointer`, `spinner`, `marker` | `base0C` | Motion/animation (teal) |

Available schemes: all 4 catppuccin variants, tokyo-night-moon, tokyo-night, and 250+ base16 schemes.
