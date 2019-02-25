---
title: Rufstatistik
description: Erhalten Sie Statistiken zur Auswertung von Warteschleifen (Teams) und deren Benutzern.
weight: 7
---

{{< doctype "both"  >}}

{{< description >}}

## Übersicht

Seit der pascom Version 18.05 steht mit Grafana ein umfangreiches Rufauswertungs-Tool zur Verfügung. Damit können der Live-Status von verfügbaren Agenten in Teams, aktive Anrufe, Rufstatistiken und Informationen über Anrufverläufe ausgelesen werden.

Die Rufstatistik ist in der pascom Weboberfläche unter {{< ui-button "Informationen" >}} > {{< ui-button "Rufstatistik" >}} zu finden. 

{{% notice info %}}
Das Rufauswertungs-Tool Grafana bietet keine Sprachauswahl-Möglichkeiten und kann daher nur English dargestellt werden.
{{% /notice %}}



## Dashboards

Die Rufstatistik umfasst standardmäßig 3 Auswertungs-Ansichten oder Dashboards genannt.

+ **Live**: Im Live-Dashboard ist der aktuelle Status der Telefonanlage zu sehen: aktive Gespräche, Anrufer in den Warteschlagen, Teams und deren Agenten.
+ **Overview**: Im Overview-Dashboard erhält man eine Übersicht über alle im ausgewählten Zeitraum geführten Gespräche, sowie eine ausführliche Rufauswertung.
+ **Teams**: Im Teams-Dashboard findet man Auswertungen zu allen Warteschlangen/Teams, die durchschnittliche Wartezeit von Anrufern, sowie die durchschnittliche Gesprächsdauer bei eingehenden Anrufen.

-> Hier Bild <-

### Live

Das Live-Dashboard aktualisiert sich automatisch und zeigt alle Gespräche auf der Telefonanlage an, unabhängig davon, ob diese derzeit aktiv geführt, gehalten, verbunden, oder in einer Warteschlange geparkt sind. Alle Warteschlangen/ Teams werden ebenfalls automatisch angezeigt und aktualisiert, falls weitere Teams auf der pascom Anlage angelegt werden oder Agenten der Teams bearbeitet werden.

-> Hier Bild <-



### Overview

Das Overview-Dashboard zeigt eine Übersicht aller geführten Gespräche, Statistiken über die Art der Gespräche, verwendeter Labels und eine ausführliche Rufauswertung.

-> Hier Bild <-


#### Auswertungs-Zeitraum setzen

Standardmäßig wird im Overview-Dashboard der aktuelle Tag "*Today*" ausgewertet.
Wenn Sie einen bestimmten Tag oder Zeitraum angezeigt bekommen möchten, klicken Sie rechts oben auf das Uhr-Symbol um den gewünschten Zeitraum einzustellen.

-> Hier Bild <-


#### Filter verwenden 

Wenn Sie die Auswertungen und Statistiken im Overview-Dashboard detaillierter anzeigen möchten, bieten sich hierfür diverse Filter an. 

|Filter|Beschreibung|Default|
|---|---|---|
|**User**|Hier können Sie die Anzeige auf einen oder mehrere bestimmte User einschränken.|All|
|**Label**|Hier können Sie die Anzeige auf ein oder mehrere Label einschränken.|All|
|**From Name**|Hier können Sie nach dem Namen des Anrufers filtern.|*-*|
|**From Number**|Hier können Sie nach der Rufnummer des Anrufers filtern.|*-*|
|**To Name**|Hier können Sie nach dem Namen des Anruf-Empfängers filtern.|*-*|
|**To Number**|Hier können Sie nach der Rufnummer des Anruf-Empfängers filtern.|*-*|

-> Hier Bild <-


#### detaillierte Rufauswertung

Die detaillierte Rufauswertung (*Calls*) gibt eine ausführliche Übersicht auf alle geführten Gespräche im ausgewählten Zeitraum. 

|Wert|Beschreibung|
|---|---|
|**Time**|Zeitpunkt des Anrufs.|
|**From Number**|Rufnummer des Anrufers.|
|**From Name**|Name des Anrufers, sofern vorhanden (siehe Telefonbuch).|
|**To Number**|Rufnummer des Anruf-Empfängers.|
|**To Name**|Name des Anruf-Empfängers, sofern vorhanden (siehe Telefonbuch).|
|**Status**|Anruf-Status: <br/>+ hangup: Anruf wurde durch Auflegen beendet<br/>+ transfer: Anruf wurde weitergeleitet<br/>+ noanswer: Anruf wurde nicht entgegen genommen|
|**Type**|Art des Anrufs: <br/>+ internal: Interner Anruf<br/>+ inbound: Eingehender Anruf<br/>+ outbound: Ausgehender Anruf|
|**Duration**|Gesamte Dauer des Anrufs.|
|**Ringing time**|Dauer bis der Anruf entgegen genommen wurde.|
|**Talk time (incl. Hold)**|Gesprächsdauer des Anrufs (inklusive "Halten").|
|**Hold time**|Dauer, die der Anruf gehalten wurde.|
|**Chain**|Verlinkt zu einer Übersicht des genauen Anrufverlaufs, ähnlich der Anruf-Details im pascom Client.|


**Anruf-Details (*Chain*):**

|Wert|Beschreibung|
|---|---|
|**Id**|ID des Anruf-Vorgangs.|
|**Time**|Zeitpunkt des Anruf-Vorgangs.|
|**Parent**|ID des vorausgegangengen Anruf-Vorgangs.|
|**In Prefix**|Prefix-Ziffer, die bei eingehenden Telefonanrufen vorangestellt wurde.|
|**From Number**|Rufnummer des Anrufers.|
|**From Name**|Name des Anrufers, sofern vorhanden (siehe Telefonbuch).|
|**Out Prefix**|Prefix-Ziffer, die bei ausgehenden Telefonanrufen vorangestellt wurde.|
|**To Number**|Rufnummer des Anruf-Empfängers.|
|**To Name**|Name des Anruf-Empfängers, sofern vorhanden (siehe Telefonbuch).|
|**Duration**|Gesamte Dauer des Anruf-Vorgangs.|
|**Talk time (incl. Hold)**|Gesprächsdauer des Anruf-Vorgangs (inklusive "Halten").|
|**Hold time**|Dauer, die der Anruf-Vorgang gehalten wurde.|
|**Result**|Ergebnis des Anruf-Vorgangs: <br/>+ hangup: Gespräch wurde durch Auflegen beendet<br/>+ transfer: Gespräch wurde weitergeleitet<br/>+ noanswer: Gespräch wurde nicht entgegen genommen|
|**Result details**|Details zum Ergebnis: <br/>+ caller: Anrufer<br/>+ elsewhere: andere Nebenstelle hat den Anruf übernommen<br/>+ abandon: Gespräch wurde abgelehnt<br/>+ dst: andere Nebenstelle wurde gewählt<br/>+ voicemail: Anrufbeantworter wurde besprochen.|
|**Via**|Herkunft des Anruf-Vorgangs: <br/>+ queue: Team/ Warteschlange<br/>+ transfer: Gespräch wurde weitergeleitet|
|**Via details**|Initiator des Anruf-Vorgangs: <br/>+ caller: Anrufer<br/>+ agent: Team-Mitglied/ Agent<br/>+ dst: andere Nebenstelle<br/>+ action: Aktionsbedingung|
|**Recording**|Mitschnitt des Anruf-Vorgangs.|
|**Labels**|Gesetzte Label zum Anruf-Vorgang.|



### Teams

Das Team-Dashboard bietet eine Übersicht aller eingehenden Anrufe auf Warteschlangen/ Teams, Auswertungen zur durchschnittlichen Wartezeit und Gesprächsdauer, sowie eine Vielzahl an Filtermöglichkeiten zu bestimmten Warteschlangen und/oder Agenten.

{{% notice note %}}
Im Team-Dashboard werden nur eingehende Anrufe dargestellt, da ein Team als ganzes keinen ausgehenden Anruf starten kann. Um ausgehende Anrufe einzelner Benutzer/ Agenten auszuwerten bitte das Overview-Dashboard verwenden.
{{% /notice %}}

-> Hier Bild <-


#### Auswertungs-Zeitraum setzen

Standardmäßig wird im Team-Dashboard der aktuelle Tag "*Today*" ausgewertet.
Wenn Sie einen bestimmten Tag oder Zeitraum angezeigt bekommen möchten, klicken Sie rechts oben auf das Uhr-Symbol um den gewünschten Zeitraum einzustellen.

-> Hier Bild <-


#### Filter verwenden 

Wenn Sie die Auswertungen und Statistiken im Team-Dashboard detaillierter anzeigen möchten, bieten sich hierfür diverse Filter an. 

|Filter|Beschreibung|Default|
|---|---|---|
|**Team**|Hier können Sie die Anzeige auf ein oder mehrere Teams/ Warteschlangen einschränken.|All|
|**User**|Hier können Sie die Anzeige auf einen oder mehrere bestimmte User/ Agenten einschränken.|All|
|**Label**|Hier können Sie die Anzeige auf ein oder mehrere Label einschränken.|All|
|**From Name**|Hier können Sie nach dem Namen des Anrufers filtern.|*-*|
|**From Number**|Hier können Sie nach der Rufnummer des Anrufers filtern.|*-*|

-> Hier Bild <-


#### detaillierte Rufauswertung

Die detaillierte Rufauswertung (*Calls*) gibt eine ausführliche Übersicht auf alle eingegangenen Team-Anrufe im ausgewählten Zeitraum. 

|Wert|Beschreibung|
|---|---|
|**Time**|Zeitpunkt des Anrufs.|
|**From Number**|Rufnummer des Anrufers.|
|**From Name**|Name des Anrufers, sofern vorhanden (siehe Telefonbuch).|
|**Status**|Anruf-Status: <br/>+ hangup: Anruf wurde durch Auflegen beendet<br/>+ transfer: Anruf wurde weitergeleitet<br/>+ noanswer: Anruf wurde nicht entgegen genommen|
|**Queue**|Angerufene Warteschlange/ Team.| 
|**Agent**|Benutzer/ Agent, der den Anruf entgegen genommen hat.|
|**Duration**|Gesamte Dauer des Anrufs.|
|**Music on Hold**|Dauer bis der Anruf erfolgreich zum Team/ Warteschlange durchgestellt wurde.|
|**Agent Ringing time**|Dauer der Anrufsignalisierung (klingeln) beim Agenten.|
|**Talk time (incl. Hold)**|Gesprächsdauer des Anrufs (inklusive "Halten").|
|**Hold time**|Dauer, die der Anruf gehalten wurde.|
|**Chain**|Verlinkt zu einer Übersicht des genauen Anrufverlaufs, ähnlich der Anruf-Details im pascom Client.|

**Anruf-Details (*Chain*):**

|Wert|Beschreibung|
|---|---|
|**Id**|ID des Anruf-Vorgangs.|
|**Time**|Zeitpunkt des Anruf-Vorgangs.|
|**Parent**|ID des vorausgegangengen Anruf-Vorgangs.|
|**In Prefix**|Prefix-Ziffer, die bei eingehenden Telefonanrufen vorangestellt wurde.|
|**From Number**|Rufnummer des Anrufers.|
|**From Name**|Name des Anrufers, sofern vorhanden (siehe Telefonbuch).|
|**Out Prefix**|Prefix-Ziffer, die bei ausgehenden Telefonanrufen vorangestellt wurde.|
|**To Number**|Rufnummer des Anruf-Empfängers.|
|**To Name**|Name des Anruf-Empfängers, sofern vorhanden (siehe Telefonbuch).|
|**Duration**|Gesamte Dauer des Anruf-Vorgangs.|
|**Talk time (incl. Hold)**|Gesprächsdauer des Anruf-Vorgangs (inklusive "Halten").|
|**Hold time**|Dauer, die der Anruf-Vorgang gehalten wurde.|
|**Result**|Ergebnis des Anruf-Vorgangs: <br/>+ hangup: Gespräch wurde durch Auflegen beendet<br/>+ transfer: Gespräch wurde weitergeleitet<br/>+ noanswer: Gespräch wurde nicht entgegen genommen|
|**Result details**|Details zum Ergebnis: <br/>+ caller: Anrufer<br/>+ elsewhere: andere Nebenstelle hat den Anruf entgegen genommen<br/>+ abandon: Gespräch wurde abgelehnt/abgebrochen<br/>+ dst: andere Nebenstelle wurde gewählt<br/>+ voicemail: Anrufbeantworter wurde besprochen.|
|**Via**|Herkunft des Anruf-Vorgangs: <br/>+ queue: Team/ Warteschlange<br/>+ transfer: Gespräch wurde weitergeleitet|
|**Via details**|Initiator des Anruf-Vorgangs: <br/>+ caller: Anrufer<br/>+ agent: Team-Mitglied/ Agent<br/>+ dst: andere Nebenstelle<br/>+ action: Aktionsbedingung|
|**Recording**|Mitschnitt des Anruf-Vorgangs.|
|**Labels**|Gesetzte Label zum Anruf-Vorgang.|



## Weitere Funktionen

Das Rufauswertungs-Tool Grafana bietet noch viele weitere Einstellungs- und Auswertungsmöglichkeiten.


### Eigenes Dashboard erstellen/ bearbeiten

Im Rufauswertungs-Tool gibt es standardmäßig 3 Standard-Dashboards (Live, Overview, Team), die nicht verändert werden können. Es besteht jedoch die Möglichkeit einzelne Auswertungen/ Statistiken zu bearbeiten und in einem eigenen Dashboard abzuspeichern.


#### Eigenes Dashboard bearbeiten

Klicken Sie die Bezeichnung einer beliebigen Auswertung/ Statistik in einem bestehenden Dashboard an, um eine erweiterte Aktions-Auswahl zu erhalten. Wählen Sie die Aktion {{< ui-button "Edit" >}} aus.

Jetzt können Sie die Auswertung an Ihre Bedürfnisse anpassen: 

+ **Filter**: Filter bearbeiten (je nach zuvor gewähltem Standard-Dashboard)
+ **General**: Bezeichnung (*Titel*) und Beschreibung (*Description*) verändern 
+ **Metrics**: SQL-Abfrage direkt bearbeiten
+ **Options**: Darstellungs-Optionen bearbeiten (Farben (*Coloring*), Werte (*Value*), Beschriftung (*Gauge*), u. v. m.)
+ **Value Mappings**: Standard-Werte und Formatierung bearbeiten
+ **Time range**: Auswertungszeitraum bearbeiten

Sobald die Auswertung fertig angepasst wurde, können Sie die Änderungen mit einem Klick auf das Speichern-Symbol rechts oben speichern.


Handelt es sich bei dem bestehenden Dashboard um ein Standard-Dashboard (Live, Overview oder Team), erhalten Sie an dieser Stelle eine Fehlermeldung, dass ein Standard-Dashboard nicht verändert werden darf und die Änderungen nicht gespeichert werden können:

        Cannot save provisioned dashboard.

Stattdessen können Sie den angezeigten Konfigurations-Code (*JSON*) des Dashboards mit einem Klick auf {{< ui-button "Copy JSON to Clipboard" >}} in die Zwischenablage speichern und anschließend mit einem Click auf {{< ui-button "Cancel" >}} und {{< ui-button "Back to Dashboard" >}} die Bearbeitungs-Maske verlassen.


#### Neues Dashboard erstellen

**Neues Dashboard aus Konfigurations-Code (*JSON*), URL oder ID erstellen**

Wenn Sie ein Dashboard oder eine Auswertung bearbeitet haben und einen Konfigurations-Code (*JSON*), einen Link oder eine Dashboard-ID zur Hand haben, können Sie daraus ein bereits vollständig konfiguriertes Dashboard erstellen.

Klicken Sie in der linken Menüleiste auf das Plus-Symbol und wählen Sie {{< ui-button "Import" >}} aus, um ein neues Dashboard anhand einer bestehenden Konfiguration zu erstellen.

+ Wenn Sie einen Link oder eine ID zur Hand haben fügen Sie diese im ersten Feld bei {{< ui-button "Grafana.com Dashboard" >}} ein.
oder:
+ Wenn Sie einen Konfigurations-Code (*JSON*) zur Hand haben fügen Sie diesen im zweiten Feld bei {{< ui-button "Or paste JSON" >}} ein. Alternativ können Sie den Konfigurations-Code auch als JSON-Datei über den Button {{< ui-button "Upload .json File" >}} hochladen.

Jetzt ist es notwendig dem neuen Dashboard eine Bezeichnung zu geben, sodass das neue Dashboard eindeutig zugeordnet werden kann.

|Einstellung|Beschreibung|
|---|---|
|**Name**|Eindeutige Bezeichnung des neuen Dashboards.|
|**Folder**|Ablage-Ordner des Dashboards.|
|**Unique identifier (uid)**|Eindeutige ID des neuen Dashboards. *Default: auto-generated*|

Bestätigen Sie die Einstellungen mit einem Klick auf {{< ui-button "Import" >}}. Ihr neu erstelltes Dashboard öffnet sich automatisch und steht zukünftig zur Verfügung.


**Neues Dashboard mit neuen Auswertungen erstellen**

Klicken Sie in der linken Menüleiste auf das Plus-Symbol und wählen Sie {{< ui-button "Dashboard" >}} aus, um ein neues Dashboard zu erstellen.

Wählen Sie unter {{< ui-button "Add" >}} die Diagramm-Form (*Panel*) aus, die Sie zu Ihrem neuen Dashboard hinzufügen möchten.

+ Graph
+ Singlestat
+ Table
+ Text
+ Heatmap
+ Alert List
+ Dashboard List
+ Row
+ Pie Chart
+ Plugin List

Welche Diagram-Form (*Panel*) wofür geeignet ist und wie Sie diese korrekt einrichten finden Sie in der [Grafana-Dokumtentation](http://docs.grafana.org/features/panels).

Sobald Sie die gewünschten Auswertungen Ihrem neuen Dashboard hinzugefügt haben, können Sie die Änderungen mit einem Klick auf das Speichern-Symbol rechts oben speichern. 

Jetzt ist es notwendig dem neuen Dashboard eine Bezeichnung zu geben, sodass das neue Dashboard eindeutig zugeordnet werden kann.

|Einstellung|Beschreibung|
|---|---|
|**Name**|Eindeutige Bezeichnung des neuen Dashboards.|
|**Folder**|Ablage-Ordner des Dashboards. |

Bestätigen Sie die Einstellungen mit einem Klick auf {{< ui-button "Save" >}}. Ihr neu erstelltes Dashboard öffnet sich automatisch und steht zukünftig zur Verfügung.


#### Dashboards und Auswertungen exportieren

Das Rufauswertung-Tool bietet Ihnen die Möglichkeit bestimmte Auswertungen oder sogar ganze Dashboards zu exportieren.

**Dashboard exportieren**

Wenn Sie ein gesamtes Dashboard als JSON exportieren möchten, wählen Sie zuerst das gewünschte Dashboard aus und klicken dann in der Leiste rechts oben auf das Teilen-Symbol. 
Wechseln Sie zu dem Reiter {{< ui-button "Export" >}} um einzustellen, wie dieses Dashboard exportiert werden soll.

|Einstellung|Beschreibung|
|---|---|
|**Export for sharing externally**|Setzen Sie hier einen Haken, wenn Sie dieses Dashboard unabhängig von Ihrer Telefonanlage verwenden können möchten.|

Klicken Sie auf {{< ui-button "Save to file" >}} um das Dashboard als JSON-Datei zu exportieren.
Klicken Sie auf {{< ui-button "View JSON" >}} um den JSON-Konfigurationscode anzeigen zu lassen.


**Auswertung exportieren**

Es ist möglich jede einzelne Statistik des Rufauswertungs-Tools via CSV zu exportieren. 

Klicken Sie dazu die Bezeichnung einer beliebigen Auswertung/ Statistik in einem bestehenden Dashboard an, um eine erweiterte Aktions-Auswahl zu erhalten. Fahren Sie mit der Maus über die Aktion {{< ui-button "More" >}} und wählen Sie {{< ui-button "Export CSV" >}} aus. 

Anschließend öffnet sich ein Detail-Fenster in dem Sie Einstellungen, wie Datumsformat und Darstellung der Auswertung zu dem CSV angeben können.

Mit einem Klick auf {{< ui-button "Export" >}} wird die CSV-Datei generiert.


#### Dashboard teilen

Wenn Sie eine Live-Auswertungen mit jemandem teilen möchten, können Sie hierfür einen Link zu Ihrem Dashboard erstellen um dieses zu teilen. 

{{% notice info %}}
Das Teilen von Live-Links wird in der pascom Version 18.05 noch nicht unterstützt, da es hier kein Benutzermanagement gibt. Das Benutzermanagement wird erst in den folgenden Releases nachgereicht.
Bis dahin verwenden Sie bitte Snapshots, oder loggen Sie sich als Benutzer mit Administrationsrechten ein, um Zugriff auf alle Dashboards mit aktualisierenden Daten zu erhalten.
{{% /notice %}}


#### Snapshots teilen

Wenn Sie eine aktuelle Auswertung mit jemanden ohne Administrationszugriff teilen möchten, können Sie hierfür einen Snapshot erstellen. 

{{% notice note %}}
Der Snapshot stellt immer nur die Auswertung zum Zeitpunkt beim Erstellen des Snapshots dar und aktualisiert sich niemals automatisch mit aktuellen Daten. Mit einem Snapshot ist keine Live-Ansicht möglich.
{{% /notice %}}

Wählen Sie das Dashboard aus, das Sie teilen möchten und klicken Sie in der Leiste rechts oben auf das Teilen-Symbol. 
Wechseln Sie zu dem Reiter {{< ui-button "Snapshot" >}} um einzustellen, wie lange der Snapshot verfügbar sein soll.

|Einstellung|Beschreibung|
|---|---|
|**Snapshot name**|Bezeichnung des Snapshots|
|**Expire**|Dauer der Verfügbarkeit es Snapshots. *Default: Never*|
|**Timeout (seconds)**|Timeout in Sekunden, wie lange versucht wird die Daten auszulesen.|

Mit einem Klick auf {{< ui-button "Local Snapshot" >}} wird ein lokaler Link generiert, der mit {{< ui-button "Copy Link" >}} in die Zwischenablage kopiert und geteilt werden kann.


## FAQ

**Was passiert wenn ein Benutzer oder eine Warteschlange/ Team auf der Telefonanlage gelöscht wird?**

Werden Benutzer oder Warteschlangen/ Teams gelöscht, oder Agenten aus bestehenden Warteschlangen entfernt, bleiben die Rohdaten für die Auswertung vorhanden. 

Das bedeutet:

+ In der Live-Anzeige werden nicht mehr vorhandene Benutzer und Warteschlangen/ Teams nicht mehr angezeigt.
+ Gelöschte Benutzer und Warteschlangen/ Teams, sowie entfernte Agenten stehen in den Filtern nicht mehr zur Auswahl (*können jedoch manuell eingetippt werden*).
+ Gelöschte Benutzer und Warteschlangen/ Teams bleiben in der Rufauswertung vorhanden, sofern Sie im angezeigten Zeitraum noch exitstiert haben.


**Wie zeige ich an einem PC/ TV immer die aktuellen Live-Daten an?**

Da durch fehlendes Benutzermanagement noch kein Teilen von Live-Daten möglich ist, bietet sich folgender Workaround an: 

Melden Sie sich beim betreffenden PC/ TV als Administrator auf der pascom Servermanagement Oberfläche an und achten Sie darauf, dass diese Benutzersitzung keinen Timeout hat und der Adminbenutzer nicht automatisch ausgeloggt wird.
Öffnen Sie die Rufstatistik der benötigten Instanz mit den gewünschten Live-Daten z. B. das Live-Dashboard.