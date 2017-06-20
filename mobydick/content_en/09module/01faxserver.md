---
title: Fax Server
url: /modules/fax-server/
linkde: /module/fax-server/
prev: /modules/
next: /modules/call-recording/
weight: 91
toc: true
---

{{% notice tip %}}
[Our VoIP phone system software] (https://www.pascom.net/en/mobydick-voip/ "pascom IP phone system software") comes with a fully integrated fax server as standard.
The included fax server is HylaFax (http://www.hylafax.org/ "pascom Integrated HylaFax Server"), which is connected to the Asterisk telephony server via virtual IAX modems.
{{% /notice %}}
## Overview

The integrated fax server offers a number of functions, which are described in this how-to:

* Setting up the fax server and defining the modems
* Receiving faxes and forwarding them using e-mail and virtual fax devices. Inbound fax-to-mail Gateway.
* Sending faxes using e-mail. Outbound mail-to-fax Gateway.
* Sending faxes using a virtual printer and printer commands. Outbound print-to-fax Gateway.
* Sending faxes without printer commands using a virtual printer and client
* Sending faxes as files using the mobydick Client.
* Displaying sent and received faxes in the web interface.
* Maintaining the fax queues and log files
![Illustration - mobydick VoIP Fax Server Concept](../../images/fax_illustration.png?width=90% "mobydick VoIP Fax Server Concept")


## Basic configuration of the fax server

Before the fax server can be used, a few settings need to be adjusted. This can be done in the menu ***Appliance > Services > Fax server***. It is important to configure a reasonable number of fax lines, which defines the number of virtual modems and thus the number of parallel faxes that can be sent and received. In practice, four modems is a reasonable setting to use.
![Illustration - basic configuration of the fax server](../../images/faxserver_config.jpg?width=100% "basic configuration of the fax server")
{{% notice info %}}
After saving the configuration of the fax server, it still must be applied so the operating system becomes aware of the changes.
{{% /notice %}}

In order to use the e-mail gateway, sending and receiving e-mails must work properly. To check the corresponding settings that regulate e-mail services of the telephony appliance, go to ***Appliance > Services > E-mail Server*** and enter the mail server and domain name that should be used in the forwarding process. When finished, the changes to the network configuration need to be applied.

![Illustration - basic configuration fax server](../../images/fax_mailserver.jpg?width=100% "basic configuration fax server")
{{% notice tip %}}
More information can be found in the chapter Configuring the Network.
{{% /notice %}}
## Displaying sent and received faxes

Since version 6.07.00, it is possible to display and also download the list of received and sent faxes in the web interface. The lists can be found in the menu ***Information > Fax server***.

## Maintaining the queues and log files

All sent and received faxes, together with log files, are stored by the fax server in various directories in /var/spool/hylafax. To maintain a consistent performance level and to save space on the file system, a cronjob will delete those files once a week. The default setting of the appliance is to keep the documents for 30 days.

This duration can be adjusted at any time in the menu ***Appliance > Cronjobs*** by editing the job "Clean up fax server". The fax server can be maintained manually as well. This can be done in the menu ***Apply > Clean up fax server***.

## Creating and assigning fax machines for users

Next, the user's personal fax device must be set up. The extension number and e-mail forwarding must be configured. Different steps must be taken depending on whether the fax machine is intended for personal use by an individual or for shared use by a group of employees.
All screens only require three values to create a fax device:

 * the e-mail address the fax is forwarded to
 * the extension number for the fax machine
 * the file format of the extension; default is PDF
 
{{% notice info %}}
After creating the fax machines, apply the telephony settings to enable the changes with the operating system.
{{% /notice %}}


## Sending Faxes via the E-mail Gateway
On the server, however, several changes need to be made before it can be used as an E-mail-to-fax gateway. The telephony's E-mail system must be working. Your company's E-mail server must be configured in a way so that e-mail from your clients can be sent to the fax server. The configuration must also be set up to ensure that E-mails sent to the domain "*.fax" are forwarded via SMTP to your telephony server. Depending on the E-mail being used, the steps necessary can differ

To send a fax after the configuration is done, simply send an E-mail using the following structure:

|Field|Example|Description|
|----|--------|------------|
|To|recipient@009912700619.fax|The number is evaluated and the part to the left of the "@" sign is used as the recipient on the cover page of a fax. (the default is to disable cover pages for fax).|
|Subject and body| |Converted to PostScript and used as the first page of the fax.|
|Attachment| |The actual fax as PDF or TIF file.|

### Customisation options
In this version, the gateway's behaviour can in part only be changed by changing the configuration files. This requires logging in to mobydick using SSH and having root user permissions.

#### Customising the format of notification E-mails
The default setting is to send out a plain-text e-mail whenever there is a change in a fax job (busy, failed, successful, etc.). This setting can be changed to use an alternative format. With the alternative format, an HTML E-mail will be used that has the first page of the fax embedded. The fax itself will be sent as an attachment in PDF format. This format is the same as the one used when a fax is received by a virtual fax machine configured to use the format="inlinegif" option.

* open the file /etc/hylafax/FaxNotify in a text editor
* remove the "#" comment in the line INLINE=true
* restart in the fax system using the web interface or the  _ /etc/init.d/hylafax restart _ command

{{% notice tip %}}
changes made to the format of notification e-mails will also affect the format of print-to-fax jobs.
 {{% /notice %}}

#### Customising the mail-to-fax address format
If you would like to change the address format to 009912700619@mydomain.de, follow these steps below:

* First, use the system settings in the web interface to modify the sys.fax.configure.faxmail.matcher.fax entry. Use this value with the above example:


        /||(\d+)@.*/


* Apply this modification by clicking "Apply > Network services".

* as mentioned above, the default address format is recipient@009912700619.fax. The format can be changed by editing the  **/etc/exim4/exim4.conf.mdc** file.

    {{% md %}}
    fax:  
    driver = manualroute  
    transport = fax  
    route_list ="*.fax"
    {{% /md %}}


To change the address format to the example 009912700619@mydomain.de, the following modification is necessary:

    route_list = "mydomain.de"
    
To complete the changes, the file **/etc/exim4/update-exim4.conf.conf** needs to be edited:

    dc_other_hostnames='localhost.localdomain;mydomain.de'
 
**Please note:**
{{% notice note %}}
Finally you need to uncheck the "EMail-Server" option under Basic Configurations > Network, otherwise the customised files will be overwritten.
{{% /notice %}}
 
#### Customizing the Mail-to-fax file format / attachment
It is possible to use the setting sys.fax.configure.faxmail.mode to specify which parts of an e-mail are sent when it is converted to a fax:

* 0 (default): the entire e-mail is converted and sent as a fax (including the text of the e-mail)
* 1: only the attachment is sent via fax

#### Custom conversion of e-mail parts
The directory /var/spool/hylafax/mimetype holds the scripts for the conversion process. The scripts will take an e-mail and split it into its individual parts, depending on the MIME type, and then convert the e-mail to a fax message. If there is a MIME type for which no script exists, the corresponding part in the e-mail is simply ignored and will not be included as part of the fax message.
Below is a list of all scripts:

|Script|Description|
|------|------------|
|application/pdf|converts a PDF attachment to a fax message|
|image/tiff|converts a TIF or TIFF attachment to a fax message|
|text/plain|converts a plain-text e-mail message body to a fax message|
|text/html|converts an HTML e-mail message body to a fax message|

### Example settings for an Exchange server

The following steps are needed to make an Exchange Server forward all *.fax e-mails to mobydick:

* open Exchange System Manager
* Select: Administrative Groups / Routing groups / first routing group / Connectors
* In the Connectors window:  right click -> New -> SMTP Connectors
* create the following entries in the General tab:
    * Name = Name of the Connector (can be anything)
    * activate "Route entire mail through smarthost using this connector"
    * in the field below, enter the IP of the mobydick server (in square brackets)
    * Local Bridgeheads: = click "Add" and select Exchange Server
    * in the tab "adress space" *.fax
* Save the changes

## Sending Faxes with the Print to Fax Gateway

### Choosing the operating mode
The print-to-fax gateway can be used to automatically send documents from ERP systems; documents can also be sent manually using the desktop client.

For system versions 6.12.01 or above, the system setting sys.fax.configure.faxprint.mode controls the gateway's operating mode:


|Value|Description|Default|
|:--:|---------|--------|
|1|    Do not search for control fields and directly pass the job to the client.|For new installations from version 6.12.01 or newer|
|2|    Control fields for automatic dispatch are looked up. By errors this process will be stopped.| |
|3|    Firstly the control fields will be searched. If none are found, the order will be sent to the client.| Appliances before version 6.12.01|

{{% notice tip %}}
If automatic mode with control fields is **not** needed, mode 1 is recommended for performance reasons. Using this mode, the document does not have to be split and searched.
{{% /notice %}}

### Inserting control fields
To enable the fax system to extract the destination number and other information from the print job, the document to be sent via fax must contain control fields. As those fields are usually not transmitted to the recipient, they can also be coloured in white.

The fax system can use the following expressions:

|Expression|Description|
|--------|---------|
|@@+FAX:0991....@@|The recipient's fax number. This is the only mandatory field!|
|@@+TAG:Bestellung 12345@@|Individual job description, displayed in lists and notifications.|
|@@+PRIO:100@@|Job priority (0-255). Jobs with a lower number are dispatched before others. Default priority is 200. Priorities that you should use in relation to time-consuming, large-volume batch jobs, will usually be assigned a priority of 250, otherwise all manually started jobs would have to wait for the batch job to finish.|

### Notifications
The **notify** control field accepts an e-mail address where all status reports concerning a certain fax job can be sent to. If the notify field is not present, there are two options:

* all notifications are sent to faxmaster@yourdomain (default)
* the notification is sent to username@yourdomain, where username is the user name of the user currently logged in when dispatching the print job.

The type of notification and other settings can be adjusted using the system settings at sys.fax.configure. The faxprint. sys.fax.configure.faxprint.notify key controls the type of notification used. The values accepted for this key are "faxmaster" or "user".

### Troubleshooting
Before the system can evaluate the control fields, the print job must be converted to text format. Depending on the complexity of the print job, the fonts being used and the type of printer driver, complications can arise.

Please bear in mind the following:

* configure the drivers as advised (see above)
* if you experience problems, try to enter the control characters using a standard font such as Arial 10pt.


Some details on the print job can be viewed in the log file /var/log/mobydick/sendfax.log.

### Adjusting Settings

To facilitate the migration from another fax system, a number of settings of the gateway can be adjusted. 

All values in the table below are saved in the system settings. Most values only need be added to the system settings only when they are needed.


|Key|Description|Default Value|Example|
|---------|---------|------------|--------|
|sys.fax.configure.<br/>faxprint.matcher.fax   |Regular expression matching the fax number in the document. The first pair of brackets indicates the position of the number.| /@@\+FAX:<br/>\s*(.*?)\s*@@/    | |
|sys.fax.configure.<br/>faxprint.matcher.jobtag|   Regular expression matching the user-specified job name in the document. The first pair of brackets indicates the position of the corresponding field.|    /@@\+TAG:<br/>\s*(.*?)\s*@@/    | |
|sys.fax.configure.<br/>faxprint.matcher.priority|    
Regular expression matching the priority in the document. The first pair of brackets indicates the position of the priority number|    /@@\+PRIO:<br/>\s*(\d+?)\s*@@/  | |
|sys.fax.configure.<br/>faxprint.matcher.notify|   Regular expression matching the E-mail address in the document. The first pair of brackets indicates the position of the address.| /@@\+NOTIFY:<br/>\s*(.*?@.*?)\s*@@/    | |
|sys.fax.configure.<br/>faxprint.priority|Default priority for fax jobs if no priority is specified in the document.|  200     | |
|sys.fax.configure.<br/>faxprint.tries |Number of tries to fax the document.| 3   | |
|sys.fax.configure.<br/>faxprint.notify|   If no e-mail address is specified in the job, the "faxmaster" and "user" values specify who is to be contacted when there are changes in a job.|   faxmaster| user|
|sys.fax.configure.<br/>faxprint.usermangle.search|    If the usernames on the desktop workstations or in the print system differ from the user names on the telephony appliance, a regular expression can be specified for the selection of a user name. |(empty)|  /^(\w+)\..*/ |
|sys.fax.configure.<br/>faxprint.usermangle.replace    |Specifies the value used to replace the original user name. The "search" and "replace" values must be specified. In the example, the Windows user name is truncated at the first point.|  (empty)|   $1|

## Setup Fax Printer Driver
{{% notice info%}}
This is another platform-independent way of sending faxes. However, virtual printers need to be configured for each computer that uses this method. Please refer to the setup guides for your operating system as found below. 
For larger system environments, the printer can be connected to the individual computers using ActiveDirectory.
Apart from single fax jobs, the print-to-fax gateway can be connected to an ERP system and be used to automatically send out newsletters etc.
{{% /notice %}}
### on MacOS X 

1. Start the installation in the System Preferences / Print and fax menu
![Screenshot - installation via system preferences](../../images/sendfaxmac1.png?width=60% "installation via system preferences")
2. Click "+" to add a printer
![Screenshot - network printer](../../images/sendfaxmac2.png?width=60% "select network printer")
3. Enter the details of the printer
![Screenshot - details of printer mac](../../images/sendfaxmac3.png?width=60% "details of printer")
4. Finish installation
Click "Add" and confirm the next dialogue. 
The fax printer is now ready for use.

### on Windows 7

1. Start the installation in the System Preferences / Print and fax menu
![Screenshot - installation via system preferences ](../../images/sendfaxw7_1.png?width=60% "installation via system preferences")
2. Add Printer
![Screenshot - network printer](../../images/sendfaxw7_2.png?width=60% "select network printer")
3. Skip Automatic Discovery
![Screenshot - automatic discovery](../../images/sendfaxw7_3.png?width=60% "automatic discovery")
4. Enter the Printer URL
Use the IP address or the DNS name of your appliance: http://yourappliance:631/printers/sendfax
![Screenshot - use IP or DNS Name ](../../images/sendfaxw7_4.png?width=60% "use IP or DNS Name")
5. Select Driver
![Screenshot - driver of printer ](../../images/sendfaxw7_5.png?width=60% "driver of printer")
Select the Xerox 6120PS as the printer driver.
6.  Finish Installation
![Screenshot - finisch installation ](../../images/sendfaxw7_6.png?width=60% "finish installation")
The installation is finished after the final confirmation. 


### on Windows XP

1. Start the installation in the System Preferences / Print and fax menu
![Screenshot - Installation per Systemsteuerung ](../../images/sendfaxxp1.jpg?width=70% "Installation per Systemsteuerung")
2. Select "Network printer"
![Screenshot - Network printer](../../images/sendfaxxp2.jpg?width=70% "select Network printer")
3. Enter the printer URL
Use the IP address or the DNS name of your appliance: http://ihreanlage:631/printers/sendfax
![Screenshot - use IP or DNS Name](../../images/sendfaxxp3.jpg?width=70% "use IP or DNS Name")
4.  Select driver
Select Apple LaserWriter 12/640 PS as your printer driver.
![Screenshot - driver of printer](../../images/sendfaxxp4.jpg?width=70% "Driver of printer")
5. Finish installation
The installation is finished after one more confirmation.
![Screenshot - finish installation](../../images/sendfaxxp5.jpg?width=70% "finish installation")



