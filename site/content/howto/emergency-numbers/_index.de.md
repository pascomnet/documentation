---
title: Notrufnummern verwalten
description: Erfahren Sie hier, wie Notrufnummern in pascom unterstützt werden, und wie Sie sicherstellen, dass der korrekte Standort übermittelt wird.
weight: 121
---

{{< doctype "both"  >}}

{{< description >}}

## Konzept

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


Mehr Informationen zur Standortübermittlung bei einem Notruf finden Sie [hier]({{< ref "/trunks/emergencies" >}}).