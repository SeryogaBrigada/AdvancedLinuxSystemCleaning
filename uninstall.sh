#!/bin/bash

##**************************************************************************
## Copyright (C) 2016-2025 Sergey Kovalenko <seryoga.engineering@gmail.com>
## SPDX-License-Identifier: MIT
##**************************************************************************

# Uninstall script
[[ -f /usr/bin/advanced-system-cleaning ]] && sudo rm /usr/bin/advanced-system-cleaning;
# Uninstall desktop shortcut
[[ -f /usr/share/applications/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop ]] && sudo rm /usr/share/applications/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop;
[[ -f "$(xdg-user-dir DESKTOP)/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop" ]] && rm "$(xdg-user-dir DESKTOP)/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop";
# Uninstall icon
[[ -f /usr/share/pixmaps/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg ]] && sudo rm /usr/share/pixmaps/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg;
# Uninstall license file
[[ -d /usr/share/licenses/advanced-system-cleaning ]] && sudo rm -r /usr/share/licenses/advanced-system-cleaning;

