#!/bin/bash
echo "Onboard Ubuntu Desktop 22.04 LTS (64-bit) to Microsoft Intune"
echo "(c) 2018-2024 Jan Parttimaa. All rights reserved."
echo "--------------------------------------------"
echo " "

read -p "Press [Enter] key to start onboarding process..."

# Enable firewall
sudo apt install -f ufw -y
sudo ufw enable
sudo ufw reload

# Check for updates and install all available ones
sudo snap refresh
sudo apt update
sudo apt dist-upgrade -y
sudo apt-get dist-upgrade -y
sudo apt autoremove -y

# Download and install Microsoft Edge (Stable)
sudo apt-get install curl gpg -y
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-stable.list'
sudo rm microsoft.gpg
sudo apt update
sudo apt install -f microsoft-edge-stable -y

# Download and install Intune Company Portal
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/ 
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/22.04/prod jammy main" > /etc/apt/sources.list.d/microsoft-ubuntu-jammy-prod.list' 
sudo rm microsoft.gpg
sudo apt update
sudo apt install -f intune-portal -y

# Remove duplicate Microsoft Edge sources-list.d -file
sudo rm -f /etc/apt/sources.list.d/microsoft-edge.list

# Set default browser to Microsoft Edge
xdg-settings set default-web-browser microsoft-edge.desktop

# Uninstall Firefox if desired
sudo snap remove firefox
sudo apt remove firefox -y
sudo apt purge firefox -y

# Check for updates again and install all available ones
sudo snap refresh
sudo apt update
sudo apt dist-upgrade -y
sudo apt-get dist-upgrade -y
sudo apt autoremove -y

echo " "
echo "------------------------------------"
echo "Done! Please reboot your device and after that, open Company Portal -application and sign in with your Work or School account."
