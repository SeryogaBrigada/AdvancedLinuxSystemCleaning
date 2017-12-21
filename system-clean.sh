#!/bin/bash

#######################################################
#
#              Advanced system cleaning
#
#######################################################
homedir=$(xdg-user-dir HOME)

#
# Mozilla Firefox
#
if [ -d $homedir/.mozilla/firefox/*.default ]; then
    rm -r "$homedir/.mozilla/firefox/Crash Reports"
    rm -r "$homedir/.mozilla/firefox/Pending Pings"

    cd $homedir/.mozilla/firefox/*.default
    rm -rf bookmarkbackups \
    crashes \
    datareporting \
    minidumps \
    saved-telemetry-pings \
    sessionstore-backups \
    storage \
    addons.* \
    AlternateServices.* \
    containers.* \
    content-prefs.* \
    handlers.* \
    kinto.* \
    mimeTypes.* \
    permissions.* \
    pluginreg.* \
    secmod.* \
    sessionCheckpoints.* \
    sessionstore.* \
    serviceworker.* \
    SecurityPreloadState.* \
    SiteSecurityServiceState.* \
    storage.* \
    Telemetry.ShutdownTime.* \
    times.* \
    webappsstore.*

#    rm cookies.*
#    rm formhistory.*
#    rm search.json.*
fi

#
# Opera
#
if [ -d $homedir/.config/opera* ]; then
    cd $homedir/.config/opera*
    rm -rf "adblocker_data" \
    "Extension State" \
    "GPUCache" \
    "IndexedDB" \
    "ShaderCache" \
    "Pepper Data" \
    "Platform Notifications" \
    "Service Worker" \
    "Opera Add-ons Downloads" \
    autoupdate_checker.* \
    BookmarksExtras \
    browser.js \
    "Certificate Revocation Lists" \
    default_partner_content.* \
    "Extension Cookies" \
    "Extension Cookies-journal" \
    Login* \
    Network* \
    opera_autoupdate.log \
    oauc_pipe* \
    previews_opt_out.* \
    Origin* \
    QuotaManager* \
    Shortcuts* \
    siteprefs.* \
    ssdfp* \
    TransportSecurity \
    "Visited Links"

#    rm Cookies*
#    rm History*
#    rm Current*
#    rm Last*

    cd "Local Storage"
    find . -type f -not -name 'chrome*' -print0 | xargs -0 rm --
fi

#
# Chromium browser
#
if [ -d $homedir/.config/chromium ]; then
    cd $homedir/.config/chromium
    rm -rf "CertificateTransparency" \
    "Crash Reports" \
    "EVWhitelist" \
    "OriginTrials" \
    "ShaderCache" \
    "Webstore Downloads" \
    "WidevineCdm" \
    "SSLErrorAssistant" \
    "Certificate Revocation Lists" \
    Safe* \
    BrowserMetrics-spare.*

    cd Default
    rm -rf "data_reduction_proxy_leveldb" \
    "GPUCache" \
    "IndexedDB" \
    "Pepper Data" \
    "Service Worker" \
    "Extension State" \
    "Session Storage" \
    DownloadMetadata \
    "Extension Cookies" \
    "Extension Cookies-journal" \
    Login* \
    Network* \
    Origin* \
    previews_opt_out.* \
    QuotaManager* \
    "Secure Preferences" \
    Shortcuts* \
    "Top Sites" \
    "Top Sites-journal" \
    TransportSecurity \
    "Visited Links" \
    "Web Data" \
    "Web Data-journal"

#    rm Cookies*
#    rm History*
#    rm Current*
#    rm Last*

    cd "Local Storage"
    find . -type f -not -name 'chrome*' -print0 | xargs -0 rm --
fi

#
# New Skype cache
#
if [ -d $homedir/.config/skypeforlinux ]; then
    cd $homedir/.config/skypeforlinux
    rm -r "Cache" \
    "GPUCache" \
    "logs"
fi

#
# Adobe Flash Player
#
if [ -d $homedir/.adobe ]; then
    sudo rm -r $homedir/.adobe
fi

if [ -d $homedir/.macromedia ]; then
    sudo rm -r $homedir/.macromedia
fi

#
# Kodi media center
#
if [ -d $homedir/.kodi ]; then
    rm -rf $homedir/.kodi/temp/*
fi

#
# System cache
#
find $homedir/.cache -maxdepth 1 -not -name '.cache' -not -name "fontconfig" -print0 | xargs -0 sudo rm -rf --

#
# Nvidia cache
#
if [ -d $homedir/.nv ]; then
    sudo rm -r $homedir/.nv
fi

#
# Launchpad cache
#
if [ -d $homedir/.launchpadlib ]; then
    sudo rm -r $homedir/.launchpadlib
fi

#
# GVFS-metadata (Must be disabled for Budgie)
#
sudo rm -rf $homedir/.local/share/gvfs-metadata/*

#
# WGET hosts file
#
if [ -d $homedir/.wget-hsts ]; then
    rm $homedir/.wget-hsts
fi

#
# Error messages
#
sudo rm -rf /var/crash/*

#
# After release upgrade:
# remove old apt sources and add necessary PPA's
#
find /etc/apt/sources.list.d -type f -not -name *$(lsb_release -sc)* -not -name 'skype*' \
 -not -name 'opera*' -not -name 'virtualbox*' -not -name 'teamviewer*' -print0 | xargs -0 sudo rm --
find /etc/apt/apt.conf.d -name '*.ucf-old' -print0 | xargs -0 sudo rm --
find /etc/apt/apt.conf.d -name '*.ucf-dist' -print0 | xargs -0 sudo rm --

if filecount=$(find /etc/apt -name '*.distUpgrade' | wc -l); ! [ $filecount -eq 0  ]; then
    find /etc/apt -name '*.distUpgrade' -print0 | xargs -0 sudo rm --
    find /etc/apt/sources.list.d -name '*.distUpgrade' -print0 | xargs -0 sudo rm --

    # qBittorrent
    sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
    # LibreOffice
    sudo add-apt-repository ppa:libreoffice/ppa -y
    # Kodi media center
    #sudo add-apt-repository ppa:team-xbmc/xbmc-nightly
    # Gimp
    #sudo add-apt-repository ppa:otto-kesselgulasch/gimp-edge -y
fi

# Fix "Device not managed" issue in Network Manager
if [ -f /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf ]; then
    sudo rm /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf
    sudo touch /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
fi

#
# Fix broken packages
#
sudo apt-get -f install -y

#
# Old kernels
#
dpkg -l 'linux-image-*' 'linux-headers-*' \
 | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'\
 | xargs sudo apt-get purge --auto-remove -y

#
# Unused libs
#
sudo deborphan --exclude=kodi-pvr-iptvsimple,kodi-inputstream-adaptive,\
kodi-audioencoder-lame,kodi-audiodecoder-fluidsynth,libfluidsynth1,kodi-audiodecoder-sidplay,\
kodi-audioencoder-vorbis,kodi-audiodecoder-modplug,libmodplug1,kodi-audioencoder-flac,\
kodi-audiodecoder-nosefart,kodi-inputstream-rtmp,kodi-audioencoder-wav,\
kodi-audiodecoder-snesapu,kodi-pvr-iptvsimple,libp8-platform2 | xargs sudo apt-get purge -y

sudo apt-get autoremove --purge -y

#
# Additional cleaning with Bleachbit
#
sudo bleachbit -c --preset
