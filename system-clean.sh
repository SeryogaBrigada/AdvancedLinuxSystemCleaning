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
	cd $homedir/.mozilla/firefox/*.default
	rm -r bookmarkbackups
	rm -r crashes
	rm -r datareporting
	rm -r minidumps
	rm -r saved-telemetry-pings
	rm -r sessionstore-backups
	rm -r storage
	rm addons.json
	rm AlternateServices.txt
	rm containers.json
	rm content-prefs.sqlite
#	rm cookies.sqlite
	rm mimeTypes.rdf
	rm permissions.sqlite
	rm pluginreg.dat
	rm secmod.db
	rm sessionCheckpoints.json
	rm sessionstore.js
	rm SiteSecurityServiceState.txt
	rm storage.sqlite
	rm Telemetry.ShutdownTime.txt
	rm times.json
	rm webappsstore.sqlite
fi

#
# Opera
#
if [ -d $homedir/.config/opera* ]; then
	cd $homedir/.config/opera*
	rm -r "adblocker_data"
	rm -r "Extension State"
	rm -r "GPUCache"
	rm -r "IndexedDB"
	rm -r "ShaderCache"
	rm -r "Pepper Data"
	rm -r "Platform Notifications"
	rm -r "Service Worker"
	rm -r "Opera Add-ons Downloads"
	rm autoupdate_checker.sqlite
	rm BookmarksExtras
	rm browser.js
	rm "Certificate Revocation Lists"
#	rm Cookies*
	rm "Current Session"
	rm default_partner_content.json
	rm "Extension Cookies"
	rm "Extension Cookies-journal"
#	rm History
#	rm "History Provider Cache"
#	rm "History-journal"
	rm "Last Session"
	rm "Login Data"
	rm "Login Data-journal"
	rm "Network Persistent State"
	rm "Network Action Predictor"
	rm "Network Action Predictor-journal"
	rm opera_autoupdate.log
	rm oauc_pipe*
	rm previews_opt_out.db
	rm previews_opt_out.db-journal
	rm "Origin Bound Certs"
	rm "Origin Bound Certs-journal"
	rm QuotaManager
	rm QuotaManager-journal
	rm Shortcuts
	rm Shortcuts-journal
	rm siteprefs.json
	rm ssdfp*
	rm TransportSecurity
	rm "Visited Links"

	cd "Local Storage"
	find . -type f -not -name 'chrome*' -print0 | xargs -0 rm --
fi

#
# Chromium browser
#
if [ -d $homedir/.config/chromium ]; then
	cd $homedir/.config/chromium
	rm -r "CertificateTransparency"
	rm -r "Crash Reports"
	rm -r "EVWhitelist"
	rm -r "OriginTrials"
	rm -r "ShaderCache"
	rm -r "Webstore Downloads"
	rm -r "WidevineCdm"
	rm "Certificate Revocation Lists"
	rm Safe*
	
	cd Default
	rm -r "data_reduction_proxy_leveldb"
	rm -r "GPUCache"
	rm -r "IndexedDB"
	rm -r "Pepper Data"
	rm -r "Service Worker"
	rm -r "Extension State"
	rm -r "Session Storage"
	rm -r "Local Storage"
#	rm Cookies*
#	rm "Current Session"
#	rm "Current Tabs"
	rm DownloadMetadata
#	rm History
#	rm "History Provider Cache"
#	rm "History-journal"
#	rm "Last Session"
#	rm "Last Tabs"
	rm "Login Data"
	rm "Login Data-journal"
	rm "Network Action Predictor"
	rm "Network Action Predictor-journal"
	rm "Network Persistent State"
	rm "Origin Bound Certs"
	rm "Origin Bound Certs-journal"
	rm previews_opt_out.db
	rm previews_opt_out.db-journal
	rm QuotaManager
	rm QuotaManager-journal
	rm "Secure Preferences"
	rm Shortcuts
	rm Shortcuts-journal
	rm "Top Sites"
	rm "Top Sites-journal"
	rm TransportSecurity
	rm "Visited Links"
	rm "Web Data"
	rm "Web Data-journal"
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
# System cache
#
sudo rm -rf $homedir/.cache/*

#
# Nvidia cache
#
if [ -d $homedir/.nv ]; then
	sudo rm -r $homedir/.nv
fi

#
# Lauchpad cache
#
if [ -d $homedir/.launchpadlib ]; then
	sudo rm -r $homedir/.launchpadlib
fi

#
# GVFS-metadata
#
sudo rm -rf $homedir/.local/share/gvfs-metadata/*

#
# Error messages
#
sudo rm -rf /var/crash/*

#
# After release upgrade
#
# Remove old apt sources
#
find /etc/apt/sources.list.d -type f -not -name *$(lsb_release -sc)* -not -name 'opera*' -not -name 'virtualbox*' -print0 | xargs -0 sudo rm --
find /etc/apt/apt.conf.d -name '*.ucf-old' -print0 | xargs -0 sudo rm --
find /etc/apt/apt.conf.d -name '*.ucf-dist' -print0 | xargs -0 sudo rm --

if filecount=$(find /etc/apt -name '*.distUpgrade' | wc -l); ! [ $filecount -eq 0  ]; then
	find /etc/apt -name '*.distUpgrade' -print0 | xargs -0 sudo rm --
	find /etc/apt/sources.list.d -name '*.distUpgrade' -print0 | xargs -0 sudo rm --

	# Autoremove unused dependencies
	sudo sed -i 's/\/\/Unattended-Upgrade::Remove-Unused-Dependencies "false"/Unattended-Upgrade::Remove-Unused-Dependencies "true"/g' /etc/apt/apt.conf.d/50unattended-upgrades

        #
        # Add necessary ppa
        #

	# Mozilla Firefox
	sudo add-apt-repository ppa:mozillateam/firefox-next -y
	# LibreOffice
	sudo add-apt-repository ppa:libreoffice/ppa -y
	# DoubleCommander
	#sudo add-apt-repository ppa:alexx2000/doublecmd -y
	# RawTherapee
	#sudo add-apt-repository ppa:dhor/myway -y
	# Gimp
	#sudo add-apt-repository ppa:otto-kesselgulasch/gimp-edge -y
	# OpenShot
	#sudo add-apt-repository ppa:openshot.developers/ppa -y

	# Nvidia latest drivers
	#sudo add-apt-repository ppa:graphics-drivers/ppa -y
fi

# Fix "Device not managed" issue in Network Manager
if [ -f /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf ]; then
	sudo rm /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf
	sudo touch /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
fi

#
# Old kernels
#
sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get purge -y

#
# Unused libs
#
sudo deborphan --exclude 'kodi-pvr-iptvsimple' | xargs sudo apt-get purge -y
sudo apt-get autoremove --purge -y

#
# Additional cleaning with Bleachbit
#
sudo bleachbit -c --preset
