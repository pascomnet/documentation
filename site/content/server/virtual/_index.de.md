---
title: Virtuelle Maschine
description: Installieren Sie den pascom Server als virtuelle Machine in ihrem favorisierten Hypervisor.
weight: 40
---

{{< description >}}

**Nützliches Vorwissen**

 * [pascom Server Systemaufbau]({{< ref "concept/server" >}})

## Unterstütze Hypervisoren

|VMWare|hyperV|XenServer|Proxmox|
|---|---|---|---|
|![VMware](vm_vmware.jpg)|![hyperV](vm_hyperv.png)|![xem](vm_xen.png)|![proxmox](vm_proxmox.png)|

## Systemvoraussetungen

|   |< 10 Benutzer|< 50 Benutzer|< 250 Benutzer|< 500 Benutzer|< 1000 Benutzer|
|---|---|---|---|---|---|
|**CPU (x86)**|1 Core| 1 Core|1 Core| 2 Core|4 Core|
|**RAM**|2 GB|4 GB |8 GB|16 GB|32 GB|
|**Festplatte \***|32 GB|64 GB|128 GB|256 GB|512 GB|

**\*** Die Berechnung der Festplattenkapazität geht von einer durchschnittlichen Nutzung aus. Insbesondere die Mitschnitte von Gesprächen können Ihren Platzbedarf massiv beeinflussen. Rechnen Sie hier bitte mit 1 MB Platzbedarf pro 10 Minuten Gesprächsmitschnitt zusätzlich.  

## ISO Datei herunterladen

Für die Installation einer virtuellen Maschine stellen wir ensprechende [ISO-Dateien](https://www.pascom.net/de/download/) auf unserer [Download-Seite](https://www.pascom.net/de/download/) zur Verfügung.

## Betriebsystem installieren

Erstellen Sie eine neue virtuelle Maschine und verwenden Sie die pascom Server [ISO-Dateien](https://www.pascom.net/de/download/) als Bootmedium. Folgen Sie den Anweisungen am Bildschrim bis Sie dazu aufgefordert werden in Ihren Browser zu wechseln um den Setup Wizard zu starten:

![Betriebssystem installieren](tui.png)

## Setup Wizard starten

Öffnen Sie einen Brwoser und surfen auf die so eben konfigurierte IP-Adresse Ihres pascom Servers. Folgen Sie den Anweisungen bis Sie sich am Management Interface anmelden können:

![pascom Server Management](management.png)

## Mobilzugriffe via Internet einrichten (optional)

{{% notice note %}}
Wenn Sie dieses Feature nutzen möchten führen Sie diese Schritte jetzt aus. Spätere Änderungen sind möglich, führen jedoch auch zu Änderungen für Ihre Benutzer da sich z.B. der Zugriff auf den Server via pascom Client von einer lokalen IP auf einen DNS Namen ändert. 
{{% /notice %}}

Dieser Schritt ist notwending falls Sie Ihren lokalen pascom Server auch von unterwegs per pascom Mobileclient (iOS/Android App) oder Desktopclient nutzen möchten. Da die Zugriffe durch unsere Session Border Controller abgesichert werden ist auch die Erstellung entsprehender Zertifikate notwendig. 

### Domainnamen einrichten

Da nur auf Domainnamen und nicht auf IP-Adressen gültige Zertifikate erstellt werden können müssen Sie zunächst einen Domainnamen für die externe IP-Adresse Ihres Internetzuganges einrichten.

Sollte Ihnen kein eigener, externer DNS Server zu verfügung stehen bietet [no-ip](https://www.noip.com/) eine einfache wie kostenlose Möglichkeit auf Ihrem Router (Fritzbox, etc) einen extern erreichbaren Domainnamen einzurichten.

### Ihre Firewall anpassen

Um den Zugriff auf Ihren pascom Server aus dem Internet einzurichten ist es notwendig ein Forwarding auf die IP-Adresse des pascom Server für folgende Ports einzurichten:

#### Telefonieren und Chatten

| Port | Beschreibung |
| ---- | ------------ |
| TCP **80**/**443** | Webinterface der Telefonanlage - wichtig für Let's Encrypt Zertifikat |
| TCP **5061** | SIP-TLS - sichere SIP-Kommunikation |
| TCP **5222** | pascom Desktop- und Mobile-Client Zugriffe |
| UDP **30000 - 35000** | SRTP - verschlüsselte Sprachdaten |

#### Optionale Dienste

| Port | Beschreibung |
| ---- | ------------ |
| TCP **636** | LDAPS für Telefonbuchzugriffe via LDAP |
| TCP **8884**  | Provisionierung von IP-Hardware-Telefonen |
| TCP **8885**  | VPN Tunnel direkt zur Telefonanlage |

### Let's encrypt aktivieren

Nachdem Sie Ihre Firewall angepasst und einen Domainnamen eingerichtet haben ist der pascom Server in der Lage vollautomatisiert ein Let's Encrypt Certificate für diesen Domainnamen einzurichten. Hierzu sind folgende Schritte notwendig:

* Melden Sie sich per Browser am pascom Server als admin an
* Klicken Sie auf {{< ui-button "Interface" >}}
* Klicken Sie auf {{< ui-button "Edit" >}} bei dem von Ihnen verwendeten Interface
* Tragen Sie unter {{< ui-field "Interface DNS Name" >}} den zuvor eingerichteten {{< ui-input "Domainname" >}} ein
* Schalten Sie den {{< ui-field "Certificate mode" >}} auf {{< ui-input "Let's Encrypt" >}}
* Durch {{< ui-button "Save" >}} wenden Sie die Konfiguration an

Das Interface startet nun neu und bezieht automatisch das Let's Encrypt Certificate. Sollte der Start des Interfaces fehl schlagen prüfen Sie bitte Ihre Firewall-Einstellungen, insbesondere Port TCP 443, und Ihren Domainnamen erneut.

## Telefonanlage einrichten

Ein weiterer Assistent hilft ihnen dabei Ihre Telefonanlage ferig einzurichten und weitere Benutzer anzulegen, bzw. einzuladen.
Gehen Sie hierzu wie folgt vor:

* Melden Sie sich per Browser am pascom Server als admin an
* Klicken Sie auf {{< ui-button "Phone Systems" >}} und dann auf den Namen Ihrere Anlage
* Folgen Sie den Anweisungen des Assistenten
