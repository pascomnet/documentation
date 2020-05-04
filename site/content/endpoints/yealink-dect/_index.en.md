---
title: Yealink DECT System
description: Integrate your Yealink DECT system with your pascom phone system.
weight: 17
---

{{< doctype "both"  >}}

{{< description >}}

![Yealink W52P](yealink_w52p_dect.png?width=300px "pascom phone system Yealink W52P DECT system integration")

## Supported Endpoints

**[List of supported Endpoints, Click here!]({{<ref "/endpoints#yealink-dect-systems" >}})**

## Overview

The Yealink DECT solution is ideally suited for small businesses who require only a small number of mobile handsets (maximum 5).

## Add a new DECT Base

{{% tabs %}}
{{% tab "Pairing via URL (cloud + onsite)" %}}

{{< num 1 "Connect your DECT System" >}}

Integrate the DECT system into your network.

{{< num 2 "Find the MAC Adress" >}}

The MAC address can be found on the base station or on an enclosed memo.

{{< num 3 "Create Basestation on the pascom server" >}}

Log in to your pascom System and add a new basestation under {{< ui-button "Gateways" >}} > {{< ui-button "Gatewaylist" >}} of the type **Gateway: Yealink**.


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

### Add and Assign Handsets

It is only possible to register a maximum of 5 handsets per base station.

Under {{< ui-button "Devices" >}} > {{< ui-button "Device List" >}} > {{< ui-button "Add" >}}, select the option {{< ui-button "Via Yealink DECT Gateway: handset" >}}. Next you will need to update the following settings: Einstellungen müssen Sie vornehmen:

|Settings|Description|
|---|---|
|Connected to|Select the DECT base station.|
|Assignment|In this tab, you can assign users.|

## Register Handsets to the DECT Base Station

The handsets will automatically connect themselves to the DECT base station as soon as they are placed in the charging stations and the provisioning of the Base Station has been applied. 

{{% notice note %}}
It is possible that the DECT base station may require a restart. 
{{% /notice %}}
