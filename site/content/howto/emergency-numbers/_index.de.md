---
title: Notrufnummern verwalten
description: Erfahren Sie hier, wie Notrufnummern in pascom unterstützt werden, und wie Sie sichergehen, dass der korrekte Standort übermittelt wird.
weight: 125
---

{{< doctype "both"  >}}

{{< description >}}

## Konzept

Ein Notruf wird jederzeit ohne Rufnummernmanipulation direkt an Rettungsdienste, Feuerwehren oder Polizei alarmiert.
In allen Ländern der EU und der EFTA, sowie in Russland, der Ukraine und einigen weiteren Ländern gilt seit 11. Februar 1991 die einheitliche Europäische Notrufnummer 112.


## Notrufnummern ergänzen

Kommen Sie aus einem Land außerhalb der EU oder EFTA, die nicht die einheitliche Europäische Notrufnummer verwenden, oder möchten spezielle landesspezifische Notrufnummern in Ihrer pascom Telefonanlage ergänzen, so können Sie diese in der WebUI unter ({{< ui-button "Erweitert" >}} > ({{< ui-button "Notrufnummern" >}} > ({{< ui-button "Hinzufügen" >}} dem Rufnummernpool Ihrer Telefonanlage hinzufügen.

Diese Rufnummern werden aus der Telefonanlage heraus, über Ihr hinterlegtes Amt direkt erreicht, unabhängig von sonst konfigurierten Regeln oder Inprefixes.


Standardmäßig sind auf der pascom Telefonanlage folgende Notrufnummern eingerichtet:

|Notrufnummer|Bezeichnung|
|---|---|
|110|Alte Notrufnummer|
|112|Europäische Notrufnummer|

{{% notice info %}}
Die Durchwahlen 110 und 112 dürfen intern nicht zu anderen Zwecken vergeben werden, da es sich hierbei um Notrufnummern handelt, die intuitiv für jeden Benutzer verfügbar sein müssen.
{{% /notice %}}


## Notrufnummern und SIP-Trunks

Da SIP-Trunks in der Regel nicht anschluss-gebunden sind, ist es in der modernen VoIP-Welt schwierig geworden, anhand der IP den korrekten Standort des Anrufers zu ermitteln bzw. bei einem Notruf zu signalisieren.

In der Regel verwenden SIP-Provider daher bei Notrufen den Standort der Adresse des Vertrag-Inhabers bzw. -Kunden. 

{{% notice warning %}}
**Bitte sprechen Sie mit Ihrem SIP-Provider wie die Standortrealisierung via VoIP mit dem von Ihnen verwendeten Produkt gehandhabt wird.**
{{% /notice %}}

Da diese Standortermittlung bei Firmen mit mehreren Standorten, Außendienstmitarbeitern und Homeoffice-Benutzern sehr ungenau und unzuverlässig ist, empfehlen wir in diesen Fällen den Notruf mit dem Mobiltelefon abzusetzen. 
Speziell für diesen Fall verwendet die pascom Mobile App bei Notrufen ausschließlich GSM um den exakten Standort des Anrufers fehlerfrei zu übermitteln.


## Notrufnummern und Mehrgeräte-Anschlüsse (Telekom)

Wenn Sie ein Telefonie-Amt mit mehreren festen Rufnummern (Mehrgeräteanschluss, kein SIP-Trunk) verwenden, ist kein zuverlässiges Übermitteln des Standorts bei einem Notruf möglich, da hier immer der Standort der DSL-/FTTH-Leitung angegeben wird.
Dies ist ein großes Problem bei Cloud-Anlagen, sowie bei OnSite-Anlagen mit mehreren konsolidierten Trunks.

{{% notice warning %}}
**Wir empfehlen Ihnen hier einen SIP-Trunk zu verwenden.**
{{% /notice %}}

