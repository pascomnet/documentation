---
title: pascom.cloud nutzen
weight: 20
description: Wir bietet allen Free, Basic und Premium Kunden ein kostenloses Hosting in der pascom.cloud. Einfach, sicher, schnell - Jetzt kostenlos starten.
---

{{< doctype "cloud" >}}

{{< description >}}

## Trainingsvideo

{{< youtube aNkUjHr7cco >}}

## pascom.cloud

Die einfachste Möglichkeit pascom zu nutzen ist die für Free-, Basic- und Premium-Kunden kostenlose Nutzung der pascom.cloud.  

Wenn Sie pascom als in der Cloud gehostete Telefonanlage nutzen, ist kein eigenes Hosting nötig. Sie können sofort loslegen, ohne jeden Installationsaufwand. Zusätzliche Hardware ist nicht nötig.

 * [Jetzt kostenlos starten](http://my.pascom.net/do/cloud)

### Ihre Firewall anpassen

Viele Unternehmen haben **keinen eingeschränkten Internetzugriff** und können die **pascom.cloud** daher **sofort**, ohne jede Anpassung an der Firewall **nutzen**.

#### Ziel-Ports

Möchten Sie jedoch genau festlegen auf welche Internetdienste Ihr Unternehmensnetzwerk zugreifen darf, schalten Sie bitte folgende Ports frei:

##### Telefonieren und Chatten

| Port | Beschreibung |
| ---- | ------------ |
| TCP **5061** | SIP-TLS - sichere SIP-Kommunikation |
| TCP **5222** | pascom Desktop- und Mobile-Client Zugriffe |
| UDP **30000 - 35000** | SRTP - verschlüsselte Sprachdaten |
| UDP **3478** | Zugriff für Video-Funktionalität |
| UDP + TCP **19302** | WebRTC | Zugriff für Web Client |

##### Optionale Dienste

| Port | Beschreibung |
| ---- | ------------ |
| TCP **636** | LDAPS für Telefonbuchzugriffe via LDAP |
| TCP **8884**  | Provisionierung von IP-Hardware-Telefonen |
| TCP **8885**  | VPN Tunnel direkt zur Telefonanlage |


#### QoS Einstellungen

pascom.cloud markiert Sprach- und Signal-Pakete. Viele Router/Switche berücksichtigen diesen standardmäßig oder können entsprechend konfiguriert werden.

| Pakettyp | TOS | COS | DSCP decimal |
| -------- | ----- | ----- | ------------ |
| Sprache  | ef/184 | 5 | 46 |
| Siganalisierung | cs3/96 | 3 | 24 |

Auch alle pascom Clients markieren Pakete entsprechen. Bitte beachte Sie, dass speziell unter Windows hierfür Gruppenrichtlinien gesetzt werden müssen. Siehe [Windows QoS Einstellungen]({{< ref "/clients/desktop-installation#windows-qos-einstellungen-optional" >}}).

{{< youtube -HeQi1cWQ2s >}}

#### Ziel-IP-Adressen

Unsere Empfehlung ist es ***nur*** **Ziel-Ports** und ***nicht*** **Ziel-IP-Adressen** einzuschränken. Die pascom.cloud nutzt eine Vielzahl an Services und Balancern und somit auch entsprechen viele Ziel-IP-Adressen. Auch wird die Liste der Ziel-IP-Adressen ständig erweitert und ist für Sie somit schwierig zu pflegen.

Sollten Sie dennoch eine aktuelle Liste der Ziel-IP-Adressen benötigen wenden Sie sich bitte an unseren Support.



