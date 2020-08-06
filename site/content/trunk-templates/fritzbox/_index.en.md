---
title: Fritz!Box as Trunk
description: Register Trunk via Fritz!Box
weight: 100
---

{{< doctype "self"  >}}

{{< description >}}

## Overview

Under the following circumstances we recommend using a Fritz!Box when registering with your SIP Trunk:

* When connecting a VoIP product that is not a business connection i.e. an ALL-IP private house hold connection
* The SIP account registration with the provider happens via a VLAN which the pascom PBX cannot access.
* VoIP product information is missing, resulting in a direct connection of the SIP trunk not being possible.

{{% notice warning %}}
Through utilizing a Fritz!Box, the Connection will be limited to 2 Voice Channels due to the Fritz!Box firmware.
{{% /notice %}}

![Fritz!Box](fritzbox.en.png?width=70%)

The following guide has been created using a *Fritz!Box Fon WLAN 7390* with the Firmware 06.83.

## Fritz!Box Preparation

Firstly, you will need to add a Fritz!Box account with which the pascom PBX can register onto the Fritz!Box. As AVM (Fritz!Box vendor) produces a German Version and an International Version, our English Translations appear in brackets:

1. Got to your Fritz!Box webpage.
2. Under {{< ui-button "Telefonie" >}} > {{< ui-button "Telefoniegeräte" >}} click on {{< ui-button "Neues Gerät einrichten" >}}. (*Telephony > Telephony Devices > Add New Device*)
3. Select *Telefon (mit oder ohne Anrufbeantworter)*. (*Telephone (with or without answering machine)*)
4. Select *LAN/WLAN (IP-Telefon)* and enter a name.  *LAN/WLAN (IP-Telephone)*
5. Enter the *Username* and *Password* with which the pascom PBX should register.
6. Select the Telecoms Connection phone number on to which inbound calls should be routed.
7. Now select the desired number for outbound calls, which should be the same as the number selected for inbound calls.
8. The final step, you need to save the settings (übernehmen in German). Should this be the first Fritz!Box account to be added, you will need to confirm that you are authorized to make the changes. Go to your Fritz!Box device and press any button.
9. Within the you *Telefonie-Geräte* (Telephony Devices) overview, you will see the internal account number (e.g. \**620). You will need to take note of this extension number.

## Setup pascom Trunk

### Completing the Trunk Template

Add a new Fritz!Box trunk under {{< ui-button "Gateways" >}} > {{< ui-button "Trunks" >}} > {{< ui-button "Add" >}}, which directs you the the SIP provider database. Using the filter, you can search directly for the *Fritz!Box* templates. Select the template and add your account data / credentials to the template setup wizard.

![Fritz!Box Account](fritzbox_account.de.png?width=80%)

By using the template it is possible to add three accounts.

|Variable|Description|
|---|---|
|**Name**|Enter a name for the trunk, which will be displayed in the Trunks overview.|
|**Host**|Enter a host / registrar.|
|**Username line X**|The username you setup in the Fritz!Box.|
|**Password line X**|The line password.|
|**Extension for line X**|The extension belonging to the line which the Fritz!Box assigned in step 9 above.|
|**International code**|Enter the international dialing code e.g. 00|
|**National code**|Enter the national code e.g. 0 |
|**Country code**|Enter the country code for your trunk e.g. 49 Germany, 44 United Kingdom etc.|
|**Area code**|Enter your area code (Ortskennzahl / Ortsvorwahl) excluding the leading 0, e.g. *991* for Deggendorf.|
|**Prefix for incoming number**|Any digit which should precede all incoming calls via this trunk. For example entering 0 will mean that all inbound call numbers will be displayed in the call logs on IP Phones as 00172123123 instead of 0172123123. This enables the direct call back from the call history via this trunk.|

### Modifying Call Rules

The template works on the assumption that the Extensions on the Fritz!Box match the extensions on the pascom phone system exactly. Should this not be the case, you will need to modify your call rules under {{< ui-button "Gateways" >}} > {{< ui-button "Trunks" >}} > Select Trunk > {{< ui-button "Edit" >}} and via modify the rules using the tabs {{< ui-button "Inbound Calls" >}} and {{< ui-button "Outbound Calls" >}}.

|Inbound Calls||
|---|---|
|Destination|The Fritz!Box Extension number e.g. 620, 621...|
|Extension|The extension on which inbound calls should be routed, i.e. user, team etc.....|

|Outbound Calls||
|---|---|
|Source|The user extension which is initiating the call|
|CIDNumber|The Fritz!Box extension number (e.g. 620, 621...)|
|Account|An account must be selected which has been assigned the Fritz!Box CIDnumber.|

### Adding Additional Accounts

Should you wish to add an additional Fritz!Box Number  add the new account in the existing Trunk configuration under the {{< ui-button "Accounts" >}} tab. Since the default settings (basic settings) are the same for both accounts, all you need to do is highlight the account and press the {{< ui-button "duplicate" >}} button.  In the new account row that will appear, you can now adapt the settings by adding the new **Username**, **Password** and **Extension reg.**.

Finally, under {{< ui-button "Gateways" >}} > {{< ui-button "Trunks" >}} > Select Trunk > {{< ui-button "Edit" >}} it is possible to modify / add [call rules]({{< ref "/trunks/rules">}}) via the {{< ui-button "Inbound Calls" >}} and {{< ui-button "Outbound Calls" >}} for the new account.
