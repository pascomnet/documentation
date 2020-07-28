---
title: Eigene Ansagen und Wartemusik
description: Einspielen von individuellen Ansagen und Wartemusik zur Nutzung in Teams, Auswahlmenüs und Aktionen.
weight: 30
---

{{< doctype "both" >}}
 
{{< description >}}

## Konzept

An vielen Stellen haben Sie die Möglichkeit dem [Anrufer in Ihrem Call Center](https://www.pascom.net/de/voip-telefonanlage/ "pascom VoIP Telefonanlagen") oder Ihrer Zentrale, Ansagen oder Wartemusik vorzuspielen. pascom liefert bereits eine große Anzahl an vorgefertigten Ansagen mit. Allerdings ist es fast immer sinnvoll eigene Ansagen, z. B. zur Begrüßung Ihrer Kunden oder zur Ansage der Geschäftszeiten, zu erstellen.   

{{% notice tip %}}
Wollen Sie Ihre Ansagen lieber von einem Tonstudio mit professionellem Sprecher erstellen lassen? Unser Vertrieb hilft Ihnen gerne weiter.
{{% /notice %}}

## Konfiguration

### Ansagen anlegen und hochladen

Zum Anlegen einer neuen Ansage wählen Sie in der pascom Weboberfläche {{< ui-button "Erweitert" >}} > {{< ui-button "Ansagen" >}}. Möchten Sie eine bereits bestehende Ansage bearbeiten, markieren Sie diese und klicken Sie auf {{< ui-button "Bearbeiten" >}}. Um eine neue Ansage zu erstellen klicken Sie auf {{< ui-button "Hinzufügen" >}}.

{{% notice note %}}
Wir empfehlen Ihnen einen Präfix für Ihre eigenen Ansagen zu verwenden um eine bessere Übersicht zu haben und um die eigenen Ansagen später leichter zu finden.<br>Z. B. *CC-gescheaftszeiten*, wobei hier CC für die Firma ChaosConsulting steht.
{{% /notice %}}

Nun wird vorerst der "Platz" für die Ansagen angelegt.

Sie haben die Möglichkeit in der Spalte **Hochladen** eine bereits vorhandene Ansage hochzuladen.
Nach erfolgereichem Hochladen und Speichern erscheint in der Spalte Abspielen das Abspielsysmbol und Sie können die Ansage anhören. Falls Sie die Ansage sichern möchten können Sie diese in der Spalte Ansagedatei auf Ihren PC herunterladen.

### Eigene Ansagen Sichern

Sie können alle eigenen Ansagen in einem .tar.gz-Paket herunterladen indem Sie in der Ansagen-Übersicht auf {{< ui-button "Aktion" >}} klicken und anschließend auf {{< ui-button "Eigene Ansagedateien exportieren" >}}. Unter {{< ui-button "Archiv mit Ansagedateien" >}} importieren können Sie bereits bestehende Ansagen auf einmal hochladen. Diese müssen allerdings auch als .tar.gz-Archiv gepackt sein.

### Ansagen per Telefon aufsprechen

Angelegte Ansagen können Sie über Ihr Telefon aufsprechen.

Dazu muss die Ansage freigeschaltet werden. Klicken Sie in der Spalte **Freigegeben** auf **Freigeben**. Nun erscheint eine sechstellige Ansagen-ID.

Wählen Sie an Ihrem Telefon \***50** um in das pascom Ansagesystem zu gelangen. Durch das Drücken der 1 können Sie eine Ansage Aufnehmen. Sie werden nach der Ansage-ID gefragt. geben Sie diese ein und nach dem **Beep** können Sie die Ansage aufsprechen.

{{% notice note %}}
Wenn Sie die Ansage fertig aufgesprochen haben legen Sie nicht auf, sondern drücken Sie die #-Taste um die Ansage zu speichern. Wenn Sie einfach auflegen wir die Ansage auch gespeichert, allerdings wird die Geräuschkulisse des Auflegens auch mit aufgenommen, was meistens unerwünscht ist.
{{% /notice %}}

Sie können die gerade aufgesprochene Ansage anhören, indem Sie erneut mit der \***50** in das Ansagesystem gehen. Durch drücken einer beliebigen Taste am Telefon (statt der 1) und nach Eingabe der Ansagen-ID wird die Ansage abgespielt.

In der pascom können Sie die Ansage ebenfalls abspielen oder herunterladen. Muss die Ansage nicht mehr geändert werden, kann sie durch Klicken des roten X links neben der Ansagen-ID wieder gesperrt werden. Daduch verschwindet die Ansagen-ID. Beim erneuten Freigeben wird eine neue ID generiert.

### Weitere Sprachen hinzufügen

Wie bereits erwähnt, sind bei der Installation auf der pascom die Sprachen Deutsch, Englisch und Spanisch verfügbar. Bei Bedarf können weitere Sprachen hinzugefügt werden, unter dem Menüpunkt {{< ui-button "Erweitert" >}} > {{< ui-button "Sprachen" >}}, dann {{< ui-button "Hinzufügen" >}}. Benennen Sie die Sprache und geben Sie eine Abkürzung an.

Nach dem Spreichern sehen Sie die neu angelegte Sprache in der Übersicht.

### Wartemusik verwalten

Die Wartemusik finden Sie unter {{< ui-button "Erweitert" >}} > {{< ui-button "Wartemusik" >}} in der pascom Weboberfläche.
{{% notice warning %}}
Klären Sie immer die Vermarktungsrechte der von Ihnen verwendeten Musik. Wählen Sie entweder GEMA-freie Musikstücke (z. B. die mitgelieferten) oder entrichten Sie die entsprechenden Gebühren. Da diese Musik öffentlich von jedem Anrufer hörbar ist gehen Sie sonst die Gefahr einer Abmahnung ein.
{{% /notice %}}
{{% notice tip %}}
Eine große Auswahl an lizenzierbarer Wartemusik gibt es unter [http://www.musicfox.com](http://www.musicfox.com "Zur musicfox Webseite")
{{% /notice %}}

In pascom wählen Sie nicht einzelne Musikstücke aus die abgespielt werden sollen, sondern ganze Playlisten. Im Lieferumfang ist die Playlist (Klasse) **default** enthalten. Diese beinhaltet ein Musikstück welches von den Asterisk Entwicklern frei gegeben wurde und somit GEMA-frei ist.

Wenn Sie eine Playliste anhaken, können Sie unter {{< ui-button "Aktion" >}} > {{< ui-button "Musikstücke" >}} die einzelnen Musikstücke anzeigen lassen bzw. löschen. Möchten Sie neue Musikstücke für diese Playliste hochladen wählen Sie {{< ui-button "Aktion" >}} > {{< ui-button "Musikstück" >}} hochladen.

Kompatible Formate sind **WAV** und **MP3** Dateien.

Sie können per {{< ui-button "Hinzufügen" >}} auch eigene, weitere Playlisten anlegen. Welche Playliste dann gespeilt wird können Sie z. B. im Team unter Wartemusik auswählen. So können Sie im Support eine Wartemusik abspielen die auf Ihr Ticketsystem hinweist und im Vertrieb können Sie möglicherweise die neuesten Aktionen präsentieren.

Legen Sie einen Anrufer per Telefon auf Hold wird immer die default Playlist gespielt.

### Ansagen und Wartemusik am PC erstellen und hochladen

Für eine bestmögliche Aufnahmequalität empfehlen wir die Aufnahme der Ansage an einem PC zu erstellen und anschließend auf die pascom hochzuladen. Das Format der Audiodatei ist nahezu beliebig da pascom diese nach dem Hochladen automatisch in die passenden Zielformate konvertieren wird. Beste Ergebnisse haben wir durch die Verwendung einer standard WAV Datei als Quelle erhalten.


#### Ansage mit Audacity erstellen

Ein gutes, kostenloses und plattformunabhängiges Programm zur Erstellung von Ansagen ist [Audacity](https://sourceforge.net/projects/audacity/ "Audacity download").

![Ansage mit Audacity erstellen](audacity.de.png?width=90%)

Die Verwendung ist recht simpel. Das passende Mikrofon wählen (siehe Screenshot "Built-in Microphone"), Lautstärke einstellen und Aufnahme durch den roten Record-Knopf starten.

{{% notice tip %}}
Keine Hektik. Drücken Sie den Record-Knopf und sprechen Sie die Ansage u. U. mehrmals hintereinander auf. Sie können die Ansage hinterher einfach durch Markieren der Tonspur und anschließendem Drücken der ENTF Taste zurechtschneiden.
{{% /notice %}}

Wenn Sie mit dem Ergebnis zufrieden sind wählen Sie {{< ui-button "Datei" >}} > {{< ui-button "Exportieren" >}} und erzeugen ein **WAV (Microsoft) 16-bit PCM**. Falls Sie das Projekt später noch einmal weiter bearbeiten möchten empfiehlt es sich dieses ebenfalls zu speichern {{< ui-button "Datei" >}} > {{< ui-button "Projekt speichern" >}}.     
    
#### Ansagen mit Musik hinterlegen

Beispielsweise bei Weihnachtsansagen usw. ist es beliebt diese mit Musik zu hinterlegen. Audacity ist in der Lage mehrere Tonspuren zu verwalten.

Sprechen Sie Ihre Ansage wie bereits beschrieben auf und wählen Sie dann {{< ui-button "Datei" >}} > {{< ui-button "Importieren" >}} > {{< ui-button "Audio" >}}. Wählen Sie ein Musikstück und importieren dieses. Darauf hin legt Audacity eine zweite Tonspur an. Wenn Sie jetzt auf **Play** drücken hören Sie sowohl die aufgesprochene Ansage als auch die Musik.

Ihnen wird auffallen, dass die Musik zum einen den Text übertönt und es zum anderen nicht schön ist, dass Musik und Ansage gleichzeitige beginnen.

Um die Ansage etwas versetzt beginnen zu lassen klicken Sie in der Ansagetonspur vor den Beginn der Ansage und fügen per {{< ui-button "Erzeugen" >}} > {{< ui-button "Stille" >}} ... ca. 3 Sekunden Stille ein. Durch diese Maßnahme beginnt zuerst die Musik und nach 3 Sekunden startet die Ansage.

Um die Musik leiser zu machen nutzen Sie das Hüllkurvenwerkzeug. Wenn Sie mit mit dem Hüllkurvenwerkzeug in die Tonspur klicken und die Maus dabei auf und ab bewegen, werden Sie feststellen, dass Sie damit die Lautstärke der Tonspur verändern können. Wenn Sie das an mehreren Stellen wiederholen, werden alle betreffenden Stellen in Audacity mit einer Hüllkurvenlinie verbunden. Ausserdem erscheinen dort kleine weisse Punkte.
![Ansage mit Audacity erstellen](audacity_envelope_editing.png?width=35%)

Das Endergebnis sollte in etwa wie folgt aussehen:
![Ansage mit Audacity](audacity_music.de.png?width=90%)

Wenn Sie mit dem Ergebnis zufrieden sind wählen Sie {{< ui-button "Datei" >}} > {{< ui-button "Exportieren" >}} und erzeugen ein **WAV (Microsoft) 16-bit PCM**. Die Tonspuren werden hierbei automatisch zusammen gemischt.

Falls Sie das Projekt später noch einmal weiter bearbeiten möchten empfiehlt es sich außerdem dieses zu speichern {{< ui-button "Datei" >}} > {{< ui-button "Projekt speichern" >}}.
