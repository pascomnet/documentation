---
title: M-net SIP-Trunk
description: How to correctly config and manage your M-net SIP trunk with your pascom phone system
weight: 30
---

{{< doctype "both"  >}}

{{< description >}}

## Information

Information regarding features and tariffs can be found [here](https://www.m-net.de/sip-trunk/).

## Overview

After purchasing and activating your M-net SIP trunk, you will receive a letter (in German) containing your account details. This document contains important information regarding your Telephony connection:

![Your m-net access details](mnet-account.de.png?width=60%)

**Relevant Information**

+ *Ortsvorwahl*: Your Area Code e.g. 089
+ *Stammnummer*: Your orginating number - in our example XXXXXX (displayed this way for data protection)
+ *Rufnummernblock*: Number block e.g. 0-29, resulting in 2 digit extensions
+ *Registrierungs-Daten für Ihr Amt*, Registration data for your trunk containing your SIP user name and SIP password

## Setup

Under `Gateways` > `Trunks` > `Add`, add a new M-net trunk. This will take you the pascom SIP Trunk Provider database. Use the filter to search for M-net and select the *M-net SIP-Trunk* template and complete it using the received account details.

|Variable|Description|
|---|---|
|**Name**|Enter a trunk name, which will be displayed in the Trunks list overview.|
|**Username**|Use the SIP Username (SIP-Benutzernamen) from your access credentials.|
|**Password**|Enter the corresponding SIP password.|
|**Area Code**|Enter the area code (Ortskennzahl or Ortsvorwahl) without the leading 0. In our example *89*.|
|**Originating Number**|Base number for the telephony connection without any extensions. In our example, marked as *XXXXXXXX*.|
|**Prefix incoming number**|Any number which should proceed inbound numbers via this trunk. Should you set this to 0, then inbound calls will be displayed in the call history as 00172123123 instead of 0172123123. This enables the direct call back over this trunk from the call history.|
|**Number of extension digits**|The digit length of User Extensions - NOT the number of digits in the number block|
|**Extension for central**|Enter the internal extension number to which calls to the first number of your number block (normally 0) should be routed, i.e. to the switchboard / reception / AutoAttendant.|

<!--FIXME satz zu zentrale verwirrend  -->

After pressing `Save` the trunk will be added. Doing so will automatically add default call rules, which can then be adapted according to your requirements. For more please read the following article on [Call Rules]({{< ref "/trunks/rules">}}).

## Making Changes to the Trunk

### Change Password

Go to `Gateways` > `Trunks` and select the required trunk and press `Edit`. Under the `Account` tab you can change your password by doubling clicking on the desired field under the `Password` column. Confirm the changes by pressing `Ok` and save and apply the new settings via the `Save` and then finally the apply telephony configurations.

### Add Additional M-net SIP Accounts

Should you wish to expand your M-net SIP trunk connection with additional accounts, please add the new accounts under the `Accounts` tab within the current Trunk template. As the settings are in principle the same, you can use the already added account. Simply click and mark the account and then click the `Duplicate` button. 
In the newly appeared account line, it is possible to update the **Username** and **password** fields and other fields according to your requirements.

Next, the [inbound and outbound call rules]({{< ref "/trunks/rules">}}) must be modified. By the outbound rules you will need choose which account should be used per rule. Scroll to the right and under the `Account` column choose the desired account.


[inbound and outbound call rules]({{< ref "/trunks/rules">}})