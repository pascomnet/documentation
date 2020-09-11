---
title: Notrufe
description: Erfahren Sie hier wie Sie Notrufnummern in pascom verwalten und sicherstellen, dass der korrekte Standort an die Leitstelle übermittelt wird.
weight: 121
---

{{< doctype "both"  >}}

{{< description >}}

## Notruf und VoIP

In der modernen IP Welt ist es fast von jedem Ort aus möglich, eine Sprachverbindung über das Internet aufzubauen. Dies macht grundsätzlich die genaue Ortsbestimmung eines Anrufers in einer Notrufleistelle schwieriger.
Dies gilt nicht nur für Ämter (SIP-Trunks) sondern auch für die pascom interne Telefonie.

## Ämter (SIP Provider)

In der Regel verwenden SIP-Provider bei Notrufen die Adresse des Vertragsinhabers bzw. des beauftragen Standorts.
Bei der Verwendung von Internetzugängen mit gekoppelten SIP-Zugängen (z.b. Telekom) wird in der Regel immer der Standort der DSL-/FTTH-Leitung übermittelt. Bitte beachten Sie die Hinweise unter unseren [Amtsvorlagen]({{< ref "/trunk-templates" >}})

{{% notice warning %}}
**Bitte sprechen Sie immer mit Ihrem SIP-Provider um sicher zu gehen, wie die Standortübermittlung an die Leitstelle bei Notrufen gehandhabt wird. Insbesondere wenn Sie mehrere Trunks an einem Standort konsolidieren oder die pascom cloud nutzen**
{{% /notice %}}

## Interne Teilnehmer

Da die Ortsermittlung bei Firmen mit mehreren Standorten, Außendienstmitarbeitern und Homeoffice-Benutzern oftmals nicht eindeutig ist, empfehlen wir in diesen Fällen das Mobiltelefon für Notrufe zu nutzen.         
Der [pascom Mobile Client]({{< ref "/client-mobile-userguide" >}}) verwendet bei Notrufen ausschließlich GSM um den exakten Standort des Anrufers fehlerfrei zu übermitteln. 

{{% notice warning %}}
**Unterweisen Sie alle mobilen Benutzer (Homeoffice usw.) ihr Mobiltelefon und nicht den pascom Desktop Client oder ein Hardwaretelefon für Notrufe zu verwenden. Alternativ können Sie sicher stellen, dass der genutzte SIP-Trunk den tatsächlichen Standort übermittelt.**
{{% /notice %}}

## Notrufnummern im Standard

Ein Notruf wird jederzeit ohne Rufnummernmanipulation direkt an Rettungsdienste, Feuerwehren oder Polizei alarmiert.
In allen Ländern der EU und der EFTA, sowie in Russland, der Ukraine und einigen weiteren Ländern gilt seit 11. Februar 1991 die einheitliche Europäische Notrufnummer 112.


## Notrufnummern ergänzen

Kommen Sie aus einem Land außerhalb der EU oder EFTA, das nicht die einheitliche Europäische Notrufnummer verwendet, oder möchten spezielle landesspezifische Notrufnummern in Ihrer pascom Telefonanlage ergänzen, so können Sie diese in der WebUI unter {{< ui-button "Erweitert" >}} > {{< ui-button "Notrufnummern" >}} > {{< ui-button "Hinzufügen" >}} dem Rufnummernpool Ihrer Telefonanlage hinzufügen.

Diese Rufnummern werden aus der Telefonanlage heraus, über Ihr hinterlegtes Amt direkt erreicht, unabhängig von sonst konfigurierten Regeln oder Inprefixes.


Standardmäßig sind auf der pascom Telefonanlage folgende Notrufnummern eingerichtet:

|Notrufnummer|Bezeichnung|
|---|---|
|110|Alte Notrufnummer|
|112|Europäische Notrufnummer|

{{% notice info %}}
Die [Durchwahlen]({{< ref "/howto/extensions" >}}) 110 und 112 dürfen intern nicht zu anderen Zwecken vergeben werden, da es sich hierbei um Notrufnummern handelt, die intuitiv für jeden Benutzer verfügbar sein müssen.
{{% /notice %}}


