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

## Key env vars

- `DOTFILES_ROOT_DIR` — defaults to `$HOME/Git/dotfiles`, overridable
- `ZSHARE` — `$DOTFILES_ROOT_DIR/share/zsh` shorthand

## rcm notes

- `rcrc` EXCLUDES: `.gitignore`, `Aptfile`, `AGENTS.md`, `README*.md`, `LICENSE`, `docs`, `utils`, `local/bin`
- `local/bin/` is on `$PATH` via `config/zsh/config/30-exports.zsh`, not via rcm symlinks
- Additionally scans `$HOME/dotfiles-local/` for host-local overrides
- If repo is at `~/Git/dotfiles`, needs `ln -s ~/Git/dotfiles ~/dotfiles` (otherwise `~/.rcrc` won't resolve)

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
