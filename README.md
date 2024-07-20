# Onboard Ubuntu Desktop to Microsoft Intune
Repository to onboard Ubuntu Desktop to Microsoft Intune.

Onboarding Ubuntu Desktop will include following actions:
1. Enabling Firewall - ufw (if not enabled already).
2. Checking for updates and install all available ones.
3. Downloading and installing Microsoft Edge (Stable).
4. Downloading and installing Intune Company Portal.
5. Removing following duplicate file related to Microsoft Edge that causes pointles errors when checking for updates (This is known issue. [More information here](https://itsfoss.com/fixing-target-packages-configured-multiple-times/)).
   ```
   /etc/apt/sources.list.d/microsoft-edge.list
   ```
7. Setting default browser to Microsoft Edge.
8. Checking last time updates again and installing all available ones.

## Command for installation (Ubuntu Desktop 22.04 LTS)
1. Open Terminal.
2. Copy and paste below command and press Enter.

   ```
   cd Downloads && wget "https://raw.githubusercontent.com/janparttimaa/onboard-ubuntu-desktop-to-microsoft-intune/main/prod/ubuntu-desktop-22.04-lts/onboard.sh" && sudo chmod +x ./onboard.sh && ./onboard.sh
   ```
3. Provide password of your sudo-rights if asked.
4. You will get last minute instructions that will ask you to save all unfinished work and close all applications completely but not the active Terminal-window. You will get separate prompt at the end of the onboarding process where you are asked to reboot your device and after rebooting the device, open the Company Portal-application and sign in using your Work or School account in order to register the device to Intune.

## Strongly recommendations after onboarding your Ubuntu Desktop to Intune for Intune Administrators
1. Deploy Microsoft Defender for Endpoints (MDE) to managed Ubuntu Desktop-devices. I recommend to check [this blog post](https://medium.com/@RootRouteway/strengthening-linux-security-leveraging-microsoft-intune-to-onboard-linux-workstations-into-41ad9ea1e945) from nickname RootRouteway. <br>
   **Tip:** You can also use [Azure Blob Storage](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blobs-introduction) for Python-file deployments without having to maintain separate server for those on your local network or DMZ. Make sure that your Azure Blob Storage Container is using Shared Access Signature (SAS).
2. Make sure that [Compliance-policy](https://learn.microsoft.com/en-us/mem/intune/protect/device-compliance-get-started) have been created and deployed to managed Linux-devices.
3. If you don't need Firefox and Thunderbird-applications on your managed Linux-devices, [deploy script](https://learn.microsoft.com/en-us/mem/intune/configuration/custom-settings-linux) via Intune that will uninstall these applications automatically. Replacement managed apps and services would be following:

   | Original app | Replacement managed app or service | More information |
   | ----------- | ----------- | ----------- |
   | Firefox | Microsoft Edge | N/A |
   | Thunderbird | Microsoft Outlook on the Web (OWA) | Employees can install PWA-app of this app if wanted. |

## Other tips for Intune Admins
- [Here](https://github.com/microsoft/shell-intune-samples) you can find some sample scripts for Intune provided by Microsoft.
- Here you can find list of applications that Microsoft provides to Linux-users: [Linux resources at Microsoft](https://learn.microsoft.com/en-us/linux/).
   - Please note though that list is not quite perfect as this does not provide 100% list of Microsoft Applications available for Linux. For example, Company Portal is totally missing.

## Microsoft applications and services on Ubuntu for non-admin users and developers
I gathered simple table of applications and services that are available for Ubuntu-users. This list is evolving so it might be always 100% up-to-date. If you something is missing, please report that issue and I will update the list.

The list does not contain Admin-consoles that can be use for web browser (e.g Entra ID, Intune, Azure) as those will work on any opeating systems. The table below only focuses on applications that non-admin users and developers uses.

| Software | Purpose | Method | More information |
| ----------- | ----------- | ----------- | ----------- |
| [Microsoft Edge](https://www.microsoft.com/en-us/edge/business?form=MA13FQ) | Company device management,<br>Web browsing | apt | Required application for all Managed Linux-devices. This will be deployed automatically using the onboarding script. |
| [Intune Company Portal](https://learn.microsoft.com/en-us/mem/intune/user-help/microsoft-intune-app-linux) | Company device management | apt | Required application for all Managed Linux-devices. This will be deployed automatically using the onboarding script. |
| [Microsoft 365 applications ans services](https://microsoft365.com/)<br>(e.g. Outlook, Teams, Word, Excel, PowerPoint, OneDrive and Visio) | Office activities | web/PWA | Use Microsoft Edge -browser for these services.<br> Please note that Microsoft no longer provide native application of Microsoft Teams for any Linux distros. |
| [Microsoft Defender for Endpoint (MDE)](https://learn.microsoft.com/en-us/defender-endpoint/microsoft-defender-endpoint-linux) | Company device management | apt | If your company is already using Microsoft Defender on your fleet, this is then required application. This is something that MDM-admin usually deploys via Intune to managed Ubuntu-devices without need for manual installation by hand. |
| [Visual Studio Code](https://code.visualstudio.com/docs/setup/linux) | Development | apt | N/A |
| [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux?view=powershell-7.4) | Development | apt | N/A |
| [Azure Storage Explorer](https://azure.microsoft.com/en-us/products/storage/storage-explorer) | Development | snap | N/A |
| [Azure Data Studio](https://learn.microsoft.com/en-us/azure-data-studio/download-azure-data-studio?view=sql-server-ver16&tabs=win-install%2Cwin-user-install%2Credhat-install%2Cwindows-uninstall%2Credhat-uninstall) | Development | dpkg | N/A |
| [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt) | Development | apt | N/A |
| [.NET](https://learn.microsoft.com/en-us/dotnet/core/install/linux) | Development | apt/snap | N/A |
| [Microsoft Remote Desktop ](https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-web-client) | Development | web | Use Microsoft Edge for this. |
| [Microsoft Build of OpenJDK](https://www.microsoft.com/openjdk) | Development | apt | N/A |
| [Skype for Consumers](https://www.skype.com/en/get-skype/) | Non-Work Apps | snap | If employees are using Linux-distros on their personal life, just FYI that Skype for Consumers is also available as a native application. |
