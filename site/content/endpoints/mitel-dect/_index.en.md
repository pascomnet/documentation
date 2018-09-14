---
title: Mitel/Aastra DECT Systems
description: How to integrate your Mitel / Aastra DECT system with your pascom phone system.
weight: 60
---

{{< doctype "both"  >}}

{{< description >}}

![Aastra/ Mitel DECT RFPs](Aastra-Mitel-DECT-System.png?width=50%)

## Overview

An Aastra SIP-DECT system can have any number from 1 to 254 base stations. The base stations are connected to the IP telephone network and communicate with your [pascom VoIP Software](https://www.pascom.net/en/mobydick-voip/ "pascom VoIP phone systems") solution using the SIP protocol. The base stations also communicate with one another using DECT to allow for switching between base stations during a call. A single base station does not have to connect to every other base station, but all base stations must be able to form a chain. Isolated groups of base stations should not be used.

One base station takes care of the user management and the connection to pascom. The master starts the **OpenMobility Manager (OMM)**. This software is used for management tasks and comes with a web interface. If a master base station fails, another base station that was previously specified can take over the role of the master.

{{% notice note %}}
The base stations do not have a power supply but are powered using Power over Ethernet (PoE) technology. Availability of a PoE-compatible switches must be ensured prior to installation.
{{% /notice %}}

### Base Station Boot Process

All base stations (DECT Transmitters) use identical hardware, whether they are used as a master or not. You should first plan which roles the base stations should serve, which is the master, which is the failover and which run as normal base stations before deploying them by using the **OpenMobility Configurator (OMC)**.At this point you should also configure static IP addresses for the base stations. 

### Preparing the DECT Base Station

Um die automatische Provisionierung der pascom nutzen zu können ist auf den DECT-Sendern eine Firmware ab 7.0 erforderlich.

1) Schließen Sie die betreffenden DECT-Sender in Ihrem Netzwerk an

2) Starten Sie den **OpenMobility Configurator**, der mit der Firmware mitgeliefert wird auf einem Rechner, der sich im selben Netzwerk befindet

3) Klicken Sie auf `Scan` und suchen Sie nach der MAC-Adresse der Basisstation, die Sie konfigurieren möchten und tragen Sie die Login-Daten der DECT-Sender ein. Die MAC-Adresse finden Sie auf der Rückseite des DECT-Senders. Der Benutzername und das Passwort sind im Auslieferungszustand jeweils **omm**.

{{% notice note %}}
Wiederholen Sie **Schritt 3**, bis Sie alle DECT-Sender in Ihrem Netzwerk gefunden haben.
{{% /notice %}}

![Netzwerk nach Basisstationen scannen](omm_configurator_scan.en.png?width=90%)

4) Wählen Sie einen DECT-Sender in der Liste aus

5) Klicken Sie auf `Edit configuration` und stellen Sie unter `General` ein welche IP-Adresse der DECT-Sender in Ihrem Telefonie-Netzwerk der pascom Telefonanlage erhalten soll.

6) Als `Router` verwenden Sie die IP der pascom Telefonanlage und setzen Sie den Haken bei `Local Config`.

![Basisstation konfigurieren](omm_configurator_edit1.en.png?width=90%)

7) Stellen Sie unter `OpenMobility` unter `OMM-address` die IP des DECT-Senders ein, der als Master dienen soll. Beim Master selbst ist hier die eigene IP-Adresse des DECT-Senders anzugeben.

8) Tragen Sie unter `TFTP server address` die IP-Adresse der pascom Telefonanlage oder Ihren TFTP Server ein.

9) Tragen Sie unter `TFTP file name` den Wert "*ip.cfg*" bzw. den Namen der Firmwareversion "*iprfp3G.dnld*" (RFP35 oder höher) bzw. "*iprfp2G.tftp*" (RFP34 oder niedriger) ein.

![Basisstation konfigurieren](omm_configurator_edit2.en.png?width=90%)

10) Sobald Sie alle Einstellungen vorgenommen haben klicken Sie auf `Send Configuration` um die Änderungen an die ausgewählten Sender zu schicken.

{{% notice note %}}
Wiederholen Sie **Schritt 4** bis **10**, bis alle DECT-Sender konfiguriert wurden.
{{% /notice %}}

![Konfiguration senden](omm_configurator_send.en.png?width=90%)

## Konfiguration

### MASTER DECT-Sender anlegen

{{% notice note%}}
Bitte beachten Sie, dass Sie bei einem Mischtbetrieb von RFP32 und RFP 34, 35 oder höher, unbedingt die Basisstation des Typs 35 oder höher als Master deklarieren, da die RFP32 ab Firmwareversion 3.0 nicht mehr als Master agieren können.
{{% /notice %}}


Fügen Sie unter `Gateways > Gatewayliste` durch Drücken der Schaltfläche `+Hinzufügen` ein **Aastra Dect** hinzu:

|Parameter|Bedeutung|
|---------|---------|
|OMM MAC Adresse|	Die MAC-Adresse der Master-Basis. Diese kann man auf der Rückseite der Basisstation ablesen.|
|Bezeichnung|	Eine Bezeichnung für diesen DECT-Sender|

{{% notice note%}}
Eine weitere Konfiguration des Aastra DECT-Gateways ist an dieser Stelle nicht nötig, da die Master-Zuweisung bereits im **OpenMobility Configurator** stattgefunden hat.
{{% /notice %}}

### Mobilteile anlegen

Fügen Sie auf der WebUI Ihrer pascom Telefonanlage unter `Endgeräte > Geräteliste` durch Drücken der Schaltfläche `+Hinzufügen` ein **Via Aastra Dect Gateway: Mobilteil** hinzu:

|Parameter|Bedeutung|
|---------|---------|
|Angeschlossen an|Wählen Sie hier den DECT-Sender aus, der als Master definiert wurde|
|Anmelden mit|Anmelde-ID: Der Code zur manuellen Anmeldung des Mobilteils ohne IPEI;           IPEI: Die IPEI dient zur eindeutigen Identifikation eines Mobilteils|
|Anmelde-ID|Hier wird eine Anmelde-ID generiert, wenn Sie bei `Anmelden mit` Anmelde-ID ausgewählt haben|
|IPEI|Tragen Sie hier die IPEI des Mobilteis ein, wenn Sie bei `Anmelden mit` IPEI ausgewählt haben. Die IPEI können Sie auf der Geräterückseite ablesen. Leider müssen Sie dazu den Akku entfernen, da die IPEI auf einem Aufkleber unter dem Akku steht. Alternativ können Sie auch im Info Menü des Mobilteils die IPEI abfragen|

Anschließend können Sie das Mobilgerät wie gewohnt einem [Benutzer (oder Arbeitsplatz)]({{< ref "/user/user">}}) zuweisen.


### Konfiguration des OMM

Loggen Sie sich auf der IP des OMM per WebUi mit Benutzer omm und Passwort omm ein.
Führen Sie folgende Einstellungen durch:

* Passwörter ändern.
* Sprache auswählen: **DE**
* Aktivieren Sie die erweiterten Einstellungen in dem Sie neben der Sprachauswahl bei **Erweitert** (bzw. Advanced) einen Haken setzen

![Konfiguration senden](omm_aastra_password.en.png?width=90%)

* **System > Systemeinstellungen** den PARK eintragen, der auf der mitgelieferten Aastra CD aufgedruckt ist oder den PARK direkt via `Online PARK-Abruf` generieren. Beachten Sie, das hierzu der DECT-Sender eine Internetverbindung aufbauen können muss.
* Die Uhrzeit anpassen
* Speichern. Das System bootet jetzt neu.

![Konfiguration senden](omm_aastra_park.de.png?width=90%)

Abschließend ist nur noch folgender Schritt notwendig:

Markieren Sie den Master DECT-Sender unter `Gateways > Gatewayliste` in der Weboberfläche Ihrer pascom Telefonanlage und wählen Sie unter `Aktion` die Option `Provisioning URL` aus.
Kopieren Sie den relativen Provisioning-Pfad heraus, da dieser im nächsten Schritt benötigt wird.

Surfen Sie auf die Weboberfläche des Master DECT-Senders und loggen Sie sich ein.
Fügen Sie unter `System > Provisionierung` in dem Feld `Server` die IP der Telefonanlage ein. Unter `Pfad` können Sie den zuvor kopierten Provisioning-Pfad einfügen. Achten Sie darauf, dass das korrekte `Protokoll` (HTTP oder HTTPS) ausgewählt ist.

Bestätigen Sie die Einstellungen mit **OK**

![Konfiguration senden](omm_aastra_provisioning.de.png?width=90%)


### Import der Mobilteil Konfiguration in den OMM

Anstatt die Telefone per Hand im OMM anzulegen laden Sie die nötige Konfigurationsdatei aus der pascom Weboberfläche herunter:

Wählen Sie unter `Gateways` > `Gatewayliste` den Aastra DECT-Sender aus, den Sie als Master definiert haben und drücken Sie `Bearbeiten`.
Unter `Konfigurationsdateien` finden Sie einen Download-Link mit der benötigten Mobilteil-Konfiguration.
Die Mobilteil Konfiguration enthält alle angelegten Mobilteile und kann im OMM unter dem Punkt **DECT-Endgeräte** importiert werden.

#### Vorgehensweise beim Importieren der Daten:

Wenn man im entsprechenden Menüpunkt der OMM-Konfiguration auf `DECT-Endgeräte` > `Importieren` geklickt hat, öffnet sich eine neue Maske. Dort muss man folgendermaßen vorgehen:

1) Unter `Registerungsdaten importieren` den Menüpunkt Durchsuchen bzw. Select File anklicken

2) Die Datei hochladen

3) Dann auf Importieren/ Import klicken

4) Der RFP liest nun die Datei und parst diese

Es erscheint darunter eine Liste mit allen Einträgen (Mobilteilen).

5) Hier alle gewünschten Einträge selektieren

6) Dann auf **Add** klicken

Die Einträge sind nun importiert.

{{% notice warning %}}
Wenn sie diesen Import mehrmals durchführen, dürfen sie beim Import in Schritt 6 nur die neu hinzugekommene Geräte auswählen da der Import ansonsten fehlschlägt. Weggefallene Geräte müssen in der OMM-Konfigurationsoberfläche manuell entfernt werden
{{% /notice %}}

### Mobilteile mit DECT-System verbinden

Je nachdem, welche Verbindungsart Sie am beim Anlegen der Mobilteile ausgewählt haben, gibt es 2 Möglichkeiten um Ihre Mobilteile mit dem DECT-System zu verbinden.

#### Additional ID

1. Notieren Sie sich den `Handset Registrierungs-PIN` aus den Einstellungen Ihres Master DECT Senders unter `Gateways` > `Gatewayliste`
2. Notieren Sie sich die `Additional ID` aus den Einstellungen Ihres Mobilteils unter `Endgeräte` > `Geräteliste`
3. Drücken Sie die Menütaste Ihres Mobilteils und wählen Sie `System` > `Neues System`
4. Geben Sie jetzt die zuvor notierte Registrierungs-PIN, den Buchstaben **R** und dann die Additional ID ein und bestätigen Sie Ihre Eingabe mit `Anmelden`, danach wird sich das Mobilteil automatisch mit Ihrem DECT-Sender verbinden.

Beispiel:

        12345R0987


#### IPEI

1. Notieren Sie sich den `Handset Registrierungs-PIN` aus den Einstellungen Ihres Master DECT Senders unter `Gateways` > `Gatewayliste`
2. Drücken Sie die Menütaste Ihres Mobilteils und wählen Sie `System` > `Neues System`
3. Geben Sie als Zugangscode den Handset Registrierungs-PIN ein
4. Bestätigen Sie Ihre Eingabe mit `Anmelden`, danach wird sich das Mobilteil automatisch mit Ihrem DECT-Sender verbinden.
