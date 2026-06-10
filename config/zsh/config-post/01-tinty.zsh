# tinty wrapper: re-source shell/fzf env vars after apply/init
tinty_source_shell_theme() {
  newer_file=$(mktemp)
  tinty "$@"
  subcommand="$1"

  if [ "$subcommand" = "apply" ] || [ "$subcommand" = "init" ]; then
    tinty_artifact_dir="${XDG_DATA_HOME:-$HOME/.local/share}/tinted-theming/tinty/artifacts"

    unset FZF_DEFAULT_OPTS
    while read -r script; do
      . "$script"
    done < <(find "$tinty_artifact_dir" -maxdepth 1 \( -type f -o -type l \) -name "*.sh" 2>/dev/null)

    unset tinty_artifact_dir
  fi

  unset subcommand
  rm -f "$newer_file"
  unset newer_file
}

if command -v tinty &>/dev/null; then
  alias tinty=tinty_source_shell_theme
  tinty_source_shell_theme init &>/dev/null
fi
