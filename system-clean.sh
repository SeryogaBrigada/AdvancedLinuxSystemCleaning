#!/bin/bash

#######################################################
#
#              Advanced system cleaning
#
#######################################################
homedir=$(xdg-user-dir HOME)

# Mozilla Firefox
if [[ -d $homedir/.mozilla/firefox ]]; then
    rm -r "$homedir/.mozilla/firefox/Crash Reports"
    rm -r "$homedir/.mozilla/firefox/Pending Pings"

    cd $homedir/.mozilla/firefox/*.default
    rm -rf \
    blocklist* \
    bookmarkbackups \
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
    webappsstore.* \
    weave

#    rm cookies.*
    rm formhistory.*
    rm search.json.*
fi

# Opera
if [ -d $homedir/.config/opera* ]; then
    cd $homedir/.config/opera*
    rm -rf \
    "adblocker_data" \
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
    rm History*
    rm Current*
    rm Last*

    cd "Local Storage"
    find . -type f -not -name 'chrome*' -print0 | xargs -0 rm --
fi

# Chromium browser
if [[ -d $homedir/.config/chromium ]]; then
    cd $homedir/.config/chromium
    rm -rf \
    "BrowserMetrics" \
    "CertificateTransparency" \
    "CertificateRevocation" \
    "Consent To Send Stats" \
    "Crash Reports" \
    "EVWhitelist" \
    "FileTypePolicies" \
    "InterventionPolicyDatabase" \
    "MEIPreload" \
    "NativeMessagingHosts" \
    "OriginTrials" \
    "Policy" \
    "ShaderCache" \
    "Subresource Filter" \
    "Webstore Downloads" \
    "WidevineCdm" \
    "SSLErrorAssistant" \
    "Certificate Revocation Lists" \
    "pnacl" \
    Safe* \
    BrowserMetrics-spare.* \
    .org.chromium.Chromium.* \
    chrome_shutdown_ms.txt

    cd Default
    rm -rf \
    "Accounts" \
    *.ldb \
    *.log \
    "Affiliation Database" \
    "Affiliation Database-journal" \
    "Application Cache" \
    "BudgetDatabase" \
    "blob_storage" \
    "data_reduction_proxy_leveldb" \
    "databases" \
    "Download Service" \
    "Extension State" \
    "Feature Engagement Tracker" \
    "File System" \
    "GCM Store" \
    "GPUCache" \
    "Managed Extension Settings" \
    "IndexedDB" \
    "Pepper Data" \
    "Platform Notifications" \
    "Sync Data" \
    "Sync Extension Settings" \
    "Service Worker" \
    "Thumbnails" \
    "Session Storage" \
    "DownloadMetadata" \
    "Extension Cookies" \
    "Extension Cookies-journal" \
    LOCK \
    LOG \
    LOG.old \
    Login* \
    MANIFEST-* \
    Network* \
    Origin* \
    previews_opt_out.* \
    QuotaManager* \
    "Secure Preferences" \
    Shortcuts* \
    "Storage" \
    "Top Sites" \
    "Top Sites-journal" \
    "Translate Ranker Model" \
    "TransportSecurity" \
    "Search Logos" \
    "Visited Links" \
    "VideoDecodeStats" \
    "Web Data" \
    "Web Data-journal" \
    "WebRTC Logs" \
    "webrtc_event_logs" \
    .org.chromium.Chromium.* \
    page_load_capping_opt_out.* \
    in_progress_download_metadata_store

#    rm Cookies*
    rm History*
    rm CURRENT
    rm Current*
    rm Last*

    cd "Local Storage"
    find . -type f -not -name 'chrome*' -print0 | xargs -0 rm --
fi

# Google chrome
if [[ -d $homedir/.config/google-chrome ]]; then
    cd $homedir/.config/google-chrome
    rm -rf \
    "BrowserMetrics" \
    "CertificateTransparency" \
    "CertificateRevocation" \
    "Consent To Send Stats" \
    "Crash Reports" \
    "EVWhitelist" \
    "FileTypePolicies" \
    "InterventionPolicyDatabase" \
    "MEIPreload" \
    "NativeMessagingHosts" \
    "OriginTrials" \
    "Policy" \
    "ShaderCache" \
    "Subresource Filter" \
    "Webstore Downloads" \
    "WidevineCdm" \
    "SSLErrorAssistant" \
    "Certificate Revocation Lists" \
    "pnacl" \
    Safe* \
    BrowserMetrics-spare.* \
    chrome_shutdown_ms.txt

    cd Default
    rm -rf \
    "Accounts" \
    *.ldb \
    *.log \
    "Affiliation Database" \
    "Affiliation Database-journal" \
    "Application Cache" \
    "BudgetDatabase" \
    "blob_storage" \
    "data_reduction_proxy_leveldb" \
    "databases" \
    "Download Service" \
    "Extension State" \
    "Feature Engagement Tracker" \
    "File System" \
    "GCM Store" \
    "GPUCache" \
    "Managed Extension Settings" \
    "IndexedDB" \
    "Pepper Data" \
    "Platform Notifications" \
    "Sync Data" \
    "Sync Extension Settings" \
    "Service Worker" \
    "Thumbnails" \
    "Session Storage" \
    "DownloadMetadata" \
    "Extension Cookies" \
    "Extension Cookies-journal" \
    LOCK \
    LOG \
    LOG.old \
    Login* \
    MANIFEST-* \
    Network* \
    Origin* \
    previews_opt_out.* \
    QuotaManager* \
    "Secure Preferences" \
    Shortcuts* \
    "Storage" \
    "Top Sites" \
    "Top Sites-journal" \
    "Translate Ranker Model" \
    "TransportSecurity" \
    "Search Logos" \
    "Visited Links" \
    "VideoDecodeStats" \
    "Web Data" \
    "Web Data-journal" \
    "WebRTC Logs" \
    "webrtc_event_logs" \
    .com.google.Chrome.* \
    page_load_capping_opt_out.* \
    in_progress_download_metadata_store

#    rm Cookies*
    rm History*
    rm CURRENT
    rm Current*
    rm Last*

    cd "Local Storage"
    find . -type f -not -name 'chrome*' -print0 | xargs -0 rm --
fi

# New Skype cache
if [[ -d $homedir/.config/skypeforlinux ]]; then
    cd $homedir/.config/skypeforlinux
    rm -r \
    "Cache" \
    "GPUCache" \
    "logs"
fi

# Adobe Flash Player
if [[ -d $homedir/.adobe ]]; then
    sudo rm -r $homedir/.adobe
fi

if [[ -d $homedir/.macromedia ]]; then
    sudo rm -r $homedir/.macromedia
fi

# Kodi media center
if [[ -d $homedir/.kodi ]]; then
    rm -rf $homedir/.kodi/temp/*
    rm $homedir/kodi_crashlog*.log
    rm $homedir/core
fi

# System cache
sudo rm -rf $homedir/.cache/*

# Nvidia cache
if [[ -d $homedir/.nv ]]; then
    sudo rm -r $homedir/.nv
fi

# Launchpad cache
if [[ -d $homedir/.launchpadlib ]]; then
    sudo rm -r $homedir/.launchpadlib
fi

# Wine cache
if [[ -d $homedir/.wine ]]; then
    rm -rf $homedir/.wine/drive_c/users/$USER/Temp/*
    rm -rf $homedir/.wine/drive_c/windows/temp/*
fi

# GVFS-metadata (Must be disabled for Budgie)
sudo rm -rf $homedir/.local/share/gvfs-metadata/*

# WGET hosts file
if [[ -f $homedir/.wget-hsts ]]; then
    rm $homedir/.wget-hsts
fi

# Error messages
sudo rm -rf /var/crash/*

# Remove old PPA's after release upgrade
if [[ -f /etc/apt/sources.list.distUpgrade ]]; then
    sudo rm /etc/apt/sources.list.distUpgrade
    find /etc/apt/apt.conf.d -type f \( -name '*.ucf-old' -o -name '*.ucf-dist' \) -print0 | xargs -0 sudo rm --
    find /etc/apt/sources.list.d -type f \( -name '*.distUpgrade' -o -name '*.dpkg-old' \) -print0 | xargs -0 sudo rm --
    
    find /etc/apt/sources.list.d -type f \
     -not -name *$(lsb_release -sc)* \
     -not -name 'skype*' \
     -not -name 'opera*' \
     -not -name 'virtualbox*' \
     -not -name 'teamviewer*' \
     -not -name 'google-chrome*' \
     -print0 | xargs -0 sudo rm --
     
    rm -r $homedir/.config/pulse
    
    # Reinstall TeamViewer
    [[ -d  /var/log/teamviewer13 ]] && sudo rm -r /var/log/teamviewer13;
    [[ -d  /var/log/teamviewer14 ]] && sudo rm -r /var/log/teamviewer14;
    sudo rm /etc/apt/sources.list.d/teamviewer.list
    sudo apt update

    if [ $(uname -m) = 'x86_64' ]; then
        wget -P ~ https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
        sudo dpkg -i ~/teamviewer_amd64.deb
        rm ~/teamviewer_amd64.deb
    else
        wget -P ~ https://download.teamviewer.com/download/linux/teamviewer_i386.deb
        sudo dpkg -i ~/teamviewer_i386.deb
        rm ~/teamviewer_i386.deb
    fi
    sudo apt -f install -y
    
    # Reinstall XnViewMP
    if [ $(uname -m) = 'x86_64' ]; then
        wget -P ~ http://download.xnview.com/XnViewMP-linux-x64.deb
        sudo dpkg -i ~/XnViewMP-linux-x64.deb
        rm ~/XnViewMP-linux-x64.deb
    else
        wget -P ~ http://download.xnview.com/XnViewMP-linux.deb
        sudo dpkg -i ~/XnViewMP-linux.deb
        rm ~/XnViewMP-linux.deb
    fi
    sudo apt -f install -y
    xdg-mime default XnView.desktop $(grep '^image/*' /usr/share/mime/types)

    # Register Evince extensions
    if which evince >/dev/null; then
        xdg-mime default evince.desktop `grep 'MimeType=' /usr/share/applications/evince.desktop | sed -e 's/.*=//' -e 's/;/ /g'`
    fi
    
    # Register Atril extensions
    if which atril >/dev/null; then
        xdg-mime default atril.desktop `grep 'MimeType=' /usr/share/applications/atril.desktop | sed -e 's/.*=//' -e 's/;/ /g'`
    fi
    
    sudo software-properties-gtk
    exit
fi

# Fix "Device not managed" issue in Network Manager
if [[ -f '/usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf' ]]; then
    sudo rm /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf
    sudo touch /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
fi

# Fix broken packages
sudo apt -f install -y

# Old kernels
if [[ ! -f '/var/run/reboot-required' ]]; then
   dpkg -l 'linux-image-*' 'linux-headers-*' 'linux-modules-*' \
   | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'\
   | xargs sudo apt purge --auto-remove -y
fi

# Unused libs
sudo deborphan --exclude=kodi-pvr-iptvsimple | xargs sudo apt purge --auto-remove -y
sudo apt autoremove --purge -y

# Additional cleaning with Bleachbit
sudo bleachbit -c --preset
sleep 1
poweroff
