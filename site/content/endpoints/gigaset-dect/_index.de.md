---
title: Siemens Gigaset DECT-System
description: Integrieren Sie Ihr Gigaset DECT-System in die pascom.
weight: 15
---


{{< doctype "both"  >}}

{{< description >}}

![Siemens Gigaset N870](gigaset_n870.jpg)


## Unterstützte Geräte

**[Liste der unterstützten Endgeräte, hier klicken!]({{<ref "/endpoints#siemens-gigaset-dect-systeme" >}})**

## Übersicht

Die DECT Basis lässt sich sowohl einzeln als auch als Multizellenkonfiguration betreiben. Sie ist ideal für Unternehmen geeignet, die eine Funkabdeckung über mehrere Etagen oder in großen Bürogebäuden benötigen.


## Neue DECT Basisstation hinzufügen

{{% tabs %}}
{{% tab "Pairing via URL (cloud + onsite)" %}}

Bevor Sie das Gigaset DECT System in der pascom Telefonanlage provisionieren, müssen Sie die DECT Sender vorbereiten. 
Der erste Sender der auch zur Provisionierung der Daten von Ihrer pascom Telefonanlage verwendet wird muss vor der ersten Einrichtung in die Geräterolle **"Integrator/DECT-Manager"** versetzt werden. **Folgen Sie hierzu bitte der beiliegenden Anleitung bzw. der Anleitung die von Gigaset bereitgestellt wird.**
Weitere Sender fügen Sie wie von Gigaset empfohlen als Basisstation (Standardgeräterolle im Auslieferungszustand) hinzu.


{{< num 1 "DECT System anschließen" >}}


Integrieren Sie das DECT-System in Ihr Netzwerk. 

{{< num 2 "MAC-Adresse ermitteln" >}}

Die MAC-Adresse steht auf der Basisstation oder einem beigelegten Merkzettel.

{{< num 3 "Basisstation anlegen" >}}

Loggen Sie sich in Ihrer Telefonanlage ein und fügen unter {{< ui-button "Gateways" >}} > {{< ui-button "Gatewayliste" >}} ein
neues Gerät vom Typ **DECT-gateway: Gigaset** hinzu.

Tragen Sie im Feld **Mac-Adresse** die zuvor ermittelte MAC-Adresse des DECT Systems ein.

{{< num 4 "Jobs Anwenden" >}}

Nach dem Speichern von Änderungen erscheint in der Job-Box (oben) ein
entsprechender Eintrag die Telefonie anzuwenden. Starten Sie den Job durch
einen Klick auf den {{< ui-button "grünen Haken" >}}.

{{< num 5 "Provisionierung-URL ermitteln" >}}

Haken Sie das DECT-System in der Gateway-Liste an und wählen {{< ui-button "Aktion" >}} > {{< ui-button "Provisioning URL" >}}. Kopieren Sie die
**URL** in die Zwischenablage.

{{< num 6 "Provisionierung-URL in der DECT Basis hinterlegen" >}}

Auf der Web-UI des DECT System tragen Sie die eben kopierte Provisionierung-URL ein.

Abschließend führen Sie einen Reebot des DECT-System aus, damit die Provisionierungsdaten aktualisiert werden.

{{% /tab %}}


### Handsets anlegen und zuweisen

Wählen Sie unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} > {{< ui-button "Hinzufügen" >}} den Eintrag *Via Gigaset DECT Gateway: handset* aus. Folgende Einstellungen müssen Sie vornehmen:

|Einstellung|Beschreibung|
|---|---|
|Angeschlossen an|Wählen Sie hier den DECT-Sender, bzw. bei Mulizellenbetrieb das DECT-System.|
|IPEI Nummer|Geben Sie hier die IPEI-Nummer des Handsets ein.|
|SIP Optionen|Optional können Sie hier asterisk-spezifische Sip-Optionen eintragen.|
|Zuweisung|In diesem Reiter können Sie einen Benutzer zuweisen.|
