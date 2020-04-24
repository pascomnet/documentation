---
title: Siemens Gigaset DECT System
description: Integrate your Gigaset DECT System with your pascom IP PBX solution.
weight: 20
---


{{< doctype "both"  >}}

{{< description >}}

![Siemens Gigaset N870](gigaset_n870.jpg)

## Supported Endpoints

**[List of supported Endpoints, Click here!]({{<ref "/endpoints#siemens-gigaset-dect-systems" >}})**

## Overview

[Snom M700] (https://www.snom.com/ip-phones/workplace-mobility/m700-multi-radio-base-station/ "Snom DECT Workplace mobility solutions") base stations can be operated in both Single Cell and Multi-Cell deployments and are compatible with pascom cloud, hardware and virtual phone systems. As such the Snom M700 is ideally suited for organisations that require additional [work place mobility] (https://www.pascom.net/en/features/ "pascom workplace mobility features") over multiple floors or across larger company buildings.


## Add a new DECT Base

{{% tabs %}}
{{% tab "Pairing via URL (cloud + onsite)" %}}

{{< num 1 "Connect your DECT System" >}}

Integrate the DECT system into your network.

{{< num 2 "Find the MAC Adress" >}}

The MAC address can be found on the base station or on an enclosed memo.

{{< num 3 "Create Basestation on the pascom server" >}}

Log in to your pascom System and add a new basestation under {{< ui-button "Gateways" >}} > {{< ui-button "Gatewaylist" >}} of the type **DECT-gateway: Gigaset**.


Enter the previously determined MAC address of the DECT system in the **Mac address** field.

{{< num 4 "Apply Jobs" >}}

After saving the changes, a job box appears (above). Start the job with a click on the button {{< ui-button "Apply" >}}.

{{< num 5 "Find the provisioning URL" >}}

Check the DECT System in the device list and select {{< ui-button "Aktion" >}} > {{< ui-button "Provisioning URL" >}}. Copy that
**URL** to the clipboard.

{{< num 6 "Store the provisioning URL in the DECT base" >}}

Enter the just copied provisioning URL on the DECT System's Web UI.

Finally make a Reboot of the DECT System to update the provisioningdata.

{{% /tab %}}


### Add / Assign Handsets

Under {{< ui-button "Devices" >}} > {{< ui-button "Device List" >}} > {{< ui-button "Add" >}}, select the option {{< ui-button "Via Gigaset DECT Gateway: handset" >}}

Ìn the next screen, you will be able to configure the device and under the {{< ui-button "Assignment" >}} tab you will be able to assign users and / or locations.

|Parameter|Description|Comments|
|----|----|----|
|Connected to| Select a Gateway to connect to.|In multicell environments, all Gateways configured as a repeater are automatically hidden.|
|IPEI Number|Enter the handset IPEI number which can be found via the handset menu Settings > Status|The first line of the IPEI number is enough, i.e. everything after the colon (:) symbol does not need to be entered.|
|SIP Options| (Optional Step) It is possible to enter all the SIP peer options as supported by Asterisk| Please refer to Asterisk's SIP Configuration - Peers and Clients Documentation.|
