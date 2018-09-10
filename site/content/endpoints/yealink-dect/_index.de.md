---
title: Yealink W52P DECT-System
description: Integrieren Sie Ihr Yealink DECT-System in die pascom.
weight: 40
---

![Yealink W52P](yealink_w52p_dect.png?width=300px)


## Übersicht

Die Basisstation W52P ist ideal für kleine Unternehmen geeignet, die nur eine geringe Anzahl an Handsets mit bis zu 5 Mobilteilen benötigen.

### Vorbereitung

Für die automatische Inbetriebnahme ist ein funktionierender DHCP-Server zwingend erforderlich.

## Konfiguration

Schließen Sie jetzt alle Basisstationen, die Sie verwenden wollen, an das Netzwerk an. Diese werden nach dem Bootvorgang automatisch in der Liste der Gateways (unter `Gateways` > `Gatewayliste`) erscheinen.
Das Feld **Status** hat keine Aussagekraft. Die Warnung mit dem "Steckersymbol" ist normal.

### Handsets anlegen und zuweisen

Es können bis zu 5 Handsets an einer Basisstation registriert werden.

Wählen Sie unter `Endgeräte` > `Geräteliste` > `Hinzufügen` den Eintrag *Via yealink DECT Gateway: Mobilteil* aus. Folgende Einstellungen müssen Sie vornehmen:

|Einstellunge|Beschreibung|
|---|---|
|Angeschlossen an|Wählen Sie hier den DECT-Sender.|
|Zuweisung|In diesem Reiter können Sie einen Benutzer zuweisen.|

## Handsets am DECT Sender registrieren

Die Handsets verbinden sich automatisch mit dem DECT-Sender, sobald diese in den Ladeschalen stehen und die Provisionierung des DECT-Senders angewendet wurde.

{{% notice note %}}
Ggf. ist ein Neustart der DECT-Sender notwendig.
{{% /notice %}}
