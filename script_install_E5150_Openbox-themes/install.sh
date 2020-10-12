#!/bin/bash
# ACTION: Install E5150_Themes
# INFO: Install Dark colors monochromatic themes based
# DEFAULT: y

sudo apt update && sudo apt upgrade

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

mkdir ~/.themes          #ako već ne postoji
sudo chown $USER:$USER ~/.themes
sudo chmod 777 ~/.themes
cd ~/.themes
git clone https://github.com/ju1464/E5150_Themes.git
mv ~/.themes/E5150_Themes/GTK-Gnome/* ~/.themes
rm -rf E5150_Themes
