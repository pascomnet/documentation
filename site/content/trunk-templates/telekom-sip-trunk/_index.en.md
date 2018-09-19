---
title: Deutsche Telekom SIP Trunk
description: How to correctly config and manage your M-net SIP trunk with your pascom phone system
weight: 10
---

{{< doctype "both"  >}}

{{< description >}}

## Overview

Deutsche Telekom package specifications and tariff information can be found [here](https://geschaeftskunden.telekom.de/startseite/festnetz-internet/tarife/333506/deutschlandlan-sip-trunk.html). pascom phone systems (classic and cloud) support only Deutsche Telekom business tariffs.  

{{% notice warning %}}
pascom phone systems only supports direct SIP account registration in combination with the Deutsche Telekom [recommended Lancom Router](https://geschaeftskunden.telekom.de/startseite/festnetz-internet/tarife/354892/paket-zum-anschluss-einer-ip-telefonanlage.html) when connecting an IP PBX. Alternatively, it is possible to perform the [registration on the router]({{< relref "#setup-via-fritz-box">}}) .<br/><br/>
Should you use your own router, this must in principle comply with the criteria as the devices recommended by Deutsche Telekom.  However, in such as scenario, pascom are not able to offer any support for the configuration.
{{% /notice %}}

## Ihr Account

Once your Deutsche Telekom DeutschlandLAN SIP-Trunk has been activated, you will receive a letter (in German) containing your account data similar to below. 

**Deutsche Telekom Multipoint Connection**

![Your Deutsche Telekom Credentials point to multipoint connection](telekom-access-data-dsl.de.png?width=70%)

Has multiple fixed line numbers (Landline Nos.).

**Important Information**

*Rufnummern (Phone Number)*: Is needed when setting up the trunk

The Zugangsdaten (Login info) refer to the internet access credentials.
This is not needed when setting up a Deutsche Telekom trunk.

**Telekom SIP-Trunk**

![Your Deutsche Telekom credentials for a SIP trunk with number block](telekom-access-data.de.png?width=70%)

Has **one** registration number and a number block.

+ *Ortsvorwahl (Area Code)*: 0991
+ *Stammnummer (Line Number) *: XXXXXX (XXXXXX is displayed due to data protection purposes)
+ *Rufnummernblock (Number Block)*: 0-99, resulting in a 2-digit extension format (externally reachable)
+ *Registrierungs-Daten für Ihr Amt (Trunk registration data)*, Constructed from the telephony username and telephony password.
+ *Registrierungsrufnummer (Registration phone number)*: in this example +49991XXXXXX0

## Setup

If you use a Fritz!Box in your network setup, you can setup your Deutsche Telekom connection there. Click [here]({{< relref "#setup-via-fritz-box">}}) for our setup guide.
If you do not use a Fritz!Box, then please setup your Deutsche Telekom trunk directly within your pascom phone system and *not on your router*.

### Setup in pascom 

#### Router preparation

Before beginning with the Deutsche Telekom trunk setup within your pascom phone system, please make sure that the following settings have been configured on your router:

1. SIP-ALG must be deactivated.
2. The Deutsche Telekom trunk must no be setup on the router or must be deactivated.

Having checked the above, you can continue with adding the Trunk via the pascom phone system admin Web UI.

**Example Setup:**

The following screenshots were created using a *LANCOM R883VAW (over ISDN)* with the Firmware 10.00.0170.

The SIP-ALG settings are found on the LANCOM router Web UI under `Configuration` > `SIP-ALG` > `General`.
Uncheck the "SIP-ALG activated" box.

![LANCOM SIP-ALG Settings](/Lancom_SIP_Alg.png?width=70%)

The trunk configuration is found within the LANCOM router web UI under `Configuration` > `Voice Call Manager` > `Lines` > `SIP Lines`.
Makes sure that these settings are either empty or deactivated.

![LANCOM SIP-Lines](/Lancom_SIP_Leitungen.png?width=70%)

#### Completing the Trunk Template

Add a new Deutsche Telekom trunk under `Gateways` > `Trunks` > `Add`, which directs you the the SIP provider database. Using the filter, you can search directly for *Deutsche Telekom* templates. Select the *Deutsche Telekom SIP Trunk* template and add your account data / credentials to the template setup wizard.

|Variable|Description|
|---|---|
|**Name**|Enter a name for the trunk, which will be displayed in the Trunks overview.|
|**Telephony username**|Use the telephony username from your registration data.|
|**Telephony password**|Enter the corresponding password.|
|**Number of registration**|Registration phone number (Registrierungsrufnummer) as found in the registration data.|
|**Area code**|Enter your area code (Ortskennzahl / Ortsvorwahl) excluding the leading 0, e.g. *991*.|
|**Originating number**|Telephony connection base / line number (Stammnummer) excluding extension number block e.g. the number displayed as *XXXXXX* in our example.|
|**Prefix for incoming number**|Any digit which should precede all incoming calls via this trunk. For example entering 0 will mean that all inbound call numbers will be displayed in the call logs on IP Phones as 00172123123 instead of 0172123123. This enables the direct call back from the call history via this trunk.|
|**Number of extension digits**|The digit length of User Extensions - NOT the number of digits in the number block|
|**Extension for central**|Enter the internal extension number to which calls to the first number of your number block (normally 0) should be routed, i.e. to the switchboard / reception / AutoAttendant.|


After pressing `Save` the trunk will be added. Doing so will automatically add default call rules, which can then be adapted according to your requirements. For more please read the following article on [Call Rules]({{< ref "trunks/rules">}}).

#### Update Password

Go to `Gateways` > `Trunks` and select the required trunk and press `Edit`. Under the `Account` tab you can change your password by doubling clicking on the desired field under the `Password` column. Confirm the changes by pressing `Ok` and save and apply the new settings via the `Save` and then finally the apply telephony configurations.

### Adding Additional Deutsche Telekom SIP Accounts

Should you wish to extend your Deutsche Telekom DeutschlandLAN SIP-Trunk connection by adding an additional account, add the new account in the existing Trunk configuration under the `Accounts` tab. Since the default settings (basic settings) are the same for both accounts, all you need to do is highlight the account and press the `duplicate` button. In the new account row that will appear, you can now adapt the settings by adding the new **Username** (i.e. *Registrierungsrufnummer*), the **password** and the **Auth_User** (i.e. the *telefonie-Benutzernamen*) as well as updating the other fields to match your needs.

Next, the [inbound and outbound call rules]({{< ref "/trunks/rules">}}) must be modified. By the outbound rules you will need choose which account should be used per rule. Scroll to the right and under the `Account` column choose the desired account.

### Setup via Fritz!Box

In the following scenarios, we recommend registering your Deutsche Telekom trunk via a Fritz!Box:

* A Deutsche Telekom trunk will be registered that is not a business tariff.
* The SIP Account registration to the provider occurs via a VLAN, in which the pascom phone system cannot access.

{{% notice warning %}}
When using a Fritz!Box, the connection is limited to two voice channels due to the Fritz!Box firmware.
{{% /notice %}}

![Fritz!Box](fritzbox.en.png?width=70%)

The following guide has been created using a *Fritz!Box Fon WLAN 7390* with Firmware version 06.83.

#### Preparing the Fritz!Box

Firstly, you will need to setup the telekom phone numbers on the Fritz!Box in order to ensure that the Fritz!Box can correctly connect to Deutsche Deutsche Telekom.

1. Log in to your Fritz!Box Web UI.
2. Under `Telephony` > `Own Numbers` clcik on `New Number`.
3. Select *Deutsche Telekom* as your `Telephony Provider`.
4. Enter your *Area Code* and *Line Number* as stated in your account activation letter (see above).
5. Enter `Further phone numbers` and repeat the process from step 4 with all numbers from your account info letter.
6. Confirm the settings in the current and all following screens by clicking `Next` and `Apply`.

The Fritz!Box will immediately try to establish a connection with Deutsche Deutsche Telekom using the entered credentials.

![Fritz!Box](/fritzbox_telekom_rufnummern.png?width=80%)

After the Deutsche Telekom numbers have been successfully setup, you will need to setup some accounts on your Fritz!Box with which your pascom PBX can register with the Fritz!Box.

1. In the Fritz!Box web UI  under `Telephony` > `Telephony Devices` click on `Add New Device`.
2. Select *Telephone (with or without Voicemail)*.
3. In the next step, select *LAN/WLAN (IP Telephone)* and enter a name for the device.
4. Finally enter a *Username* and *Password*. Make a note of these as they are required by the pascom PBX.
5. Select the phone number(s) over which incoming calls to your account should be routed.
6. Now select the number of outbound calls. Select the number which you selected for incoming calls in the previous step.
7. Apply the settings. If this the first account you have added in this session, you will be required to confirm that you are permitted to complete the process. Simply go to you Fritz!Box and press any key.
8. If you would like to use all the numbers of your Deutsche Telekom account, then repeat steps 1 -7 for each number. 
9. Within the Telephony Device Overview you should now see the internal numbers pertaining to the account (e.g. \**620). You will need this extension for the registration with your pascom PBX.

![Fritz!Box](/fritzbox_telekom_telefoniegeraete.png?width=80%)

#### pascom Fritz!Box Trunk Setup

**Complete the Trunk Template**

Add a new Frtz!Box trunk under `Gateways` > `Trunks` > `Add`, which directs you the the SIP provider database. Using the filter, you can search directly for *fritz* templates and select this template. Complete the template using the account data you have just set up on your Fritz!Box.

![Fritz!Box Account](/fritzbox_account_telekom.png?width=80%)

Using the template, it is possible to add the first 3 accounts.

|Variable|Description|
|---|---|
|**Name**|Enter a name for the trunk, which will be displayed in the Trunks overview.|
|**Host**|Enter the IP address / Domain name for your Fritz!Box.|
|**Username line X**|The account username which you configured on your Fritz!Box.|
|**Password line X**|The corresponding password.|
|**Extension for line X**|The extension belonging to the line / phone number which your Fritz!Box assigned to this line (phone number).|
|**International codel**|Enter the international code (e.g. 00)|
|**National dialling code**|Enter the national code (e.g. 0).|
|**Country code**|Enter the country code for your account. e.g. 49 for Germany, 44 for the UK.|
|**Area code**|Enter your area code excluding the leading 0 e. g. 89 for Munich or 203 for London|
|**Prefix for incoming number**|Any digit that precedes incoming phone calls via this trunk. If you enter 0 here for example, then the incoming call number will be display as 00172123123 on your IP phone's display instead of 0172123123. This allows you to call back the number using the same trunk / account phone number.|

After `Saving` the trunk will be added. If you have added further accounts to your Fritz!Box, you can add these under the `Accounts` tab. Simply select an entry and click on `Duplicate`. When duplicating an entry, it is sufficient to only update the *Username*, *Password* and *Extension reg.* columns.

**Modify Call Rules**

The call rules for the first 3 accounts will be automatically added. All further account call rules must be added manually. These can be configured according to your requirements. Further to this please read the article [Call Rules]({{< ref "/trunks/rules">}}).

The templates assumes that the extensions on the Fritz!Box match the extensions added on your pascom PBX. Should this not be the case, your will need to modify the call rules under `Gateways` > `Trunks` > select trunk >`Edit` and under the `Inbound Calls` and `Outbound Calls` tabs.

|Inbound Calls||
|---|---|
|Destination|The extension as shown on the Fritz!Box (e. g. 620, 621...)|
|Extension|The extension on which incoming calls should be routed. This can be a user, team etc.|

|Outbound Calls||
|---|---|
|Source|The user extension which is initiating the call|
|CIDNumber|This is the extension as assigned by the Fritz!Box (e. g. 620, 621...).|
|Account|An account must be selected with which the CIDNumber on the Fritz!Box is assigned to.|
