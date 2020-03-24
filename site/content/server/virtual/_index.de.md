---
title: Virtuelle Maschine
description: Installieren Sie den pascom Server als virtuelle Machine in ihrem favorisierten Hypervisor.
weight: 40
---
{{< doctype "self"  >}}

{{< description >}}

## Trainingsvideo

{{< youtube spMOJwPVlUU >}}

## Unterstütze Hypervisoren

|VMWare|hyperV|XenServer|Proxmox|
|---|---|---|---|
|![VMware](vm_vmware.jpg)|![hyperV](vm_hyperv.png)|![xem](vm_xen.png)|![proxmox](vm_proxmox.png)|

## Systemvoraussetungen

|   |< 10 Benutzer|< 50 Benutzer|< 250 Benutzer|< 500 Benutzer|< 1000 Benutzer|
|---|---|---|---|---|---|
|**CPU (x86)**|2 Core| 2 Core|4 Core| 4 Core|8 Core|
|**RAM**|2 GB|4 GB |8 GB|16 GB|32 GB|
|**Festplatte \***|32 GB|64 GB|128 GB|256 GB|512 GB|

**\*** Die Berechnung der Festplattenkapazität geht von einer durchschnittlichen Nutzung aus. Insbesondere die Mitschnitte von Gesprächen können Ihren Platzbedarf massiv beeinflussen. Rechnen Sie hier bitte mit 1 MB Platzbedarf pro 10 Minuten Gesprächsmitschnitt zusätzlich.  

## Ihre Firewall anpassen

Viele Unternehmen haben **keinen eingeschränkten Internetzugriff** und können den **pascom Server** daher **sofort**, ohne jede Anpassung an der Firewall **nutzen**.

Wenn Sie jedoch genau festlegen auf welche Internetdienste Ihr Unternehmensnetzwerk zugreifen darf, schalten Sie bitte folgende Ports für den pascom Server frei, um einen reibungslosen Betrieb der pascom Telefonanlage zu ermöglichen:

### pascom Dienste

| Port | Host | Beschreibung |
| ---- | ---- | ------------ |
| TCP **80**/**443** | my.pascom.net | Zugriff zum pascom Lizenzserver + Push-Services |
| TCP **25** | cloudmx1.pascom.net, cloudmx2.pascom.net | Zugriff zum pascom Mailserver |
| UDP **123** | \* | Zugriff zum bevorzugten Zeitserver (NTP) |
| UDP **3478** | \* | Zugriff für Video-Funktionalität |
| UDP + TCP **19302** | WebRTC |


## ISO Datei herunterladen

Für die Installation einer virtuellen Maschine stellen wir ensprechende [ISO-Dateien](https://www.pascom.net/de/downloads/) auf unserer [Download-Seite](https://www.pascom.net/de/downloads/) zur Verfügung.

## Betriebsystem installieren

Erstellen Sie eine neue virtuelle Maschine und verwenden Sie die pascom Server [ISO-Dateien](https://www.pascom.net/de/downloads/) als Bootmedium. Folgen Sie den Anweisungen am Bildschirm bis Sie dazu aufgefordert werden in Ihren Browser zu wechseln um den Setup Wizard zu starten:

![Betriebssystem installieren](tui.png)

## Setup Wizard starten

Öffnen Sie einen Browser und surfen auf die so eben konfigurierte IP-Adresse Ihres pascom Servers. Folgen Sie den Anweisungen bis Sie sich am Management Interface anmelden können:

![pascom Server Management](management.png)

## Mobilzugriffe via Internet einrichten (optional)

{{% notice note %}}
Wenn Sie dieses Feature nutzen möchten führen Sie diese Schritte jetzt aus. Spätere Änderungen sind möglich, führen jedoch auch zu Änderungen für Ihre Benutzer da sich z. B. der Zugriff auf den Server via pascom Client von einer lokalen IP auf einen DNS Namen ändert. 
{{% /notice %}}

Dieser Schritt ist notwending falls Sie Ihren lokalen pascom Server auch von unterwegs per pascom Mobileclient (iOS/Android App) oder Desktopclient nutzen möchten. 

 * Siehe [Mobilzugriffe via Internet einrichten]({{< ref "howto/mobile-access" >}})

## Telefonanlage einrichten

{{< youtube aNkUjHr7cco >}}

Ein weiterer Assistent hilft Ihnen dabei Ihre Telefonanlage fertig einzurichten und weitere Benutzer anzulegen, bzw. einzuladen.
Gehen Sie hierzu wie folgt vor:

* Melden Sie sich per Browser am pascom Server als admin an
* Klicken Sie auf {{< ui-button "Phone Systems" >}} und dann auf den Namen Ihrere Anlage
* Folgen Sie den Anweisungen des Assistenten
