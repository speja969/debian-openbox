#!/bin/bash
# ACTION: Config GRUB for skip menu (timeout=0)
# INFO: If you are using only one OS in the computer you con skip GRUB menu for faster boot and avoid users can edit entries
# DEFAULT: n

# Config variables
base_dir="$(dirname "$(readlink -f "$0")")"

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

# Delete existing lines
echo -e "\e[1mSetting GRUB config...\e[0m"
for i in $(cat "$base_dir/grub.conf"  | cut -f1 -d=);do
	sed -i "/\b$i=/Id" /etc/default/grub
done

# Add lines
cat "$base_dir/grub.conf" >> /etc/default/grub

# Update grub
echo -e "\e[1mUpdating GRUB...\e[0m"
update-grub
