# All node.js related stuff
eval "$(fnm env --use-on-cd --shell zsh)"

FNM_PATH="/Users/sagatovskii/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/sagatovskii/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi
