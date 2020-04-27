---
title: Mitel DECT-System
description: Integrieren Sie Ihr Mitel DECT-System in die pascom.
weight: 15
---

{{< doctype "both"  >}}

{{< description >}}

![Mitel DECT RFPs](Aastra-Mitel-DECT-System.png?width=50%)

## Unterstützte Geräte

**[Liste der unterstützten Endgeräte, hier klicken!]({{<ref "/endpoints#mitel-dect-systeme" >}})**

## Überblick

Ein Mitel-SIP-Dect System besteht aus mindestens einer und bis zu 254 Basisstationen. Die Basisstationen werden an das IP-Telefonnetzwerk angeschlossen und kommunizieren per SIP mit der [pascom VoIP Software](https://www.pascom.net/de/mobydick-voip/ "pascom VoIP Software"). Zusätzlich gleichen sich die Basen per Funk (DECT) ab um ein Wechseln der Basis während des Telefonates zu ermöglichen. Dabei muss nicht jede Basis jede andere Basis per Funk erreichen können aber alle Basen müssen miteinander verkettet sein. Es dürfen keine Inseln entstehen.

Eine Basis übernimmt die Verwaltung der Benutzer und die Verbindung zur pascom. Diese Basis ist der Master. Der Master startet die Software **OpenMobility Manager** kurz **OMM**. Diese dient zur Verwaltung und hält eine Weboberfläche bereit. Fällt der Master aus kann dessen Arbeit von einer anderen, zuvor festgelegten, Failover-Basis übernommen werden.

{{% notice note %}}
Die Basen haben kein Netzteil sondern beziehen den Strom über PowerOverEthernet (POE). Klären Sie vor der Installation ab ob Ihnen ein POE fähiger Switch zur Verfügung steht.
{{% /notice %}}

## Bootvorgang einer Basisstation

Jede Basis, egal ob diese später der Master werden soll oder nicht, ist baugleich. Wer der Master, wer Failover und wer einfach als normale Basisstation arbeiten soll konfigurieren Sie zuvor im **OpenMobility Configurator (OMC)**. An dieser Stelle konfigurieren Sie auch die feste IP-Adresse der Basisstation.

### Vorbereitung der DECT-Sender

Um die automatische Provisionierung der pascom nutzen zu können ist auf den DECT-Sendern eine Firmware ab 7.0 erforderlich.

1) Schließen Sie die betreffenden DECT-Sender in Ihrem Netzwerk an

2) Starten Sie den **OpenMobility Configurator**, der mit der Firmware mitgeliefert wird auf einem Rechner, der sich im selben Netzwerk befindet

3) Klicken Sie auf {{< ui-button "Scan" >}} und suchen Sie nach der MAC-Adresse der Basisstation, die Sie konfigurieren möchten und tragen Sie die Login-Daten der DECT-Sender ein. Die MAC-Adresse finden Sie auf der Rückseite des DECT-Senders. Der Benutzername und das Passwort sind im Auslieferungszustand jeweils **omm**.

{{% notice note %}}
Wiederholen Sie **Schritt 3**, bis Sie alle DECT-Sender in Ihrem Netzwerk gefunden haben.
{{% /notice %}}

![Netzwerk nach Basisstationen scannen](omm_configurator_scan.en.png?width=90%)

4) Wählen Sie einen DECT-Sender in der Liste aus

5) Klicken Sie auf {{< ui-button "Edit configuration" >}} und stellen Sie unter {{< ui-button "General" >}} ein welche IP-Adresse der DECT-Sender in Ihrem Telefonie-Netzwerk der pascom Telefonanlage erhalten soll.

6) Als {{< ui-button "Router" >}} verwenden Sie die IP der pascom Telefonanlage und setzen Sie den Haken bei {{< ui-button "Local Config" >}}.

![Basisstation konfigurieren](omm_configurator_edit1.en.png?width=90%)

7) Stellen Sie unter {{< ui-button "OpenMobility" >}} unter {{< ui-button "OMM-address" >}} die IP des DECT-Senders ein, der als Master dienen soll. Beim Master selbst ist hier die eigene IP-Adresse des DECT-Senders anzugeben.

8) Tragen Sie unter {{< ui-button "TFTP server address" >}} die IP-Adresse der pascom Telefonanlage oder Ihren TFTP Server ein.

9) Tragen Sie unter {{< ui-button "TFTP file name" >}} den Wert "*ip.cfg*" bzw. den Namen der Firmwareversion "*iprfp3G.dnld*" (RFP35 oder höher) bzw. "*iprfp2G.tftp*" (RFP34 oder niedriger) ein.

![Basisstation konfigurieren](omm_configurator_edit2.en.png?width=90%)

10) Sobald Sie alle Einstellungen vorgenommen haben klicken Sie auf {{< ui-button "Send Configuration" >}} um die Änderungen an die ausgewählten Sender zu schicken.

{{% notice note %}}
Wiederholen Sie **Schritt 4** bis **10**, bis alle DECT-Sender konfiguriert wurden.
{{% /notice %}}

![Konfiguration senden](omm_configurator_send.en.png?width=90%)

## Konfiguration

### MASTER DECT-Sender anlegen

{{% notice note%}}
Bitte beachten Sie, dass Sie bei einem Mischtbetrieb von RFP32 und RFP 34, 35 oder höher, unbedingt die Basisstation des Typs 35 oder höher als Master deklarieren, da die RFP32 ab Firmwareversion 3.0 nicht mehr als Master agieren können.
{{% /notice %}}


Fügen Sie unter {{< ui-button "Gateways" >}} > {{< ui-button "Gatewayliste" >}} durch Drücken der Schaltfläche {{< ui-button "+Hinzufügen" >}} ein **Aastra Dect** hinzu:

|Parameter|Bedeutung|
|---------|---------|
|OMM MAC Adresse|	Die MAC-Adresse der Master-Basis. Diese kann man auf der Rückseite der Basisstation ablesen.|
|Bezeichnung|	Eine Bezeichnung für diesen DECT-Sender|

{{% notice note%}}
Eine weitere Konfiguration des Aastra DECT-Gateways ist an dieser Stelle nicht nötig, da die Master-Zuweisung bereits im **OpenMobility Configurator** stattgefunden hat.
{{% /notice %}}

### Mobilteile anlegen

Fügen Sie auf der WebUI Ihrer pascom Telefonanlage unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} durch Drücken der Schaltfläche {{< ui-button "+Hinzufügen" >}} ein **Via Aastra Dect Gateway: Mobilteil** hinzu:

|Parameter|Bedeutung|
|---------|---------|
|Angeschlossen an|Wählen Sie hier den DECT-Sender aus, der als Master definiert wurde|
|Anmelden mit|Anmelde-ID: Der Code zur manuellen Anmeldung des Mobilteils ohne IPEI;           IPEI: Die IPEI dient zur eindeutigen Identifikation eines Mobilteils|
|Anmelde-ID|Hier wird eine Anmelde-ID generiert, wenn Sie bei {{< ui-button "Anmelden mit" >}} Anmelde-ID ausgewählt haben|
|IPEI|Tragen Sie hier die IPEI des Mobilteis ein, wenn Sie bei {{< ui-button "Anmelden mit" >}} IPEI ausgewählt haben. Die IPEI können Sie auf der Geräterückseite ablesen. Leider müssen Sie dazu den Akku entfernen, da die IPEI auf einem Aufkleber unter dem Akku steht. Alternativ können Sie auch im Info Menü des Mobilteils die IPEI abfragen|

Anschließend können Sie das Mobilgerät wie gewohnt einem [Benutzer (oder Arbeitsplatz)]({{< ref "/user/user">}}) zuweisen.


### Konfiguration des OMM

Loggen Sie sich auf der IP des OMM per WebUi mit Benutzer omm und Passwort omm ein.
Führen Sie folgende Einstellungen durch:

* Passwörter ändern.
* Sprache auswählen: **DE**
* Aktivieren Sie die erweiterten Einstellungen in dem Sie neben der Sprachauswahl bei **Erweitert** (bzw. Advanced) einen Haken setzen

![Konfiguration senden](omm_aastra_password.en.png?width=90%)

* **System > Systemeinstellungen** den PARK eintragen, der auf der mitgelieferten Aastra CD aufgedruckt ist oder den PARK direkt via {{< ui-button "Online PARK-Abruf" >}} generieren. Beachten Sie, das hierzu der DECT-Sender eine Internetverbindung aufbauen können muss.
* Die Uhrzeit anpassen
* Speichern. Das System bootet jetzt neu.

![Konfiguration senden](omm_aastra_park.de.png?width=90%)

Abschließend ist nur noch folgender Schritt notwendig:

Markieren Sie den Master DECT-Sender unter {{< ui-button "Gateways" >}} > {{< ui-button "Gatewayliste" >}} in der Weboberfläche Ihrer pascom Telefonanlage und wählen Sie unter {{< ui-button "Aktion" >}} die Option {{< ui-button "Provisioning URL" >}} aus.
Kopieren Sie den relativen Provisioning-Pfad heraus, da dieser im nächsten Schritt benötigt wird.

Surfen Sie auf die Weboberfläche des Master DECT-Senders und loggen Sie sich ein.
Fügen Sie unter {{< ui-button "System" >}} > {{< ui-button "Provisionierung" >}} in dem Feld {{< ui-button "Server" >}} die IP der Telefonanlage ein. Unter {{< ui-button "Pfad" >}} können Sie den zuvor kopierten Provisioning-Pfad einfügen. Achten Sie darauf, dass das korrekte {{< ui-button "Protokoll" >}} (HTTP oder HTTPS) ausgewählt ist.

Bestätigen Sie die Einstellungen mit **OK**

![Konfiguration senden](omm_aastra_provisioning.de.png?width=90%)


### Import der Mobilteil Konfiguration in den OMM

Anstatt die Telefone per Hand im OMM anzulegen laden Sie die nötige Konfigurationsdatei aus der pascom Weboberfläche herunter:

Wählen Sie unter {{< ui-button "Gateways" >}} > {{< ui-button "Gatewayliste" >}} den Aastra DECT-Sender aus, den Sie als Master definiert haben und drücken Sie {{< ui-button "Bearbeiten" >}}.
Unter {{< ui-button "Konfigurationsdateien" >}} finden Sie einen Download-Link mit der benötigten Mobilteil-Konfiguration.
Die Mobilteil Konfiguration enthält alle angelegten Mobilteile und kann im OMM unter dem Punkt **DECT-Endgeräte** importiert werden.

#### Vorgehensweise beim Importieren der Daten:

Wenn man im entsprechenden Menüpunkt der OMM-Konfiguration auf {{< ui-button "DECT-Endgeräte" >}} > {{< ui-button "Importieren" >}} geklickt hat, öffnet sich eine neue Maske. Dort muss man folgendermaßen vorgehen:

1) Unter {{< ui-button "Registerungsdaten importieren" >}} den Menüpunkt Durchsuchen bzw. Select File anklicken

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

1. Notieren Sie sich den {{< ui-button "Handset Registrierungs-PIN" >}} aus den Einstellungen Ihres Master DECT Senders unter {{< ui-button "Gateways" >}} > {{< ui-button "Gatewayliste" >}}
2. Notieren Sie sich die {{< ui-button "Additional ID" >}} aus den Einstellungen Ihres Mobilteils unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}}
3. Drücken Sie die Menütaste Ihres Mobilteils und wählen Sie {{< ui-button "System" >}} > {{< ui-button "Neues System" >}}
4. Geben Sie jetzt die zuvor notierte Registrierungs-PIN, den Buchstaben **R** und dann die Additional ID ein und bestätigen Sie Ihre Eingabe mit {{< ui-button "Anmelden" >}}, danach wird sich das Mobilteil automatisch mit Ihrem DECT-Sender verbinden.

Beispiel:

        12345R0987


#### IPEI

1. Notieren Sie sich den {{< ui-button "Handset Registrierungs-PIN" >}} aus den Einstellungen Ihres Master DECT Senders unter {{< ui-button "Gateways" >}} > {{< ui-button "Gatewayliste" >}}
2. Drücken Sie die Menütaste Ihres Mobilteils und wählen Sie {{< ui-button "System" >}} > {{< ui-button "Neues System" >}}
3. Geben Sie als Zugangscode den Handset Registrierungs-PIN ein
4. Bestätigen Sie Ihre Eingabe mit {{< ui-button "Anmelden" >}}, danach wird sich das Mobilteil automatisch mit Ihrem DECT-Sender verbinden.
