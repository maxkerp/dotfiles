# tinty wrapper: re-source shell/fzf env vars after apply/init/cycle
tinty_source_shell_theme() {
  tinty "$@"
  subcommand="$1"

  if [ "$subcommand" = "apply" ] || [ "$subcommand" = "init" ] || [ "$subcommand" = "cycle" ]; then
    tinty_artifact_dir="${TINTY_DATA_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/tinted-theming/tinty}/artifacts"

    # Source tinted-shell theme for terminal ANSI colors.
    # Inside tmux: unset TMUX/TERM so it uses standard OSC sequences instead of
    # DCS passthrough (\033Ptmux;...), which is blocked by tmux >=3.3 default
    # allow-passthrough off.
    if [ -f "$tinty_artifact_dir/tinted-shell-scripts-file.sh" ]; then
      if [ -n "$TMUX" ]; then
        (
          unset TMUX
          TERM=xterm-256color
          . "$tinty_artifact_dir/tinted-shell-scripts-file.sh"
        )
      else
        . "$tinty_artifact_dir/tinted-shell-scripts-file.sh"
      fi
    fi

    # Source fzf colors
    if [ -f "$tinty_artifact_dir/tinted-fzf-sh-file.sh" ]; then
      unset FZF_DEFAULT_OPTS
      . "$tinty_artifact_dir/tinted-fzf-sh-file.sh"
    fi

    unset tinty_artifact_dir
  fi

  unset subcommand
}

if command -v tinty &>/dev/null; then
  alias tinty=tinty_source_shell_theme
  tinty_source_shell_theme init &>/dev/null
fi
