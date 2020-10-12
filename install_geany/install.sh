#!/bin/bash
# ACTION: Install Geany and set as default editor
# INFO: Geany is free text editor, very fast and beautiful, that supports many programming and markup languages
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }


# Install package
echo -e "\e[1mInstalling packages...\e[0m"
apt-get -y install geany || exit 1

# Set as default
echo -e "\e[1mSetting as default alternative...\e[0m"
update-alternatives --install /usr/bin/x-text-editor x-text-editor /usr/bin/geany 90 && \
update-alternatives --set x-text-editor /usr/bin/geany

