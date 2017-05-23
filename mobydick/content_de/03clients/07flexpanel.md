---
title: FlexPanel
keywords:
    -
description:
url: /clients/flexpanel-erstellen/
prev: /clients/mobile-hub-einrichten/
weight: 37
toc: true
---

![FlexPanel Demo](/flexpanel_demo.png)

## Übersicht
FlexPanel können frei an den Bedarf der Benutzer angepasst werden. Als Grundlage definiert der Admin ein beliebig großes Panel und ordnet darauf die von mobydick bereit gestellten Widgets an. Die Widgets wiederum sind in Größe, Funktion und Erscheinungsbild parametrierbar.

Ist das FlexPanel einmal definiert kann man es verschiedenen Benutzern zuteilen. Diese Benutzer starten das FlexPanel dann, je nach Einstellung, entweder manuell über ein Menü oder automatisch beim Start des mobydick Desktop Clients. Der Benutzer kann dann sämtliche Aktionen im FlexPanel per Drag&Drop ausführen so dass das Panel auch für Touchscreens geeignet ist.

Beispiele für den Einsatz eines FlexPanels sind Vermittlungs-, Supervisor oder Monitoringarbeitsplätze.

## Konfiguration

### Neues FlexPanel anlegen

Unter dem Menüpunkt `Erweitert` > `FlexPanel` können Sie durch Drücken der Schaltfläche `Hinzufügen` ein neues FlexPanel hinzufügen.

|Parameter|Bedeutung|
|---|---|
|Bezeichnung|Geben Sie dem Panel einen Namen.|
|Automatisch geöffnet|JA/NEIN: hier legen Sie fest, ob das Panel beim Start des Desktop Clients automatisch mit gestartet wird.|
|Übergeordnetes Panel|Sie können als Vorlage die Einstellungen ein schon bestehendes Panel übernehmen.|
|Dokumentation|Feld zur freien Verwendung für die Dokumentation des Panels.|

**Weitere Tabs:**

|Tab|Beschreibung|
|---|---|
|**Zuordnung**|Hier fügen Sie die Benuzter hinzu, die dieses Panel in ihrem Desktop Client sehen/verwenden sollen.|
|**Definition**|Hier wird das FlexPanel programmiert.|
|**Style**|Standardmäßig übernimmt jedes FlexPanel das **dark** oder **light** Theme Desktop Clients. Falls weitere Themes erwünscht sind, können sie hier definiert werden.|


### FlexPanel erstellen

Der Tab `Definition` enthält die Programmierung des FlexPanels. Als Programmiersprache wird *Grovy* verwendet. Ein neues Panel erfordert folgenden Mindestcode:

    // Notwendige Imports
    import net.pascom.ahab.op.widgets.*
    import net.pascom.ahab.client.services.*
    import net.pascom.ahab.client.serviceimpl.*
    import net.pascom.cmd.*
    import net.pascom.cmd.base.*
    import javafx.collections.ObservableList
    import net.pascom.ahab.roster.data.RosterEntryData
    import org.jivesoftware.smack.util.StringUtils
    import javafx.scene.image.Image;
    import javafx.scene.image.ImageView;
    import javafx.scene.input.KeyCode;
    import javafx.scene.input.KeyCodeCombination;
    import javafx.scene.input.KeyCombination;

    // Definition des Panels
    frame.setShortcut(new KeyCodeCombination(KeyCode.F, KeyCombination.SHORTCUT_DOWN));
    OpPane pane = frame.getMainPane()
    // Breite des gesamten Panels in Pixel
    frame.setWidth(1440)
    // Hoehe des gesamten Panels in Pixel
    frame.setHeight(728)

    // Ab hier fuegen Sie die Widgets ein
    // ...

Kopieren Sie diesen Mindestcode in die Definition und passen die Maße des Panels (im Beispiel 1440 x 728 Pixel) Ihren Vorstellungen an.

Nachdem diesen Einstellungen haben Sie ein leeres Panel erzeugt. Sie können das Panel nach dem Abspeichern und Anwenden über den Desktop Client starten. Anschließen muss es mit Widgets "gefüllt werden".

### Widgets hinzufügen

Widgets werden über den Reiter `Definition` angelegt. Ein Widget benötigt drei Codezeilen um *erstellt*, *positioniert*, *angezeigt* zu werden:

    // Neues Widget erstellen
    WIDGET MEIN_WIDGET_NAME = new WIDGET(PARAMETER)

    // X und Y Postion des Widgets auf dem Panel definieren (in Pixeln)
    MEIN_WIDGET_NAME.relocate(X,Y)

    // Widget auf dem Panel anzeigen
    pane.addWidget(MEIN_WIDGET_NAME)


|Platzhalter| Bedeutung|
|---|---|
|WIDGET|Gibt an um welches Widget es sich handelt.<br>*Beispiele*: HangupWidget, UserItem... Liste der Verfügbaren Widgets...|
|PARAMETER|Hier wird ein Parameter an das Widget übergeben. Z. B. der Benutzer oder der Teamname, der in diesem Widget verwendet werden soll. Mache Widget haben keine Parameter, wie z.B. das HangupWidget|
|MEIN_WIDGET_NAME|Für jedes Widget muss ein eindeutiger Name vergeben um es später ansprechen zu können. Z.B. können Sie die Widgets nach Benutzer, Teams oder Funktionen benennen.|
|X, Y|Geben Sie hier die X und Y Koordinaten an denen das Widget im Panel platziert werden soll. X und Y beziehen sich auf das linke obere Eck des Widgets|

Konkretes Beispiel für das HangupWidget:

    HangupWidget auflegen = new HangupWidget()
    auflegen.relocate(10,10)
    pane.addWidget(auflegen)

**Widget Methoden:**

Manche Widgets können durch weitere Methoden in ihrer Erscheinung oder Funktion verändert werden. Das UserItem kennt beispielsweise die Methode *setAppearance()*. Damit kann man das Erscheinungsbild des Widgets von der normalen Darstellung in eine Kompaktansicht umschalten. Möchte ich nun den Benutzer *jflores* in der Kompatansicht auf mein Panel einfügen ergänzt sich der Code wie folgt um eine weitere Zeile:

    UserItem jflores = new UserItem("jflores@mddemo")
    jflores.setAppearance(WidgetAppearance.Compact)
    jflores.relocate(10,50)
    pane.addWidget(jflores)

**Benutzer richtig adressieren:**

Werden einem Widget Benutzer als Parameter übergeben muss das in folgender Schreibweise geschehen:

    BENUTZERNAME@XMPP-DOMAIN

Für den Benutzer mit dem Benutzernamen *jflores* am Beispiel-Widget *UserItem* mit der XMPP-Domain *mobydick* sieht der Eintrag wie folgt aus:

    UserItem jflores = new UserItem("jflores@mobydick")
    jflores.relocate(10,50)
    pane.addWidget(jflores)


### Beispiel-FlexPanel

Hier können Sie das [Demo-FlexPanel mit Beispielcode herunterladen](/flexpanel_demo.pdf) .




### Verfügbare Widgets

Eine Übersicht über die verfügbaren Widgets finden Sie [hier](/available_widgets.pdf).


### Style ändern

Standardmäßig übernimmt jedes FlexPanel das **dark** oder **light** Theme, das im Desktop Client unter `Einstellungen` > `Client` > `Theme` eingestellt werden kann.

Das gesamte Theme ist in *less* programmiert. Dabei handelt es sich um eine Metasprache aus der dann CSS-Code kompiliert werden kann. Wir stellen den gesamten *less Quellcode* für das **dark** und **light** Theme [hier zum Download bereit](/Archiv.zip). Sie können diese Quellen in einem Editor Ihrer Wahl anpassen und mit einem *less compiler* neuen CSS-Code erzeugen.

Diesen Code können Sie in der Web-UI unter `Erweitert` > `FlexPanel` > `Style` hochladen und übersteuern hiermit die durch das Theme vorgegebenen Einstellungen für dieses FlexPanel.

Ein kostenloser und unter Windows und OSX lauffähiger *less*-Compiler ist [SimpLESS](https://wearekiss.com/simpless).

**Theme anpassen:**

+ In dem heruntergeladenen Theme-Archiv befindet sich sowohl das **dark** als auch das **light** Theme im less Format.
+ Editieren Sie im Theme Ihrer Wahl mit einem TextEditor die Datei *_colors.less* und passen die Farben nach Ihren Vorstellungen an.
+ Installieren und starten Sie den *SimpLESS compiler* und ziehen Sie den gesamten angepassten Theme-Ordner darauf: anschließend kompilieren Sie die Datei *operatorpanel.less* neu in dem Sie auf das *"neu laden"*-Symbol klicken. Um ein schön lesbares CSS zu erhalten schalten Sie das *minify* aus (kleiner blauer Kasten rechts in der File-Zeile).
+ Fügen Sie jetzt den Inhalt der neu erzeugten Datei *operatorpanel.css* auf der mobydick Weboberfläche in den FlexPanel-Reiter Style ein. Jetzt noch *Speichern und Anwenden*. Wenn Sie das entsprechen Panel nun über den mobydick Client neu starten sehen Sie den veränderten Style.
