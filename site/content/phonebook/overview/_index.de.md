---
title: Telefonbuch Konzept
description: Auf pascom steht Ihnen ein globales Telefonbuch zur Verfügung.
weight: 10
---

## Konzept

Auf pascom gibt es ein globales Telefonbuch, das jedem Benutzer zur Verfügung gestellt wird.
Dieses Telefonbuch wird im pascom Client und auch auf den unterstützten Telefonen angezeigt.



### Privates Telefonbuch (Desktop Client + Telefone)

Das globale Telefonbuch entspricht einem Firmentelefonbuch, auf das jeder Benutzer der pascom Telefonanlage Zugriff hat.
Auf das private Telefonbuch hat nur der Benutzer selbst Zugriff, sodass die Telefonbucheinträge aus dem privaten Telefonbuch nur im Client des jeweiligen Benutzers aufgelöst werden.

{{% notice info %}}
Lediglich in der allgemeinen Rufauswertung der pascom WebUI werden auch private Telefonbucheinträge aufgelöst.
{{% /notice %}}

### Telefonbuch-Eintrag

Alle Telefonbuch-Einträge sind in der pascom WebUI unter {{< ui-button "Benutzer">}} > {{< ui-button "Telefonbuch">}} zu finden.

Das einzige Pflichtfeld im Telefonbuch ist der Anzeigename, alle anderen Felder sind optional und müssen nicht gepflegt werden.

|Bezeichnung|Beschreibung|
|---|---|
|Anzeigename|Der Anzeigename wird am Telefondisplay und im Client bei ein- und ausgehenden Anrufen angezeigt|
|Telefon|Die geschäftliche Rufnummer der Kontakts|
|Vorname|Der Vorname des Kontakts|
|Nachname|Der Nachname des Kontakts|
|Organisation|Die Organisation oder Firma des Kontakts|
|Fax|Die Faxnummer des Kontakts|
|Email|Die Emailadresse des Kontakts|
|Handy|Die Mobilrufnummer des Kontakts|
|Telefon privat|Die private Rufnummer des Kontakts|
|Notizen|Feld für weitere Informationen und Notizen zu diesem Kontakt|

### Labels

An jeden Telefonbuch-Eintrag können Labels angehängt werden um direkt bei einem Anruf Informationen zu diesem Kontakt anzeigen zu können.
Ein Telefonbuch-Eintrag kann beliebig viele Labels angehängt bekommen, z.B. Kundennummer, VIP-Status u.v.m.

Um einem Kontakt ein Label zuweisen zu können, muss das zu verwendende Label zuerst angelegt werden.
Legen Sie hierzu unter {{< ui-button "Anrufverteilung">}} > {{< ui-button "Anruf Labels">}} mit einem Klick auf {{< ui-button "Hinzufügen">}} ein neues Label an.

Wählen Sie ein **Generisches Label** und geben Sie dem Label einen Namen z.B. "Kundennummer" und klicken Sie auf {{< ui-button "Speichern">}}.

Wurden passende Labels bereits angelegt, können Sie dem gewählten Telefonbuch-Eintrag unter {{< ui-button "Labels">}} die verfügbaren Labels mit einem Klick auf den Pfeil zuweisen und mit einem Doppelklick in der Spalte {{< ui-button "Wert">}} die passende Information zum Label hinterlegen und mit {{< ui-button "OK">}} bestätigen. Z.B. 123456

![Telefonbuch-Label](phonebook_label.png)

Wenden Sie die Einstellungen an, um die Konfiguration zu übernehmen.

Bei einem Anruf von diesem Kontakt wird jetzt das zugewiesene Label inkl. hinterlegtem Wert im Client angezeigt.

-> Screenshot von Label-Darstellung im Client

{{% notice info %}}
Ggf. ist es notwendig den XMPP-Dienst unter {{< ui-button "Anwenden">}} > {{< ui-button "XMPP Server neu starten">}} neu zu starten, um alle mit der pascom verbundenen Clients neu zu starten und damit mit der Telefonanlage zu synchronisieren, damit alle konfigurierten Labels korrekt angezeigt werden.
{{% /notice %}}

### Suchalgorithmus

* wie finde ich einen Eintrag (suche nach Name oder Nummer?)
* Automatisches Anzeigen der Nummer eingehenden Anrufen

### Zusätzliche Einträge aus Outlook & Co.

* Outlook
* Apple Contacts
* Datev