---
title: Aufgaben automatisieren
keywords:
    - Aufgaben automatisieren
    - Cronjobs
    - Jobs anlegen
description: Mit Cronjobs können Sie in Ihrer mobydick für einige Aufgaben Zeitpläne hinterlegen.
linken: /server/automation/
url: /server/automasierung/
prev: /server/sicherung/
weight: 19
toc: true

---


## Konzept
Einige administrative Aufgaben sind regelmäßig durchzuführen. Mit Cronjobs können Sie für einige Aufgaben Zeitpläne hinterlegen, die den jeweiligen Job dem Daemon regelmäßig zur Ausführung übergibt.
Als Scheduler für die Zeitpläne nutzt die mobydick den Cron-Dienst der Debian Linux Distribution. Sie müssen jedoch die Cron-Dateien nicht manuell bearbeiten, sondern können die Weboberfläche des Systems zur Verwaltung nutzen. Den zentralen Anlaufpunkt bildet hierzu die Liste der Cronjobs. Die hinterlegten Zeitpläne werden durch das Anwenden der Cron Jobs im System aktualisiert und sind dann sofort aktiv.

## Übersicht der Cronjobs
Die Liste der Cronjobs finden Sie unter `Applinace` > `Cronjobs`.
Bei der Intstallation der mobydick sind schon einige Cronjobs angelegt:

|Cronjob|Beschreibung|Einstellung der Lebensdauer|
|---|---|---|
|**Char Archiv bereinigen**|Löscht ältere Chats|`Erweitert` > `Chat Archiv bereinigen`|
|**Datenbanksicherung erstellen**|Erstellt automatisch eine neue Datenbanksicherung, ältere Sicherungen werden gelöscht. |Systemeinstellungen unter sys.mdc.backup.db.maxbackups|
|**Faxserver bereinigen**|Löscht alte Faxe.|`Erweitert` > `FAxserver bereinigen`.|
|**Mitschnitte verarbeiten**|Versendet Mitschnitte und löscht die abgelaufenen.|Systemeinstellungen unter *sys.monitor.configure.monitorcron.expiration*|
|**Voicemailboxen bereinigen**|Löscht alte Voicemails.|Systemeinstellungen unter *sys.voicemail.configure.voicemailcron.expiration*|


## Anlegen von Jobs
Sie können keine beliebigen Jobs anlegen, sondern sind auf eine sinnvolle Auswahl eingeschränkt. Um einen neuen Zeitplan zu erstellen, wählen Sie zuerst im Menü die gewünschte Funktion, z. B. `Appliance` > `Sicherung` > `Datenbanksicherung` > `Erstellen`.  
Konfigurieren Sie die nötigen Parameter und klicken Sie dann auf `Automatisieren`. Das System wechselt nun in die Bearbeitungsmaske für Cronjobs und Sie können eine Beschreibung, den Zeitplan sowie weitere Parameter hinterlegen.

{{% notice tip %}}
Der Zeitpunkt der Sicherung wird in **crontab**-Syntax angegeben. Sollten Sie damit nicht vertraut sein, können Sie auf Vorschläge klicken und sich danach orientieren.
{{% /notice %}}

## Job-Parameter
Einige Jobs benötigen zur Ausführung anzupassende Parameter. Da Sie zum Anlegen eines Cronjobs zunächst die ursprüngliche Startmaske des jeweiligen Tasks benutzen, werden die Parameter bereits sinnvoll vorbelegt.
Bei allen Jobs die mit Dateien arbeiten, die Sie normalerweise im Browser hochladen würden, ist es jedoch erforderlich, einen Pfad in den Parametern zu hinterlegen. Bei einem frisch angelegten Job ist als Hilfsmittel ein Musterpfad mit angegeben, um die richtige Stelle im Parameterstring zu markieren.

{{% notice info %}}
Wenn Sie einen Datenimport automatisieren möchten, so müssen Sie dafür sorgen, dass die zu importierende Datei, jeweils innerhalb des Zeitplans bereits auf dem Server der Telefonanlage liegt.
{{% /notice %}}

Hierzu empfehlen sich Netzwerk-Werkzeuge wie etwa scp oder ein ftp client, als alternative können Sie auch ein Pre-Script verwenden.

## Pre-/Post-Script
Die Script vorher/nachher-Tabs eignen sich z. B. um Dateien von oder zu der Anlage per smbclient/scp etc. zu kopieren. Ein Exit-Wert von ungleich 0 in Ihrem Skript lässt den Job als gescheitert erscheinen bzw. bricht diesen im Pre-script vorzeitig ab. Das Post-script bekommt als erstes Aufrufargument den Status des Jobs mit. Hier gilt 1 = Job erfolgreich, 0 = Job mit Fehlern beendet.
