---
title: pascom 18
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