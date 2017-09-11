---
title: Server installieren
keywords:
    - pascom installieren
    - Virtuelle Maschine installieren
    - pascom auf Hardware installieren
    - pascom Systemvoraussetzungen
description: pascom lässt sich in wenigen Minuten sowohl in virtuellen Umgebungen als auch auf Servern installieren.
url:  /server/server-installieren/
prev:  /server/plattformen/
next:  /server/zugriff/
weight: 12
toc: true

---

## Sicherheitshinweis
{{% notice warning %}}
Wir raten Ihnen dringend davon ab pascom ohne jede weitere Schutzmaßnahmen eine öffentliche IP Adresse zuzuteilen.  
Insbesondere für den von pascom verwendeten Asterisk SIP-Stack kursieren zahlreiche automatisierte Angriffe im Internet.  
Selbstverständlich stellen wir Ihnen im pascom Update-Center stets die neueste, sicherheitsgepatchte Software zur Verfügung. Trotzdem bleibt ein nicht unerhebliches Restrisiko.
{{% /notice %}}


## Installations-Medien beschaffen

Das pascom Community Installationsmedium steht Ihnen unter [https://www.pascom.net/de/download/](https://www.pascom.net/de/download/ "pascom ISO downloaden") im Downloadbereich zur Verfügung.

{{% notice note %}}
Eine pascom Community-Versionkann jederzeit nachträglich durch den Erwerb einer Lizenz upgegradet werden. Sie können also zum Testen gerne die Community-Version verwenden und später durch ein Upgrade alle Daten übernehmen und Ihrer Lizenz entsprechend erweitern.
{{% /notice %}}

## Installation einer virtuellen Maschine
Das pascom ISO-Abbild ist ein herkömmliches Installationsmedium. Sie müssen eine virtuelle Maschine einrichten und anschließend das ISO-Abbild als Bootmedium verwenden um die pascom Installation durchzuführen.

Falls Sie keine Erfahrung mit Virtualisierungslösungen haben, empfehlen wir Ihnen die Nutzung des kostenlosen [VMWare Players] (http://www.vmware.com/products/player.html "Zur VMWare Seite") für Windows bzw. Linux. Alternativ können Sie auch Oracles [Virtual Box] (https://www.virtualbox.org/ "Zur Virtualbox Webseite") verwenden.

## Installation auf physikalischer Hardware

### Übersicht

Das auf unserer Homepage heruntergeladene ISO-Abbild oder ein bereits gesichertes Backup Ihrer Installation können Sie mit Hilfe eines Windows-PCs oder eines Linux-Systems (z. B. Ihre bereits vorhandene pascom) auf einen bootbaren USB-Stick übertragen.
Diesen können Sie dann zur Installation von pascom benutzen.

### Installationsmedium erstellen mit Hilfe eines Windows-PCs

#### Vorbereitung

Laden Sie ein pascom ISO-Abbild unter [pascom.net](https://www.pascom.net/de/download/ "pascom ISO downloaden") herunter oder verwenden Sie Ihr gesichertes Backup (appliance.iso, ab einschließlich pascom Version 7.11.03).

Laden Sie das Programm [Rufus](https://rufus.akeo.ie/ "Erstelle bootbare USB-Laufwerke auf einfache Art und Weise") herunter. Dabei handelt es sich um ein Tool mit dem man bootbare USB-Laufwerke erstellen kann.

#### Bootbaren USB-Stick erstellen

Starten Sie Rufus und stecken Sie den USB-Stick an.
![Screenshot - Bootbaren USB-Stick erstellen mit Rufus](/rufus_start_de.png?width=40%)

|Parameter|Bedeutung|
|---|---|
|Laufwerk|wählen Sie das Laufwerk unter dem der USB-Stick zu finden ist|
|Startfähiges Laufwerk erstellen mit	|ISO-Abbild auswählen, anschließend durch Klick auf das Disk-Symbol das bereits heruntergeladene ISO-Abbild auswählen |

Im nächsten Fenster "Im ISO-Abbild Modus schreiben" wählen und mit OK bestätigen. Anschließend wird der bootbare USB-Stick erstellt.

#### Unbeaufsichtigte Installation

Eine unbeaufsichtigte Installation benötigen Sie z. B. bei der miniAppliance, bei der Sie nicht die Möglichkeit haben durch Tastatureingabe bei der Installation zu interagieren (z. B. Netzwerkeinstellungen, Admin-Passwort eingeben...)

Nachdem Sie den bootbaren USB-Stick mit dem Programm Rufus erstellt haben müssen für die unbeaufsichtigte Installation der pascom noch einige Einstellungen vorgenommen werden.
Gehen Sie auf das USB-Laufwerk und klicken Sie auf die Datei **unattended-install**. Es erscheint eine Maske in der Sie Ihre Einstellungen eingeben können:
![Screenshot - Unbeaufsichtigte Installation Einstellungen](/rufus_unattended_settings_de.png?width=40%)

Setzen Sie das Häkchen bei **show output during installation via COM port** damit Sie bei der unbeaufichtigten Installation der pascom über den COM Port die Installation überwachen können.
Klicken Sie zum Abschluss auf **Generate**. Nach dem Auswurf des USB-Sticks steht dieser für die Installation zur Verfügung.

{{% notice note %}}
Bitte beachten Sie, dass eine unbeaufsichtigte Installation auf einer miniAppliance 15 bis 20 Minuten dauern kann. In dieser Zeit sollte die Anlage nicht neugestartet werden, sonst ist die Installation fehlgeschlagen. Die Installation ist erfolgreich, wenn nach 15 bis 20 Minutern der Login über das Web-UI ohne Fehlermeldungen erfolgt. Prüfen Sie bitte auch die Icinga-Checks.
{{% /notice %}}


### Installationsmedium erstellen mit Hilfe eines Linux-Systems

#### Vorbereitung

Laden Sie ein pascom ISO-Abbild unter [pascom.net](https://www.pascom.net/de/download/ "pascom ISO downloaden") herunter oder verwenden Sie Ihr gesichertes Backup (appliance.iso, mindestens pascom Version 7.01.00).
Am einfachsten ist den USB-Stick mit Hilfe eines vorhandenen pascom Servers zu erstellen. Sie können aber auch einen beliebigen Linux-Rechner auf dem syslinux installiert ist verwenden.

Kopieren Sie das ISO-Abbild auf eine pascom 6 oder 7 nach /etc/admin/ und loggen Sie sich per ssh ein.

#### Bootbaren USB-Stick erstellen

Sie sind nun als admin auf der pascom eingeloggt und das ISO-Abbild liegt unter /etc/admin.

**Werden Sie root:**

    su

USB-Stick an den pascom Server anstecken und prüfen ob dieser erkannt wurde:

    dmesg

In der Ausgabe sehen Sie als welches Gerät der USB-Stick registriert wurde (im Beispiel sdb):

    usb 1-1: new high speed USB device using ehci_hcd and address 2
    usb 1-1: configuration #1 chosen from 1 choice
    scsi3 : SCSI emulation for USB Mass Storage devices
    usb-storage: device found at 2
    usb-storage: waiting for device to settle before scanning
      Vendor: SanDisk   Model: Cruzer            Rev: 1.00
      Type:   Direct-Access                      ANSI SCSI revision: 02
    SCSI device sdb: 15625216 512-byte hdwr sectors (8000 MB)
    sdb: Write Protect is off
    sdb: Mode Sense: 03 00 00 00
    sdb: assuming drive cache: write through
    SCSI device sdb: 15625216 512-byte hdwr sectors (8000 MB)
    sdb: Write Protect is off
    sdb: Mode Sense: 03 00 00 00
    sdb: assuming drive cache: write through
     sdb: unknown partition table
    sd 3:0:0:0: Attached scsi removable disk sdb
    sd 3:0:0:0: Attached scsi generic sg1 type 0
    usb-storage: device scan complete

Im folgenden bitte *DEVICE* durch das ermittelte USB-Gerät ersetzen (hier z. B. sdb).

Erstellen Sie Verzeichnisse für das ISO-Abbild und den USB-Stick und mounten Sie das ISO-Abbild:

    mkdir /tmp/iso
    mkdir /tmp/usb
    mount -o loop /etc/admin/appliance.iso /tmp/iso/


Bitte *appliance.iso* durch den Namen Ihres ISO-Abbilds ersetzen!


Nun muss der USB-Stick formatiert und gemountet werden:

    mkfs.msdos -I /dev/DEVICE
    mount /dev/DEVICE /tmp/usb/

Kopieren Sie die Daten auf den USB-Stick und erstellen Sie die Booloader-Konfiguration:

    cp -arv /tmp/iso/. /tmp/usb/
    cp /tmp/usb/isolinux.cfg /tmp/usb/syslinux.cfg
    umount /tmp/iso
    umount /tmp/usb

Bootloader auf USB-Stick installieren:

    syslinux /dev/DEVICE

<!-- ## Installationsvorgang -->
