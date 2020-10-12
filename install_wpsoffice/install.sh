#!/bin/bash
# ACTION: Install WPS Office Suite
# INFO: WPS is a privative office suite very similar and compatible with Microsoft Office
# DEFAULT: y

# Config variables
base_dir="$(dirname "$(readlink -f "$0")")"

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

echo -e "\e[1mDownloading packages...\e[0m"
url="http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9126/wps-office_11.1.0.9126.XA_amd64.deb"
t=$(mktemp -d)
wget -P "$t" "$url"  
if [ $? -eq 0 ]; then
  yes | dpkg -i "$t/"*
  echo -e "\e[1mInstalling packages...\e[0m"
  apt-get install -f -y 
fi 
rm -rf "$t"

# Remove strange WPS dirs ?¿
rm -rf /home/*/模板 /root/模板 /etc/skel/模板
