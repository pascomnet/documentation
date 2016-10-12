---
title: Adding Analog and ISDN Device Integration
keywords: 
    - Adding Analog Devices
    - ISDN Device Integration
    - Device Integration via Gateway
    - Device Integration via Trunk
description: How to connect and integrate Analog and ISDN devices to mobydick via a Gateway or Trunk
url: /endpoints/analog-and-isdn-devices/
linkde: /endgeraete/analog-und-isdn-geraete/
next: /endpoints/integrate-aastra-dect-system/
prev: /endpoints/generic-ip-endpoints/
weight: 46
toc: true
---

## Device Integration via a Gateway

Analogue and ISDN devices can be connected to mobydick using a beroNet gateway or a Patton Gateway. To use this ption, your gateways will need to be configured correctly. 

To add analogue or ISDN devices, press the `Add` button in the device list and choose from either via **Patton gateway: (TECHNOLOGY TYPE)** or via **beroNet gateway: (TECHNOLOGY TYPE)** for the device type,
depending on the gateway used and the configuration of the ISDN interface:

![Screenshot - Analogue and ISDN Device Menu](../../images/device_add_analog_isdn.png?width=30% "Analogue and ISDN Device Menu")

In our example, we chose via berofix gateway: analog device directly, as this is a very common option to connect a fax device.

![Screenshot - Add Analogue and ISDN Device ](../../images/device_beronet.png?width=100% "Add Analogue and ISDN Device ")

|Parameter|Description|
|---------|---------|
|Connected to|	Which physical port the device is connected to.|
|Name|	Name of device|
|Extensions|	Device extension number|
|Trunk Access|	Only for devices of type "direct". Is it necessary to dial 0 in order to dial an outside line|
|Outbound Port Group|	Only for devices of type "direct". As the routing for this device is done on the gateway, a line connected to the gateway can be used. If the option - internal only - is chosen, the device can only call internal extensions.|
|Inbound Port Group|	Only for devices of type "direct". As the routing for this device is done at the gateway, a line connected to the gateway can be used. If the option - internal only - is chosen, the device will then be unreachable from the outside.|

If you created a device using the selection `via SIP, please proceed with by assigning Users and User Locations. All other devices are now ready to be used.



## Integrating Devices via a Trunk

mobydick is able to integrate any device with the system, as long as these devices are reachable via a trunk. Such devices can include your Home Office Telephone or any mobile phones.

To register an external device connecting via trunk, click `Add` in the device list and choose **via trunk: any external phone** as the device type.
![Screenshot - Integrating Devices via a Trunk](../../images/device_extern.png?width=100% "Integrating Devices via a Trunk")

|Parameter|Description|
|---------|---------|
|Name	|Device name.|
|Target Number|	The number needed to call the external device, including the number prefix for external line seizure. In this case 0.|