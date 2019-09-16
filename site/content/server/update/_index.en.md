---
title: pascom phone system updates
description: Step by step guide to updating your pascom phone system
weight: 70
---

{{< doctype "self" >}}

{{< description >}}

## Training Video

{{< youtube 4vM4dXrs0sQ  >}}

## Phone System Updates

If you have already deployed a pascom 18 or newer phone system, the following steps are necessary when updating your phone system. 

## Download pascom ISO

Download the latest version of the pascom phone system server [ISO file](https://www.pascom.net/en/downloads/) from the downloads page on our website.

## Perform pascom Update

Log into the **pascom Server Management** UI.

Under the menu option {{< ui-button "System" >}} click the {{< ui-button "Upload Update" >}} button and upload the ISO file downloaded in the previous step.

As soon as the upload has successfully finished, the host with the new server version will be listed under {{< ui-button "System" >}} > {{< ui-button "Firmware" >}}.

## Restart pascom

{{% notice warning %}}
During the phone system restart and installation process, telephony services will not be available and all active calls will be disconnected. Therefore, never perform a system restart while the system is in use.
{{% /notice %}}

The installation of updates is done only when the phone system has been restarted.

To perform a restart, click {{< ui-button "System" >}} > {{< ui-button "Restart" >}}
