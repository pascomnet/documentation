---
title: pascom Appliance
description: The pascom appliance is a pre-installed Server for on-premise installations
weight: 30
---

{{< doctype "self"  >}}

{{< description >}}
 
**Useful Knowledge**
 
 
 * [pascom Server System Structure]({{< ref "concept/server" >}})

 
## pascom Appliance

![pascom Appliance](pascom-appliance.png "pascom Appliance IP PBX")

### Modify your Firewall

Many companies have **no Internet access restrictions** and can therefore **immediately** start using your **pascom appliance** without needing to make any alterations to their Firewall.

However, should you choose to, you can specify which internet services your company network is permitted to access by opening the following ports and allowing the pascom appliance access in order to ensure that your pascom phone system operates optimally:

#### pascom Services

| Port | Host | Description |
| ---- | ---- | ------------ |
| TCP **80**/**443** | my.pascom.net | Access to the pascom licence server + PUSH services |
| TCP **25** | cloudmx1.pascom.net, cloudmx2.pascom.net | Access to the pascom Mailserver |
| UDP **123** | \* | Access to the preferred time server (NTP) |

## pascom Server Installation (Only for new / re-installs)
{{% notice warning %}}
The pascom appliance is delivered with the pascom phone system server software already pre-installed. Perform the following steps only if you wish to reinstall the system!
{{% /notice %}}

### Requirements

* USB stick with a minimum capacity of 8GB
* Free of charge Flash Tool [Rufus](https://rufus.akeo.ie/) (only for Windows)
* pascom Server Software [ISO File](https://www.pascom.net/en/download/)
 
### {{< num 1 >}} Flash the USB Stick

Connect the USB stick to your compute and start Rufus. Now select the pascom Server ISO file under {{< ui-button "Select image" >}}, select the USB stick via {{< ui-button "Select drive" >}} and finally click the {{< ui-button "START" >}}:

![Rufus](rufus.png?width=300px "Rufus")

### {{< num 2 >}} Copy Server-ISO

Now copy the server ISO directly to the USB stick and rename it to **pascom.iso**.

### {{< num 3 >}} Create Configfile

Create the file **setup.json** directly on the USB stick with the following content:

```
{
    "device": "sda",
    "skipWelcome": true,
    "skipDevice": true,
    "skipHostname": true,
    "hostname": "usbsetup",
    "skipNetwork": true,
    "skipStartNetwork": true,
    "skipBrowser": true,
    "skipReboot": true,
    "halt": true,
    "preinst" : {
 
    }
}
```

### {{< num 4 >}} Connect, install and remove the USB stick

Den so vorbereiteten **USB-Stick** können Sie nun direkt an den **USB3-Port** (Rückseite, blauer Port) anstecken. Schließen Sie die Appliance an Bildschirm und Strom und schalten diese ein. Das Setup läuft automatisch durch. Nach erfolgreichem Setup schaltet sich die Appliance selbst ab. 

The **USB stick** prepared in this way can now be connected directly to the **USB3 port** (rear, blue port). Plug the appliance into screen and power and turn it on. The setup will run automatically. After successful setup, the appliance shuts itself off.

{{% notice warning %}}
**REMOVE THE USB-STICK NOW!**
{{% /notice %}}

Turn the appliance back on and proceed to the next step.

## Connect Appliance

![Quick Start Guide](getting_started_guide.en.png?width=80%)

## First System Start

Complete the setup and follow the on-screen instructions until you are directed to switch to your browser and start the setup wizard:

![Operating System Installation](tui.png)

## Start Setup Wizard

Open a browser window and go to your pascom PBX server IP address configured during the first system start. Follow the steps until you can login into the Management Interface:

![pascom Server Management](management.png)

## Setup Mobile Acces via the Internet (optional)

{{% notice note %}}
If you want to use this feature, follow these steps now. Future changes are possible, but will result in changes for your users as aspects such as access to the server via the pascom client will change from a local IP address to a DNS name. 
{{% /notice %}}

This step is required should you wish to use the pascom mobile client (iOS/Android) or desktop client to access the local pascom server from "on the go" i.e. outside of the network. 

 * See [Setup Mobile Acces via the Internet]({{< ref "howto/mobile-access" >}})

## Phone System Setup

An additionnal assistant will help you to finish setting up your phone system and add / invite further users.
Proceed as follows: 

* Via a browser window, login into the pascom server as an Admin
* Click on the {{< ui-button "Phone Systems" >}} and then enter a name for your phone system
* Follow the setup assistant instructions



