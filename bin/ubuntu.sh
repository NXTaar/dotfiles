#!/bin/sh

if ! dpkg -s ansible >/dev/null 2>&1; then
    echo Installing Ansible
    sudo apt-get update
    sudo apt-get install -y software-properties-common
    sudo apt-add-repository -y ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install -y ansible
    sudo apt-get install python3-argcomplete
    sudo activate-global-python-argcomplete3
fi

if ! dpkg -s python3 >/dev/null 2>&1; then
    echo Installing Python3
    sudo apt-get install -y python3
fi

if ! dpkg -s python3-pip >/dev/null 2>&1; then
    echo Installing Python3 Pip
    sudo apt-get install -y python3-pip
fi

if ! pip3 list | grep watchdog >/dev/null 2>&1; then
    echo Installing Python3 Watchdog
    pip3 install watchdog
fi
