---
title: pascom SOHO Server
description: The pascom SOHO Server is the ideal solution for Small Office Home Offices or branch offices requiring hardware.
weight: 30
---

{{< doctype "self"  >}}

{{% notice warning %}}
**DISCONTINUED** - The pascom SOHO Server will continue to be supported but is no longer available to purchase, having been replaced by the [pascom Appliance]({{< ref "server/appliance" >}}).
{{% /notice %}}

{{< description >}}
 
**Useful Knowledge Vorwissen**
 
 
 * [pascom Server System Structure]({{< ref "concept/server" >}})

 
## pascom SOHO Server

![pascom SOHO Server](pascomSOHOserver.png)

### Modify your Firewall

Many companies have **no Internet access restrictions** and can therefore **immediately** start using your **pascom SOHO Server** without needing to make any alterations to their Firewall.

However, should you choose to, you can specify which internet services your company network is permitted to access by opening the following ports and allowing the pascom SOHO servers access in order to ensure that your pascom phone system operates optimally:

#### pascom Services

| Port | Host | Description |
| ---- | ---- | ------------ |
| TCP **80**/**443** | my.pascom.net | Access to the pascom licence server + PUSH services |
| TCP **25** | cloudmx1.pascom.net, cloudmx2.pascom.net | Access to the pascom Mailserver |
| UDP **123** | \* | Access to the preferred time server (NTP) |
| UDP **3478** | \* | Zugriff für Video-Funktionalität |
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
{{% notice info %}}
Aftering flashing, the USB stick must contain a **FAT file system** as you will need to **modify** the **setup.json** for the automatic setup. Tools such as Etcher create a Read Only ISO file system on the USB stick. As a result, modifying the setup.json is not possible, which is why you will need to use **Rufus** to generate the USB stick.
{{% /notice %}}

Connect the USB stick to your compute and start Rufus. Now select the pascom Server ISO file under {{< ui-button "Select image" >}}, select the USB stick via {{< ui-button "Select drive" >}} and finally click the {{< ui-button "START" >}}:

![Rufus](rufus.png?width=300px "Rufus")

### Preparing the Automatic Setup

As the pascom SOHO phone system server does not have a monitor connectivity option, you will need to add a file named **setup.json** to the USB stick and pre-allocate the file with your network settings. The system will automatically boot and configure the network settings accordingly. This ensures that you are able to continue with the web based setup as soon as the system has started. 

{{% tabs %}}
{{% tab "pascom 18" %}}
```
{
    "device": "sda",
    "skipWelcome": true,
    "skipHostname": true,
    "skipDevice": true,
    "hostname": "pascom-server",
    "skipNetwork": true,
    "network": {
        "interface": "enp1s0",
        "mode": "static",
        "ip": "192.168.100.1",
        "netmask": "255.255.255.0",
        "gateway": "192.168.100.254",
        "dns1": "192.168.100.254" ,
        "dns2": ""
   }
}
```
{{% /tab %}}

{{% tab "pascom 19" %}}
```
{
    "device": "sdb",
    "skipWelcome": true,
    "skipHostname": true,
    "skipDevice": true,
    "hostname": "pascom-server",
    "skipNetwork": true,
    "network": {
        "interface": "enp1s0",
        "mode": "static",
        "ip": "192.168.100.1",
        "netmask": "255.255.255.0",
        "gateway": "192.168.100.254",
        "dns1": "192.168.100.254" ,
        "dns2": ""
   }
}
```
{{% /tab %}}
{{% /tabs %}}

### Connect the USB Stick

Now you can directly connect the prepared USB stick to the USB port on the server.

## Connect the Appliance

* Connect the network to the **lefthand** port of the three network socekts
* Connect the power supply
* The server will automatically begin the startup

## First System Start

After a short time, the system will be available either under the standard IP Adreess **192.168.100.1** (default as delivered) the **IP Address** as defined by you in the **setup.json**.

## Start Setup Wizard

Open a browser window and go to your pascom PBX server IP address configured during the first system start. Follow the steps until you can login into the Management Interface:

{{% notice warning %}}
Should you have rebuilt the system and booted from the **USB Stick**, remove the stick **before the reboot**. Otherwise, the initial setup process will be repeated.
{{% /notice %}}

After a successfull reboot, you will see the login screen:

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



