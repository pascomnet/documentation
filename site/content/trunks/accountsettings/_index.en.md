---
title: Account Settings
description: In the account settings, you specify the data with which the pascom should register to the provider's servers. Additional attributes can also be set here.
weight: 30
---

{{< doctype "both"  >}}

{{< description >}}

## The Account Settings

You can access the account data of your Trunk via {{<ui-button "Gateways">}}> {{<ui-button "Trunks">}}> {{<ui-button "Edit">}}. In the **Account** tab you will find the records of your registrar. You can change these as you wish.

### Extension register

![Extension register](extension_reg.en.JPG?width=15%)



|Variables|Description|
|---|---|
|**Extension reg.**|This option shares the extension which should be called by the host when receiving an incoming call. This is required should your SIP User Account only provide a single number. Should you be using a SIP trunk connection (e.g. sipgate) then do not enter anything here as the called extension will be transmitted separately.|

{{% notice tip %}}
If you use a Trunk that contains several individual numbers, you have to create a separate data record for each number under {{<ui-button "Add">}} so that each number can register with the provider.
{{% /notice %}}

### Username

![Username](username.en.JPG?width=15%)

|Variables|Description|
|---|---|
|**Username**|Depending on your trunk type, the username is used to either <br> * to register your phone system with the **host** (Type: *User*)<br> or is the name with which a host registers with your phone system (Type:*Peer*).<br>If type *Friend* is used, two objects will be created and the username will be used for both the User and the Peer.|

### Password

![Password](password.en.JPG?width=10%)

|Variables|Description|
|---|---|
|**Password**|Is the password for the corresponding user - should it be required.|

### Host

![Host](host.en.JPG?width=15%)

|Variables|Description|
|---|---|
|**Host**|Enter the IP Address or the host name on which the account must register.|

### Options

![Options](options.en.JPG?width=20%)

|Variables|Description|
|---|---|
|**Options**|Options provide you with the ability to add further SIP options (one per line). These options must be recognisable by Asterisk phone systems.|

{{% notice tip %}}
An overview of SIP options can be found here: [SIP Configurations - peers and clients](http://www.voip-info.org/wiki/view/Asterisk+config+sip.conf#SIPconfigurationspeersandclients)
{{% /notice %}}

### Registration

![Register](register.en.JPG?width=10%)

|Variables|Description|
|---|---|
|**Registation**|Select *Yes* or *No*, depending on whether or not your phone system must register with the host.|

### Port

![Port](port.en.JPG?width=7%)

|Variables|Description|
|---|---|
|**Port**|Port *5060* is used per defualt. Should a different port be used, you can enter the port here.|

### Number Determination

![Number Determination](numberdetermination.en.JPG?width=15%)

|Variables|Description|
|---|---|
|**Number Determination**|The default option to determine the destination number using the SIP-INVITE. Set this option to *yes* and the destination number will be read from the SIP-Header instead. This option is often required by SIP trunk providers.|

### Number Presentation

![Number Presentation](numberpresentation.en.JPG?width=15%)

|Variables|Description|
|---|---|
|**Number Presentation**|Calling Line Identification (CLIP) is a feature that enables the transmission of phone numbers for outgoing calls. By default, the automatic Trunk functions take effect, so that the trunk can automatically transmit call numbers. Possible settings: <br> * *AUTO*<br> * *FROM*<br> * *PPI*<br> * *PAI*|

### Number Restriction

![Number Restriction](numberrestriction.en.JPG?width=15%)

|Variables|Description|
|---|---|
|**Number Restriction**|Calling Line Identification Restriction (CLIR) is a feature that enables call number restriction for outgoing calls. The automatic Trunk function comes into play here as standard, so that the trunk can automatically restrict the number. Possible settings: <br>* *AUTO*<br> * *FROM*<br> * *Privacy-ID*|