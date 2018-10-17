---
title: Fax Server
description: How to optimally setup the pascom phone system's virtual fax server. 
weight: 10
---

{{< doctype "both"  >}}

{{< description >}}

## Overview

[Our VoIP phone system software](https://www.pascom.net/en/ "pascom IP phone system software") comes with a fully integrated fax server as standard.
The included fax server is [HylaFax](http://www.hylafax.org/ "pascom Integrated HylaFax Server"), which is connected to the Asterisk telephony server via virtual IAX modems.

The integrated fax server offers a number of functions, which are described in this how-to:

+ Receive faxes via E-mail.
+ Send faxes via the [pascom Client]({{< ref "/clients/desktop-userguide">}}).
+ Send faxes via [Mail-to-Fax]({{< relref "#mail-to-fax">}}) as an e-mail forwarding.
+ Send faxes via [Print-to-Fax]({{< relref "#print-to-fax">}}) using printer commands via virtual printer or without printer commands via virtual printer using the client.

## Fax Server Configuration

Under {{< ui-button "Services" >}} > {{< ui-button "Fax Server" >}} you will need to activate and setup the fax server: 

|Setting|Description|
|---|---|
|Number of fax lines|Defines the number of virtual modems and therefore the maximum number of parallel fax jobs.|
|Dedicated lines for inbound|Defines the nummber of fax lines reserved for inbound faxes.|
|Country Code|Enter the international country code for your country excluding the leading zeros, e.g. 44 for the United Kingdom.|
|Prefix without leading 0|Enter your area code without the leading 0, e.g. 203 for London.|
|Originating number|Enter your fixed line originating number, i.e. phone number without international or area codes.|
|Fax domain|The fax domain is required for [Mail-to-Fax]({{< relref "#mail-to-fax">}}), e.g. "fax".|
|E-mail Address Format|In which e-mail address format "Mail-to-Fax" should be sent.|
|Mail to Fax|Determines whether the fax to be sent should be the E-mail content or attachment.|
|Print to Fax|Fax sending:<br> * Only Client.<br> * Only control statement in the document.<br> * Control statement and then the client.|
|Fax document storage / days|Enter the maximumm time in days that a fax document should  be stored. The default value  is  30 days.|
|Number of Send attempts|Enter the maximum number of send attempts should for example the intended recipient temporarily not be available.|

### Overview of Sent / Received Faxes

Under {{< ui-button "Information" >}} > {{< ui-button "Fax Server" >}} it is possible to call up an overview of both Sent and Received faxes. It is also possible to download individual fax documents from the list of received faxes. 

Under {{< ui-button "Apply" >}} > {{< ui-button "Clean up fax server" >}} it is possible to configure and automate the removal of older faxes. The default value is 30 days. That means that during the clean up process, all faxes older than 30 days will be deleted. You can automate the process via the {{< ui-button "Automate" >}} button which will allow you to setup a Cron Job to automate future fax server clean up tasks. 

## Add Virtual Fax Devices

Virtual fax devices can be added for both a [User]({{< ref "/user/user">}}) and / or a Team.

#### Virtual User Fax Device

Under {{< ui-button "Users" >}} > {{< ui-button "User list" >}} selectt the required user and press {{< ui-button "Edit" >}}. Under the {{< ui-button "Fax Device" >}} tab, it is possible to add a virtual fax device for existing users. Simply select the *Configure personal fax* tick box:

|Settings|Description|
|---|---|
|E-mail|Enter the user's e-mail address. The user will receive confirmations for all sent faxes and depending on the configuration also for all received faxes.|
|Extension|Enter the user's fax extension number. Please refer to the following [HowTo: Extensions]({{< ref "/howto/extensions">}}).|
|Outgoing fax ID|Optional tool for setting an outbound fax ID. |
|Format|Determines in which format a fax should be sent. Options include: <br> * PDF<br> * TIF<br> * File<br> * INLINEGIF|

#### Virtual Team Fax Device

Under {{< ui-button "Users" >}} > {{< ui-button "Teams" >}} selectt the required Team and press {{< ui-button "Edit" >}}. Under the {{< ui-button "Fax Device" >}} tab, it is possible to add a virtual fax device for existing Teams. Simply select the *Configure team fax* tick box:

|Settings|Description|
|---|---|
|E-mail|Enter the team's e-mail address. The team will receive confirmations for all sent faxes and depending on the configuration also for all received faxes.|
|Extension|Enter the team's fax extension number. Please refer to the following [HowTo: Extensions]({{< ref "/howto/extensions">}}).|
|Outgoing fax ID|Optional tool for setting an outbound fax ID. |
|Format|Determines in which format a fax should be sent. Options include: <br> * PDF<br> * TIF<br> * File<br> * INLINEGIF|

## Mail-to-Fax

{{% notice info %}}
Mail-to-Fax is not supported in cloudstack solutions.
{{% /notice %}}

#### Preparation

Setup your mail server so that all e-mails are forward to your pascom server via the domain *.fax* per SMTP.

#### Send Fax

In order to send a fax after the configuration is done, simply send an E-mail using the following structure (the structure of the e-mail can be configured following our [Fax Server Configuration]({{< relref "#fax-server-konfigurieren">}}) guide):

|Field|Example|Description|
|----|--------|------------|
|To|recipient@009912700619.fax|The number is evaluated and the part to the left of the "@" sign is used as the recipient on the cover page of a fax. (the default is to disable cover pages for fax).|
|Subject and body| |Converted to PostScript and used as the first page of the fax.|
|Attachment| |This is the actual fax as PDF or TIF file.|

#### Customisations

Currently, it is only partially possible to customise the behaviour of the Mail-to-Fax gateway and must be done directly in the configuration file. To this end, you will need to log into your pascom phone system via SSH and will require Root permissions.

Without any customisation, the default setting is to send out a plain-text e-mail whenever there is a change in a fax job (busy, failed, successful, etc.). 

This setting can be changed to use an alternative format. As such, this generate an HTML e-mail with an embedded first page and PDF attachment. The fax itself will be sent as an attachment in PDF format. This format is the same as the one used when a fax is received by a virtual fax machine configured to use the format="inlinegif" option.

* open the file /etc/hylafax/FaxNotify in a text editor
* remove the "#" comment in the line INLINE=true
* restart in the fax system using the web interface or the  _ /etc/init.d/hylafax restart _ command

{{% notice tip %}}
Changes made to the format of notification e-mails will also affect the format of print-to-fax jobs.
 {{% /notice %}}

#### Customising the Address Format

<!--FIXME bitte hier prüfen/nachfragen was hier aktuell ist, ich hab das gefühl, dass über die faxserver-konfiguration einige Dinge schon abgedeckt sind. -->

If you would like to change the address format to, for example, 009912700619@mydomain.de, follow these steps below:

* In the pascom web UI, under ({{< ui-button "Appliance" >}} > {{< ui-button "System Settings" >}}) modify the system setting entry *sys.fax.configure.faxmail.matcher.fax*.
* Enter the value **/||(\d+)@.\*/**.
* These changes are activated by saving and manually applying the network services ({{< ui-button "Apply" >}} > {{< ui-button "Network Services" >}})

<!--FIXME eigentlich müßte hier der Mail-Server neugestartet werden, aber das taucht nicht auf... bitte prüfen/nachfragen ob das hier so passt-->

The default address format is recipient@009912700619.fax. The format can be changed by editing the  **/etc/exim4/exim4.conf.mdc** file via SSH:

    fax:
    driver = manualroute
    transport = fax
    route_list ="\*.fax"

Should you wish to change the address format to, for example, 009912700619@mydomain.de, the following modification is necessary:

    route_list = "meinedomain.de"

To complete the modifications, you will also need to edit the file */etc/exim4/update-exim4.conf.conf*:

    dc_other_hostnames='localhost.localdomain;meinedomain.de'


<!--FIXME bitte hier nochmal nachfragen was angepasst werden muss, damit die einstellungen, die über ssh gemacht werden nicht überschreiben werden. die vorhandene anleitung an dieser stelle ist etwas veraltet...-->

#### Customise File Format / Attachment

Via the system setting sys.fax.configure.faxmail it is possible to specify which components of an e-mail are sent when it is converted to a fax:

* 0 (default): the entire e-mail is converted and sent as a fax (including the text of the e-mail)
* 1: only the attachment is sent via fax

#### Modifying E-mail Component Conversion

under `/var/spool/hylafax/mimetype` you will find the conversion scripts. Depending on MIME type, these scripts deconstruct inbound e-mails into their individual components and convert them into a fax message. Should a script for a particular mimetype not be available, then this component of the e-mail will be ignored and not built into the fax.

The following scripts are available: 

|Script|Description|
|------|------------|
|application/pdf|converts a PDF attachment to a fax message|
|image/tiff|converts a TIF or TIFF attachment to a fax message|
|text/plain|converts a plain-text e-mail message body to a fax message|
|text/html|converts an HTML e-mail message body to a fax message|


## Print-to-Fax

The Print-to-Fax Gateway can be used to automatically send documents from, for example, ERP systems as well as for sending documents manually using the desktop client.

{{% notice info %}}
Print-to-Fax is not supported by cloudstack and pascom 18 solutions.
{{% /notice %}}

#### Define the Operating Mode

When [configuring the fax server]({{< relref "#fax-server-configuration">}}) please define how you would like to use the Print-to-Fax Gateway. 

#### Add Control Fields

To enable the fax system to extract the destination number and other information from the print job, the document to be sent via fax must contain control fields. As those fields are usually not transmitted to the recipient, they can also be coloured in white.

|Expression|Description|
|--------|---------|
|@@+FAX:0991....@@|The recipient's fax number. This is the only mandatory field!|
|@@+TAG:Bestellung 12345@@|Individual job description, displayed in lists and notifications.|
|@@+PRIO:100@@|Job priority (0-255). Jobs with a lower number are dispatched before others. Default priority is 200. Priorities that you should use in relation to time-consuming, large-volume batch jobs, will usually be assigned a priority of 250, otherwise all manually started jobs would have to wait for the batch job to finish.|

#### Possible Issues

That the system can analyse the control fields, the print job must now be converted into text format. Depending on the complexity of the print job, used fonts and type of print driver, this can lead to potential issues. 

You should consider the following: 

* Follow the recommended driver setup.
* Should issues arise, try entering standard fonts such as Arial 10 in the control fields.


### Print Driver Setup
<!--FIXME - check actual setting names in English-->
#### Mac

* Under your Mac's System Preferences, go to {{< ui-button "Printer and Faxes" >}}.
* Via the {{< ui-button "+" >}} symbol add a new printer.
* Under the {{< ui-button "IP" >}} tab, enter the following options:

|Option|Setting|
|---|---|
|Protocol|IPP|
|Address|yourappliance:631|
|Waiting list|printers/sendfax|

#### Windows

* Under {{< ui-button "Control Panel" >}} > {{< ui-button "Printers and Fax Devices" >}} add a new network printer.
* Skip the automatic search.
* Select *Select shared printer by name* and enter the following: *http://yourappliance:631/printers/sendfax*
* Select the appropriate print driver:

|Operating System|Print Driver|
|---|---|
|Windows 7|Xerox 6120PS|
|Windows 8.1|Dell Printer 3100cn PS|
|Windows 10|Microsoft Print to PDF|

<!-- |Windows 2012 R2 |Dell Open Print Driver (PS)|-->
