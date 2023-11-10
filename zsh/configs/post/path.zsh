# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"

PATH="$HOME/.bin/git-fuzzy/bin/:$PATH"

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

# Extend Path with cargo binaries
if [ -d "$HOME/.cargo/bin" ]; then
  PATH="$PATH:$HOME/.cargo/bin"
fi

# Load nvm
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"

  if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
  fi

  # This loads nvm and its bash completion. Both of them add an incredible
  # amount of startup time to zsh, around 500ms so only do this if you can find
  # a package.json in the CWD
  if [ -f "./package.json" ]; then

    if [ -s "$NVM_DIR/bash_completion" ]; then
      source "$NVM_DIR/bash_completion"
    fi
  fi
fi

# Load z
if [ -d "$HOME/.local/bin/git/z" ]; then

  if [ -s "$HOME/.local/bin/git/z/z.sh" ]; then
    source "$HOME/.local/bin/git/z/z.sh"
  fi
fi

export -U PATH
