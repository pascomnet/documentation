---
title: Sonstige SIP-Endgeräte
description: So binden Sie SIP-Engeräte weiterer, nicht offiziell unterstützer Hersteller in die pascom ein
weight: 100
---

{{< doctype "both"  >}}

{{< description >}}

{{% notice warning %}}
Bitte beachten Sie, dass Ihnen das pascom Support Team bei der Einbindung nicht unterstützer Telefone keine Hilfestellung leisten kann. Wenden Sie sich daher bei Fragen bitte direkt an unser [Forum](https://www.pascom.net/forum). 
{{% /notice %}}

## Einschränkungen

Nicht unterstützte Telefone können vom pascom Server weder automatisch konfiguriert werden noch steht am Endgerät das pascom Menü zur Verfügung.

Die Fernsteuerung via pascom Client ist nur eingeschränkt möglich. 

## Voraussetzungen des Engerätes 

Um ein SIP-Endgerät am pascom Server betreiben zu können sind folgende Funktionen notwendig:

* **SIP via TCP/TLS** (verschlüsseltes Signaling)
* **SRTP** (verschlüsselte Gesprächsdaten)
* **Outbound-Proxy** (senden der Daten via Session Border Controller)

## Konfiguration

### Endgerät anlegen

Loggen Sie sich in Ihre Telefonanlage ein und fügen unter `Endgeräte > Geräteliste` ein
neues Gerät vom Typ **IP-Telefon: Hersteller beliebig oder Softphone** hinzu.

Passen Sie den `Geräte-Anmeldename` an oder nutzen Sie den automatisch generierten.
Notieren Sie sich `Geräte-Anmeldename` und `Passwort`. 

### Benutzer anlegen/zuswiesen

Legen Sie nun unter `Benutzer > Benutzerliste` einen neuen Benutzer an oder wählen Sie einen vorhandenen Benutzer und weisen ihm das so eben erstellte Gerät zu. 

### Jobs Anwenden

Nach dem Speichern von Änderungen erscheint in der Job-Box (oben) ein
entsprechender Eintrag die Telefonie anzuwenden. Starten Sie den Job durch
einen Klick auf den `grünen Haken`.

### Am SIP-Endgerät

{{% notice tip %}}
Leider nutzen viele Hersteller für die gleiche Einstellung verschiedene
Begrifflichkeiten. Lassen Sie sich davon nicht irritieren. Evtl. müssen Sie
ein wenig experimentieren. In der folgenden Tabelle werden häufige Begriffe
genannt.
{{% /notice %}}

Am SIP-Endgerät müssen Sie folgende Einstellungen treffen:

|Einstellung|Beispiel-Wert|Beschreibung|
|---|---|---|
|Registrar, SIP-Server|**pascom**|Der Name der Telefonanlage|
|Proxy, Outbound-Proxy|**pascom.cloud**|DNS-Name oder IP-Adresse des Servers|
|SIP-Port| **TCP 5061** | TLS SIP Port|
|Username, Identity, Authuser|**mein-telefon-name**|Der Geräte-Anmeldename|
|Password|*****| Passwort des Gerätes, nicht des Benutzers!|

#### SIP TLS und SRTP

Lesen Sie im Handbuch des IP-Endgerätes nach wie man SIP TLS und SRTP aktiviert.
Eventuell sind hierfür mehrere Einstellungen nötig.

## Anruf testen

Rufen Sie zum Test mit dem SIP-Endgerät die **\*100**. Hier sollte Sie die
Mailboxansage der pascom hören.
