# TODO

## Zsh architecture — document & improve

- [ ] **Benchmark startup time** — run `zprof` to measure current load, document slow modules.
      `zsh -i -c 'zprof'` after adding `zmodload zsh/zprof` early in `.zshrc`.
- [ ] **Deduplicate fpath+autoload loop** — the same loop lives in
      `config/zsh/zshrc:19-28` and `share/zsh/zsh.functions.require:7-14`.
      Extract to a shared sourceable file (e.g. `share/zsh/functions/__load__`)
      that both include.
- [ ] **Consolidate `DOTFILES_ROOT_DIR` default** — set in both
      `config/zsh/zshrc:13` and `config/zsh/config/30-exports.zsh:2`. Pick one.
- [ ] **Evaluate `ZSH_CACHE_DIR` path** — current fallback
      `~/.local/cache/zsh` is nonstandard; `$XDG_CACHE_HOME/zsh`
      (`~/.cache/zsh`) is more conventional.

## Tmux status line — slanted window separators

[x] Switched `@catppuccin_window_status_style` from `"custom"` to
    `"slanted"` in `config/tmux/status.conf:24`.
[x] Removed manual separator overrides (lines 35-41) — slanted mode
    sets them automatically.

## Tmux status line — battery module

[x] Created `local/bin/battery-status` — reads catppuccin theme colors
    from tmux options, calls `battery_icon.sh` + `battery_percentage.sh`,
    outputs a styled string with tmux `#[...]` format attributes.
[x] Updated `status-right` in `config/tmux/status.conf:52` to use
    `#(battery-status)` instead of the catppuccin module.
[ ] Reload tmux config (`C-s C-r`) — verify battery shows on the right.

## Consolidate upgrade scripts

- [ ] `local/bin/` has three separate scripts — `upgrade.apt`,
      `upgrade.mise`, `upgrade.flatpak`. All use the same pattern (check
      for updates, `gum confirm`, apply).
- [ ] Create a single `upgrade-all` that runs all three, or shows an
      interactive picker via `gum choose`.

## Make `workspace.tmux` a real workspace config

Currently a 4-line placeholder (`Vim: -, Opencode: -, Git: -, Term: -`).
Could be a tmux sessionizer that creates a project workspace:
session named by cwd, windows for editor + shell + lazygit + task runner.

## One-shot bootstrap script

Current setup requires multiple manual steps: clone → `env RCRC=... rcup`
→ `chsh -s zsh` → install mise. A `local/bin/bootstrap` could check
prerequisites and run through the sequence interactively.
