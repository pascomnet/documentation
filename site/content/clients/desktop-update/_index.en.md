---
title: Desktop Client Update
description: The pascom Desktop client automatically updates itself. Through using our Update Channels, it is very simple to use for example our BETA and feature versions.
weight: 20

---

{{< doctype "both" >}}
 
{{< description >}}

## Automatic Updates

The pascom client retrieves all updates via HTTPS via [my.pascom.net](https://my.pascom.net/). This enables the backwards compatibility of the desktop client with the pascom server.

## Manual Updates

You can disable the automatic updates by using the command line option `--noUpdate` and then self distribute updates or manually install them. The newest desktop client can be downloaded from our [Homepage](https://www.pascom.net/en/downloads/#clients).

For [Terminal Server Installations]({{< ref "/clients/desktop-installation#terminalserver-installation" >}}), automatic updates are deactivated even without using the  `--noUpdate` option.

## Update Channels

A number of update channels are available to choose from.
These can be found in the desktop client under `Settings` > `About pascom client` > `Channel`. 

Per default, the `Stable` channel is selected - this contains the same version, which is available to download from our [Homepage](https://www.pascom.net/en/downloads/#clients).

### BETA Programme

You can switch your Update Channel the `BETA` channel at anytime and participate in our BETA programme. 

Your input is important to us and we look forward to your feedback in our [Forum](https://www.pascom.net/forum/)

{{% notice warning %}}
If you wish to switch from a bespoke / custom Update Channel or the `BETA` Channel, all your user profiles will be deleted, as this action normally relates to a downgrade. Saved within your user profile there are settings such as the desktop theme being used or the contact list sorting option. These settings must be then be newly configured.
{{% /notice %}}

### Feature Channels

Alternatively, you can manually set a feature channel. These are occasionally added to test individual functions and are announced via our [Forum](https://www.pascom.net/forum/) or by our support team. 
