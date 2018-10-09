---
title: mobydick Server 7.11
description: ith the new pascom version 15 Release, numerous new and improved functions are now available
weight: 999
---

{{% notice tip%}}
Should you have any questions please use the [Community Forum](http://www.pascom.net/forum/ "Visit our Forum").
{{% /notice %}}

## Release 07.11.08

{{%notice note%}}
Bugfix Release, Published: 05.03.2018
{{% /notice %}}

### Modification

* MD-10110 Remove news box from LTS
* MD-9770	Yealink new vendor prefixes for LTS
* MD-9753	Upgrade Qt version to 5.9.3 in softphone
* MD-9363	Missing time in notification and call activity in a conference room
* MD-9342	LTS: Asterisk error if agent paused in all queues and not logged in
* MD-9168	Apply telephony and system cleanup task corrupts datamodel
* MD-9143	Location manager sends unnecessary SetLocation
* MD-9071	Wrong Channel Event order if you enter a conference with an originate dial
* MD-8966	Apply telephony is very slow on appliances with big shared groups
* MD-8915	All builds are broken due to changed oracle download policies
* MD-8909	Catch doorcall (analog device) and send dtmf without blocking a user (call/device)
* MD-8882	Wrong default outgoing trunk prefix gets added after callback
* MD-8863	Backport core dump for asterisk and related icinga check
* MD-8822	Channel variable is not unset on xmpp server
* MD-8789	broken beeperr in lts
* MD-8703	Toast in flex panel is broken
* MD-8628	TabWidget children does not remove subscription when the flex panel is closed
* MD-8532	QueueStatusAction breaks when apply telephony config is triggered
* -8194	improve action condition dropdown list
* MD-7624	asterisk error occurred, if you unpause an agent from a queue


## Release 07.11.07

{{%notice note%}}
Bugfix Release, Published: 20.01.2017
{{% /notice %}}

### Modification

**md-cmd 7.11.07**

* Improved "Applying Telephony Configurations" speed, particularly by very large phone systems
* Queue names are no longer permitted to contain spaces. Configured queues must be renamed upon updating
* Repaired the Spy-with-Pin on a channel function

**md-xmppd 2.08.02**

* Internal modifications

**md-xmppserver 2.10.06**

* Implemented automatic deletion function for older call history logs/ entries

**md-client 3.06.07**

* Implemented deactivate option for automatic queue statistics update / refresh
* Fixed the rare crashes resulting from performing a mobydick softphone held call retrieval
* Solved occasionally occuring hangup issues

**md-sound 1.00.03**

* Automatic "to mono" conversion of Prompts and Music on Hold uploaded in Stereo format

**md-tapi 2.03.03**

* Increased the TAPI Interface setup Timeout to 3 seconds
* TAPI interface now reports additional Line-Address-Capabilities which enhances compatibility with numerous ERP Systems


## Release 07.11.06

{{%notice note%}}
Bugfix Release, Published: 10.08.2016
{{% /notice %}}

### Modifications

**md-cmd 7.11.06.R**

*   The IP address of a Snom M700 Gateway, as configured in mobydick, can now be changed - WARNING: The IP Address must also be manually reconfigured on the Gateway itself
*   The Excel and CSV export call analysis functions again
*   A call distributor can now be reselected from within an action. 
*   Call Labels must now have unique names.
*   Added trunk template for COMINGOLSTADT
*   Updated Easybell trunk template
*   New Trunk template for Sipcall.ch
*   Time Period Action Conditions template "Time Name" changes are once again possible
*   It is now possible to change the pause reason of an agent without having to repeal the previous pause status. 
*   The Music on Hold (MoH) configuration is now correctly generated when an application is used instead of files
*   File based MoH will now be played in alphabetical order
*   Minor UI modifications and improved translations
*   "NO" can once again be selected when configuring the authentication method of a LDAP connector template
*   Simulating connector imports tool bug has been fixed

**md-xmppserver 2.10.05.R**

*   A call activity is now display when one calls a call distributor
*   XMPP plugin scripts can now optionally check basic-Auth

**md-client 3.06.06.R**

*   A launcher entry script is now included for Ubuntu distributions
*   It is now possible to optionally filter out System Calls from the Call Journal
*   File transfers now longer overwrites existing files, but rather generates a new unique filename
*   Pause reasons can now be switched within the client without needing an unpause.

**md-sound 1.00.02.R**

*   Updated the German (DE) language prompts 


## Release 07.11.05

{{%notice note%}}
Bugfix Release, Published: 16.06.2016
{{% /notice %}}

### Modifications

**md-cmd 7.11.05**

*   "Back" button issues while configuring QueueMetrics fixed
*   Fixed the problems with duplicated prompt files when updating from older versions to mobydick 7.11
*   The fallback extension is bow applied even when **NO** incoming rules can be matched or are configured.
*   Improved entry validation for Trunk and Connector templates
*   Resolved the confused Send Call Completed Elsewhere behaviour in conjunction with the setting "sys.asterisk.configure.dialoptions"
*   The prompt "Dialling Emergency Number XYZ" can now be deactivated via the setting "sys.asterisk.dialplan.global.emergency.playback"
*   Updated 1und1 SIP provider template
*   By call transfers, prompts / announcements will now be playedback in the correct channel language.
*   Optimised installation process to resolve problems stemming from time zones further east (e.g. MSK)
*   Fixed the problem related to ISDN via SIP devices connected to Patton Gateways
*   The call forwarding phone notification when setting call forwarding via *-Code via the phone will now be consistently displayed, even when the prompt is not fully play backed. 
*   Improved the BLF behaviour for queue agents pause / unpause
*   The "CSV speed Dial Sync" has been repaired and works correctly again.

**md-xmppserver 2.10.04**

*  Active pause reasons are no longer lost when applying telephony configurations
*  Deleted server side Event Scripts are now removed more cleanly
*  New generic User Event for Event Scripts

**md-client 3.06.05**

*   The transfer dialog can now be used for 2 digit extension numbers

**md-snom-data 3.07.02**

*   Resolved the problem with Snom M700 migration scripts when updating

**ex-mobydick 2.10.03**

*  The Job Engine will now be restarted once the mobydick installation has been completed
*  Resolved Asterisk Deadlock problems relating to LUA functions
*  Resolved the issue relating to the generation of configurations during an unattended installation WITHOUT serial interface output.


## Release 07.11.04

{{%notice note%}}
Bugfix Release, Published: 07.04.2016
{{% /notice %}}

### Modifications

**md-cmd 7.11.04**

*   New feature: an agent can now log themselves in / out or pause themselves in queue directly via the XML menu on their telephone
*   Fixed the issue related to the applying of telephony configuration when there are no standard outside line (trunks) or Emergency numbers are configured.
*   Resolved the issue with incoming calls over Patton gateways
*   Fixed the problems with Mail2Fax control characters 
*   Fixed the problem with delivering provisioning data with Snom Firmwares containing a "6" in the version number
*   Updated trunk templates for Fritzbox, Telekom MagentaEINS, Flowroute Enterprise SIP Trunking and Easybell
*   When provisioning Snom M700 DECT base stations, the system will now receive the correct mobydick IP address as its SIP Registrar
*   Resolved the problem relating to Snom M700 Firmware & updating
*   Yealink telephones no longer reboot while in roaming operation

**md-xmppserver 2.10.03**

*   More XMPP-Events now contain Label / Skill information
*   Expanded PhonecallRecords with more data
*   Fixed the issue that caused some calls not to appear in call histories (journal) 
*   Improved number resolution within the telephone book
*   PhonecallRecords and Eventlog-Entries can now be setup with individual data sets
*   Improved Logging 
*   Resolved the issue that caused the false time stamp in Queue Calls under certain circumstances

**md-client 3.06.04**

*   Outlook Synchronisation is now more stable

**ex-mobydick 2.10.02**

*   Optimised the speed of various LDAP requests
*   LUA Queue Scripts can force timeouts of calls in a queue
*   Fixed the problem with the Asterisk "Ringall" call strategy


## Release 07.11.03

{{%notice note%}}
Bugfix Release, Published: 02.03.2016
{{% /notice %}}

### Modifications

**md-cmd 7.11.03**

*   beroNet FXO modules are now support
*   beroNet CAPI support has been integrated
*   Improve fax sending stability 
*   Resolved issue relating to Snom / Yealink LDAP parameters when synchronising systems
*   Expanded Snom base configurations on numerous  "fkey" and "label" entries
*   Added SIP Provider template for US VoIP Provider "Flowroute"
*   Added SIP Provider template for Deutsche Telekom "DeutschlandLAN IP Voice" SIP trunks
*   The optional script for outbound calls is now found under the "Basic Data" menu and no longer under "Account"
*   Lua-Syntax is not supported for Action Scripts
*   Improved script editor (dialplan, Lua action scripts, server side event scripts etc).
*   Fixed the issue with blind / unattended transfers and the the mobydick softphone
*   Icinga now checks for looping objects (i.e. a call) within the dialplan
*   Improved Snom M700 support (stability, LDAP, number resolution)
*   Improved various translations
*   The astdb is now included in database backups and will also be restored
*   Fixed the issue when sending Voicemails to E-mail
*   Call Groups can once more be deleted without causing errors
*   The Cluster Interface IP address will now be more clearly displayed under the Appliance > Telephony menu
*   Snom M700 now also functions with a cluster
*   IAX modems now connect themselves to the Cluster shared IP address

**md-xmppd 2.08.01**

*   Resolved deadlock problem

**md-xmppserver 2.10.02**

*   Added a run time environment for server-side event scripts
*   Resolved the Windows Client update from 7.11.01 to 7.11.02 problem
*   Stability improvements
*   API improvements when hanging up calls 
*   In-band file transfers can now be optionally enforced from within the client - this resolves issues relating to file transfer problems and NAT scenarios

**md-client 3.06.03**

*   The "active call" graphical popup can now be pinned to permanently be displayed, even when the main client window is in focus
*   Added French translation
*   Improved Serbian translation
*   Numerous UI modifications

**md-snom-data 3.07.01**

*   New Snom M700 Firmware

**md-updater 1.11.01**

*   Stability improvements

**ex-mobydick 2.10.01**

*   Integrated OpenLDAP modifications for the Snom M700
*   Fixed Skills Based Routing errors stemming from high load operations
*   mobydick ISOs are now executable from USB sticks (hybrid ISO)
*   The backup process now also generates a hybrid ISO
*   Tool for pre-configuring an automatic mobydick installation is now included
*   Fixed problems relating to ISO backups and excluded folders
*   safe_asterisk logging is now active (log file: /var/log/asterisk/safe_asterisk.log)
*   Added "Speex" codec
*   Added libspandsp
*   Asded Lua interpreter


## Release 07.11.02

{{%notice note%}}
Bugfix Release, Published: 11.11.2015
{{% /notice %}}

### Modifications

**md-cmd 7.11.02**

*   The standard outgoing prefix (0) can now be changed directly from the telephony tab under the services menu option.
*   Labels can not be configured in a way that they will not be displayed within the client
*   The RSS feed within the login screen is now correctly configured to display the english version should the mask be switched to english 
*   Prompts can now also be played back directly from the prompt overview (grid) 
*   Further text translations on end points (end user devices) (e.g Call Forwarding Active).
*   Resolved the problem relating to the simultaneous loading of the same prompt in multiple languages.
*   Fixed the problem with beroNet and Patton analog devices
*   Fixed the issue with teams with the parameter ringinuse=yes

**md-xmppserver 2.10.01**

*   Labels can not be configured in a way that they will not be displayed within the client
*   Resolved the problem whereby in certain configurations the same client label was displayed multiple times within the client.

**md-client 3.06.02**

*   When calling an IVR directly, the client will now display your calling activity / presence
*   Labels can not be configured in a way that they will not be displayed within the client
*   When adding a telephone book entry from within the journal, it is now possible to choose between your private and the company phone books.
*   Resolved the issue relating to unattended setup i.e. installations using a different directory
*   When a call has numerous labels attached, they will now be correctly displayed within the Call Labels scroll list section
*   Improved Serbian translation

**md-sound 1.00.01**

*   Internal code modifications


## Release 07.11.01

{{%notice note%}}
Bugfix Release, Critical Bugfix, published: 19.10.2015
{{% /notice %}}

### Modifications

**md-cmd 7.11.01**

* Fixed race condition between OpenLDAP and Migration Script during a database migration
* DECT Handsets now also function correctly with version 7.11.xx
* Resolved problem with the yes / no field in the Team -> advanced menu screen


## Release 07.11.00

{{%notice note%}}
Minor Release, Skill Based Routing (SBR), Call Labels, New Prompts System, Published: 15.10.2015
{{% /notice %}}

{{% notice warning %}}  
**Important notice about this update:**<br/>
The prompt system has been completely rebuilt. The migrations process performs a full back and stores your existing prompts in /BACKUP/oldprompts_done.tgz before updating. However, you should check in Advanced -> prompts that they are listed after updating and if not then use the back up to restore your prompts as while it is unlikely during the migrations process, some prompts may not be migrated.
{{% /notice %}}

### Modifications

**md-cmd 7.11.00**

*   Skill Based Routing has been enabled by using a basis of Queue Scripts and User Skills.
*   The agent routing within a Queue can now be managed using a form of script. 
*   Implemented Call Label Management and Actions.
*   Implemented management tool for user skills.
*   New object: Call Router. This can be integrated in order to make decisions based on actions within the call flow. 
*   Queue Timeout and Queue Priority can now be dynamically set per call using Call Labels.
*   QueueMetrics Integration has been extended. Agents, Queues and Skills will now be completely synchronised.
*   Caller requested agent skills will also now be shared with QueueMetrics
*   A QueueMetrics user can now be authenticated against the mobydick phone system.
*   Implemented freely definable action conditions.
*   New actions type "Inline Script" for individual dialplan functions.
*   Prompt System has been completely revamped, including a complete separation of manufacturer prompts and custom prompts as well as incorporating HTML5 player for the prompts.
*   Prompts will now be included in database backups and can be restored.
*   Prompts must now be unlocked ("Shared") by the system Admin before the prompt is editable using the *50 prompt recording system.
*   Custom prompts can now be exported / imported to and from a archive.
*   Call Waiting Feature can now be activated per user.
*   Telephone menus and user interfaces will now be displayed in English (or German) depending on the preferred user language. 
*   Main menu has been reorganised and a new sub menu added "ACD" which stands for Automatic Call Distribution.
*   API: Asterisk DB Values in the Key Chain /API can now be set and requested per REST, XMPP and FlexPanel.
*   Simplified generation of REST Access Data via the web UI: Information - Developers

**md-xmppd 2.08.00**

*   Internal code modifications

**md-xmppserver 2.10.00**

*   Agent holding times will now be also communicated to QueueMetrics 
*   API: labels which have been set are now also contained within the xmpp base.ChannelEvent.
*   API: it is now possible to simultaneously login/log out/pause yourself in multiple queues.
*   API: Asterisk DB Values in the Key Chain /API can now be set and requested per REST, XMPP and FlexPanel.
*   API: xmppuser.UserInfo now also contains the set skills of logged on users.
*   Fixed the problem with the telephone display after an Asterisk reload/restart.
*   Fixed the issue with Queue Counters during high loads.

**md-client 3.06.00**

*   Call Labels and their values will now be displayed during an active, ongoing call.
*   Windows Client can now be installed in the same directory for multiple users.
*   On Windows workstations the graphical popups notifications no longer steal the "Active Window" focus from other applications
*   New Flexpanel Widget for changing/monitoring an Asterisk DB value using a button
*   New Flexpanel Widget for setting/monitoring an Asterisk DB value using a sliding scale (Slider)
*   New client language: Arabic
*   New client language: Spanish
*   New client language: Serbian
*   Java Runtime raised to 1.8.0-60
*   E-mail addresses will no longer be shortened within the info screen after clicking in the roster.

**md-sound 1.00.00**

This packet replaces the previously used md-prompt-en and md-prompt-de packets.

*   Spanish prompts have been integrated
*   Some error scenarios which result in a "beep" or "beeper" notification being played back now used a dedicated prompt file and can therefore be adapted to suit needs.

**md-snom-data 3.07.00**

*   Internal code modifications

**md-tapi 2.03.00**

*   Internal code modifications

**md-updater 1.11.00**

*   Internal code modifications

**ex-mobydick 2.10.00**

*   Asterisk app_queue for Script Based Routing has been modified.
*   Command line tool "jq" has been integrated for JSON operations within the shell.