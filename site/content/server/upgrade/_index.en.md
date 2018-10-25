---
title: Upgrade from pascom 17 or older
description: How to upgrade from a pascom 17 phone system or older
weight: 80
---

{{< doctype "self" >}}

## Licence Upgrades

{{% notice tip%}}
Guide to upgrading from pascom 17 or older to pascom 18 or newer. 
{{% /notice %}}

Before you can upgrade, please **contact** our sales team in order to update your licence to pascom 18 or newer. This process is of course free of charge.

For the migration, you will also **require** access to **my.pascom.net**. Should you not yet have access to my.pascom.net, our team will of course be happy to help.

## Upgrade Checklist 

Please take the time to review the following checklist **before** you begin the upgrade process

* [ ] You do not use any Siemens Telephones
* [ ] You do not use any Auerswald Telephones (Support is being implemented)
* [ ] You do not use any Aastra Desktop Telephones (Support is being implemented)
* [ ] You do not use any Patton Gateways
* [ ] You do not use any FlexPanels
* [ ] You do not use any Print To Fax
* [ ] You do not use any SIP Trunks without Registration (e.g. Vodafone)
* [ ] Your server hardware or virtual machine has a minimum of 2GB RAM
* [ ] You do not use any 32Bit Hardware or 32Bit virtual machines
* [ ] Your beroNet Gateway is running at least Firmware version 16
* [ ] You do not use any pascom Cluster or you want to replace the cluster
* [ ] You have taken a snapshot of your virtual machine (if appropriate)
* [ ] You have had your licence upgraded by the pascom sales team
* [ ] You have a my.pascom.net access associated with your company
* [ ] I use the "Admin" user for administrative purposes only

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

{{% notice tip %}}
As you have most likely configured the new pascom server with the same IP address you previously used, it is likely that when surfing to the IP address your are redirected to **/mobydickcmd/** as this is saved within your **Browser's Cache**. In this case, simply use "HTTPS" (e.g.: https://192.168.0.1) in order to access the system.
{{% /notice %}}

Now install the pascom phone system server version 18 or newer. 

Should you by deploying a virtual phone system, to start with it is advisable to setup a new virtual machine and only shutdown the old system. 

Should you use an on-premise pascom PBX, i.e. the pascom Appliance, SOHO or SMB server, please perform a new installation of the system.

To do so, please follow the instructions according to your solution as described in our [Server Installation Guide]({{< ref "server" >}}).

### Importing / Restoring a Backup

During the installation process, the pascom setup wizard provides you with the option to **register** the installation via **my.pascom.net** and to use your newly created **backup** as he basis for the new installation.

### Activate DHCP Server (Optional)

The DHCP server has been moved from the pascom phone system web UI to the pascom Management UI. As such, the configuration of the DHCP server is not a component of previously imported backup.

Should you have used the pascom DHCP server in the past, you will need to activate and configure the DHCP server via the pascom Management UI. Details on how to do this can be found in the HowTo [Telephone Provisioning via DHCP]({{< ref "/howto/dhcp-provisioning" >}}).

### Update your DHCP Server (Optional)

Should you use your own DHCP Server for provisioning, you will need to update the DHCP option 66 as this has changed slighty in terms of provisioning. Details on how to do this can be found in the HowTo [Telephone Provisioning via DHCP]({{< ref "/howto/dhcp-provisioning" >}}).

### New Provisioning of All Telepones

{{% notice tip %}}
Should you power all your hardware telephones centrally using PoE, then simply disconnecting and reconnecting your PoE switch from the network is sufficient to restart all the phones.
{{% /notice %}}

All hardware phones must switched from SIP-UDP and RTP to SIP-TLS and SRTP (encryption). Once you have prepared the DHCP server, you will only need to restart all the telephones. This process must be done manually as rebooting via the pascom Server without previously having performed this Provisioning switch is not possible. 

### New Provisioning of beroNet PCI Cards

Internal beroNet PCI cards can still be automatically provisioned. There is no need to copy the provisioning URL. Simply proceed as follows: 

#### Check beroNet Firmware

Log into the beroNet card web UI and und **Management** > **Info** that you use appfs **16 or newer**. If not, update the box now:

* Download the [Firmware 16.X](https://beronet.atlassian.net/wiki/spaces/PUB/pages/61210659/Tools+and+Downloads) (Section: beroNet OS)
* Under the beroNet **Management** > **Firmware update** select the update mode. 
* Upload the firmware 16.X after the reboot and start the update

#### Start Provisioning 

Log into the phone system web UI. Under **Gateways** > **Gateway list**, select your beroNet Gateway and click **Actions** > **Provisioning**. The PCI cards will automatically restart and takes over the configuration of the pascom server.

### New Provisioning of a beroNet Box

As beroNet boxes can now also be used with pascom.cloud solutions, pairing using the provisioning URL is required. Simply proceed as follows:

#### Check beroNet Firmware

Log into the beroNet card web UI and under **Management** > **Info** that you use appfs **16 or newer**. If not, update the box now:

* Download the [Firmware 16.X](https://beronet.atlassian.net/wiki/spaces/PUB/pages/61210659/Tools+and+Downloads) (Section: beroNet OS)
* Under the beroNet **Management** > **Firmware update** select the update mode. 
* Upload the firmware 16.X after the reboot and start the update

#### Determine the Provisioning URL

Log into the phone system web UI. Under **Gateways** > **Gateway list**, select your beroNet Gateway and click **Actions** > **Provisioning URL**, which you must now copy to your clipboard.

#### Enter the Provisioning URL on a beroNet Device

Log into thhe web UI of the beroNet box and under **GUI Mode**, ensure that you have selected **Advanced**.

Under **Preferences** > **Provisioning**, enter the following values:

|Field|Value|
|---|---|
|Manual Config| activate|
|Provisioning on Boot:|**always**|
|Provisioning-URL|Paste the previously copied Provisioning URL|
|Polling Interval (min.)|Leave empty|

Save your changes and the beroNet box will now restart.

### pascom Desktop Client Updates

Should you use a pascom desktop client version older than 17.10 then you will need to manually reinstall all the desktop clients.

To do this please follow the [pascom Dekstop Client Installation]({{< ref "/clients/desktop-installation" >}}) guide.

Why:  pascom desktop client versions older than 17.10 update themselves via the pascom Server. From pascom 18 onwards, the server will no longer be responsible for client updates as this role will be performed by a specifically established, centralised pascom update service. 

### Changes to the Fax Server

The pascom Server no longer supports Print-to-Fax.

In addition, using Fax-to-Mail has also changed. The pascom server now retrieves the faxes from a POP/IMAP inbox instead of receiving the E-mail directly via SMTP.

Please update your configuration accordingly.

### Changes to QueueMetrics

The QueueMetrics Interface now transfers data between the pascom Server and QueueMetrics via Uniloader. Uniloader replaces the previous Qloader. The Uniloader is also able to receive commands from QueueMetrics via HTTPS and pass these commands on to the Asterisk AMI.

Further Information can be found in the [Uniloader Documentation](http://manuals.loway.ch/Uniloader-chunked/)



