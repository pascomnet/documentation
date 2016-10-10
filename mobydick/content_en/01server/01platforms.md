
---
url: /server/platforms/
linkde: /server/plattformen/
prev:  /server/
next:   /server/server-installation/
weight: 11
title: Platforms and System Requirements
keywords:
    - Server
    - Appliances
    - VoIP Appliances
    - All IP ready
    - mobydick pre-installed
description: mobydick supports a wide range of servers / appliances making it the ideal solution for businesses of all sizes.
toc: true
lang: en

---

## mobydick Servers


### mobydick miniAppliance

{{% row %}}
{{% col md-6 %}}
Manufacturer: PC-Engines
Recommended Max. Users: 15

* 1 Ghz Dualcore
* 2 GB RAM
* 16 GB SSD
* 3 Network cards
* Fanless

The mobydick miniAppliance is a VoIP only appliance how you can boost connectivity options via an external Gateway to include ISDN / Analog and GSM connectivity.

{{% /col %}}

{{% col md-6 %}}
![mobydick miniAppliance](../../images/mobydick_mini_appliance_front.png "mobydick miniAppliance Front view")
{{% /col%}}
{{% /row %}}


### mobydick Appliance

{{% row %}}
{{% col md-6 %}}
Manufacturer: beroNet
Recommended Max. Users: 100

* 19‘‘ Aluminium Server Housing
* 1 U, 25 cm mounting depth
* Solid State HDD
* Fanless Cooling
* Energy efficient 12V power - less than 20W power consumption
* 2x Gigabit Ethernet interfaces
* (optional) ISDN BRI(S0) / PRI(E1, S2M) up to 8 / 4 Ports
* (optional) Analog up to 8 Ports
* (optional) GSM up to 4 SIM cards

{{% /col %}}

{{% col md-6 %}}
![mobydick Appliance](../../images/mobydick_appliance.jpg "mobydick Appliance from beronet")

{{% /col%}}
{{% /row %}}

### SNOGA

{{% row %}}
{{% col md-6 %}}
Manufacturer: Patton
Recommended Max. Users: 250

* Intel Celeron J1900 Quad Core 2.0 GHz Processor
* DDR3L RAM 4GB
* 250 GB HDD
* (optional) ISDN BRI(S0)/PRI(E1, S2M) up to 8 / 4 Ports
* (optional) Analog up to 8 Ports

{{% /col %}}
{{% col md-6 %}}
![Patton SNOGA Appliance](../../images/mobydick_snoga.gif "mobydick Appliance from Patton")
{{% /col%}}
{{% /row %}}



## Standard Server Hardware

mobydick is based on a current standard Linux Kernel and is therefore compatible with all current x86 servers. It could be the case that on systems with for example non-native Raid Controllers, that mobydick will not install. If in doubt, please download the installation media from our website and test the setup of your desired hardware. 100% compatibility is only guaranteed on the following tested by us server hardware.

*Standard System Requirements:*

|           |< 10 Users	|< 50 Users	|< 250 Users     |< 500 Users |< 1000 Users|
|-----------|---------------|---------------|-------------------|---------------|---------------|
|CPU (x86)	|AMD G series	|Intel Atom     |	Intel Celeron	|Intel XEON	    |2x Intel XEON  |
|RAM	    |1 GB	        |2 GB           |	4 GB            |8 GB           |16 GB          |
|Harddrive*|   16 GB       |32 GB          |64 GB	            |128 GB	        |256 GB         |

*The hard drive storage requirement suggestions are based on an average usage scenario. Call Recordings in particular will significantly influence your storage requirements. As a rule of thumb, please take into account that every 10 minutes worth of recordings will require approximately an additional 1 MB of storage space.



## Virtual Machines
mobydick is optimised for operating within virtual machine environments. The following vendors are extensively tested by us to ensure optimum integration:

{{% row %}}
{{% col md-3 %}}
![vmware Logo](../../images/vm_vmware.jpg "vmware Virtualization")
{{% /col %}}
{{% col md-2 %}}
![hyperV Logo](../../images/vm_hyperv.png "hyperV Virtualization")
{{% /col %}}
{{% col md-1 %}}
![Virtualbox Logo](../../images/vm_virtualbox.png "Virtualbox Virtualization")
{{% /col %}}
{{% col md-2 %}}
![kvm Logo](../../images/vm_kvm.png "kvm Virtualization")
{{% /col %}}
{{% col md-2 %}}
![xen Logo](../../images/vm_xen.png "xen Virtualization")
{{% /col %}}
{{% col md-2 %}}
![proxmox Logo](../../images/vm_proxmox.png "proxmox Virtualization")
{{% /col %}}
{{% /row %}}


*Standard System Requirements:*

|           |< 10 Users	|< 50 Users	|< 250 Users     |< 500 Users |< 1000 Users|
|-----------|---------------|---------------|-------------------|---------------|---------------|
|CPU (x86)	|1 Core	        | 1 Core        |	1 Core      	| 2 Core        |4 Core         |
|RAM	    |1 GB	        |2 GB           |	4 GB            |8 GB           |16 GB          |
|Harddrive*|   16 GB       |32 GB          |64 GB	            |128 GB	        |256 GB         |

*The hard drive storage requirement suggestions are based on an average usage scenario. Call Recordings in particular will significantly influence your storage requirements. As a rule of thumb, please take into account that every 10 minutes worth of recordings will require approximately an additional 1 MB of storage space.
