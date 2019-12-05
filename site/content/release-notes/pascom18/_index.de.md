---
title: pascom Server 18
description: Mit dem pascom Release 18 stehen Ihnen eine Vielzahl an neuen Funktionen zur Verfügung.
weight: 996
---

{{% notice tip %}}
Folgen Sie bitte unserer detaillierten [Upgrade-Anleitung]({{< ref "/server/upgrade" >}}).
{{%/notice%}}

## Highlights

{{< youtube 4oU8MibyrT8 >}}

### Plattform Unify 

Die pascom classic und cloudstack Plattformen wurden zusammengelegt. Dadurch können Sie alle "cloud" Funktionen wie konsequente Verschlüsselung aller Gespräche oder einfache Integration mobiler Teilnehmer, auch in einer vor Ort Installation nutzen.

### Session Border Controller

Der pascom Session Border Controller ist jetzt fester Bestandteil der Lösung und ermöglicht die einfache Integration mobiler Teilnehmer via SIP. 

### Verbesserte Sprachqualität

Alle pascom Clients haben ab sofort durch den Einsatz des OPUS Codecs eine stark verbesserte Sprachqualität. Davon profitieren insbesondere mobile Nutzer die schwankenden Netzwerkqualitäten ausgesetzt sind. 

### Cloud VPN Connector 

Die pascom.cloud kann jetzt auf lokal installierte Ressourcen wie Active Directory, CRM System, etc. zugreifen indem Sie eine direkte VPN Verbindung zwischen Ihrer pascom.cloud Instanz und Ihrem Firmennetzwerk herstellen.

### Fernsteuerung von Tischtelefonen via Cloud

Mit pascom 18 ist der pascom Dekstop Client in der Lage Hardware-Engeräte direkt anzusprechen. Somit erreichen Sie bei der Nutzung der pascom.cloud das gleiche Komfortniveau wie bei vor Ort Installationen.

### Einführung pascom Mailserver cloudmx

Ab sofort stellen wir allen Kunden zum versenden von E-Mails unseren Service "cloudmx" zur Verfügung. Aufwändige Integrationen ihres eigenen Mailserver können somit auch bei vor Ort Installationen entfallen.

### Verschlüsselung auf Knopfdruck

Durch die Integration von Let's Encrypt ist bei vor Ort Installationen nun auf einfachste Art und Weise möglich sichere Zertifikate zu verwenden.

## Wichtige Änderungen

{{% notice changes %}}  
In diesem Abschnitt werden die Änderungen erläutert, die Sie bei der Migration auf pascom 19 berücksichtigen müssen
{{% /notice %}}

Siehe auch die Checkliste in der detaillierten [Upgrade-Anleitung]({{< ref "/server/upgrade" >}})

* Der **pascom Classic Client** und die **FlexPanels** werden von pascom 18 nicht mehr unterstützt.
* **Patton Gateways** werden nicht mehr unterstützt. Sollten Sie noch ISDN im Einsatz sollten Sie über den Wechseln zu einem SIP-Anschluss nachdenken. Verweden Sie Patton Gateways für Ihr analoges Fax-Gerät etc. ist der [Grandstream ATA Wandler]({{< ref "/gateways/grandstream" >}}) eine gute wie günstige Alternative. 
* Wegen fehlender Verschlüsselung für Sprache wie Provisionierung wurde die Unterstützung für die **Siemens Unify optiPoint** Modell eingestellt.
* Aufgrund der Einschränkung des **cisco SPA 112 Gateways** auf ausschließliche Nutzung mit cisco-Zertifikaten wurde die Unterstützung mit pascom 18 eingestellt. 
* **Connector**: Das Lesen von Dateien aus einem SMB-Share wird nicht mehr unterstützt. Stattdessen kann die Import-Datei nun hochgeladen oder von einer URL abgefragt werden.
* **Print to Fax** wurde entfernt. Alternativ kann der pascom Client nun ein Spool-Verzeichnis überwachen und darin abgelegte PDFs als Fax versenden.
* **Beronet Gateways** benötigen mindestens Firmware Version 16
* pascom Cluster wurde eingestellt


## Release 18.12 (27.11.2019)

**Auf einen Blick**

- Let's Encrypt Zertifikate funktionieren wieder.
- Mittschnitte können, durch setzen einer Channel-Variable, getrennt für Anrufer und Angerufenen aufgenommen werden.
- Geräteliste zeigt nun direkt an, ob ein Mobilgerät gepairt ist oder nicht.


**ÄNDERUNGEN:**

- [MD-11788] - Failed to request let's encrypt cert because of ACMEv1 end of life
- [MD-11776] - Record each audio stream to separate files during monitoring a call
- [MD-11731] - Show pairing status of mobile directly in device list
- [MD-11648] - Migration of xmpp server failed because of md_xmppserver_71710_01.php
- [MD-11768] - PHP function 'getClass' is wrongly called with 'self' instead of '$this'

## Release 18.11 (17.10.2019)

**Auf einen Blick**

- Grandstream GRP, WP sowie Geräte mit neuer MAC werden unterstützt
- Snom M900 DECT Gateway kann provisioniert werden
- T38 Support aktiviert
- Asterisk Update auf Version 13.27.0
- Generische Geräte können über den Connector angelegt werden

**ÄNDERUNGEN:**

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
- [MD-11650] - Broken license without working subscription details button
- [MD-11653] - Django corsheaders dropped support for python 2.7
- [MD-11655] - Can not install or upgrade pascom 18.10 on a soho appliance
- [MD-11629] - CSUI white screen it prometheus not running
- [MD-11172] - Improve layout of trunk template overview
- [MD-11640] - Improve Mitel / aastra DECT gateway basic configuration template
- [MD-11646] - Server build fails because of grafana plugin download server problems
- [MD-11586] - pascom.cloud host is complaining about license server
- [MD-11692] - Phone presence has invalid state
- [MD-11694] - Xmpp server can't boot because of deadlock
- [MD-11702] - Provide more info about the push message type
- [MD-11711] - Add new MAC vendor ID for Grandstream phones
- [MD-11284] - Improve QSC template
- [MD-11590] - ISO upload process bar stuck
- [MD-11701] - Support for snom M900

## Release 18.10 (05.08.2019)

**Auf einen Blick**

- Anrufe können wieder an sich selbst transferiert werden um das Endgerät zu wechseln       
- Hochladen von Updates und Backups verbessert, sowie allgemein benötigten Festplattenspeicherplatz optimiert       
- Amtsholungs-Prefix wird im Zusammenhang mit Outlook-, Android-, Apple- und DATEV-Kontakten richtig im Journal gesetzt     
- Selbst signierte Zertifikate werden bei Änderungen des FQDN neu generiert     
- Faxserver wird nun permanent bereitgestellt       

**ÄNDERUNGEN:**

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

**Auf einen Blick**

- Erneutes Pairen bei Lizenzproblemen verbessert
- Migrationen in Verbindung mit dem Yealink W60B werden nun ordnungsgemäß durchgeführt
- Registrierungen von Ämtern werden nun bei Abbrüchen noch zuverlässiger wiederhergestellt

**ÄNDERUNGEN:**

* MD-11501 - you cannot re-pair a license if no license is configured in csd
* MD-11552 - Yealink W60B DECT migration error "Port count mismatch"
* MD-11538 - Retry asterisk sip trunk registration periodically


## Release 18.08 (13.06.2019)

**Auf einen Blick**

* Diverse Verbesserungen im Management Interface und Wizard durchgeführt  
* Grafana wird ab sofort als "Analytics" bezeichnet
* "IPAustria" community Ämterprofil hinzugefügt und einige Provider-Templates verbessert
* memberOf kann nun via UCS Connector ausgelesen werden
* Konfiguration eines eigenen Mailservers und der Versand der Testmail wird jetzt zuverlässig durchgeführt
* Yealink W60B DECT unterstützt ab sofort 8 Handsets
* Grandstream HT-802 Provisioning-Template geändert um eine zuverlässige Registrierung zu gewährleisten
* Anrufe können jetzt über REST API aufgelegt werden
* Der Connector kann nun optional auch Quellen mit unsicheren Zertifikaten nutzen.
* Generische SIP-Geräte erhalten nun LDAP-Zugangsdaten um den Zugriff auf das Telefonbuch zu ermöglichen.

**ÄNDERUNGEN:**

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

**Auf einen Blick**

- Fernsteuerung verschiedener Desktop-Telefone verbessert
- LDAPS für Yealink Telefone und DECT Systeme wurde integriert
- LDAP für Mitel/Aastra DECT Systeme funktioniert nun
- Kompatibilität zu Snom M700 Firmware 450B5 hergestellt und experimentelle LDAPS Unterstützung
- Provisionierung und Fernsteuerung von Auerswald Telefonen verbessert
- Wir verwenden nun Asterisk 13.25.0
- Kernel Update auf 4.4.0.143
- Hochgeladene Telefonfirmware-Dateien werden bei einem Update des Servers nicht mehr entfernt
- Telefonstatus im Client wird nun als "nicht erreichbar" dargestellt, falls der Benutzer nur ein Mobiltelefon hat und dessen Follow-Me Konfiguration auf "aus" steht.

**ÄNDERUNGEN:**

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

**Auf einen Blick**

- Unverschlüsselte Telefonie mit UDP/RTP funktioniert nun wieder einwandfrei in OnSite Installationen

**ÄNDERUNGEN:**

- [MD-11372] - Insecure calls via UDP/RTP not working 


## Release 18.05 (26.02.2019)

**Auf einen Blick**

- Der CSV-Connector erlaubt nun das manuelle Hochladen von Dateien über die pascom WebUI, sowie das Hinterlegen einer URL als Quelle 
- Die Rufauswertung wird nun pro Instanz mit Grafana umfangreich und in Echtzeit grafisch aufbereitet
- Vodafone NGN Amt wird nun unterstützt
- Bessere Analyse von Exchange-Verbindungen mit einem neuen Verbindungs-Tester
- Die unsichere Provisionierung von Telefonen und Gateways via DHCP kann nun auch via OpenVPN in einem lokalen Netzwerk erfolgen
- Support für Cloud Service Provider (CSP)
- Yealink T5* Serie wird nun provisioniert

**ÄNDERUNGEN:**

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
- [MD-11211] - Introduce trunk template flag to filter onsite/cloud templates
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

**Auf einen Blick**

- Neue Mitel Dect Sender werden unterstützt
- Rollenkonzept wurde überarbeitet
- Instanz Wizard bietet nun die Gelegenheit ein Peoplefone-Testamt anzulegen
- Exchange-Connector importiert nun auch private Kontakte anhand der E-Mail-Adresse
- Anrufe über Beronet Hardware laufen nun langfristig zuverlässiger 

**ÄNDERUNGEN:**

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

**Auf einen Blick**

- neue Asterisk Version 13.23.1
- GUI für das Anlegen eines beronet gateways verbessert
- Beronet card Audio Problem behoben
- Plain LDAP Unterstützung für Yealink Dect Systeme wurde eingebaut
- Yealink W60B Dect wird nun provisioniert
- SIP ALG ist nun auf Interfaceebene konfigurierbar
- VPN der Instanz verbessert instance-to-site VPN
- Diverse Verbesserungen bezüglich Fax

**ÄNDERUNGEN:**

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
- [MD-10933] - Remove "skip auto restart" feature from onsite hosts
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

**Auf einen Blick**

- Mobile Clients lassen sich nun auch mit Credentials pairen
- Mehr Sicherheit durch Firewall zwischen Instanzen
- Neue Benutzer können nun auch aus der fertig eingerichteten Instanz heraus eingeladen werden
- Snom M700 unterstützt nun LDAP (kein TLS, Schnittstelle muss auf "mixed" eingestellt werden)
- Gateway Provisionierung über GUI wurde repariert
- Endgeräte können nun über den User Wizard angelegt werden

**ÄNDERUNGEN:**

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

**Auf einen Blick**

- TAPI und weitere Third-Party XMPP-Clients können sich nun wieder zum Server verbinden ohne dass die Verbindung abbricht
- Die pascom Appliance kann nun zuverlässig neu gestartet werden
- Eine angepasste Mailserver-Konfiguration bleibt nun beim Neustart erhalten

**ÄNDERUNGEN:**

- MD-11016 - Custom mail server gets lost after reboot
- MD-11037 - Fix XMPP Version check for clients
- MD-11040 - Red mini appliance fails to startup properly, containers are not running
- MD-11041 - Can not add a beronet gateway with only one interface
- MD-11048 - Self signed certificate change after appliance update
- MD-11049 - Add restic binary to host firmware


## Release 18.00 (20.09.2018)

Initiales Release der pascom Version 18.

### pascom Clients
- Der Desktop-Clients kann nun Telefone via HTTP fernsteuern
- Opus-Codec für pascom Clients
- Sichere TLS/SRTP Telefonie für pascom Clients auch in Onsite-Szenarien
- Verbessertes GSM Fallback verhalten
- "Crackling"-Geräusch bei Voicemail anrufen behoben (MD-10444)
- Diverse Crash-Ursachen behoben (MD-10851, MD-10858)
- QOS/TOS Support für Telefonie
- Probleme beim halten von Gesprächen behoben
- iOS Client kann nun mehrere Anrufe verwalten
- Android: verbessertes Verhalten wenn die Anwendung beendet wurde (Force-Quit)
- Android: Target API auf 8.1 erhöht, neue Benachrichtungsverwaltung (Channels) implementiert
- Diverse UI Verbesserungen
- Unterstützung für Sennheiser HeadSetup auf 32bit Systemen
- Unterstützung für Sennheiser HeadSetup Pro
- Timeout für Login-Versuche beim Client Entfernt
- Lautstärkeerhöhung bei Anrufen wenn zu einem pascom18 server verbunden wird
- Qt 5.9.6 integriert
- bessere Unterstützung für iPhoneX display


### pascom Server
- Asterisk 13 eingebaut
- ldaps Unterstützung für Telefone
- Vereinfachtes Setup durch Wizards
- Automatische Lizenzerneuerng via my.pascom.net
- Lizenzverwaltung via my.pascom.net
- Cloud Unterstützung und Unterstützung für Internet-Setups (Session Border Controller)
- Vereinfachtes E-Mail versenden via cloudmx
- PHP7 im Instanz-UI
- Let's encrypt support
- Patton Support Entfernt
- Print-To-Fax Support Entfernt
- Support für pre-16 Beronet Firmware Versionen Entfernt
- Alte Update-Logik Entfernt
- Web Asterisk CLI für vereinfachtes Debugging
- QOS/TOS Support für Telefonie
- TFTP-Server Entfernt
- Prometheus / Grafana basiertes Performance-Monitoring
- Unterstützung für pascom Classic Client und pascom Client < 17.10 Entfernt
