---
title: Snom M700 DECT-System
description: Integrieren Sie Ihr Snom DECT-System in die pascom.
weight: 20
---


{{< doctype "both"  >}}

{{< description >}}

![Snom M700](snom_m700_dect.png?width=600px)


## Übersicht

Die Basisstation M700 lässt sich sowohl einzeln als auch als Multizellenkonfiguration betreiben. Sie ist ideal für Unternehmen geeignet, die eine Funkabdeckung über mehrere Etagen oder in großen Bürogebäuden benötigen.

### Verfügbare Kanäle

||Snom M700 - Einzelle|Snom M700 - Multizelle|
|----|----|----|
|Schmalband (g711, g729, g726)|10|8|
|Breitband (g722), SRTP aktiviert (g722, g711, g729, g726)|5|4|

### Vorbereitung

Für die automatische Inbetriebnahme ist ein funktionierender DHCP-Server zwingend erforderlich.


## Konfiguration

Schließen Sie jetzt alle Basisstationen, die Sie verwenden wollen, an das Netzwerk an. Diese werden nach dem Bootvorgang automatisch in der Liste der Gateways (unter `Gateways` > `Gatewayliste`) erscheinen.
Das Feld **Status** hat keine Aussagekraft. Die Warnung mit dem "Steckersymbol" ist normal.

### Multizellenbetrieb konfigurieren

Falls Sie mehrere Gateways zum Multizellenbetrieb vernetzen möchten markieren Sie alle betroffenen Gateways und klicken dann auf `Bearbeiten`. Wählen Sie für eines der Gateways unter *Multi Cell* den Wert **Basisstation** aus, auf allen anderen Gateways **Repeater** aus. Durch die Pfeilschaltfläche können Sie durch alle zuvor markierten Gateways navigieren und die Änderungen entsprechend vornehmen.

### Handsets anlegen und zuweisen

Wählen Sie unter `Endgeräte` > `Geräteliste` > `Hinzufügen` den Eintrag *Via snom DECT Gateway: Mobilteil* aus. Folgende Einstellungen müssen Sie vornehmen:

|Einstellunge|Beschreibung|
|---|---|
|Angeschlossen an|Wählen Sie hier den DECT-Sender, bzw. bei Mulizellenbetrieb das DECT-System.|
|IPEI Nummer|Geben Sie hier die IPEI-Nummer des Handsets ein.|
|SIP Optionen|Optional können Sie hier asterisk-spezifische Sip-Optionen eintragen.|
|Zuweisung|In diesem Reiter können Sie einen Benutzer zuweisen.|
