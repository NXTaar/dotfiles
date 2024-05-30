#!/bin/sh
set -e

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" || exit ; pwd -P )

cd "$parent_path" || exit

# MacOS
if [[ $OSTYPE == 'darwin'* ]]; then
    source ./macos.sh
fi

# Linux (Ubuntu)
if [  -n "$(uname -a | grep -E 'Ubuntu|WSL')" ]; then
    source ./ubuntu.sh
fi
