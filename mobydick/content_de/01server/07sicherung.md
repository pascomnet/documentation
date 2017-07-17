---
title: Sicherung und Wiederherstellung
keywords:
    - mobydick Sicherung
    - backup
    - Vollständige Systemsicherung
    - Datenbank Backup
    - Backup Automatisierung
description: "Lernen Sie wie einfach eine Komplettsicherung Ihres mobydick Systems während der Laufzeit oder ein Datenbank Backup erstellen können."
url: /server/sicherung/
prev:  /server/dienste/
next: /server/update/
weight: 17
toc: true

---

## Konzept

[Unsere VoIP Software](https://www.pascom.net/de/dokumentation/mobydick/server/sicherung/) ist in der Lage eine **Komplettsicherung** des Systems während der Laufzeit zu erstellen. Dabei erzeugt mobydick zunächst einen Snapshot des Filesystem und speichert diesen Stand dann in einer bootfähigen ISO-Datei ab.
![Illustration - mobydick Backup](../../images/backup_iso.png "ISO Backup der mobydick")

Diese Datei kann dann manuell oder automatisiert auf ein anderes System kopiert werden. Im Desasterfall brennt man das ISO-Abbild auf DVD, erstellt einen USB-Stick und bootet davon oder stellt das ISO-Abbild direkt als Bootmedium einer virtuellen Maschine ein. Das Backup bietet dem Benutzer dann die Möglichkeit das System als LiveDisk zu betrieben oder wieder auf Festplatte herzustellen.
Das zuletzt erstelle ISO-Abbild bleibt immer auf der mobydick liegen.

Zusätzlich kann mobydick automatisch eine periodische **Datenbanksicherung** durchführen und mehrere Sicherungsgenerationen auf der lokalen Festplatte vorhalten. Diese Backups kann man direkt über die Web-UI wiederherstellen oder auch herunterladen und später in die selbe oder eine andere Appliance importieren.


## Konfiguration

### Komplettes System sichern

#### Backup erstellen

Um ein Backup zu erstellen wählen Sie in der mobydick Web-UI `Appliance` > `Sicherung` > `Komplettes System`.

Um das ISO-Abbild nicht zu groß werden zu lassen können Sie einzelne Komponenten vom Backup ausschließen:

|Einstellung|Beschreibung|
|---|---|
|Voicemail ausschließen| Alle am System befindlichen Voicemails werden nicht mitgesichert.*|
|Mitschnitte ausschließen| Alle Mitschnitte, egal ob manuell oder automatisch erstellt, werden nicht mit gesichert.*|
|Empfangene Faxe ausschließen| Alle am System befindlichen Faxe werden nicht mit gesichert.*|
|Log-Dateien ausschließen| Sämtliche von mobydick erzeugten Log-Dateien werden nicht mitgesichert. Dies kann auch Logs betreffen die z. B. zur Auswertung historischer Daten benötigt werden.* <br> Journaleinträge und Chatarchive sind davon nicht betroffen.|
\* Falls diese Daten doch benötigt werden, sollten diese gesondert gesichert werden.

Wählen Sie nun `Sicherung starten`. mobydick stellt einen Job ab und führt diesen aus. Sobald der Job erfolgreich beendet wurde finden Sie das Backup-ISO in der Datei `/BACKUP/appliance.iso`.

mobydick ist in der Lage das Backup regelmäßig automatisiert durchzuführen. Klicken Sie auf
`Automatisieren`:

Das System Schlägt bereits eine Einstellung vor, entsprechend Ihrer Auswahl beim manuellen Sichern.

|Einstellungen|Beschreibung|Mögliche Werte|
|---|---|---|
|Aktiv|Sicherungsprozess aktivieren oder deaktivieren|
|Parameter|Hier können Sie Parameter zum Ausschließen von Voicemails, Mischnitte, Faxe und Log-Dateien angeben.|*--skip-voicemail\|--skip-recording\|--skip-fax\|--skip-log*|

{{% notice tip %}}
Der Zeitpunkt der Sicherung wird in **crontab**-Syntax angegeben. Sollten Sie damit nicht vertraut sein, können Sie auf Vorschläge klicken und sich danach orientieren.
{{% /notice %}}

#### Backup vom Server kopieren ####
Das zuletzt erstellte Backup liegt unter /BACKUP/appliance.iso am mobydick Server. Am bequemsten nutzen Sie die Weboberfläche um das jeweils letzte Backup herunter zu laden.

{{% notice info %}}
Es wird nur ein Backup-ISO auf der mobydick gesichert. Beim Erstellen einer neuen Datei wird die alte gelöscht.
{{% /notice %}}

Natürlich können Sie auch das SSH-Protokoll für den Zugriff nutzen. Benutzten Sie ein Unix-Betriebssystem benutzen Sie folgenden Befehl:

    scp admin@IP_DER_MOBYDICK:/BACKUP/appliance.iso .

Alternativ können Sie auf Windows Systemen [WinSCP](http://winscp.net/eng/download.php "winscp downloaden") nutzen um die Datei auf Ihrem System kopieren. Melden Sie sich hier mit dem `admin`-Benutzer an.

#### Backup wiederherstellen

Zum Wiederherstellen der mobydick lesen Sie bitte den Artikel **Server Installieren**.


### Datenbanksicherung

#### Datenbanksicherung erstellen

Um eine Datenbanksicherung zu erstellen wählen Sie in der mobydick Weboberfläche `Appliance` > `Sicherung` > `Datenbanksicherung`.

Klicken Sie dort auf die Schaltfläche `Erstellen` um eine Datenbanksicherung zu erstellen.  
Hier haben Sie die Möglichkeit Mitschnitte, empfangene Faxe und Voicemails einzuschließen.

{{% notice info  %}}
Eigene Ansagen und eigene Wartemusik ist seit mobydick Version 7.12 immer in der Datenbanksicherung enthalten.
{{% /notice %}}

Wählen Sie nun `Ausführen`. mobydick stellt einen Job ab und führt diesen aus. Sobald der Job erfolgreich beendet wurde, enthält die Sicherungsliste einen weiteren Eintrag.

Für die Datenbanksicherung wird bereits bei der Installation des System ein Cronjob eingerichtet der die Sicherung jeweils täglich um 23:47 ausführt. Falls Sie einen anderen Zeittakt bevorzugen, können Sie diesen Crobjob unter `Appliance` > `Crobjobs` anpassen.  
Es werden 100 Generationen der Sicherung gespeichert, bei Überschreitung dieser Anzahl wird die älteste Sicherung gelöscht.  
Die maximale Anzahl an Sicherungen können Sie natürlich ändern. Geben Sie dafür  den Suchbegriff *maxbackups* in das Suchbox der Web-UI ein. Sie gelangen dadurch in die Systemeinstellungen und bearbeiten automatisch das Setting `sys.mdc.backup.db.maxbackups`. Ändern und speichern Sie dort den Wert. Bei der nächsten Datenbanksicherung wird dann die neue Anzahl an Sicherungsgenerationen berücksichtigt.

mobydick erstellt automatisiert Datenbanksicherungen mit dem Dateinamen *dbdumpXXXX.tgz*. Diese Sicherungen werden beim Erreichen der maximalen Anzahl auch gelöscht. Möchten Sie eine Datenbanksicherung dauerhaft aufbewahren, müssen Sie die Datei umbenennen. Markieren Sie die Datein und klicken Sie auf `Umbenennen`.

#### Datenbanksicherung herunterladen

In der Liste der Datenbanksicherungen können Sie jede der Sicherungen über den **Download-Link** bequem herunterladen. Zusätzlich können Sie wie schon bei der kompletten Sicherung das SSH-Protokoll benutzen. Die Sicherungsarchive werden im Verzeichnis /BACKUP/dbdump abgelegt und aufbewahrt.

#### Gesicherte Daten wiederherstellen

Befindet sich der wiederherzustellende Datenbankstand in der Liste der Datenbanksicherungen, so genügt es den entsprechenden Stand zu markieren und dann per `Aktion` > `Wiederherstellen` die Wiederherstellungsmaske aufzurufen.
Sie sehen nun eine Übersicht über die Datenbanksicherung und müssen nun bestätigen, dass Sie wirklich die Datenbank wiederherstellen möchten.  
Nach der Wiederherstellung müssen Sie sich an der Web-UI erneut anmelden.  
Per default wird **vor** der Wiederherstellung der aktuelle Stand nochmals gesichert.

Eine zuvor heruntergeladene Datenbanksicherung können Sie in die selbe oder eine andere mobydick Appliance importieren. Über `Aktionen` > `Hochladen und Wiederherstellen` können Sie eine Datenbanksicherung in Ihre mobydick hochladen.

{{% notice warning  %}}
Der Import der Datenbanksicherung in eine ältere mobydick Version ist nicht möglich. Sollten Sie die Datenbanksicherung in eine neuere mobydick importieren, wird eine automatische Migration durchgeführt.
{{% /notice %}}
