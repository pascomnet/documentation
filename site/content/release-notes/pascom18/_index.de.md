---
title: pascom Server 18
description: Mit dem pascom Release 18 stehen Ihnen eine Vielzahl an neuen Funktionen zur Verfügung.
weight: 996
---

{{% notice tip %}}
Folgen Sie bitte unserer detaillierten [Upgrade-Anleitung]({{< ref "/server/upgrade" >}}).
{{%/notice%}}

{{% notice warning %}}  
**Wichtige Hinweise zu diesem Update:**     
Das lesen von Dateien aus einem SMB-Share wird nicht mehr unterstützt. Stattdessen kann die Import-Datei nun hochgeladen oder von einer URL abgefragt werden.
{{% /notice %}}

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

## Grundlegende Änderungen

Mit pascom 18 gibt es grundlegende Änderungen die Sie vor einem Update überprüfen bzw. nach dem Update anpassen müssen. Wir stellen hierzu auch eine Checkliste in einer detaillierten [Upgrade-Anleitung]({{< ref "/server/upgrade" >}}) zur Verfügung.

### Einstellung pascom Classic Client

Der pascom Classic Client und die FlexPanels werden von pascom 18 nicht mehr unterstützt. FlexPanels wird es, in verbesserter Form, mit pascom 19 im aktuellen Desktop und Mobile Client geben.

### Einstellung Patton Support

Patton Gateways werden nicht mehr unterstützt. Sollten Sie noch ISDN im Einsatz sollten Sie über den Wechseln zu einem SIP-Anschluss nachdenken. Verweden Sie Patton Gateways für Ihr analoges Fax-Gerät etc. ist der [Grandstream ATA Wandler]({{< ref "/gateways/grandstream" >}}) eine gute wie günstige Alternative. 

### Einstellung Siemens Unify optiPoint Support

Wegen fehlender Verschlüsselung für Sprache wie Provisionierung wurde die Unterstützung für die Siemens Unify optiPoint Modell eingestellt.

### Einstellung cisco SPA 112 Support

Aufgrund der Einschränkung des cisco SPA 112 Gateways auf ausschließliche Nutzung mit cisco-Zertifikaten wurde die Unterstützung mit pascom 18 eingestellt. 


## Release 18.07 (10.04.2019)

{{% notice info %}}
pascom Cloud Kunden werden am Wochenende, dem 13. und 14. April 2019 auf diese Version geupdated.
{{%/notice%}}

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
