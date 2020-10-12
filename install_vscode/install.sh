#!/bin/bash
# ACTION: Install Visual Studio Code and add repositories
# INFO: Visual Sutio Code is a powerfuel Microsoft IDE
# DEFAULT: n

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

# Install repositories and update
if ! grep -R "vscode" /etc/apt/ &> /dev/null; then
	echo -e "\e[1mConfiguring repositories...\e[0m"
	echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" | tee /etc/apt/sources.list.d/vscode.list
	wget -qO - https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
	apt-get update
fi

# Install package
echo -e "\e[1mInstalling packages...\e[0m"
apt-get install code || exit 1


