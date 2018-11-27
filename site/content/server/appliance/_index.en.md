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

## pascom Server Installation (Only for new / re-installs)
{{% notice warning %}}
The pascom appliance is delivered with the pascom phone system server software already pre-installed. Perform the following steps only if you wish to reinstall the system!
{{% /notice %}}

### Requirements

* USB stick with a minimum capacity of 8GB
* Free of charge Flash Tool [Rufus](https://rufus.akeo.ie/) (only for Windows)
* pascom Server Software [ISO File](https://www.pascom.net/en/download/)
 
### Flash the USB Stick

Connect the USB stick to your compute and start Rufus. Now select the pascom Server ISO file under {{< ui-button "Select image" >}}, select the USB stick via {{< ui-button "Select drive" >}} and finally click the {{< ui-button "START" >}}:

![Rufus](rufus.png?width=300px "Rufus")

### Connect the USB Stick

Now you can directly connect the prepared USB stick to the USB3 port (blue port located on the back of the server).

## Connect Appliance

![Quick Start Guide](getting_started_guide.en.png?width=80%)

{{% button href="getting_started_guide.pdf" icon="fa fa-download" %}} Download Quick Start Guide{{% /button %}}

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



