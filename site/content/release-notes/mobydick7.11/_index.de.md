---
title: mobydick Server 7.11
description: Mit dem mobydick Release 7.11 stehen Ihnen eine Vielzahl an neuen Funktionen zur Verfügung.
weight: 999
---

{{% notice tip%}}
Bitte benutzen Sie bei Fragen zunächst das [Community Forum](http://www.pascom.net/forum/ "Zu unserem Forum").
{{% /notice %}}

## Release 07.11.08

{{%notice note%}}
Bugfix Release, Veröffentlichung: 05.03.2018
{{% /notice %}}

**ÄNDERUNGEN:**

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
Bugfix Release, Veröffentlichung: 20.01.2017
{{% /notice %}}

**ÄNDERUNGEN:**

**md-cmd 7.11.07**

* Das Anwenden der Telefonie-Konfiguration auf sehr großen Systemen ist nun schneller
* Der Name einer Warteschlange darf nun keine Leerzeichen mehr enthalten. Bereits konfigurierte Warteschlangen müssen beim Speichern umbenannt werden
* Spy-mit-Pin auf einen Channel repariert

**md-xmppd 2.08.02**

* Interne Anpassungen

**md-xmppserver 2.10.06**

* Alte Einträge im Anrufjournal können nun automatisch gelöscht werden

**md-client 3.06.07**

* Das automatische Aktualisieren von Warteschlangen-Statistiken kann nun abgestellt werden
* Seltenen Absturz beim Zurückholen eines gehaltenen Anrufes mit dem mobydick-Softphone behoben
* Seltenes Problem beim Auflegen behoben

**md-sound 1.00.03**

* Ansagen und Wartemusik die als Stereo-Datei hochgeladen wird, wird nun korrekt nach Mono konvertiert

**md-tapi 2.03.03**

* Der Timeout beim Einrichten der TAPI-Schnittstelle wurde auf 3 Sekunden erhöht
* Die Schnittstelle meldet nun andere Line-Address-Capabilities, dies erhöht die Kompatibilität zu diversen ERP-Systemen


## Release 07.11.06

{{%notice note%}}
Bugfix Release, Veröffentlichung: 10.08.2016
{{% /notice %}}

**ÄNDERUNGEN:**

**md-cmd 7.11.06**

*   Die in der mobydick konfigurierte IP-Adresse eines snom M700 Gateways kann nun geändert werden - ACHTUNG: Am Gateway selbst muss die IP manuell angepasst werden!
*   Der Excel- und CSV-Export der Rufauswertung funktioniert nun wieder
*   Ein Anrufverteiler kann nun innerhalb von Aktionen wieder ausgewählt werden
*   Anruf-Labels müssen von nun an eindeutige Bezeichnungen haben
*   Amtsvorlage für COMINGOLSTADT hinzugefügt
*   Amtsvorlage für easybell aktualisiert
*   Neue Amtsvorlage für Sipcall.ch
*   Der Name einer Zeitspanne innerhalb einer Zeitschema-Aktionsbedingung kann nun wieder geändert werden
*   Es ist jetzt möglich, den Pausegrund eines Agenten zu ändern ohne den Pausestatus vorher aufzuheben
*   Die MoH-Konfiguration wird nun richtig generiert, wenn eine Applikation anstatt von Dateien verwendet wird
*   Dateibasierte Wartemusik (MoH) wird nun alphabetisch sortiert abgespielt
*   Kleinere UI-Anpassungen und -Übersetzungen verbessert
*   Bei LDAP-Connector-Vorlagen kann beim Konfigurieren der Authentifizierung nun wieder "NEIN" ausgewählt werden
*   Simulieren eines Connector-Importes funktioniert wieder

**md-xmppserver 2.10.05**

*   Es wird nun auch eine Anruf-Aktivität angezeigt wenn man einen Anrufverteiler anruft
*   XMPP Plugin Skripte können nun optional eine Basic-Auth prüfen

**md-client 3.06.06**

*   Für Ubuntu-Distributionen wird nun ein Skript mitgeliefert das einen Launcher-Eintrag erzeugt
*   System-Anrufe können nun optional aus dem Journal gefiltert werden
*   Der Dateitransfer überschreibt nun keine Dateien mehr, sondern generiert eindeutige Dateinamen
*   Pausegründe können im Client nun ohne Aufheben der Pause umgeschaltet werden

**md-sound 1.00.02**

*   Ansagen für die Sprache Deutsch (DE) aktualisiert


## Release 07.11.05

{{%notice note%}}
Bugfix Release, Veröffentlichung: 16.06.2016
{{% /notice %}}

**ÄNDERUNGEN:**

**md-cmd 7.11.05**

*   Problem beim "Zurück"-Button in der Queuemetrics-Konfiguration behoben
*   Probleme beim Update von älteren Versionen auf 7.11 mit Duplikaten bei den Ansagedateien behoben
*   Die Fallback-Extension greift nun auch wenn keine eingehende Regel zutreffen würde oder konfiguriert ist
*   Bessere Eingabevalidierung bei Amts- und Connectorvorlagen
*   Verwirrendes Verhalten beim Senden von Call Completed Elsewhere im Zusammenspiel mit dem Setting "sys.asterisk.configure.dialoptions" behoben
*   Die Ansage "Die Notrufnummer XYZ wird gewählt" kann nun mittels des Settings "sys.asterisk.dialplan.global.emergency.playback" abgeschaltet werden
*   1und1 Amtsvorlage aktualisiert
*   Beim Transfer werden Ansagen nun in der richtigen Sprache abgespielt
*   Problem bei der Installation mit östlichen (z. B. MSK) Zeitzonen behoben
*   Problem bei ISDN-via-SIP Geräten an Patton-Gateways behoben
*   Der Umleitungshinweis beim Setzen einer Rufumleitung via *-Code im Telefon wird nun zuverlässiger angezeigt, auch wenn die Ansage nicht vollständig abgespielt wird
*   BLF-Verhalten beim Un-/Pausieren von Agenten in Warteschlangen verbessert
*   Die Connector-Vorlage für "Kurzwahlen via CSV-Datei" funktioniert nun wieder

**md-xmppserver 2.10.04**

*   Aktive Pausegründe gehen beim Anwenden der Telefonie-Konfiguration nun nicht mehr verloren
*   Gelöschte serverseitige Event-Skripte werden nun sauber entladen
*   Neues generisches User-Event für Event-Skripte

**md-client 3.06.05**

*   Der Transfer-Dialog kann nun auch für 2-stellige Durchwahlen verwendet werden

**md-snom-data 3.07.02**

*   Problem mit M700 Migrationsskripten beim Update behoben

**ex-mobydick 2.10.03**

*   Job Engine wird am Ende der Installation nun neu gestartet
*   Deadlock-Probleme im Asterisk in Zusammenspiel mit Lua-Funktionen behoben
*   Problem beim Generieren der Konfiguration für eine unbeaufsichtigte Installation OHNE Ausgabe über die serielle Schnittstelle behoben


## Release 07.11.04

{{%notice note%}}
Bugfix Release, Veröffentlichung: 07.04.2016
{{% /notice %}}

**ÄNDERUNGEN:**

**md-cmd 7.11.04**

*   Feature: Ein Agent kann sich nun direkt über das XML-Menü am Telefon an einer Warteschlange an-/abmelden oder pausieren
*   Problem beim Anwenden der Telefoniekonfiguration behoben, wenn keine Standard-Amtsholung definiert und Notrufnummern konfiguriert sind
*   Problem bei eingehenden Anrufen auf Patton-Gateways behoben
*   Probleme mit Steuerzeichen bei Mail2Fax behoben
*   Problem beim Ausliefern der Provisionierungsdaten für Snom-Firmwares die eine "6" in der Versionsnummer enthalten, behoben
*   Ämtervorlagen für Fritzbox, Telekom MagentaEINS, Flowroute Enterprise SIP Trunking und Easybell angepasst
*   Das Snom M700 bekommt nun die korrekte mobydick IP als SIP Registrar provisioniert
*   Problem mit Snom M700 Firmware beim Update behoben
*   Yealink Telefone starten nun nicht mehr während des Roamings neu

**md-xmppserver 2.10.03**

*   Mehr XMPP-Events enthalten nun Label/Skill-Informationen
*   PhonecallRecords mit mehr Daten erweitert
*   Problem behoben, bei dem manche Anrufe nicht im Journal gelistet wurden
*   Nummernauflösung im Telefonbuch verbessert
*   PhonecallRecords und Eventlog-Entries können nun mit eigenen Daten angereichert werden
*   Logging verbessert
*   Problem mit unter bestimmten Umständen falschen Zeitstempeln bei Queue-Anrufen behoben

**md-client 3.06.04**

*   Outlook-Synchronisation ist nun zuverlässiger

**ex-mobydick 2.10.02**

*   Geschwindigkeit diverser LDAP-Anfragen optimiert
*   LUA-Warteschlangen-Skripte können nun den Timeout eines Anrufs in einer Warteschlange erzwingen
*   Problem bei der Strategie "Alle Anklingeln" (ringall) in Asterisk behoben


## Release 07.11.03

{{%notice note%}}
Bugfix Release, Veröffentlichung: 02.03.2016
{{% /notice %}}

**ÄNDERUNGEN:**

**md-cmd 7.11.03**

*   beroNet FXO Module werden nun unterstützt
*   beroNet CAPI Unterstützung eingebaut
*   Stabilität des Faxversands erhöht
*   Problem mit Snom / Yealink LDAP-Parametern bei aktualisierten Systemen behoben
*   Snom-Basiskonfiguration um diverse "fkey" und "label" Einträge erweitert
*   Amtsvorlage für den Provider "Flowroute" hinzugefügt
*   Amtsvorlage für DeutschlandLAN IP Voice der Telekom hinzugefügt
*   Das optionale Skript für ausgehende Rufe ist nun in den Basisdaten des Amtes und nicht mehr bei den Accounts zu finden
*   Lua-Syntax wird nun für Aktionsskripte unterstützt
*   Skript-Editor (Dialplan, Lua-Aktonsskripte, serverseitige Eventskripte usw.) verbessert
*   Problem mit dem mobydick Softphone bei Blind-Transfers behoben
*   Icinga prüft nun auf Schleifen im Dialplan
*   Snom M700 Unterstützung verbessert (Stabilität, LDAP, Nummernauflösung)
*   Diverse Übersetzungen verbessert
*   Die astdb ist nun im Datenbankbackup enthalten und wird auch wiederhergestellt
*   Problem beim Versand der Voicemail-E-Mail behoben
*   Rufgruppen können nun wieder fehlerfrei gelöscht werden
*   Die Cluster-Interface-IP wird nun unter Appliance > Telefonie besser verständlich dargestellt
*   Snom M700 funktioniert nun auch mit einem Cluster
*   IAXModems verbinden sich nun auf die Cluster-Shared-IP

**md-xmppd 2.08.01**

*   Deadlock Problem behoben

**md-xmppserver 2.10.02**

*   Laufzeitumgebung für serverseitige Eventskripte hinzugefügt
*   Problem bei Update des Windows Clients von 7.11.01 / 02 behoben
*   Stabilitätsverbesserungen
*   API-Verbesserung beim Auflegen von Anrufen
*   In-Band File Transfers können nun beim Client optional erzwungen werden - dies löst Probleme bei Dateiübertragungen in NAT-Szenarien

**md-client 3.06.03**

*   Das Fenster für einen aktiven Anruf kann nun auch dauerhaft angezeigt werden, auch wenn das Hauptfenster im Fokus ist
*   Französische Übersetzung hinzugefügt
*   Serbische Übersetzung verbessert
*   Kleinere UI Anpassungen

**md-snom-data 3.07.01**

*   Neuere Snom M700 Firmware

**md-updater 1.11.01**

*   Stabilitätsverbesserungen

**ex-mobydick 2.10.01**

*   OpenLDAP Anpassungen für Snom M700 integriert
*   Probleme beim Skill-Based-Routing unter hoher Last behoben
*   Das mobydick ISO ist nun auch von einem USB-Stick startfähig (hybrid ISO)
*   Das Backup erzeugt nun auch ein hybrides ISO
*   Tool zur Vorkonfiguration einer automatischen mobydick Installation wird mitgeliefert
*   Probleme beim ISO-Backup mit ausgeschlossenen Ordnern behoben
*   safe_asterisk Logging ist nun aktiviert (Logfile: /var/log/asterisk/safe_asterisk.log)
*   Speex Codec hinzugefügt
*   libspandsp hinzugefügt
*   Lua Interpreter hinzugefügt


## Release 07.11.02

{{%notice note%}}
Bugfix Release, Veröffentlichung: 11.11.2015
{{% /notice %}}

**ÄNDERUNGEN:**

**md-cmd 7.11.02**

*   Feature: der Standard Prefix (0) für ausgehende Rufe kann nun direkt unter Dienste - Telefonie geändert werden.
*   Feature: Labels können nun so konfiguriert werden, dass sie nicht am Client angezeigt werden.
*   Das Anmeldefester zeigt nun den korrekten RSS Feed falls auf Englisch geschaltet ist.
*   Ansagen können nun auch direkt in der Ansageübersicht (Grid) abgespielt werden
*   Weitere Texte auf den Endgeräten übersetzt (z.B. Rufumleitung aktiv).
*   Problem beim gleichzeitigen Hochladen der selben Ansage in mehreren Sprachen behoben.
*   Problem bei beroNet und Patton analog Geräten behoben
*   Problem bei Teams mit gesetzter ringinuse=yes option behoben

**md-xmppserver 2.10.01**

*   Labels können nun so konfiguriert werden, dass sie nicht am Client angezeigt werden.
*   Bei bestimmten Konfigurationen konnte es vorkommen, dass das selbe Label mehrfach am Client gezeigt wurde.

**md-client 3.06.02**

*   Ein direkter Anruf an ein IVR zeigte keine Anruf-Aktivität an
*   Labels können nun so konfiguriert werden das sie nicht am Client angezeigt werden.
*   Beim Hinzufügen eines Telefonbucheintrages aus dem Journal kann nun direkt zwischen privatem und öffentlichem Telefonbuch gewählt werden.
*   Problem bei unattended Setup bzw. Installation mit abweichendem Verzeichnis behoben
*   Bei sehr vielen Labels wird nun die Scroll-Leiste korrekt angezeigt
*   Serbische Übersetzung verbessert

**md-sound 1.00.01**

*   Interne Codeanpassungen


## Release 07.11.01

{{%notice note%}}
Bugfix Release, Kritischer Bugfix, Veröffentlichung: 19.10.2015
{{% /notice %}}

**ÄNDERUNGEN:**

**md-cmd 7.11.01**
* Race condition zwischen OpenLDAP und Migrationsskript während der Datenbankmigration behoben
* DECT Handsets funktionieren nun auch in Version 7.11.x korrekt
* Problem bei ja/nein Feldern in der Team > Erweitert Maske behoben


## Release 07.11.00

{{%notice note%}}
Feature Release, Skill Based Routing (SBR), Call Labels, Neues Ansagesystem, Veröffentlichung: 15.10.2015
{{% /notice %}}

{{% notice warning %}}  
**Wichtige Hinweise zu diesem Update:**<br/>
Das Ansagesystem wurde komplett erneuert. Der Migrationsprozess macht in jedem Fall ein volles Backup der vor dem Update vorhandenen Ansagen unter /BACKUP/oldprompts_done.tgz . Ihre eigenen Ansagen sollten nach dem Update weiterhin unter Erweitert > Ansagen sichtbar sein.
{{% /notice %}}

### mobydick 7.11 Release Keynote
{{< youtube yDYRqQvaGCU >}}

In der mobydick 7.11 Keynote zeigt Ihnen Mathias und Quirin Pasquay alle Highlights der aktuellen mobydick 7.11 Release. Erfahren Sie aus erster Hand, welche neuen Features und Verbesserungen wir für Sie vorbereitet haben.

**ÄNDERUNGEN:**

**md-cmd 7.11.00**

*   [Skill Based Routing] auf Basis von Queueskripten und Benutzer-Fähigkeiten ermöglicht.
*   Das Agentenrouting in einer Queue kann nun über eine neue Skriptart gesteuert werden.
*   Verwaltung und Aktionen für Call Labels implementiert.
*   Verwaltung für Benutzerfähigkeiten implementiert.
*   Neues Objekt Anrufverteiler. Dieses kann eingebunden werden, um anhand von Aktionen Entscheidungen im Call-Flow zu treffen.
*   Queue Timeout und Queue Priorität können nun über Call Labels pro Anruf dynamisch gesetzt werden.
*   [QueueMetrics Integration] ausgebaut. Agenten, Queues und Skills werden vollständig synchronisiert.
*   Angeforderte Agenten-Fähigkeiten eines Anrufers werden nun an Queuemetrics übergeben
*   Ein Queuemetrics Benutzer kann sich nun gegen die mobydick authentifizieren.
*   Frei definierbare Aktionsbedingungen implementiert.
*   Neue Aktionsart "Inline Script" für einzelne Dialplan-Funktionen.
*   [Ansagesystem] komplett überarbeitet. Saubere Trennung von Hersteller-Ansagen und eigenen Ansagen. HTML5 Player für Ansagen eingebaut.
*   Ansagen werden jetzt in der Datenbanksicherung mit gespeichert und wiederhergestellt.
*   Ansagen müssen nun vom Admin freigegeben werden bevor dieser per *50 bearbeitbar sind.
*   Eigene Ansagen können nun als Archiv exportiert und importiert werden.
*   [Anklopfen] Feature kann nun pro User aktiviert werden.
*   Menüs und Bedienoberfläche am Telefon werden nun in Deutsch bzw. Englisch anhand der Benutzersprache angezeigt.
*   Hauptmenü neu organisiert, neues Untermenü "Anrufverteilung".
*   API: Asterisk DB Werte im Key Bereich /API können nun per REST, XMPP and Flexpanel gesetzt und abgefragt werden.
*   Vereinfachtes Anlegen von [REST Zugangsdaten] über die Weboberfläche: Informationen - Entwickler

**md-xmppd 2.08.00**

*   Interne Codeanpassungen

**md-xmppserver 2.10.00**

*   Haltezeiten eines Agenten werden nun an Queuemetrics übermittelt.
*   API: im xmpp base.ChannelEvent sind nun auch die gesetzten Labels enthalten.
*   API: man kann sich nun an mehreren Warteschlangen gleichzeitig anmelden/abmelden/pausieren.
*   API: Asterisk DB Werte im Key Bereich /API können nun per REST, XMPP and Flexpanel gesetzt und abgefragt werden.
*   API: xmppuser.UserInfo enthält nun auch die gesetzten Fähigkeiten des angemeldeten Benutzers.
*   Problem mit Telefon-Anzeigen nach asterisk reload/restart behoben.
*   Problem mit Queue Zählern bei hoher Last behoben.

**md-client 3.06.00**

*   Anruf Labels und deren Werte werden nun bei einem aktiven Anruf mit angezeigt.
*   Windows Client kann nun in ein gemeinsames Verzeichnis für mehrere Benutzer installiert werden. "[Terminal Server Mode]"
*   Auf Windows Arbeitsplätzen stehlen Notification Popups nun nicht mehr den Fokus von anderen Anwendungen
*   Neues Flexpanel Widget um per Button einen Asterisk DB Wert zu schalten/beobachten
*   Neues Flexpanel Widget um per Slider einen Asterisk DB Wert stufenlos zu setzen/beobachten
*   Neue Client Sprache: Spanisch
*   Neue Client Sprache: Serbisch
*   Neue Client Sprache: Arabisch
*   Java Runtime auf 1.8.0-60 angehoben
*   EMail Adressen werden nun nach einfachem Klick in den Roster im Info-Bildschirm nicht mehr abgeschnitten.

**md-sound 1.00.00**

Dieses Paket ersetzt die zuvor verwendeten md-prompt-en und md-prompt-de Pakete.

*   Spanische Ansagen integriert.
*   Einige Fehlersituation, die einen "Beep" oder "Beeper" wiedergeben, verwenden nun dedizierte Ansage-Dateien und können somit angepasst werden.

**md-snom-data 3.07.00**

*   Interne Code Anpassungen

**md-tapi 2.03.00**

*   Interne Code Anpassungen

**md-updater 1.11.00**

*   Interne Code Anpassungen

**ex-mobydick 2.10.00**

*   Asterisk app_queue für skript basiertes Routing angepasst.
*   Kommandozeilentool "jq" für json operationen in der Shell integriert.
