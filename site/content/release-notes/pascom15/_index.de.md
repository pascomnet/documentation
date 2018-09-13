---
title: pascom 15
description: Mit dem pascom Release 15 stehen Ihnen eine Vielzahl an neuen Funktionen zur Verfügung.
weight: 998
---

{{% notice tip%}}
Bitte benutzen Sie bei Fragen zunächst das [Community Forum](https://www.pascom.net/forum "Zu unserem Forum").
{{% /notice %}}

{{% notice warning %}}  
**Wichtige Hinweise zu diesem Update:**  
- We will not provide the firmware for outdated Aastra/Mitel DECT systems anymore. All Aastra/Mitel DECT firmware files (previously provided via TFTP) will get removed during the migration.
**Wichtige Änderungen zu mobydick 7.13 und 7.14:**  
- Neues Versionierungsschema XX.YY: XX ist die Hauptversion, YY die Bugfixversion                                      
- Namenswechsel: aus **mobydick** wird **pascom**                                                                      
- 32bit Unterstützung weggefallen. Kompatible Systeme werden automatisch auf 64bit aktualisiert                      
- Versionsschema geändert: Alle Teilkomponenten tragen nun immer die Hauptversionsnummer                                    
- XML / PUI-Menüs auf Grandstream GXV (Android basierten) Tischtelefonen werden vorerst nicht unterstützt.                          
- Autoprovisionierung von Cisco SPA112 wird im Cloudstack *NICHT* unterstützt                                        
- Es werden nun Standardmäßig keine Geräte-Firmwares mehr mitgeliefert. Falls für Telefone/Gateways ein Firmware-Update ausgerollt werden soll, muss dieses zuvor manuell hochgeladen werden
{{% /notice %}}


## Release 15.12 (04.07.2018)

**Auf einen Blick**

* Datenbankgröße beim Backup beschränkt
* Connector Verbesserungen / Fehlerbehebungen
* Basiskonfiguration für Yealink Firmware 82.X und später angtepasst: Telefone toggeln nun nicht mehr zwischen Reachable und Unreachable
* ISO Backup funktioniert wieder einwandfrei
* Ein work-around-Skript zur Behebung der Telekom DNS Probleme, wenn sich die IP-Adresse des Registrierungsservers ändert, wurde eingebaut

**Änderungen:**

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

**Änderungen:**

* MD-9847 - Trunk state not reliable rest api
* MD-10302 - Prevent usernames without domain in cs proxy
* MD-10303 - Private phonebook entries are shown like global ones
* MD-10348 - Allow mails with umlauts in the phonebook
* MD-10356 - Cloudstack container backup should fail if too large


## Release 15.10 (09.04.2018)

**Änderungen:**

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

**Änderungen:**

* MD-10014 - Improve prompt of dialplan loop detection
* MD-10031 - Fix typo in /services/apidoc
* MD-10071 - Missing device info if receiving call while call forwarding is active
* MD-10105 - Correct typos in cloudstack job results
* MD-10144 - Exception after deleting a gateway assigned to role
* MD-10146 - Wrong error message after entering wrong fax extension
* MD-10039 - Hide button to test connection if exchange server connector is not configured
* MD-10082 - Update gloox version to 1.0.20 in tapi


## Release 15.08 (06.03.2018)

**Änderungen:**

* MD-9924 - Confirmation dialog for deleting an instance has wrong text
* MD-10013 - Can't delete call forwarding that contains special chars
* MD-10016 - Increase possible length of mailserver hostname
* MD-10022 - Dial not successful if softphone name contains a +
* MD-10111 - classic Client Softphone does not login on certain environments
* MD-8363 - Increase verbosity for failed mail to fax


## Release 15.07 (22.02.2018)

**Änderungen:**

* MD-10072 Fixed Aastra DHCP provisioning (static ip reservation for the OMM stations)


## Release 15.06 (19.02.2018)

**Änderungen:**

* MD-8662 - Ignore not assigned devices for changing follow me settings for many devices at once
* MD-9516 - Xmppserver AstdbManager does not accept a dash in a key
* MD-9755 - Conference via client will not work with new Yealink firmware 82
* MD-9756 - Snom D785/D120 downloading language file failed for version 10.1.17.0
* MD-9830 - Wrong encoding within voicemail notification text via email
* MD-9901 - phonebook import via rest is broken
* MD-9902 - Softphone crashes in Classic Client


## Release 15.05 (29.01.2018)

**Änderungen:**

* MD-8571 - Gateway status in webinterface was broken
* MD-9654 - Do not allow to delete default music on hold class
* MD-9676 - Import contacts from shared mailbox via exchange connector
* MD-9724 - Manual update of mobydick container will not resets RAM anymore
* MD-9836 - Introduced more dynamic hints for pascom based redirections
* MD-9880 - Wrong syntax for inbound rule within Tele2 trunk template
* MD-9900 - Change 'mobydick' to 'pascom' in TRC210909
* MD-9671 - Remove AAstra / Mitel firmware from distribution


## Release 15.04 (15.01.2018)

**Änderungen:**

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

**ÄNDERUNGEN:**

**md-cmd**

* Zuletzt geänderte Basiskonfigurationen werden wieder korrekt verlinkt.
* Yealink und Cisco Geräte mit neuer MAC werden als solche erkannt
* Namen von Plugin Skripts werden nun weniger strikt validiert
* Aktionsbedingungen können jetzt im Dropdown-Menü einfacher gefunden werden
* Bei Community Anlagen wird keine Appliance ID mehr angezeigt
* Workflow beim Ändern von Flexpanels verbessert
* DHCP Konfiguration wird jetzt nach jedem Update neu erstellt
* Zusätzliche Informationen zum Amtsvorlagen-Export hinzugefügt
* Namen der Amtsvorlagen wurden vereinheitlich
* Ältere Mitschnitte können via Cronjob gelöscht werden
* REST API zeigt nun den Status von Ämtern zuverlässig an
* Faxe mit mehr als 15 Seiten werden nicht mehr komplett im Webinterface angezeigt.
* Provisionierung des Snom M700 verbessert
* Beim Löschen eines Connector Profils werden nun auch dazugehörige Cronjobs gelöscht.
* Lokales Telefonbuch bei Yealinks zeigt nun auch transferierte externe Nummern an
* Diverse Übersetzungen angepasst
* LDAP Server startet wieder zuverlässig nach Neustart des Systems

**md-xmppserver**

* Originate Dials in Verbindung mit Konferenzräumen werden nun richtig angezeigt

**md-client**

* Follow-Me Einstellungen sind wieder über den Client konfigurierbar
* Client zeigt nun alle verfügbaren analog Telefone in der Geräteliste
* Server-Kommunikation zum Client optimiert

**md-firmware**

* Monitoring Tool iotop ist nun enthalten

**cs-proxy**

* Lastprobleme bei Proxies behoben

**cs-controller**

*  Protokolle sind in Cloudstack Instanzen nun, auch nach Telefonie anwenden, statisch auf UDP,TCP


## Release 15.02 (12.10.2017)

**ÄNDERUNGEN:**

**md-cmd**

* Große Faxe werden nun zuverlässiger empfangen
* Jitterbuffer für die Iaxmodems deaktiviert um die Zuverlässigkeit beim Faxen zu verbessern
* Problem beim Versenden von Faxen an interne Faxrufnummern behoben
* Neue Amtsvorlage für Provider UPC (Österreich)
* Neue Amtsvorlage für Provider nexbridge.co.uk
* Neue Amtsvorlage für Provider amplus
* Amtsvorlage für Fritz!Box angepasst
* Amtsvorlage Telekom Magenta verwendet nun standardmäßig TCP anstatt UDP
* Ämter können nun via TLS angebunden werden
* Audio-Problem bei Rufumleitungen mit Telekom-SIP-Ämtern behoben
* Problem mit Rufumleitungen an einem Snom-Telefon bei Telekom und QSC-Ämtern behoben
* Bei einer Datenbank-Wiederherstellung wird nun auch die Wartemusik (MoH) wiederhergestellt
* Problem beim Connector-Import behoben, wenn der Benutzer bereits ein Softphone zugewiesen hat
* Problem im Zusammenspiel mit Exchange/Office365 behoben
* Namen für Plugin-Skripte dürfen ab jetzt nur noch a-z und 0-9 enthalten
* Link zur Hilfe im WebUI an eine übersichtlichere Position verschoben
* Validierung bei TRC210202 (Journal Daten Aufräumen) und TRC080703 (Benutzer > Rufumleitungen) verbessert
* Log-Meldungen beim Connector-Import verbessert
* Problem beim Roaming via \*44-Durchwahl behoben
* Problem mit der Signalisierung von Rufnummern bei Sipgate-Ämtern behoben
* Problem beim Setzen einer anlagenseitigen Rufumleitung behoben
* Problem bei der Provisionierung von Cisco SPA112 behoben
* Problem beim Bearbeiten eines BeroNet-Gateways behoben, wenn dieses nicht erreichbar ist
* Snom C520-WiMi kann nun manuell konfiguriert und verwendet werden
* Berofix-Karten werden bei der Installation eines Cloudstacks nicht länger als Netzwerkgeräte vorgeschlagen
* Problem bei der Zuweisung von snom M700 Handsets an Basisstationen behoben
* Das PUI (XML-Menü) heisst nun "pascom" anstatt "Menü"
* Das Telefonbuch und das "pascom" PUI-Menü sind nun leichter zugänglich
* Provisionierung für Snom-Telefone verbessert
* Cloudstack-Instanzen versuchen nun nicht mehr den ntpd zu starten

**md-client**

* Das Abspielen von Mitschnitten wird nun gestoppt sobald die zugehörige Journal-Aktvivität geschlossen wird

**md-xmppd**

* Wenn eine Konferenz via Originate-Dial betreten wird, wurden falsche Events gesendet. Der Client hat in diesem Fall keine Anruf-Aktivität angezeigt
* Anwenden der Telefonie-Konfiguration bei großen Anlagen beschleunigt

**cs-proxy**

* Selten auftretendes Memory-Leak bei XMPP-Verbindungen behoben
* Bei der manuellen IP-Konfiguration eines Proxies kann nun das Gateway weggelassen werden

**cs-host**

* Kernel-Version gepinnt um eine Kernel-Panic im Zusammenspiel mit lxc zu umgehen

**cs-controller**

* consul Version aktualisiert um ein Logging-Problem zu beheben
* Beim Systemstart kann nun der automatische Start von Containern übersprungen werden

**ex-mobydick**

* Asterisk Version 11.6-cert17 integriert


## Release 15.01 (03.08.2017)

**ÄNDERUNGEN:**

**md-cmd**

* Amtsvorlage für "Telekom DeutschlandLAN SIP Trunk" eingeführt.
* Der Exchange-Connector akzeptiert optional auch self-signed Zertifikate.
* Ämter können nun optional mit TCP anstatt UDP betrieben werden.
* Übersetzungen verbessert.
* Verhalten bei Extern-zu-Extern-Rufumleitungen (Call-Deflection) verbessert.

**cs-controller**

* Problem bei der Validierung von Proxy-Netzwerkschnittstellen behoben

**cs-host**

* Problem bei der Installation auf HyperV-Hosts behoben.


## Release 15.00 (28.06.2017)

{{%notice note%}}
**Feature Release:**  
- Exchange Adressbücher können nun importiert und synchronisiert werden.  
{{% /notice %}}

**ÄNDERUNGEN:**

**md-cmd**

* Neue Connector-Vorlage zum Importieren von Microsoft-Exchange-Adressbüchern
* Die Import-Simulation bei der Connector-Konfiguration hat einen "Erneut simulieren"-Button
* Problem beim Provisionieren von Grandstream Gateways HT701 und HT802 behoben
* Neue (Community-) Amtsvorlage für den Provider Teledata
* Problem bei der Unterstützung von Snom M700-Multizellen-Systemen im cloudstack behoben
* Verbindungsprobleme von Snom M700-Systemen behoben, wenn TLS aktiviert ist
* Connector-Importe funkionieren nun zuverlässiger
* Anrufe via Mobile-Hub sind nun zuverlässiger

**md-client**

* Übersetzung verbessert
* Der DATEV-Stammdaten-Cache wird nun zuverlässiger aktualisiert
* Aktions-URLs konnten vom Client nicht geöffnet werden, wenn die URL eine Label-Variable enthält
* Italienische Sprache ist nun verfügbar

**cs-controller**

* Kaputtes Kommando "cs container list" repariert
* Kleinere UI-Probleme behoben
* Das Netzwerk-Interface für einen Proxy kann nun aus einem Drop-Down ausgewählt werden

**cs-proxy**

* Die Tools "ssldump" und "tcpflow" stehen nun zum Debugging zur Verfügung
* PUI-Menüs (XML-Menüs) auf Yealink-Telefonen werden nun schneller geladen, wenn TLS aktiv ist
* Betriebssystem auf Ubuntu 16.04 aktualisiert

**cs-host**

* Wenn der cloudstack auf BeroNet-Appliances installiert wird, werden gesteckte BeroNet-Karten erkannt und können eingebunden werden
