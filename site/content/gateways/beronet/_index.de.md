---
title: beroNet Gateways einrichten
description: Integrieren Sie Ihre Analog- und ISDN-Endgeräte mithilfe von beroNet Gateways in Ihre pascom
weight: 10
---

## Übersicht

beroNet Karten und Gateways sind modular aufgebaut. Das bedeutet für Sie, dass Sie unterschiedliche Anschlüsse mit nur einem Gerät abbilden können. Mehr über Gateways für unsere VoIP Hardware Lösung finden Sie [hier](https://www.pascom.net/de/mobydick-classic/).


### beroNet VoIP Gateways
Das beroNet VoIP Gateway wird an die LAN Verkabelung angeschlossen und erhält eine IP-Adresse aus dem Telefonnetz. An die vorderen Anschlüsse der Gateway werden dann z. B. das öffentliche Telefonnetz bzw. analoge Endgeräte angeschlossen. beroNet Gateways können modular mit Modulen ausgestattet werden. Je nach Modulen sind die Ports an der Vorderseite Analog oder ISDN. Durch die Anbindung per LAN eigenen sich beroNet Gateways ideal für Umgebungen in denen pascom in einer virtuellen Maschine betrieben wird.

![beroNet Gateway](voip_gateway.de.png)

### beroNet Karten
beroNet Karten werden in die pascom eingebaut und erhalten beim Hochfahren der pascom automatisch eine IP-Adresse aus dem Zero-Config-Netzwerk **169.254.0.0/16**. Bis auf diesen Unterschied lassen sich beroNet Gateways und Karten identisch konfigurieren.


## ISDN und Analoge Nebenstellen
Nebenstellen wie Faxgeräte, Faxserver, Telefone, Türöffner, etc. können entweder direkt oder via SIP angebunden werden.

### Anbindung direkt

![beroNet direkt](direct.de.png)

**Anrufe** werden **nicht in SIP gewandelt** und über die pascom geschickt sondern direkt auf der beroNet geroutet. Kommt beispielsweise ein eingehender Anruf für das Faxgerät herein wird dieser direkt von der Beronet mit dem Faxgerät verbunden.

Der **Vorteil** dieser Methode ist, dass Verbindungen die nicht in SIP gewandelt werden. Für Faxanwendungen erzielt man dadurch wesentlich bessere Ergebnisse. Ein weitere Anwendugsfall ist die Übertragung von ISDN Daten.  

**Nachteil** ist, dass die pascom von diesen Anrufen nichts "mit bekommt". Dadurch kann pascom nicht in den Anruffluss eingreifen. Z. B. den Anruf nach einem Timeout an ein anderes Ziel leiten, Geschäftszeiten prüfen, usw.. Außerdem muss sich das ISDN Amt und die betroffene Nebenstelle auf der selben beroNet Hardware befinden.

### Anbindung via SIP

![beroNet über SIP](via_sip.de.png)

**Via SIP** bedeutet, dass alle Rufe für die entsprechende Nebenstelle per SIP über die pascom geroutet werden. Kommt beispielsweise ein Anruf für das Faxgerät herein wird dieser zuerst über **(1)** zur pascom geroutet und dann weiter über **(2)** zum analogen Faxgerät.

Der **Vorteil** dieser Methode ist, dass die Verbindungen über die pascom geroutet werden. Dadurch kann pascom in den Anruffluss eingreifen z. B. den Anruf nach einem Timeout an ein anderes Ziel leiten, Geschäftszeiten prüfen, usw.. muss die Nebenstelle nicht auf der selben Beronet Hardware wie die Amtsleitungen befinden.

**Nachteil** ist, dass z. B. Faxanwendungen in manchen Fällen nicht so stabil laufen und ISDN Datenübertragungen nicht möglich sind.

## Vorbereitung

Als Vorbereitung müssen Gateways wie Karten mit den passenden Modulen bestückt werden. Haben Sie Ihre Hardware bei pascom bestellt sind diese Module bereits installiert. Detail hierzu wie z. B. Portbelegung, usw. entnehmen Sie bitte direkt der [Beronet Dokumentation] (https://beronet.atlassian.net/wiki/spaces/PUB/pages/51085410/Gateways+and+Cards "Zur beroNet Dokumentation").

PCI Karten bauen Sie einfach in den MobDick Server ein und fahren diesen hoch. pascom wird der Karte automatisch eine IP aus dem Netzwerk **169.254.0.0/16** zuweisen.

Gateways verbinden Sie mit Ihrem Switch. Schließen Sie dann das Netzteil an und lassen die Gateway booten. Die Gateway zieht sich automatisch eine IP-Adresse per DHCP. Falls Sie in diesem Netz keinen DHCP betrieben wird, ist pascom in der Lage die Gateway auch ohne IP aufzuspüren und zu konfigurieren solange sich diese im selben Netzsegment befindet.


## Konfiguration

### Auffinden und Anlegen von beroNet Hardware
Sobald Sie die beroNet Karte eingebaut oder beroNet Gateway mit dem LAN verbunden haben ist pascom in der Lage die Hardware automatisch zu erkennen. Bei beroNet Gateways gilt dies nur solange sich die Gateway im selben Netzsegment wie die pascom befindet.

Wählen Sie in der pascom Weboberfläche Gateways > Gatewayliste und drücken Sie auf die `+Hinzufügen` Schaltfläche. pascom wird nun versuchen die beroNet Hardware zu finden:
![Screenshot - beroNet Gateway erkennen](detect.de.png?width=90% "Neues beroNet Gateway erkennen")


Gelingt dies nicht, oder befindet sich eine beroNet Gateway in einem anderen Netzsegment als die pascom haben Sie im Anschluss die Möglichkeit das Gerät per Schaltfäche `Manuell anlegen` hinzuzufügen.

In der Dropdownbox `Gateways` sehen sie alle vom System erkannten beroNet Gateways und Karten:
![Screenshot - beroNet Gateway anlegen](add.de.png?width=90% "Neues beroNet Gateway anlegen")

In den Felder **Benutzername** und **Passwort** geben Sie die Zugangsdaten für den auf den beroNet Geräten befindlichen Webserver an. Im Auslieferungszustand sind diese **admin** und **admin**. Eine Änderung von Benutzernamen und Passwort ist an dieser Stelle nicht möglich.

Bei beroNet Gateways haben Sie zusätzlich die Möglichkeit die Netzwerkkonfiguration der Gateway durch die Felder **IP Adresse, Netzwerkmaske und Gateway** zu verändern. Wollen Sie keine Änderungen am Netzwerk vornehmen lassen Sie die Felder einfach leer. Bei eingebauten PCI Karten wird das Netzwerk automatisch konfiguriert und kann nicht verändert werden.

Drücken Sie auf die Schaltfläche `Weiter`. In der nächsten Maske sehen Sie noch einmal eine Zusammenfassung und die Modulbestückung der beroNet Karte oder Gateway. Sie die Möglichkeit den Vorgang durch **Speichern** abzuschließen.

Alternativ können Sie aber auch durch die Angabe weiterer Daten (`Amt angegen` anhaken) gleich noch ein Amt samt ein- und ausgehende Regeln anlegen.

### ISDN Amtsleitungen anlegen
In vielen Fällen wird beroNet Hardware dazu verwendet ISDN Amtsleitungen daran anzuschließen. Selektieren Sie hierzu das entsprechende Gateway aus der Liste aus, wählen Sie `Bearbeiten` und schalten Sie dann auf den Tab **Belegung** um.
![Screenshot - ISDN Amt hinzufügen](isdn_trunk_add.de.png?width=90% "ISDN Amt per beroNet hinzufügen")

Unter `Hinzuführen` können Sie entweder **BRI** oder **PRI Amtsleitungen** konfigurieren.

<!-- //FixMe Siehe Konzept: ISDN verstehen falls Sie mit den Begrifflichkeiten nicht vertraut sind. Dieser Vorgang fügt einen neuen Datensatz ein. -->

![Screenshot - ISDN Amt hinzufügen im Detail](isdn_trunk_add_detail.de.png?width=90% "ISDN Amt per beroNet hinzufügen")


Klicken Sie im entsprechenden Datensatz doppelt auf das Feld `Bezeichnung`. Dadurch öffnet sich ein Detailfenster. Hier können Sie dann anhaken welcher **Port** der Karte zu diesem Amt gehört. Auch Mehrfachauswahlen sind möglich da es bei z.B. Anlagenanschlüss sein kann, dass mehrere NTs zu einem Amtsanschluss zusammengefasst werden.

Unter `Modus` und `Technologie` stellen Sie die Anschlussart ein. Bei einem Anlagenanschluss ist das z. B. **TE** und **PTP**.

<!-- //FixMe  Siehe Konzept: ISDN verstehen für weitere Details. -->

In diesem Schritt konfigurieren Sie lediglich den Anschluss auf der beroNet Hardware. Zur vollständigen Funktion fahren Sie nun mit Aemter und Rufregeln anlegen fort.

### ISDN oder Analoge Nebenstellen anlegen

Selektieren Sie das entsprechende Gateway aus der Liste aus, wählen Sie `Bearbeiten` und schalten Sie dann auf den Tab **Belegung** um.

![Screenshot - Analoges Endgerät hinzufügen](analog_add.de.png?width=90% "Analoges Endgerät hinzufügen")

Unter `Hinzufügen` haben Sie folgende Auswahl:

|Typ|Beschreibung|Anwendungsfall|
|---|---|---|
|Analoges Endgerät direkt|Analoges Endgerät welches direkt auf der Berofix Hardware geroutet wird|Faxgerät, Türöffner, Feuermeldeanlage|
|Analoges Endgerät via SIP|Analoges Endgerät welches über die pascom geroutet wird|Telefon|
|ISDN Telefon direkt|ISDN Telefon welches direkt auf der Berofix Hardware geroutet wird |Notruftelefon|
|ISDN Fax direkt|ISDN Fax welches direkt auf der Berofix Hardware geroutet wird |Faxserver (z. B. Tobit Faxware)|
|ISDN Datenleitung direkt|ISDN Datenleitung welches direkt auf der Berofix Hardware geroutet wird|Onlinebanking, ISDN Maschinensteuerung, Alarmanlage|
|ISDN Telefon via SIP|ISDN Telefon welches über die pascom geroutet wird|Telefon|


<!-- FIXME -->
In diesem Schritt konfigurieren Sie lediglich den Anschluss auf der Berofix Hardware. Zur vollständigen Funktion fahren Sie mit Endgeraete in Betrieb nehmen fort.
