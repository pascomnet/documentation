---
title: Benutzer Import via XLSX
description: Für die Erstanlage können Sie die Benutzer per XLSX Datei (Excel, OpenOffice, Libreoffice, etc.) importieren 
weight: 20
---

{{< doctype "both" >}}

{{< description >}}

**Nützliches Vorwissen**
 
 * [Benutzer und Arbeitsplätze]({{< ref "concept/user" >}})


## Benutzer via XLSX Datei importieren

Für die Erstinstallation eignet es sich die Benutzer aus eine .xlsx-Datei zu importiern. Die Datei mit dem Namen Benutzerimport.xmls finden Sie unter {{< ui-button "Appliance" >}} > {{< ui-button "Importieren" >}} > {{< ui-button "Benutzerimport" >}}. Sie könnern zuerst die Vorlage herunterladen, ausfüllen und wieder importieren. Achten Sie bitte auf die Hinweise in der Datei.

Alternativ können Sie auch den *Erweiteren Import* verwenden ({{< ui-button "Appliance" >}} > {{< ui-button "Importieren" >}} > {{< ui-button "Erweiterter Import" >}}). Hier können Sie bereits beim Anlegen der Benutzer weitere Einstellungen vornehmen:

* IP-Telefone zuweisen
* pascom Softphone zuweisen
* Aktionsvorlagen zuweisen
* Arbeitsplätze anlegen
* ein globales Telefonbuch erstellen
* Kurzwahlen definieren

Beachten Sie bitte auch hier auf die Hinweise in der Datei.

{{% notice warning %}}
Verwenden Sie den Benutzerimport nur einmalig bei der Erstkonfiguration Ihrer pascom. Weitere Benutzer müssen Sie manuell anlegen. Erneute Verwendung des Benutzerimports überschreibt die bisher angelegten Benutzer.
{{% /notice %}}
