---
title: Teams bilden
keywords:
    - Teams bilden
    - Warteschlangen
    - Rufgruppen
    - Roaming User
    - Call Center Teams
description: Teams in mobydick sind vergleichbar mit Warteschlangen. Rufstrategien helfen Ihnen Anrufe gezielt zu steuern.
url: /benutzer/teams/
prev: /benutzer/benutzer-und-arbeitsplaetze/
next: /benutzer/phonebook/
weight: 23
toc: true
---

## Konzept

Jeder Benutzer hat in der mobydick seine eigene Durchwahl, Geräte und Aktionen die den Anruf an diese Durchwahl steuern. **Zusätzlich kann** ein Benutzer Mitglied in einem Team sein.

![Illustration - Team Konzept](../../images/team_konzept.png?width=50% "Teams und Warteschlangen in der mobydick")


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

Warteschlangen können fixe und **dynamische Mitglieder** habe. Das bedeutet Benutzer können sich bei Bedarf an einer Warteschlange ad hoc anmelden. Außerdem kennen Warteschlangen eine **Vielzahl** verschiedener **Rufstrategien**.

Anrufer werden nacheinander in der Warteschlange **eingereiht** und bekommen auf Wunsch die **Warteposition** und **durchschnittliche Wartezeit** angesagt. Während der Wartezeit kann man entweder Wartemusik oder ein Freizeichen einspielen.

Warteschlangen können ein unterschiedliches Gewicht haben. Je höher die Gewichtung, desto wichtiger die Warteschlange.

![Illustration - Warteschlangen gewichten](../../images/team_prioritaet.png?width=70% "Warteschlangen gewichten in der mobydick")

In unserem Beispiel sind Frank und Peter in die Warteschlange Support und VIP-Support eingebucht. Beide telefonieren. In Support warten 2 Kunden darauf bedient zu werden in VIP-Support einer. Beendet Frank oder Peter das aktuelle Gespräch wird auf jeden Fall der wartende Anrufer aus dem VIP-Support als nächstes dran kommen, egal ob dieser bereits länger oder kürzer als die anderen wartet, da diese Warteschleife mehr Gewicht hat. Es werden also so lange Wartende aus der schwersten Warteschlange dran kommen bis diese leer ist.

<!-- ## Konfiguration

### Warteschlangen Erstellen

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
|**mem-nacheinander - sortiert**||
|**per Zufall - gewichtet**|Wie per Zufall nur werden die Prioritäten der Agenten berücksichtigt. Erst wenn alle Agenten mit niedriger Priorität telefonieren werden die mit der nächst höheren gerufen.|

#### Routing Skript

Hier kann ein Routing-Skript ausgewählt werden. Mehr dazu unter [Skill Based Routing](../../anrufverteilung/skillbased/)

#### Pickup-Benachrichtigungen

In einem Team ist es möglich einzustellen, welche Benutzer im mobydick Client Pickup-Benachrichtigungen über eingehende Rufe erhalten.

Zuerst muss eine Pickup-Rolle definiert werden. Diese kann als Mitglieder ein Team haben und auch einzelne Benutzer, die nicht zum Team gehören. Informationen zu Rollen finden Sie unter [Rollen](../benutzer-und-arbeitsplaetze/#rollen)

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
|**Mitglied-Timeout**||
|**Timeout extern**||
|**Timeout intern**||

#### Einstellungen zu Anrufern

|Einstellung|Beschreibung|
|---|---|
|**Maximale Anzahl Wartende**||
|**Betreten wenn leer**||
|**Verlassen wenn leer**||

#### Voicemailbox

|Einstellung|Beschreibung|
|---|---|
|**Voicemail Pin**||
|**Voicemail speichern**||
|**Voicemail Email**||

#### Team-Mitglieder



#### Warteschlangen gewichten

Warteschlangen können ein unterschiedliches Gewicht haben. Desto schwerer desto wichtiger. Als Gewicht können Sie eine beliebige Zahl eintragen.

![Illustration - Warteschlangen gewichten](../../images/team_prioritaet.png?width=70% "Warteschlangen gewichten in der mobydick")

In unserem Beispiel sind Frank und Peter in die Warteschlange Support und VIP-Support eingebucht. Beide telefonieren. In Support warten 2 Kunden darauf bedient zu werden in VIP-Support einer. Beendet Frank oder Peter das aktuelle Gespräch wird auf jeden Fall der wartende Anrufer aus dem VIP-Support als nächstes dran kommen, egal ob dieser bereits länger oder kürzer als die anderen wartet, da diese Warteschleife mehr Gewicht hat. Es werden also solange Wartende aus der schwersten Warteschlange dran kommen bis diese leer ist.
{{% notice tip %}}
A tip disclaimer
Wenn Sie mit Gewichten arbeiten, dürfen Sie keine Warteschlangen ohne Gewicht benutzen. Diese haben dann ein Gewicht von 0 und kommen somit nie an die Reihe.
{{% /notice %}}

####


______________________________________
-->

## Konfiguration

### Team von Typ Rufgruppe verwalten

Wählen Sie hierzu in der mobydick Weboberfläche unter **Benutzer > Teams** den Button `+Hinzufügen` um ein neues Team zu erstellen oder markieren Sie eine bereits vorhandenes Team und wählen `Bearbeiten`.

Beim Hinzufügen selektieren Sie den **Typ Rufgruppe** und geben Sie eine **Bezeichnung** sowie die Durchwahl unter der das Team erreichbar sein soll ein.

#### Basisdaten
![Screenshot - Rufgruppe verwalten](../../images/team_rufgruppe_basic.png?width=90% "Rufgruppe verwalten in der mobydick")

|Parameter| Bedeutung|
|----------|----------|
|Bezeichnung|Name des Teams.|
|Durchwahl|Unter welcher Durchwahl ist das Team erreichbar.|
|Rufstrategie|Nach welcher Strategie sollen die Mitglieder gerufen werden.|
|Pickup Benachrichtigungen|Hier kann man festlegen, wer alles Pickup Benachrichtigungen einer Rufgruppe sieht. Mehr dazu unter: Pickup Benachrichtigungen|
|Anzeigetext|Dieser Text wird dem Mitglied auf seinem Telefon-Display vor dem Namen und der Nummer des Anrufenden angezeigt. Somit kann das Mitglied nachvollziehen das es sich nicht um einen direkten Anruf sonder einen Anruf über das Team "SP" handelt.|
|Kanal beantworten|Normalerweise wird der Kanal sofort beantwortet falls Wartemusik oder eine Ansage abgespielt werden soll. Dies kann man hier verzögern (in Millisekunden). Bei manchen Anrufern kommt es vor, dass bei einer sofortigen Beantwortung die erste Silbe der Ansage "verschluckt" wird. Durch eine Verzögerung kann dies vermieden werden.|
|Wartemusik|Welche Wartemusik Playliste soll abgespielt werden. Wählen Sie - Freizeichen - wenn Sie nicht möchten, dass der Kanal beantwortet wird sondern der Anrufer ein Freizeichen erhält. Dies mach natürlich nur sinn wenn Sie nicht bereits in den Aktionen den Kanal beantwortet haben um z.B. eine Begrüßung abzuspielen.|

#### Erweitert
![Screenshot - Rufgruppe mit Erweiterten Funktionen](../../images/team_rufgruppe_erweitert.png?width=90% "Rufgruppe - Erweiterte Funktionen")


|Parameter| Bedeutung|
|----------|----------|
|Timeout extern |Wie lange sollen externe Anrufer maximal in der Rufgruppe bleiben (Sekunden). Nach diesem Timeout geht der Anruf weiter in die Aktionen **Extern/Nachher** mit dem **Ruf status** *Timeout*.|
|Timeout intern|Wie lange sollen interne Anrufer maximal in der Rufgruppe bleiben (Sekunden). Nach diesem Timeout geht der Anruf weiter in die Aktionen  Intern/Nachher mit dem **Ruf status** *Timeout*.|
|Voicemail Pin|Pin für die Voicemailbox. Details zum Konzept siehe Voicemailbox.|
|Voicemails speichern|Wählen Sie ob Voicemails auf der Festplatte gespeichert werden sollen. Details zum Konzept siehe Voicemailbox.|
|Voicemail Email|Tragen Sie die Email ein an die Voicemails für diese Team gesendet werden sollen. Details zum Konzept siehe Voicemailbox.|


##### Mitglieder
![Screenshot - Mitglieder einer Rufgruppe](../../images/team_rufgruppe_mitglieder.png?width=90% "Rufgruppenmitglieder")

Weisen Sie hier der Gruppe Mitglieder zu.  Durch die Auf- und Abpfeile können Sie die Reihenfolge der Mitglieder ändern auch dies ist für manche  Rufstrategien von Bedeutung.

#### Rollen
Definiert in welchen Rollen das jeweilige Team Mitglied ist. Siehe Rollen für Details.

#### Aktionen (intern, extern, voher, nachher)

Mit Aktionen steuern Sie den Anruf Ablauf. Details siehe Aktionen.

### Team von Typ Warteschlange verwalten

Wählen Sie hierzu in der mobydick Weboberfläche unter **Benutzer > Teams** den Button `+Hinzufügen` um ein neues Team zu erstellen oder markieren Sie eine bereits vorhandenes Team und wählen `Bearbeiten`.
Beim Hinzufügen selektieren Sie den **Typ Warteschlange** und geben Sie eine **Bezeichnung** sowie die Durchwahl unter der das Team erreichbar sein soll ein.

#### Basisdaten
![Screenshot - Warteschlangen verwalten](../../images/team_warteschlangen_basics.png?width=90% "Warteschlangen verwalten in der mobydick")

|Parameter| Bedeutung|
|----------|----------|
|Bezeichnung|Name des Teams|
|Durchwahl| Unter welcher Durchwahl ist das Team erreichbar|
|Rufstrategie|Nach welcher Strategie sollen die Mitglieder gerufen werden|
|Pickup Benachrichtigungen|Hier kann man festlegen, wer alles Pickup Benachrichtigungen einer Rufgruppe sieht. Mehr dazu unter: Pickup Benachrichtigungen|
|Anzeigetext|Dieser Text wird dem Mitglied auf seinem Telefon-Display vor dem Namen und der Nummer des Anrufenden angezeigt. Somit kann das Mitglied nachvollziehen das es sich nicht um einen direkten Anruf sondern einen Anruf über das Team "SP" handelt|
|Wartemusik|Welche Wartemusik Playliste soll abgespielt werden. Wählen Sie - Freizeichen - wenn Sie nicht möchten, dass der Kanal beantwortet wird sondern der Anrufer ein Freizeichen erhält. Dies mach natürlich nur sinn wenn Sie nicht bereits in den Aktionen den Kanal beantwortet haben um z.B. eine Begrüßung abzuspielen.|
|Mitglied-Timeout|Wie lange soll mobydick versuchen das einzelne Mitglied zu erreichen (in Sekunden). Z.B. bei Rufstrategie nacheinander wird das erste Mitglied ausgewählt und dessen Telefon läutet. Nach dem Timeout (hier 15 Sekunden) hört das Telefon auf zu läuten, der Anrufer wird wieder in dei Warteschleife zurückgezogen. Das System ermittelt nun das nächste Mitglied in der Reihe und versucht dieses, wiederum für 15 Sekunden, zu erreichen, usw...|
|Maximal Anzahl Wartende|Bestimmt wie viele Wartenden sich maximal in der Warteschleife befinden dürfen. Kommt im Beispiel ein sechster Anrufer herein wird dieser nicht in der Warteschleife warten sonder direkt in die Aktionen Nachher vermittelt.|
|Call Completed Elsewhere senden|Sobald ein Anruf in der Warteschlange durch einen Mitglied angenommen wird, erhalten die noch freien Teammitglieder einen Hinweis. So wissen die Mitglieder, dass der Anruf angenommen wurde.|

#### Erweitert
![Screenshot - Warteschlangen erweiterte Funktionen](../../images/team_warteschlangen_advanced.png?width=90% "Warteschlangen mit erweiterten Funktionen")

|Parameter| Bedeutung|
|----------|----------|
|Einbuchcode|Mit diesem Code gefolgt von seiner Durchwahl kann sich ein Benutzer, der dynamisches Mitglied in diesem Team ist, an- und abmelden. Siehe Benutzer dynamisch an- und abmelden.|
|Timeout extern |Wie lange sollen externe Anrufer maximal in der Warteschlange bleiben (Sekunden). Nach diesem Timeout geht der Anruf weiter in die Aktionen **Extern/Nachher** mit dem **Ruf status** *Timeout*.|
Timeout intern|	Wie lange sollen interne Anrufer maximal in der Warteschlange bleiben (Sekunden). Nach diesem Timeout geht der Anruf weiter in die Aktionen  **Intern/Nachher** mit dem Ruf status *Timeout*.|
|Kanal beantworten|	Normalerweise wird der Kanal sofort beantwortet falls Wartemusik oder eine Ansage abgespielt werden soll. Dies kann man hier verzögern (in Millisekunden). Bei manchen Anrufern kommt es vor, dass bei einer sofortigen Beantwortung die erste Silbe der Ansage "verschluckt" wird. Durch eine Verzögerung kann dies vermieden werden.|
|Gewichtung	|Warteschlangen können ein unterschiedliches Gewicht haben. Desto schwerer desto wichtiger. Als Gewicht können Sei eine beliebige Zahl eintragen. Siehe Warteschlangen gewichten|
|Ansage-Frequenz|	Tragen Sie hier ein in welchen Abständen (Sekunden) der Anrufer über seine Position und Wartezeit in der Warteschleife informiert werden soll. Lassen Sie dieses Feld leer wir der Anrufer keine derartigen Ansagen hören.|
|Optionen|Hier können Sie alle Optionen eintragen die Asterisk für Warteschleifen kennt. Eine Option pro Zeile. Siehe http://www.voip-info.org/wiki/view/Asterisk+config+queues.conf|
|Betreten wenn leer|	Regelt ob Anrufer die Warteschlange betreten können obwohl diese leer ist. Verwendet man ausschließlich dyn. Mitglieder kann es sein, dass alle Mitglieder ausgebucht sind. Wählen Sie hier *nein* werden Anrufer in dieser Situation direkt in die Aktionen **Nachher** mit dem **Ruf status** *Beitritt bei leer* weitergeleitet.|
|Verlassen wenn leer|	Regelt ob Anrufer die Warteschlange automatisch verlassen sobald diese leer ist. Verwendet man ausschließlich dyn. Mitglieder kann es sein, dass sich das letzte Mitglieder ausgebucht während noch ein Anrufer wartet. Wählen Sie hier ja werden Anrufer in dieser Situation direkt in die Aktionen  **Nachher** mit dem **Ruf status** *Verlassen bei leer* weitergeleitet.|
|Voicemail Pin|	Pin für die Voicemailbox. Details zum Konzept siehe Voicemailbox.|
|Voicemails speichern|	Wählen Sie ob Voicemails auf der Festplatte gespeichert werden sollen. Details zum Konzept siehe Voicemailbox.|
|Voicemail Email	|Tragen Sie die Email ein an die Voicemails für diese Team gesendet werden sollen. Details zum Konzept siehe Voicemailbox.|

#### Mitglieder

![Screenshot - Mitglieder einer Warteschlange](../../images/team_warteschlangen_mitglieder.png?width=90% "Warteschlangenmitglieder")

Weisen Sie hier der Warteschlange Mitglieder zu. Durch **Flexibel** *ja* markieren Sie dieses Mitglied als dynamisch. Mitglieder mit **Flexibel** *nein* werden immer gerufen und können sich nicht ausbuchen. Manche Rufstrategien berücksichtigen die Priorität eines Mitgliedes. Durch die Auf- und Abpfeile können Sie die Reihenfolge der Mitglieder ändern auch dies ist für manche Rufstrategien von Bedeutung.

#### Rollen

Definiert in welchen Rollen das jeweilige Team Mitglied ist. Siehe Rollen für Details.

#### Aktionen (intern, extern, voher, nachher)

Mit Aktionen steuern Sie den Anruf Ablauf. Details siehe Aktionen.

#### Dynamisch an- und abmelden

mobydick bietet den Benutzern die Möglichkeit sich dynamisch an Warteschlagen an- und abzumelden. Vorraussetzung hierfür ist, dass der Benutzer als flexiebles Mitglied bei der Warteschleife hinterlegt ist. Dies stellen Sie im Reiter **Tab Mitglieder** unter **Zugewiesene Benutzer** -> **Flexibel** *Ja* ein.

Ist für die Warteschlange ein Einbuchcode *(Warteschlange -> Tab Erweitert -> Einbuchcode)* hinterlegt kann sich ein Benutzer,  der dynamisches Mitglied in diesem Team ist, an dieser an- und abmelden.

Wenn Sie als Einbuchcode z.B. \***80** eintragen kann sich Peter, der die Durchwahl **21** hat durch Wählen von \***8021** an diesem Team an- und abmelden. **Alternativ** können Sie sich immer, egal ob etwas im Einbuchcode eingetragen ist oder nicht, per **Systemdurchwahl** \***99Warteschlangendurchwahl#Benutzerdurchwahl** an- und abmelden. Z.B. \***99800#21** wenn sich Peter mit der Durchwahl **21** an der Warteschleife mit der Durchwahl **800** anmelden möchte.

Der Vorteil des Einbuchcodes im Gegensatz zur Systemdurchwahl ist, dass Sie den Einbuchcode auch auf die **LED-Nebenstellentaste** eines IP-Telefones legen können. Somit leuchtet die **LED** wenn der Benutzer in der Warteschlange angemeldet ist und erlischt sobald sich dieser abmeldet.

Alternativ kann sich ein Benutzer auch per mobydick Client in der Team Anzeige durch das + und - Symbol an einem Warteschlangen Team ab- und anmelden:

Auch besteht die Möglichkeit einen Benutzer aus allen Warteschleifen, in den er Mitglied ist, auf einmal an- und abzumelden. Dazu gibt es den TastenCode \***99#Benutzerdurchwahl**.
![Screenshot - Dynamisch an- und abmelden](../../images/team_einbuchen.png?width=30% "Dynamisch an- und abmelden in Warteschlagen")

#### Pausieren und Pausengründe

Statt sich an- und abzumelden ist es auch möglich als Mitglied einer Warteschlange zu pausieren. In dieser Zeit bleiben Sie an der Warteschlange angemeldet erhalten aber keine Anrufe. Zusätzlich können in der mobydick Weboberfläche unter dem Menüpunkt **Erweitert > Pausengründe** Pausengründe definiert werden.

![Screenshot - Pausengründe verwalten](../../images/team_pause_list.png?width=90% "Pausengründe der Warteschlagen verwalten")


|Parameter| Bedeutung|
|----------|----------|
|Bezeichnung|	Die Bezeichnung wird im mobydick Client als Pausengrund angezeigt|
|Kennung|Mit der Kennung kann man die Pause pro Mitglied per TastenCode am Telefon aktivieren/deaktivieren.**99Warteschlangendurchwahl#Benutzerdurchwahl#PausengrundKennung**. |

Pausiert ein Mitglied in der Warteschleife kann das von den anderen Mitgliedern incl. Pausengrund im mobydick Client gesehen werden:
![Screenshot - Pause aktivieren im mobydick Client](../../images/team_pause.png?width=90% " Pause aktivieren im mobydick Client")

Das Pausieren kann im mobydick Client in der Team Anzeige durch das Pausensymbol gesteuert werden:
![Screenshot - Pausengründe im mobydick Client](../../images/team_pause_detail.png?width=30% " Pausengründe im mobydick Client")

Alternativ lassen Sich die Pausengründe pro Mitglied auch per Tastencode-Eingabe am Telefon steuern.
Der Tastencode setzt sich wie folgt zusammen: \***99Warteschlangendurchwahl#Benutzerdurchwahl#PausengrundKennung**

### Pickup Benachrichtigungen

In einem Team ist es möglich einzustellen, welche Benutzer im mobydick Client Pickup Benachrichtigungen über eingehende Rufe erhalten.

Zuerst muss eine Pickup-Rolle definiert werden. Diese kann als Mitglieder ein Team haben und auch einzelne Benutzer, die nicht zum Team gehören. Informationen zu Rollen finden Sie unter: Konzept: Rollen.

Anschließend können Sie im Team, das zur angelegten Pickup-Rolle gehört festlegen wer Banchrichtigugnen erhält:
![Screenshot - PPickup Benachrichtigungen](../../images/team_pickup_hinweis.png?width=90% " Pickup Benachrichtigungen")

Folgende Einstellungen sind möglich:

|Parameter| Bedeutung|
|----------|----------|
|Niemand|Niemand erhält Benachrichtigungen|
|Verfügbare Agenten und Nichtmitglieder|Agenten die im Team angemeldet sind und Agenten die Nichtmitglieder im Team sind erhalten eine Benachrichtigung. Flexible Agenten die gerade nicht im Team angemeldet sind und pausierte Agenten erhalten keine Benachrichtigung.|
|Nicht verfügbare Agenten und Nichtmitglieder|Agenten die nicht im Team angemeldet sind, Agenten die pausiert sind und Nichtmitglieder des Teams erhalten eine Benachrichtigung. Agenten die feste Mitglieder des Teams sind und flexible Agenten die gerade angemeldet sind erhalten keine Benachrichtigungen.|
|Nur Nichtmitglieder|Nur Nichtmitglieder des Teams erhalten eine Benachrichtigung.|
|Gesamte Pickup-Gruppe|Die gesamte Pickup-Gruppe bekommt Benachrichtigungen.|

## Rollen und damit verbundene Rechte

### Übersicht
Benutzer, Geräte, Arbeitsplätze oder Teams können Mitglieder in einer oder mehreren Rollen sein. Der Rolle selbst können Eigenschaften und Rechte zugeteilt werden.

Rollen steuern "Telefonie-Relevante" Eigenschaften und Rechte wie beispielsweise die Erlaubnis Gespräche anderer Benutzer heranzuholen, usw. und können außerdem nicht nur Benutzer sondern auch Geräte, Arbeitsplätze oder Teams als Mitglieder enthalten.

### Spezielle Rolle "Alle"
Es gibt eine spezielle Rolle mit dem Namen **All Users**. Diese Rolle ist standardmäßig allen Benutzern, Geräten, Arbeitsplätzen und Teams zugeteilt und kann auch nicht entzogen werden.

### Abteilungsweise Rollen erstellen
Ein häufiger Anwendungsfall (und unsere Empfehlung) ist es, dass man pro Abteilung oder Team eine Rolle erstellet. Z. B. ist es häufig gewünscht, dass Benutzer nur innerhalb Ihrer Abteilung Gespräche heranholen können und sich gegenseitig im mobydick Client sehen. Dazu entziehen Sie einfach der Rolle "Alle" die Eigenschaft xmpp.group und weisen dies einer neuen Rolle z. B. Support zu in der Sie dann alle Support Benutzer zu Mitgliedern machen.  

### Eigenschaften und Rechte
#### location.group
In dieser Rolle können Benutzer und Arbeitsplätze hinzugefügt werden. An Arbeitsplätzen die einer Rolle mit dem Typ location.group angehören können sich nur Benutzer anmelden, die der selber Rolle angehören. Zu Beachten ist, dass sobald eine Rolle mit der Eigenschaft location.group erstellt wurde, für alle Benutzer und Arbeitsplätze eine solche Rolle existieren muss. Sonst können sich Benutzer ohne diese Rolle an keinem Arbeitsplatz anmelden.

Auswirkung: Benutzer, Arbeitsplätze

#### billing.group
Abrechnungsgruppe des Billing Moduls. Dient zur Gruppierung der Gesprächsdaten.

Auswirkung: Benutzer, Rufgruppen, Warteschlangen

#### xmpp.supervisor
Benutzer mit dieser Rolle können Gespräche aller Benutzer managen. Wichtig für Flexpanel und TAPI.

Auswirkung: Benutzer

#### pickup.group
Alle direkten Mitglieder der Rolle haben das Recht, eingehende Anrufe die an ein anderes Mitglied der Gruppe gerichtet sind, heranzuholen. Dies kann dann entweder per Telefon * \*8<durchwahl> oder Client erfolgen.

Auswirkung: Benutzer, Teams

#### redirect.choice
Eine Identität mit diesem Rollentyp wird nie von einer anlagenbasierten Rufumleitung umgeleitet, sondern ruft immer das direkte Ziel.

Auswirkung: Benutzer

#### redirect.group
Definition einer Anlagenbasierte Rufumleitungen und Rufumleitungsgruppen.

Auswirkung: Benutzer

#### xmpp.group
Alle Identitäten die eine Rolle mit dem Rollentyp xmpp.group zugewiesen haben, werden in eine XMPP shared Group eingebunden. D.H. in den Kontaktliste der Clients müssen sich diese Personen nicht mehr gegenseitig hinzufügen sondern sind sofort sichtbar. Falls Sie die xmpp.group der Rolle Alle Identitäten zuordnen, sieht im Client immer jeder jeden.

Auswirkung: Benutzer
