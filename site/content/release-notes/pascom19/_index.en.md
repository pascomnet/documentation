---
title: pascom Server 19
description: With the new pascom version 19 Release, numerous new and improved functions are now available
weight: 995
---

## Highlights

{{< youtube UBoICL_2tEM >}}

### pascom Video Conferencing 

55 % of communication is visual so add the personal, visual element to your face-to-face video meetings. With pascom’s native video conferencing suite, starting a video conference from your desktop, mobile device or in a huddle room is as simple as clicking a button and there’s no need for any additional software and avoids any browser compatibility issues.

![Video Conferences](pascom-19-video-desktop-conference.png)

### Screensharing

A picture says a thousand words and with pascom 19, adding yet more visual aids to your team collaboration and meetings is just a click away. The new screen sharing functionality is available on all devices and platforms to ensure that even remote workers are able to view shared presentations and share their own screens.

![Screensharing](pascom-screen-sharing.png)

### pascom Groups with Audio, Video and Chat

Further enhance team collaboration with team messaging / team chat. Building on our “on the fly” group chat, with pascom 19 it is now possible to add “always-on” team messaging channels. Break down information silos by grouping users into departments, teams or projects and enable them to brainstorm ideas, share files and dynamically start audio / video conferences and desktop sharing sessions.

![pascom Groups](pascom-team-chat.png)

## Breaking Changes

{{% notice changes %}} 
This section explains the changes that you must consider when migrating to pascom 19
{{% /notice %}}

* **Snom Pickups** where changed to `EXTENSION|*8` syntax. See [Snom Desktop Phones]({{< ref "/endpoints/snom#function-keys" >}}).
* **Trunk Failover** deleted without alternative tools. No migration and no direct workaround. Support can help with an outbound script, if needed.   
* **IAX trunks** deleted without alternatives.   
* **Swap** is now disabled by default. This can break virtualised setups with memory lower then 1 GB, please configure more memory in this case.  
* **Call groups** are automatically converted to teams. The callgroup feature has been removed and customers should configure teams instead.  
* Port forwarding for **UDP 3478** is now mandatory, otherwise **video** tools will not work.
* A new provisioning is required for **beronet Gateways**.
* **pascom SOHO Server** is no longer compatible. Please perform a hardware upgrade to the [pascom Appliance]({{< ref "server/appliance" >}}) or use the pascom.cloud.
* * **Automatic Trunk Updates** will be performed for Telekom, peoplefone (DE, AT, CH), HFO, Sipgate Trunking, RKom, t-m-net, sipcallch, seabix, mnet, easybell and qsc/plusnet. Please check your trunk after update.

## Known Issues

{{% notice issues %}}
No problems are known at the moment!
{{% / notice%}}

## Release 19.06 (28.04.2020)

**Overview**

* pascom Web Client for web conferencing
* Support for Gigaset DECT N870 Gateway
* Trunk templates are now automatically updated with system updates
* Chat history can be restricted and cleaned up again
* System language can be configured in the instance
* Connector performance has been improved

**Modifications:**

- [MD-11661] - Snom M700 provisioning restarts all multicell senders
- [MD-11960] - Payload data has wrong key
- [MD-12033] - Fax extension invalid after change via connector
- [MD-12055] - Auto created Peoplefone trunk during setup has wrong options
- [MD-12069] - Delete contact in roster (favorite) if related phonebook entry gets deleted
- [MD-12092] - Fix warnings in various jobs
- [MD-12107] - Show correct language when adding a trunk from a template
- [MD-12126] - Change mnet template pjsip options
- [MD-12144] - Instance web UI shows wrong phone state
- [MD-12155] - Improve outbound proxy, ensure to resolve internal alias ip numbers
- [MD-12159] - Php segfault because of protobuf version incompatiblity
- [MD-12161] - Different container versions are confusing CSUI version checks
- [MD-12170] - Loader pattern is invalid
- [MD-12181] - Handle SIP AOC info requests, fix dropped calls on rkom trunks
- [MD-12182] - Can't delete group participants or leave group
- [MD-12206] - Rtc media handles locking and cleanup
- [MD-12213] - Show one provisioning URL per host-name
- [MD-12236] - Stop to enforce opus for desktop client calls, fallback to alaw for trunk calls
- [MD-12242] - Lost calls after 30 minutes on outbound proxy due to session timers
- [MD-5675] - Increase Connector Performance, Step 1
- [MD-8427] - Cleanup dialplan loop warnings on apply telephony
- [MD-10779] - Unify system language, web ui language and prompts into one data model
- [MD-11169] - Rate limit API requests
- [MD-11358] - Managed, updateable, sip trunk profiles
- [MD-11455] - Implement Gigaset N870 DECT multicell system
- [MD-11925] - Add more instance level metrics to prometheus
- [MD-12027] - Cleanup chat in event stream
- [MD-12062] - Update Seabix logo in trunk template
- [MD-12116] - Xmpp resource loader could be more efficient
- [MD-12156] - Use python3 for installation process
- [MD-12157] - Upgrade go to 1.13.X
- [MD-12175] - Remove php proto generated files from git repo
- [MD-12216] - Enhance PushManager to lower priority for chat messages pushed to android devices
- [MD-12224] - Reduce idle cpu consumption in the xmppserver by reducing modules, ports
- [MD-12244] - Add a parameter for video publisher soft limit
- [MD-12252] - Change sip host in plusnet template and migrate it automatically
- [MD-12269] - Raise asterisk open file limit


## Release 19.05 (11.03.2020)

**Overview**

* Outbound Proxy for trunks implemented.
* General improvements in trunks (e.g. redirections, hold and transfers).
* Vodafone NGN trunk support via outbound proxy (onsite).
* Analytics optimized (including team view).
* Analytics migration is now more stable.
* Improved display when picking up and transfering to desktop phones.
* Discarding a call will always create a call activity.

**Modifications:**

- [MD-10987] - Improve Peoplefone trunk anonymous call behavior
- [MD-11541] - Broken Analytics/Grafana after fresh installations in rare cases
- [MD-11707] - Do not show warning messages during loading in CSUI
- [MD-11835] - Update xmpsserver http client
- [MD-11858] - Consul register again deleted instance
- [MD-11867] - Clean up db-schema file
- [MD-11868] - Disable yealink subscribe_register because not supported in pjsip
- [MD-11939] - Rename label for number of extension digits in trunk
- [MD-11971] - Don't add any options to generic SIP trunk
- [MD-12006] - Can't upload wav to default MoH
- [MD-12035] - Analytics can't handle dots properly
- [MD-12053] - Missing audio after outbound redirections
- [MD-12058] - Missing English silence/1 prompts
- [MD-11861] - API improvement for queue live stats
- [MD-12095] - pascom Analytics: Add counter for waiting users/agents on live dashboard
- [MD-12036] - Improve performance and restrict amount of shown teams in analytics
- [MD-12086] - Update linux kernel to 4.15
- [MD-12078] - Add container memory details (caches, buffers) to prometheus metrics
- [MD-8596] - Monitor asterisk trunk connectivity
- [MD-11914] - Update Seabix Trunk Template
- [MD-12056] - Update asterisk to 16.8.0
- [MD-12083] - Restrict default trunk codec list to alaw with ptime 20 to avoid re-invites
- [MD-11985] - Update Java 11 AdoptOpenJDK JRE/JDK
- [MD-12046] - No ringback tone with Telekom advanced template
- [MD-11708] - Prohibit sip call push in GSM only mode
- [MD-12060] - Remove hard upper memory limit from all container image descriptor
- [MD-12074] - Replace apache mod_php with php fpm
- [MD-11635] - Allow to hangup multiple channels by sending base.Hangup
- [MD-12103] - Phone status unavailable if connected via UDP interface
- [MD-12088] - Missing call activity after drop in external/before action
- [MD-11779] - Subscription valid until info in instance shows negative amount of days
- [MD-11846] - Correctly handle callerid and connectedline updates in pjsip
- [MD-12073] - Improve overlay cleanup on instance update
- [MD-11948] - SIP outbound proxy for pascom 19 pjsip trunks
- [MD-12099] - Outbound proxy support for vodafone NGN trunks
- [MD-12040] - Set ptime 20 for physical and virtual fax devices
- [MD-11935] - Hide sip peer in display of snom phones
- [MD-11980] - Update Kamailio to version 5.3.x

## Release 19.04 (03.02.2020)

**Overview**

* Fixed migration issues relating to trunks containing empty SIP options.
* TCP trunks now work without any issues.

**Modifications:**

- [MD-11973] - Apply telephony broken if trunk account contains no options
- [MD-12041] - All incoming calls on TCP trunks rejected

## Release 19.03 (29.01.2020)

**Overview**

* Added generic IP endpoint provisioning
* beronet Gateways and trunks function again
* Snom basis configuration now uses XML format
* SIP Header can once again be manually modified
* PJSIP Header for trunks can now be directly configured within the Trunk account options, and no longer in scripts (e.g. def_outbound).
* External and internal ring tones (via Alert-info-header) are now usable
* Fixed Intercom group functionality
* Aastra/Mitel DECT Handsets no longer display failed registration during on going calls.
* Grandstream Gateways with the new MAC address are now added correctly
* Resolved Grafana migration issues (missing forwarding and broken login)
* Mail-to-Fax configuration is now able to differentiate between SSL, StartTLS and Plain
* TAPI pickups now also work for multiple lines
* Modified Snom basis configuration to now migrate "Extension" button to "BLF" in order to enable pickups
* Added pascom logo background image provisioning function for various Snom and Yealink devices
* Updated the QSC/Plusnet SIP provider template
* Added T-M-Net SIP provider template
* Added magenta.at SIP provider template

**Modifications:**

- [MD-11087] - Optimize Snom M700 config
- [MD-11721] - Easybell contact header
- [MD-11829] - Plusnet QSC trunk has wrong options in pascom 19
- [MD-11832] - Remove swap from grafana in pascom 19
- [MD-11968] - Increase maxlength of external_group_number input
- [MD-11847] - Remove 'type' column in team overview
- [MD-11856] - Mitel Aastra DECT shows that its unregistered
- [MD-11927] - Automatically configure lxc soft memory limit
- [MD-11952] - CSUI shows no error if FQDN is missing
- [MD-11863] - Asterisk opens a lot of tcp connections, saturates kamailio
- [MD-11919] - Kamailio does not rewrite Supported: header correctly
- [MD-11924] - Wrong context in sip_ipdevice.conf
- [MD-11892] - Grandstream HT802 ATA gateway (with new MAC) created as phone
- [MD-11812] - Grafana of instance not accessible after update sometimes
- [MD-11722] - Improve mail to fax configuration
- [MD-11720] - Add language selector to instance wizard admin and account pages
- [MD-11659] - Pickup is broken in multiline tapi setup
- [MD-8588] - Auto-provision logos on supported Snom and Yealink phones
- [MD-10822] - Multidial on trunks with direct transfer fails when external device is called
- [MD-11853] - Improve layout of pascom logo in login + setup view
- [MD-11762] - Update asterisk to 16.6.1
- [MD-11814] - Optimize pascom.cloud janus video traffic
- [MD-11857] - Better CLIP handling for trunks
- [MD-11230] - Simple generic provisioning
- [MD-11842] - Allow to set pjsip headers via script
- [MD-11931] - Migration to 19.X fails if broken vcard exists
- [MD-11849] - Can't use PUI menu on a Yealink phone,
- [MD-11855] - Can't create new team after importing backup of 17.12
- [MD-10725] - Improve trunk inbound anonymous handling
- [MD-11810] - Berofix SIP to ISDN trunk not working with pascom 19
- [MD-11962] - Change sip trunk template of Deutsche Telefon
- [MD-11588] - T-M-NET SIP-Provider Integration
- [MD-11658] - magenta.at sip trunk template
- [MD-11667] - Update web applications to angular 8
- [MD-11714] - Configure asterisk local_net and fake external address in pascom.cloud
- [MD-11926] - Store systemd journal on disk instead of tmpfs
- [MD-11979] - Logrotate and restart pbx apache once per night
- [MD-11850] - Snom BLF pickup is broken (pascom 19)
- [MD-11949] - Pickup from a queue doesn't work via notification
- [MD-11633] - Use XML based provisioning templates for Snom phones
- [MD-12009] - Xmpp migration fails if there is no events after mdarchive migration

## Release 19.02 (22.11.2019)

**Overview**

- Restabilised call pickups on the mobile client.
- Let's Encrypt certificates will once again be issued.

**Modifications:** 

- [MD-11874] - Internal calls softphone to mobile can't be answered
- [MD-11876] - Port let's encrypt to 19
- [MD-11866] - Configure QOS/TOS in asterisk pjsip

## Release 19.01 (21.11.2019)

**Overview**

- Yealink BLF keys now show the correct current status.
- Resolved migration issues connected to call groups and actions.
- Yealink telephone call logs now consider the trunk prefix for call backs.
- Fixed microphone muting issues relating to external calls.
- Improved holding and retrieving / resuming multiple calls

**Modifications:** 

- [MD-11818] - Can't change password via client
- [MD-11819] - Invalid image.json configuration file for cs-proxy
- [MD-11823] - Error invalid wire type in xmpp log
- [MD-11831] - Mobile icon missing if user deactivates mobile in follow me
- [MD-11813] - Improve UI for creating the queue
- [MD-11843] - Redial on hardware phones is broken if trunk has 0 prefix
- [MD-11844] - Adapt Seabix trunk template
- [MD-11851] - Call Specific actions are broken for softphone calls
- [MD-11833] - Unreliable Yealink BLF
- [MD-11828] - Incorrect phone call data after the pickup
- [MD-11824] - pascom 19 migration bug if action of type "c" (callgroup) exists
- [MD-11821] - Error on restarting pbx containers
- [MD-11834] - Consul template service is not started in the cs-proxy container
- [MD-11380] - Export more instance level metrics to prometheus


## Release 19.00 (04.11.2019)

**Overview**

- Reworked Contacts / Contactlist
- New Searchfunction and Smartfilters
- Interactive Callobjects during a call
- Video and Screensharing functions
- pascom Groups. Permanent Audio, Video and Chat Groups
- Asterisk Update to Version 16 LTS
- Access to RTP Statistics
- Converted all trunk templates to pjsip syntax