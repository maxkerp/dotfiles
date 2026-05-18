# dotfiles

Personal dotfiles managed with [rcm](https://github.com/thoughtbot/rcm).

## Structure

| Repo path | Linked to | Purpose |
|---|---|---|---|
| `config/tmux/` | `~/.config/tmux/` | Tmux config files |
| `config/git/` | `~/.config/git/` | Git config (auto-read via XDG) |
| `config/zsh/` | `~/.config/zsh/` | Zsh config (`.` prefix → file itself) |
| `local/bin/` | `~/.local/bin/` | Standalone scripts on `$PATH` |
| `share/zsh/functions/` | _(referenced by `$DOTFILES_ROOT_DIR`)_ | Version-controlled zsh functions (body-only, autoloaded) |

## Adding a new zsh config module

Drop `NN-name.zsh` into `config/zsh/config/` (sourced before compinit)
or `config/zsh/config-post/` (sourced after). Sorted by filename.

No wiring needed — `.zshrc` loops over both directories.

## Adding a new function

For version-controlled functions (shipped with dotfiles):

Drop a file into `share/zsh/functions/`. It's autoloaded by filename
(`autoload -Uz` loops over the directory). Use zsh body-only syntax
(no `function name() {` wrapper — just the function body).

For host-local functions (not tracked in git):

Drop a file into `~/.local/share/zsh/functions/`. Same convention —
body only, autoloaded by filename.

## Adding a new bin script

Drop a portable sh/bash script into `local/bin/`. Run `rcup` to
symlink it to `~/.local/bin/`. Callable from any context (tmux,
DE keybindings, editor, cron).

## `local/bin/` vs `share/zsh/functions/`

See `docs/scripts-vs-functions.md`.

## Managing symlinks

```sh
rcup        # create/update all symlinks
lsrc -v     # dry-run: show what would be linked
rcup -f     # force overwrite (replaces existing files)
```

`.rcrc` defines which directories to scan — currently
`$HOME/dotfiles-local` and `$HOME/dotfiles`. If the repo is at
`~/Git/dotfiles`, symlink it: `ln -s ~/Git/dotfiles ~/dotfiles`.

## Keybindings

- `C-p` in tmux: session switcher (`tmux.sessions`)
- `C-i` in tmux: init workspace windows (`tmux.init`)
- `C-b` in tmux: break window into own session (`tmux.attach`)
