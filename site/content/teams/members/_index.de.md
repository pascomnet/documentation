---
title: Team Mitglieder
description: Teams in pascom sind vergleichbar mit Warteschlangen. Rufstrategien helfen Ihnen Anrufe gezielt zu steuern.
weight: 20
---

{{< doctype "both" >}}

{{< description >}}

## Mitglieder anlegen

In diesem Tab können Mitglieder zur Warteschlage hinzugefügt werden. Klicken Sie auf den blauen Pfeil in Richtung rechts um einen Benutzer zuzuweisen. Möchten Sie den Benutzer aus dem Team entfernen, klicken Sie auf den Pfeil in Richtung links.


### Flexible Mitglieder

Wie bereits erwähnt können Benutzer feste oder flexible Agenten in einer Warteschlange sein. Per default ist ein Agent nicht flexibel. Dies können Sie ändern mit einem Klick auf das *Flexibel*-Feld. Wählen Sie *Ja*.  
Damit sich flexibel Agenten in die Warteschlagen Einbuchen können benötigen Sie einen Einbuchcode. Dieser kann in Tab {{< ui-button "Erweitert" >}} definiert werden.

*Beispiel:*<br>
Der Einbuchcode lautet **\*90** und der Agent hat die Durchwahl **13**. Der Agent muss dabei **\*9013**  wählen um sich in der Warteschlagen anzumelden. Zum Abmelden muss ebenfalls **\*9013** gewählt werden. Beim An- oder Abmelden hört der Agent jeweils eine Meldung über den nun aktuellen Status.

{{% notice note %}}
Damit der Einbuchcode von der pascom richtig erkannt und bearbeitet wird, muss die pascom wissen, wie viele Stellen eine Benutzerduchwahl hat. Dies muss in den Systemeinstellungen festgelegt werden. Suchen Sie in dem Suchfeld nach *sys.asterisk.dialplan.global.alias.digit.value*. Der Defaultwert ist hier *3*. Passen Sie das entsprechend an.<br>
Wir raten davon ab, bei Benutzern Durchwahlen zu verwenden mit unterschiedlichen Druchwahlstellen.
{{% /notice %}}

{{% notice info %}}
Verwendet der Benutzer ein IP-Telefon, kann eine LED-Nebenstellentaste (meistens Typ BLF) mit dem Einbuchcode konfiguriert werden. Lesen Sie dazu die Herstellerspezifikation Ihres IP-Telefons.
{{% /notice %}}

Alternativ kann sich ein Benutzer auch per pascom Client in der Team Anzeige durch das + und - Symbol an einem Warteschlangen Team ab- und anmelden.


### Pausieren und Pausegründe

Statt sich an- und abzumelden ist es auch möglich als Mitglied einer Warteschlange zu pausieren. In dieser Zeit bleiben Sie an der Warteschlange angemeldet erhalten aber keine Anrufe.  
Pausegründe können unter {{< ui-button "Benutzer" >}} > {{< ui-button "Pausegründe" >}} einstellt werden.

|Parameter|Beschreibung|
|---|---|
|**Bezeichung**|Die Bezeichnung wird im pascom Client als Pausengrund angezeigt.|
|**Kennung**|Mit der Kennung kann man die Pause pro Mitglied am Telefon-Tastenfeld aktivieren/deaktivieren.|

*Beispiel:*<br>
Warteschlangen-Durchwahl: 100<br>
Benutzerdurchwahl: 13<br>
Kennung: 111<br>
Somit kann die Pause aktiviert/deaktiviert werden mit: **\*99100#13#111**

Pausiert ein Mitglied in der Warteschleife kann das von den anderen Mitgliedern incl. Pausengrund im pascom Client gesehen werden:

<!-- TODO
![Screenshot - Pause aktivieren im pascom Client](../../images/team_pause.png?width=90% " Pause aktivieren im pascom Client") -->

Das Pausieren kann im pascom Client in der Team Anzeige durch das Pausensymbol gesteuert werden:
<!-- TODO 
![Screenshot - Pausengründe im pascom Client](../../images/team_pause_detail.png?width=30% " Pausengründe im pascom Client") -->

