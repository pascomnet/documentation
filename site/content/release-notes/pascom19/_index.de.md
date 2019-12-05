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


## Bekannte Probleme

{{% notice issues %}}
Diese Probleme sind uns in pascom 19 bereits bekannt und wir arbeiten aktuell an einer Lösung  
{{% /notice %}}

* [MD-11810] - Beronet Unterstützung funktioniert nicht 
* [MD-11842] - SIP Header können nicht durch den Admin verändert werden
* QSC Trunks funktionieren nicht in allen Fällen 
* Das Durchsagesystem funktioniert nicht
* Hardwaretelefon-Displays werden beim Verbinden (mit Rücksprache) und Pickup nicht aktualisiert
* [MD-11892] - Grandstream ATA HT802 in neuem MAC-Bereich C074AD* werden als Telefon und nicht als Gateway erkannt


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



