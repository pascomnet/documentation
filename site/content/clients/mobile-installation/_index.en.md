---
title: Mobile Client Installation
description: How to install the pascom mobile clients via the App and Play Store and pair the app using the QR Code from the pascom Server.
weight: 40
---

{{< doctype "both" >}}

{{< description >}}

## Android Installation

{{% notice tip %}}
System Requirements **Android 6.0** or higher.
{{% /notice %}}

The latest pascom mobile VoIP app can be directly installed on your Android smartphone via the [Google Playstore](https://www.pascom.net/playstore).

## iOS Installation

{{% notice tip %}}
System Requirements **iOS 10 (64bit)** or higher.
{{% /notice %}}

The latest pascom mobile VoIP app can be directly installed on your Apple smartphone via the [Apple Appstore](https://www.pascom.net/appstore).

## Add Mobile Device on the Server (optional)

{{% notice tip %}}
When you add a new user, a **mobile telephone** will **automatically** added for this user. However, should you have selected `Has mobile phone` `No` when adding the user, or you have **deleted** the device or the user has **multiple mobile phones**, you will need to add the phone **before** the pairing process.
{{% /notice %}}

To add a mobile phone, proceed as follows:

 * Log into the pascom server web UI
 * Add a new device under: `Devices` > `Device list` > `Add` > **Via Mobile Hub: integrated mobile phone**
 * **(Optional)** Enter the user's mobile phone number in international format (e.g. 0049172123123). This is only required when you wish to the use the Mobile Hub GSm Fallback function. If you leave the number empty, it can also be added during the mobile app pairing process. 
 * Assign the device to the user under the `Assignment` tab.
 * Save and apply the job which has appeared in the job box.

## Pair the Mobile Client with the pascom Server

There are two options for pairing the pascom mobile app with the pascom server:

### Pairing via the pascom Server

Should you choose to, as an administrator, you can perform the pairing process for your users directly via the pascom server web UI:

 * Log into the pascom server web UI
 * Under `Devices` > `Device list` select the desired mobile device
 * Click on `Edit` and then `Pair`
 * Start the mobile app on the to be paired smart device and press`Start`
 * Using the app, scan the QR code
 * **(Optional)** If you want to use the mobile hub GSM fall back option, enter the user's mobile phone number or confirm that a number was already added when the device was added.


### Pairing via the pascom Desktop Client

Alternatively, your user can pair the devices themselves via the pascom Desktop Client. Further details can be found in the [Mobile Client User Guide]({{< relref "/client-mobile-userguide">}})

