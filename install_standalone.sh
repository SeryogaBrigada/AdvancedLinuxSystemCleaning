#!/bin/bash

##**************************************************************************
## MIT License
##
## Copyright (C) Sergey Kovalenko <seryoga.engineering@gmail.com>
##
## Permission is hereby granted, free of charge, to any person obtaining a copy
## of this software and associated documentation files (the "Software"), to deal
## in the Software without restriction, including without limitation the rights
## to use, copy, modify, merge, publish, distribute, sub-license, and/or sell
## copies of the Software, and to permit persons to whom the Software is
## furnished to do so, subject to the following conditions:
##
## The above copyright notice and this permission notice shall be included in all
## copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
## FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
## SOFTWARE.
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
