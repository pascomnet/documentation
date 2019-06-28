---
title: Notrufe absetzen
description: Erfahren Sie hier, wie die Standortübermittlung bei Notrufen über Ihr Amt realisiert werden.
weight: 30
---

{{< doctype "both"  >}}

{{< description >}}

## Konzept

Ein Notruf wird jederzeit ohne Rufnummernmanipulation direkt an Rettungsdienste, Feuerwehren oder Polizei alarmiert.
In allen Ländern der EU und der EFTA, sowie in Russland, der Ukraine und einigen weiteren Ländern gilt seit 11. Februar 1991 die einheitliche Europäische Notrufnummer 112.

## Notruf und VoIP

Da SIP-Trunks in der Regel nicht anschluss-gebunden sind, ist es in der modernen VoIP-Welt schwierig geworden, anhand der IP den korrekten Standort des Anrufers zu ermitteln bzw. bei einem Notruf zu signalisieren.       
In der Regel verwenden SIP-Provider daher bei Notrufen den Standort der Adresse des Vertrag-Inhabers bzw. -Kunden.      

Auch bei der Verwendung von direkten Anschlüssen (z.b. [Telekom]({{< ref "/trunk-templates" >}})), ist kein zuverlässiges Übermitteln des Standorts bei einem Notruf möglich, da hier immer der Standort der DSL-/FTTH-Leitung angegeben wird.      
Dies ist ein großes Problem bei Cloud-Anlagen, sowie bei OnSite-Anlagen mit mehreren konsolidierten Trunks.     

{{% notice info %}}
Da diese Standortermittlung bei Firmen mit mehreren Standorten, Außendienstmitarbeitern und Homeoffice-Benutzern sehr ungenau und unzuverlässig ist, empfehlen wir in diesen Fällen den Notruf mit dem Mobiltelefon abzusetzen.         
Speziell für diesen Fall verwendet die [pascom Mobile App]({{< ref "/clients/mobile-userguide" >}}) bei Notrufen ausschließlich GSM um den exakten Standort des Anrufers fehlerfrei zu übermitteln. 
{{% /notice %}}       

{{% notice warning %}}
**Bitte sprechen Sie mit Ihrem SIP-Provider wie die Standortrealisierung via VoIP mit dem von Ihnen verwendeten Produkt gehandhabt wird.**
{{% /notice %}}
