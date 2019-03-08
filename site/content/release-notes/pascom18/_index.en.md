---
title: pascom Server 18
description: With the new pascom version 18 Release, numerous new and improved functions are now available
weight: 996
---

{{% notice tip %}}
With pascom 18 there are a number of core changes that you will need to check before updating and then modify once you have updated. Please use our check list in our detailed [Upgrade Guide]({{ ref "/server/upgrade" }}).{{%/notice%}}

{{% notice warning %}}  
**Important Notice to this Update:**     
The reading of files from an SMB share is no longer supported. Instead, the import file can now be uploaded or queried from a URL.
{{% /notice %}}


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

### Discontinued Siemens Unify optiPoint Support

Due to non-existing encryption for voice and provisioning, Siemens Unify optiPoint endpoint support has been discontinued.

### Discontinued Cisco SPA 112 Support

Due to the Cisco SPA 112 gateway limitations that require a Cisco certificate, support has been discontinued in pascom 18.


## Release 18.06 (07.03.2019)

**Overview**

- Unsecured telephony using UDP / RTP now works flawlessly again for On-premise deployments

**MODIFICATIONS:**

- [MD-11372] - Insecure calls via UDP/RTP not working 


## Release 18.05 (26.02.2019)

**Overview**

- The CSV connector now allows manual uploads of files via the GUI as well as adding the data source URL
- The call analytics are now available per instance with a real-time graphical representation (Grafana)
- Added support for Vodafone NGN Trunks
- Improved analysis of Exchange connections via a connections tester
- The insecure provisioning of telephones and gateways in a local network via DHCP can now done and secured via OpenVPN
- Implemented support for Cloud Service Provider (CSP) and pascom 18 
- Added provisioning support for Yealink T5* series.

**MODIFICATIONS:**

- [MD-10710] - Firefox causes problem with exchange authentication test
- [MD-10951] - Do not show "Licensed Users" in csui on a csp host
- [MD-10962] - CSUI: Change Password form throws validation errors, but you can save anyway
- [MD-11051] - Overlapping text in mailserver settings
- [MD-11060] - Can not setup pascom 18 in hyperv on windows notebook with intel gpu
- [MD-11061] - No external number shown after pickup
- [MD-11132] - Grandstream desktop phone not requesting config via DHCP
- [MD-11171] - Handle reboot device action via UI more properly
- [MD-11195] - get /identity/userName/cdr returns 500
- [MD-11208] - Translate mail text for failed mail to fax
- [MD-11212] - Empty page after click on device type
- [MD-11268] - Remove "CS" conditions from basic configurations
- [MD-11276] - Confusing default outbound prefix mismatch
- [MD-11277] - Control grandstream via client in same network broken
- [MD-11278] - Backups are reachable over public URL without authentication
- [MD-11282] - Missing caller name during system call
- [MD-11287] - Improve security for instance files
- [MD-11293] - No fallback to originate dial
- [MD-11303] - New Snom firmware 10.1.33.33 breaks PUI menu and crashes in other cases
- [MD-11306] - Add timer_support to Snom M700 basic config
- [MD-11319] - Yealink call control results in originate dial
- [MD-11323] - Queue position is not correct (in grafana)
- [MD-11334] - Apply telephony config fails after update
- [MD-11336] - Grafana glitches after restoring backup
- [MD-8742] - Make CSV Connector cloudstack ready
- [MD-11080] - Include a preconfigure grafana server to the pbx container
- [MD-11081] - Provide a default grafana dashboard for call data analysis
- [MD-11141] - Manage voicemails in client journal - Server side
- [MD-11205] - Support Vodafone ngn trunks without sip registration
- [MD-11211] - Introduce trunk template flag to filter on-premise/cloud templates
- [MD-11214] - Upgrade kamailio and introduce python routing script
- [MD-11269] - Implement support for insecure dhcp based provisioning through openvpn tunnel
- [MD-11272] - Improve exchange connection tests
- [MD-11280] - Enhance Setup Wizard to handle CSP License setups
- [MD-11281] - Enhance Management UI (csui) to handle CSP hosts
- [MD-11297] - Use a AWS spot instance for building the pascom server iso
- [MD-11311] - Optimize apache config to avoid frequent reloads
- [MD-11332] - Allow to customize lxcbr iptables masquerade options
- [MD-8976] - Support Yealink T5 Series Phones


## Release 18.04 (16.01.2019)

**Overview**

- Implemented support for new Mitel DECT senders
- Overhauled the concept of roles
- Instance wizard now includes the option of a peoplefone test trunk
- Exchange connector can now import private contacts based on the e-mail address
- Calls via beroNet hardware are now long-term more reliable

**MODIFICATIONS:**

- [MD-11192] - Calls via beronet stop after 30 minutes
- [MD-11219] - Mitel/aastra Dect RFP44 and new vendor ID
- [MD-11220] - WebCLI broken on Firefox Version 64.0
- [MD-11232] - Ignore deleted instances in auto deployment calculation
- [MD-11246] - Grafana shows no data on some appliances
- [MD-10823] - Improve ISO boot compatibility
- [MD-11068] - SIP Test accounts in Instance wizard
- [MD-11135] - Enable/Disable trunks in webui
- [MD-11164] - Improve roles concept. Support dynamic assignments
- [MD-11226] - Enhance exchange connector, map users by mail address instead of username (18)
- [MD-11243] - Raise kamailio open file ulimit


## Release 18.03 (17.12.2018)

**Overview**

- New Asterisk version 13.23.1
- Improved GUI for adding beroNet Gateways
- Resolved beroNet card audio problem
- Implemented Plain LDAP support for Yealink DECT systems
- Added Yealink W60B DECT Auto Provisioning support
- SIP ALG is now configurable at the interface level
- Improved instance VPN tool function for instance to site VPNs
- Diverse improvements relatiing to Fax functions

**MODIFICATIONS:**

- [MD-10485] - Asterisk log level can't be changed via UI
- [MD-10972] - Ignore cronjob to create system backup during restore
- [MD-10980] - CSUI close button in notification dialog ugly
- [MD-11066] - Skip autostart feature is not cluster aware
- [MD-11100] - Remove "pascom was started from your hard drive" hint in login mask
- [MD-11101] - Instance administrator can not be renamed
- [MD-11102] - Reduce sip registration speed in case of authentication failures
- [MD-11110] - Outgoing Fax ID not added to fax
- [MD-11117] - Trunk Template Export fails
- [MD-11119] - Snom M700 multicell senders will end up with same config
- [MD-11120] - Remove the broken fax inlinegif feature
- [MD-11125] - Prometheus database is lost on each host update
- [MD-11133] - Provisioning log shows that Grandstream is not supported
- [MD-11139] - Remove connector datasource "mobydick"
- [MD-11140] - Empty mail body and attached pdf not faxed if "fax with content of the mail" configured
- [MD-11153] - Can't get recordings via REST api /services/monitor
- [MD-11155] - Sending fax via Beronet trunk failed
- [MD-11157] - Increase length of username for fax 027mod_mailusername
- [MD-11158] - Apache2 default page shown if UI is deactivated on second interface
- [MD-11168] - Do not send rtcp stats to proxy localhost port
- [MD-11170] - A snom M700 shows up as "yealink dect" in the gateway list
- [MD-11177] - Missing call activity after dropping call to another team
- [MD-11181] - Beronetcard after update to 18.02 no audio
- [MD-11194] - A database restore is not cleaned up when doing an update at the same time
- [MD-10367] - Remove deprecated yealink DeviceHandlers
- [MD-10546] - Prune old pbx images on each system startup
- [MD-10922] - Cleanup BeroNet device handler code
- [MD-10933] - Remove "skip auto restart" feature from on-premise hosts
- [MD-10971] - Implement ldap proxy support for Yealink DECT system
- [MD-11038] - Improve prometheus metrics
- [MD-11069] - Upgrade asterisk to version 13.23.1
- [MD-11078] - Enhance beroNet Provisioning for Cloud usage
- [MD-11109] - Easier configuration for Fax-Tagline streamline Fax-Caller-ID
- [MD-11115] - Enable/Disable SIP ALG on the host
- [MD-11118] - Implement provisioning for Yealink W60B DECT gateway
- [MD-11134] - Enhance instance vpn gateway for instance-to-site connections
- [MD-11151] - Tune kamailio settings based on availiable memory
- [MD-11154] - Unregister a sip peer if we can not reach it on the proxy because of a missing TLS connection
- [MD-11156] - Configure and autoscale some prometheus parameters
- [MD-11179] - Add idle metric to license renegotiation code
- [MD-11180] - Add more network tools to host / containers
- [MD-11189] - Increase consul max open file limit


## Release 18.02 (07.11.2018)

**Overview**

- Mobile apps can now be paired using login credentials.
- Increased security with Firewalls between instances.
- New users can now be sent e-mail invites from an already configured phone system instance.
- Snom M700 systems now support LDAP (no TLS, interface must be set to "mixed"). 
- Repaired Gateway provisioning via the GUI
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

Initial Release of pascom Version 18.

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