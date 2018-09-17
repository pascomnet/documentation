---
title: HFO Telecom
description: How to correctly config and manage your HFO Telecom SIP Trunk with your pascom phone system
weight: 20
---
{{< doctype "both"  >}}

{{< description >}}

## Overview

HFO-Telekom are a nationwide German VoIP Provider. Further package specifications and tariff information can be found here: [HFO Telecom](http://www.hfo-telecom.de/).

## Your Account

Once your HFO-Telekom trunk has been activated, you will receive a confirmation similar to below:

![Ihr HFO Telecom Account](/hfo-account.png?width=50%)

**Important Info**

+ *Ortsvorwahl (Area Code)*: 0991
+ *Stammnummer (Line Number)*: 9881499
+ *Rufnummernblock (Number Block)*: 0-99, resulting in a 2-digit extension format (externally reachable)
+ *Die Registrierungs-Daten für Ihr Amt (Trunk registration data)*, Constructed from the username and password (Starred out for data protection purposes)

## Setup

Add a new Telekom trunk under `Gateways` > `Trunks` > `Add`, which directs you the the SIP provider database. Using the filter, you can search directly for *HFO* template and add your account data / credentials to the template setup wizard.

|Variable|Description|
|---|---|
|**Name**|Enter a name for the trunk, which will be displayed in the Trunks overview.|
|**Username**|Use the telephony username from your registration data.|
|**Password**|Enter the corresponding password.|
|**Area code**|Enter your area code (Ortskennzahl / Ortsvorwahl) excluding the leading 0, e.g. *991*.|
|**Originating number**|Telephony connection base / line number excluding extension number block e.g. *9881499*.|
|**Prefix for incoming number**|Any digit which should precede all incoming calls via this trunk. For example entering 0 will mean that all inbound call numbers will be displayed in the call logs on IP Phones as 00172123123 instead of 0172123123. This enables the direct call back from the call history via this trunk.|
|**Number of extension digits**|The digit length of User Extensions - NOT the number of digits in the number block|
|**Extension for central**|Enter the internal extension number to which calls to the first number of your number block (normally 0) should be routed, i.e. to the switchboard / reception / AutoAttendant.|

After pressing `Save` the trunk will be added. Doing so will automatically add default call rules, which can then be adapted according to your requirements. For more please read the following article on [Call Rules]({{< ref "trunks/rules">}}).

## Make Changes to the Trunk Configurations

### Update Password

Go to `Gateways` > `Trunks` and select the required trunk and press `Edit`. Under the `Account` tab you can change your password by doubling clicking on the desired field under the `Password` column. Confirm the changes by pressing `Ok` and save and apply the new settings via the `Save` and then finally the apply telephony configurations.

### Adding Additional HFO Account

Should you wish to add an additional HFO account, add the new account in the existing Trunk configuration under the `Accounts` tab. Since the default settings (basic settings) are the same for both accounts, all you need to do is highlight the account and press the `duplicate` button. In the new account row that will appear, you can now adapt the settings by adding the new **Username** and **Password** as well as updating the other fields to match your needs.

Next, the [inbound and outbound call rules]({{< ref "trunks/rules">}}) must be modified. By the outbound rules you will need choose which account should be used per rule. Scroll to the right and under the `Account` column choose the desired account.
