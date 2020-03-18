---
title: Basiseinstellungen
description: Die Basisdaten des Amts erlauben es Ihnen die Daten aus den Amtsvorlagen weiter anzupassen.
weight: 10
---

{{< doctype "both"  >}}

{{< description >}}

## Die Basisdaten

Zu den Grundeinstellungen Ihres Amts gelangen Sie über {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}} > {{< ui-button "Bearbeiten" >}}. Im Register **Basisdaten** erhalten Sie folgende Einstellungsmöglichkeiten.

![Basiseinstellungen](basesettings.de.JPG?width=60%)



|Variable|Erklärung|
|---|---|
|**Bezeichung**|Geben Sie Ihrem Amt einen Namen, dieser taucht dann in der Ämterliste auf|
|**Präfix eing. Nummer**|Ist eine beliebige Ziffer, die bei eingehenden Telefonanrufen über dieses Amt vorangestellt wird. Wenn Sie hier eine 0 eingeben erscheint beispielsweise in der Anruferliste von IP-Telefonen dann nicht die 0172123123 sondern die 00172123123. Dadurch können Sie direkt aus der Anruferliste wieder über das selbe Amt zurückrufen.|
|**Internationale Vorwahl**|Die Ziffer die vorangestellt werden muss um im Festnetz eine internationale Nummer (Ausland) zu erreichen. Im Normalfall ist das die *00*.|
|**Landeskennzahl**|Geben Sie hier die Landeskennzahl für das Land an in dem sich das Amt befindet. Für Deutschland z. B. 49. Durch die IP-Ämter ist es möglich, dass sich die pascom zwar in Deutschland befindet jedoch über das Internet ein Amt in der Schweiz nutzt. Geben Sie hier immer die Landeskennzahl an in dem sich das Amt befindet, nicht den Standort der Anlage.|
|**Nationale Vorwahl**|Die Ziffer die vorangestellt werden muss um im Festnetz eine nationale Nummer (Nummer mit Ortsvorwahl) zu erreichen. Im Normalfall ist das die *0*.|
|**Ortskennzahl**|Tragen Sie die Ortskennzahl bzw. Ortsvorwahl ohne führende 0 ein. Für München z. B. 89 statt 089.|
|**Telefonbuchabfrage**|Wählen Sie hier **Ja** wird die pascom versuchen jeden eingehenden Anruf über dieses Amt im zentralen Telefonbuch aufzulösen und bei Erfolg den Namen des Anrufers im Telefondisplay präsentieren. Dies gilt nur für IP-Endgeräte.|
|**Fallback Durchwahl**|Falls für eine Durchwahl die angerufen wird keine Rufregel existiert, wird der Anrufer auf diese Durchwahl abgeworfen.|
|**Skript ausgehende Regel**|Diese Einstellung kann für ausgehende Rufe ein Skript einbinden.|
|**Direkte Weiterleitung**|Diese Einstellung legt fest, wie Rufumleitungen, die von extern kommen und die Anlage wieder verlassen abgehandelt werden. Dazu gibt es 3 Möglichkeiten:<br>*- Anruf im System behalten*<br>*- Anruf annehmen und im System behalten*<br>*- Anruf über Provider weiterleiten (Call Deflection)*|
|**Aktiviert**|Aktivieren / Deaktivieren Sie das Amt. Ein aktiviertes Amt versucht sich bei den Servern des Provider zu registrieren.|
|**Freizeichen-Erzeugung**|Diese Einstellung legt fest, wie die Freizeichen über SIP erzeugt werden sollen. Hierbei gibt es mehrere Möglichkeiten. Von SIP Ringing über Progress Erzeugung bis hin zu komplett deaktiviert.|
