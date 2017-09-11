---
title: Telefonbuch
keywords:
description:
url: /benutzer/telefonbuch/
prev: /benutzer/teams/
next: /benutzer/connector/
weight: 24
toc: true
draft: false

---


## Konzept

### Globales Telefonbuch

[Die VoIP Software](https://www.pascom.net/de/mobydick-voip/) stellt allen Benutzer zentral ein Telefonbuch bereit. Dieses Telefonbuch ist unter Windows, Linux und OSX per pascom Client sowie am Mobility Client auf Android- und iOS-Smartphones abrufbar. Außerdem sind die von pascom provisionierten IP-Telefone in der Lage direkt auf dieses Telefonbuch zuzugreifen.

### Privates Telefonbuch
Jeder pascom Client-Benutzer kann ein eigenes privates Telefonbuch anlegen und pflegen:

* Es können über den Client neue Telefonbucheinträge angelegt werden.
* Ruft ein unbekannter Anrufer an, kann ein Eintrag im privaten Telefonbuch hinterlegt werden.
* Einträge aus dem globalen Telefonbuch können ins private Telefonbuch übernommen abgeändert werden.


## Verwendung des globalen und privaten Telefonbuchs

pascom nutzt selbst die Telefonbücher um den Namen zu einer anrufenden oder angerufenen Nummer aufzulösen und per SIP-Protokoll an alle SIP-fähigen Endgeräte zu übermitteln. Somit wird der Name des Anrufers oder des Angerufenen auf den SIP-fähigen Geräten im Display angezeigt.

Behandlung der verschiedenen Telefonbücher:

* Auf das globale Telefonbuch hat jeder pascom Benutzer Lesezugriff.
* Das globale Telefonbuch kann von pascom Benutzern bearbeitet werden, die mindestens Telefonbuch-Verwalter sind (siehe
[Benutzerrechte im Web-UI](../user/#benutzerrechte-im-web-ui).).
* Jeder pascom Benutzer hat Lesezugriff und Bearbeitungsrechte nur für sein eigenes Telefonbuch und nicht auf das der anderen Benutzer.

Priorisierung der Telefonbücher bei eingehenden Anrufen:

* Bei eingehenden Anrufen, wird immer zuerst das eigene private und anschließend das globale Telefonbuch nach der Nummer durchsucht, folglich wird, wenn im privaten Telefonbuch ein Eintrag vorhanden ist, dieser im Display angezeigt.
* Wird auf eine Queue angerufen, und nur ein Agent hat in seinem privaten Telefonbuch einen Eintrag zu dieser Nummer, sieht nur er den Namen im Display.

## Telefonbucheinträge von Benutzern und Teams

In der pascom können Benutzer und Teams einen Telefonbucheintrag besitzen. Dieser kann direkt beim Objekt unter im Tab `Telefonbuch` gepflegt werden. Will man für dieses Objekt keinen Eintrag im Telefonbuch (z.B. Benutzer Geschäftsführer) kann man den Haken unter *Telefonbucheintrag anlegen* entfernen. Ist der Haken gesetzt werden automatisch Anzeigename und Durchwahl des Benutzers im Telefonbuch eingetragen.  
Zusätzlich kann man den Anzeigenamen durch die Angabe von Vor- und Nachnamen übersteuern und weitere Daten wie E-Mail, Handy, usw. hinzufügen.

## Externe Telefonbucheinträge manuell pflegen

Wählen Sie hierzu im Web-UI `Benutzer` > `Telefonbuch` und und klicken Sie `Hinzufügen`.

|Feld|Beschreibung|
|---|---|
|**Anzeigename**|Dieser Name wird im Telefondisplay und pascom Client sowie Mobility Client angezeigt.<br>Damit Sie beim eingehenden Anruf möglichst viele Informationen über den Anrufer erhalten, können Sie hier z. B. den Firmennamen und Kundennummer angeben.<br>*Beispiel:* Max Muster - pascom [30000]|
|**Telefon**|Telefonnummer im internationalen Format.<br>*Beispiel:*+4999112345|
|**Vorname**|Vorname des Kontakts.|
|**Nachname**|Nachname des Kontakts.|
|**Organisation**|Firmennamen, die dem Kontakt zugeordnet werden kann.|
|**Fax**|Faxnummer im internationalen Format.|
|**Email**|E-Mail-Adresse des Kontakts.|
|**Handy**|Handynummer im internationalen Format|
|**Telefon privat**|Privatnummer im internationalen Format.|
|**Notizen**|Notizen zum Kontakt, die im pascom Client zu sehen sind.|

## Externe Telefonbucheinträge importieren

Es ist auch möglich Telefonbucheinträge automatisiert zu importieren (siehe [Connector](../connector))
