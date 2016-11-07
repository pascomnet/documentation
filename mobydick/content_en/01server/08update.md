---
title: Updating mobydick
keywords:
    - mobydick installation
    - Virtual Machine installation
    - mobydick Hardware installtion
    - mobydick system requirements
    - updating mobydick phone system
description:
linkde: /server/update-und-ueberwachung/
url: /server/update/
prev:  /server/backups/
next: /server/automation/
weight: 18
toc: true
---

## Concept

{{% notice note %}}
This article only applies to commercial mobydick customers. Community users will automatically receive updates from
the **current** update channel and are not able to switch update channels!
{{% /notice %}}

There are currently 3 mobydick Update Channels available

|Update-Cannel|Description|
|---|---|
|CURRENT|The *Current* Channel contains the latest mobydick release, including all the newest functions. Of course, these have been put through intensive tests, however this version has only been in productive operation within smaller user environments and for a shorter period of time.|
|STABLE|*Stable* is the default setting for every mobydick installation. By using the "Stable" Channel you will receive a mobydick version which is recommended for productive systems. This will mean that the update will have been already been put into productive testing for at least 3 months prior to be released as "Stable" but therefore does not included the newest functions.|
|LTS| *LTS* or Long Time Support was introduced as mobydick version 7.11 due to the fact that numerous underlying modifications were made in mobydick 7.12, which are no longer compatible with previous versions (for example switching from an installations packet licensing technology to using licence keys or removing support for Junghanns ISDN cards).|

{{% notice warning %}}
Only process updates using the Update Tool!
{{% /notice %}}

## Choose Update Channel

Before updating, please check your Update Channel under [my.pascom](https://my.pascom.net/ "my.pascom.net licence portal").

{{% notice tip %}}
Should you not have any login details, as a pascom customer you can create a new account free of charge at any time under [my.pascom](https://my.pascom.net/#/buy/product). You will need your e-mail address and your mobydick System ID.
{{% /notice %}}

Log into the marketplace and click on licences. Select the licence that is to be edited and you will see an overview and the status of the Update Channel. Should the channel not be correct, click on `Select Update Channel` and choose your required channel.

## Using the Updater

An update section is available within the mobydick UI. There are a few options to reach the updater:

* Via the web UI by clicking on the `Service` tab before logging on and then on `Softwareupdate`.
* If you are alreadly logged on, then select the `Appliance` menu and open the updater via `Firmare/Softeware Update`.
* Alternatively, you can open the updater via the URL:
~~~~ https://mobydick_ip/update ~~~~.

Finally, log in using your Admin user.
After logging in, you will see an overview of the different packets which are all assigned with a status.

|Status|Description|
|---|---|
|green|Packet is up to date|
|yellow|A new version is available and can be installed|
|grey|an additional packet is available and can also be installed|
|red|The packet has not been installed correctly|

{{% notice note %}}
Should no new packet information be displayed, it could be that your mobydick does not have access to the update pool. In this case, check the Update pool network connection:  
**Community Version:** community.pascom.net via Port TCP 80  
**Licensed Version:** https://my.pascom.net Port TCP 443
{{% /notice %}}

## Update Process

Clicking on `Install Updates` will start the update process. Next the new packets will be downloaded and installed.
The process can be monitored directly in a browser window.

{{% notice warning %}}
Do not close the browser during an update!
{{% /notice %}}

It may be necessary to run the update process several times, for example if the update mechanism itself needs to be updated. You will be notified as needed.


## Offline-Update

For the above described update processes, mobydick requires an internet connection. Should an online update not be possible, (e.g. mobydick is not permitted to communicate externally or an unstable internet connection) we also offer an offline updates process.

{{% notice warning %}}
Offline updates packets are individual according to mobydick server. Using an update packet intended for a different mobydick server will lead to problems!
{{% /notice %}}

Log into the [my.pascom](https://my.pascom.net/ "my.pascom.net licence portal")  and select the licence for the system by which the offline update should be processed.

### Updater Updates

Should you still be operating a mobydick Version 7.00 to 7.09, the updater will need to be updated. Click on `Download Current Updater`

within the mobydick updater, click on the `Upload` tab and upload the Updater packet and followin the on-screen instructions.

### mobydick Updates

Under [my.pascom](https://my.pascom.net/ "my.pascom.net Licence portal"), download either `Offline Update` packet. According to your installation, please choose either the 32 or 64 Bit packet.

Upload the `Offline Update` packet in the upload field and follow the onscreen instructions.
