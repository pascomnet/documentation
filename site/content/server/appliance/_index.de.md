---
title: pascom Appliance
description: Die pascom Appliance ist ein vorinstallierter Server zur Vor-Ort-Installation.
weight: 30
---

{{< doctype "self"  >}}

{{< description >}}

**Nützliches Vorwissen**


 * [pascom Server Systemaufbau]({{< ref "concept/server" >}})

## pascom Appliance

![pascom Appliance](pascom-appliance.png)


### Ihre Firewall anpassen

Viele Unternehmen haben **keinen eingeschränkten Internetzugriff** und können die **pascom Appliance** daher **sofort**, ohne jede Anpassung an der Firewall **nutzen**.

Wenn Sie jedoch genau festlegen auf welche Internetdienste Ihr Unternehmensnetzwerk zugreifen darf, schalten Sie bitte folgende Ports für die pascom Appliance frei, um einen reibungslosen Betrieb der pascom Telefonanlage zu ermöglichen:

#### pascom Dienste

| Port | Host | Beschreibung |
| ---- | ---- | ------------ |
| TCP **80**/**443** | my.pascom.net | Zugriff zum pascom Lizenzserver + Push-Services |
| TCP **25** | cloudmx1.pascom.net, cloudmx2.pascom.net | Zugriff zum pascom Mailserver |
| UDP **123** | \* | Zugriff zum bevorzugten Zeitserver (NTP) |


## pascom Server installieren (nur bei Neuinstallation)
{{% notice warning %}}
Im Auslieferungszustand ist der pascom Server bereits vorinstalliert. Führen Sie diesen Schritt nur dann aus wenn Sie eine Neuinstallation des Systems vornehmen möchten!
{{% /notice %}}

### Vorraussetzungen

* USB-Stick mit mindestes 8 GB Kapazität
* Kostenlosen Flash Tool [Rufus](https://rufus.akeo.ie/) (nur für Windows)
* pascom Server [ISO-Dateien](https://www.pascom.net/de/download/)

### USB-Stick flashen

Verbinden Sie den USB-Stick mit Ihrem Computer und starten Sie das Tool Rufus. Wählen Sie nun das pascom Server-ISO unter {{< ui-button "SELECT" >}}, wählen Sie den USB-Stick via {{< ui-button "Device" >}} und klicken Sie im Anschluss auf {{< ui-button "START" >}}:

![Rufus](rufus.png?width=300px "Rufus")

### USB-Stick anstecken

Den so vorbereiteten USB-Stick können Sie nun direkt an den USB3-Port (Rückseite, blauer Port) anstecken.

## Appliance anschließen

![Schnellstartanleitung](getting_started_guide.de.png?width=80%)

{{% button href="getting_started_guide.pdf" icon="fa fa-download" %}} Schnellstartanleitung herunterladen{{% /button %}}

## Erster Systemstart

Komplettieren Sie das Setup und folgen Sie den Anweisungen am Bildschirm bis Sie dazu aufgefordert werden in Ihren Browser zu wechseln um den Setup-Wizard zu starten:

![Betriebssystem installieren](tui.png)

## Setup Wizard starten

Öffnen Sie einen Browser und surfen auf die so eben konfigurierte IP-Adresse Ihres pascom Servers. Folgen Sie den Anweisungen bis Sie sich am Management-Interface anmelden können:

![pascom Server Management](management.png)

## Mobilzugriffe via Internet einrichten (optional)

{{% notice note %}}
Wenn Sie dieses Feature nutzen möchten führen Sie diese Schritte jetzt aus. Spätere Änderungen sind möglich, führen jedoch auch zu Änderungen für Ihre Benutzer da sich z. B. der Zugriff auf den Server via pascom Client von einer lokalen IP auf einen DNS-Namen ändert.
{{% /notice %}}

Dieser Schritt ist notwending falls Sie Ihren lokalen pascom Server auch von unterwegs per pascom Mobileclient (iOS/Android App) oder Desktopclient nutzen möchten.

 * Siehe [Mobilzugriffe via Internet einrichten]({{< ref "howto/mobile-access" >}}).

## Telefonanlage einrichten

Ein weiterer Assistent hilft Ihnen dabei Ihre Telefonanlage fertig einzurichten und weitere Benutzer anzulegen, bzw. einzuladen.
Gehen Sie hierzu wie folgt vor:

* Melden Sie sich per Browser am pascom Server als **admin** an.
* Klicken Sie auf {{< ui-button "Phone Systems" >}} und dann auf den Namen Ihrere Anlage.
* Folgen Sie den Anweisungen des Assistenten.
