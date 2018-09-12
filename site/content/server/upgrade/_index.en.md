---
title: Upgrade from pascom 17 or older
description: How to upgrade from a pascom 17 phone system or older
weight: 70
---

{{< doctype "self" >}}

## Licence Upgrades

{{% notice tip%}}
If a licence that has been migrated pascom 18 or newer can not be used for older systems. Purchasing additional user licences for an older pascom phone system is no longer possible without upgrading to pascom 18 or newer.
{{% /notice %}}

Before you can upgrade, please **contact** our sales team in order to update your licence to pascom 18 or newer. This process is of course free of charge.

For the migration, you will also **require** access to **my.pascom.net**. Should you not yet have access to my.pascom.net, our team will of course be happy to help.

## Upgrade Checklist 

Please take the time to review the following checklist **before** you begin the upgrade process

* [ ] You do not use any Siemens Telephones
* [ ] You do not use any Auerswald Telephones (Support is being implemented)
* [ ] You do not use any Aastra Desktop Telephones (Support is being implemented)
* [ ] You do not use any Patton Gateways
* [ ] Your server hardware or virtual machine has a minimum of 2GB RAM
* [ ] You do not use any 32Bit Hardware or 32Bit virtual machines
* [ ] Your beroNet Gateway is running at least Firmware version 16
* [ ] You do not use any pascom Cluster or you want to replace the cluster
* [ ] You have taken a snapshot of your virtual machine (if appropriate)
* [ ] You have had your licence upgraded by the pascom sales team
* [ ] You have a my.pascom.net access associated with your company

Further details regarding the changes can be found in the release notes.

## Upgrade Steps

From pascom phone system version 18, pascom systems are based on a completely new underlying technological framework. Therefore, the upgrade cannot be performed as usual i.e. "inplace" and directly on the running server, but rather requires the following steps: 

### Check pascom / mobydick Version

As a migration base, you will require a minimum of mobydick 7.11 (LTS). Should you have an even older system, please update to a minimum of version 7.11 (LTS). 

### Create a Database Backup

On your existing system, now  create a database backup. Login into you your pascom / mobydick server and navigate to: 
{{< ui-button "Appliance" >}}>{{< ui-button "Backups" >}}>{{< ui-button "Database Backup" >}} auf {{< ui-button "Create" >}}.

Enter an name and include any recordings, faxes and voicemails in your back up. 

Click {{< ui-button "Perform Action" >}} and be sure to **download** the generated **backup to your computer**.

### Create a Full System Backup

{{% notice info %}}
This backup is required as a **disaster recovery** to **restore the original solution** should the upgrade not function correctly. Be sure not to skip this step! 
{{% /notice %}}

Click {{< ui-button "Appliance" >}}>{{< ui-button "Backups" >}}>{{< ui-button "Entire System" >}} and finally {{< ui-button "Create" >}}.

Click {{< ui-button "Start Backup" >}} and make sure you **download** the newly generated **backup to your computer**.

### pascom Server New Installation

Now install the pascom phone system server version 18 or newer. 

Should you by deploying a virtual phone system, to start with it is advisable to setup a new virtual machine and only shutdown the old system. 

Should you use an on-premise pascom PBX, i.e. the pascom Appliance, SOHO or SMB server, please perform a new installation of the system.

To do so, please follow the instructions according to your solution as described in our [Server Installation Guide]({{< ref "server" >}}).

### Importing / Restoring a Backup

During the installation process, the pascom setup wizard provides you with the option to **register** the installation via **my.pascom.net** and to use your newly created **backup** as he basis for the new installation.

### Activate DHCP Server


### New Provisioning of all Endpoints and Gateways

### Print to Fax

### QueueMetrics Uni Loader

### Manual Client Rollout < 17.10

### Manual File System Modifications are Lost

### Mail to Fax is Now Different

