---
title: HFO Telecom
description: Übersicht zum pascom managed Provider Template von HFO Telecom
weight: 20
---

{{< doctype "both"  >}}

{{< description >}}

![HFO Provider Logo](hfo_telecom_logo.png?width=50%)

## Übersicht

Tarif in Kombination mit pascom: **Alle angebotenen Tarife**  

Informationen über Leistungsmerkmale und Tarife finden Sie hier: [HFO Telecom](http://www.hfo-telecom.de/ "HFO Telecom SIP Provider").


{{< num 1 "Ihr Account" >}}

Für die Einrichtung eines SIP-Amtes über ein pascom Provider Template benötigen Sie die Zugangsdaten von Ihrem Provider. 

Die Zugangsdaten für Ihren SIP Trunk Account erhalten Sie von Ihrem Provider per Post oder sind online einsehbar im Kundenportal.

**Beispiel**

![HFO Account Daten](hfo-account.de.png?width=70%)

</br>

{{< num 2 "Einrichtung" >}}

Fügen Sie ein neues Amt ein unter {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}} > {{< ui-button "Hinzufügen" >}}. Sie gelangen nun zur Ämter-Datenbank. Über den Filter können Sie direkt nach *HFO* suchen. Wählen Sie die Vorlage *HFO NGN* und befüllen Sie die Vorlage mit den erhaltenen Account-Daten.

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

{{< num 4 "pascom Outbound Proxy aktivieren (Nur Onsite)" >}}

Für die Onsite Telefonie wird für diesen Provider der pascom Outbound Proxy benötigt. In den {{< ui-button "Basiseinstellungen" >}} finden Sie die Einstellung {{< ui-button "Schnittstelle" >}}, für welche der **Outbound Proxy** aktiviert werden soll.

![Outound Proxy aktivieren](setup_op.de.jpg?width=70%)


{{< num 5 "Definieren Sie Ihre Rufregeln" >}}

Das Amt ist eingerichtet und erfolgreich registriert. Als letzten Schritt definieren Sie Ihre eingehenden und ausgehenden Rufregeln um das Anrufverhalten Ihrer pascom Telefonanlage einzustellen. 

Das Einrichten von Rufregeln erklären wir Ihnen in der Anleitung zu den [Rufregeln]({{< ref "trunks/rules">}})