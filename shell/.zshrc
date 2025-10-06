get_script_dir() {
  local src="${(%):-%N}"
  while [ -h "$src" ]; do
    local dir="$(cd -P "$(dirname "$src")" && pwd)"
    src="$(readlink "$src")"
    [[ $src != /* ]] && src="$dir/$src"
  done
  cd -P "$(dirname "$src")" && pwd
}

DOTFILES_ROOT="$(get_script_dir)"

source $DOTFILES_ROOT/shell/exports.sh
source $DOTFILES_ROOT/shell/shell-config.sh
source $DOTFILES_ROOT/shell/aliases.sh
source $DOTFILES_ROOT/shell/package-manager.sh
source $DOTFILES_ROOT/shell/prompt.sh
source $DOTFILES_ROOT/shell/integrations.sh

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
