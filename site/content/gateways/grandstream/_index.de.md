---
title: Grandstream ATA HT701 und HT802
description: Integrieren Sie Ihre Analog- und ISDN-Endgeräte mithilfe des Grandstream ATA HT701 und HT802 in Ihre pascom
weight: 20
---

{{< doctype "both"  >}}

{{< description >}}

## Kompatibilität

**Grandstream HT701**

- Ein FXS-Anschluss für ein analoges Endgerät.
![Grandstream HT701](grandstream_ht701.jpg?width=300px)


**Grandstream HT802**

- Zwei FXS-Anschlüsse für zwei analoge Endgeräte.
![Grandstream HT802](grandstream_ht802.png?width=300px)


|Provisionierung|Firmware-Verwaltung|
|---|---|
|ja|nein|

**Provisionierung**: Das Gateway wird über die pascom verwaltet.<br>
**Firmware-Verwaltung**: Die Firmware kann nicht über pascom aktualisiert werden.<br>


## Konfiguration

### Vorbereitung

Für die automatische Inbetriebnahme ist ein funktionierender DHCP-Server zwingend erforderlich.

### Inbetriebnahme

Schließen Sie den Grandstream ATA  an das Netzwerk an. Dieser wird nach dem Bootvorgang automatisch in der Liste der Gateways unter {{< ui-button "Gateways" >}} > {{< ui-button "Gatewayliste" >}} erscheinen.

<!--FIXME steckersymbol, status?-->

### Endgerät über SIP anlegen

Wählen Sie unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} > {{< ui-button "Hinzufügen" >}} > den Eintrag **Via Grandstream Gateway: Analoges Endgerät per SIP**.
Im Tab {{< ui-button "Basisdaten" >}} wählen Sie den Port am Gateway, an dem das Endgerät angeschlossen werden soll. Anschließend weisen Sie das Gerät über den Tab {{< ui-button "Zuweisung" >}} einem Benutzer zu.


{{% notice note%}}
Nach dem Speichern müssen Sie das Gateway einmalig manuell neu starten indem Sie ihn stromlos machen. Nach dem Neustart wird der Grandstream ATA von der mobydick provisioniert.
{{% /notice %}}
