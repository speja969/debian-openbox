#!/bin/bash
# ACTION: Install Firefox-ESR and set has default browser
# INFO: Firefox-ESR is most popular web browser without Chromium engine
# INFO: Its recommended config official repositories for weekly updates
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }


# Install package
echo -e "\e[1mInstalling packages...\e[0m"
[ "$(find /var/cache/apt/pkgcache.bin -mtime 0 2>/dev/null)" ] || apt-get update 
apt-get install -y firefox-esr

# Set as default
echo -e "\e[1mSetting as default alternative...\e[0m"
update-alternatives --set x-www-browser /usr/bin/firefox-esr
update-alternatives --set gnome-www-browser /usr/bin/firefox-esr
