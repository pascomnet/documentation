---
title: Fax Server
description: How to optimally setup the pascom phone system's virtual fax server. 
weight: 10
---

{{< doctype "both"  >}}

{{< description >}}

## Trainingsvideo

{{< youtube zS7hPRGWXPk >}}

## Overview

[Our VoIP phone system software](https://www.pascom.net/en/ "pascom IP phone system software") comes with a fully integrated fax server as standard.
The included fax server is [HylaFax](http://www.hylafax.org/ "pascom Integrated HylaFax Server"), which is connected to the Asterisk telephony server via virtual IAX modems.

The integrated fax server offers a number of functions, which are described in this how-to:

+ Receive faxes via E-mail.
+ Send faxes via the [pascom Client]({{< ref "/clients/desktop-userguide">}}).
+ Send faxes via [Mail-to-Fax]({{< relref "#mail-to-fax">}}) as an e-mail forwarding.
+ Send faxes via [Print-to-Fax]({{< relref "#print-to-fax">}}) using printer commands via virtual printer or without printer commands via virtual printer using the client.

## Fax Server Configuration

Under {{< ui-button "Appliance" >}} > {{< ui-button "Services" >}} > {{< ui-button "Fax Server" >}} you will need to activate and setup the fax server: 

|Setting|Description|
|---|---|
|Number of fax lines|Defines the number of virtual modems and therefore the maximum number of parallel fax jobs.|
|Dedicated lines for inbound|Defines the number of fax lines reserved for inbound faxes.|
|Country Code|Enter the international country code for your country excluding the leading zeros, e.g. 44 for the United Kingdom.|
|Prefix without leading 0|Enter your area code without the leading 0, e.g. 203 for London.|
|Originating number|Enter your fixed line originating number, i.e. phone number without international or area codes.|
|Mail to Fax|Determines whether the fax to be sent should be the E-mail content or attachment.*Default: Deactivated*|
|Fax document storage / days|Enter the maximum time in days that a fax document should  be stored. The default value  is  30 days.|
|Number of Send attempts|Enter the maximum number of send attempts should, for example, the intended recipient temporarily not be available.|

### Overview of Sent / Received Faxes

Under {{< ui-button "Information" >}} > {{< ui-button "Fax Server" >}} it is possible to call up an overview of both Sent and Received faxes. It is also possible to download individual fax documents from the list of received faxes. 

Under {{< ui-button "Apply" >}} > {{< ui-button "Clean up fax server" >}} it is possible to configure and automate the removal of older faxes. The default value is 30 days. That means that during the clean up process, all faxes older than 30 days will be deleted. You can automate the process via the {{< ui-button "Automate" >}} button which will allow you to setup a Cron Job to automate future fax server clean up tasks. 

## Add Virtual Fax Devices

Virtual fax devices can be added for both a [User]({{< ref "/user/user">}}) and / or a Team.

#### Virtual User Fax Device

Under {{< ui-button "Users" >}} > {{< ui-button "User list" >}} select the required user and press {{< ui-button "Edit" >}}. Under the {{< ui-button "Fax Device" >}} tab, it is possible to add a virtual fax device for existing users. Simply select the *Configure personal fax* tick box:

|Settings|Description|
|---|---|
|E-mail|Enter the user's e-mail address. The user will receive confirmations for all sent faxes and depending on the configuration also for all received faxes.|
|Fax extension|Enter the user's fax extension number. Please refer to the following [HowTo: Extensions]({{< ref "/howto/extensions">}}).|
|Outgoing fax ID|Optional tool for setting an outbound fax ID. |
|Format|Determines in which format a fax should be sent. Options include: <br> * PDF<br> * TIF<br> * File<br> * INLINEGIF|

#### Virtual Team Fax Device

Under {{< ui-button "Users" >}} > {{< ui-button "Teams" >}} select the required Team and press {{< ui-button "Edit" >}}. Under the {{< ui-button "Fax Device" >}} tab, it is possible to add a virtual fax device for existing Teams. Simply select the *Configure team fax* tick box:

|Settings|Description|
|---|---|
|E-mail|Enter the team's e-mail address. The team will receive confirmations for all sent faxes and depending on the configuration also for all received faxes.|
|Fax extension|Enter the team's fax extension number. Please refer to the following [HowTo: Extensions]({{< ref "/howto/extensions">}}).|
|Outgoing fax ID|Optional tool for setting an outbound fax ID. |
|Format|Determines in which format a fax should be sent. Options include: <br> * PDF<br> * TIF<br> * File<br> * INLINEGIF|

## Mail-to-Fax

#### Preparation

Setup your mail server so that all e-mails are forwarded to your pascom server via the domain *.fax* per SMTP.

On your mail server, setup an inbox which can be retrieved via either POP3 or IMAP by the pascom phone system.

*Example:*         
*fax@mydomain.com*

### Configuration

In order to be able to use Mail-to-Fax, you will need to setup your virtual fax server using the following pascom phone system admin UI menu options: {{< ui-button "Appliance" >}} > {{< ui-button "Services" >}} > {{< ui-button "Fax Server" >}}.

Under {{< ui-button "Mail to Fax" >}} you can choose, whether the content of the e-mail or only the attachment should  be faxed. 
 
Regardless of which option you choose, further configuration fields regarding your pre-prepared e-mail inbox will appear. 

|Setting|Description|
|---|---|
|Mail Server|Enter the mail server on which the prepared inbox is located.|
|Mail Protocol|Enter whether the E-mails should be retrieved using POP3 or IMAP (*Default setting*).|
|Retrieval interval|*Only for POP3 accounts*: Enter the time interval in seconds at which e-mails should be retreived.|
|Remove from mailbox|Enter whether the e-mails should be removed from the inbox once retrieved or whether they should continue to be saved. *Default: Yes*|
|Mail Username|Enter the username for your pre-prepared inbox|
|Mail Password|Enter the login password for your preprepared inbox|
|Ignore invalid certificates|Enter whether or not your pascom phone system should ignore invalid certificates. *Default: No*|

Check to make sure that your pascom phone system can correctly connect to your mail server inbox. 

### Sending Faxes

Once the setup has been completed, to send a fax simply send an e-mail with the following construction:

|Field|Example|Description|
|----|--------|------------|
|To|fax@mydomain.com|Enter the e-mail address of your pre-prepared inbox.|
|Subject|00991123456999 |Enter the to be used trunk prefix + the fax number of the recipient.|
|Attachment| |This is the actual fax as PDF or TIF file.|

Depending on your fax server configuration choices, the contents of the e-mail will also be sent in the fax.

#### Customisations

{{% notice warning %}}
The following customisations are only possible if you are using an **Onsite pascom telephone system**!
{{% /notice %}}

Currently, it is only partially possible to customise the behaviour of the Mail-to-Fax gateway and must be done directly in the configuration file. To this end, you will need to log into your pascom phone system via SSH and will require Root permissions.

Without any customisation, the default setting is to send out a plain-text e-mail whenever there is a change in a fax job (busy, failed, successful, etc.). 

This setting can be changed to use an alternative format. As such, this generates an HTML e-mail with an embedded first page and PDF attachment. The fax itself will be sent as an attachment in PDF format. This format is the same as the one used when a fax is received by a virtual fax machine configured to use the format="inlinegif" option.

* open the file /etc/hylafax/FaxNotify in a text editor
* remove the "#" comment in the line INLINE=true
* restart in the fax system using the web interface or the  _ /etc/init.d/hylafax restart _ command

{{% notice note %}}
Changes made to the format of notification e-mails will also affect the format of print-to-fax jobs.
 {{% /notice %}}

## Print-to-Fax

The Print-to-Fax Gateway can be used to automatically send documents from, for example, ERP systems as well as for sending documents manually using the desktop client.

{{% notice info %}}
Print-to-Fax is not supported by cloudstack and pascom 18 solutions.
If you are using an older pascom self-hosted version, the Print-to-Fax setup guide can be found in our [Old documentation](https://www.pascom.net/doc-old/en/modules/fax-server/#sending-faxes-with-the-print-to-fax-gateway).
{{% /notice %}}
