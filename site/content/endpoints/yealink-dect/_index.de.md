---
title: Yealink DECT-System
description: Integrieren Sie Ihr Yealink DECT-System in die pascom.
weight: 40
---

{{< doctype "both"  >}}

{{< description >}}

![Yealink W52P](yealink_w52p_dect.png?width=300px)

## Unterstützte Geräte

**[Liste der unterstützten Endgeräte, hier klicken!]({{<ref "/endpoints#yealink-dect-systeme" >}})**

## Neue DECT Basisstation hinzufügen

{{% tabs %}}
{{% tab "Pairing via URL (cloud + onsite)" %}}

{{< num 1 "DECT System anschließen" >}}


Integrieren Sie das DECT-System in Ihr Netzwerk. 

{{< num 2 "MAC-Adresse ermitteln" >}}

Die MAC-Adresse steht auf der Basisstation oder einem beigelegten Merkzettel.

{{< num 3 "Basisstation anlegen" >}}

Loggen Sie sich in Ihrer Telefonanlage ein und fügen unter {{< ui-button "Gateways" >}} > {{< ui-button "Gatewayliste" >}} ein
neues Gerät vom Typ **Gateway:Hersteller Yealink** hinzu.

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


## Handsets anlegen und zuweisen

Es können bis zu 5 Handsets an einer Basisstation registriert werden.

Wählen Sie unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} > {{< ui-button "Hinzufügen" >}} den Eintrag *Via yealink DECT Gateway: Mobilteil* aus. Folgende Einstellungen müssen Sie vornehmen:

|Einstellung|Beschreibung|
|---|---|
|Angeschlossen an|Wählen Sie hier den DECT-Sender.|
|Zuweisung|In diesem Reiter können Sie einen Benutzer zuweisen.|

## Handsets am DECT Sender registrieren

Die Handsets verbinden sich automatisch mit dem DECT-Sender, sobald diese in den Ladeschalen stehen und die Provisionierung des DECT-Senders angewendet wurde.

{{% notice note %}}
Ggf. ist ein Neustart der DECT-Sender notwendig.
{{% /notice %}}
