---
title: aastra DECT System anbinden
keywords: 
    - aastra DECT System anbinden
    - Multizellen DECT System
    - Mitel DECT System anbinden
    - VoIP DECT
description: 
url:  /endgeraete/aastra-dect-system-anbinden/
linken: /devices/integrate-aastra-dect-system/
prev: /endgeraete/analog-und-isdn-geraete/
weight: 48
toc: true

---

## Überblick

Ein Aastra-SIP-Dect System besteht aus mindestens einer und bis zu 254 Basisstationen. Die Basisstationen werden an das IP-Telefonnetzwerk angeschlossen und kommunizieren per SIP mit der mobydick. Zusätzlich gleichen sich die Basen per Funk (DECT) ab um ein Wechseln der Basis während des Telefonates zu ermöglichen. Dabei muss nicht jede Basis jede andere Basis per Funk erreichen können aber alle Basen müssen miteinander verkettet sein. Es dürfen keine Inseln entstehen.

Eine Basis übernimmt die Verwaltung der Benutzer und die Verbindung zur mobydick. Diese Basis ist der Master. Der Master startet die Software **OpenMobility Manager** kurz **OMM**. Diese dient zur Verwaltung und hält eine Weboberfläche bereit. Fällt der Master aus kann dessen Arbeit von einer anderen, zuvor festgelegten, Failover-Basis übernommen werden. 

{{% notice note %}}
Die Basen haben kein Netzteil sondern beziehen den Strom über PowerOverEthernet (POE). Klären Sie vor der Installation ab ob Ihnen ein POE fähiger Switch zur Verfügung steht.
{{% /notice %}}

## Bootvorgang einer Basisstation

Jede Basis, egal ob diese später der Master werden soll oder nicht, ist baugleich. Die Basis bootet und stellt eine DHCP Anfrage an die mobydick. mobydick sieht in der Datenbank nach ob die MAC-Adresse dieser Basis als Master laufen soll. Falls ja übergibt der DHCP Server neben der IP Adresse und der URL zum Firmwaredownload auch die Information dass auf dieser Basis der Master hochgefahren werden soll. Wer der Master, wer Failover und wer einfach als normale Basisstation arbeiten soll konfigurieren Sie zuvor in der mobydick Weboberfläche.

## Konfiguration

### DHCP- und TFTP-Server einschalten

Soweit noch nicht geschehen konfigurieren Sie mobydick als DHCP-Server. Natürlich können Sie auch einen anderen DHCP Server verwenden, allerdings ist die Konfiguration sehr aufwändig, da der VendorCode in der DHCP Anfrage der Basis ermittelt werden muss. Falls Sie dennoch einen alternativen DHCP verwenden möchten entnehmen Sie die dafür nötigen Schritte bitte den Aastra Beutzerhandbüchern.

Den TFTP Server aktivieren Sie in der mobydick Weboberfläche unter Appliance > Dienste` und stellen dort die Option **TFTP Server** aktiv auf **ja**.

### Master Basisstation anlegen

{{% notice note%}}
Bitte beachten Sie, dass Sie bei einem Mischtbetrieb von RFP32 und RFP 34, 35 oder höher, unbedingt die Basisstationen des Typs RFP 34, 35 oder höher als Master deklarieren, da die RFP32 ab Firmwareversion 3.0 nicht mehr als Master agieren können.
{{% /notice %}}


Fügen Sie unter `Gateways > Gatewayliste` durch Drücken der Schaltfläche `+Hinzufügen` ein **neues Aastra Dect Gateway** hinzu:

|Parameter|Bedeutung|
|---------|---------|
|Bezeichnung|	Eine Bezeichnung für das gesamte DECT-System|
|Firmware|	Wählen Sie welche Firmware per TFTP an die Master Basis ausgeliefert werden soll|
|MAC Adresse|	Die MAC-Adresse der Master Basis. Diese kann man auf der Rückseite der Basisstation ablesen.|
|Gewünschte IP-Adresse|	Geben Sie hier hie IP-Adresse ein die der DHCP Server für die Master Basis reservieren soll
|Netzmaske|	Die dazugehörige Netzmaske|
|Benutzername|	Den Benutzernamen um auf den OMM einzuloggen. Im Auslieferungszustand ist der Benutzername **omm**|
|Passwort|	Das Passwort um auf den OMM einzuloggen. Im Auslieferungszustand ist das Passwort **omm**|

### Weitere Basen hinzufügen

Nach dem Speichern der Einstellungen für den Master steht Ihnen die Detailmaske zur Verfügung:

Hier wurde im Reiter Basissstationen bereits der Master angelegt. Durch Drücken der Schaltfläche Hinzufügen können Sie nun weitere Basen anlegen. Per Basis stehen Ihnen folgende Einstellungen zur Verfügung:

|Parameter|Bedeutung|
|---------|---------|
|Name|	Name der Basis|
|MAC Adresse|	Die MAC-Adresse der Basis. Diese kann man auf der Rückseite der Basisstation ablesen.|
|Ziel-Ip|	Geben Sie hier hie IP-Adresse ein die der DHCP Server für die Basis reservieren soll|
|Firmware|	Hier könnten Sie pro Basis eine andere Firmware auswählen die per TFTP an diese Basis vergeben werden soll. Es empfiehlt sich aber diese Einstellung auf default zu lassen. Dadurch wird an alle Basen die selbe, unter dem Reiter Basisdaten eingestellte, Firmware ausgeliefert.|
|Master|	Diese Basis ist der Master. Nur eine Basis kann als Master gewählt werden.|
|Failover|	Diese Basis fungiert als Failover. Nur eine Basis kann als Failover gewählt werden.|
|Reflektierende Umgebung|	Ist diese Option auf Ja halbiert das System auf dieser Basis seine Kanalkapazitäten. Jedes Mobilteil kommuniziert dann über zwei Kanäle und wechselt automatisch auf den aktuell besseren. Diese Option ist besonders in störanfälligen Umgebungen sinnvoll.|


### Mobilteile anlegen

Unter dem Reiter Mobilgeräte können Sie Ihre Handsets anlegen:

Dazu müssen Sie die IPEI des Gerätes eintragen. Die IPEI dient zur eindeutigen Identifikation eines Mobilteiles. Ähnlich wie die MAC Adresse eines Rechners in IP Netzwerken.

Die IPEI können Sie auf der Geräterückseite ablesen. Leider müssen Sie dazu den Akku entfernen, da die IPEI auf einem Aufkleber unter dem Akku steht. Alternativ können Sie auch im Info Menü des Telefones die IPEI abfragen.

Nach diesem Schritt stehen Ihnen die Telefone, wie gewohnt, als Geräte in mobydick zur Verfügung und können den jeweiligen Benutzern bzw. Arbeitslätzen zugeteilt werden. 

### Basisstationen in Betrieb nehmen

Verbinden Sie erst jetzt die Basisstationen mit dem Netzwerk. Nach einer Zeit sollten Sie auf dem Master per Weboberfläche einloggen können:

### Konfiguration des OMM

Loggen Sie sich auf der IP des OMM per Web mit Benutzer omm und Passwort omm ein. Ab diesem Zeitpunkt können Sie der Anleitung zur Konfiguration von aastra folgen. Diese bekommen Sie unter [http://mitel.de](http://mitel.de "Mitel Webseite"). Zur Zeit der Artikelerstellung befand sich die aktuelle Anleitung auf der Seite [http://miteldocs.com/document-library_2.htm?curr_fam=SIP-DECT&curr_nav=4&prod_id=6023](http://miteldocs.com/document-library_2.htm?curr_fam=SIP-DECT&curr_nav=4&prod_id=6023 "Mitel Dokumentation")

Für Eilige (kann bei anderen Firmwareversionen natürlich abweichen):

* Passwörter ändern.
* **System > System settings** den PARK eintragen, der auf der mitgelieferten aastra CD aufgedruckt ist. Uhrzeit anpassen und speichern. Das System bootet neu.
* **System > SIP** als Registrar und Proxy die IP der mobydick eintragen
* Auf den Schraubenschlüssel neben dem Mobilteil drücken und Nutzerdaten entsprechend der Identität auf der mobydick einstellen.

### Import der mobydick Daten in den OMM

Anstatt die Telefone und die andere Basen per Hand im OMM anzulegen laden Sie die nötigen Konfigurationsdateien aus der mobydick Weboberfläche herunter:

Die RFP Konfiguration enthält das Setup aller Basisstationen und kann im OMM unter dem Punkt **Radio Fixed Parts > Import** importiert werden.

Die Mobilteil Konfiguration enthält alle angelegten Mobilteile und kann im OMM unter dem Punkt **Portable Parts > Import** importiert werden.
 
#### Vorgehensweise beim Importieren der Daten:

Wenn man im entsprechenden Menüpunkt der OMM-Konfiguration auf Import geklickt hat, wird man zu einer neuen Maske weitergeleitet. Dort muss man folgendermaßen vorgehen:

1. Den Menüpunkt Datei auswählen bzw. Select File anklicken
2. Die Datei hochladen
3. Dann auf Import klicken
4. Der RFP liest nun die Datei und parst diese.

Es erscheint darunter eine Liste mit allen Einträgen (RFP oder Mobilteilen).

1. Hier alle gewünschten Einträge selektieren
2. Dann auf **Add** klicken

Die Einträge sind nun importiert.

{{% notice warning %}}
Wenn sie diesen Import mehrmals durchführen, dürfen sie beim Import in Schritt 6 nur die neu  hinzugekommen Geräte auswählen da der Import ansonsten fehlschlägt. Weggefallene Geräte müssen in der OMM-Konfigurationsoberfläche manuell entfernt werden
{{% /notice %}}