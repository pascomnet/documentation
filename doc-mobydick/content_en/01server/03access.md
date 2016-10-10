---
title: Accessing & Using the Admin UI
url: /server/accessing-mobydick/
prev: /server/server-installation/
next: /server/network-configuration/
weight: 13
toc: true
keywords:
    - IP address determination
    - Web UI access
    - Accessing the mobydick TUI
    - Accessing mobydick per SSH
description: Discover how to access you mobydick system and use the various admin interfaces.
lang: en
linkde: /server/mobydick-zugriff/
---

## Finding your System's IP Address
In order to access the system, you will require the IP address of the telephone system. The default IP address for the mobydick Appliance, miniAppliance and mobydick Servers is 192.168.100.1 on the port as highlighted in the accompanying info sheet or labelled. If you are not sure about system's IP address, you can find it through using the mobydick text user interface TUI.

## Accessing the Web Interface
1. Use any web browser and access the system's interface by entering **https://[mobydick_IP_Address]** as the URL. Should you not use https, a warning will appear that informs you that the network connection is not encrypted.
![Screenshot - WUI per Http](../../images/wui_start_http.png?width=90% "Security notice by http")
To access the mobydick web UI per HTTPS, you must agree to a self-signed certificate.

2. Log into the web UI using the username `admin`and default password `mobydick` (should you have not entered a different password during the setup process).
![Screenshot - WUI per https](../../images/wui_start_https.png?width=90% "Security notice by https")

{{% notice note %}}
Sessions remain active for 30 minutes of inactivity meaning new log in are required. Should you be working on a public computer, after finishing your work remember to log out of your mobydick commander session in order to prevent unauthorised access from other people. To do this simply click the `Logout` button.
{{% /notice %}}

## Accesing the TUI

The Text User Interface (TUI) allows you to adjust basic configurations, e.g. IP address and Host names etc. To use the TUI, please connect a display to your mobydick server, mobydick Appliance or mobydick server or refer to the virtual machine console. The screen will show you your network card IP addresses which can be configured under ***Configure Network***.

### Start Screen

![Screenshot - mobydick TUI](../../images/tui_start.png?width=90% "mobydick TUI Start Screen")

Here it is possible to read the IP address for both network interfaces. By entering the IP address in your preferred browser, you will be able to access the mobydick web UI.

### Main Menu
In order to access the main menu, you will need to press the **F2** kex and ender the system password ( default **mobydick** ).

1. Logout
    * Return to the start screen
2. Configure Network (s. below)
3. Shutdown
    * Shutdown or restart the system
4. Open Shell
    * Opens a Shell with root permissions
5. Set system password
    * Change the system password. You will need to enter the password twice to confirm changes
    * The system password is valid for both the admin and the root User
6. Configure timezone
    * Allows you to setup you your timezone
7. Change system language
    * English and German are currently available
    * Only changes the TUI language, not that of the web UI
8. Create backup
    * Creates a backup of your mobydick phone system (see Backup and Restore)

### Configure Network
{{% notice note %}}
Changes to the network are implemented using the same process as when using the web interface. See [Network Configuration]({{< relref "04network-config.md" >}}).
{{% /notice %}}
he system will show all available network cardstui:
![Screenshot - TUI Network Settings](../../images/tui_netzwerk.png?width=90% "mobydick TUI Network Settings")

#### Modes
* **static**: The IP address is assigned to the interface on every start of the system..
* **dhcp**: A DHCP server assigns the IP address.
* **unconfigured**: The interface (card) is deactivated.


## Access per SSH

To use SSH when accessing mobydick, please follow these steps mentioned below:

1. Start an SSH client of your choice. For Windows, we recommend using PuTTY. More information can be found at [http://www.chiark.greenend.org.uk/~sgtatham/putty/](http://www.chiark.greenend.org.uk/~sgtatham/putty/ "putty information").
2. Enter the predetermined IP address as the host address.
3. Log in as user **admin** and the default password **mobydick** or the password you chose during setup.
4. To log in as user **root**, enter the command **su** - and the password you chose.

## Accessing the Asterisk CLI
mobydick uses Asterisk Telephony Software as its basis. Asterisk offers a CLI (Command Line Interface) in which you can monitor and debug all telecommunications traffic as long as you are a root user and logged in using SSH. At the command prompt, enter ` asterisk -r`.

![Screenshot - Asterisk CLI der mobydick](../../images/asterisk_cli.png?width=90% "mobydick Asterisk CLI")

More information on the Asterisk CLI can be found here [http://www.voip-info.org/wiki/view/Asterisk+CLI] (http://www.voip-info.org/wiki/view/Asterisk+CLI "Asterisk CLI Details")
