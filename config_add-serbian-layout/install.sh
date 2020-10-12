#!/bin/bash
# ACTION: Add serbian Flag and Keyboard layout
# INFO: Serbian flag was omitted when selecting the keyboard layout
# DEFAULT: y

sudo apt update && sudo apt upgrade

sudo apt-get -y install fbxkb

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1vMHNIL_ttMWCxq2kzy_TKCEYPlqf2Ldq' -O ~/keyboard.sh

sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=12nPRtRPMelXqHlGjEmputrBvT-uRbir6' -O /usr/share/fbxkb/images/rs.png

echo '~/keyboard.sh &' >> ~/.config/openbox/autostart

echo 'fbxkb &' >> ~/.config/openbox/autostart

sudo chmod a+x ~/keyboard.sh
