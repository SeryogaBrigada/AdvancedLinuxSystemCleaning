#!/bin/bash

##**************************************************************************
## MIT License
##
## Copyright (C) 2016-2024 Sergey Kovalenko <seryoga.engineering@gmail.com>
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

# Uninstall script
[[ -f /usr/bin/advanced-system-cleaning ]] && sudo rm /usr/bin/advanced-system-cleaning;
# Uninstall desktop shortcut
[[ -f /usr/share/applications/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop ]] && sudo rm /usr/share/applications/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop;
[[ -f "$(xdg-user-dir DESKTOP)/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop" ]] && rm "$(xdg-user-dir DESKTOP)/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.desktop";
# Uninstall icon
[[ -f /usr/share/pixmaps/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg ]] && sudo rm /usr/share/pixmaps/com.github.seryogabrigada.AdvancedLinuxSystemCleaning.svg;
# Uninstall license file
[[ -d /usr/share/licenses/advanced-system-cleaning ]] && sudo rm -r /usr/share/licenses/advanced-system-cleaning;

