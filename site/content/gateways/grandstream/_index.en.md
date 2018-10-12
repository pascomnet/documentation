---
title: Grandstream ATA HT701 and HT802
description: Grandstream ATA adapters provide a cost effective solution for integrating Analog technology such as Fax / Door Intercom systems etc into your pascom phone system.
weight: 40
---

## Compatibility

**Grandstream HT701**

- A FXS Port for one analog fax device.
![Grandstream HT701](grandstream_ht701.jpg?width=300px)


**Grandstream HT802**

- Two FXS Ports for two analog endpoints
![Grandstream HT802](grandstream_ht802.png?width=300px)


|Provisioning|Firmware Management|
|---|---|
|Yes|No|

**Provisioning**: The gateway / adapter will be managed via the pascom phone system.<br>
**Firmware Management**: Device firmware can not be actualized / updated via the pascom phone system.<br>


## Configuration

### Preparation

For automatic device commissioning, a functioning DHCP server is essential.

### Device Commissioning

Connect your Grandstream ATA to your network. The device will then automatically appear in the Gateways list once successfully booted {{< ui-button "Gateways" >}} > {{< ui-button "Gateway list" >}}.

<!--FIXME steckersymbol, status?-->

### Adding Endpoints via SIP

Follow the following steps {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}} > {{< ui-button "Add" >}} > and select the option **Via Grandstream Gateway: Analog device via SIP**.
Next, under the {{< ui-button "Basic data" >}} tab select the Gateway port on which the device should be connected to. Finally, assign the device to a user under the {{< ui-button "Assignment" >}} tab.

{{% notice note%}}
After saving your configuration, the Gateway must be manually restarted. This needs to only be done once and is done by disconnecting the Gateway's power supply. After restarting, the Grandstream ATA will be provisioned by the pascom phone system.
{{% /notice %}}
