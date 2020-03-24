---
title: pascom SMB Server
description: The pascom SMB Server is not only an Out-of-the-Box All-IP ready solution but can also be optionally configured using ISDN, Analog and GSM modules.
weight: 30
---

{{< doctype "self"  >}}

{{< description >}}

{{% notice warning %}}
**DISCONTINUED** - The pascom SMB Server will continue to be supported but is no longer available to purchase, having been replaced by the [pascom Appliance]({{< ref "server/appliance" >}}).
{{% /notice %}}
 
**Useful Knowlegde**
 
 
 * [pascom Server System Structure]({{< ref "concept/server" >}})

 
## pascom SMB Server

![pascom SMB Server - for display purposes](pascomSMBserver.jpg "pascom SMB server")

### Modify your Firewall

Many companies have **no Internet access restrictions** and can therefore **immediately** start using your **pascom SMB Server** without needing to make any alterations to their Firewall.

However, should you choose to, you can specify which internet services your company network is permitted to access by opening the following ports and allowing the pascom SMB server access in order to ensure that your pascom phone system operates optimally:

#### pascom Services

| Port | Host | Description |
| ---- | ---- | ------------ |
| TCP **80**/**443** | my.pascom.net | Access to the pascom licence server + PUSH services |
| TCP **25** | cloudmx1.pascom.net, cloudmx2.pascom.net | Access to the pascom Mailserver |
| UDP **123** | \* | Access to the preferred time server (NTP) |
| UDP **3478** | \* | Access for Video-Functionality |
| UDP + TCP **19302** | WebRTC |

## pascom Server Installation (for new / reinstallations only)
{{% notice warning %}}
The pascom appliance is delivered with the pascom phone system server software already pre-installed. Perform the following steps only if you wish to reinstall the system!
{{% /notice %}}

### Requirements

* USB stick with a minimum capacity of 8GB
* Free of charge Flash Tool [Rufus](https://rufus.akeo.ie/) (only for Windows)
* pascom Server Software [ISO File](https://www.pascom.net/en/downloads/)
 
### Flash the USB Stick

Connect the USB stick to your compute and start Rufus. Now select the pascom Server ISO file under {{< ui-button "Select image" >}}, select the USB stick via {{< ui-button "Select drive" >}} and finally click the {{< ui-button "START" >}}:

![Rufus](rufus.png?width=300px "Rufus")

### Connect the USB Stick

Now you can directly connect the prepared USB stick to the USB3 port (blue port located on the back of the server).

## Connect SMB Server Appliance

* Connect your SMB server to the network via the left of the two network ports
* Connect a monitor to the VGA socket
* Connect a USB keyboard
* Connect the power supply
* The server will automatically begin the startup

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

{{< youtube QDtL-9ktR6E  >}}

An additionnal assistant will help you to finish setting up your phone system and add / invite further users.
Proceed as follows: 

* Via a browser window, login into the pascom server as an Admin
* Click on the {{< ui-button "Phone Systems" >}} and then enter a name for your phone system
* Follow the setup assistant instructions

