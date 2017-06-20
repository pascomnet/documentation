---
title: Cisco SPA112
prev: /analog-isdn-gateways/beronet-gateways/
url: /analog-isdn-gateways/cisco-spa112/
next: /analog-isdn-gateways/patton-gateways/
Keywords:
    - Cisco ATA adapters
    - Analog Fax Integration
    - SPA112
description: Cisco ATA Adapters provide an effective solution to integrating Analog technology such as Fax / Door Intercom systems etc. 
weight: 53
toc: true
---

![Cisco SPA 112](/cisco_spa112.jpg?width=300px)

## Compatibility

Provisioning|Firmware Management|
|---|---|
|Yes|No|

**Provisioning**: The gateway / adapter will be managed via the pascom phone system.<br>
**Firmware Management**: Device firmware can not be actualised / updated via the pascom phone system.<br>

The Cisco SPA112 Gateway has two FXS ports for connecting two analog endpoints

## Configuration

### Prepartion

For automatic device commissioning, a functioning DHCP server is essential. Please refer to [Network planning & configuration](../../server/network-configuration/) for more information.

### Device Commissioning

Connect your Cisco SPA112 to your network. The device will then automatically appear in the Gateways list once successfully booted `Gateways` > `Gateway list`.

<!--FIXME steckersymbol, status?-->

### Adding Endpoints via SIP

Follow the following steps `Devices` > `Device list` > `Add` > and select the otion **Via Cisco Gateway: Analog device via SIP**.
Next, under the `Basic data` tab select the Gateway port on which the device should be connected to. Finally, assign the device to a user under the `Assignment` tab.

After saving your configuration, the Cisco Gateway will restart during which your Cisco SPA 112 will be provisioned by your pascom phone system.
