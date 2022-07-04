#!/bin/bash

##**************************************************************************
##
## Copyright (C) Sergey Kovalenko <seryoga.engineering@gmail.com>
##
## This file is part of Advanced Linux System Cleaning.
## Advanced Linux System Cleaning is free software: you can redistribute
## it and/or modify it under the terms of the GNU General Public License
## as published by the Free Software Foundation, either version 3 of
## the License, or (at your option) any later version.
##
## HVAC Controller is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
## See the GNU General Public License for more details.
##
## You should have received a copy of the
## GNU General Public License along with Advanced Linux System Cleaning.
## If not, see http://www.gnu.org/licenses/.
##
##**************************************************************************

if [[ -z $1 ]]; then
    INSTALL_DIR=~
else
    INSTALL_DIR="${1}"
fi

echo "Uninstalling from ${INSTALL_DIR}"

[[ -f ${INSTALL_DIR}/system-clean.sh ]] && rm ${INSTALL_DIR}/system-clean.sh;
[[ -f /usr/share/applications/system-clean.desktop ]] && sudo rm /usr/share/applications/system-clean.desktop;
[[ -f "$(xdg-user-dir DESKTOP)/system-clean.desktop" ]] && rm "$(xdg-user-dir DESKTOP)/system-clean.desktop";

