---
title: Teams bilden
keywords:
    - Teams bilden
    - Warteschlangen
    - Rufgruppen
    - Roaming User
    - Call Center Teams
description: Teams in pascom sind vergleichbar mit Warteschlangen. Rufstrategien helfen Ihnen Anrufe gezielt zu steuern.
url: /benutzer/teams/
prev: /benutzer/benutzer-arbeitsplaetze/
next: /benutzer/telefonbuch/
weight: 23
toc: true
---

## Konzept

Jeder Benutzer hat in der [VoIP Telefonalage](https://www.pascom.net/de/mobydick-voip/) seine eigene Durchwahl, Geräte und Aktionen die den Anruf an diese Durchwahl steuern. **Zusätzlich kann** ein Benutzer Mitglied in einem Team sein.

![IllustratioTeam Konzept](/team_konzept.png?width=60%)


Das **Team** hat eine eigene Durchwahl und eigene Aktionen. Wird die Durchwahl des Teams gerufen klingeln die Telefone der Mitglieder je nach im Team hinterlegter Strategie und Aktionen.  

{{% notice info %}}
Wird ein Team gerufen gelten ausschließlich die dort hinterlegten Aktionen. Die Aktionen die bei den Benutzer hinterlegt sind werden in diesem Fall ignoriert.
{{% /notice %}}

Somit kann man beispielsweise steuern, dass Frank auf seiner direkten Durchwahl **22** auch **außerhalb der Geschäftszeiten erreichbar bleibt** das Support Team nach 18:00 Uhr aber auf den **Anrufbeantworter** umleitet.

### Teamarten

Es gibt zwei verschiedene Arten von Teams die sich lediglich im Funktionsumfang unterscheiden.

#### Rufgruppen

Rufgruppen haben **fix zugeteilte** Mitglieder und kennen nur die beiden Rufstrategien **alle** und **nacheinander**. Anrufer bekommen entweder ein Freizeichen oder Wartemusik vorgespielt.

#### Warteschlangen

Warteschlangen können **fixe** und **dynamische Mitglieder** habe. Das bedeutet Benutzer können sich bei Bedarf an einer Warteschlange ad hoc anmelden. Außerdem kennen Warteschlangen eine **Vielzahl** verschiedener **Rufstrategien**.

Anrufer werden nacheinander in der Warteschlange **eingereiht** und bekommen auf Wunsch die **Warteposition** und **durchschnittliche Wartezeit** angesagt. Während der Wartezeit kann man entweder Wartemusik oder ein Freizeichen einspielen.

Warteschlangen können ein unterschiedliches Gewicht haben. Je höher die Gewichtung, desto wichtiger die Warteschlange.

## Konfiguration

### Warteschlangen erstellen

Zum Erstellen eines Teams klicken Sie in der Web-UI auf `Benutzer` > `Teams`. Hier wählen Sie **Warteschlange** und geben Sie der Team einen Namen und eine Durchwahl und Klicken Sie auf `Weiter`.

Folgende Einstellungen sind nun möglich:

#### Rufstrategien

|Strategie|Beschreibung|
|---|---|
|**alle anklingeln**|Alle Mitglieder werden gleichzeitig gerufen.|
|**nacheinander**|Die Mitglieder werden nach der Zuweisungsreihenfolge gerufen. Achtung: Dynamische Mitglieder verändern durch Ein- und Ausbuchen aus dem Team die Position.|
|**längste zurück**|Das Mitglied welches am längsten keinen Anruf entgegen genommen hat kommt als nächstes dran.<br>**Achtung**: Dynamische Mitglieder setzten durch Ein- und Ausbuchen aus dem Team alle Zähler zurück und sind somit nach dem Einbuchen automatisch immer derjenige der am längsten keinen Anruf bekommen hat.|
|**wenigsten Anrufe**|Das Mitglied welches am wenigsten Anrufe angenommen hat kommt als nächstes dran. Diese Einstellung berücksichtig nicht die Anrufdauer. Wenn ein Mitglied beispielsweise 5 mal eine Minute lang telefoniert und ein anderes 2 mal eine Stunde ist trotzdem letzteres an der Reihe. Dynamische Mitglieder setzten durch Ein- und Ausbuchen aus dem Team alle Zähler zurück und sind somit nach dem Einbuchen automatisch immer derjenige der am wenigsten Anruf bekommen hat.|
|**per Zufall**|Wählt zufällig einen Agenten aus.|
|**mem-nacheinander**|Wie nacheinander allerdings beginnt die Reihe beim nächsten Anrufer nicht von vorne sondern nach dem der als letztes einen Anruf entgegengenommen hat.|
|**per Zufall - gewichtet**|Wie per Zufall nur werden die Prioritäten der Agenten berücksichtigt. Erst wenn alle Agenten mit niedriger Priorität telefonieren werden die mit der nächst höheren gerufen.|

<!--FIXME prio statische dynamische mitglieder bei Strategie nacheinander  -->

#### Routing Skript

Hier kann ein Routing-Skript ausgewählt werden. Mehr dazu unter [Skill Based Routing](../../anrufverteilung/skillbased/)

#### Pickup-Benachrichtigungen

In einem Team ist es möglich einzustellen, welche Benutzer im pascom Client Pickup-Benachrichtigungen über eingehende Rufe erhalten.

Zuerst muss eine Pickup-Rolle definiert werden. Diese kann als Mitglieder ein Team haben und auch einzelne Benutzer, die nicht zum Team gehören. Informationen zu Rollen finden Sie unter [Rollen](../user/#rollen)

Anschließend können Sie im Team, das zur angelegten Pickup-Rolle gehört festlegen wer Benchrichtigugnen erhält.

Folgende Einstellungen sind möglich:

|Parameter|Bedeutung|
|---|---|
|**Niemand**|Niemand erhält Benachrichtigungen.|
|**Verfügbare Agenten und Nichtmitglieder**|Agenten die im Team angemeldet sind und Agenten die Nichtmitglieder im Team sind erhalten eine Benachrichtigung. Flexible Agenten die gerade nicht im Team angemeldet sind und pausierte Agenten erhalten keine Benachrichtigung.|
|**Nicht verfügbare Agenten und Nichtmitglieder**|Agenten die nicht im Team angemeldet sind, Agenten die pausiert sind und Nichtmitglieder des Teams erhalten eine Benachrichtigung. Agenten die feste Mitglieder des Teams sind und flexible Agenten die gerade angemeldet sind erhalten keine Benachrichtigungen.|
|**Nur Nichtmitglieder**|Nur Nichtmitglieder des Teams erhalten eine Benachrichtigung.|
|**Gesamte Pickup-Gruppe**|Die gesamte Pickup-Gruppe bekommt Benachrichtigungen.|

#### Anzeigetext

Dieser Text wird dem Benutzer bei einem Anruf über das Team vor der Rufnummer des Anrufers angezeigt. Damit weiß das Team-Mitglied, dass der nicht direkt sondern über die Durchwahl des Teams angerufen wird.

#### Wartemusik

Zur Auswahl stehen **Freizeichen** und **Wartemusik: "default"**. Möchten Sie eigene Wartemusik verwenden, lesen Sie den Artikel über Wartemusik.

#### Timeouts

|Einstellung|Beschreibung|
|---|---|
|**Mitglied-Timeout**|Zeit in Sekunden, wie lange es bei einem Team-Mitglied klingeln soll.|
|**Timeout extern**|Zeit in Sekunden, wie lange es bei Anrufen von extern in der Warteschlange klingeln soll. Anschließend wird die Aktion Extern/Nachher ausgeführt.|
|**Timeout intern**|Zeit in Sekunden, wie lange es bei Anrufen von intern in der Warteschlange klingeln soll. Anschließend wird die Aktion Intern/Nachher ausgeführt.|

#### Einstellungen zu Anrufern

|Einstellung|Beschreibung|
|---|---|
|**Maximale Anzahl Wartende**|Anzahl der Anrufer die in der Warteschlange warten. Weitere Anrufer fallen in die Aktion Nachher.|
|**Betreten wenn leer**|Gibt an, ob ein Anrufer die Warteschlage betreten soll, falls kein Agent angemeldet ist.|
|**Verlassen wenn leer**|Gibt an, ob ein Anrufer die Warteschlage betreten soll, falls kein Agent angemeldet ist.|

#### Voicemailbox

|Einstellung|Beschreibung|
|---|---|
|**Voicemail Pin**||
|**Voicemail speichern**|**JA** bedeutet, die Voicmails werden nach dem Versenden oder nachdem sie abgehört werden auf der pascom gespeichert bleiben. Durch einen Cronjob können ältere Voicemails gelöscht werden.<br>**NEIN** bedeutet, dass die Voicemails nach dem Versenden per E-Mail von der pascom gelöscht werden. Diese Einstellung ist zu empfehlen, da Voicemails viel Speicherplatz verwenden.|
|**Voicemail Email**|An diese E-Mail-Adresse werden die Voicemails verschickt.|

#### Team-Mitglieder

In diesem Tab können Mitglieder zur Warteschlage hinzugefügt werden. Klicken Sie auf den blauen Pfeil in Richtung rechts um einen Benutzer zuzuweisen. Möchten Sie den Benutzer aus dem Team entfernen, klicken Sie auf den Pfeil in Richtung links.

Wie bereits erwähnt können Benutzer feste oder flexible Agenten in einer Warteschlange sein. Per default ist ein Agent nicht flexibel. Dies können Sie ändern mit einem Klick auf das *Flexibel*-Feld. Wählen Sie *Ja*.  
Damit sich flexibel Agenten in die Warteschlagen Einbuchen können benötigen Sie einen Einbuchcode. Dieser kann in Tab `Erweitert` definiert werden.

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


#### Pausieren und Pausegründe

Statt sich an- und abzumelden ist es auch möglich als Mitglied einer Warteschlange zu pausieren. In dieser Zeit bleiben Sie an der Warteschlange angemeldet erhalten aber keine Anrufe.  
Pausegründe können unter `Benutzer` > `Pausegründe` einstellt werden.

|Parameter|Beschreibung|
|---|---|
|**Bezeichung**|Die Bezeichnung wird im pascom Client als Pausengrund angezeigt.|
|**Kennung**|Mit der Kennung kann man die Pause pro Mitglied am Telefon-Tastenfeld aktivieren/deaktivieren.|

<!-- *Beispiel:*<br>
Warteschlangen-Durchwahl: 100<br>
Benutzerdurchwahl: 13<br>
Kennung: 111<br>
Somit kann die Pause aktiviert/deaktiviert werden mit: **\*99100#13#111**

Pausiert ein Mitglied in der Warteschleife kann das von den anderen Mitgliedern incl. Pausengrund im pascom Client gesehen werden:
![Screenshot - Pause aktivieren im pascom Client](../../images/team_pause.png?width=90% " Pause aktivieren im pascom Client")

Das Pausieren kann im pascom Client in der Team Anzeige durch das Pausensymbol gesteuert werden:
![Screenshot - Pausengründe im pascom Client](../../images/team_pause_detail.png?width=30% " Pausengründe im pascom Client")
-->

#### Warteschlangen gewichten

Warteschlangen können ein unterschiedliches Gewicht haben. Desto schwerer desto wichtiger. Als Gewicht können Sie eine beliebige Zahl eintragen.

![Warteschlangen gewichten](/team_prio.png?width=80%)

In unserem Beispiel sind Frank und Peter in die Warteschlange Support und VIP-Support eingebucht. Beide telefonieren. In Support warten zwei Kunden darauf bedient zu werden in VIP-Support einer. Beendet Frank oder Peter das aktuelle Gespräch wird auf jeden Fall der wartende Anrufer aus dem VIP-Support als nächstes dran kommen, egal ob dieser bereits länger oder kürzer als die anderen wartet, da diese Warteschleife mehr Gewicht hat. Es werden also solange Wartende aus der schwersten Warteschlange dran kommen bis diese leer ist.

{{% notice tip %}}
Wenn Sie mit Gewichten arbeiten, dürfen Sie keine Warteschlangen ohne Gewicht benutzen. Diese haben dann ein Gewicht von 0 und kommen somit nie an die Reihe.
{{% /notice %}}

Stellen Sie die Gewichtung ein unter `Benutzer` > `Teams` > wählen Sie das Team aus > im Tab `Erweitert` das Feld **Gewichtung**.

#### Aktionen

Aktionen sind in der pascom ein wichtiges Werkzeug um den Anrufablauf zu steuern. Aktionen ermöglichen es

* dem Anrufer Ansagen vorzuspielen,
* außerhalb der Geschäftzeiten den Anrufer auf eine Voicemailbox umzuleiten,
* einen Anrufen auf einen anderen Benutzer oder Team abzuwerfen, falls der eigentlich Angerufene im Gespräch,
* und vieles mehr.

Lesen Sie dazu bitte den Artikel über [Aktionen](../anrufverteilung/actions/).
