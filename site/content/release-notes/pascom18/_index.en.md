---
title: pascom Server 18
description: With the new pascom version 18 Release, numerous new and improved functions are now available
weight: 996
---

{{% notice tip %}}
With pascom 18 there are a number of core changes that you will need to check before updating and then modify once you have updated. Please use our check list in our detailed [Upgrade Guide]({{ ref "/server/upgrade" }}).{{%/notice%}}


## Highlights

{{< youtube nE3SCcMVfto >}}

### Platform Unify 

The pascom classic and cloudstack have been unified into one platform. This ensures that all "cloud" functions such as encrypting of all calls and the simple integration of mobile users are also available in on-premise installations.

### Session Border Controller

The pascom Session Border Controller is now a fixed component of the pascom phone system solution and enables the integration of mobile users via SIP. 

### Enhance Audio Quality

All pascom Clients now offer an enhanced audio quality thanks to the integration of the OPUS codec. This is particularly beneficial for mobile users who could be in weaker networks. 

### Cloud VPN Connector 

The pascom.cloud can now also access local services such as Active Directory, CRM System, etc. in that you can now establish a direct VPN connection between your pascom.cloud instance and your company network.

### Remote Control of Desktop Phones via the Cloud

With pascom 18, the pascom Dekstop Client is now able to talk to directly hardware phones. As such you are able to enjoy the same comfort levels as on-premise solutions when using a pascom.cloud solution.

### Introduction of the pascom Mailserver cloudmx

Starting now, we are providing all pascom customers with the ability to send e-mails using our "cloudmx" service. Complicated integrations of local mail servers can now be avoided for both cloud and on-premise solutions.

### Encryption Made Simple

Thanks to the Let's Encrypt integration it is now very simple to use secure certificates.

## Core Changes

With pascom 18 there are a number of core changes that you will need to check before updating and then modify once you have updated. Please use our check list in our detailed [Upgrade Guide]({{ ref "/server/upgrade" }}).

### pascom Classic Client

The pascom Classic Client and the FlexPanels are no longer supported by pascom 18. FlexPanels will be improved and enhanced for both desktop and mobile clients with pascom 19.

### Discontinued Patton Support

Patton Gateways are no longer supported. Should you still have ISDN deployed, you should consider switching to a SIP connection. If you use Patton Gateways for analog fax devices etc., the  [Grandstream ATA Apapter]({{< ref "/gateways/grandstream" >}}) an ideal, cost effective alternative. 

### Discountinued Siemens Unify optiPoint Support

Due to non-existing encryption for voice and provisioning, Siemens Unify optiPoint endpoint support has been discontinued.


## Release 18.02 (07.11.2018)

**Overview**

- Mobile apps can now be paired using login credentials.
- Increased security with Firewalls between instances.
- New users can now be sent e-mail invites from an already configured phone system instance.
- Snom M700 systems now support LDAP (no TLS, interface must be set to "mixed"). 
- Repaired Gateway provisionig via the GUI
- Endpoints can now be added via the User Setup wizard. 

**MODIFICATIONS:**

- MD-7686 - Conference hasleft and hasjoin messages are always played in english
- MD-8200 - Info of received fax keeps loading
- MD-10647 - Yealink firmware update broken
- MD-10794 - Basic configuration not used as default
- MD-10821 - Change dialplan in grandstream provisioning template
- MD-10925 - Device reboot invoked after deleting a user
- MD-10977 - Avoid empty page in /ui/ of management interface
- MD-10984 - Logout button is shown in instanceui if the user is authenticatd via csui SSO
- MD-10995 - Consul license.update event should be synchronized
- MD-10997 - Remove deprecated flex panel data and hide Flex panels in webui
- MD-11025 - REST /identity/states returns 204 in any case
- MD-11032 - M700 provisioning via commander throws exception
- MD-11035 - Grandstream HT802 provisioning via commander throws exception
- MD-11036 - Aastra Dect provisioning via commander throws exception
- MD-11059 - Authentication dialogue shows "mobydick" in some browsers
- MD-11070 - Improve response of client if wrong phonenumber gets entered
- MD-11093 - Message about wrong input after creating a trunk because of (not deletable) gateway
- MD-11104 - Documentation for REST Trunk is wrong
- MD-11105 - REST Request “/identity/states” is broken
- MD-11130 - Can't dial large numbers necessary for *74 call forwardings
- MD-9034 - Show provisioning URL for gateway also for related devices
- MD-10047 - Block ip traffic between cloud instances
- MD-10114 - Import Integrated External Phones via connector
- MD-10866 - Invite new users after finished instance wizard
- MD-10970 - Implement ldap proxy support for M700
- MD-11027 - Add desktop phone pairing to the instance-wizard
- MD-11043 - XMPP warning mails are sent to users of pascom.cloud
- MD-11126 - Mobile pairing with credentials


## Release 18.01 (09.10.2018)

**Overview**

- TAPI and further third-party XMPP-clients are now able to connect to the server again, without connection loss
- the pascom appliance can be restarted proberly
- customized mail server settings remain after a reboot

**MODIFICATIONS:**

- MD-11016 - Custom mail server gets lost after reboot
- MD-11037 - Fix XMPP Version check for clients
- MD-11040 - Red mini appliance fails to startup properly, containers are not running
- MD-11041 - Can not add a beronet gateway with only one interface
- MD-11048 - Self signed certificate change after appliance update
- MD-11049 - Add restic binary to host firmware



## Release 18.00 (20.09.2018)

Intial Release of pascom Version 18.

### pascom Clients
- The Desktop clients can now control phones via HTTP
- Opus-Codec for pascom Clients
- Secure TLS/SRTP telephony for pascom clients now available for on-site solutions
- Improved GSM Fallback behaviour
- "Crackling" noise fixed in voicemails (MD-10444)
- Diverse Crash causes resolved (MD-10851, MD-10858)
- QOS/TOS Support for telephony
- Resolved problems by holding calls
- iOS Client can now manage multiple calls
- Android: improved app ending behaviour (Force-Quit)
- Android: Target API increased to 8.1, new notification management (Channels) implemented
- Diverse UI Improvements
- Support for Sennheiser HeadSetup on 32bit Systems
- Support for Sennheiser HeadSetup Pro
- Timeout for Login attempts removed
- Speaker volume by calls when connected to a pascom 18 server
- Qt 5.9.6 integrated
- Improved support for iPhoneX display


### pascom Server
- Asterisk 13 incorporated
- ldaps support for telephones
- Simple Setup with Wizards
- Automatic licence identification via my.pascom.net
- Licence management via my.pascom.net
- Cloud support and support for Internet-Setups (Session Border Controller)
- Simplified e-mail sending via cloudmx
- PHP7 in the instance-UI
- Let's encrypt support
- Patton Support remoed
- Print-To-Fax Support removed
- Support for pre-16 Beronet Firmware removed
- Old Update-Logic removed
- Web Asterisk CLI for simplified debugging
- QOS/TOS Support for telephony
- TFTP-Server removed
- Prometheus / Grafana based Performance Monitoring
- Support for pascom Classic Client and pascom Client < 17.10 removed