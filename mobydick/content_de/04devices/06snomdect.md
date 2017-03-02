---
title: snom SIP Dect einrichten
keywords:
description:
prev: /endgeraete/beliebiges-ip-geraet/
url:  /endgeraete/snom-dect/
next: /endgeraete/aastra-dect/
weight: 46
toc: true
draft: false
---


## Übersicht

Die Basisstation M700 lässt sich sowohl einzeln als auch als Multizellenkonfiguration betreiben. Sie ist ideal für Unternehmen geeignet, die eine Funkabdeckung über mehrere Etagen oder in großen Bürogebäuden benötigen.

## Konfiguration
{{% notice warning %}}
Für die automatische Inbetriebnahme des snom DECT Systems ist ein funktionierender DHCP-Server zwingend erforderlich. Siehe DHCP-Server Konfiguration.
{{% /notice %}}

### Basisstationen anschließen
Schließen Sie jetzt alle Basisstationen, die Sie verwenden wollen, an das Netzwerk an. Diese werden nach dem Bootvorgang automatisch in der Liste der Gateways ('Gateways' > 'Gatewayliste') erscheinen:


Das Feld **Status** hat aktuell keine Aussagekraft. Die Warnung mit dem "Steckersymbol" ist normal.

### Multizellenbetrieb konfigurieren (optional)
Falls Sie mehrere Gateways zum Multizellenbetrieb vernetzen möchten markieren Sie alle betroffenen Gateways und klicken dann auf **Bearbeiten**:

Wählen Sie für eines der Gateways unter Multi Cell den Wert Baisisstation aus, auf allen anderen Gateways Repeater aus. Durch die Pfeilschaltfläche können Sie durch alle zuvor markierten Gateways navigieren und die Änderungen entsprechend vornehmen.

### Handsets anlegen und zuweisen
Wählen Sie unter `Endgeräte` > `Geräteliste` > `Hinzufügen` den Eintrag Via snom DECT Gateway: Mobilteil aus:

darauf hin können Sie die Details für dieses Handset festlegen und einen Benutzer oder Arbeitsplatz zuweisen:


Angeschlossen an	Wählen Sie hier ein Gateway aus. Beim Multizellenbetrieb werden alle Gateways die als Repeater markiert wurden automatisch ausgeblendet.
IPEI Nummer
Geben Sie hier die IPEI Nummer des Handsets an. Diese können vom Display des Handsets unter Einstellungen > Status abrufen:

Es genügt erste Zeile der IPEI, auf die : kann bei der Eingabe verzichtet werden.
SIP Optionen	(Optional) Hier können Sie alle in Asterisk verfügbaren SIP Peer Optionen eintragen. Siehe Asterisk Dokumentation Abschnitt SIP configurations - peers and clients
