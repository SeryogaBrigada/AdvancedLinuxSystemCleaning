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
        rm -rf >/dev/null 2>&1 blocklist*
        rm -rf >/dev/null 2>&1 bookmarkbackups
        rm -rf >/dev/null 2>&1 crashes
        rm -rf >/dev/null 2>&1 datareporting
        rm -rf >/dev/null 2>&1 minidumps
        rm -rf >/dev/null 2>&1 saved-telemetry-pings
        rm -rf >/dev/null 2>&1 addons.*
        rm -rf >/dev/null 2>&1 AlternateServices.*
        rm -rf >/dev/null 2>&1 containers.*
        rm -rf >/dev/null 2>&1 content-prefs.*
        rm -rf >/dev/null 2>&1 handlers.*
        rm -rf >/dev/null 2>&1 kinto.*
        rm -rf >/dev/null 2>&1 mimeTypes.*
        rm -rf >/dev/null 2>&1 permissions.*
        rm -rf >/dev/null 2>&1 pluginreg.*
        rm -rf >/dev/null 2>&1 secmod.*
        rm -rf >/dev/null 2>&1 serviceworker.*
        rm -rf >/dev/null 2>&1 sessionstore-logs
        rm -rf >/dev/null 2>&1 SecurityPreloadState.*
        rm -rf >/dev/null 2>&1 SiteSecurityServiceState.*
        rm -rf >/dev/null 2>&1 storage.*
        rm -rf >/dev/null 2>&1 Telemetry.ShutdownTime.*
        rm -rf >/dev/null 2>&1 times.*
        rm -rf >/dev/null 2>&1 webappsstore.*
        rm -rf >/dev/null 2>&1 weave
        cd ..
    fi
}

function cleanFirefox {
    # 1 argument - path to profile
    # 2 argument - path to cache directory
    if [[ -d $1 ]]; then
        cd "$1"
        rm -rf >/dev/null 2>&1 "Crash Reports"
        rm -rf >/dev/null 2>&1 "Pending Pings"
        # Get a list of profiles directories
        for dir in */; do
            # Remove trailing "/" from the directory name
            dir=${dir%*/}
            cleanFirefoxProfile $dir
        done
    fi

    [[ -d $2/mozilla ]] && rm -rf "$2/mozilla";
    [[ -d $2/fontconfig ]] && rm -rf "$2/fontconfig";
    [[ -d $2/nvidia ]] && rm -rf "$2/nvidia";
}

# Mozilla Firefox
cleanFirefox ~/.mozilla/firefox ~/.cache
cleanFirefox ~/snap/firefox/common/.mozilla/firefox ~/snap/firefox/common/.cache

# Opera
if [ -d ~/.config/opera* ]; then
    cd ~/.config/opera*
    rm -rf >/dev/null 2>&1 adblocker_data
    rm -rf >/dev/null 2>&1 "Extension State"
    rm -rf >/dev/null 2>&1 GPUCache
    rm -rf >/dev/null 2>&1 IndexedDB
    rm -rf >/dev/null 2>&1 ShaderCache
    rm -rf >/dev/null 2>&1 "Pepper Data"
    rm -rf >/dev/null 2>&1 "Platform Notifications"
    rm -rf >/dev/null 2>&1 "Service Worker"
    rm -rf >/dev/null 2>&1 "Opera Add-ons Downloads"
    rm -rf >/dev/null 2>&1 autoupdate_checker.*
    rm -rf >/dev/null 2>&1 BookmarksExtras
    rm -rf >/dev/null 2>&1 browser.js
    rm -rf >/dev/null 2>&1 "Certificate Revocation Lists"
    rm -rf >/dev/null 2>&1 default_partner_content.*
    rm -rf >/dev/null 2>&1 "Extension Cookies"
    rm -rf >/dev/null 2>&1 "Extension Cookies-journal"
    rm -rf >/dev/null 2>&1 Login*
    rm -rf >/dev/null 2>&1 Network*
    rm -rf >/dev/null 2>&1 opera_autoupdate.log
    rm -rf >/dev/null 2>&1 oauc_pipe*
    rm -rf >/dev/null 2>&1 previews_opt_out.*
    rm -rf >/dev/null 2>&1 Origin*
    rm -rf >/dev/null 2>&1 QuotaManager*
    rm -rf >/dev/null 2>&1 Shortcuts*
    rm -rf >/dev/null 2>&1 siteprefs.*
    rm -rf >/dev/null 2>&1 ssdfp*
    rm -rf >/dev/null 2>&1 TransportSecurity
    rm -rf >/dev/null 2>&1 "Visited Links"

    cd "Local Storage"
    find . -type f -not -name 'chrome*' -print0 | xargs -0 rm --
fi

# Google chrome, Chromium
function cleanChrome {
if [[ -d ~/.config/$1 ]]; then
    cd ~/.config/$1
    rm -rf >/dev/null 2>&1 AutofillRegex
    rm -rf >/dev/null 2>&1 AutofillStates
    rm -rf >/dev/null 2>&1 BrowserMetrics
    rm -rf >/dev/null 2>&1 CertificateTransparency
    rm -rf >/dev/null 2>&1 CertificateRevocation
    rm -rf >/dev/null 2>&1 ClientSidePhishing
    rm -rf >/dev/null 2>&1 "Consent To Send Stats"
    rm -rf >/dev/null 2>&1 "Crash Reports"
    rm -rf >/dev/null 2>&1 "Crowd Deny"
    rm -rf >/dev/null 2>&1 DesktopSharingHub
    rm -rf >/dev/null 2>&1 EVWhitelist
    rm -rf >/dev/null 2>&1 FileTypePolicies
    rm -rf >/dev/null 2>&1 FirstPartySetsPreloaded
    rm -rf >/dev/null 2>&1 Floc
    rm -rf >/dev/null 2>&1 GrShaderCache
    rm -rf >/dev/null 2>&1 InterventionPolicyDatabase
    rm -rf >/dev/null 2>&1 MEIPreload
    rm -rf >/dev/null 2>&1 NativeMessagingHosts
    rm -rf >/dev/null 2>&1 OnDeviceHeadSuggestModel
    rm -rf >/dev/null 2>&1 OptimizationHints
    rm -rf >/dev/null 2>&1 OriginTrials
    rm -rf >/dev/null 2>&1 PKIMetadata
    rm -rf >/dev/null 2>&1 Policy
    rm -rf >/dev/null 2>&1 ShaderCache
    rm -rf >/dev/null 2>&1 "Subresource Filter"
    rm -rf >/dev/null 2>&1 TLSDeprecationConfig
    rm -rf >/dev/null 2>&1 TrustTokenKeyCommitments
    rm -rf >/dev/null 2>&1 UrlParamClassifications
    rm -rf >/dev/null 2>&1 "Webstore Downloads"
    rm -rf >/dev/null 2>&1 WidevineCdm
    rm -rf >/dev/null 2>&1 SSLErrorAssistant
    rm -rf >/dev/null 2>&1 "Certificate Revocation Lists"
    rm -rf >/dev/null 2>&1 ZxcvbnData
    rm -rf >/dev/null 2>&1 pnacl
    rm -rf >/dev/null 2>&1 hyphen-data
    rm -rf >/dev/null 2>&1 Safe*
    rm -rf >/dev/null 2>&1 BrowserMetrics-spare.*
    rm -rf >/dev/null 2>&1 chrome_shutdown_ms.txt
    rm -rf >/dev/null 2>&1 .com.google.Chrome.*
    rm -rf >/dev/null 2>&1 persisted_first_party_sets.json

    cd Default
    rm -rf >/dev/null 2>&1 Accounts
    rm -rf >/dev/null 2>&1 AutofillStrikeDatabase
    rm -rf >/dev/null 2>&1 *.ldb
    rm -rf >/dev/null 2>&1 *.log
    rm -rf >/dev/null 2>&1 "Affiliation Database"
    rm -rf >/dev/null 2>&1 "Affiliation Database-journal"
    rm -rf >/dev/null 2>&1 "Application Cache"
    rm -rf >/dev/null 2>&1 BudgetDatabase
    rm -rf >/dev/null 2>&1 blob_storage
    rm -rf >/dev/null 2>&1 commerce_subscription_db
    rm -rf >/dev/null 2>&1 coupon_db
    rm -rf >/dev/null 2>&1 "data_reduction_proxy_leveldb"
    rm -rf >/dev/null 2>&1 databases
    rm -rf >/dev/null 2>&1 DawnCache
    rm -rf >/dev/null 2>&1 "Download Service"
    rm -rf >/dev/null 2>&1 "Extension State"
    rm -rf >/dev/null 2>&1 "Feature Engagement Tracker"
    rm -rf >/dev/null 2>&1 "File System"
    rm -rf >/dev/null 2>&1 "GCM Store"
    rm -rf >/dev/null 2>&1 GPUCache
    rm -rf >/dev/null 2>&1 "Managed Extension Settings"
    rm -rf >/dev/null 2>&1 IndexedDB
    rm -rf >/dev/null 2>&1 "Pepper Data"
    rm -rf >/dev/null 2>&1 "Platform Notifications"
    rm -rf >/dev/null 2>&1 "Site Characteristics Database"
    rm -rf >/dev/null 2>&1 shared_proto_db
    rm -rf >/dev/null 2>&1 "Service Worker"
    rm -rf >/dev/null 2>&1 Thumbnails
    rm -rf >/dev/null 2>&1 "Session Storage"
    rm -rf >/dev/null 2>&1 DownloadMetadata
    rm -rf >/dev/null 2>&1 "Extension Cookies"
    rm -rf >/dev/null 2>&1 "Extension Cookies-journal"
    rm -rf >/dev/null 2>&1 "Local Storage"
    rm -rf >/dev/null 2>&1 LOCK
    rm -rf >/dev/null 2>&1 LOG
    rm -rf >/dev/null 2>&1 LOG.old
    rm -rf >/dev/null 2>&1 MANIFEST-*
    rm -rf >/dev/null 2>&1 Network*
    rm -rf >/dev/null 2>&1 Origin*
    rm -rf >/dev/null 2>&1 QuotaManager*
    rm -rf >/dev/null 2>&1 "Reporting and NEL"
    rm -rf >/dev/null 2>&1 "Reporting and NEL-journal"
    rm -rf >/dev/null 2>&1 "Secure Preferences"
    rm -rf >/dev/null 2>&1 Shortcuts*
    rm -rf >/dev/null 2>&1 Storage
    rm -rf >/dev/null 2>&1 "Top Sites"
    rm -rf >/dev/null 2>&1 "Top Sites-journal"
    rm -rf >/dev/null 2>&1 "Translate Ranker Model"
    rm -rf >/dev/null 2>&1 TransportSecurity
    rm -rf >/dev/null 2>&1 "Search Logos"
    rm -rf >/dev/null 2>&1 "Visited Links"
    rm -rf >/dev/null 2>&1 "VideoDecodeStats"
    rm -rf >/dev/null 2>&1 "WebRTC Logs"
    rm -rf >/dev/null 2>&1 "WebrtcVideoStats"
    rm -rf >/dev/null 2>&1 "webrtc_event_logs"
    rm -rf >/dev/null 2>&1 optimization_guide_*
    rm -rf >/dev/null 2>&1 .com.google.Chrome.*
    rm -rf >/dev/null 2>&1 .org.chromium.Chromium.*
    rm -rf >/dev/null 2>&1 heavy_ad_intervention_opt_out.*
    rm -rf >/dev/null 2>&1 previews_opt_out.*
    rm -rf >/dev/null 2>&1 page_load_capping_opt_out.*
    rm -rf >/dev/null 2>&1 in_progress_download_metadata_store
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
        rm -rf >/dev/null 2>&1 "Application Cache"
        rm -rf >/dev/null 2>&1 blob_storage
        rm -rf >/dev/null 2>&1 Cache
        rm -rf >/dev/null 2>&1 CachedData
        rm -rf >/dev/null 2>&1 "Code Cache"
        rm -rf >/dev/null 2>&1 Crashpad
        rm -rf >/dev/null 2>&1 "Crash Reports"
        rm -rf >/dev/null 2>&1 "exthost Crash Reports"
        rm -rf >/dev/null 2>&1 CS_skylib
        rm -rf >/dev/null 2>&1 databases
        rm -rf >/dev/null 2>&1 GPUCache
        rm -rf >/dev/null 2>&1 "Service Worker"
        rm -rf >/dev/null 2>&1 VideoDecodeStats
        rm -rf >/dev/null 2>&1 logs
        rm -rf >/dev/null 2>&1 tmp
        rm -rf >/dev/null 2>&1 media-stack
        rm -rf >/dev/null 2>&1 ecscache.json
        rm -rf >/dev/null 2>&1 skylib
        rm -rf >/dev/null 2>&1 LOG
        rm -rf >/dev/null 2>&1 logs.txt
        rm -rf >/dev/null 2>&1 old_logs_*
        rm -rf >/dev/null 2>&1 "Network Persistent State"
        rm -rf >/dev/null 2>&1 QuotaManager
        rm -rf >/dev/null 2>&1 QuotaManager-journal
        rm -rf >/dev/null 2>&1 TransportSecurity
        rm -rf >/dev/null 2>&1 watchdog*
    fi
}

# Skype
cleanElectronContainer skypeforlinux

# Microsoft Teams
cleanElectronContainer "Microsoft/Microsoft Teams"

# Microsoft Visual Studio Code
cleanElectronContainer "Code - Insiders"
cleanElectronContainer "Code - OSS"
cleanElectronContainer "Code"

# Simple Screen Recorder
if [[ -d ~/.ssr/logs ]]; then
    rm -rf >/dev/null 2>&1 ~/.ssr/logs/*
fi

# Kodi media center
if [[ -d ~/.kodi ]]; then
    rm -rf >/dev/null 2>&1 ~/.kodi/temp/*
    rm -rf >/dev/null 2>&1 ~/kodi_crashlog*.log
    rm -rf >/dev/null 2>&1 ~/core
fi

# HandBrake
if [[ -d ~/.config/ghb/ ]]; then
    rm -rf >/dev/null 2>&1 ~/.config/ghb/EncodeLogs/*
    rm -rf >/dev/null 2>&1 ~/.config/ghb/Activity.log.*
fi

# ccache
if which ccache >/dev/null 2>&1; then
    ccache -C
fi

# System cache
sudo rm -rf >/dev/null 2>&1 ~/.cache/*

# Nvidia cache
[[ -d ~/.nv ]] && sudo rm -rf ~/.nv;

# Wine cache
if [[ -d ~/.wine ]]; then
    rm -rf >/dev/null 2>&1 ~/.wine/drive_c/users/$USER/Temp/*
    rm -rf >/dev/null 2>&1 ~/.wine/drive_c/windows/temp/*
fi

# WGET hosts file
[[ -f ~/.wget-hsts ]] && rm -f ~/.wget-hsts;

# Error messages
sudo rm -rf >/dev/null 2>&1 /var/crash/*

# Bleachbit
if which bleachbit >/dev/null 2>&1; then
    bleachbit -c --preset
    sudo bleachbit -c --preset
fi


#
# Arch Linux specific cleaning
#
if which pacman >/dev/null 2>&1; then
    if [[ -f /etc/pacman.d/mirrorlist.pacnew ]] then
        sudo rm /etc/pacman.d/mirrorlist
        sudo mv /etc/pacman.d/mirrorlist.pacnew /etc/pacman.d/mirrorlist
    fi

    # Endveavour OS old mirrors
    if [[ -f /etc/pacman.d/endeavouros-mirrorlist.pacnew ]] then
        sudo rm /etc/pacman.d/endeavouros-mirrorlist
        sudo mv /etc/pacman.d/endeavouros-mirrorlist.pacnew /etc/pacman.d/endeavouros-mirrorlist
    fi

    find /etc/pacman.d -maxdepth 1 -type f \( -name 'endeavouros-mirrorlist.*' -o -name '*.bak' \) -print0 | xargs -0 sudo rm --

    # Optimus manager
    if which optimus-manager >/dev/null 2>&1; then
        sudo rm -rf >/dev/null 2>&1 /var/log/optimus-manager
    fi

    # Pamac
    if [[ -d /var/tmp/pamac ]]; then
        sudo rm -rf >/dev/null 2>&1 /var/tmp/pamac
        sudo rm -rf >/dev/null 2>&1 /var/tmp/pamac-build-*
    fi

    # Fix blocked database error
    [[ -f /var/lib/pacman/db.lck ]] && sudo rm /var/lib/pacman/db.lck;
    if which yay >/dev/null 2>&1; then
        yay -Yc --noconfirm
    fi
    #sudo pacman -Rs $(pacman -Qtdq) --noconfirm
    sudo pacman -Sc --noconfirm
    sudo paccache -rk 0
fi


#
# Ubuntu/Debian specific cleaning
#
if which apt >/dev/null 2>&1; then
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
    [[ -d ~/.launchpadlib ]] && sudo rm -rf ~/.launchpadlib;

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
fi

# Final actions
sudo fstrim -av

# Do not power off if DO_NOT_POWEROFF variable is set
if [ ! -z $DO_NOT_POWEROFF ]; then
    exit
fi

sleep 2
poweroff
