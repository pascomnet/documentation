---
title: pascom Virtual IP PBX
description: Install the pascom Server as a virtual machine in your preferred Hypervisor.
weight: 40
---

{{< description >}}

## Training Video

{{< youtube F1Yl0dkI2ng  >}}

## Supported Hypervisors

|VMWare|hyperV|XenServer|Proxmox|
|---|---|---|---|
|![VMware](vm_vmware.jpg)|![hyperV](vm_hyperv.png)|![xem](vm_xen.png)|![proxmox](vm_proxmox.png)|

## System Requirements

|   |< 10 Users|< 50 Users|< 250 Users|< 500 Users|< 1000 Users|
|---|---|---|---|---|---|
|**CPU (x86)**|2 Core| 2 Core|4 Core| 4 Core|8 Core|
|**RAM**|2 GB|4 GB |8 GB|16 GB|32 GB|
|**Hard Disk \***|32 GB|64 GB|128 GB|256 GB|512 GB|

**\*** The hard disk storage requirement suggestions are based on an average usage. In particular, Call Recordings will significantly influence your storage requirements. Please take into account that every 10 minutes worth of recordings will require approximately an additional 1 MB of storage space.

### Modify your Firewall

Many companies have **no Internet access restrictions** and can therefore **immediately** start using your **pascom virtual phone system** without needing to make any alterations to their Firewall.

However, should you choose to, you can specify which internet services your company network is permitted to access by opening the following ports and allowing the pascom virtual server access in order to ensure that your pascom phone system operates optimally:

#### pascom Services

| Port | Host | Description |
| ---- | ---- | ------------ |
| TCP **80**/**443** | my.pascom.net | Access to the pascom licence server + PUSH services |
| TCP **25** | cloudmx1.pascom.net, cloudmx2.pascom.net | Access to the pascom Mailserver |
| UDP **123** | \* | Access to the preferred time server (NTP) |
| UDP **3478** | \* | Access for Video-Functionality |

## Download ISO File

For installing a pascom IP PBX virtual machine, please use the [ISO File](https://www.pascom.net/en/download/) which is available on our [Download page](https://www.pascom.net/en/download/).

## Operating System Installation

Create a new virtual machine and use the pascom server [ISO File](https://www.pascom.net/en/download/) as a boot media. Follow the on-screen instructions until you are prompted to switch to your browser and continue with the pascom Setup Wizard:

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
