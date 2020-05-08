---
title: Function / Service Codes
description: HOverview of pascom IP PBX Function Codes / Service Codes.
weight: 125
---

{{< doctype "both" >}}
 
{{< description >}}

## Login / out of a Terminal

|Code|Description|Example|Misc|
|---|---|---|---|
|**\*44**|The current logged on user will be logged off.||This service code can be assigned to an IP Telephone *BLF Key*|
|**\*44{Extension}**|Log on with this particular extension. You will be requested to enter the corresponding PIN on the telephone.|Logon extension 123 :<br>*\*44123*| This service code can be assigned to an IP Telephone *BLF Key*|
|**\*44{extension}#{PIN}**|Log on with this particular extension. The log on code also contains the required pin, simplifying the process.|Logon extension 123 with PIN 0000:<br>*\*44123#0000*|This service code can be assigned to an IP Telephone *BLF Key*|


## Call Pickup from Different Extensions

|Code|Description|Example|Misc|
|---|---|---|---|
|**\*8{Extension}**|Pickup up a call from a different extension.|Pickup call from ext. 123:<br>*\*8123*|If an extension is monitored with via a BLF Key, it is not necessary to configure an additional service code, as the BLF code already offers Pickup functionality.|


## Call Forwarding

|Code|Description|Example|Misc|
|---|---|---|---|
|**\*70{Extension}**|Activates a permanent call forwarding for this extension. The voice menu will prompt you for the desired destination number on which to forward calls.|Activate call forwarding from extension 123:<br>*\*70123*| This service code can be assigned to an IP Telephone *BLF Key*|
|**\*71{Extension}**|Deactivates an extension's call forwarding|To deactivate call forwarding on extension 123::<br>*\*71123*|This service code can be assigned to an IP Telephone *BLF Key*|
|**\*74{Extension}#{Destination}**|Sets up an extension's call forwarding including the desired destination number.|E.g. to forward calls from extension 123 to extension 333 :<br>*\*74123#333*||

## Voicemail Box

|Code|Description|Example|Misc|
|---|---|---|---|
|**\*100**|Voicemail box setup: Calls the voicemail box settings menu, allowing you to manage numerous mailbox settings|||
|**\*101**|Listen to messages in another mailbox|||
|**\*102**|Set call forwarding to your own voicemail box|||
|**\*103**|Forwarding on to the called party's voicemail box|||
|**\*104**|Listen to a monitored voicemail box|||

## Prompt System

|Code|Description|
|---|---|
|**\*50**|Service (*) code for accessing the prompt management system. Allows you to create new prompts of listen to existing prompts directly from your phone. Simply follow the voice menu options.|

## Echo Test

|Code|Description|
|---|---|
|**\*80**|Test the voice quality on a telephone.|

## Team Actions

|Code|Description|Example|Misc|
|---|---|---|---|
|**\*99#{extension}**|Log agents in or out of a team of which they are a member.|Log in / out the agent with ext. 123:<br>*\*99#123*|Can also be added as a *BLF* key on an desktop IP phone.|
|**\*99#{extension}#{pausecode}**|Pause / unpause an agent using pause codes|To pause / unpause an agent with ext. 123 and pause code 10:<br>*\*99#123#10*|Can also be added as a *BLF*key on an desktop IP phone.|
|**\*99{team}#{extension}**|Log an agent in or out of a particular team.|E.g. Log agent with ext 123 in or out of team 1100:<br>*\*991100#123*|Can also be added as a *BLF*key on an desktop IP phone.|
|**\*99{team}#{extension}#{pausecode}**|Pause / unpause an agent in a certain team.|To pause / unpause an agent with ext. 123 from the team 1100 using pause code 10:<br>*\*99110#123#10*|Can also be added as a *BLF* key on an IP desktop phone.|

{{% notice info %}}
Function Codes can be found in the Web UI under {{< ui-button "Appliance" >}} > {{< ui-button "System Settings" >}} > `asterisk.dialplan.global`. If needed the codes can also be modified here.

Should you use Function Codes, please check the **asterisk.dialplan.alias.global** parameter, as it should have the user extension number length set as the value. Per default is the value set to 3.<br>
We recommend against configuring user extensions with varying lengths as for example in the above scenarios, certain function codes will no longer function correctly.
{{% /notice %}}
