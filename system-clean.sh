#!/bin/bash
#######################################################
#
#              Advanced system cleaning
#
#######################################################

# Mozilla Firefox
if [[ -d ~/.mozilla/firefox ]]; then
    rm -r ~/.mozilla/firefox/Crash\ Reports
    rm -r ~/.mozilla/firefox/Pending\ Pings
    cd ~/.mozilla/firefox/*.default-release
    rm -rf \
    blocklist* \
    bookmarkbackups \
    crashes \
    datareporting \
    minidumps \
    saved-telemetry-pings \
    sessionstore-backups \
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
#    rm formhistory.*
#    rm search.json.*
fi

# Opera
if [ -d ~/.config/opera* ]; then
    cd ~/.config/opera*
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
#    rm History*
#    rm Current*
#    rm Last*

    cd "Local Storage"
    find . -type f -not -name 'chrome*' -print0 | xargs -0 rm --
fi

# Google chrome, Chromium
function cleanChrome() {
if [[ -d ~/.config/$1 ]]; then
    cd ~/.config/$1
    rm -rf \
    "BrowserMetrics" \
    "CertificateTransparency" \
    "CertificateRevocation" \
    "Consent To Send Stats" \
    "Crash Reports" \
    "Crowd Deny" \
    "EVWhitelist" \
    "FileTypePolicies" \
    "GrShaderCache" \
    "InterventionPolicyDatabase" \
    "MEIPreload" \
    "NativeMessagingHosts" \
    "OriginTrials" \
    "Policy" \
    "ShaderCache" \
    "Subresource Filter" \
    "TLSDeprecationConfig" \
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
    "AutofillStrikeDatabase" \
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
    "Site Characteristics Database" \
    "shared_proto_db" \
    "Service Worker" \
    "Thumbnails" \
    "Session Storage" \
    "DownloadMetadata" \
    "Extension Cookies" \
    "Extension Cookies-journal" \
    "Local Storage" \
    LOCK \
    LOG \
    LOG.old \
    MANIFEST-* \
    Network* \
    Origin* \
    QuotaManager* \
    "Reporting and NEL" \
    "Reporting and NEL-journal" \
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
    "WebRTC Logs" \
    "webrtc_event_logs" \
    .com.google.Chrome.* \
    .org.chromium.Chromium.* \
    heavy_ad_intervention_opt_out.* \
    previews_opt_out.* \
    page_load_capping_opt_out.* \
    in_progress_download_metadata_store

#    rm Cookies*
#    rm History*
#    rm CURRENT
#    rm Current*
#    rm Last*
fi
}

cleanChrome google-chrome
cleanChrome google-chrome-unstable
cleanChrome chromium

# Skype cache
if [[ -d ~/.config/skypeforlinux ]]; then
    cd ~/.config/skypeforlinux
    rm -rf \
    blob_storage \
    Cache \
    "Code Cache" \
    CS_skylib \
    databases \
    GPUCache \
    "Session Storage" \
    logs \
    media-stack \
    ecscache.json \
    skylib \
    SkypeRT \
    LOG \
    "Network Persistent State" \
    QuotaManager \
    QuotaManager-journal \
    TransportSecurity
fi


# Adobe Flash Player
[[ -d ~/.adobe ]] && sudo rm -r ~/.adobe;
[[ -d ~/.macromedia ]] && sudo rm -r ~/.macromedia;

# Kodi media center
if [[ -d ~/.kodi ]]; then
    rm -rf ~/.kodi/temp/*
    rm ~/kodi_crashlog*.log
    rm ~/core
fi

# ccache
if which ccache >/dev/null; then
    sudo ccache -C
fi

# System cache
sudo rm -rf ~/.cache/*

# Nvidia cache
[[ -d ~/.nv ]] && sudo rm -r ~/.nv;

# Launchpad cache
[[ -d ~/.launchpadlib ]] && sudo rm -r ~/.launchpadlib;

# Wine cache
if [[ -d ~/.wine ]]; then
    rm -rf ~/.wine/drive_c/users/$USER/Temp/*
    rm -rf ~/.wine/drive_c/windows/temp/*
fi

# GVFS-metadata (Must be disabled for Budgie)
sudo rm -rf ~/.local/share/gvfs-metadata/*

# WGET hosts file
[[ -f ~/.wget-hsts ]] && rm ~/.wget-hsts;

# Error messages
sudo rm -rf /var/crash/*

# Bleachbit
if which bleachbit >/dev/null; then
    bleachbit -c --preset
    sudo bleachbit -c --preset
fi

#
# ArchLinux cleaning
#
if which pacman >/dev/null; then
    [[ -f /var/lib/pacman/db.lck ]] && sudo rm /var/lib/pacman/db.lck;
    sudo pacman -Rs $(pacman -Qtdq) --noconfirm
    sudo pacman -Sc --noconfirm
    sudo paccache -rk 0
    sudo fstrim -av
    sleep 1
    poweroff
    exit
fi


#
# Ubuntu/Debian specific cleaning
#

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
     
    rm -r ~/.config/pulse
    
    # Reinstall TeamViewer
    sudo apt purge teamviewer -y
    find /var/log -name 'teamviewer*' -print0 | xargs -0 sudo rm -r --
    find ~/.local/share -name 'teamviewer*' -print0 | xargs -0 rm -r --
    [[ -d ~/.config/teamviewer ]] && rm -r ~/.config/teamviewer;

    sudo apt update

    if [ $(uname -m) = 'x86_64' ]; then
        APP=teamviewer_amd64.deb
    else
        APP=teamviewer_i386.deb
    fi
    
    wget -P /tmp https://download.teamviewer.com/download/linux/${APP}
    sudo dpkg -i /tmp/${APP}
    rm /tmp/${APP}
    sudo apt -f install -y
    
    # Reinstall XnViewMP
    sudo apt purge xnview -y
    if [ $(uname -m) = 'x86_64' ]; then
        APP=XnViewMP-linux-x64.deb
    else
        APP=XnViewMP-linux.deb
    fi
    
    wget -P /tmp http://download.xnview.com/${APP}
    sudo dpkg -i /tmp/${APP}
    rm /tmp/${APP}
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

    [[ -f /etc/apt/sources.list ]] && sudo rm /etc/apt/sources.list;
    sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
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
if which deborphan >/dev/null; then
    sudo deborphan --exclude=kodi-pvr-iptvsimple,mesa-vulkan-drivers | xargs sudo apt purge --auto-remove -y
fi

sudo apt autoremove --purge -y
sudo fstrim -av
sleep 1
poweroff

