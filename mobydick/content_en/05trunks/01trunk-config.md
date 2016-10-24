---
title: Trunk Configuration
keywords:
description:
url:  /trunks/trunk-configuration/
weight: 11
toc: true
prev: /trunks/
---

## Concept

In order to be able to communicate with the "Outside" world and not only with your internal extensions, you will need to register your phone system with a trunk.
Es gibt folgende Arten von Ämtern:

|Trunk| Description|
|---|---|
|**IP based**|IP based trunks or SIP trunks can be added without requiring any additional preparation.|
|**ISDN**|An ISDN trunk will require a Gateway connection (e. g. from beroNet or Patton|
|IAX|The *InterAsterisk-eXchange* protocol is used to connect two Asterisk servers.|
|Analog| An Analog trunk also requires a Gateway connection (e. g. beroNet or Patton).|

In order enable telephony connections at all, call rules are required. Should you use multiple trunks, each trunk will manage it's own call rules. For each trunk, both inbound and outbound rules are required.

**Call Rules** are a type of "Firewall" and can be used for the following (amongst others): 

* To route calls from externally reachable numbers onto internal extensions (e.g. users and teams),
* Set which number(s) are signalled externally in specific call scenarios,
* Set whether a user is permitted to call certain numbers of not (international, premium, etc),
* and a whole lot more.

## Configuration

### Trunk Templates

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

<!-- |**CLIP Modus**||
 |**CLIR Modus**|| -->

### Call Rules

When adding trunks (accounts), you can add call rules for both inbound and outbound calls.

* The inbound rules are used for incoming calls. Defines how calls via an externally reachable phone number are routed to internal extensions, e.g. which users or which teams should be called.
* Outbound rules determine which CallerID should be signalised / transmitted to the callee when called from a specific extension.

When editing and saving a trunk template, two inbound rules plus one outbound call rule will be automatically added.

|Inbound|Call Rule|
|---|---|
|**Central**|This rule applies to the first number in your DID number block. In most cases, this will be your central switchboard.|
|**Extension**|This rule indicates that each internal extension is externally accessible.|

|Outbound|Call Rule|
|---|---|
|**Standard**|This rule ensures that when making outbound calls, the callers extension number will also be included in phone number signalling.|


#### Inbound Calls

|Setting|Description|
|---|---|
|**Title**|Name of the Rule.|
|**Source**|The caller's phone number. **\*** means this rule applies to all inbound calls|
|**Destination**|The number as dialed by the caller.|
|**Extension**|Displays to which internal extension calls should be routed to.|
|**Language**|Indicates the channel language for the rule - i.e. in which language callers should hear prompts etc.|

<!-- |**CIDName**|| -->
<!-- |**CIDNummer**|| -->



#### Outbound Calls

|Setting|Description|
|---|---|
|**Title**|Name of the Rule.|
|**Show in Client**| As default set to "No". By selecting "Yes", mobydick desktop client users will be able to select this call rule from a dropdown list in the client when making outbound calls. Useful scenarios include using multiple numbers or Private Numbers etc.|
|**In-Prefix**| The prefix dialed to select this call rule e.g "0" or "9". Could also be "*1" for example.|
|**Source**|Defines for which internal extensions the rule applies. **\*** refers to a rule that applies to all internal extensions.|
|**Destination**|The actual dialled number, in this case the number your agents are dialling.|
|**CIDNumber**|The number to transmitted when making outbound calls. To withhold the number, leave it blank.|
|**Out-Prefix**|The number required to dial another system that requires a dial prefix, i.e. in the migration phase of moving to mobydick from another phone system.|
|**Deny**|As default set to "No". Set to "Yes" when you would like top deactive a particular call rule.|
|**PIN**|Set a PIN for using this particular call rule - useful when adding rules to restricting calls to premium or international numbers.|
|**Transmission Capacity**|Supported communications media, e.g. Voice, Video etc.|
|**Account**|Should you have added multiple accounts in your trunk, you can select over which account the outbound call should be routed.|


{{% notice info %}}
Should you have multiple trunks with the same outbound rules, these must be differentiated using different In-prefixes. <br>It is highly recommened to utilise a consist strategy for in-prefixes, as deploying rules with and without in-prefixes configured can lead to problems.
{{% /notice %}}

#### Determining the Phone Number Format

Unfortunately, not all providers transmit (signal) the called phone numbers using the same format. This could be the case when: 

* inbound calls result in the telephone does not ring on the desired extension.
* outbound calls result the desired number not being signalised to the called party.

**Inbound Calls:**  
If you want to test what exactly your provider is transmitting, simply enter * as your rules' source and destination. This will accept all calls. Log on to the Asterisk CLI (see <!-- //fixme --> Accessing mobydick) and initiate an incoming call. You can end the call as soon as see messages appearing on the Asterisk console, including many debug-related messages. Stop the Asterisk CLI by entering `CTRL+C` and scroll upwards. towards the top of the log stream, where you will find the following lines:

    Verbose("SIP/0991270060-00001cda", "1,destination 0991123456789 is determined")
    ...
    Verbose("SIP/0991270060-00001cda", "1,callee number: 0170123456789")

Under *destination* you can determine the number format for destination (called) numbers and *callee number* provides you with the source number format.

**Outbound Calls**  
Should your provider not have provided you with any Signalling Information, you will need to adopt a trial and error approach and test different formats. Possible formats include: with Country Code: 0044; Area Code: 0203; Subscriber number: 12345; Extension: 60):

* +442031234560
* 0442031234560
* 442031234560
* 2031234560
* 02031234560
* 1234560
* 60


#### Editing Call Rules

In many scenarios, it makes sense to to use a placeholder instead of a set phone number when configuring rules. For example, to add a rule that does not apply to all internal extensions, but rather to group extensions to a rule.  
Placeholders are signified by the underscore (_) symbol.

*Example:  
 Should a call rule be required to match all two-digit internal extensions, then the placeholder X is required as follows: _XX*

 The following placeholders are recognisable to pascom phone systems:

|Placeholder|Description|Example|
|---|---|---|
|**X**|matches number from(0-9),| e.g. _3X is used for the numbers 30 to 39.|
|**Z**|matches number from 1 to 9.||
|**N**|matches number from 2 to 9.||
|**.**|last number is followed by any other number.|Example: _0X. matches all numbers starting with 0.|
|**[a-b]**|single-digit numeric interval.| Example: _3[1-5] matches the numbers 31-35.|
|**\***|any number or or character.||
|**a\|b**|Logical OR disjunction.| In this case A or B.|

{{% notice note %}}
**Rule Application** (Bestmatch)<br>
Rules are applied according to the relevancy i.e. according to best match, regardless of list order in the table. If several rules match a call, the rule providing the closest match will be chosen. A rule with a very narrow set of criteria will be preferred over a rather loosely defined rule. The order of the rules, has no effect of how rules are applied making future adjustments easier to undertake.
{{% /notice %}}

Alongside placeholders, it is also possible to use variables of which the most important are:

* **${CALLERID(num)}** the caller's own number
* **${EXTEN}** the original number as dialled by the caller

For example, should the CIDNumber be set to the callers extension number for each outbound call, then you could of course configure a rule for every internal user. However, it is much simpler and quicker to use the  **${CALLERID(num)}** variable:  
For example, if call is coming from the internal extension `11` and the outbound call rule is configured as 020312345${CALLERID(num)}`, then by outbound calls the phone number will be signalised as 02031234511.

#### Truncating Variables

The variable **${EXTEN}** always contains the full number dialled by the caller. If an external call is made to the number 089432111 in an attempt to call the extension 11 from outside of the network, the full number is saved to the variable. If you want to put all incoming calls using the two-digit extension through to the corresponding internal number, you are only interested in using the digits 11 of the string 089432111.

mobydick offers a convenient way to truncate variables. Please see the box below to learn how variables are truncated:

**${VARIABLENNAME:Offset:length}**

* VARIABLENNAME: Name of Variable, e.g. *EXTEN*
* Offset: Specifies the length of the variable string that should be skipped before characters are truncated. This offset can also be negative, in which case truncating will begin from the end. The offset is similar to a cursor being moved over the length of the variable
* Length: How many characters should be removed. If nothing is specified, everything up to the end of the string is removed.

Continuing our example, if we want to remove the string 11 from the number 089432111, ${EXTEN:7:2} can be used. This way, the cursor is set after the seventh position in the number and then truncates two digits, those being 11 in our case. The same can be achieved using ${EXTEN:7}, as the variable is truncated at the offset when no length is specified. The easiest way is to use ${EXTEN:-2}. The cursor will then be positioned two characters from the right end, just before 11 and will remove everything to the right.
