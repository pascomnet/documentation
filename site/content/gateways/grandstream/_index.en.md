---
title: Grandstream HTXXX and GXW42XX
description: Grandstream ATA adapters provide a cost effective solution for integrating Analog technology such as Fax / Door Intercom systems etc into your pascom phone system.
weight: 40
---

{{< doctype "both"  >}}

{{< description >}}

![Grandstream Modelle](grandstream_image.png)

## Compatibility

|Model|Ports|
|---|---|
|HT701|1|
|HT802|2|
|HT812|12|
|HT814|14|
|HT818|18|
|GXW4216|16|
|GXW4224|24|
|GXW4232|32|
|GXW4248|48|

## Provisioning

|Provisioning|Firmware Management|
|---|---|
|Yes|No|

**Provisioning**: The gateway / adapter will be managed via the pascom phone system.<br>
**Firmware Management**: Device firmware can not be actualized / updated via the pascom phone system.<br>


## Configuration
{{% tabs %}}

{{% tab "Cloud" %}}

**Pairing via URL works in the CLOUD + ONSITE**  

{{< num 1 "Connect Gateway" >}}

{{% notice tip %}}
If it is not a brand-new gateway, set it in every
Fall back to **factory settings**. To do this at the gateway, switch to the admin interface of the gateway via your browser and perform a **Reset** there. For further information, please refer to the manufacturer's manual. 
{{% /notice %}}

Connect the gateway to the network. 


{{< num 2 "Get MAC Address" >}}

The MAC address is located on the back of the gateway.

Alternatively, surf to the gateway's admin web interface with your browser or use the user manual.


{{< num 3 "Create Gateway" >}}

Log in to your PBX and under {{< ui-button "Gateways" >}} > {{< ui-button "Gatewaylist" >}}
add a new device of type **ATA Gateway: Grandstream**.

Select the **model** you have connected.

In the **Mac Address** field, enter the previously determined MAC address of the gateway.

Enter an individual description.

Finally, click on **Next and Create Gateway**.

{{< num 4 "Apply Jobs" >}}

After saving changes, the job box (above) shows a
corresponding entry to use telephony settings. Start the job by
a click on the {{< ui-button "green check mark" >}}.

{{< num 5 "Get Provisioning URL" >}}

Check the Gateway in the Gateway List and choose {{< ui-button "Action" >}} > {{< ui-button "Provisioning URL" >}}. Copy the **URL** to the clipboard.

{{< num 6 "Enter Provisioning URL at the Gateway" >}}

Go to the admin UI of the gateway and store the copied provisioning URL.

![Grandstream Provisioning URL](provisioning_url.png)

Save the changes and restart the gateway for provisioning. Alternatively, you can restart the gateway
also manually remove the power briefly.


{{< num 7 "Creating a new device via SIP and assigning users" >}}

Choose under {{< ui-button "Devices" >}} > {{< ui-button "Device List" >}} > {{< ui-button "Add" >}} > the entry **Via Grandstream Gateway: Analog Device via SIP**.
In the tab {{< ui-button "Base Data" >}} select the port on the Gateway to which the device should be connected. Then assign the device to a user via the {{< ui-button "Assignment" >}} tab.

{{< num 8 "Test Function" >}}

The easiest way to test the successful Setup is to call your own voice mailbox with **\*100**. You should then hear the announcement of your voicemail box.


{{% /tab %}}

{{% tab "Onsite" %}}

**DHCP Provisioning only works ONSITE**  


{{% notice note %}}
For local installations of the pascom server it is possible to commission gateways fully automatically via DHCP server.
{{% /notice %}}

{{< num 1 "Prepare DHCP server" >}}

Prepare a DHCP server as described in [Phone Provisioning via DHCP]({{< ref "/howto/dhcp-provisioning" >}}).

{{< num 2 "Connect the Gateway" >}}

{{% notice tip %}}
If it is not a brand-new gateway, set it in every
Fall back to **factory settings**. To do this at the gateway, switch to the admin interface of the gateway via your browser and perform a **Reset** there. For further information, please refer to the manufacturer's manual. 
{{% /notice %}}

Connect the gateway to the network.

The device is **automatically** configured by the pascom server and **appears** in the list {{< ui-button "Gateways" >}} > {{< ui-button "Gateway List" >}}. 

{{< num 3 "Create new device via SIP and assign users" >}}

Choose under {{< ui-button "Devices" >}} > {{< ui-button "Device List" >}} > {{< ui-button "Add" >}} > the entry **Via Grandstream Gateway: Analog Device via SIP**.
In the tab {{< ui-button "Base Data" >}} select the port on the Gateway to which the device should be connected. Then assign the device to a user via the {{< ui-button "Assignment" >}} tab.

{{< num 4 "Apply Jobs" >}}

After saving changes, the job box (above) shows a
corresponding entry to use telephony settings. Start the job by
a click on the {{< ui-button "green check mark" >}}.

{{< num 5 "Test function" >}}

The easiest way to test the successful Setup is to call your own voice mailbox with **\*100**. You should then hear the announcement of your voicemail box.

{{% /tab %}}
{{% /tabs %}}

{{% notice tip %}}
Problems with provisioning? Occasionally, 3CX's built-in auto-provisioning feature may block a setup on the pascom.
{{% /notice %}}

### Deactivate 3CX Auto Provisioning.

If the setup of the gateway on the pascom does not work, the auto-provisioning of 3CX may be activated. This can be disabled via the admin web interface of the gateway.

![3CX Auto Provisioning](3cx_autoprovisioning.png?width=60%)


