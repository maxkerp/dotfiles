# dotfiles

Personal dotfiles managed with [rcm](https://github.com/thoughtbot/rcm).

## Requirements

- **git** — clone the repo
- **zsh** — set as login shell (`chsh -s $(which zsh)`)
- **rcm** — dotfile management (`apt install rcm` / `brew install rcm`)
- **tmux** — terminal multiplexer
- **mise** — dev environment manager (takes care of most othere requirements liek `fzf`, `carapace`, `starship`, ...)
- **bob/nvim** — neovim version manager/neovim

## Install

Clone into place:

```
git clone git@github.com:maxkerp/dotfiles.git ~/Git/dotfiles
```

First-time setup:

```
env RCRC=$HOME/Git/dotfiles/rcrc rcup
```

After that, `rcup` works without `RCRC` (the repo's `rcrc` is symlinked to `~/.rcrc`).

## What's included

| Repo path | Linked to | Purpose |
|---|---|---|---|
| `config/tmux/` | `~/.config/tmux/` | Tmux config files |
| `config/zsh/` | `~/.config/zsh/` | Zsh config |
| `local/bin/` | `~/.local/bin/` | Standalone scripts on `$PATH` |
| `share/zsh/functions/` | _(referenced by `$DOTFILES_ROOT_DIR`)_ | Version-controlled zsh functions (body-only, autoloaded) |

