# Onboard Ubuntu Desktop to Microsoft Intune
Repository to onboard Ubuntu Desktop to Microsoft Intune.

Onboarding Ubuntu Desktop will include following actions:
1. Enabling Firewall (ufw if not enabled already).
2. Checking for updates and install all available ones.
3. Downloading and installing Microsoft Edge (Stable).
4. Downloading and installing Intune Company Portal.
5. Removing following duplicate file related to Mcrosoft Edge that causes pointles errors when checking for updates (This is known issue. More information here).
   ```
   /etc/apt/sources.list.d/microsoft-edge.list
   ```
7. Setting default browser to Microsoft Edge.
8. Checking last time updates again and installing all available ones.

## Command for installation (Ubuntu Desktop 22.04 LTS)
```
cd Downloads && wget "https://raw.githubusercontent.com/janparttimaa/onboard-ubuntu-desktop-to-microsoft-intune/main/prod/ubuntu-desktop-22.04-lts/onboard.sh" && sudo chmod +x ./onboard.sh && ./onboard.sh
```
