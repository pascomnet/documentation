---
title: Deutsche Telekom Company Flex BETA
description: Übersicht zum pascom managed Provider Template von der Deutschen Telekom
weight: 5
---
{{< doctype "both"  >}}

{{< description >}}

![Deutsche Telekom Provider Logo](deutsche-telekom-logo.png?width=50%)


## Übersicht

Tarif in Kombination mit pascom: **Company Flex**  

{{% notice warning %}}
**Telekom Company Flex SIP Trunk** ist aktuell nur mit pascom 19.13 BETA verfügbar.
{{% /notice %}}


Informationen über Leistungsmerkmale und Tarife finden Sie [hier](https://geschaeftskunden.telekom.de/internet-dsl/tarife/festnetz-internet-dsl/companyflex). Die [pascom Telefonanlage](https://www.pascom.net/de/voip-telefonanlage/ "pascom VoIP-Telefonagen Software") (sowohl Onsite als auch Cloud) unterstützt nur Business-SIP-Trunk Anschlüsse der Telekom.


{{< num 1 "Ihr Account" >}}

Nach dem Erwerb und der Freischaltung Ihres Telekom Produkts erhalten Sie Account-Daten die wie folgt aussehen können:

**Telekom Company Flex**


![Ihre Telekom-Zugangsdaten](telekom-accessdata.png?width=100%)

Hat **eine** Registrierungsrufnummer +  Flex-ID für die Registrierung.


### SIP Trunk erstellen im Company Flex Tarif

Die Basis für einen Company Flex Account ist ein SIP Trunk. Ob nun eine Einzelrufnummer oder ein Durchwahlbereich definiert ist, spielt keine Rolle.

Loggen Sie sich in das [Business Service Portal](https://bsp.t-mobile.de/portal/) ein und **selektieren** Sie Ihren Company Flex Vertrag. Anschließen wählen Sie im **Drop-Down** den Eintrag **Company Flex konfigurieren** und klicken auf **weiter**.


![Business Service Portal](contract.png?width=100%)

Im nächsten Menü wählen Sie den Punkt **Sip Trunk** anlegen und erstellen sich für Ihren Company Flex Tarif einen Sip Trunk.

![Neuen SIP Trunk einrichten](create-siptrunk.png?width=100%)

{{< num 2 "Einrichtung" >}}

### Amtsvorlage verwenden

Fügen Sie ein neues Telekom-Amt ein unter {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}} > {{< ui-button "Hinzufügen" >}}. Sie gelangen nun zur Ämter-Datenbank. Über den Filter können Sie direkt nach *Telekom* suchen. Wählen Sie die Vorlage *Telekom Company Flex* und befüllen Sie die Vorlage mit den erhaltenen Account-Daten.

<br />

![Telekom SIP Trunk Template](choose-template.de.PNG)

<br />

**Befüllen Sie die Amtsvorlage**  


|Variable|Beschreibung|
|---|---|
|**Bezeichnung**|Geben Sie Ihrem Amt einen Namen, dieser erscheint in der Ämterliste.|
|**Zugangsnummer - Flex ID**|Entnehmen Sie die Flex ID aus Ihren Zugangsdaten.|
|**Passwort**|Tragen Sie hier das dazu gehörige Telefonie-Passwort ein.|
|**Registrierungsrufnummer**|Entnehmen Sie die Registrierungsrufnummer aus Ihren Zugangsdaten.|
|**Rufnummer**|Basisnummer des Telefonanschlusses ohne Nebenstellen.|
|**Präfix eing. Nummer**|Ist eine beliebige Ziffer, die bei eingehenden Telefonanrufen über dieses Amt vorangestellt wird. Wenn Sie hier eine 0 eingeben erscheint beispielsweise in der Anruferliste von IP-Telefonen dann nicht die 0172123123 sondern die 00172123123. Dadurch können Sie direkt aus der Anruferliste wieder über das selbe Amt zurückrufen.|
|**Anzahl der Durchwahlstellen**|Anzahl der Stellen der Benutzer-Durchwahlen. (NICHT die Anzahl der Nummern im Rufnummernblock!)|
|**Durchwahl Zentrale**|Geben Sie hier an, auf welche interne Durchwahl die erste Nummer Ihres Rufnummernblocks (meistens die 0) abgeworfen werden soll.|

<br />

### Beispiel

![Template ausfüllen](fill-variables.png?width=70%)

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