---
url:  /endpoints/generic-ip-endpoints/
linkde: /endgeraete/beliebiges-ip-geraet-einrichten/
prev: /endpoints/snom-ip-telephones/
next: /endpoints/integrate-aastra-dect-system/
weight: 45
title: Generic IP Endpoints
keywords: 
    - Softphone Integration
    - IP Enpoint integration
    - Grandstream
    - SIP Telephone Integration
description: mobydick can integrate various IP telephone vendors and supports all available SIP softphones
toc: true
---

## Setup IP Phones & Softphones - Generic Vendors

{{% notice tip %}}
mobydick offers Out-of-the-Box telephony thanks to incorporating a fully integrated softphone Windows, MacOSx and Linux. The softphone is automatically deployed with the mobydick desktop client. More information can be found under mobydick [Desktop Client User Guide]({{< relref "02client-user.md" >}})
{{% /notice %}}
mobydick is designed to be compatible with every SIP enabled device. Compared to devices from the vendors Snom, Yealink, Auerswald, Aastra and OpenStage, all other SIP devices are not automatically provisioned by mobydick. Therefore, all other SIP devices will not be automatically added to the device list and a SIP peer will not be automatically added.

In order to register a softphone or another IP telephone with mobydick, press `+Add` in the device list and choose **IP telephone: any manufacturer or softphone** as the device type:
![Screenshot - IP telephone: any manufacturer or softphone Menu](../../images/device_add_softphone.png?width=80% "IP telephone: any manufacturer or softphone Menu")

Next, setup a **Device Login** and **Password** for the device:
![Screenshot - IP telephone: any manufacturer or softphone Menu](../../images/device_softphone_detail.png?width=100% "IP telephone: any manufacturer or softphone Menu")

Use this **Device Login** and **Password** to register the device with the mobydick software as shown below: 
 
### Bria VoIP Softphone

In this example, we are using the Bria softphone from CounterPath:
![Screenshot - Softphone Bria Login ](../../images/device_softphone_bria_settings.png?width=50% "Softphone Bria Login")

### Zoiper Mobile Softphone

Zoiper is another excellent softphone that provides mobile softphone integration. The setup is relatively straight forward. 

#### Android Setup

Download and install Zoiper from the Play Store and then setup up your mobile softphone as follows: 

* Add an account and answer **Yes** to the `Do you already have an account` prompt. 
* Under **Account Setup** select `Manual configuration`.
* Choose account type `SIP`.
* Under **Host** enter the `host name / IP address of your mobydick instance` - for mobydick cloud solutions, please enter your `mobydick instance name` e.g. pascom.
* Under **Username** and **Password** enter the `device login` name and `password` as configured above.
* Under **Outbound Proxy** enter the domain / host name / IP address of where your mobydick instance is hosted, e.g. mobydick.example

Next you will need to configure your Zoiper **Network Settings**

* Change the **Transport type** to `TLS`
* Enable `RPORT for Signalling`

Finally, under **Encryption Settings**, enable `SRTP` and save your configuration.  For this you may require Zoiper Gold.


<!--#### iOS Setup

### CSipSimple

CSipSimple is another popular OpenSource softphone that available to download from the [Google Play Store] (https://play.google.com/store/apps/details?id=com.csipsimple&hl=en "CSipSimple Softphone").-->
Next, you will need to continue with adding [Users and User Locations]({{< relref "02user.md" >}}).

