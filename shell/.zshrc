source ${HOME}/.dotfilesrc

export EDITOR=nvim

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# Aliases
alias ls="ls --color -a"
alias c='clear && printf "\e[3J"'
alias zconf="nvim ~/.zshrc"

# MacOS
if [[ $OSTYPE == 'darwin'* ]]; then
    source ${DOTFILES_ROOT_FOLDER}/shell/macos.sh
fi

# Linux (Ubuntu)
if [  -n "$(uname -a | grep -E 'Ubuntu|WSL')" ]; then
    source ${DOTFILES_ROOT_FOLDER}/shell/ubuntu.sh
fi

# Shell integrations
eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"
source <(fzf --zsh)

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ${DOTFILES_ROOT_FOLDER}/configs/oh-my-posh.toml)"
fi

# fnm
FNM_PATH="/Users/sagatovskii/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/sagatovskii/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi
