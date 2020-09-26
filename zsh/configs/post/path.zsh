# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# Try loading ASDF from the regular home dir location
if [ -f "$HOME/.asdf/asdf.sh" ]; then
  . "$HOME/.asdf/asdf.sh"
elif which brew >/dev/null &&
  BREW_DIR="$(dirname "$(which brew)")/.." &&
  [ -f "$BREW_DIR/opt/asdf/asdf.sh" ]; then
  . "$BREW_DIR/opt/asdf/asdf.sh"
fi

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

# Extend Path with cargo binaries
if [ -d "$HOME/.cargo/bin" ]; then
  PATH="$PATH:$HOME/.cargo/bin"
fi

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"

  # This loads nvm and its bash completion. Both of them add an incredible
  # amount of startup time to zsh, around 500ms so only do this if you can find
  # a package.json in the CWD
  if [ -f "./package.json" ]; then

    if [ -s "$NVM_DIR/nvm.sh" ]; then
      source "$NVM_DIR/nvm.sh"
    fi

    if [ -s "$NVM_DIR/bash_completion" ]; then
      source "$NVM_DIR/bash_completion"
    fi

  fi

fi

export -U PATH
