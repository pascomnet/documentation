---
title: FlexPanel erstellen
keywords:
    -
description:
url: /clients/flexpanel-erstellen/
prev: /clients/mobile-hub-einrichten/
weight: 36
toc: true
---

## Übersicht
FlexPanel können frei an den Bedarf der Benutzer angepasst werden. Als Grundlage definiert der Admin ein beliebig großes Panel und ordnet darauf die von mobydick bereit gestellten Widgets an. Die Widgets wiederum sind in Größe, Funktion und Erscheinungsbild parametrierbar.

Beispiel Code für dieses Panel herunterladen

Ist das FlexPanel einmal definiert kann man es verschiedenen Benutzern zuteilen. Diese Benutzer starten das FlexPanel dann, je nach Einstellung, entweder manuell über ein Menü oder automatisch beim Start des mobydick Desktop Clients. Der Benutzer kann dann sämtliche Aktionen im FlexPanel per Drag&Drop ausführen so dass das Panel auch für Touchscreens geeignet ist.

Beispiele für den Einsatz eines FlexPanels sind Vermittlungs-, Supervisor oder Monitoringarbeitsplätze.

## Konfiguration

### Neues FlexPanel anlegen
Unter dem Menüpunkt `Erweitert > Flexpanel` können Sie durch Drücken der Schaltfläche `+Hnzufuegen` ein neues FlexPanel hinzufügen.

|Parameter| Bedeutung|
|----------|----------|
|Bezeichnung|	Der Name des Panels|
|Automatisch geöffnet|	Soll dieses Panel automatisch geöffnet werden wenn der mobydick Desktop Client gestartet wird. Dies gilt nicht für alle mobydick Client Nutzer sondern nur für die unter dem Tab Zuordnung definierten Benutzer.|
|Übergeordnetes Panel|	Panels können Definition und Style voneinander erben. Das ist praktisch, wenn man nur Details eines bereis vorhandenen Panels für bestimmte Benutzer anpassen will. Wenn Sie hier ein Übergeordnetes Panel auswählen erbt das neu erstelle Panel dessen Definition und Style.|
|Dokumentation|	Feld zur Freien Verwendung für die Dokumentation des Panels|

### Benutzer Zuordnung
Unter dem Tab *Zuordnung* bestimmen Sie wer das Panel benutzen Darf. Sobald Sie einem Benutzer hinzufügen und ihm somit die Nutzung des Panels erlauben kann er das Panel über den mobydick Desktop Client starten.

Haben Sie unter *Basisdaten* **Automatisch geöffnet** auf *ja* gestellt startet das Panel bei den entsprechenden Benutzer automatisch.

### Definition
Der Tab Definition enthält die Programmierung des FlexPanels. Als Programmiersprache wird Grovy verwendet. Ein neues Panel erfordert folgenden Mindestcode:

    //

    // Notwendige Imports

    //

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

    //

    // Definition des Panels

    //

    frame.setShortcut(new KeyCodeCombination(KeyCode.F, KeyCombination.SHORTCUT_DOWN));
    OpPane pane = frame.getMainPane()

    // Breite des gesamten Panels in Pixel
    frame.setWidth(1440)

    // Hoehe des gesamten Panels in Pixel
    frame.setHeight(728)

    //

    // Ab hier fuegen Sie die Widgets ein

    // ...

Kopieren Sie diesen Mindestcode in die Definition und passen die Maße des Panels (im Beispiel 1440 x 728 Pixel) Ihren Vorstellungen an.

#### Style

Standardmäßig übernimmt jedes FlexPanel das **dark** oder **light** Theme, das im mobydick Desktop Client unter `Einstellungen > Client > Theme` eingestellt werden kann.

Das gesamte Theme ist in less Programmiert. Less ist eine Metasprache aus der dann CSS Code kompiliert werden kann. Wir stellen den gesamten **less Quellcode** für das **dark** und **light** Theme zum Download bereit. Sie können diese Quellen in einem Editor Ihrer Wahl anpassen und mit einem less compiler neuen CSS Code erzeugen. Diesen Code können Sie in der mobydick Weboberfläche unter dem FlexPanel-Reiter **Style** hochladen und übersteuern hiermit die durch das Theme vorgegebenen Einstellungen für dieses FlexPanel.

Ein kostenloser und unter Windows und OSX lauffähiger less compiler ist SimpLESS.

Um ein Theme anzupassen gehen Sie wie folgt vor:

##### Theme Quellen herunterladen

In diesem Archiv befindet sich sowohl das **dark** als auch das **light** Theme im less Format

##### Quellen editieren
Editieren Sie im Theme ihrer Wahl mit einem TextEditor die Datei **_colors.less** und passen die Farben nach Ihren Vorstellungen an.

##### Kompilieren
Installieren und starten Sie den SimpLESS compiler und ziehen Sie den gesamten angepassten Theme-Ordner darauf:

Danach kompilieren Sie die Datei **operatorpanel.less** neu in dem Sie auf das **"neu laden"**-Sysmbol klicken. Um schön lesbares CSS zu erhalten schalten Sie das **minify** aus (kleiner blauer Kasten rechts in der File-Zeile).

##### Neuen Style laden
Fügen Sie jetzt den **Inhalt** der neu erzeugten Datei **operatorpanel.css** auf der mobydick Weboberfläche in den FlexPanel-Reiter Style ein. Jetzt noch *Speichern und Anwenden*. Wenn Sie das entsprechen Panel nun über den mobydick Client neu starten sehen Sie den veränderten Style.

##### Panel starten
Nachdem diesen Einstellungen haben Sie ein leeres Panel erzeugt. Sie können das Panel nach dem Abspeichern und Anwenden über den mobydick Desktop Client starten:

Im rot markierten Bereich werden alle für diesen Benutzer verfügbaren Panels mit ihrer Bezeichnung angezeigt. Nach dem Start erhalten Sie ein leeres Panel in der von Ihnen definierten Größe.  Der Benutzer kann immer nur ein Panel gleichzeitig geöffnet haben.

### Widgets hinzufügen
Bis jetzt ist das Panel leer und kann nun mit den entsprechenden Widgets gefüllt werden. Dazu tragen Sie den entsprechenden Widgetcode im Reiter *Definition* des Panels ein. Jedes Widget kann mit den folgenden drei Codezeilen erstellt, positioniert und angezeigt werden:

    // Neues Widget erstellen
    WIDGET MEIN_WIDGET_NAME = new WIDGET(PARAMETER)

    // X und Y Postion des Widgets auf dem Panel definieren (in Pixeln)
    MEIN_WIDGET_NAME.relocate(X,Y)

    // Widget auf dem Panel anzeigen
    pane.addWidget(MEIN_WIDGET_NAME)

Folgende Platzhalter müssen Sie für jedes Widget ersetzen:

|Parameter| Bedeutung|
|----------|----------|
|WIDGET|	Geben Sie hier an welches Widget Sie erstellen wollen. Z.B. HangupWidget, UserItem, ... Alle verfügbaren Widget finden Sie weiter unten|
|PARAMETER|	Hier übergeben Sie Parameter an das Widget. Z.B. einen Benutzer oder Teamnamen der in diesem Widget verwendet werden soll. Mache Widget haben keine Parameter wie z.B. das HangupWidget|
|MEIN_WIDGET_NAME|	Für jedes Widget müssen Sie einen eindeutigen Namen vergeben um es später ansprechen zu können. Z.B. können Sie die Widgets nach Benutzer, Teams oder Funktionen benennen.|
|X, Y|	Geben Sie hier die X und Y Koordinaten an denen das Widget im Panel platziert werden soll. X und Y beziehen sich auf das linke obere Eck des Widgets|

Konkretes Beispiel für das HangupWidget:

    HangupWidget auflegen = new HangupWidget()
    auflegen.relocate(10,10)
    pane.addWidget(auflegen)

### Widget Methoden
Manche Widgets können durch weitere Methoden in ihrer Erscheinung oder Funktion verändert werden. Das UserItem kennt beispielsweise die Methode **setAppearance()**. Damit kann man das Erscheinungsbild des Widgets von der normalen Darstellung in eine Kompaktansicht umschalten. Möchte ich nun den Benutzer **jflores** in der Kompatansicht auf mein Panel einfügen ergänzt sich der Code wie folgt um eine weitere Zeile:

    UserItem jflores = new UserItem("jflores@mddemo")
    jflores.setAppearance(WidgetAppearance.Compact)
    jflores.relocate(10,50)
    pane.addWidget(jflores)

### Benutzer richtig adressieren
Werden einem Widget Benutzer als Parameter übergeben muss das in folgender Schreibweise geschehen:

    BENUTZERNAME@XMPP-DOMAIN

Für den Benutzer mit dem Benutzernamen **jflores** am Beispiel Widget **UserItem** mit der XMPP-Domain **mobydick** sieht der Eintrag wie folgt aus:

    UserItem jflores = new UserItem("jflores@mobydick")
    jflores.relocate(10,50)
    pane.addWidget(jflores)

Die XMPP-Domain wird bei der Installation einer mobydick Anlage automatisch mit auf **mobydick** gesetzt. Mehr dazu erfahren Sie unter XMPP API.

### Verfügbare Widgets
Eine Liste aller verfügbaren Widgets finden Sie unter FlexPanel Widgets in der Entwickler-Dokumentation.
