---
title: Cloud Service Provider (CSP)
weight: 60
description: Dieses Setup richtet sich an pascom Partner die selbst Hosting Anbieter sind
---

{{< doctype "self" >}}
 
{{< description >}}


{{% notice warning %}}
Um CSP Hosts in my.pascom.net erstellen und betreiben zu können müssen Sie CSP Partner sein. Bitte wenden Sie sich an unseren Vertrieb um weitere Informationen zu erhalten. 
{{% /notice %}}

## Was ist ein CSP?

CSP sind pascom Partner die **selbst** ein pascom **Hosting Angebot** erstellen möchten. Der pascom Server ist **Mandatenfähig** und **Multihostfähig** und daher die ideale Plattform für Hoster.

## Systemaufbau

Als CSP setzten Sie beliebig viele **CSP-Hosts** auf. Jeder dieser Hosts kann bis zu **32 Telefonanlagen** (getrennte Kunden) betreiben.  

Jeder Host hat seinen eigenen Domain-Name. Z.B.:

```bash
pbx1.superhoster.de
pbx2.superhoster.de
...
```

Die einzelnen Telefonanlagen sind über die jeweiligen Host erreichbar: 

```bash
pbx1.superhoster.de/kunde1
pbx1.superhoster.de/kunde2
pbx2.superhoster.de/kundeXY
...
```

## Systemvoraussetzungen

Als Hypervisor wird **VMware ESX 6.5 oder höher** vorausgesetzt. **Jeder CSP-Host (32 Telefonanlagen)** hat folgenden Systemanforderungen:

| Ressource | Größe |
|---|---|
|**CPU (x86)**|4 Core|
|**RAM**|48 GB|
|**Festplatte \***|64 GB|

**\*** Die Berechnung der Festplattenkapazität geht von einer durchschnittlichen Nutzung aus. Insbesondere die Mitschnitte von Gesprächen können Ihren Platzbedarf massiv beeinflussen. Rechnen Sie hier bitte mit 1 MB Platzbedarf pro 10 Minuten Gesprächsmitschnitt zusätzlich.  

## CSP-Host Setup

### CSP-Host in my.pascom.net erstellen

Loggen Sie sich in **my.pascom.net** ein und erstellen Sie unter {{< ui-button "Abonnements" >}} > {{< ui-button "Meine Abonnements" >}} via {{< ui-button "CSP-Host hinzufügen" >}} einen neuen CSP-Host. Sie können so viele CSP-Hosts anlegen wie sie möchten. CSP-Hosts sind mit keinerlei Kosten verbunden.

### ISO Datei herunterladen

Für die Installation des CSP-Hosts laden Sie sich **pascom Server ISO 18.5 oder höher** von unserer [Download-Seite](https://www.pascom.net/de/downloads/) herunter.

### Betriebsystem installieren

Erstellen Sie eine neue virtuelle Maschine und verwenden Sie die pascom Server [ISO-Dateien](https://www.pascom.net/de/download/) als Bootmedium. Folgen Sie den Anweisungen am Bildschirm bis Sie dazu aufgefordert werden in Ihren Browser zu wechseln um den Setup Wizard zu starten:

![Betriebssystem installieren](tui.png)

### Setup Wizard starten

Öffnen Sie einen Browser und surfen auf die so eben konfigurierte IP-Adresse Ihres pascom Servers. Folgen Sie den Anweisungen bis Sie sich am Management Interface anmelden können:

![pascom Server Management](management.png)

### Mobilzugriffe via Internet einrichten 

{{% notice note %}}
Führen Sie diesen Schritt unbedingt aus bevor Sie die erste Telefonanlage in Betrieb nehmen. Spätere Änderungen sind möglich, führen jedoch auch zu Änderungen für Ihre Kunden.
{{% /notice %}}

Dieser Schritt ist notwending damit Ihre Kunden den Mobileclient (iOS/Android App) oder Desktopclient nutzen können. 

 * Siehe [Mobilzugriffe via Internet einrichten]({{< ref "howto/mobile-access" >}})


## Telefonanlage für den Kunden aufsetzten

Ist **mindestens ein CSP-Host aufgesetzt** können Sie **FREE-, BASIC- und PREMIUM-Abonnements** für Ihren Kunden anlegen und die Telefonanlagen entsprechend hochfahren. 

### (Option A) Telefonanlage am CSP-Host erstellen 

Melden Sie sich auf der **Management-Oberfläche des CSP-Hosts** an und klicken Sie unter {{< ui-button "Telefonanlagen" >}} auf {{< ui-button "Neue hinzufügen" >}}. 

Sie werden nach my.pascom.net umgeleitet und können dort ein neues Abonnement für Ihren Kunden erstellen.

Zurück am CSP-Host startet automatisch ein Job zum Update der Abonnements.

Nach wenigen Sekunden erscheint das neu angelegte Abonnement unter Telefonanlagen und kann für Ihren Kunden eingerichtet werden.


### (Option B) Telefonanlage via my.pascom.net erstellen

Melde Sie sich unter **my.pascom.net** an und erstellen Sie unter {{< ui-button "Abonnenments" >}} > {{< ui-button "Kunden Abonnements" >}} via {{< ui-button "Neues Abonnement" >}} eine neue Telefonanlage.

Im Verlauf des Prozesses haben Sie die Möglichkeit anstatt der pascom.cloud oder einer VorOrt Installation einen Ihrer CSP-Hosts zu wählen.

Haben Sie den Prozess abgeschlossen melden Sie sich an der **Management-Oberfläche des CSP-Host** an und aktualisieren unter {{< ui-button "System" >}} via {{< ui-button "Lizenz aktualisieren" >}} Ihre Lizenz.

Nach wenigen Sekunden erscheint das neu angelegte Abonnement unter Telefonanlagen und kann für Ihren Kunden eingerichtet werden.





