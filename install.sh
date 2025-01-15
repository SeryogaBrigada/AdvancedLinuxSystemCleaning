#!/bin/bash

##**************************************************************************
## Copyright (C) 2016-2025 Sergey Kovalenko <seryoga.engineering@gmail.com>
## SPDX-License-Identifier: MIT
##**************************************************************************

# Script
sudo cp advanced-system-cleaning /usr/bin/
sudo chmod 755 /usr/bin/advanced-system-cleaning
# Desktop shortcut
sudo cp com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop /usr/share/applications/
sudo chmod 644 /usr/share/applications/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop
# Icon
sudo cp com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg /usr/share/pixmaps/
sudo chmod 644 /usr/share/pixmaps/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg
# License file
sudo mkdir -p /usr/share/licenses/advanced-system-cleaning
sudo cp LICENSE /usr/share/licenses/advanced-system-cleaning
sudo chmod 644 /usr/share/licenses/advanced-system-cleaning/LICENSE
