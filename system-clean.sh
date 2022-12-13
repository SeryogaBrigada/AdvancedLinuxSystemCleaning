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

# Update flatpak
if which flatpak >/dev/null 2>&1; then
    flatpak update --noninteractive
fi

# Mozilla Firefox
if [[ -d ~/.mozilla/firefox ]]; then
    rm -r ~/.mozilla/firefox/Crash\ Reports >/dev/null 2>&1
    rm -r ~/.mozilla/firefox/Pending\ Pings >/dev/null 2>&1
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
    weave \
    >/dev/null 2>&1
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
    "Visited Links" \
    >/dev/null 2>&1

    cd "Local Storage"
    find . -type f -not -name 'chrome*' -print0 | xargs -0 rm --
fi

# Google chrome, Chromium
function cleanChrome() {
if [[ -d ~/.config/$1 ]]; then
    cd ~/.config/$1
    rm -rf \
    "AutofillRegex" \
    "AutofillStates" \
    "BrowserMetrics" \
    "CertificateTransparency" \
    "CertificateRevocation" \
    "ClientSidePhishing" \
    "Consent To Send Stats" \
    "Crash Reports" \
    "Crowd Deny" \
    "DesktopSharingHub" \
    "EVWhitelist" \
    "FileTypePolicies" \
    "FirstPartySetsPreloaded" \
    "Floc" \
    "GrShaderCache" \
    "InterventionPolicyDatabase" \
    "MEIPreload" \
    "NativeMessagingHosts" \
    "OnDeviceHeadSuggestModel" \
    "OptimizationHints" \
    "OriginTrials" \
    "PKIMetadata" \
    "Policy" \
    "ShaderCache" \
    "Subresource Filter" \
    "TLSDeprecationConfig" \
    "TrustTokenKeyCommitments" \
    "UrlParamClassifications" \
    "Webstore Downloads" \
    "WidevineCdm" \
    "SSLErrorAssistant" \
    "Certificate Revocation Lists" \
    "ZxcvbnData" \
    "pnacl" \
    "hyphen-data" \
    Safe* \
    BrowserMetrics-spare.* \
    chrome_shutdown_ms.txt \
    .com.google.Chrome.* \
    persisted_first_party_sets.json \
    >/dev/null 2>&1

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
    "commerce_subscription_db" \
    "coupon_db" \
    "data_reduction_proxy_leveldb" \
    "databases" \
    "DawnCache" \
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
    "WebrtcVideoStats" \
    "webrtc_event_logs" \
    optimization_guide_* \
    .com.google.Chrome.* \
    .org.chromium.Chromium.* \
    heavy_ad_intervention_opt_out.* \
    previews_opt_out.* \
    page_load_capping_opt_out.* \
    in_progress_download_metadata_store \
    >/dev/null 2>&1
fi
}

cleanChrome google-chrome
cleanChrome google-chrome-beta
cleanChrome google-chrome-unstable
cleanChrome chromium

function cleanElectronContainer () {
    if [[ -d ~/.config/$1 ]]; then
        cd ~/.config
        cd "${1}"
        rm -rf \
        "Application Cache" \
        blob_storage \
        Cache \
        CachedData \
        "Code Cache" \
         "Crashpad"
        "Crash Reports" \
        "exthost Crash Reports" \
        CS_skylib \
        databases \
        GPUCache \
        "Service Worker" \
        VideoDecodeStats \
        logs \
        tmp \
        media-stack \
        ecscache.json \
        skylib \
        LOG \
        logs.txt \
        old_logs_* \
        "Network Persistent State" \
        QuotaManager \
        QuotaManager-journal \
        TransportSecurity \
        watchdog* \
        >/dev/null 2>&1
    fi
}

# Skype
cleanElectronContainer skypeforlinux

# Microsoft Teams
cleanElectronContainer "Microsoft/Microsoft Teams"

# Microsoft Visual Studio Code
cleanElectronContainer "Code - OSS"
cleanElectronContainer "Code"

# Adobe Flash Player
[[ -d ~/.adobe ]] && sudo rm -r ~/.adobe;
[[ -d ~/.macromedia ]] && sudo rm -r ~/.macromedia;

# Kodi media center
if [[ -d ~/.kodi ]]; then
    rm -rf ~/.kodi/temp/* >/dev/null 2>&1
    rm ~/kodi_crashlog*.log >/dev/null 2>&1
    rm ~/core >/dev/null 2>&1
fi

# ccache
if which ccache >/dev/null 2>&1; then
    ccache -C
fi

# System cache
sudo rm -rf ~/.cache/*

# Nvidia cache
[[ -d ~/.nv ]] && sudo rm -r ~/.nv;

# Launchpad cache
[[ -d ~/.launchpadlib ]] && sudo rm -r ~/.launchpadlib;

# Wine cache
if [[ -d ~/.wine ]]; then
    rm -rf ~/.wine/drive_c/users/$USER/Temp/* >/dev/null 2>&1
    rm -rf ~/.wine/drive_c/windows/temp/* >/dev/null 2>&1
fi

# GVFS-metadata (Must be disabled for Budgie)
sudo rm -rf ~/.local/share/gvfs-metadata/* >/dev/null 2>&1

# WGET hosts file
[[ -f ~/.wget-hsts ]] && rm ~/.wget-hsts;

# Error messages
sudo rm -rf /var/crash/* >/dev/null 2>&1

# Bleachbit
if which bleachbit >/dev/null 2>&1; then
    bleachbit -c --preset
    sudo bleachbit -c --preset
fi

#
# ArchLinux specific cleaning
#
if which pacman >/dev/null 2>&1; then
    # Optimus manager
    if which optimus-manager >/dev/null 2>&1; then
        sudo rm -rf /var/log/optimus-manager
    fi

    # Pamac
    if [[ -d /var/tmp/pamac ]]; then
        sudo rm -rf /var/tmp/pamac >/dev/null 2>&1
        sudo rm -rf /var/tmp/pamac-build-* >/dev/null 2>&1
    fi

    [[ -f /var/lib/pacman/db.lck ]] && sudo rm /var/lib/pacman/db.lck;
    if which yay >/dev/null 2>&1; then
        yay -Yc --noconfirm
    fi
    #sudo pacman -Rs $(pacman -Qtdq) --noconfirm
    sudo pacman -Sc --noconfirm
    sudo paccache -rk 0
    sudo fstrim -av
    sleep 2
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
     -not -name 'google-chrome*' \
     -print0 | xargs -0 sudo rm --

    rm -r ~/.config/pulse

    # Upgrade XnViewMP if installed
    if which xnviewmp >/dev/null 2>&1; then
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
    fi
    
    # Register Evince extensions
    if which evince >/dev/null 2>&1; then
        xdg-mime default evince.desktop `grep 'MimeType=' /usr/share/applications/evince.desktop | sed -e 's/.*=//' -e 's/;/ /g'`
    fi

    # Register Atril extensions
    if which atril >/dev/null 2>&1; then
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
if which deborphan >/dev/null 2>&1; then
    sudo deborphan --exclude=mesa-vulkan-drivers | xargs sudo apt purge --auto-remove -y
fi

sudo apt autoremove --purge -y
sudo fstrim -av
sleep 2
poweroff
