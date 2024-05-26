#!/bin/sh

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" || exit ; pwd -P )

cd "$parent_path" || exit

# MacOS
if [[ $OSTYPE == 'darwin'* ]]; then
    source ./macos.sh
fi

# Linux (Ubuntu)
if [  -n "$(uname -a | grep Ubuntu)" ]; then
    source ./ubuntu.sh
fi
