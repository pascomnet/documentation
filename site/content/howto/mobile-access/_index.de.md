---
title: Mobilzugriffe via Internet einrichten
description: Dieser Schritt ist notwending falls Sie Ihren lokalen pascom Server auch von unterwegs per pascom mobile Client (iOS/Android App) oder Desktopclient nutzen möchten
weight: 10
---
 
{{< doctype "self" >}}
 
{{< description >}}

## (Variante 1) Externe IP-Adresse ohne Zertifikat

In dieser Variante nutzen Sie Ihre feste, externe IP-Adresse direkt, ohne die Einrichtung eines Domainnames oder Zertifikaten. 

**Voraussetzung**

 * Feste, externe IP-Adresse

**Vorteil**

 * Einfacher einzurichten

**Nachteil**

 * Geringere Sicherheit, da "Self Signed" Zertifikat
 * Ihre Benutzer müssen eine IP-Adresse statt eines eingängigen Domainnamens für die Ersteinrichtung des pascom Desktop Clients kennen
 
### Ihre Firewall anpassen

Um den Zugriff auf Ihren pascom Server aus dem Internet einzurichten ist es notwendig ein Forwarding auf die IP-Adresse des pascom Server für folgende Ports einzurichten:

[Firewall konfigurieren / Portübersicht]({{< ref "/server/port-overview" >}})

### pascom Server Interface anpassen

Nachdem Sie Ihre Firewall angepasst haben müssen Sie Ihre externe IP-Adresse am pascom Server Interface eintragen:

* Melden Sie sich per Browser am pascom Server als admin an
* Klicken Sie auf {{< ui-button "Interface" >}}
* Klicken Sie auf {{< ui-button "Edit" >}} bei dem von Ihnen verwendeten Interface
* Tragen Sie unter {{< ui-field "Interface DNS Name" >}} Ihre externe IP-Adresse ein
* Durch {{< ui-button "Save" >}} wenden Sie die Konfiguration an

Das Interface startet nun neu. Jetzt können Sie mit der Einrichtung Ihrer Telefonanlage fortfahren.
 

## (Variante 2) Eigener, externer Domainname

In dieser Variante haben Sie einen eigenen, extern erreichbaren Domainnamen der auf die externe IP-Adresse Ihres Routers zeigt.

**Voraussetzung**

 * Feste, externe IP-Adresse
 * Domainname der auf die externe IP-Adresse verweist

**Vorteil**

 * Mehr Sicherheit
 * Vollautomatische Verwendung von Let's Encrypt möglich
 * Ihre Benutzer sehen nur den eingängigen Domainnamen statt einer IP-Adresse

**Nachteil**

 * Einrichtung ist ein wenig komplizierter
 
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

### Domainnamen einrichten

Da nur auf Domainnamen und nicht auf IP-Adressen gültige Zertifikate erstellt werden können müssen Sie zunächst einen Domainnamen für die externe IP-Adresse Ihres Internetzuganges einrichten.

Sollte Ihnen kein eigener, externer DNS Server zu verfügung stehen bietet [no-ip](https://www.noip.com/) eine einfache Möglichkeit auf Ihrem Router (Fritzbox, etc) einen extern erreichbaren Domainnamen einzurichten.

### Let's encrypt aktivieren

Nachdem Sie Ihre Firewall angepasst und einen Domainnamen eingerichtet haben ist der pascom Server in der Lage vollautomatisiert ein Let's Encrypt Zertifikat für diesen Domainnamen einzurichten. Hierzu sind folgende Schritte notwendig:

* Melden Sie sich per Browser am pascom Server als admin an
* Klicken Sie auf {{< ui-button "Interface" >}}
* Klicken Sie auf {{< ui-button "Edit" >}} bei dem von Ihnen verwendeten Interface
* Tragen Sie unter {{< ui-field "Interface DNS Name" >}} den zuvor eingerichteten {{< ui-input "Domainname" >}} ein
* Schalten Sie den {{< ui-field "Certificate mode" >}} auf {{< ui-input "Let's Encrypt" >}}
* Durch {{< ui-button "Save" >}} wenden Sie die Konfiguration an

Das Interface startet nun neu und bezieht automatisch das Let's Encrypt Zertifikat. Sollte der Start des Interfaces fehl schlagen prüfen Sie bitte Ihre Firewall-Einstellungen, insbesondere Port TCP 443, und Ihren Domainnamen erneut.

Jetzt können Sie mit der Einrichtung Ihrer Telefonanlage fortfahren.