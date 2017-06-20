---
title: Geschaeftszeiten, Feiertage und Urlaubskalender
keywords:
    - Geschaeftszeiten
    - Feiertage
    - Urlaubskalender
    - Zeitschemas
    - Steuerung von Bürozeiten
description: Einrichtung von Zeitschemas, Kalendern und Durchwahlschaltern zur Steuerung von Geschäftszeiten, Feiertagen und Betriebsurlaub.
url: /anrufverteilung/time-calendar/
prev: /anrufverteilung/ivr/
next: /anrufverteilung/moh-prompts/
weight: 74
toc: true
---

## Konzept

Wie unter Aktionen beschrieben können Sie, wenn Benutzer oder Teams gerufen werden, den Anrufablauf beeinflussen. In vielen Fällen, z. B. [in Ihrem Call Center](https://www.pascom.net/de/call-center/) ist es sinnvoll bei einem Anruf auf der Zentrale oder div. Nebenstellen zu prüfen ob man sich innerhalb der Geschäftszeiten befindet oder es sich heute um einen Feiertag oder Betriebsurlaub handelt.

Dazu verwendet man Bedingungen. Bedingungen können bei jeder Aktion verwendet werden und entscheiden darüber ob diese ausgeführt wird oder nicht. Somit ist das System sehr flexiebel. Es gibt keine klassische globale "Tag/Nacht"-Schaltung sondern man kann beliebig viele Kalender, Zeitschemas und Schalter erstellen und diese als Bedingungen bei den verschiedensten Objekten verwenden.

Dadurch ist es z. B. möglich bei der Supporthotline andere Geschäftszeiten zu haben als bei der Zentrale. Oder in gewissen Zeiten auf ein Notfall-Mobiltelefon weiterzuleiten.

### Prüfreihenfolge beachten

Wenn Sie z. B. bei der Zentrale Geschäftszeiten, Feiertage und Urlaub prüfen wollen ist die Reihenfolge zu beachten. Prüfen Sie zuerst auf Urlaubskalender, dann auf Feiertage und schließlich auf Geschäftszeiten.

Sonst kann folgender Effekt entstehen:

Eingehender Anruf auf die Zentrale. Es ist innerhalb der Geschäftszeiten. Die Anlage teilt dem Anrufer mit *"Willkommen bei ChaosConsulting sie werden umgehend mit dem nächsten freien Mitarbeiter verbunden ...". Danach stellt die Anlage fest: Heute ist ein Feiertag und teilt dem Anrufer mit "Aufgrund des Feiertages ist unser Unternehmen heute geschlossen, vielen Dank für Ihren Anruf"* und legt auf.

Dies hinterlässt beim Kunden sicher keinen guten Eindruck.

## Konfiguration
### Zeitschema verwalten

Um Ihre Geschäftszeiten abzubilden eignet sich der Bedingungstyp **Zeitschema**.

Wählen Sie hierzu in der mobydick Weboberfläche `Erweitert > Aktionsbedingungen` den Button `+Hinzufügen`  um eine neue Bedingung zu erstellen oder markieren Sie eine bereits vorhandene Bedingung und wählen `Bearbeiten`.

Beim Hinzufügen selektieren Sie den **Typ Zeitschema** und geben Sie eine **Bezeichnung** ein.
![Screenshot - Zeitschema verwalten](../../images/zeiten_verwalten.png?width=90% "Zeitschema verwalten für Anrufverteilung")

Im Reiter **Zeiten** können Sie Ihre Geschäftszeiten definieren. Sie können beliebig viele Zeilen hinzufügen um komplexere Schemen abzubilden. In den Aktionen können Sie dieses Zeitschema dann als Bedingung verwenden

{{% notice tip %}}
Sie müssen kein extra Schema für "außerhalb" der Geschäftszeiten definieren da man Bedingungen in den Aktionen jederzeit negieren kann. Wenn Sie eine Bedingung wählen haben Sie immer "Name der Bedingung" und "NICHT Name der Bedingung" zur Auswahl. z. B. "Geschäftszeiten" und "NICHT Geschäftszeiten".
{{% /notice %}}

### Kalender verwalten

Um **Feiertage** und **Urlaubskalender** abzubilden eignet sich der Bedingungstyp Kalender.

Wählen Sie hierzu in der mobydick Weboberfläche `Erweitert > Aktionsbedingungen` den Button `+Hinzufügen`  um eine neue Bedingung zu erstellen oder markieren Sie eine bereits vorhandene Bedingung und wählen `Bearbeiten` .

Beim Hinzufügen selektieren Sie den **Typ Kalender** und geben Sie eine **Bezeichnung** ein.
![Screenshot - Kalender verwalten](../../images/kalender_verwalten.png?width=90% "Kalender verwalten für Anrufverteilung")

Im Reiter Tage markieren Sie nun Feiertage, Urlaubstage, etc.  In den Aktionen können Sie diesen Kalende dann als Bedingung verwenden.

### Durchwahlschalter nutzen

Durchwahlschalter sind ein praktisches Werkzeug wenn sich **kein fester Tag oder Zeitraum** definieren lässt.

Wählen Sie hierzu in der mobydick Weboberfläche `Erweitert > Aktionsbedingungen` den Button `+Hinzufügen` um eine neue Bedingung zu erstellen oder markieren Sie eine bereits vorhandene Bedingung und wählen `Bearbeiten`.

Beim Hinzufügen selektieren Sie den **Typ Durchwahlschalter** und geben Sie eine **Bezeichnung** ein.
![Screenshot - Durchwahlschalter verwalten](../../images/durchwahlschalter_verwalten.png?width=90% "Durchwahlschalter nutzen für Anrufverteilung")

Geben Sie eine Durchwahl an. Wird dieser Durchwahl angerufen ist dieser Schalter aktiv. Durch einen erneuten Anruf wird dieser wieder inaktiv geschaltet.  In den Aktionen können Sie die Durchwahlschalter dann als Bedingung verwenden.

Durchwahlschalter sind nützlich wenn Sie z. B. die Zentrale spontan auf die Ansage "Alle Mitarbeiter befinden sich derzeit in einem Meeting" schalten wollen oder falls es keine festen Geschäftszeiten gibt und der letzte der die Firma verlässt die Zentrale auf "außerhalb der Geschäftszeiten" schalten soll.

{{% notice tip %}}
Die Durchwahl eines Durchwahlschalters können Sie auf eine LED-**Nebenstellentaste** Ihres IP-Telefones legen. Somit leuchtet die LED solange der Schalter aktiv ist und erlischt bei inaktivem Schalter.
{{% /notice %}}
