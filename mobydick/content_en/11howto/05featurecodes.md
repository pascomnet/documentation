---
title: Service Codes Overview
url: /howto/service-codes/
linkde: /howto/funktionscodes/
prev: /howto/harddisk-expansion/
weight: 125
toc: true
draft: true
---

Asterisk Star (*) codes are officially known as **Asterisk vertical service activation codes**, but are also often referred to as Function Codes, Shortcodes or Shortkeys and are used to activate / deactivate certain services directly from a telephones keypad.

## User Logon / Off on a Workstation

|Code|Description|Example|Misc|
|---|---|---|---|
|**\*44**|The current logged on user will be logged off.||This service code can be assigned to an IP Telephone *BLF Key*|
|**\*44{extension}**|Log on with this particular extension. You will be requested to enter the corresponding PIN on the telephone.|Logon extentsion 123 :<br>*\*44123*| This service code can be assigned to an IP Telephone *BLF Key*|
|**\*44{extension}#{PIN}**|Log on with this particular extension. The log on code also contains the required pin, simplifying the process.|Logon extension 123 with PIN 0000:<br>*\*44123#0000*|This service code can be assigned to an IP Telephone *BLF Key*|


## Call Pickup from Different Extensions

|Code|Description|Example|Misc|
|---|---|---|---|
|**\*8{Extension}**|Pickup up a call from a different extension.|Pickup call from ext. 123:<br>*\*8123*|If an extension is monitored with via a BLF Key, it is not necessary to configure an additional service code, as the BLF code already offers Pickup functionality.|


## Call Forwarding

|Code|Description|Example|Misc|
|---|---|---|---|
|**\*70{Extension}**|Activates a permanent call forwarding for this extension. The voice menu will prompt you for the desired destination number on which to forward calls.|Activate call forwarding from extension 123:<br>*\*70123*| This service code can be assigned to an IP Telephone *BLF Key*|
|**\*71{Extension}**|Deactivates an extension's call fowarding|To deactivate call forwarding on extension 123::<br>*\*71123*|This service code can be assigned to an IP Telephone *BLF Key*|
|**\*74{Extension}#{Destination}**|Sets up an extension's call forwarding including the desired destination number.|E.g. to forward calls from extension 123 to extension 333 :<br>*\*74123#333*|This service code can be assigned to an IP Telephone *BLF Key*|

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
|**\*50**|Service (*) code for accessing the prompt management system. Allows you to create new prompts of listen to existing prompts direcly from your phone. Simply follow the voice menu options.|

## Echo Test

|Code|Description|
|---|---|
|**\*80**|Test the voice quality on a telephone.|
