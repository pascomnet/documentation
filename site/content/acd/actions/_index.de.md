---
title: Anrufverteilung mit Aktionen
description: Konfigurieren Sie mit Aktionen die Anrufverteilung in pascom
weight: 10
---

{{< doctype "both" >}}
 
{{< description >}}

## Trainingsvideo
{{< youtube YhKqWQMBkuI >}} 

## Konzept

Aktionen sind in der pascom ein mächtiges Werkzeug. Mit ihrer Hilfe kann der Ablauf eines Anrufs (Callflow) gesteuert werden. Aktionen in erweiterter Form sind vor allem in [Call Center](https://www.pascom.net/de/voip-telefonanlage/call-contact-center/) unentbehrlich.

Aktionen sind für folgende Objekte verfügbar:

+ **Benutzer**
+ **Teams**
+ **IVRs**
+ **Anrufverteiler**

### Aktion extern/intern

Bei den Aktionen wird der Ursprung des Anrufers unterschieden (außer bei Anrufverteiler). So können Aktionen eingerichtet werden für Anrufe die

+ von **extern**, also über das Amt,
+ oder von **intern**, also von einer anderen Nebenstelle auf der pascom

kommen.

### Aktion Vorher/Nachher

Jeder Anruf durchläuft vor dem Rufaufbau die **Aktion Vorher**. Für bestimmte Bedingungen kann eine **Aktion Nachher** aufgerufen werden.

### Beispiel

Es wird eine Durchwahl gerufen, die zu einem Benutzer gehört. Der Anrufer durchläuft folgenden Ablauf:

![Aktionen](actions_example_de.png?width=1000px)

Der Anruf durchläuft vor dem Rufaufbau die Aktion(en) Vorher. Dabei wird die Herkunft des Anrufs geprüft (intern oder extern). Anschließend kommt es zu dem eigentlichen Rufaufbau. Wird der Anruf nicht entgegengenommen durchläuft er die Aktion(en) Nachher, wobei erneut die Herkunft geprüft wird.

## Konfiguration

{{% notice info%}}
Standardmäßig sind bei neu angelegten Objekten keine Aktionen hinterlegt.
{{% /notice %}}

Aktionen werden direkt beim zugehörigen Objekt konfiguriert.

### Aktionen am Beispiel-Objekt Benutzer

Über {{< ui-button "Benutzerliste" >}} > {{< ui-button "Benutzer" >}} Benutzer anklicken und {{< ui-button "Bearbeiten" >}} können in den entsprechenden Tabs Aktionen

+ **Intern/Vorher**
+ **Intern/Nachher**
+ **Extern/Vorher**
+ **Extern/Nachher**

angelegt werden.

|Aktions-Typen|Beschreibung|
|---|---|
|**Ansagen**|Spielt eine Ansage ab. Diese kann hinzugefügt werden unter {{< ui-button "Erweitert" >}} > {{< ui-button "Ansagen" >}}.|
|**Voicemailbox**|Verbindet den Anrufer mit einer Voicemailbox. Dies kann die Eigene sein, die eines anderen Benutzers oder die eines Teams. Zusätzlich kann bei der Voicemailbox *Hinweis* (dass Benutzer nicht erreichbar oder belegt ist) und *Handhabung* (Ansage, dass der Anrufer eine Nachricht hinterlassen kann) gesetzt werden.|
|**Auflegen**|Legt den Anruf auf. Diese Aktion z.B. zu empfehlen, wenn dem Anrufer nur eine Ansage vorgespielt wird.|
|**Skript**|Führt ein Skript aus, das zuvor unter dem Menüpunkt {{< ui-button "Erweitert" >}} > {{< ui-button "Skripte" >}} erstellt wurde.|
|**Inline-Script**|Einzeiliges Skript das hier eingetragen werden kann|
|**Label Setzen**|Labels werden unter {{< ui-button "Anrufverteilung" >}} > {{< ui-button "Anruf Labels" >}} erstellt und können hier hizugefügt werden. Labels werden dem pascom Benutzer als Information im Client angezeigt. Es können beliebig viele Labels pro Anrufer gesetzt werden.|

Weitere Aktionen sind:

+ Abwurf auf ein Team (Warteschlage oder Rufgruppe)
+ Abwurf auf ein IVR
+ Abwurf auf einen Anrufverteiler
+ Manueller Abwurf (z.B. auf eine andere Nebenstelle oder eine externe Nummer)


### Reihenfolge und Aktionsbedingungen

Werden in einem Aktions-Tab mehrere Aktionen angelegt, werden diese von oben nach unten abgearbeitet. Die Reihenfolge kann mit den blauen Pfeilen um je eine Position nach oben oder nach unten verschoben werden.

{{% notice tip%}}
Bitte achten Sie auch auf eine sinnvolle Reihenfolge der Bedingungen. Z.B. sollten zuerst die Urlaubszeiten geprüft werden, und anschließend Geschäftszeiten, da abhängig von der Konfiguration während der Urlaubszeiten die Geschäftszeiten gar nicht mehr geprüft werden müssen.
{{% /notice %}}

Um eine Aktion auszuführen wird eine Bedingung geprüft. Wird bei einer Aktion keine Bedingung ausgewählt, wird die Aktion in jedem Fall ausgeführt.

Bedingungen werden angelegt unter {{< ui-button "Anrufverteilung" >}} > {{< ui-button "Aktionsbedingungen" >}}.

Zeilen bei denen **keine Bedingung** ausgewählt wird werden immer ausgeführt. Zeilen mit einer bestimmten Bedingung werden nur dann ausgeführt, wenn diese Bedingung tatsächlich zutrifft. Es ist auch möglich, dass mehrere Zeilen die selbe Bedingung zugeteilt bekommen. Dann werden die Aktionen der Reihe nach ausgeführt.

### Rufstatus

Bei Aktionen Nachher kann zusätzlich zu einer Bedingung auch ein Rufstatus geprüft werden. pascom merkt sich wieso ein Anrufer nicht zum gewünschten Ziel durchgestellt werden konnte, und führt für den Fall die entsprechende Aktion aus.


|Rufstatus|Beschreibung|Betrifft Benutzer|Betrifft Warteschlangen|
|---|---|---|---|
|**-nicht gesetzt-**|Es wird kein Rufstatus geprüft.|*ja*|*ja*|
|**nicht erreichbar**|Kein zugewiesenes Endgerät ist verfügbar.|*ja*||
|**keine Antwort**|Der gesetzte Timeout wurde erreicht.|*ja*|*ja*|
|**belegt**|Benutzer telefoniert.|*ja*||
|**Warteschlange Voll**|Die maximale Anzahl der Wartenden ist überschritten||*ja*|
|**Beitritt bei leer**|Aktion wird ausgeführt, wenn der Anrufer die Warteschlange betritt, obwohl kein Mitglied angemeldet ist.||*ja*|
|**Verlassen bei leer**|Aktion wird ausgeführt, wenn der Anrufer die Warteschlange verlässt, weil sich das letzte Mitglied abgemeldet hat.||*ja*|
|**Beitritt nicht möglich**|Aktion wird ausgeführt, wenn der Anrufer die Warteschlange betreten möchte, obwohl diese nicht erreichbar ist.||*ja*|
|**Verlassen nicht möglich**|Aktion wird ausgeführt, wenn der Anrufer die Warteschlange verlässt, weil diese nicht erreichbar ist.||*ja*|


## Aktionsvorlagen

Für den Fall, dass eine Reihe von Aktionen für mehrere Objekte gelten sollen, können Aktionsvorlagen erstellt werden.
Eine Aktionsvorlage kann einmal erstellt werden und anschließend auf mehrere Objekte ausgerollt werden.

Legen Sie eine Aktionsvorlage an unter {{< ui-button "Anrufverteilung" >}} > {{< ui-button "Aktionsvorlagen" >}} > {{< ui-button "Hinzufügen" >}}.

|Einstellung|Beschreibung|
|---|---|
|**Vorlage**|Wählen Sie einen Namen für die Aktionsvorlage|
|**Objektart**|Benutzer, Team oder IVR|
|**Rufposition**|Aktion Vorher oder Aktion Nachher|

Nach dem {{< ui-button "Speichern" >}} können im Tab {{< ui-button "Aktionen" >}} diese angelegt werden.

Um Aktionen auf die entsprechenden Objekte auszurollen, gehen Sie zurück zur Übersicht ({{< ui-button "Anrufverteilung" >}} > {{< ui-button "Aktionsvorlagen" >}}), setzten Sie bei der gewünschten Vorlage einen Haken und klicken Sie auf {{< ui-button "Vorlage ausrollen" >}}.

Im ersten Tab stellen Sie noch {{< ui-button "Optionen" >}} für die Vorlage ein:

|Einstellung|Beschreibung|
|---|---|
|**Modus**|Legt fest, wie mit bereits vorhandenen Aktionen umgegangen wird.|
|**Wiederholtes zuweisen**|Legt fest, was passiert, wenn Aktionen aus der Vorlage bereits beim Objekt vorhanden sind.|
|**Anruf Herkunft**|Aktionen gelten für Anrufe von extern oder intern.|
|**Dialstatus**|siehe [Rufstatus]({{< relref "#rufstatus">}})|
|**Bedingung verwenden**|siehe [Aktionsbedingungen]({{< relref "#reihenfolge-und-aktionsbedingungen">}})|
