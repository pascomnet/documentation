---
title: Server Installation
url:  /server/server-installation/
prev: /server/platforms/
next: /server/accessing-mobydick/
weight: 12
toc: true
keywords:
    - mobydick installation
    - Virtual Machine installation
    - mobydick Hardware installtion
    - mobydick system requirements
description: mobydick supports a wide range of servers / appliances making it the ideal solution for businesses of all sizes.
toc: true
lang: en
linkde: /server/server-installieren/

---


## Installation Media
The installations media for mobydick virtual and server appliances will be shipped directly with your licence purchase from the pascom ISO distribution.
The mobydick Community installations media is available to download from the download section on our website under [https://www.pascom.net/en/download/](https://www.pascom.net/en/download/ "download mobydick ISO").

{{% notice note %}}
A mobydick Community instance can upgraded to a mobydick Virtual at any time. Therefore, you are free to use the Community Version for testing purposes and then later on upgrade your system and transfer all your data.
{{% /notice %}}

## Installing in a Virtual Machine
The mobydick ISO file is effectively a conventional installation CD. You will need to setup a virtual machine and then use the ISO file as a boot media in order to carry out the mobydick installation. The ISO file can also be used to install mobydick directly on to a hardware based server.


### System Requirements
In effect, mobydick operates on the assumption that it is installed in a virtual environment, meaning that mobydick can operate under Windows, Linux and OSx.
mobydick has been extensively tested within the following virtualization solutions:

* VMWare ESX, Fusion, Server, Player, Workstation
* Sun (Oracle) Virtual Box
* XEN in varying distributions
* Microsoft Hyper-V

Should you wish to use the ISO Distribution, then you will need to add the virtual machine yourself which should have the following hardware settings:

* Min. 16 GB harddrive
* Min. 1x Network card
* Min. 1 GB RAM

Should you not be experienced with virtualisation solutions, our recommendation would be to use the following free of charge [VMWare Players] (http://www.vmware.com/products/player.html "to VMWare homepage") for Windows and Linux. Alternatively, you can also use Oracle's [Virtual Box] (https://www.virtualbox.org/ "To Virtualbox Website").

## Installing on Server Hardware

### Overview

Using any Windows PC or Linux system, you can copy a mobydick ISO file or a backup of version 7.01.00 or higher to a bootable USB stick, which can then later be used to install mobydick.

### Creating an Installations Media in Windows

#### Preparation

Download a mobydick setup file (mobydick 7.11.03 or later) from http://www.pascom.net or use the file appliance.iso from a backup (applicable for mobydick versions 7.11.03 or later).
Download the application Rufus which contains a tool with which to create a boot USB stick.

#### Creating a bootable USB stick

Start Rufus and connect a USB stick
![Screenshot - Create bootable USB Stick](../../images/rufus_start.png?width=40% "Create bootable USB Stick")

Parameter|Meaning|
|---------|---------|
|Device|Select the USB stick volume name from the device drop down list|
|Create a bootable disk using |ISO Image and then by clicking on the disk symbol, select the previously downloaded ISO file|

In the next window, select "write in ISO Image mode":
![Screenshot - ISOHybrid Image detected](../../images/rufus_iso.png?width=40% "ISOHybrid Image detected")

#### Unattended Installation
In order to proceed with an unattended mobydick installation, you will need to adjust a few settings.
Open the USB Stick and click on the file **unattended_install**
![Screenshot - Unattended Installation](../../images/rufus_unattended-transfer.png?width=70% "Unattended Installation")


A window screen will now appear in which you can enter your settings::
![Screenshot - Unattended Installation Settings](../../images/rufus_unattended_settings.png?width=40% "Unattended Installation Settings")


Check the **show output during installation via COM port** box so the unattended mobydick installation can be monitored over the COM Port.
Click **Generate**. After ejecting the USB stick, the medium can be used to carry out the installation.

{{% notice note %}}
Please note that unattended installations on a mini appliance can take upto 15 - 20 minutes, during which time the system must NOT be restarted. Should the device restart, the installation will fail. After the 15 - 20 minutes time period, the installation is deemed successful as soon as you are able to successfully login via the web UI without any error notifications. It is also recommended to check your Icinga monitoring checks.
{{% /notice %}}


### Creating an Installations Medium Using a Linux System

#### Preparation
Download a mobydick setup file (version 7.01.00 or higher) from [https://www.pascom.net/en/download/](https://www.pascom.net/en/download/ "mobydick ISO download") or use the file appliance.iso from a backup (version 7.1 as a minimum).
The easiest method to create the USB Installation Disk is to use your mobydick server or any Linux system that has syslinux installed.
If you want to use your mobydick system, copy the ISO file to the folder /etc/admin/ on a mobydick 6 or 7 system and log on to the system using SSH. Further information can be found in Accessing mobydick.

#### Creating a bootable USB stick

You are currently logged on as the user: admin, and in accordance to the steps above, the ISO file can be found at /etc/admin.

**Become root:**

    su

Connect USB-Stick to mobydick Server and check whether it is detected:

    dmesg

The output shows which name the USB stick was assigned within the system (sdb in our case):

    usb 1-1: new high speed USB device using ehci_hcd and address 2
    usb 1-1: configuration #1 chosen from 1 choice
    scsi3 : SCSI emulation for USB Mass Storage devices
    usb-storage: device found at 2
    usb-storage: waiting for device to settle before scanning
      Vendor: SanDisk   Model: Cruzer            Rev: 1.00
      Type:   Direct-Access                      ANSI SCSI revision: 02
    SCSI device sdb: 15625216 512-byte hdwr sectors (8000 MB)
    sdb: Write Protect is off
    sdb: Mode Sense: 03 00 00 00
    sdb: assuming drive cache: write through
    SCSI device sdb: 15625216 512-byte hdwr sectors (8000 MB)
    sdb: Write Protect is off
    sdb: Mode Sense: 03 00 00 00
    sdb: assuming drive cache: write through
     sdb: unknown partition table
    sd 3:0:0:0: Attached scsi removable disk sdb
    sd 3:0:0:0: Attached scsi generic sg1 type 0
    usb-storage: device scan complete

Create folders and mount the ISO file:

    mkdir /tmp/iso
    mkdir /tmp/usb
    mount -o loop /etc/admin/dist-7-stable-pascom-*.iso /tmp/iso/

Format the USB stick and mount it:

{{% notice warning %}}
Replace `DEVICE` with the USB device that you just created (e.g. sdb)
{{% /notice %}}

    mkfs.msdos -I /dev/DEVICE
    mount /dev/DEVICE /tmp/usb/

Copy the data to the USB stick and create a boot loader configuration:

    cp -arv /tmp/iso/. /tmp/usb/
    cp /tmp/usb/isolinux.cfg /tmp/usb/syslinux.cfg
    umount /tmp/iso
    umount /tmp/usb

Install bootloader to the USB stick:

{{% notice warning %}}
Replace `DEVICE` with the USB storage device (e.g. sdb)
{{% /notice %}}

    syslinux /dev/DEVICE

## Add Licence

### When is a mobydick Licence Required?
You will need to import your licence when:

* You would like to upgrade your Virtual mobydick Community Version to include your purchased mobydick licences
* You are migrating your mobydick to a new VM or new hardware based server
* The software maintenance period has been extended
* You have purchased additional user licences or additional licensed options.

### Where can I find my mobydick licence?
Your mobydick licences can be found within your [my.pascom](https://my.pascom.net/ "my.pascom.net licence portal") market place:

* Login in to the my.pascom.net market place
* Click on licences on the left hand side of the start page
* Next click on the corresponding appliance, which will take you to an overview of your licences
* Click on the blue "Licence Contents" bar
* Copy the text from within the box and add it to your mobydick
![my.pascom.net licence portal](../../images/licence_overview.png?width=80% "mobydick licence key in my.pascom.net")


### How to add mobydick Licences
Navigate to your mobydick phone system admin interface (Commander) and log in. Under the home section, scroll down to and click on the **Licence Overview** menu option.
![mobydick Home Screen](../../images/licence_mobydick.png?width=80% "mobydick Licence Overview")

Click on:

* **Manage Licences** in order to go to my.pascom.net
* **Enter Licence Code** in order to enter the licence code (which you have just copied from my.pascom.net):

![mobydick Licence Key](../../images/mobydick_licencecode.png?width=80% "Add mobydick licence key")
* Click **Activate license code** to complete the process

* **Check for Licence Updates**,in order to check whether a new licence for your mobydick phone system is available:

![Licence is up-to-date](../../images/licence_check.png?width=80% "Licence successfully updated")
