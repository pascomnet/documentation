---
title: Behnke Door Intercom
description: How to integrate Behnke door intercoms systems into your pascom phone system
weight: 10
---

{{< doctype "both"  >}}

{{< description >}}


## Restrictions

The door intercom from Behnke can not be automatically configured in the pascom phone system.
Remote CTI control via the pascom client is only possible in a restricted form.

### Endpoint Requirements

In order for a SIP device to operate with the pascom server, the following functions are necessary:

* **SIP via TCP/TLS** (encrypted signaling)
* **SRTP** (encrypted voice data)
* **Outbound Proxy** (send data via the Session Border Controller)

## Preparation and login data

{{% notice tip %}}
Unfortunately, many vendors use different names for effectively the same settings. This means you may need to experiment a bit. The following table shows the common terms used.
{{% /notice %}}

|Setting|Example value|Description|
|---|---|---|
|Registrar, SIP-Server|**pascom**|Name of the phone system|
|Proxy, Outbound-Proxy|**pascom.cloud**|DNS name or Server IP address|
|SIP-Port| **TCP 5061** | TLS SIP Port|
|Username, Identity, Authuser|**my-telephone-name**|Device login name|
|Password|*****| Device password, not the user's password!|

## Creating a user for the Behnke door intercom station

The door intercom station needs a user with an internal extension number to control the door intercom. On the pascom Admin Web Interface, go to {{< ui-button "Users" >}} > {{< ui-button "User List" >}} and click {{< ui-button "Add" >}}.

Fill in the predefined fields with your data.

![New User for door intercom](newuser.en.PNG?width=80%)


## Apply Jobs

After saving your changes, an entry will appear in the job box (top centre of the window). Start the job by clicking apply or the `green tick`.

## Create/Add the door intercom device

Insert under {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}}
 a new device of type **Generic SIP Phone**.


Enter a **"Device Login Name"** and a **"Password "** for the door intercom station. The following options must be entered in the **"SIP options "** entry field. 

1. **endpoint/allow=!all,alaw:20**

{{% notice tip %}}
The **"Device Login Name "** assigned here, as well as the assigned **"Password "** are entered later in the Behnke door intercom station settings.
{{% /notice %}}

![Create new Behnke device](newendpoint.en.PNG?width=80%)


Under the tab {{< ui-button "Assignment" >}} you assign the previosly created user to the door intercom station. Finally save and apply the job of the telephony configuration!


## Configure the Behnke door intercom station

To configure the Behnke door intercom station, please use the manufacturer's instructions.

[Behnke instructions PDF](https://www.behnke-online.de/telefonanlagen/540-pascom-cloud-anlage/file)
