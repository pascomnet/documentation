---
title: Deutsche Telekom Company Flex BETA
description: Overview of the pascom managed Provider Template from Deutsche Telekom
weight: 5
---

{{< doctype "both"  >}}

{{< description >}}

![Deutsche Telekom Provider Logo](deutsche-telekom-logo.png?width=50%)

## Overview

Tariff in combination with pascom: **Company Flex**  

{{% notice warning %}}
**Telekom Company Flex SIP Trunk** is actually only supported with pascom 19.13 BETA.
{{% /notice %}}


Deutsche Telekom package specifications and tariff information can be found [here](https://geschaeftskunden.telekom.de/internet-dsl/tarife/festnetz-internet-dsl/companyflex). pascom phone systems (onsite and cloud) support only Deutsche Telekom business SIP Trunk tariffs.  

{{< num 1 "Your Account" >}}

Once your Deutsche Telekom  Company Flex has been activated, you will receive account data that are similar to below. 


**Telekom Company Flex**

![Your Deutsche Telekom credentials](telekom-accessdata.png?width=100%)

Has **one** registration number and a Flex-ID for the registration.

### Create SIP Trunk in Company Flex tariff

The basis for a Company Flex account is a SIP trunk. Whether a single number or an extension is defined is irrelevant.

Log in to the [Business Service Portal](https://bsp.t-mobile.de/portal/) and **select** your Company Flex contract. Then select the entry **Configure Company Flex** in the **Drop-Down** and click **Next**.

![Business Service Portal](contract.png?width=100%)

In the next menu, select the item **Create Sip Trunk** and create a Sip Trunk for your Company Flex tariff.

![Create new SIP Trunk](create-siptrunk.png?width=100%)

{{< num 2 "Setup" >}}

### Completing the Trunk Template

Add a new Deutsche Telekom SIP trunk under {{< ui-button "Gateways" >}} > {{< ui-button "Trunks" >}} > {{< ui-button "Add" >}}, which directs you the the SIP provider database. Using the filter, you can search directly for *Deutsche Telekom* templates. Select the *Deutsche Telekom Company Flex* template and add your account data / credentials to the template setup wizard.

<br />

![Telekom SIP Trunk Template](choose-template.de.PNG)

<br />

**Fill in the Variables**

|Variable|Description|
|---|---|
|**Name**|Enter a name for the trunk, which will be displayed in the Trunks overview.|
|**Flex Id**|Use the flex id from your registration data.|
|**password**|Enter the corresponding password.|
|**Number of registration**|Registration phone number (Registrierungsrufnummer) as found in the registration data.|
|**number**|Telephony connection base / line number (Stammnummer) excluding extension number block e.g. the number displayed as *XXXXXX* in our example.|
|**Prefix for incoming number**|Any digit which should precede all incoming calls via this trunk. For example entering 0 will mean that all inbound call numbers will be displayed in the call logs on IP Phones as 00172123123 instead of 0172123123. This enables the direct call back from the call history via this trunk.|
|**Number of extension digits**|The digit length of User Extensions - NOT the number of digits in the number block|
|**Extension for central**|Enter the internal extension number to which calls to the first number of your number block (normally 0) should be routed, i.e. to the switchboard / reception / AutoAttendant.|

### Example

![Fill Template](fill-variables.png?width=70%)

After pressing {{< ui-button "Save" >}} the trunk will be added. 

{{< num 3 "Does your Trunk work?" >}}

To make sure that your data has been entered correctly and that the pascom PBX has successfully registered with your provider, click on the {{< ui-button "Gateway" >}} - {{< ui-button "Trunks" >}} on the {{< ui-button "Info Symbol" >}} at your trunk.
Here you can see if the **registration** has worked. (*registered*).

![Trunk registered](registered-template.en.PNG?width=50%)

{{< num 4 "activate pascom Outbound Proxy (only Onsite)" >}}

For onsite telephony, the pascom Outbound Proxy is required for this provider. In the {{< ui-button "Basic Settings" >}} you will find the setting {{< ui-button "Interface" >}} for which the **Outbound Proxy** should be activated.

![Activate pascom Outbound Proxy](setup_op.en.jpg?width=70%)

{{< num 5 "Define your Call rules" >}}

The trunnk is established and successfully registered. As a final step, you define your incoming and outgoing call rules to set the call behavior of your pascom telephone system. 

We explain how to set up call rules in the [Call Rules Tutorial]({{{< ref "trunks/rules">}})
