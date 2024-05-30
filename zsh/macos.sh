if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  # All Homebrew installed apps available at PATH
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# fuzzy file finder
eval "$(fzf --zsh)"