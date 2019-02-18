---
title: Queuemetrics Integration
description: Queuemetrics ist eine Software für Callcenter zur Auswertung von Warteschleifen (Teams) und deren Benutzern.
weight: 60
---

{{< doctype "both"  >}}

{{< description >}}

## Übersicht

Queuemetrics ist eine [Software für Callcenter](https://www.pascom.net/de/call-center/) zur Auswertung von Warteschleifen (Teams) und deren Benutzern. 

## Konfiguration

### Queuemetrics Schnittstelle

Queuemetics ist ein Produkt der Firma Loway. Die Queuemetrics Schnittstelle überträgt die Daten zwischen pascom Server und Queuemetrics via Uniloader. Der Uniloader ist auch in der Lage Befehle von Queuemetrics via HTTPS entgegen zu nehmen und diese an die Asterisk AMI weiter zu geben.

Da diese Schnittstelle direkt in pascom integriert ist, ist keinerlei Installation am pascom Server notwendig.

### Queuemetrics konfigurieren

#### API-Benutzer in Queuemetrics anlegen

Loggen Sie sich auf der Queuemetrics Weboberfläche ein und wählen Sie den Menüpunkt {{< ui-button "Settings" >}} > {{< ui-button "Nutzer" >}} > {{< ui-button "Neu anlegen" >}}.

Legen Sie für den API-Benutzer folgende Werte an:

|Parameter|Bedeutung|
|---------|---------|
|Login|Loginname des Benutzers. Wir empfehlen "pascom"|
|Password|Passwort zur Authentifizierung des Benutzers|
|Confirm Password|Wiederholen Sie das Passwort zur Authentifizierung des Benutzers|
|Klasse|Wählen Sie im Dropdown die Klasse "WQLOADER" aus|
|User keys|Klicken Sie auf das Hut-Symbol und wählen Sie "User's roles" > "User may launch ROBOT transactions." und "Misc API access" > "The user can upload logs over HTTP" aus. Im Textfeld wird so automatisch "ROBOTS" eingetragen|

Speichern Sie den Benutzer mit {{< ui-button "Save" >}}.

### pascom konfigurieren

#### Queuemetrics Datenbank anbinden

Loggen Sie sich auf der pascom Weboberfläche ein und wählen Sie den Menüpunkt {{< ui-button "Erweitert" >}} > {{< ui-button "Queuemetrics" >}}:

|Parameter|Bedeutung|
|---------|---------|
|Queuemetrics Anbindung aktiv|Wenn Sie hier ja wählen startet pascom den Dienst der die Warteschleifen-Daten kontinuierlich in der Queuemetrics Datenbank speichert|
|QueueMetrics URL|Die URL des QueueMetrics-Servers|
|API Benutzer|Der API-Benutzer auf dem Queuemetrics-Server (Login-Name)|
|API Passwort|Das Passwort des API-Benutzers|

Speichern Sie die Konfiguration ab und wenden Sie die erzeugten Jobs an.

#### Asterisk Manager Interface konfigurieren

Für die Kommunikation mit dem pascom Server benötigt Queuemetrics Zugriff auf das Asterisk Manager Interface (AMI).

**AMI-Zugangsdaten erhalten**       
Die AMI-Zugangsdaten erhalten Sie auf der pascom Weboberfläche unter {{< ui-button "Erweitert" >}} > {{< ui-button "Queuemetrics" >}} > {{< ui-button "AMI-Zugangsdaten anzeigen" >}}

**AMI-Zugriff in Queuemetrics einrichten**      
Tragen Sie die so erhaltenen Zugangsdaten in der Queuemetrics Weboberfläche unter {{< ui-button "Administrative Tools" >}} > {{< ui-button "Edit system parameters." >}} ein und aktivieren Sie den Telefonanlagen-Zugriff:


    ...
    callfile.dir=tcp:BENUTZERNAME:KENNWORT@127.0.0.1
    ...

    ...
    default.webloaderpbx=true
    ...


Ersetzten Sie BENUTZERNAME und KENNWORT mit den AMI-Zugangsdaten aus der pascom Weboberfläche. Die IP-Adresse 127.0.0.1 muss nicht angepasst werden, da sich der Queumetrics Uniloader auf dem Host der pascom Telefonanlage befindet.


{{% notice note %}}
Das Mithören von Live-Anrufen via Queuemetrics ist mit der aktuellen pascom 18 nicht möglich. 
{{% /notice %}}

## Verbindung überprüfen (Onsite)

### Laden der Daten von pascom zu Queuemetrics prüfen

Um zu sehen ob die Übertragung der Daten von pascom in die Queuemetrics Datenbank funktioniert können Sie die Verbindung mit folgendem Befehl via SSH auf Ihrer Instanz überprüfen:

    journalctl -fu uniloader.service


Als Rückmeldung erhalten Sie den Status der Verbindung:


    root@pascom:/# journalctl -fu uniloader.service            
    -- Logs begin at Tue 2019-02-12 01:01:32 CET. --
    Feb 15 14:46:33 pascom uniloader[12323]: 2019/02/15 14:46:33 Uniloader 0.4.1 (84-20170920.1110) is alive - GR: 19 - Mem: Alloc 3372k (Free 11992503k) Sys 9094k
    Feb 15 14:51:33 pascom uniloader[12323]: 2019/02/15 14:51:33 Uniloader 0.4.1 (84-20170920.1110) is alive - GR: 17 - Mem: Alloc 1941k (Free 11999561k) Sys 9094k
    Feb 15 14:56:33 pascom uniloader[12323]: 2019/02/15 14:56:33 Uniloader 0.4.1 (84-20170920.1110) is alive - GR: 19 - Mem: Alloc 3103k (Free 12004255k) Sys 9094k

