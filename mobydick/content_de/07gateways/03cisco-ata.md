---
title: Cisco SPA112
prev: /isdn-analog/beronet-gateways/
url: /isdn-analog/cisco-spa112/
next: /isdn-analog/patton-gateways/
weight: 53
toc: true
---

![Cisco SPA112](/cisco_spa112.jpg?width=300px)

## Kompatibilität

|Provisionierung|Firmware-Verwaltung|
|---|---|
|ja|nein|

**Provisionierung**: Das Gateway wird über die mobydick verwaltet.<br>
**Firmware-Verwaltung**: Die Firmware kann nicht über mobydick aktualisiert werden.<br>

Das Cisco-SPA112-Gateway besitzt zwei FXS-Anschlüsse für zwei analoge Endgeräte.

## Konfiguration

### Vorbereitung

Für die automatische Inbetriebnahme ist ein funktionierender DHCP-Server zwingend erforderlich. Lesen Sie dazu
[Netzwerk planen und konfigurieren](../../server/netzwerk-konfigurieren/).

### Inbetriebnahme

Schließen Sie den Cisco SPA112  an das Netzwerk an. Dieser wird nach dem Bootvorgang automatisch in der Liste der Gateways unter `Gateways` > `Gatewayliste` erscheinen.

<!--FIXME steckersymbol, status?-->

### Endgerät über SIP anlegen

Wählen Sie unter `Endgeräte` > `Geräteliste` > `Hinzufügen` > den Eintrag **Via Cisco Gateway: Analoges Endgerät per SIP**.
Im Tab `Basisdaten` wählen Sie den Port am Gateway, an dem das Endgerät angeschlossen werden soll. Anschließend weisen Sie das Gerät über den Tab `Zuweisung` einem Benutzer zu.

Nach dem Speichern startet das Gateway neu. anschließend wird der Cisco SPA112 von der mobydick provisioniert.
