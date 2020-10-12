#!/bin/bash
# ACTION: Terminal Informations about System
# INFO: Terminal Informations about System
# DEFAULT: y

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1QhNcl8V2LyiuV4bJiv3WYkS9izmOHUKh' -O /usr/bin/debinfo

sudo chmod 777 /usr/bin/debinfo

echo debinfo >> ~/.bashrc
