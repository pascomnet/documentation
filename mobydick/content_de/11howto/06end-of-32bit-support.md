---
title: Ende des Supports für 32bit-Systeme
keywords:
description:
prev: /howto/funktionscodes/
url: /howto/ende-32bit-support/
weight: 126
toc: true
draft: false
---

## Überblick

Ab der mobydick Version 7.14 werden 32bit-Systeme nicht mehr unterstützt. Wenn Sie eine 32bit-Installation betreiben müssen Sie folgendes beachten:

## 32bit-Installation auf 64bit-Hardware/Host

Beim Update wird automatisch auf ein 64bit-System geupgradet.

## 32bit-Installation auf 32bit-Hardware/Host

Bei dem Versuch auf eine mobydick ab Version 7.14 zu installieren erhalten Sie eine Meldung, dass das Update nicht möglich ist. Der Updatevorgang findet nicht statt.

### Was ist zu tun?

Verwenden Sie eine 32bit-Appliance benötigen Sie eine neue Hardware. Wenden Sie sich bitte an unserem Vertrieb (Tel. +49 991 29691200).

Betreiben Sie die mobydick TK-Anlage in einer Virtualisierungsumgebung mit einem 32bit Host muss die mobydick auf einem 64bit Host neu aufgesetzt werden.

### Vorgehen bei der Neuinstallation eines 64bit-Systems

Erstellen Sie ein Datenbank-Backup Ihrer mobydick unter `Appliance` > `Sicherung` > `Datenbanksicherung`

Laden Sie die aktuelle [mobydick Community-Version](https://www.pascom.net/de/download/ "mobydick ISO downloaden") (min. Version 7.14) herunter und installieren Sie diese auf Ihrer neuen 64bit-fähigen Hardware oder Ihrem neuen Host. Spielen Sie nun die Datenbank-Sicherung ein: `Appliance` > `Sicherung` > `Datenbanksicherung` > `Aktion` > `Hochladen und Wiederherstellen`
