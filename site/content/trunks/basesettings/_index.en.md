---
title: Basic Settings
description: The basic settings of the trunk allows you to further adapt the data from the trunk templates.
weight: 20
---

{{< doctype "both"  >}}

{{< description >}}

## The Basic Data

You can access the basic settings of your Trunk via {{<ui-button "Gateways">}}> {{<ui-button "Trunks">}}> {{<ui-button "Edit">}}. The **Basic data** tab gives you the following setting options.

![Basesettings](basesettings.en.JPG?width=60%)

|Variable|Description|
|---|---|
|**Title**|Enter a name for the trunk, which is then displayed in the Trunks overview list |
|**Prefix Incoming Number**|Any pre-set number which is attached to incoming calls via this trunk. If, for example, you enter a **0**, then calls to this number may appear in your IP phone's call history as `00172123123` instead of `0172123123`. This allows users to directly callback numbers in the call history using the same trunk over which the call came in.|
|**International Prefix**|The characters or numbers needed to dial international numbers - ordinarily *00*.|
|**Country Code**|Enter the country code for the Trunk's originating country. For example, the UK is **44**. SIP trunks allow you to have your phone system server located in one country and register it with a trunk from another country via the internet. Therefore, enter the country code for where the Trunk is located, not the phone system server. |
|**National Prefix**|The numbers which need to be dialled in order to make a call to a national landline (with an area code) - ordinarilly *0*.|
|**Area Code**|Enter the area code (excluding the proceeding 0). For example for London you would enter 20 instead of 020.|
|**Query Phonebook**|If you set this option to **Yes**, mobydick will try to look up every incoming call in the central phonebook and, if successful, display the caller's name on the telephone screen. This option only applies to IP telephones as the desktop Client always try to find and display corresponding phonebook entries for incoming calls.|
|**Fallback Extension**|Should no call rules exist for an extension, the caller will be routed to this extension.|
|**Outbound Script**|This setting can integrate a script for outbound calls.|
|**Direct Forwarding**|This setting determines how call redirection / forwards which come from external sources and then leave the PBX again should be handled. There are 3 options: <br>*- Keep calls in the system*<br>*-Answer calls and keep them in the system*<br>*-Forward calls via the Provider (Call Deflection)*|
|**Enabled**|yes / no - if the trunk is enabled, the pascom server trys to register to the provider servers|
|**Ringtone generation**|This setting determines how the dial tone should be generated via SIP. There are several options here. From SIP ringing to progress generation to completely deactivated.|
