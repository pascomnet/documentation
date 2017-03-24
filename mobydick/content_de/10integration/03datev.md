---
title: DATEV Telefonie-Integration
keywords:
    - datev
    - telefonie basis
    - arbeitsplatz pro
    - cti
description: Integrieren Sie Datev in Ihre mobydick.
prev: /integrationen/wombatdialer/
url: /integrationen/datev-telefonie-integration/
weight: 103
toc: true
---

## Konzept

Die DATEV-Schnittstelle ermöglicht es bei einem eingehenden Anruf die Anrufdaten in Ihre *DATEV Arbeitsplatz pro*-Software zu übertragen. Ebenso können Sie aus dem DATEV-Telefonbuch Gespräche starten.

## Konfiguration

Zur Vorbereitung muss zunächst ein *Generisches Label* angelegt werden. Klicken Sie hierfür auf `Anrufverteilung` -> `Anruf Labels` ->`Hinzufügen`. Wählen Sie `Generisches Label` und tragen Sie als *Label Name* **DATEV** ein. *Im Client anzeigen* sollten Sie auf *NEIN* setzen.

Anschließend ist die DATEV-Schnittstelle automatisch aktiv sobald Sie neben *DATEV Arbeitsplatz pro* den mobydick Client installieren.

Sollte das Label nicht angelegt sein, erscheint bei Start des mobydick Clients folgende Meldung:

![Kein DATEV-Label konfiguriert](/datev-no-label.PNG?width=250px)

## Bedienung

### Eingehender Anruf

Bei einem eingehenen Anruf werden die DATEV-Stammdaten abgefragt und Treffer in der Anruf-Notification angezeigt.

![DATEV Notification](/datev_notification.PNG)

Schon während des Läutens ist es möglich über den DATEV-Klick die Telefonie-Daten in die Telefonliste Ihres *DATEV Arbeitsplatz pro* zu übertragen.

Nach einem Anruf können die Daten über den DATEV-Klick aus dem Journal zu übertragen werden.

![DATEV Journal](/datev_journal.PNG)

Sollten zu einer Telefonnummer mehrere Einträge in den DATEV-Stammdaten zu finden sein, erscheint eine Liste mit den möglichen Treffern und Sie können den richtigen Kontakt für die Datenübertragung auswählen.

![DATEV Eintrag auswählen](/datev_eintrag_auswaehlen.PNG)

**DATEV-Einstellungen im Client**

Im mobydick Client können unter `Einstellungen` -> `Adressbücher` Einstellungen Vorgenommen werden:

![DATEV Einstellungen](/datev_automatisch.PNG)

|Einstellungen|Beschreibung|
|---|---|
|Reihenfolge der Telefonbücher|Verwenden Sie den mobydick Client auf einer Arbeitsstation auf dem auch *DATEV Arbeitsplatz pro* installiert ist, wird immer als erstes das DATEV-Telefonbuch abgefragt.|
|DATEV-Integration ist aktiviert|Hier kann die Verwendung der DATEV-Schnittstelle deaktiviert/aktiviert werden.|
|Bei Telefonbuch-Suche verwenden|Hier kann angegeben werden, ob bei einem einkommenen Anruf das DATEV-Telefonbuch durchsucht werden soll.|
|Cache aktualsieren|Wenn Sie in den DATEV-Stammdaten Änderungen vornehmen, kann es bis zu 2 Stunden dauern, bis diese synchronisiert werden. Möchten Sie die Änderungen sofort synchronisieren, klicken Sie hier auf `Aktualsieren`|
|Automatische Datenweitergabe|Hier können Sie einstellen, ob Anrufdaten erst nach dem DATEV-Klick oder automatisch in die DATEV-Stammdaten übertragen werden sollen.|


### Ausgehender Anruf

Bei Ausgehenden Anrufen werden folgende Funktionen unterstützt:

* Wird eine Nummer über den moydick Client oder einem Hardware-Telefon gestartet, erscheint in der Gesprächs-Notification der DATEV-Klick. Über den Klick können die Gesprächs-Daten an die DATEV-Software übertragen werden. Ist das Gespräch beendet, können die Daten über den DATEV-Klick aus dem Journal heraus übertragen werden.
* Wird im  Client-Telefonbuch nach einem Kontakt gesucht, wird auch das DATEV-Telefonbuch durchsucht.
* Aus der Kontaktliste in der *DATEV Arbeitsplatz pro* kann ebenfalls ein Kontakt angerufen werden.
