---
title: Siemens Gigaset IP DECT System
description: Integrate your Gigaset IP DECT System into your pascom VoIP phone system.
weight: 15
---


{{< doctype "both"  >}}

{{< description >}}

![Siemens Gigaset N870](gigaset_n870.jpg)

## Supported Endpoints

**[List of supported endpoints, click here!]({{<ref "/endpoints#siemens-gigaset-dect-systems" >}})**

## Overview

The Gigaset IP DECT Base Station can be operated as either a single or mutli cell deployment. It is ideally suited for businesses that require DECT coverage across multiple floors or over a large office space.


## Add New DECT Base Station

{{% tabs %}}
{{% tab "Pairing via URL (cloud + onsite)" %}}

Before integrating a Gigaset DECT system with the pascom phone system, the Gigaset DECT sender(s) must first be prepared. The first sender is also used for transmitting data from the pascom phone system must be configured with the **"Integrator/DECT Manager"** role before starting the setup process. **Please follow the instructions outlined here or the instructions as provided by Gigaset.** When adding further senders as part of a mutle-cell solution, the sender(s) must be assigned with the "Base Station" role (standard device role as delivered by Gigaset).

{{< num 1 "Connect DECT System" >}}


Integrate the DECT System into your network. 

{{< num 2 "Find the MAC Address" >}}

The MAC address can be found on the Base Station or in a document enclosed within the packaging.

{{< num 3 "Add Base Station" >}}

Log into your pascom phone system and under {{< ui-button "Gateways" >}} > {{< ui-button "Gateway List" >}} add a new device with the type **DECT Gateway: Gigaset**.

In the field **MAC address** enter the MAC address you found in step 2. 

{{< num 4 "Apply Jobs" >}}

After saving your changes, the corresponding apply telephony entry will appear in the Job Box (top center of screen). Start the job by clicking on the {{< ui-button "green tick" >}}. 

{{< num 5 "Find the Provision URL" >}}

Within the device list and select {{< ui-button "Action" >}} > {{< ui-button "Provisioning URL" >}}. Copy the **URL** to the clipboard.

{{< num 6 "Enter the Provisioning URL to DECT base station admin UI" >}}

Within the DECT system admin Web UI, enter the copied provisioning URL.

Finally, on the DECT system perform a system restart in order to update the provisioning data.

{{% /tab %}}


### Add and Assign Handsets

Under {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}} > {{< ui-button "Add" >}} select the option *Via Gigaset DECT Gateway: handset*. You will be required to configure the following settings:

|Setting|Description|
|---|---|
|Connected to|Select a DECT sender or the DECT system (for multi cell deployments).|
|IPEI number|Enter the Handset IPEI number.|
|SIP Options|Optionally, it is possible to add Asterisk specific SIP options.|
|Assignment|Under this tab, you can now assign the handset to a user / location.|