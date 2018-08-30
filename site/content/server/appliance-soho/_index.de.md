---
title: pascom SOHO Server
description: Der pascom SOHO-Server ist die perfekte Lösung für kleine Büros oder Außenstandorte mit eigener Hardware
weight: 30
---

{{< doctype "self"  >}}

{{% notice warning %}}
**ABGEKÜNDIGT** - Der pascom SOHO Server wird weiterhin unterstütz jedoch nicht mehr neu verkauft. Er wurde durch die [pascom Appliance]({{< ref "server/appliance" >}}) ersetzt.
{{% /notice %}}

{{< description >}}
 
**Nützliches Vorwissen**
 
 
 * [pascom Server Systemaufbau]({{< ref "concept/server" >}})

 
## pascom SOHO Server

![pascom SOHO Server](pascomSOHOserver.png)

## pascom Server installieren (nur bei Neuinstallation)
{{% notice warning %}}
Im Auslieferungszustand ist der pascom Server bereits vorinstalliert. Führen Sie diesen Schritt nur dann aus wenn Sie eine Neuinstallation des Systems vornehmen möchten!
{{% /notice %}}

### Vorraussetzungen

* USB-Stick mit mindestes 8 GB Kapazität
* Kostenlosen Flash Tool [Rufus](https://rufus.akeo.ie/) (nur für Windows)
* pascom Server [ISO-Dateien](https://www.pascom.net/de/download/)
 
### USB-Stick flashen
{{% notice info %}}
Der USB-Stick muss nach dem Flashen ein **FAT-Dateisystem** enthalten da Sie die **setup.json** für das automatische Setup **anpassen** müssen. Tools wie Etcher erstellen auf dem USB-Stick ein Read Only ISO Datei System. Dadurch ist die nötige Anpassung der setup.json nicht möglich. Verwenden Sie daher in jedem Fall **Rufus** um den USB-Stick zu erzeugen.
{{% /notice %}}


Verbinden Sie den USB-Stick mit Ihrem Computer und starten Sie das Tool Rufus. Wählen Sie nun das pascom Server ISO unter {{< ui-button "SELECT" >}}, wählen Sie den USB-Stick via {{< ui-button "Device" >}} und klicken Sie im Anschluss auf {{< ui-button "START" >}}:

![Rufus](rufus.png?width=300px "Rufus")

### Automatik Setup vorbereiten

Da der pascom SOHO Server keine Monitoranschluss hat müssen Sie auf dem USB-Stick noch eine Datei mit dem Namen **setup.json** anlegen und mit Ihren Netzwerkeisntellungen vorbelegen. Dadurch bootet das System automatisch und konfiguriert das Netzwerk entsprechen. Somit können Sie direkt nach dem Systemstart mit dem Webbasierten Setup fortfahren.

```json
{
    "device": "sda",
    "skipWelcome": true,
    "skipHostname": true,
    "hostname": "pascom-server",
    "skipNetwork": true,
    "network": {
        "interface": "ens160",
        "mode": "static",
        "ip": "192.168.0.1",
        "netmask": "255.255.255.0",
        "gateway": "192.168.0.254",
        "dns1": "192.168.0.254"
    }
}
```


### USB-Stick anstecken

Den so vorbereiteten USB-Stick können Sie nun direkt an den USB Port des Servers anstecken.

## Appliance anschließen

* Schließen Sie das Netzwerk and die **linke** der drei Netzwerkbuchsen an
* Verbinden Sie das Netzteil
* Der Server beginnt automatisch zu starten

## Erster Systemstart

Nach kurzer Zeit steht das System entweder unter der Standard-IP-Adresse **192.168.100.1** (Auslieferungszustand) oder der von Ihnen per **setup.json** festgelegten **IP-Adresse** zur Verfügung.

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



