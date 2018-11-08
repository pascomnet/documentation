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

## Grundlegende Änderungen

Mit pascom 18 gibt es grundlegende Änderungen die Sie vor einem Update überprüfen bzw. nach dem Update anpassen müssen. Wir stellen hierzu auch eine Checkliste in einer detaillierten [Upgrade-Anleitung]({{< ref "/server/upgrade" >}}) zur Verfügung.

### Einstellung pascom Classic Client

Der pascom Classic Client und die FlexPanels werden von pascom 18 nicht mehr unterstützt. FlexPanels wird es, in verbesserter Form, mit pascom 19 im aktuellen Desktop und Mobile Client geben.

### Einstellung Patton Support

Patton Gateways werden nicht mehr unterstützt. Sollten Sie noch ISDN im Einsatz sollten Sie über den Wechseln zu einem SIP-Anschluss nachdenken. Verweden Sie Patton Gateways für Ihr analoges Fax-Gerät etc. ist der [Grandstream ATA Wandler]({{< ref "/gateways/grandstream" >}}) eine gute wie günstige Alternative. 

### Einstellung Siemens Unify optiPoint Support

Wegen fehlender Verschlüsselung für Sprache wie Provisionierung wurde die Unterstützung für die Siemens Unify optiPoint Modell eingestellt.


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
