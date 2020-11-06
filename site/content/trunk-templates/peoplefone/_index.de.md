---
title: Peoplefone
description: Übersicht zum pascom managed Provider Template von Peoplefone
weight: 35
---

{{< doctype "both"  >}}

{{< description >}}

![Peoplefone Provider Logo](peoplefone_logo.png?width=50%)

## Übersicht

Tarif in Kombination mit pascom: **Alle angebotenen Tarife**  

Informationen über Leistungsmerkmale und Tarife finden Sie hier: [Peoplefone](https://www.peoplefone.de/de/geschaeftskunden).

{{< num 1 "Ihr Account" >}}

Für die Einrichtung eines SIP-Amtes über ein pascom Provider Template benötigen Sie die Zugangsdaten von Ihrem Provider. 

Die Zugangsdaten für Ihren SIP Trunk Account erhalten Sie von Ihrem Provider per Post oder sind online einsehbar im Kundenportal.

**Beispiel**

![Peoplefone Account Daten](peoplefone-account.PNG?width=70%)

</br>


## Peoplefone Test Trunk nutzen

Bei der Einrichtung einer neuen pascom Telefonanlage können Sie während dem Setup einen kostenlosen Test SIP-Trunk von Peoplefone mit einrichten. Dieser Testaccount wird automatisch auf der pascom Telefonanlage eingerichtet und kann sofort genutzt werden.

**Testguthaben**: 10,-€
**Testrufnummer**: Wird dynamisch erstellt
**Test-Account kann ganz einfach im Peoplefone Kundenportal upgegradet werden**

Wählen Sie im Setup den Punkt **Testkonto einrichten**

![Peoplefon Test Trunk](peoplefone_setup_testtrunk.de.PNG)

Füllen Sie anschließend die vordefinierten Felder zu Ihrer Person/Unternehmen aus und akzeptieren Sie die AGB von Peoplefone. Herzlichen Glückwunsch! Der Peoplefon Test Trunk ist erstellt und kann auf der pascom Telefonanlage genutzt werden. 

**Notieren Sie sich die Daten des Peoplefon Test Trunk!**

![Peoplefon Test Trunk Data](peoplefone_setup_testtrunk_successful.de.PNG)

{{< num 2 "Einrichtung" >}}

Fügen Sie ein neues Amt ein unter {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}} > {{< ui-button "Hinzufügen" >}}. Sie gelangen nun zur Ämter-Datenbank. Über den Filter können Sie direkt nach *Peoplefone* suchen. Wählen Sie die Vorlage *Peoplefone* und befüllen Sie die Vorlage mit den erhaltenen Account-Daten.

<br />

![Trunk Template](choose-template.de.png)

<br />

**Befüllen Sie die Amtsvorlage**  


|Variable|Beschreibung|
|---|---|
|**Bezeichnung**|Geben Sie Ihrem Amt einen Namen, dieser erscheint in der Ämterliste.|
|**Telefonie-Benutzername**|Entnehmen Sie den Telefonie-Benutzernamen aus Ihren Zugangsdaten.|
|**Telefonie-Passwort**|Tragen Sie hier das dazu gehörige Telefonie-Passwort ein.|
|**Registrierungsrufnummer**|Entnehmen Sie die Registrierungsrufnummer aus Ihren Zugangsdaten.|
|**Ortskennzahl**|Tragen Sie die Ortskennzahl bzw. Ortsvorwahl ohne führende 0 ein. In unserem Beispiel *991*.|
|**Stammnummer**|Basisnummer des Telefonanschlusses ohne Nebenstellen. In unserem Beispiel als *XXXXXX* dargestellt.|
|**Präfix eing. Nummer**|Ist eine beliebige Ziffer, die bei eingehenden Telefonanrufen über dieses Amt vorangestellt wird. Wenn Sie hier eine 0 eingeben erscheint beispielsweise in der Anruferliste von IP-Telefonen dann nicht die 0172123123 sondern die 00172123123. Dadurch können Sie direkt aus der Anruferliste wieder über das selbe Amt zurückrufen.|
|**Anzahl der Durchwahlstellen**|Anzahl der Stellen der Benutzer-Durchwahlen. (NICHT die Anzahl der Nummern im Rufnummernblock!)|
|**Durchwahl Zentrale**|Geben Sie hier an, auf welche interne Durchwahl die erste Nummer Ihres Rufnummernblocks (meistens die 0) abgeworfen werden soll.|

<br />

### Beispiel

![Template ausfüllen](fill-variables.de.png?width=70%)

Nach dem {{< ui-button "Speichern" >}} wird das Amt angelegt. 

{{< num 3 "Funktioniert Ihr Amt?" >}}

Um sicher zu gehen ob Ihre Daten korrekt eingegeben wurden und ob sich die pascom Telefonanlage erfolgreich beim Provider registriert hat, klicken Sie unter {{< ui-button "Gateway" >}} - {{< ui-button "Ämter" >}} auf das {{< ui-button "Info-Symbol" >}} bei Ihrem Amt.
Hier sehen Sie ob die **Registrierung** geklappt hat. (*registered*).

![Amt registriert](registered-template.de.PNG?width=50%)


{{< num 4 "Definieren Sie Ihre Rufregeln" >}}

Das Amt ist eingerichtet und erfolgreich registriert. Als letzten Schritt definieren Sie Ihre eingehenden und ausgehenden Rufregeln um das Anrufverhalten Ihrer pascom Telefonanlage einzustellen. 

Das Einrichten von Rufregeln erklären wir Ihnen in der Anleitung zu den [Rufregeln]({{< ref "trunks/rules">}})


