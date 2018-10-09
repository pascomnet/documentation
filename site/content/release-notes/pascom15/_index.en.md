---
title: pascom Server 15
description: With the new pascom version 15 Release, numerous new and improved functions are now available
weight: 998
---

{{% notice tip%}}
Should you have any questions please use the [Community Forum](http://www.pascom.net/forum/ "Visit our Forum").
{{% /notice %}}

{{% notice warning %}}
**Important Notice to this Update:**   
- We will not provide the firmware for outdated Aastra/Mitel DECT systems anymore. All Aastra/Mitel DECT firmware files (previously provided via TFTP) will get removed during the migration.
**Import notice regarding mobydick 7.13 and 7.14:**  
- mobydick 7.13 and 7.14 will no longer be supported.  
- New versioning scheme: XX.YY - XX is the main version, YY referes to bug fix versions.                              
- New brand name: **pascom** replaces **mobydick** as product name.
- 32bit systems will no longer be supported. Compatible systems will automatically updated to 64bit
- autoprovisioning of Cisco SPA112 is *NOT* supported in pascom cloudstack.
{{% /notice %}}


## Release 15.12 (04.07.2018)

**Change Overview**

* Database size restricted for Backups
* Connector improvements / error fixes
* Base configuration for Yealink firmware 82.X and later: telephones no longer switch between reachable and unreachable 
* ISO Backup once again functions correctly 
* Implemented a work around script for resolving Deutsche Telekom DNS problems, when the Registration Server IP Address has been changed

**MODIFICATIONS:**

* MD-8397 - Prevent huge database dumps
* MD-8805 - Optimize manual snom m700 input form
* MD-8914 - Full ISO-Backup failed
* MD-9550 - MS edge will add 'null' to trunk if field was empty
* MD-9598 - job for factory resetting a phone shows error but works
* MD-9774 - Implement new trunk template for 1und1 Versatel
* MD-9876 - Basic configuration not shown via TRC060101
* MD-9881 - Toplink xpress community SIP trunk template
* MD-10132 - Community cloudstack shows "pascom Netzwerktechnik"
* MD-10229 - Telekom SIP trunk fails if remote ip-address changes
* MD-10291 - Connector importer updates users without extension
* MD-10293 - Softphones not reassigned after deleting users and import
* MD-10296 - Aastra/Mitel reboots after roaming
* MD-10335 - Clicking on a pluginscript entry in "Last Changed" opens wrong trc
* MD-10471 - Length of Intercom User Entrys is too short
* MD-10480 - Improve Yealink base configuration for new firmware versions (82.X and later)
* MD-10534 - Change sipgate team template username
* MD-10557 - Can't use umlauts in action templates
* MD-10611 - Restoring database backup failed
* MD-10634 - WebUI inaccessible after migration


## Release 15.11 (30.04.2018)

**MODIFICATIONS:**

* MD-9847 - Trunk state not reliable rest api
* MD-10302 - Prevent usernames without domain in cs proxy
* MD-10303 - Private phonebook entries are shown like global ones
* MD-10348 - Allow mails with umlauts in the phonebook
* MD-10356 - Cloudstack container backup should fail if too large


## Release 15.10 (09.04.2018)

**MODIFICATIONS:**

* MD-8119 - Options are not working on spying a channel in Queuemetrics
* MD-9317 - Connector deletes and recreates internal phonebook entries on each run
* MD-9879 - Add subjectAltName to Cloudstack self signed proxy certificate
* MD-10185 - Wrong input highlighted after changing fax extension to invalid one
* MD-10194 - Link to overview in virtual fax device not working

**From LTS 7.11.08:**

* MD-9168 - Apply telephony and system cleanup task corrupts datamodel
* MD-8628 - TabWidget children does not remove subscription when the flex panel is closed
* MD-8703 - Toast in flex panel is broken


## Release 15.09 (19.03.2018)

**MODIFICATIONS:**

* MD-10014 - Improve prompt of dialplan loop detection
* MD-10031 - Fix typo in /services/apidoc
* MD-10071 - Missing device info if receiving call while call forwarding is active
* MD-10105 - Correct typos in cloudstack job results
* MD-10144 - Exception after deleting a gateway assigned to role
* MD-10146 - Wrong error message after entering wrong fax extension
* MD-10039 - Hide button to test connection if exchange server connector is not configured
* MD-10082 - Update gloox version to 1.0.20 in tapi


## Release 15.08 (06.03.2018)

**MODIFICATIONS:**

* MD-9924 - Confirmation dialog for deleting an instance has wrong text
* MD-10013 - Can't delete call forwarding that contains special chars
* MD-10016 - Increase possible length of mailserver hostname
* MD-10022 - Dial not successful if softphone name contains a +
* MD-10111 - classic Client Softphone does not login on certain environments
* MD-8363 - Increase verbosity for failed mail to fax


## Release 15.07 (22.02.2018)

**MODIFICATIONS:**

* MD-10072 Fixed Aastra DHCP provisioning (static ip reservation for the OMM stations)


## Release 15.06 (19.02.2018)

**MODIFICATIONS:**

* MD-8662 - Ignore not assigned devices for changing follow me settings for many devices at once
* MD-9516 - Xmppserver AstdbManager does not accept a dash in a key
* MD-9755 - Conference via client will not work with new Yealink firmware 82
* MD-9756 - Snom D785/D120 downloading language file failed for version 10.1.17.0
* MD-9830 - Wrong encoding within voicemail notification text via email
* MD-9901 - phonebook import via rest is broken
* MD-9902 - Softphone crashes in Classic Client


## Release 15.05 (29.01.2018)

**MODIFICATIONS:**

* MD-8571 - Gateway status in webinterface was broken
* MD-9654 - Do not allow to delete default music on hold class
* MD-9676 - Import contacts from shared mailbox via exchange connector
* MD-9724 - Manual update of mobydick container will not resets RAM anymore
* MD-9836 - Introduced more dynamic hints for pascom based redirections
* MD-9880 - Wrong syntax for inbound rule within Tele2 trunk template
* MD-9900 - Change 'mobydick' to 'pascom' in TRC210909
* MD-9671 - Remove AAstra / Mitel firmware from distribution


## Release 15.04 (15.01.2018)

**MODIFICATIONS:**

* MD-5956 - Improve REST documentation for location management
* MD-9409 - Validate IPs in cloudstack webUI
* MD-9486 - Wrong logo on 404 page in cloudstack
* MD-9716 - Shared roster does not work as expected when deleting a role
* MD-9753 - Upgrade Qt version to 5.9.3 in softphone
* MD-9760 - Avoid empty P-cs-cid SIP-header when sending a fax
* MD-6258 - Improved Active Directory Connector template - disabled users are now ignored
* MD-9350 - Integrate certified asterisk 11.6-cert18
* MD-9493 - Implement new trunk template for partner BERGNET GmbH


## Release 15.03 (05.12.2017)

**MODIFICATIONS:**

**md-cmd**

* Improved recently changed default configuration linking.
* Added identification support for Yealink and Cisco Endpoints with new MAC address format.
* Plugin script names are now validated less strictly.
* Action conditions are now simpler to find via drop down menu.
* Free Community Edition phone systems no longer display an Appliance ID.
* Improved FlexPanel modification workflows.
* DHCP configuration is now recreated after each update.
* Added additional information to Trunk template exports.
* Trunk template names have been unified.
* Outdated recordings can now be deleted via Cronjob
* Improved reliability of REST API trunk status display
* Faxes containing more than 15 pages will no longer be displayed in their entirety in the Web UI.
* Improved Snom M700 DECT sender provisioning
* Deleting a Connector Profile now also deletes all associated Cronjobs.
* Local Yealink telephone book will now also display transferred external phone numbers
* Improved LDAP Server startup performance after system restarts
* Improved language localisations

**md-xmppserver**

* Fixed Originate Dials display in connection with conference rooms

**md-client**

* FollowMe settings are once again available in the client
* Client now also display available analog telephone within the device list
* Optimised Server to client communication

**md-firmware**

* Monitoring Tool iotop is now included

**cs-proxy**

* Fixed Proxies Last problems issue

**cs-controller**

*  Protocols within cloudstack instances now statically UDP, TCP, even after applying telephony settings.


## Release 15.02 (12.10.2017)

**MODIFICATIONS:**

**md-cmd**

* New SIP Provider Template for Nexbridge (UK).
* New SIP Provider Template for UPC (Austria).
* New SIP Provider Template for amplus (Germany).
* Updated Frtz!Box Trunk Template.
* Udated Telekom Magenta SIP Provider Template to use TCP per default instead of UDP.
* Trunks can now be connected via TLS.
* Improved incoming fax receipt stability, particularly for large fax documents.
* Deactivated IAX modems Jitter buffer to improve Faxing performance.
* Fixed issue pertaining to sending faxes to internal fax numbers.
* Fixed audio problems relating to call forwarding and Telekom SIP Trunks.
* Fixed Snom Telefon call forwarding issues in connection with Telekom and QSC Trunks.
* By a Database restore, Music on Hold will also be included in the restore process.
* Fixed connector import error when a user already has an assigned softphone.
* Fixed issue relating to MS Exchange / Office365 integration.
* Plugin script names may now only contain alphanumeric characters (a-z & 0-9).
* Improved TRC210202 (Call history data clean up) and TRC080703 (Users > Call Forwards) validation.
* Improved Connector Import Log messages.
* Fixed roaming issue via \*44 extensions.
* Fixed SIPgate trunk phone number signaling issue.
* Fixed issue relating to configuring a server based call forwarding.
* Fixed Cisco SPA112 provisioning problem .
* Resolved issue relating to editing a beroNet Gateway config, should the Gateway not be reachable.
* Snom C520-WiMi Conference phones can now be manually configured and therefore deployed.
* By cloudstack installations, beroFix cards will no longer be suggested as a network gerate.
* Fixed Snom M700 DECT handset base station assignment issue.
* The PUI (XML-Menu) is now called "pascom" as opposed to "Menu"
* Telephone books and the "pascom" PUI menu are now easier to access.
* Improved provisioning of Snom telephones.
* Cloudstack instances now no longer attempt to start ntpd (Network Time Protocoll Deamon).
* Help link within WebUI now more prominently, more visibly placed.

**md-client**

* Recording playbacks will now automatically stop as soon as the associated Journal activity is closed.

**md-xmppd**

* When a conference is entered via Originate Dial, false events will be sent. The client will not display any call activity (journal entry) in this scenario.
* Improved speed and performance of Apply Telephony Configurations, particularly noticeable in larger IP PBX solutions.

**cs-proxy**

* Fixed the seldom occuring Memory-Leak problem with XMPP connections.
* Gateway configuration can now be omitted by manual Proxy IP configurations.

**cs-host**

* Kernel-Version pinned to avoid Kernel Panic in conjunction with lxc

**cs-controller**

* Updated "consul" module version to resolve a logging problem
* Automatic contain start up can now be skipped during the cloudstack system start

**ex-mobydick**
* Integrated Asterisk Version 11.6-cert17


## Release 15.01 (03.08.2017)

**MODIFICATIONS:**

**md-cmd**

* New "Telekom DeutschlandLAN SIP Trunk" has been added.
* The Exchange Connector now also accepts (optional) self-signed certificates.
* Trunks can now optionally be configured with TCP instead of UDP.
* Improved behaviour of external to external call forwarding (Call-Deflection).
* Improved English localisations.

**cs-controller**

* Fixed the problem with the validation of Proxy Network interfaces.

**cs-host**

* Fixed the installation issue on HyperV Hosts.


## Release 15.00 (28.06.2017)

{{%notice note%}}
**Feature Release:**  
- Exchange Address Book Imports and Synchronisation Function.  
{{% /notice %}}

**MODIFICATIONS:**

**md-cmd**

* New Connector template for importing Microsoft Exchange address books
* New "repeat simulation" button for the Connector Configuration.
* Fixed Grandstream Gateway HT701 and HT802 problem.
* New (Community-) Trunk Template for VoIP Provider Teledata.
* Fixed issue relating to support for Snom M700 multi-cell sytems within the cloudstack.
* Fixed Snom M700 system connectivity issues when TLS is activated.
* Increased stability of Connector imports function.
* Increased stability of calls via Mobile Hub

**md-client**

* Improved language localisations.
* Desktop client is now available in Italian.
* Increased reliability of the DATEV master data cache sync.
* Action URLs can not be opened from within the client when the URL contains a label variable.

**cs-controller**

* Repaired "cs container list" command.
* Fixed smaller UI Problems
* The network interface for a proxy can now be selected from a drop down menu.

**cs-proxy**

* The "ssldump" and "tcpflow" tools are now available for debugging.
* Quicker load speeds for Yealink Telephone PUI menus (XML menus) when TLS is active.
* Operating system updated to Ubuntu 16.04

**cs-host**

* When the cloudstack is installed on a beroNet Appliance, mounted beroNet cards will be detected and can be connected.
