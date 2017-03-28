---
title: Services Configuration
keywords:
    - Configuration
    -  Using mobydick DHCP Server
    -  Configuring the DHCP Server via the Web UI
    -  Customising the DHCP Server configuration
    -  Using a Windows DHCP Server
    -  mobydick and Windows DHCP Services in mixed operation
    -  Using a Linux DHCP Server
    -  Using other DHCP Servers
description: Configuration of mobydick, Windows, Linux or other DHCP Servers to distribute IP Addresses and Configuration server details to  IP Telephones
linkde: /server/dienste/
url:  /server/services/
prev: /server/network-configuration/
next: /server/backups/
weight: 16
toc: true
---

## mobydick Default Settings ##

Before [our VoIP Software] (https://www.pascom.net/en/mobydick-voip/ "pascom VoIP phone systems") can be put into operation, it is necessary to configure a few default settings. Within the web UI, click on `Appliance` > `Services` and for now remain in the tab `Basic Data`:

|Setting|Description|
|---|---|
|Hostname| mobydick Hostname (Per default **mobydick**) unless modified by you|
|Domain-Suffix|Your Domain-Suffix|
|Primary Nameserver|Internal or external DNS Server|
|Secondary Nameserver|Additional DNS Server - optional|
|Notification address|E-mail address of an employee or e-mail distributor which should receive notifications from mobydick|
|Sender address |The e-mail address from which mobydick can distribute e-mails|


## Mail Server

mobydick includes a mail server. It should be configured so it can forward e-mails to your SMTP server.  
You can either manage your own SMTP server or have your provider run such a service for you. For a successful configuration, you need to
know the IP or domain name of the SMTP server you intend to use. In addition, it may also be necessary to (particularly if you are using the SMTP server from your provider) authenticate with a user name and password.

{{% notice note %}}
The mail server is required to send voice mails, faxes, recordings of phone conversations etc. via e-mail.  
To enable this, create a mail account for mobydick on your mail server. This account will only send e-mails, not receive e-mails.
{{% /notice %}}

### Configuration ###

To configure the mail server, go to the Web UI and select `Appliance` > `Services` > `E-mail Server`:

|Setting | Description|
|---|---|
|Visbile Domain Name|Enter section of your e-mail address after the @ symbol|
|Mail Server for forwarding|mobydick does not send e-mails directly to the corresponding destination server, but rather uses a forwarding (relay) server <br>Should a different port other than 25 be used, enter this port here as in the following example: 192.168.100.1**::587**|
|SMTP User and Password|optional setting, which is required for SMTP authentication|

### Test Settings ###

To test the correct working of your mail server, use SSH to log on to your mobydick and become the root user. Send a test e-mail using the following command, whereby *max@chaosconsulting.com* should be replaced with your desired address:

     admin@mobydick:~$ echo Test | mail -s Test max@chaosconsulting.com

You can also check the mail server's log file, using the command below and your system password:

    root@mobydick:/etc/admin# tail -f /var/log/exim4/mainlog

This will return several lines allowing you to check whether the e-mail was successfully sent using your SMTP server.

    2016-03-16 12:21:14 1NrUpm-0007gQ-Dk <= admin@chaosconsulting.com U=admin P=local S=368
    2016-03-16 12:21:14 1NrUpm-0007gQ-Dk => max@chaosconsulting.com R=smarthost T=remote_smtp_smarthost H=ihr.mailserver [192.168.1.10]
    2016-03-16 12:21:14 1NrUpm-0007gQ-Dk Completed


## NTP Server Configuration

Many mobydick processes are time controlled. For example, calls could be routed differently at different times. mobydick also automatically manages the time on all IP telephones. Therefore, it is important to configure a NTP server to ensure proper time snychronisation

{{% notice tip %}}
If you do not have your own NTP server, you can use the publicly available service at pool.ntp.org.
{{% /notice %}}

Enter the NTP Server address in the mobydick web UI under `Appliance` > `Services` > `NTP Server`.


## Encrypted Telephony via SRTP

The RTP (Real-Time Transport Protocol) is a protocol which facilitates the transmission of multimedia data streams over
a network. In IP telephony, it is used in order to transmit both audio and video streams for a call. mobydick is able to
encrypt the transmissions via SRTP (Secure RTP)
 
SRTP configurations can be set under `Appliance` > `Services` > `Telephony`

The following SRTP settings are available:

|Setting|Description|
|-----------|------------|
|Deactivated|As default SRTP is deactivated|
|Activated for all supported devices |Support devices, which can be provisioned by mobydick (Snom, Yealink, Aastra (mitel), Auerswald, OpenStage and mobydick Softphone)|
|Activated for all supported devices and any IP phone/softpone|SRTP will be activated for all supported devices and any IP phone or softphone.<br/>Please note that devices that are not provisioned by mobydick, SRTP must be manually activated on the device itself. Should you not do this, then it could be that it can no longer be called when SRTP is activated in mobydick.|

{{% notice note %}}
As standard SRTP can only be activated for IP phones / Softphones and not for Gateways. When SRTP is activated in mobydick, only internal calls will be encrypted and **not calls that are externally routed over a gateway or a SIP provider**.

{{% notice warning %}}
When activating / deactivating SRTP, the Asterisk will be restarted, meaning all current calls will be disconnected. Therefore all hardware phones must be restarted (-> Device List)a and all mobydick Clients using Softphones must be restarted.
{{% /notice %}}
