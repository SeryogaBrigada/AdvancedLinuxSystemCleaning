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

function cleanFirefoxProfile {
    if [[ -d $1 ]]; then
        cd "$1"
        rm -rf \
        blocklist* \
        bookmarkbackups \
        crashes \
        datareporting \
        minidumps \
        saved-telemetry-pings \
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
        serviceworker.* \
        SecurityPreloadState.* \
        SiteSecurityServiceState.* \
        storage.* \
        Telemetry.ShutdownTime.* \
        times.* \
        webappsstore.* \
        weave \
        >/dev/null 2>&1
        cd ..
    fi
}

function cleanFirefox {
    # 1 argument - path to profile
    # 2 argument - path to cache directory
    if [[ -d $1 ]]; then
        cd "$1"
        rm -r "Crash Reports" >/dev/null 2>&1
        rm -r "Pending Pings" >/dev/null 2>&1
        # Get a list of profiles directories
        for dir in */; do
            # Remove trailing "/" from the directory name
            dir=${dir%*/}
            cleanFirefoxProfile $dir
        done
    fi

    [[ -d $2/mozilla ]] && rm -r "$2/mozilla";
    [[ -d $2/fontconfig ]] && rm -r "$2/fontconfig";
    [[ -d $2/nvidia ]] && rm -r "$2/nvidia";
}

# Mozilla Firefox
cleanFirefox ~/.mozilla/firefox ~/.cache
cleanFirefox ~/snap/firefox/common/.mozilla/firefox ~/snap/firefox/common/.cache

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
function cleanChrome {
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

function cleanElectronContainer {
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

# Simple Screen Recorder
if [[ -d ~/.ssr/logs ]]; then
    rm -rf ~/.ssr/logs/* >/dev/null 2>&1
fi

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

# Wine cache
if [[ -d ~/.wine ]]; then
    rm -rf ~/.wine/drive_c/users/$USER/Temp/* >/dev/null 2>&1
    rm -rf ~/.wine/drive_c/windows/temp/* >/dev/null 2>&1
fi

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
# Arch Linux specific cleaning
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

    # Fix blocked database error
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
# Remove old PPA after release upgrade
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

    [[ -f /etc/apt/sources.list ]] && sudo rm /etc/apt/sources.list;
    sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
    sudo software-properties-gtk
    exit
fi

# Launchpad cache
[[ -d ~/.launchpadlib ]] && sudo rm -r ~/.launchpadlib;

# Fix broken packages
sudo apt -f install -y

# Old kernels
if [[ ! -f '/var/run/reboot-required' ]]; then
    dpkg -l 'linux-image-*' 'linux-headers-*' 'linux-modules-*' \
    | sed '/^ii\|^rc/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' \
    | grep -v -E '*-hwe-*' \
    | xargs sudo apt purge --auto-remove -y
fi

# Remove unused packages (but keep dotnet since it can be marked as orphan)
if which deborphan >/dev/null 2>&1; then
    sudo deborphan | grep -v -E 'dotnet-*' | xargs sudo apt purge --auto-remove -y
fi

sudo apt autoremove --purge -y
sudo fstrim -av
sleep 2
poweroff
