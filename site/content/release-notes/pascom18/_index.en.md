---
title: pascom Server 18
description: With the new pascom version 18 Release, numerous new and improved functions are now available
weight: 996
---

{{% notice tip %}}
Please use our check list in our detailed [Upgrade Guide]({{< ref "/server/upgrade" >}}).
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

## Breaking Changes

{{% notice changes%}}
This section explains the changes that you must consider when migrating to pascom 18
{{% / notice%}}

See the checklist in the detailed [Upgrade Guide]({{<ref "/server/upgrade">}})

* The **pascom Classic Client** and the **FlexPanels** are no longer supported by pascom 18.
* **Patton Gateways** are no longer supported. If you still have ISDN in use, you should think about switching to a SIP connection. If you use Patton gateways for your analog fax machine, etc., the [Grandstream ATA converter]({{<ref "/gateways/grandstream">}}) is a good and cheap alternative.
* Due to lack of encryption the support for the **Siemens Unify optiPoint** model has been discontinued.
* Due to the limitation of the **cisco SPA 112 Gateway** to exclusive use cisco certificates, the support with pascom 18 has been discontinued.
* **Connector**: Reading files from an SMB share is no longer supported. Instead, the import file can now be uploaded or queried from a URL.
* **Print to Fax** has been removed. Alternatively, the pascom client can now monitor a spool directory and send stored PDFs as a fax.
* **Beronet Gateways** require the latest firmware version 16
* **pascom Cluster** has been discontinued
* **pascom SOHO Server** is no longer compatible. Please perform a hardware upgrade to the [pascom Appliance]({{< ref "server/appliance" >}}) or use the pascom.cloud.

## Known Issues

{{% notice issues%}}
These issues are known to us and we are already working on a solution
{{% / notice%}}

* [MD-11892] - Grandstream ATA HT802 in new MAC Range C074AD * are recognized as a phone, not a gateway


## Release 18.12 (27.11.2019)

**Overview**

- Let's Encrypt certificates function correctly again.
- Recordings can be recorded separately by caller and called party by setting a channel variable.
- The device list now directly displays whether a mobile device is paired or not.

**MODIFICATIONS:**

- [MD-11788] - Failed to request let's encrypt cert because of ACMEv1 end of life
- [MD-11776] - Record each audio stream to separate files during monitoring a call
- [MD-11731] - Show pairing status of mobile directly in device list
- [MD-11648] - Migration of xmpp server failed because of md_xmppserver_71710_01.php
- [MD-11768] - PHP function 'getClass' is wrongly called with 'self' instead of '$this'

## Release 18.11 (17.10.2019)

**Overview**

- Added support for Grandstream GRP, WP plus devices with new MAC address format
- Added provisioning for Snom M900 DECT Gateway 
- Activated T38 Support
- Updated Asterisk to Version 13.27.0
- Added connector function for adding generic devices

**MODIFICATIONS:**

- [MD-11004] - Display warning if the server time is different from mypascom time
- [MD-11341] - "Home" button during loading points to wrong URL
- [MD-11503] - Re-enable spandsp T.38 support in asterisk
- [MD-11511] - Invalid phone presence when the GSM fallback is used
- [MD-11416] - Integrate Grandstream WP 820 WiFi phone
- [MD-11481] - Notify administrator if onsite pbx update failed
- [MD-11597] - Can't pair CSP host again after unpairing it in erp
- [MD-11605] - Add "P-Called-Party-ID" to trunk to number determination
- [MD-11490] - Fix the library for leader election
- [MD-11584] - dnsmasq not automatically starting on second interface of hardware appliance
- [MD-11535] - Update asterisk to 13.27.0
- [MD-11598] - Introduce SIP option field for mobile devices
- [MD-11608] - Import and synchronize generic sip devices via connector
- [MD-11517] - Error in browser console after reload in phone systems section
- [MD-11545] - Remove the REST end point for XLSX export of our journal
- [MD-11554] - Remove link in pascom instance wizard
- [MD-11559] - Change Yealink DECT provisioning template setting custom.handset.auto_intercom
- [MD-11562] - 1&1 versatel, Toplink xpress and Bergnet trunk templates are broken
- [MD-11565] - Can't apply telephony after migration because of missing sip.password in berofix gateway
- [MD-11540] - Instance wizard does not show a message if password mismatch
- [MD-11621] - Enable PUI menu for Grandstream GRP models
- [MD-11623] - Activate remote control fror Grandstream GRP phones
- [MD-11650] - Broken licence without working subscription details button
- [MD-11653] - Django corsheaders dropped support for python 2.7
- [MD-11655] - Can not install or upgrade pascom 18.10 on a SOHO appliance
- [MD-11629] - CSUI white screen in prometheus not running
- [MD-11172] - Improve layout of trunk template overview
- [MD-11640] - Improve Mitel / aastra DECT gateway basic configuration template
- [MD-11646] - Server build fails because of grafana plugin download server problems
- [MD-11586] - pascom.cloud host is complaining about licence server
- [MD-11692] - Phone presence has invalid state
- [MD-11694] - XMPP server can't boot because of deadlock
- [MD-11702] - Provide more info about the push message type
- [MD-11711] - Add new MAC vendor ID for Grandstream phones
- [MD-11284] - Improve QSC template
- [MD-11590] - ISO upload process bar stuck
- [MD-11701] - Support for Snom M900

## Release 18.10 (05.08.2019)

**Overview**

* Calls can once again be transferred back to the active extension in order to switch the active calling device     
* Improved update and backup uploads as well as optimising overall required disk storage        
* Trunk prefixes are now correctly set within the call histories of Outlook, Android, Apple and DATEV contacts      
* Self-signed certificates will be regenerated upon changes to the FQDN     
* pascom fax server is now permanently available        

**MODIFICATIONS:**

- [MD-10990] - Can't transfer to second device of same user
- [MD-11114] - Improve loading screens in management ui
- [MD-11196] - Uploading a csb image inside the instance causes problem
- [MD-11224] - Calling from journal does not work if a phone number is resolved from Outlook or Apple contacts
- [MD-11266] - Show a proper error page in CSUI if we get a 500 response from a API call
- [MD-11290] - Gateway status confuses customers
- [MD-11309] - Call deflection not working (with rkom trunk)
- [MD-11318] - Broken prompts during roaming
- [MD-11324] - Too strict E-Mail validation in phonebook
- [MD-11337] - CSUI Wizard after installation can be bypassed by changing the url
- [MD-11353] - Sent faxes not shown in web UI
- [MD-11430] - Improve details of interface in CSUI
- [MD-11460] - Check free disc space before update
- [MD-11461] - Decrease swap file of disc
- [MD-11462] - Validate ISO before update of pascom
- [MD-11500] - import-raw-3.json not found after exchange import simulation
- [MD-11502] - Display license content even if it is invalid
- [MD-11504] - Renew self signed cert if FQDN changes
- [MD-11505] - Display alert on System page when the license is invalid
- [MD-11523] - Grandstream HT802 should not use opus codec
- [MD-11524] - Automatically cleanup asterisk core dumps on apply telephony
- [MD-11525] - Grandstream GXP16XX reboots after short time
- [MD-11544] - Sometimes statemap.txt has no ip entry for instance
- [MD-11555] - Consul kv keys are missing after instance delete
- [MD-9199] - Fax service should run from the beginning
- [MD-10635] - Show a reconnect page if the management address is changed
- [MD-10967] - Setupui "done": Show a manual access link after 1 minute
- [MD-11531] - Update consul
- [MD-11592] - Prometheus should scrape consul metrics


## Release 18.09 (28.06.2019)

**Overview**

- Improved re-pairing process in the case of licence problems
- Migrations connected to the Yealink W60B are now performed correctly
- Improved reliability of the trunk registration process after a trunk disconnect

**MODIFICATIONS:**

* MD-11501 - you cannot re-pair a license if no license is configured in csd
* MD-11552 - Yealink W60B DECT migration error "Port count mismatch"
* MD-11538 - Retry asterisk sip trunk registration periodically


## Release 18.08 (13.06.2019)

**Overview**

* Implemented a wide range of Management Interface and Setup Wizard improvements
* Grafana is now designated as "Analytics"
* Added IPAustria community SIP Provider template and improved a number of other SIP provider templates
* memberOf can now be read via the UCS Connector
* Improved reliability performance for adding your own mail server and sending test mails
* Yealink W60B DECT now supports 8 handsets
* Update Grandstream HT-802 provisioning template to guarantee reliable registration
* Calls can now be placed via the REST API
* Added connector setting to also use sources with insecure certificates (optional)
* Generic SIP devices now also receive LDAP access credentials in order to allow telephone book access

**MODIFICATIONS:**

- [MD-10898] - Improve validation of phone systems name
- [MD-11065] - Improve subscription details and alerts
- [MD-11096] - Can't hangup call via rest api
- [MD-11111] - management UI improvements and translation
- [MD-11245] - Add "Mitel" to aastra dect gateway name
- [MD-11247] - Remove "Extend Network Interface" in interface list
- [MD-11253] - Improve button layout in wizard
- [MD-11256] - Weird translation for "Skip configuring voip phone"
- [MD-11263] - Make description of default role more generic
- [MD-11265] - Grandstream HT-802 Gateway registration loss after instance reboot
- [MD-11289] - Need another inbound rule in telekom trunk template
- [MD-11291] - PUI menu not fully translated
- [MD-11294] - Change RKom template number determination
- [MD-11320] - Beronet capi with BF2S02FXS module and pascom 18
- [MD-11322] - Talk time vs. duration looks invalid
- [MD-11343] - Add more than 5 heandsets to Yealink W60B DECT
- [MD-11354] - Add mobile variable to LDAP user import connector profile
- [MD-11357] - Change Mnet template ringtone generation to SIP only
- [MD-11359] - Caller name not updated after transfer
- [MD-11376] - Management UI grafana shows wrong home dashboard sometimes
- [MD-11395] - Warnings in CSV importer (maybe only cosmetic)
- [MD-11397] - Remove 'mobydick' from auerswald basic configuration
- [MD-11400] - Grafana timestamps with wrong timezone
- [MD-11401] - Instance can't be started after restore of old backup
- [MD-11403] - Wrong language in instance wizard invitation mail for users
- [MD-11411] - Setup fails on machines with lots of RAM and small disk
- [MD-11413] - Add 1.5 GB to edit pbx management form
- [MD-11427] - Limit amount of asterisk core dumps
- [MD-11456] - AD connector import failed because of unexpected data set
- [MD-11458] - Improve csd performance when the license in refreshed
- [MD-11465] - Memory of instance not accepted anymore after update
- [MD-11472] - updatesmtp job fails if testmail and custom mailserver are used
- [MD-11475] - Leader election is unreliable
- [MD-11483] - Amazon ec2 AMI setup fails because volume is to small
- [MD-11508] - Aastra/mitel device migration failed because of empty 066dev_id
- [MD-10605] - Make LDAP groups usable in our UCS connector
- [MD-11028] - Add possibility to skip "user" part in instance-wizard
- [MD-11255] - Improve xmppserver code quality
- [MD-11259] - Introduce place holder image until QR code is shown
- [MD-11326] - SetupUI translation and improvements
- [MD-11351] - Different password lengths in client and webui
- [MD-11356] - Rename new Grafana Feature to "Analytics"
- [MD-11425] - Expose ldap connection settings for generic sip devices
- [MD-11432] - Integrate / Update trunk templates for swiss providers
- [MD-11435] - Integrate "IPAustria" community template
- [MD-11443] - Register each proxy in the consul with a unique tag
- [MD-11447] - Tune kamailio settings based on availiable memory 2
- [MD-11448] - Restart apache in interfaces when logrotate runs
- [MD-11451] - Adjust global trunk register attempt limit
- [MD-11453] - Fix advertised rtp ip when using AWS elastic ip or AWS nlb
- [MD-11457] - Allow self-signed certificates in Fetch-from-Url Connector
- [MD-11484] - Add htop utility to host system


## Release 18.07 (10.04.2019)

**Overview**

- Improved remote CTI control for various desktop telephones
- Integrated LDAPs for Yealink Telephone and DECT systems
- Implemented LDAP support for Mitel / Aastra systems
- Added compatibility support for Snom M700 DECT firmware 450B5 and experimental LDAPs support
- Improved provisioning and remote CTI support for Auerswald telephones
- Upgraded to Asterisk 13.25.0
- Kernel updated to 4.4.0.143
- Uploaded telephone firmware files are no longer deleted after a server update
- Telephone status in the client will now display "unavailable" should the user only have a mobile telephone AND configured their FollowMe settings as "off"

**MODIFICATIONS:**

* [MD-10956] - Host shutdown or reboot gets stuck and other kernel issues
* [MD-11131] - Download of big database backups failed
* [MD-11163] - pbx instances log to rotated file after some time
* [MD-11227] - Improve error message for failed phonebook entry creation
* [MD-11317] - Auerswald device handler throws error during reboot task
* [MD-11321] - Transfer calls not working with new Yealink firmware *.84.0.15
* [MD-11342] - Fix auerswald client proxy remote control code
* [MD-11352] - Task for applying iptables rules is not invoked
* [MD-11385] - Enabled LDAPS in Yealink DECT and Desktop phone provisioning profiles
* [MD-11404] - Previously uploaded phone firmware files lost after update
* [MD-11414] - Test M700 450B5 firmware and LDAP
* [MD-11426] - Buffer overflow in res_mobydick if we have locations with id greater 9999
* [MD-11433] - Throttle slapd restarts when we create/delete multiple instances automatically
* [MD-11440] - Enhance Snom basic config to show phone and mobile number via LDAP
* [MD-8242] - Remove Gateway and Netmask Fields from some or all Gateways
* [MD-10201] - Deploy Ldap configuration for Mitel DECT systems
* [MD-11161] - Change cron job pre- and postscript user to be asterisk
* [MD-11254] - Simplify proxy services startup environment files
* [MD-11260] - Connect mobile phone presence and follow me state
* [MD-11348] - Run consul as separate user instead of root
* [MD-11378] - Update asterisk to release 13.25.0
* [MD-11386] - Increase php memory auto scale factor
* [MD-11387] - Update consul to the latest 1.0.8 version
* [MD-11393] - Integrate kamailio_exporter to get more sip metrics


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