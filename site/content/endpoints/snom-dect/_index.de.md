---
title: Snom DECT-System
description: Integrieren Sie Ihr Snom DECT-System in die pascom.
weight: 20
---


{{< doctype "both"  >}}

{{< description >}}

![Snom M700](snom_m700_dect.png?width=600px)


## Unterstützte Geräte

**[Liste der unterstützten Endgeräte, hier klicken!]({{<ref "/endpoints#snom-dect-systeme" >}})**

## Übersicht

Die DECT Basis lässt sich sowohl einzeln als auch als Multizellenkonfiguration betreiben. Sie ist ideal für Unternehmen geeignet, die eine Funkabdeckung über mehrere Etagen oder in großen Bürogebäuden benötigen.

### Verfügbare Kanäle

||Snom - Einzelle|Snom - Multizelle|
|----|----|----|
|Schmalband (g711, g729, g726)|10|8|
|Breitband (g722), SRTP aktiviert (g722, g711, g729, g726)|5|4|


## Neue DECT Basisstation hinzufügen

{{% tabs %}}
{{% tab "Pairing via URL (cloud + onsite)" %}}

{{< num 1 "DECT System anschließen" >}}


Integrieren Sie das DECT-System in Ihr Netzwerk. 

{{< num 2 "MAC-Adresse ermitteln" >}}

Die MAC-Adresse steht auf der Basisstation oder einem beigelegten Merkzettel.

{{< num 3 "Basisstation anlegen" >}}

Loggen Sie sich in Ihrer Telefonanlage ein und fügen unter {{< ui-button "Gateways" >}} > {{< ui-button "Gatewayliste" >}} ein
neues Gerät vom Typ **SNOM Dect** hinzu.

Tragen Sie im Feld **Mac-Adresse** die zuvor ermittelte MAC-Adresse des DECT Systems ein.

{{< num 4 "Jobs Anwenden" >}}

Nach dem Speichern von Änderungen erscheint in der Job-Box (oben) ein
entsprechender Eintrag die Telefonie anzuwenden. Starten Sie den Job durch
einen Klick auf den {{< ui-button "grünen Haken" >}}.

{{< num 5 "Provisionierung-URL ermitteln" >}}

Haken Sie das DECT-System in der Geräte-Liste an und wählen {{< ui-button "Aktion" >}} > {{< ui-button "Provisioning URL" >}}. Kopieren Sie die
**URL** in die Zwischenablage.

{{< num 6 "Provisionierung-URL in der DECT Basis hinterlegen" >}}

Auf der Web-UI des DECT System tragen Sie die eben kopierte Provisionierung-URL ein.

Klicken Sie auf {{< ui-button "Apply" >}} und anschließend auf {{< ui-button "Reboot" >}}.

{{% /tab %}}

{{% tab "DHCP Provisioning (onsite)" %}}


{{< num 1 "DHCP-Server vorbereiten" >}}

Für die automatische Inbetriebnahme ist ein funktionierender DHCP-Server zwingend erforderlich.
Bereiten Sie einen DHCP-Server wie unter [Telefon-Provisionierung via DHCP]({{< ref "/howto/dhcp-provisioning" >}}) beschreiben vor.

{{< num 2 "DECT System anschließen" >}}

Schließen Sie jetzt alle Basisstationen, die Sie verwenden wollen, an das Netzwerk an. Diese werden nach dem Bootvorgang automatisch in der Liste der Gateways (unter {{< ui-button "Gateways" >}} > {{< ui-button "Gatewayliste" >}}) erscheinen.
Das Feld **Status** hat keine Aussagekraft. Die Warnung mit dem "Steckersymbol" ist normal.


{{% /tab %}}


## Multizellenbetrieb konfigurieren

Falls Sie mehrere Gateways zum Multizellenbetrieb vernetzen möchten markieren Sie alle betroffenen Gateways und klicken dann auf {{< ui-button "Bearbeiten" >}}. Wählen Sie für eines der Gateways unter *Multi Cell* den Wert **Basisstation** aus, auf allen anderen Gateways **Repeater** aus. Durch die Pfeilschaltfläche können Sie durch alle zuvor markierten Gateways navigieren und die Änderungen entsprechend vornehmen.

### Handsets anlegen und zuweisen

Wählen Sie unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} > {{< ui-button "Hinzufügen" >}} den Eintrag *Via snom DECT Gateway: Mobilteil* aus. Folgende Einstellungen müssen Sie vornehmen:

|Einstellunge|Beschreibung|
|---|---|
|Angeschlossen an|Wählen Sie hier den DECT-Sender, bzw. bei Mulizellenbetrieb das DECT-System.|
|IPEI Nummer|Geben Sie hier die IPEI-Nummer des Handsets ein.|
|SIP Optionen|Optional können Sie hier asterisk-spezifische Sip-Optionen eintragen.|
|Zuweisung|In diesem Reiter können Sie einen Benutzer zuweisen.|
