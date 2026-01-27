if [ -z "$DOTFILES_ROOT" ]; then
    echo "Error: DOTFILES_ROOT environment variable is not set or is empty"
    exit 1
fi

source $DOTFILES_ROOT/shell/exports.sh
source $DOTFILES_ROOT/shell/shell-config.sh
source $DOTFILES_ROOT/shell/aliases.sh
source $DOTFILES_ROOT/shell/package-manager.sh
source $DOTFILES_ROOT/shell/prompt.sh
source $DOTFILES_ROOT/shell/integrations.sh
source $DOTFILES_ROOT/shell/nodejs.sh

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
