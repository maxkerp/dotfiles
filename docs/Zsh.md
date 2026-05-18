# Zsh Architecture

## Overview

This dotfiles repo provides a modular, autoloaded zsh function library
designed for both interactive shells and standalone scripts.  It follows a
"batteries-included but opt-in" philosophy: drop a file, it loads; source a
bootstrap, the library is available.

---

## Directories

| Path | Role |
|---|---|
| `config/zsh/config/` | Sourced before `compinit` (sorted, `NN-name.zsh`) |
| `config/zsh/config-post/` | Sourced after `compinit` |
| `share/zsh/functions/` | Version-controlled zsh functions (tracked in git) |
| `~/.local/share/zsh/functions/` | Host-local zsh functions (not tracked) |
| `share/zsh/zsh.functions.require` | Sourceable bootstrap for standalone scripts |

---

## Env Vars

Defined in `config/zsh/config/30-exports.zsh`:

- **`DOTFILES_ROOT_DIR`** — repo root (`$HOME/Git/dotfiles`).  Overridable.
- **`ZSHARE`** — `$DOTFILES_ROOT_DIR/share/zsh/` — shorthand used by the
  bootstrap and all function files to reference the shared zsh directory.

---

## Function Conventions

- **Body-only syntax** — files contain the function body directly, no
  `function name {` wrapper.  Zsh's `autoload` executes the file contents
  as the function body.
- **One function per file** — filename **must** equal function name.
- **Dot-notation namespacing** — e.g. `is.file`, `options.define`,
  `args.get`.  Zsh treats dots as valid name characters.

### Loading Mechanism

```zsh
# Both interactive (zshrc) and standalone (zsh.functions.require) use:
fpath=( "$ZSHARE/functions" "$HOME/.local/share/zsh/functions" $fpath )
for dir in "$ZSHARE/functions" "$HOME/.local/share/zsh/functions"; do
  [[ -d "$dir" ]] && for f in "$dir"/*(N-.); do autoload -Uz "${f:t}"; done
done
```

The `N-.` glob qualifier means "no error on empty, regular files only."
Functions are loaded lazily — the body is parsed only when first called.

---

## Library — Utility Functions (`is.*`)

Fast, in-process checks using native zsh operators.

| File | Returns true when… |
|---|---|
| `is.a-dir` | Path is a directory (`[[ -d $1 ]]`) |
| `is.file` | Path is a regular file (`[[ -f $1 ]]`) |
| `is.older-than` | File is older than N days (zsh age modifier `mh+`) |

---

## Library — Argument Parsing

Two complementary styles for handling CLI arguments:

### Quick Look-up (`args.get`)

Best for simple scripts that need a single flag value:

```zsh
local target=$(args.get "-f" "$@")
# returns the next word after -f, or 1 if not found
```

### Registration-Based (`options.*`)

Best for scripts with multiple options, defaults, short aliases, and help
text.  Uses three global associative arrays (`_opt_defaults`,
`_opt_aliases`, `_opt_helps`) and produces a public hash `$opts`.

```zsh
options.define "t" "time"    "1.day" "Timestamp validation window"
options.define "v" "verbose" "false" "Toggle debugging output"
options.define "h" "help"    "false" "Display help"

options.parse "$@"

if [[ "$opts[help]" == "true" ]]; then
    options.help
    exit 0
fi

echo "${opts[time]}"  # → "2.days" (if --time 2.days was passed)
echo "${opts[verbose]}"  # → "true" (if -v was passed)
```

**Default types:**  A default of `"true"` or `"false"` marks the option as a
boolean toggle; `--verbose` sets it to `"true"` without consuming a next
argument.  Any other default is treated as a value flag (`--time 2.days`).

**Short flags:**  Registered via `options.define` — `-t` is an alias for
`--time`, `-v` for `--verbose`, etc.

---

## Standalone Script Bootstrap

Any script can load the full library by sourcing the bootstrap file:

```zsh
#!/bin/zsh
source "$DOTFILES_ROOT_DIR/share/zsh/zsh.functions.require"

# Or if DOTFILES_ROOT_DIR is not set:
source "${0:A:h}/share/zsh/zsh.functions.require"

options.define "f" "file" "" "Input file"
options.parse "$@"
is.file "$opts[file]" || { echo "Missing file"; exit 1 }
```

The bootstrap adds both `$ZSHARE/functions/` and
`~/.local/share/zsh/functions/` to `fpath` and autoloads everything.

---

## Relationship to `config/zsh/zshrc`

The interactive shell's `.zshrc` (`config/zsh/zshrc`) contains an equivalent
fpath + autoload loop (lines 19–28).  The standalone bootstrap
(`zsh.functions.require`) duplicates that logic so scripts are self-contained
— they don't depend on `.zshrc` being sourced first.

If you change the fpath/autoload logic, update both `zshrc` and
`zsh.functions.require`.

---

## See Also

- `docs/scripts-vs-functions.md` — when to write a script vs a function
- `AGENTS.md` — repo structure overview, adding new functions
