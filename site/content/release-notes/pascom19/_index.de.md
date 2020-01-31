---
title: pascom Server 19 BETA
description: Mit dem pascom Release 19 stehen Ihnen eine Vielzahl an neuen Funktionen zur Verfügung.
weight: 995
---

## Highlights

{{< youtube eLfIiR32nEc >}}

### pascom Video Konferenzen 

55% der Kommunikation erfolgt visuell. Mit der nativen Videointegration von pascom ist das Starten einer Konferenz auf Ihrem Desktop oder Mobilgerät nur einen Klick entfernt. Sie benötigen weder zusätzliche Software noch können Probleme mit inkompatiblen Browsern auftreten.

![Video Konferenz](pascom-19-video-desktop-conference.png)

### Screensharing

Ein Bild sagt mehr als tausend Worte. Die neue Screensharing Funktion steht auf allen Geräten und Plattformen zur Verfügung und stellt sicher, dass auch Außendienstmitarbeiter jederzeit Dokumente und Präsentationen mit Ihren Kollegen teilen können.

![Screensharing](pascom-screen-sharing.png)

### pascom Gruppen mit Audio, Video und Chat

Verbessern Sie die Teamzusammenarbeit mithilfe von Gruppen. Aufbauend auf unserem “on the fly” Gruppen-Chat ist es mit pascom 19 jetzt jedem Benutzer möglich, permanente Gruppen zu erstellen. Ermöglichen Sie Ihren Mitarbeitern sich mühelos per Chat, Audio oder Video austauschen.

![pascom Gruppen](pascom-team-chat.png)

## Beta Tester werden

{{% notice tip %}}
Der einfachste Weg ist eine neue FREE Instanz in der pascom.cloud zu erstellen. Diese verwenden automatisch pascom 19 BETA.  
{{% /notice %}}


**Sie möchten lieber updaten?**  

* **Onsite 18**: Laden Sie sich das [ISO herunter](https://www.pascom.net/de/downloads/) und machen Sie ein Update.  
* **Onsite 17 und älter**: Lesen Sie die [Upgrade Anleitung]({{< ref "/server/upgrade">}}) und nutzen Sie das [BETA Iso](https://www.pascom.net/de/downloads/)  
* **Cloud PREMIUM**: Wenden Sie sich an den pascom Support.  
* **Partnerkunden**: Wenden Sie sich an Ihren pascom Partner, dieser kann ein Update auf pascom 19 BETA veranlassen.

## Wichtige Änderungen

{{% notice changes %}}  
In diesem Abschnitt werden die Änderungen erläutert, die Sie bei der Migration auf pascom 19 berücksichtigen müssen
{{% /notice %}}

* **Snom Pickups** wurden auf `DURCHWAHL|*8` Notation umgestellt. Siehe [Snom Tischtelefone]({{< ref "/endpoints/snom#tasten-belegen-über-das-web-ui" >}}).
* **Trunk Failover** (Ämterketten) ersatzlos gelöscht. Keine Migration und keine direkte Problemumgehung. Der Support kann bei Bedarf mit einem ausgehenden Skript helfen.  
* **IAX-Amtsleitungen** ersatzlos gelöscht.   
* **Swap** ist jetzt standardmäßig deaktiviert. Dadurch können virtualisierte Setups mit weniger als 1 GB Arbeitsspeicher beschädigt werden. Konfigurieren Sie in diesem Fall mehr Arbeitsspeicher.  
* **Anrufgruppen** werden automatisch in Teams umgewandelt. Die Anrufgruppenfunktion wurde entfernt, und stattdessen sollten Teams konfiguriert werden.  
* Portforwarding für **UDP 3478** ist Voraussetzung, andernfalls funktioniert **Video** nicht.
* **Beronet Gateways** müssen neu provisioniert werden.


## Bekannte Probleme

{{% notice issues %}}
Diese Probleme sind uns in pascom 19 bereits bekannt und wir arbeiten aktuell an einer Lösung  
{{% /notice %}}

* Hardwaretelefon-Displays werden beim Verbinden (mit Rücksprache) und Pickup nicht aktualisiert
* Instanz startet nach Migration von 19.X auf 19.3 nicht mehr. Siehe [Forumspost](https://www.pascom.net/forum/t/migrationsproblem-pascom-19-03/6563 "Forumspost")


## Release 19.03 (29.01.2020)

**Auf einen Blick**

* Generische Geräte können nun provisioniert werden
* Beronet Gateways und Ämter funktionieren wieder
* Die Snom Basis-Konfiguration verwendet ab sofort XML-Format
* SIP-Header können wieder manuell angepasst werden 
* PJSIP-Header für Ämter werden nun direkt in den Account-Optionen des Amtes konfiguriert, nicht mehr in Skripten (z. B. def_outbound)
* Externe und intere Ruftöne (via Alert-info-header) sind nun nutzbar
* Durchsagegruppen (Intercom) funktionieren wieder
* Aastra/Mitel DECT Handsets zeigen bei laufenden Anrufen keine fehlerhafte Registrierung mehr an
* Grandstream Gateways mit neuer MAC werden ordnungsgemäß angelegt
* Migrationsprobleme mit Grafana (fehlende Weiterleitung und kaputter Login) wurden behoben 
* Die Mail-to-Fax Konfiguration kann nun zwischen SSL, StartTLS und Plain unterscheiden
* Pickup in Verbindung mit TAPI funktioniert nun auch mit mehreren Leitungen
* Modifizierte Snom Basis-Konfigurationen migrieren "Nebenstelle"-Tasten auf "BLF" um Pickup zu ermöglichen
* Auf verschiedenen Snom und Yealink Geräten werden pascom-Logos als Hintergrund provisioniert
* QSC/Plusnet Provider Template berichtigt
* T-M-Net Provider Template hinzugefügt
* magenta.at Provider Template hinzugefügt

**ÄNDERUNGEN:**

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

**Auf einen Blick**

- Anrufe auf dem Mobile Client können wieder zuverlässig angenommen werden.
- Let's Encrypt Zertifikate werden wieder ausgestellt.

**ÄNDERUNGEN:** 

- [MD-11874] - Internal calls softphone to mobile can't be answered
- [MD-11876] - Port let's encrypt to 19
- [MD-11866] - Configure QOS/TOS in asterisk pjsip


## Release 19.01 (21.11.2019)

**Auf einen Blick**

- Yealink BLF-Tasten zeigen wieder den richtigen Status.
- Migrationsprobleme in Verbindung mit Rufgruppen und Aktionen behoben.
- Journal der Yealink-Telefone berücksichtigten wieder die Amtsvorwahl beim Zurückwählen.
- Mikrofon wird bei externen Anrufen zuverlässig stumm geschaltet.
- Halten und Zurückholen bei mehreren Anrufen verbessert.

**ÄNDERUNGEN:** 

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

**Auf einen Blick**

- Kontakte/Kontaktliste überarbeitet.
- Neue Suchfunktion mit Smartfilter.
- Interaktive Anrufobjekte während einem Telefonat.
- Video und Screensharing Funktion.
- pascom Gruppen. Permanente Audio,- Video und Screensharing Gruppen.
- Asterisk Update auf Version 16 LTS.
- Zugriff auf RTP Statistiken.
- Ämtertemplates geändert auf die pjsip Syntax.



