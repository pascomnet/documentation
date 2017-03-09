---
title: Call Distribution using Actions
keywords:
    - actions
    - callflow
    - Call Distribution
    - pascom PBX ACD
description:
url: /call-distribution/actions/
linkde: /anrufverteilung/aktionen/
prev: /call-distribution/
next: /call-distribution/ivr/
weight: 71
toc: true
draft: true
---

## Concept
<!--FIXME reihenfolge: beispiel zuerst als konzept  -->

Actions are an important and useful pascom phone system tool. Through using actions, the process of each individual call flow can be controlled. 

Actions are available with the following objects:

+ **Users**
+ **Teams**
+ **IVRs**
+ **Call Routers**

### Internal / External Actions

With the exception of Call Routers, Actions distinguish the caller origin. This allows actions to be set up for calls depending on where the call originates as follows:

+ **External**, so over a trunk,
+ or **Internal**, so originating from an internal source within the pascom phone system.


### Before/After Actions

Before the call setup, each call is processed according the **Actions Before**. To fulfil certain conditions or requirements, it is also possible to configure and **Actions After**. This can be used for example to send the caller to a feedback IVR for your [Contact Center Team] (/en/contact-call-center/ "pascom Contact Center solutions"). 

### Example Scenario

An user extension is called - the caller will then go through the following sequence:

![Actions](../../images/actions_example_en.png?width=1000px)

To determine which action set is appropriate, the call origin will be checked for internal vs external origination and will then go through the **Actions Before** before the call is setup. At this point the call is constructed (setup) and directed to the correct user extension. Should the call not be answered, the call flow is then processed according the **Actions After**. At this point the call origin will be checked once again to ensure the correct action set is processed.

## Configuration

{{% notice info%}}
Standardmäßig sind bei neu angelegten Objekten keine Aktionen hinterlegt.
{{% /notice %}}

Aktionen werden direkt beim zugehörigen Objekt konfiguriert.

### Aktionen am Beispiel-Objekt Benutzer

Über `Benutzerliste` > `Benutzer` Benutzer anklicken und `Bearbeiten` können in den entsprechenden Tabs Aktionen

+ **Intern/Vorher**
+ **Intern/Nachher**
+ **Extern/Vorher**
+ **Extern/Nachher**

angelegt werden.

|Aktions-Typen|Beschreibung|
|---|---|
|**Ansagen**|Spielt eine Ansage vor. Diese kann hinzugefügt werden unter `Erweitert` > `Ansagen`.|
|**Voicemailbox**|Verbindet den Anrufer mit einer Voicemailbox. Es kann die eigenen sein, die eines anderen Benutzers oder die eines Teams. Zusätzlich kann bei der Voicemailbox *Hinweis* (dass Benutzer nicht erreichbar oder belegt ist) und *Handhabung* (Ansage, dass der Anrufer eine Nachricht hinterlassen kann) gesetzt werden.|
|**Auflegen**|Legt den Anruf auf. Diese Aktion z. B. zu empfehlen, wenn dem Anrufer nur eine Ansage vorgespielt wird.|
|**Skript**|Führt ein Skript aus, das zuvor unter dem Menüpunkt `Erweitert` > `Skripte` erstellt wurde.|
|**Inline-Script**|Einzeiliges Skript das hier eingetragen werden kann|
|**Label Setzen**|Labels werden unter `Anrufverteilung` > `Anruf Labels` erstellt und können hier hizugefügt werden. Labels werden dem mobydick Benutzer als Information im Client angezeigt. Es können beliebig viele Labels pro Anrufer gesetzt werden.|

Weitere Aktionen sind:

+ Abwurf auf ein Team (Warteschlage oder Rufgruppe)
+ Abwurf auf ein IVR
+ Abwurf auf einen Anrufverteiler
+ Manueller Abwurf (z. B. aus eine andere Nebenstelle oder eine externe Nummer)


### Reihenfolge und Aktionsbedingungen

Werden in einem Aktions-Tab mehrere Aktionen angelegt, werden diese von oben nach unten abgearbeitet. Die Reihenfolge kann mit den blauen Pfeilen um je eine Position nach oben oder nach unten verschoben werden.

{{% notice tip%}}
Bitte achten Sie auch auf eine sinnvolle Reihenfolge der Bedingungen. Z. B. sollten zuerst die Urlaubszeiten geprüft werden, und anschließend Geschäftszeiten, da abhängig von der Konfiguration während der Urlaubszeiten die Geschäftszeiten gar nicht mehr geprüft werden müssen.
{{% /notice %}}

Um eine Aktion auszuführen wird eine Bedingung geprüft. Wird bei einer Aktion keine Bedingung ausgewählt, wird die Aktion in jedem Fall ausgeführt.

Bedingungen werden angelegt unter `Anrufverteilung` > `Aktionsbedingungen`.

Zeilen bei denen **keine Bedingung** ausgewählt wird werden immer ausgeführt. Zeilen mit einer bestimmten Bedingung wird nur dann ausgeführt, wenn diese Bedingung tatsächlich zutrifft. Es ist auch möglich, dass mehrere Zeilen die selbe Bedingung zugeteilt bekommen. Dann werden die Aktionen der Reihe nach ausgeführt.

### Rufstatus

Bei Aktionen Nachher kann zusätzlich zu einer Bedingung auch ein Rufstatus geprüft werden. mobydick merkt sich wieso ein Anrufer nicht zum gewünschten Ziel durchgestellt werden konnte, und führt für den Fall die entsprechende Aktion aus.


|Rufstatus|Beschreibung|Betrifft Benutzer|Betrifft Warteschlangen|
|---|---|---|---|
|**-nicht gesetzt-**|Es wird kein Rufstatus geprüft.|*ja*|*ja*|
|**nicht erreichbar**|Kein zugewiesenes Endgerät ist verfügbar.|*ja*||
|**keine Antwort**|Der gesetzte Timeout wurde erreicht.|*ja*|*ja*|
|**belegt**|Benutzer telefoniert.|*ja*||
|**Warteschlange Voll**|Die maximale Anzahl der Wartenden ist überschritten||*ja*|
|**Beitritt bei leer**|Aktion wird ausgeführt, wenn der Anrufer die Warteschlage betritt, obwohl kein Agent angemeldet ist.||*ja*|
|**Verlassen bei leer**|Aktion wird ausgeführt, bevor der Anrufer die Warteschlage verläßt, da kein Agent angemeldet ist.||*ja*|

<!-- |**Beitritt nicht möglich**|||*ja*|
|**Verlassen nicht möglich**|||*ja*| -->


## Aktionsvorlagen

Für den Fall, dass eine Reihe von Aktionen für mehrere Objekte gelten sollen, können Aktionsvorlagen erstellt werden.
Eine Aktionsvorlage kann einmal erstellt werden und anschließend auf mehrere Objekte ausgerollt werden.

Legen Sie eine Aktionsvorlage an unter `Anrufverteilung` > `Aktionsvorlagen` > `Hinzufügen`.

|Einstellung|Beschreibung|
|---|---|
|**Vorlage**|Wählen Sie einen Namen für die Aktionsvorlage|
|**Objektart**|Benutzer, Team oder IVR|
|**Rufposition**|Aktion Vorher oder Aktion Nachher|

Nach dem `Speichern` können im Tab `Aktionen` diese angelegt werden.

Um Aktionen auf die entsprechende Objekte auszurollen, gehen Sie zurück zur Übersicht (`Anrufverteilung` > `Aktionsvorlagen`), setzten Sie bei der gewünschten Vorlage ein Häkchen und klicken Sie auf `Vorlage ausrollen`.

Im ersten Tab stellen Sie noch `Optionen` für die Vorlage ein:

|Einstellung|Beschreibung|
|---|---|
|**Modus**|Legt fest, wie mit bereits vorhandenen Aktionen umgegangen wird.|
|**Wiederholtes zuweisen**|Legt fest, was passiert, wenn Aktionen aus der Vorlage bereits beim Objekt vorhanden sind.|
|**Anruf Herkunft**|Aktionen gelten für Anrufe von extern oder intern.|
|**Dialstatus**|siehe [Rufstatus](../aktionen/#rufstatus)|
|**Bedingung verwenden**|siehe [Aktionsbedingungen](../aktionen/#reihenfolge-und-aktionsbedingungen)|
