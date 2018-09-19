---
title: Trunk Templates
description: The pascom phone system includes a SIP provider database including a number of templates for creating SIP, analog and ISDN trunks. These templates are designed to support admins with the trunk setup and automatically add the appropriate call rules.
weight: 10
---

{{< doctype "both"  >}}

{{< description >}}

## Trunk Templates

Add a new trunk under `Gateways` > `Trunks` > `+Add`. This will direct you to the SIP provider database where you can find templates for all supported and certified trunks, plus the manual configuration options.  
Using the filter tool, you can search for your trunk. If your provider is not listed, please use the `Manual SIP` option. Enter the required data in the setup template, which you received from your Telephony Provider.  
As different Trunk types require different variables, please refer to the overview below:

|Variable|Description|
|---|---|
|**Name**|Enter a name for the trunk, which is then displayed in the Trunks overview list |
|**International Prefix**|The characters or numbers needed to dial international numbers - ordinarily *00*.|
|**Country Code**|Enter the country code for the Trunk's originating country. For example, the UK is **44**. SIP trunks allow you to have your phone system server located in one country and register it with a trunk from another country via the internet. Therefore, enter the country code for where the Trunk is located, not the phone system server. |
|**National Prefix**|The numbers which need to be dialled in order to make a call to a national landline (with an area code) - ordinarilly *0*.|
|**Area Code**|Enter the area code (excluding the proceeding 0). For example for London you would enter 20 instead of 020.|
|**Line / Subscriber Number**|The base number of your telephony connection.|
|**Prefix Incoming Number**|Any pre-set number which is attached to incoming calls via this trunk. If, for example, you enter a **0**, then calls to this number may appear in your IP phone's call history as `00172123123` instead of `0172123123`. This allows users to directly callback numbers in the call history using the same trunk over which the call came in.|
|**DID format**|Number format for user extensions - how many digits. (Not the total number in a Number (DID) Block!)|
|**Switchboard Extension**|Enter the internal extension on which calls to the first number in your number block (normally 0) should be routed.|
|**Query Phonebook**|If you set this option to **Yes**, mobydick will try to look up every incoming call in the central phonebook and, if successful, display the caller's name on the telephone screen. This option only applies to IP telephones as the desktop Client always try to find and display corresponding phonebook entries for incoming calls.|
|**Fallback Extension**|Should no call rules exist for an extension, the caller will be routed to this extension.|
|**Outbound Script**|This setting can integrate a script for outbound calls.|
|**Direct Forwarding**|This setting determines how call redirection / forwards which come from external sources and then leave the PBX again should be handled. There are 3 options: <br>*- Keep calls in the system*<br>*-Answer calls and keep them in the system*<br>*-Forward calls via the Provider (Call Deflection)*|

|SIP Trunk Variables|Description|
|---|---|
|**Username**|Depending on your trunk type, the username is used to either <br> * to register your phone system with the **host** (Type: *User*)<br> or is the name with which a host registers with your phone system (Type:*Peer*).<br>If type *Friend* is used, two objects will be created and the username will be used for both the User and the Peer.|
|**Password**|Is the password for the corresponding user - should it be required.|
|**Host**|Enter the IP Address or the host name on which the account must register.|
|**Options**|Options provide you with the ability to add further SIP options (one per line). These options must be recognisable by Asterisk phone systems. An overview of SIP options can be found here: [SIP Configurations - peers and clients](http://www.voip-info.org/wiki/view/Asterisk+config+sip.conf#SIPconfigurationspeersandclients)|
|**Type**|Just like Asterisk, pascom phone systems are operable with multiple types of SIP connections. For more information, please refer to [Asterisk sip types](http://www.voip-info.org/wiki/view/Asterisk+sip+type).|
|**Registation**|Select *Yes* or *No*, depending on whether or not your phone system must register with the host.|
|**Port**|Port *5060* is used per defualt. Should a different port be used, you can enter the port here.|
|**Extension reg.**|This option shares the extension which should be called by the host when receiving an incoming call. This is required should your SIP User Account only provide a single number. Should you be using a SIP trunk connection (e.g. sipgate) then do not enter anything here as the called extension will be transmitted separately.|
|**Ext. f Header**|The default option to determine the destination number using the SIP-INVITE. Set this option to *yes* and the destination number will be read from the SIP-Header instead. This option is often required by SIP trunk providers.|