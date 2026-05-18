# Scripts vs Functions

Two places to put executable code in this repo:

| | `share/zsh/functions/` | `local/bin/` |
|---|---|---|---|
| Loaded via | `autoload -Uz` (lazy, in-process) | `$PATH` symlink (subprocess) |
| Language | zsh | sh/bash (any shell) |
| Can modify shell state | Yes (cd, export, alias, etc.) | No (runs in child process) |
| Available outside zsh | No | Yes (tmux, editors, cron, DE, etc.) |

### Rule of thumb

**Function** — if it mutates shell state or is purely interactive sugar:

| Operation | Why function |
|---|---|
| `cd` / `pushd` / `popd` | Subprocess chdirs its own PID |
| `export` / `unset` | Env vars die with child process |
| `alias` | Dies with child process |
| `setopt` / `trap` / `zle` / prompt vars | Per-process shell config |

Examples: `mcd`, `envup`, `g`, `change-extension`

**Script** (`local/bin/`) — if it needs to be callable from anywhere:

| Context | Example |
|---|---|
| Tmux `run-shell` / `display-popup` | `tmux.attach`, `tmux.init`, `tmux.sessions` |
| Window manager keybinds | Screenshot, volume, lockscreen |
| `dmenu` / `rofi` / launchers | Quick-launch helpers |
| Editor `:!command` | General-purpose tools |
| Cron / systemd timers | Backups, maintenance |
| `sudo` / `find -exec` / pipes | Tool must be on `$PATH` |

### Ambiguous cases

Some tools could live either way. When in doubt: **put it where it's called from**.

- If you only invoke it from an interactive shell prompt, a function is fine (lighter startup).
- If you ever invoke it from tmux, a DE shortcut, or a non-zsh shell, make it a script.
- If both: write a script on `$PATH` and optionally wrap it in a zsh function for convenience.

### `local/bin/` purpose

`local/bin/` holds standalone commands managed by this dotfile repo. They are:

- **Version-controlled** — unlike ad-hoc scripts scattered across the filesystem
- **Linked to `~/.local/bin/`** via `rcm` (`rcup`), placing them on `$PATH` automatically
- **Namespaced** — `tmux.*` prefix groups related tools
- **Shell-agnostic** — written in portable sh/bash so they work in any context

Treat it like a curated `~/.local/bin` that you can clone onto any machine and get your tools back.
