---
title: Trunk Templates
description: The pascom phone system includes a SIP provider database including a number of templates for creating SIP, analog and ISDN trunks. These templates are designed to support admins with the trunk setup and automatically add the appropriate call rules.
type: "pages"
icon: "fa fa-copy"
weight: 9
---

{{< doctype "both" >}}
 
{{% notice warning %}}
Should your SIP trunk not be listed, please use the "Generic SIP Trunk" template. Should you have questions regarding officially not supported trunks, please refer to our [Forum](https://www.pascom.net/forum).
{{% /notice %}}

### pascom Supported Trunk Templates

The following trunk templates are supported by the pascom support team. In order to benefit from this support, a pascom Premium subscription is required.


|Template / Provider|Available in|Product(s)|On-premise|Cloud|
|---|---|---|---|---|
|[AVM Gateway]( {{< ref "/trunk-templates/fritzbox" >}})| - |FRITZ!Box|<i class='fas fa-check'></i> <br/><sub>Can perform local SIP trunk termination.</sub>|<i class='fas fa-check'></i> <br/><sub>Can perform local SIP trunk termination. A direct connection to the box e.g. via VPN is required.</sub>|
|beroNet Gateway| - |BeroBox|<i class='fas fa-check'></i> <br/><sub>Can perform the termination of all analog and ISDN primary rate interface trunks.</sub>|<i class='fas fa-check'></i> <br/><sub>Can perform the termination of all analog and ISDN / Primary Rate Interface (PRI) trunks.</sub>|
|Deutsche Telefon|DE|SIP TK-Anlagenanschluss|<i class='fas fa-check'></i>|<i class='fas fa-check'></i>|
|[Easybell]( {{< ref "/trunk-templates/easybell" >}})|DE|Business|<i class='fas fa-check'></i>|<i class='fas fa-check'></i> <br/><sub>Due to provider-side blacklisting, short interruptions may occur.</sub>|
|[HFO Telekom]( {{< ref "/trunk-templates/hfo-telecom" >}})|DE|All|<i class='fas fa-check'></i>|<i class='fas fa-check'></i>|
|[M-net]( {{< ref "/trunk-templates/mnet-sip-trunk" >}})|DE (Regional)|SIP Trunk|<i class='fas fa-check'></i>|<i class='fas fa-check'></i>|
|Magenta.at (former UPC)|AT|SIP Trunk|<i class='fas fa-check'></i>|<i class='fas fa-times'></i><br/><sub> Is currently not supported.</sub>|
|peoplefone|CH, DE, AT, PL, LT|Alle|<i class='fas fa-check'></i>|<i class='fas fa-check'></i>|
|plusnet (QSC)|DE|Ipfonie extended connect|<i class='fas fa-check'></i>|<i class='fas fa-check'></i>|
|R-Kom|DE (Regional)|VoipTrunk|<i class='fas fa-check'></i>|<i class='fas fa-check'></i> <br/><sub>When migrating a local trunk to the pascom cloud, it is first necessary to coordinate with the R-Kom sales team.</sub>|
|sipgate|DE|Basic, Trunking, Team|<i class='fas fa-check'></i>|<i class='fas fa-check'></i>|
|[Telekom]( {{< ref "/trunk-templates/telekom-sip-trunk" >}})|DE|Individual Numbers (tel.t-online.de)|<i class='fas fa-check'></i> <br/><sub>Should several numbers from varying locations are consolidated together, then the trunks for satellite locations will no longer be suitable for making emergency calls. This is because the location to which the connection is registered will always be transmitted to the emergency services control centre. </sub> |<i class='fas fa-check'></i><br/><sub>This trunk is not suitable for emergency calls when deployed in a cloud environment, as the physical location where the connection is registered will be transmitted to the emergency services control centre.|
|[Telekom]( {{< ref "/trunk-templates/telekom-sip-trunk" >}})|DE|SIP Trunk|<i class='fas fa-check'></i><br/><sub>Should several numbers from varying locations are consolidated together and a Telekom VDSL/FTTH access is used (exactly this product of Telekom), then the trunks for satellite locations will no longer be suitable for making emergency calls. This is because the location to which the connection is registered will always be transmitted to the emergency services control centre. </sub> |<i class='fas fa-check'></i>|
|[Vodafone]( {{< ref "/trunk-templates/vodafone-ngn" >}})|DE, UK, IR, CZ, IT, SP, PT, ... [complete list](https://www.vodafone.com/content/index/about/where.html)|Vodafone NGN Trunk|<i class='fas fa-check'></i> <br/><sub>As Vodafones do not use registrations, a custom configuration is necessary. [To the configuration]( {{< ref "/trunk-templates/vodafone-ngn" >}})</sub>|<i class='fas fa-times'></i> <br/><sub> Is currently not supported.</sub>|

### Partner Supported Templates

The following trunk templates are exclusively supported by the below named partners.
Should you have any questions or issues relating to these trunks or the template, please contact the corresponding pascom partner directly. 

|Template / Provider|Contact|
|---|---|
|Bergnet|CSP Partner [Bergnet GmbH](https://www.berg.net/)|
|Seabix|CSP Partner [Seabix AG](https://www.seabix.com/home)|


### Community Maintained Templates

The following trunk templates are maintained and tested by active users within the pascom forum community. 
As these templates are not supported directly by pascom, please refer to our [Community Forum](https://www.pascom.net/forum) should you have any questions.

|Template / Provider|
|---|
|500 Ltd, SIP Trunk Plus|
|amplus|
|colt|
|comingolstadt Business|
|envia TEL|
|equada|
|EWE|
|flowroute|
|Gradwell|
|inexio|
|IP Austria|
|Netcom Kassel|
|netplanet|
|Nexbridge|
|SBB|
|SIP Trunk Plus|
|sipcall.ch|
|Tele2|
|TeleData|
|TelemaxX|
|T-M-Net Trunk|
|Toplink Xpress SIP Trunk|
|voipGATE Business|