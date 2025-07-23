# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"

PATH="$HOME/.bin/git-fuzzy/bin/:$PATH"

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

# Extend Path with cargo binaries
if [ -d "$HOME/.cargo/bin" ]; then
  PATH="$PATH:$HOME/.cargo/bin"
fi

# Load z
if [ -d "$HOME/.local/bin/git/z" ]; then

  if [ -s "$HOME/.local/bin/git/z/z.sh" ]; then
    source "$HOME/.local/bin/git/z/z.sh"
  fi
fi

export -U PATH
