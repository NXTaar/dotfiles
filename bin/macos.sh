#!/bin/sh

function brew_add {
    if brew ls --versions "$1" >/dev/null; then
        brew upgrade "$1"
    else
        brew install "$1"
    fi
}

# Package manager (Homebrew)
which -s brew

# Install or upgrade Homebrew
if [[ $? != 0 ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update
fi

brew_add ansible
