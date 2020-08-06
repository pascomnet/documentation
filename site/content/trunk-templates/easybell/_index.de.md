---
title: Easybell
description: Übersicht zum pascom managed Provider Template von Easybell
weight: 10
---


{{< description >}}

![Easybell Provider Logo](easybell_logo.png?width=50%)

## Übersicht

Informationen über Leistungsmerkmale und Tarife finden Sie hier: [easybell](http://www.easybell.de/).

## Unterstützte Nutzungsvarianten
Nutzen Sie die pascom Telefonanlage in der Cloud oder Onsite Vor-Ort in Ihrem Unternehmen? Erfahren Sie in unserer Amtsvorlagenübersicht mehr zu den jeweiligen unterstützen Providern. 

[Übersicht Amtsvorlagen]({{< ref "trunk-templates">}})

## Einrichtung

Für die Einrichtung eines SIP-Amtes über ein pascom Provider Template benötigen Sie die Zugangsdaten von Ihrem Provider. 

### Zugangsdaten

Die Zugangsdaten für Ihren SIP Trunk Account erhalten Sie von Ihrem Provider per Post oder sind online einsehbar im Kundenportal.

**Beispiel**

![Easybell Account Daten](easybell_sipdata.PNG?width=70%)

</br>

### Amt anlegen mit Provider Templates

Mit Ihren Zugangsdaten können Sie ein neues Amt auf der pascom Telefonanlage erstellen. Eine detaillierte Anleitung zum Einrichten von Ämtern mit Provider Vorlagen finden Sie in unserer Ämter Sektion. 

[Zur Ämter Anleitung]({{< ref "trunks/templates">}})


## Easybell Clip no Screening

### Problem

Sie haben Ihren Easybell SIP-Account erfolgreich mit der Amtsvorlage im pascom System eingerichtet. Doch die Rufnummernanzeige
funktioniert noch nicht nach Ihren Anforderungen. In den meisten Fällen müssen Sie das Leistungsmerkmal noch aktivieren bzw. für die Nutzung
mit der pascom Telefonanlage konfigurieren. 

### Lösung

Das Leistungsmerkmal der Rufnummernanzeige umfasst ein Paar Einstellungen, die Sie direkt bei Easybell vornehmen müssen.  

Loggen Sie sich zunächst im Easybell Controll Center mit Ihren Accountdaten ein.

1. Gehen Sie ins Menü **Rufnummernanzeige ändern**.
2. Setzen Sie die Rufnummernanzeige auf **Geräteabhängige Rufnummernanzeige (Clip no screening)**.
3. Die **manuelle Feldauswahl** setzen Sie auf **P-Asserted-Identity**.
4. Clicken Sie abschließend auf **Übernehmen**.  
<br />
![Easybell Einstellungen](easybell_clipnoscreening.png)

