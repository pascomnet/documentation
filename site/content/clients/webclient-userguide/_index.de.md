---
title: Web Client Benutzerhandbuch
description: Dieses Benutzerhandbuch erklärt Ihnen den Umgang mit dem pascom Web Client.
weight: 30
---


{{< doctype "both" >}}

{{< description >}}


{{% notice tip %}}
Der pascom Web Client ersetzt nicht den pascom Desktop oder Mobil Client, sondern ermöglicht die Kommunikation mit externen Teilnehmern, in Web Konferenzen, über den Webbrowser.
{{% /notice %}}

## pascom Training Video

{{< youtube z9wRO9m408c >}} 

## Unterstützte Browser

Der pascom Web Client kann in Ihren favorisierten Webbrowsern genutzt werden. Unterstützt werden aktuell verbreitete Browser wie, Chrome, Firefox, Safari und Microsoft Edge. 

![Unterstützte Browser](browser_logos.png?width=50%)

## Lizenzierung

Für die Nutzung des Web Client, benötigen externe Teilnehmer eine Concurrent User Lizenz. Stellen Sie daher sicher, dass vor geplanten Web Konferenzen, ausreichend Lizenzen vorhanden sind. 

{{% notice tip %}}
Möchten Sie mehr über das dynamische Concurrent User Lizenzmodel erfahren oder Ihre vorhandenen Lizenzen upgraden, wenden Sie sich an unseren Vertrieb. Weitere Infos finden Sie auch in der [Lizenzbeschreibung](https://www.pascom.net/de/voip-preise/).
{{% /notice %}}


## Übersicht

Mit dem pascom Web Client machen Sie Audio,- und Videokonferenzen für externe Teilnehmer zugänglich. Bieten Sie Ihren Mitarbeitern und Kunden die Möglichkeit, von überall aus an Web Konferenzen und Präsentationen teilzunehmen. Schnell einfach und professionell. Das Prinzip ist simpel, machen Sie Ihre bisherigen pascom Gruppen von außen zugänglich und laden Sie externe Teilnehmer ein. Was Sie dafür benötigen und wie es funktioniert, zeigen wir Ihnen in dieser Anleitung.

**Was wird benötigt?**  
- pascom Desktop oder Mobile Client  
- pascom Gruppe  
- Moderator  
- externe Teilnehmer   

![Übersicht](webclient_overview.de.png?)


## pascom Gruppe vorbereiten

Gruppen in pascom dienen dazu, schnell dynamisch einen Ort zu schaffen, an dem Leute miteinander Kommunizieren können. pascom Gruppen können für die unterschiedlichsten Szenarien verwendet werden, wie Projekte, Präsentationen und Konferenzen. Stellen Sie sich pascom Gruppen wie virtuelle Konferenzräume vor.

### Erstellen einer pascom Gruppe

Zunächst benötigen Sie eine Gruppe. Erstellen Sie eine neue Gruppe mit Hilfe folgender [Anleitung]({{< ref "clients/desktop-userguide#gruppen">}}). Tip: Sie können auf der pascom Anlage so viele Gruppen erstellen wie Sie möchten. 

### pascom Gruppe öffentlich machen

Um externen Teilnehmern Zugriff auf eine Gruppe zu gewähren, muss diese öffentlich gemacht werden. Über das **Infosymbol** einer Gruppe gelangen Sie zu den Verwaltungseinstellungen. Schalten Sie den Button **Gäste zulassen** auf **ein**. Die Gruppe ist nun öffentlich. Dies wird auch in der Kontaktliste bei der jeweiligen Gruppe angezeigt. 

![Gruppen public](groups_public.de.PNG?width=70%)

Man erhält nun eine **Einwahlnummer, PIN und URL** für den Web Client.


|Felder|Beschreibung|
|---|---|
|Einwahlnummer|Teilnehmer können über den WebClient an der Konferenz per Telefon teilnehmen, indem die Einwahlnummer gewählt wird.|
|PIN|Für die Konferenzteilnahme über die Einwahlnummer wird die PIN benötigt.|
|URL|Link zur Gruppe im Web Client.|
|In Zwischenablage kopieren| Alle Details übersichtlich in die Zwischenablage kopieren. Teilen Sie so, alle wichtigen Daten mit externen Teilnehmern.|

{{% notice tip %}}
Sobald eine Gruppe öffentlich ist, können sich externe Teilnehmer über die Einwahldaten in die Gruppe einloggen/einwählen. Jedoch keine Panik, nur Moderatoren können Web Konferenzen tatsächlich starten.
{{% /notice %}}

### Einwahlnummer konfigurieren

Damit Ihre Teilnehmer per Einwahlnummer an einer Konferenz teilnehmen können, müssen Sie auf der Admin GUI die **externe Gruppennummer** setzen. Diese Einstellung finden Sie unter ({{< ui-button "Appliance" >}} > {{< ui-button "Dienste" >}} > {{< ui-button "Telefonie" >}}).

![Einwahlnummer konfigurieren](set_number.de.PNG?width=60%)

Wie bei klassischen Konferenzräumen reservieren Sie sich eine Telefonnummer Ihres physikalischen Anschluss und richten diese bei der externen Gruppennummer ein. Alle Gruppen verwenden nun für die externe Einwahl die selbe Einwahlnummer.

{{% notice tip %}}
Fragen Sie sich, wie eine Einwahlnummer für alle Gruppen funktionieren soll? Das pascom System generiert einen einzigartigen PIN für jede Gruppe. So weiß die Telefonanlage, zu welcher Gruppe/Konferenz ein externer Teilnehmer möchte. Stellen Sie sich das, wie eine Hotellobby vor.
{{% /notice %}}

Ist die **externe Gruppennummer** nicht gesetzt, fehlt das Feature über die Einwahlnummer an Konferenzen teilzunehmen. 

![Keine Einwahlnummer](no_number.de.PNG?width=80%)

## Der Moderator

Als Moderatoren werden interne Benutzer der pascom Telefonanlage bezeichnet. Jeder interne Benutzer, der an einer öffentlichen Konferenz teilnimmt, ist gleichzeitig ein Moderator. Wählt sich ein Moderator in eine öffentliche Konferenz ein, startet diese für alle extern eingewählten Teilnehmer. Verlässt der letzte Moderator eine öffentliche Konferenz, wird diese auf **halten** gesetzt.
Sobald sich externe Teilnehmer in eine Konferenz einloggen und auf den Start der Konferenz warten, sehen Sie dies in der Kontaktliste an der entsprechenden Gruppe. Diese wird dann grün.

![Gruppe in der Kontaktliste](contactlist.de.PNG?width=40%)

{{% notice tip %}}
Es können auch mehrere interne Benutzer an einer Konferenz teilnehmen, die dann alle als Moderator fungieren. Halten Sie einen Vortrag und lassen Sie gleichzeitig einen weiteren Benutzer Fragen im Chat beantworten.
{{% /notice %}}

### Konferenz starten

Sobald Sie bereit sind, die Konferenz zu starten, treten Sie der Gruppe bei, indem Sie sich über das **Hörer-Symbol** einwählen. 

### Konferenz verwalten

Als Moderator haben Sie die volle Kontrolle über die Konferenz. Im Anrufbereich sehen Sie alle Teilnehmer der Konferenz und können mit ihnen Interagieren. Sie haben weiterhin alle Telefon-und Videotools zur Verfügung, um tolle Vorträge oder Präsentationen zu halten. 


![Teilnehmer](participant_list.de.PNG?width=80%)

Weiterhin können Sie die Chatfunktion mit allen Teilnehmern nutzen und Einstellungen an der Gruppe vornehmen.

![Chat](contentview_during_conference.de.PNG?width=80%)

### Teilnehmer entfernen

Über das **Info-Symbol** der Gruppe können Sie einzelne Teilnehmer aus der Konferenz entfernen. Klicken Sie dazu einfach auf das **Mülleimer-Symbol** des Teilnehmers, den Sie entfernen möchten. Die Konferenz wird dann für diesen Teilnehmer beendet.


![Teilnehmer entfernen](participant_remove.de.PNG?width=80%)

### Konferenz beenden

Sie haben die Möglichkeit, eine Konferenz an unterschiedlichen Stellen im Desktop oder Mobil Client zu beenden. Im Content - oder Anrufbereich klicken Sie auf den **roten Hörer**, um aus der Konferenz auszutreten.  

{{% notice tip %}}
Die Web Konferenz ist nicht komplett beendet. Externe Teilnehmer werden auf einen Wartebildschirm geleitet. Sie können also eine Web Konferenz, nach einer kurzen Pause, auch wieder aufnehmen.
{{% /notice %}}

## An Konferenzen teilnehmen

pascom Gruppen sind ein mächtiges Konferenztool, welche klassiche Audio-Konferenzen und Video-Konferenzen über den Web Browser ermöglichen.

### An klassischer Audio-Konferenz teilnehmen

{{% notice tip %}}
Hierfür muss die öffentliche Gruppe mit einer **externen Gruppennummer** konfiguriert sein!
{{% /notice %}}

Als externer Teilnehmer einer Audio-Konferenz, erhalten Sie in der Regel Einwahldaten, die aus einer Rufnummer + PIN bestehen.

```
Einwahlnummer: +499912969166
PIN: 313 787 136

```
Sobald Sie sich über die Einwahlnummer eingwählt und die PIN eingegeben haben, leitet Sie das pascom System in die entsprechende Konferenz. Zum Beenden der Audio-Konferenz, legen Sie einfach auf.

### An Web Video-Konferenz teilnehmen

Als externer Teilnehmer einer Web Konferenz, erhalten Sie in der Regel Einwahldaten, die folgendermaßen aussehen können.

```
Gruppe: "Demo Gruppe"
Webclient URL: https://pascom.net/pascom/webclient/f791b39a-4fd4-431b-850a
Einwahlnummer: +499912969166
PIN: 313 787 136

```
Surfen Sie mit Ihrem Browser auf die Webclient URL und Sie gelangen auf die Startseite des Web Client.

![Webclient Startseite](webclient_startpage.de.PNG?width=100%)

Geben Sie einen Namen ein mit dem Sie an der Web Konferenz teilnehmen möchten. Dieser Name wird auch allen anderen Teilnehmern angezeigt. 

### Die Web Client Optionen

![Webclient Optionen](webclient_options.PNG?width=100%)

**Video Auswählen**  

Ihr Browser findet automatisch installierte Webcams um per Video an der Web Konferenz teilzunehmen. Sie können natürlich auch über das **DropDown-Menü** die Videofunktion deaktivieren. 

**Audio über den Browser**  

Stellen Sie hier das Audio für Mikrofon und Lautsprecher ein. Der Browser findet alle installierten Geräte wie, integrierte Komponenten, Headsets und Kopfhörer. Wählen Sie Ihre bevorzugten Endgeräte einfach aus dem "DropDown-Menü" aus. 

**Audio über das Telefon**  

Ändern Sie die Tabs von Browser auf **Phone**, um an der Web Konferenz per Telefon teilzunehmen. Hier benötigen Sie die **Einwahlnummer** und **PIN** um das Audio über Ihr Telefon zu erhalten. 

### Der Wartebereich

Der Wartebereich erscheint immer dann, wenn noch kein Moderator die Web Konferenz gestartet hat, bzw. sich für Pausen aus der Konferenz ausgewählt hat. 

![Webclient Wartebereich](webclient_waiting.de.PNG?width=60%)

Externe Teilnehmer hören hier, die in der pascom Telefonanlage gesetzte Wartemusik, für die Dauer ihres Aufenthalts. Über das **Exit-Symbol** gelangen Sie zurück zu den Web Client Optionen.

### Die Web Client Oberfläche

Sobald die Web Konferenz gestartet wurde, gelangen Sie in die Web Client Oberfläche, wo Sie als Teilnehmer einige Möglichkeiten nutzen können.

![Webclient Oberfläche](webclient.PNG?width=100%)

**Videoflächen vergrößern/verkleinern**  

Jede Videofläche lässt sich mit einem Klick darauf vergrößern und so in den Fokus holen. Mit einem erneuten Klick wird diese wieder verkleinert. Dies ist besonders hilfreich, wenn Sie z.B. bei dem Screensharing Video mehr Details sehen möchten. 

**Chat-Bereich**  

Auf der linken Seite finden Sie das Menü für den Chat, das Sie ein- und ausblenden können. Hier können alle Teilnehmer Fragen stellen oder sich miteinander unterhalten.

**Teilnehmerliste**  

Auf der rechten Seite finden Sie das Menü für die Teilnehmerliste, die Sie ein- und ausblenden können. Hier finden Sie alle Teilnehmer der Web Konferenz.

**Funktionsleiste**  

Im unteren Bereich finden Sie die Funktionsleiste. Hier können Sie Ihr **Mikrofon** aktivieren/deaktivieren, **Videosharing** aktivieren/deaktivieren, in den **Vollbildmodus** wechseln und die Konferenz verlassen.

### Web Konferenz verlassen

Verlassen Sie die Web Konferenz über das **Exit-Symbol**, gelangen Sie zurück in die Client Optionen. Sie können von hieraus, erneut an der Web Konferenz teilnehmen, oder das Browserfenster schließen.










