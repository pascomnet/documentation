---
title: Snom DECT System
description: Integrate your Snom DECT System with your pascom IP PBX solution.
weight: 20
---


{{< doctype "both"  >}}

{{< description >}}

![Snom M700](snom_m700_dect.png?width=600px "Snom M700 pascom IP PBX compatible DECT Solution")

## Supported Endpoints

**[List of supported Endpoints, Click here!]({{<ref "/endpoints#snom-dect-systems" >}})**

## Overview

[Snom M700] (https://www.snom.com/ip-phones/workplace-mobility/m700-multi-radio-base-station/ "Snom DECT Workplace mobility solutions") base stations can be operated in both Single Cell and Multi-Cell deployments and are compatible with pascom cloud, hardware and virtual phone systems. As such the Snom M700 is ideally suited for organisations that require additional [work place mobility] (https://www.pascom.net/en/features/ "pascom workplace mobility features") over multiple floors or across larger company buildings.

### Available Channels

||Snom DECT - Single Cell|Snom DECT - Multi-Cell|
|----|----|----|
|Narrowband (g711, g729, g726)|10|8|
|Wideband (g722), SRTP aktiviert (g722, g711, g729, g726)|5|4|

## Add a new DECT Base

{{% tabs %}}
{{% tab "Pairing via URL (cloud + onsite)" %}}

{{< num 1 "Connect your DECT System" >}}

Integrate the DECT system into your network.

{{< num 2 "Find the MAC Adress" >}}

The MAC address can be found on the base station or on an enclosed memo.

{{< num 3 "Create Basestation on the pascom server" >}}

Log in to your pascom System and add a new basestation under {{< ui-button "Gateways" >}} > {{< ui-button "Gatewaylist" >}} of the type **SNOM Dect**.


Enter the previously determined MAC address of the DECT system in the **Mac address** field.

{{< num 4 "Apply Jobs" >}}

After saving the changes, a job box appears (above). Start the job with a click on the button {{< ui-button "Apply" >}}.

{{< num 5 "Find the provisioning URL" >}}

Check the DECT System in the device list and select {{< ui-button "Aktion" >}} > {{< ui-button "Provisioning URL" >}}. Copy that
**URL** to the clipboard.

{{< num 6 "Store the provisioning URL in the DECT base" >}}

Enter the just copied provisioning URL on the DECT System's Web UI.

Click on {{< ui-button "Apply" >}} and then on {{< ui-button "Reboot" >}}.

{{% /tab %}}

{{% tab "DHCP Provisioning (onsite)" %}}


{{< num 1 "Prepare your DHCP Server" >}}

For the automatic provisioning of Snom DECT systems, a functioning DHCP server is required.
Prepare a DHCP Server as described under [Telephone provisioning via DHCP]({{< ref "/howto/dhcp-provisioning" >}}).

{{< num 2 "Connect the DECT System" >}}

Connect all required Snom base stations to your network. Once the boot process is completed, base stations will automatically appear in the PBX web UI Gateway list ('Gateways' > 'Gateway list').

The **Status** field currently has no relevance and the "plug symbol" warning is normal at this stage.


{{% /tab %}}


## Configuring Multi-Cell Operation

Should you wish to network multiple Gateways into a multicell DECT system, simply mark and select all the desired Gateways and click **Edit**. By using the arrow buttons, you can navigate through all your selected Gateways and then edit them as follows:

Under the {{< ui-button "Mutli Cell" >}} option, select the value {{< ui-button "Base Station" >}} for one of the Gateways and for all other Gateways, select the option {{< ui-button "Repeater" >}}.

### Add / Assign Handsets

Under {{< ui-button "Devices" >}} > {{< ui-button "Device List" >}} > {{< ui-button "Add" >}}, select the option {{< ui-button "Via Snom DECT Gateway: handset" >}}

Ìn the next screen, you will be able to configure the device and under the {{< ui-button "Assignment" >}} tab you will be able to assign users and / or locations.

|Parameter|Description|Comments|
|----|----|----|
|Connected to| Select a Gateway to connect to.|In multicell environments, all Gateways configured as a repeater are automatically hidden.|
|IPEI Number|Enter the handset IPEI number which can be found via the handset menu Settings > Status|The first line of the IPEI number is enough, i.e. everything after the colon (:) symbol does not need to be entered.|
|SIP Options| (Optional Step) It is possible to enter all the SIP peer options as supported by Asterisk| Please refer to Asterisk's SIP Configuration - Peers and Clients Documentation.|
