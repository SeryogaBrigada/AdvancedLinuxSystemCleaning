#!/bin/bash -e

##**************************************************************************
## Copyright (C) 2016-2026 Sergey Kovalenko <seryoga.engineering@gmail.com>
## SPDX-License-Identifier: MIT
##**************************************************************************

if which apt >/dev/null 2>&1; then
    echo "Debian/Ubuntu system found"
    sudo apt install bleachbit deborphan -y
elif which pacman >/dev/null 2>&1; then
    echo "Arch Linux system found"
    sudo pacman -S --noconfirm --needed bleachbit yay
else
    echo "Not supported system. Please install bleachbit manually"
fi

source install.sh

if which bleachbit >/dev/null 2>&1; then
    echo "Setup user defined options"
    bleachbit
fi
