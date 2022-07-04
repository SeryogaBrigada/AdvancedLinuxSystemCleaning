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

echo "Installing to ${INSTALL_DIR}"

[[ -f ${INSTALL_DIR}/system-clean.sh ]] && rm ${INSTALL_DIR}/system-clean.sh;
cp system-clean.sh ${INSTALL_DIR}
chmod +x ${INSTALL_DIR}/system-clean.sh

cat << 'EOF' | sudo tee /usr/share/applications/system-clean.desktop
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Type=Application
Name=System Cleanup
Name[ru]=Очистка системы
Comment=System Cleanup
Comment[ru]=Очистка системы
GenericName=System Cleanup
GenericName[ru]=Очистка системы
Exec=~/system-clean.sh
Icon=bleachbit
Categories=GTK;System;
Keywords=clean;performances;free;privacy;
StartupNotify=true
Terminal=true
EOF

sudo sed -i "s|~|${INSTALL_DIR}|g" /usr/share/applications/system-clean.desktop
cp /usr/share/applications/system-clean.desktop "$(xdg-user-dir DESKTOP)"
chmod +x "$(xdg-user-dir DESKTOP)/system-clean.desktop"

