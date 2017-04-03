---
title: Grandstream ATA HT701 und HT802
prev: /isdn-analog/
url: /isdn-analog/grandstream-ata-ht-serie/
next: /isdn-analog/beronet-gateways/
weight: 51
toc: true
---

## Kompatibilität

**Grandstream HT701**

- Ein FXS-Anschluss für ein analoges Endgerät
![Grandstream HT701](/grandstream_ht701.jpg)


**Grandstream HT802**

- Zwei FXS-Anschlüsse für zwei analoge Endgeräte
![Grandstream HT802](/grandstream_ht802.png)


|Provisionierung|Firmware-Verwaltung|
|---|---|
|ja|nein|

**Provisionierung**: Das Gateway wird über die mobydick verwaltet.<br>
**Firmware-Verwaltung**: Die Firmware kann nicht über mobydick aktualisiert werden.<br>


## Konfiguration

### Vorbereitung

Für die automatische Inbetriebnahme ist ein funktionierender DHCP-Server zwingend erforderlich. Lesen Sie dazu
[Netzwerk planen und konfigurieren](../../server/netzwerk-konfigurieren/).

### Inbetriebnahme

Schließen Sie den Grandstream ATA  an das Netzwerk an. Dieser wird nach dem Bootvorgang automatisch in der Liste der Gateways unter `Gateways` > `Gatewayliste` erscheinen.

<!--FIXME steckersymbol, status?-->

### Endgerät über SIP anlegen

Wählen Sie unter `Endgeräte` > `Geräteliste` > `Hinzufügen` > den Eintrag **Via Grandstream Gateway: Analoges Endgerät per SIP**.
Im Tab `Basisdaten` wählen Sie den Port am Gateway, an dem das Endgerät angeschlossen werden soll. Anschließend weisen Sie das Gerät über den Tab `Zuweisung` einem Benutzer zu.


{{% notice note%}}
Nach dem Speichern müssen Sie das Gateway einmalig manuell neu starten indem Sie ihn stromlos machen. Nach dem Neustart wird der Grandstream ATA von der mobydick provisioniert.
{{% /notice %}}
