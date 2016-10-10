---
title: Patton Gateways einrichten
url: /isdn-analog/patton-gateways/
prev: /isdn-analog/beronet-gateways/
weight: 53
toc: true
---

## Konzept

{{% notice note %}}
Wir bieten Unterstützung für alle Patton-Gateways die mit SmartWare 5.3 oder höher betrieben werden.
{{% /notice %}}

### Patton Gateway

Das Patton Gateway wird an die LAN Verkabelung angeschlossen und erhält eine IP-Adresse aus dem Telefonnetz. An die Anschlüsse des Gateways werden dann z.B. das öffentliche Telefonnetz bzw. analoge Endgeräte angeschlossen. Durch die Anbindung per LAN eigenen sich Patton Gateways ideal für Umgebungen in denen mobydick in einer virtuellen Maschine betrieben wird.

### ISDN und Analoge Nebenstellen
#### Anbindung via SIP

**Via SIP** bedeutet, dass alle Rufe für die entsprechende Nebenstelle per SIP über die mobydick geroutet werden. Kommt beispielsweise ein Anruf für das Faxgerät herein wird dieser zuerst über **(1)** zur mobydick geroutet und dann weiter über **(2)** zum Faxgerät.
Der **Vorteil** dieser Methode ist, dass die Verbindungen über die mobydick geroutet werden. Dadurch kann mobydick in den Anruffluss eingreifen z. B. den Anruf nach einem Timeout an ein anderes Ziel leiten, Geschäftszeiten prüfen, usw.. muss die Nebenstelle nicht auf der selben Patton Hardware wie die Amtsleitungen befinden.
**Nachteil** ist, dass z. B. Faxanwendungen in manchen Fällen nicht so stabil laufen und ISDN Datenübertragungen nicht möglich sind.

## Vorbereitung
Verbinden Sie das Patton Gateway mit Ihrem Switch, schließen Sie dann das Netzteil an und lassen das Gateway booten. Das Gateway zieht sich automatisch eine IP-Adresse per DHCP.
Falls Sie kein neues Patton Gateway verwenden und mit den Netzwerkeinstellungen nicht sicher sind führen Sie einen Factory Reset durch. Dieser stellt das Gateway wieder auf DHCP-Betrieb. Drücken Sie hierzu den Rest-Knopf des Patton-Gateways, während des Betriebes, für 5 Sekunden bis die LED Run zu blinken beginnt. Warten Sie bis die LED wieder konstant leuchtet, dann ist das Patton wieder betriebsbereit.

## Konfiguration

### Auffinden und Anlegen von Patton Hardware
Sobald Sie das Patton Gateway mit dem LAN verbunden haben ist mobydick in der Lage die Hardware automatisch zu erkennen. Dies gilt nur solange sich die Gateways im selben Netzsegment wie die mobydick befinden.
Wählen Sie in der mobydick Weboberfläche Gateways > Gatewayliste  und drücken Sie auf die Schaltfläche . Selektieren Sie nun den Gateway-Typ Patton Gateway. mobydick wird versuchen das Patton Gateway zu finden:

Gelingt dies nicht, oder befindet sich ein Patton Gateway in einem anderen Netzsegment als die mobydick haben Sie im Anschluss die Möglichkeit das Gerät per Schaltfäche Manuell anlegen hinzuzufügen.
In der Dropdownbox Gateways sehen sie alle vom System erkannten Patton Gateways:

In den Felder Benutzername und Passwort geben Sie die Zugangsdaten für den auf dem Patton Gateway befindlichen Webserver an. Im Auslieferungszustand sind diese administrator OHNE Passwort. Eine Änderung von Benutzernamen und Passwort ist an dieser Stelle nicht möglich. 
Drücken Sie auf die Schaltfläche Weiter. In der nächsten Maske sehen Sie noch einmal eine Zusammenfassung und Portkonfiguration:

Sie haben nun die Möglichkeit die Bezeichnung anzupassen und den Vorgang durch Speichern abzuschließen.

### ISDN Amtsleitungen anlegen
In vielen Fällen werden Patton Gateways dazu verwendet ISDN Amtsleitungen daran anzuschließen. Selektieren Sie hierzu das entsprechende Gateway aus der Liste aus, wählen Sie  und schalten Sie dann auf den Tab Belegung um: 

Unter Hinzuführen können Sie entweder BRI oder PRI Amtsleitungen konfigurieren. Siehe ISDN im Allgemeinen falls Sie mit den Begrifflichkeiten nicht vertraut sind. Dieser Vorgang fügt einen neuen Datensatz ein.

Klicken Sie im entsprechenden Datensatz doppelt auf das Feld Bezeichnung. Dadurch öffnet sich ein Detailfenster. Hier können Sie dann anhaken welcher Port des Gateways zu diesem Amt gehört. Auch Mehrfachauswahlen sind möglich da es bei z.B. Anlagenanschlüss sein kann, dass mehrere NTs zu einem Amtsanschluss zusammengefasst werden.
Unter Modus und Technologie stellen Sie die Anschlussart ein. Bei einem Anlagenanschluss ist das z.B. TE und PTP. Siehe ISDN im Allgemeinen für weitere Details.
In diesem Schritt konfigurieren Sie lediglich den Anschluss des Patton Gateways. Zur vollständigen Funktion fahren Sie nun mit Aemter und Rufregeln anlegen fort.

### ISDN oder Analoge Nebenstellen anlegen
Selektieren Sie das entsprechende Gateway aus der Liste aus, wählen Sie  und schalten Sie dann auf den Tab Belegung um.

Unter Hinzufügen haben Sie folgende Auswahl:

| Typ | Beschreibung |Anwendungsfall|
|-----|--------------|--------------|
|Analoges Endgerät via SIP|	Analoges Endgerät welches über die mobydick geroutet wird	|Telefon|
|ISDN Telefon via SIP|	ISDN Telefon welches über die mobydick geroutet wird	|Telefon|

In diesem Schritt konfigurieren Sie lediglich den Anschluss des Patton Gateways. Zur vollständigen Funktion fahren Sie mit Endgeraete in Betrieb nehmen fort.