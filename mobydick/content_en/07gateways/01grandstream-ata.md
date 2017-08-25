---
title: Grandstream HT701 & HT802 ATA Adapters
prev: /analog-isdn-gateways/
url: /analog-isdn-gateways/grandstream-ata-ht-series/
next: /analog-isdn-gateways/beronet-gateways/
linkde: /isdn-analog/grandstream-ata-ht-serie/
Keywords:
    - Grandstream ATA adapters
    - Analog Fax Integration
    - Grandstream HT series
    - HT701
    - HT802
    - Analog adapters
description: Grandstream ATA Adapters provide a cost effective solution to integrating Analog technology such as Fax / Door Intercom systems etc. 
weight: 51
toc: true
---

## Compatibility

**Grandstream HT701**

- A FXS Port for one analog fax device.
![Grandstream HT701](/grandstream_ht701.jpg?width=300px)


**Grandstream HT802**

- Two FXS Ports for two analog endpoints
![Grandstream HT802](/grandstream_ht802.png?width=300px)


|Provisioning|Firmware Management|
|---|---|
|Yes|No|

**Provisioning**: The gateway / adapter will be managed via the pascom phone system.<br>
**Firmware Management**: Device firmware can not be actualised / updated via the pascom phone system.<br>


## Configuration

### Prepartion

For automatic device commissioning, a functioning DHCP server is essential. Please refer to [Network planning & configuration](../../server/network-configuration/) for more information.

### Device Commissioning

Connect your Grandstream ATA to your network. The device will then automatically appear in the Gateways list once successfully booted `Gateways` > `Gateway list`.

<!--FIXME steckersymbol, status?-->

### Adding Endpoints via SIP

Follow the following steps `Devices` > `Device list` > `Add` > and select the otion **Via Grandstream Gateway: Analog device via SIP**.
Next, under the `Basic data` tab select the Gateway port on which the device should be connected to. Finally, assign the device to a user under the `Assignment` tab.


{{% notice note%}}
After saving your configuration, the Gateway must be manually restarted. This needs to only be done once and is done by disconnecting the Gateway's power supply. After restarting, the Grandstream ATA will be provisioned by the pascom phone system.
{{% /notice %}}
