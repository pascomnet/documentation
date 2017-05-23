---
title: Ämter konfigurieren
weight: 11
toc: true
prev: /aemter/
url:  /aemter/aemter-konfigurieren/

---

## Konzept

Damit man mit der mobydick nicht nur mit den internen Nebenstellen kommunizieren kann benötigt man ein Amt um mit der "Außenwelt" telefonieren zu können.
Es gibt folgende Arten von Ämtern:

|Amt| Beschreibung|
|---|---|
|**IP-basiert**|IP-basierte Ämter (SIP-Ämter) können ohne weitere Vorbereitung angelegt werden.|
|**ISDN**|Ein ISDN-Amt benötigt zur Anbindung ein Gateway (z. B. von Beronet oder Patton, siehe Artikel über ISDN- und Analog-Gateways)|
|IAX|Das *InterAsterisk-eXchange*-Protokoll wird verwendet, um zwei Asterisk-Server miteinander zu verbinden.|
|Analog|Ein Analog-Amt benötigt zur Anbindung ein Gateway (z. B. von Beronet oder Patton, siehe Artikel über ISDN- und Analog-Gateways). Analoge Ämter sind im deutschsprachigen Raum nicht üblich.|

Um überhaupt telefonische Verbindungen zu ermöglichen benötigt ein Amt Rufregeln. Verwenden Sie mehrere Ämter, so verwaltet jedes Amt seine eigenen Rufregeln. Es müssen für jedes Amt eingehende und ausgehende Rufregeln angelegt werden.

**Rufregeln** sind eine Art "Firewall" und können z. B.

* von extern erreichbare Rufnummern auf internen Durchwahlen (z. B. Benutzer oder Teams) abwerfen,
* festlegen, welche Nummern in bestimmten Fällen bei Anrufen nach extern signalisiert werden,
* festlegen, ob Benutzer bestimmte Nummern angerufen dürfen oder nicht,
* und vieles mehr.

## Konfiguration

### Amtsvorlagen

Fügen Sie ein neues Amt ein unter `Gateways` > `Ämter` > `Hinzufügen`. Sie gelangen nun zur Ämter-Datenbank. Hier finden Sie Vorlagen für alle von mobydick unterstützten und von uns getesten Ämter.  
Über den Filter können Sie direkt nach Ihrem Amt suchen und anschließend auswählen. Befüllen Sie die Vorlage mit Ihren Daten, die Sie von Ihrem Telefonanbieter erhalten haben.  
Da verschiedene Ämter-Typen unterschiedliche Variablen benötigen finden Sie im folgendem eine Übersicht:

|Variable|Erklärung|
|---|---|
|**Bezeichung**|Geben Sie Ihrem Amt einen Namen, dieser taucht dann in der Ämterliste auf|
|**Internationale Vorwahl**|Die Ziffer die vorangestellt werden muss um im Festnetz eine internationale Nummer (Ausland) zu erreichen. Im Normalfall ist das die *00*.|
|**Nationale Vorwahl**|Die Ziffer die vorangestellt werden muss um im Festnetz eine nationale Nummer (Nummer mit Ortsvorwahl) zu erreichen. Im Normalfall ist das die *0*.|
|**Länderkennung**|Geben Sie hier die Landeskennzahl für das Land an in dem sich das Amt befindet. Für Deutschland z. B. 49. Durch die IP-Ämter ist es möglich, dass sich die mobydick zwar in Deutschland befindet jedoch über das Internet ein Amt in der Schweiz nutzt. Geben Sie hier immer die Landeskennzahl an in dem sich das Amt befindet, nicht den Standort der Anlage.|
|**Ortskennzahl**|Tragen Sie die Ortskennzahl bzw. Ortsvorwahl ohne führende 0 ein. Für München z. B. 89 statt 089.|
|**Stammnummer**|Das ist die Basisnummer Ihres Telefonanschusses.|
|**Präfix eing. Nummer**|Ist eine beliebige Ziffer, die bei eingehenden Telefonanrufen über dieses Amt vorangestellt wird. Wenn Sie hier eine 0 eingeben erscheint beispielsweise in der Anruferliste von IP-Telefonen dann nicht die 0172123123 sondern die 00172123123. Dadurch können Sie direkt aus der Anruferliste wieder über das selbe Amt zurückrufen.|
|**Anzahl der Durchwahlstellen**|Anzahl der Stellen der Benutzer-Durchwahlen. (NICHT die Anzahl der Nummern im Rufnummernblock!)|
|**Durchwahl der Zentrale**|Geben Sie hier an, auf welche interne Durchwahl die erste Nummer Ihres Rufnummernblocks (meistens die 0) abgeworfen werden soll.|
|**Telefonbuchabfrage**|Wählen Sie hier **Ja** wird die mobydick versuchen jeden eingehenden Anruf über dieses Amt im zentralen Telefonbuch aufzulösen und bei Erfolg den Namen des Anrufers im Telefondisplay präsentieren. Dies gilt nur für IP-Endgeräte.|
|**Fallback Durchwahl**|Falls für eine Durchwahl die angerufen wird keine Rufregel existiert, wird der Anrufer auf diese Durchwahl abgeworfen.|
|**Skript ausgehende Regel**|Diese Einstellung kann für ausgehende Rufe ein Skript einbinden.|

|Variablen beim SIP-Amt|Erklärung|
|---|---|
|**Benutzername**|Der Benutzername wird je nach Amt-Typ dazu verwendet um sich damit entweder<br> * an der Gegenstelle (der Host) zu registrieren (Typ: *User*)<br> * oder ist der Name mit dem sich eine Gegenstelle bei der mobydick registriert (Typ *Peer*).<br>Wird der Typ auf *Friend* gesetzt werden zwei Datensätze angelegt und das Passwort wird sowohl für User und Peer genutzt.|
|**Passwort**|Ist, falls benötigt, das zum Benutzer gehörende Passwort.|
|**Host**|Hier tragen Sie die IP-Adresse oder den Hostnamen der Gegenstelle, an der sich der Account registrieren muss.|
|**Optionen**|Dieses Feld bietet die Möglichkeit weitere SIP-Optionen (eine Option pro Zeile), die von Asterisk verstanden werden, anzugeben. Einen Überblick über SIP-Optionen finden Sie hier: [SIP Configurations - peers and clients](http://www.voip-info.org/wiki/view/Asterisk+config+sip.conf#SIPconfigurationspeersandclients)|
|**Typ**|Analog zu Asterisk kennt mobydick mehrere Typen von SIP-Verbindungen. Diese werden unter [Asterisk sip type](http://www.voip-info.org/wiki/view/Asterisk+sip+type) genauer beschrieben.|
|**Registrierung**|Wählen Sie *Ja* oder *Nein*, je nachdem ob sich die mobydick beim Host anmelden muss oder nicht.|
|**Port**|Als Standard wird der Port *5060* verwendet. Soll ein anderer verwendet werden, können Sie diesen hier eintragen.|
|**Durchwahl reg.**|Hier teilen Sie dem Host mit welche Durchwahl ein eingehender Anruf auf Ihrer Seite rufen soll. Dies ist notwendig wenn der Benutzer-SIP-Account genau eine Nummer zur Verfügung stellt. Nutzen Sie jedoch einen SIP-Anlagenanschluss (z. B: sipgate trunking) geben Sie hier nichts an da die gerufene Durchwahl jeweils separat übermittelt wird.|
|**Ext. aus Header**|Standardmäßig wird die Zielrufnummer aus dem SIP-INVITE ermittelt. Setzt man diese Option auf *ja* wird die Zielrufnummer alternativ aus dem SIP-Header gelesen. Dies wird häufig bei SIP-Anlagenanschlüssen benötigt.|
|**CLIP Modus**|*CLIP* ist ein Leistungsmerkmal, welches die Übermittlung von Rufnummern bei ausgehenden Rufen ermöglicht. Mögleiche Eintellungen:<br> * *Number*<br> * *Name+Number*<br> * *SIP Header*|
|**CLIR Modus**|*CLIR* ist ein Leistungsmerkmal, welches die Unterdrückung von Rufnummern bei ausgehenden Rufen ermöglicht. Mögliche Einstellungen:<br> *  *Name+Number*<br> * *SIP Header*|


### Rufregeln

Auf der mobydick unterscheidet man Rufregeln für eingehende und ausgehende Rufe.

* Die eingehenden Regeln werden für einkommende Anrufe verwendet. Sie legen fest, auf welche interne Durchwahl eine von extern erreichbare Rufnummer abgeworfen wird, z. B. bei welchem Benutzer oder bei welchem Team es klingeln soll.
* Mit ausgehenden Regeln legt man fest, welche Rufnummer dem Angerufenen signalisiert wenn man ihn mit einer bestimmten Durchwahl anruft.

Beim Bearbeiten und Speichern einer Amtsvorlage werden bereits automatisch zwei eingehende und eine ausgehende Rufregel angelegt.

|eingehende|Rufregel|
|---|---|
|**Zentrale**|Diese Regel gilt für die erste Nummer im Rufnummern Block. In den meisten Fällen ist dies die Zentrale|
|**Durchwahl**|Diese Regeln gibt an, dass jede Durchwahl von extern direkt erreichbar ist.|

|ausgehende|Rufregel|
|---|---|
|**Standard**|Durch diese Regel wird beim Anruf nach extern die Rufnummer mit der Durchwahl des Anrufers signalisiert.|


#### Eingehende Rufe

|Einstellung|Beschreibung|
|---|---|
|**Bezeichung**|Jede Regel braucht einen eigenen Namen.|
|**Quelle**|Ist die Nummer des Anrufers. **\*** bedeutet diese Regel gilt für jeden Anrufer|
|**Ziel**|Das ist die Nummer die der Anrufer gewählt hat.|
|**Durchwahl**|Zeigt an, auf welche interne Durchwahl abgeworfen werden soll.|
|**Sprache**|Gibt z. B. an, in welcher Sprache der Anrufer mögliche Ansagen hören soll.|

<!--
|**CIDName**||
|**CIDNummer**||
-->


#### Ausgehende Rufe

|Einstellung|Beschreibung|
|---|---|
|**Bezeichung**|Jede Regel braucht einen eigenen Namen.|
|**Im Client anzeigen**|Benutzen Sie mehrer Amtsholungen, können Sie entscheiden, ob diese im mobydick Client angezeigt werden sollen oder nicht. Stehen im Client keine Amtsholungen zur Auswahl, wird immer die Standardamtsholung verwendet|
|**In-Prefix**|Der In-Prefix (auch Amtsholung genannt) bestimmt welche Ziffer vom internen Teilnehmer vorgewählt werden muss damit diese Regel generell zum Tragen kommt. Bei dem ausgehenden Anruf wird der In-Prefix abgeschnitten und nicht mitgewählt.|
|**Quelle**|Definiert für welche interne Nebenstelle diese Regel gültig ist. **\*** bedeutet diese Regel gilt für alle internen Durchwahlen.|
|**Ziel**|Hier wird defininiert für welches Ziel (die nach extern gewählte Nummer) gültig ist. **\*** bedeutet diese Regel gilt für jedes Ziel.|
|**CIDNummer**|Diese Nummer wird dem Angerufenen signalisert.|
|**Out-Prefix**|Dieser Prefix kann einer angerufenen Nummer beim Anruf vorangestellt werden.|
|**Verbieten**|Wenn eine Regeln explizit verboten werden soll, kann dieser Wert auf *Ja* gesetzt werden, z. B. wenn nicht ins Ausland telefoniert werden darf.<br>Als Defaultwert ist jede Regel beim Anlegen erlaubt.|
|**PIN**|Hier kann für die Verwendung der Regel eine PIN eintragen werden. Der Anrufer wird dann aufgefordert die PIN einzugeben, bevor der Anruf stattfindet.|
|**Übertragungskapazität**|Zur Auswahl stehen hier *Sprache*, *Fax* und *Video*|
|**Account**|Falls Sie in Ihrem Amt mehrer Accounts angelegt haben, können Sie hier wählen, über welchen Account der ausgehende Anruf gehen soll.|

{{% notice info %}}
Verwenden Sie mehrere Ämter, die die gleiche ausgehende Rufregeln haben, müssen Sie diese durch verschiede In-Prefixe unterscheiden.<br>Es ist nicht zu empfehlen Rufregeln mit und ohne In-Prefix zu verwenden (also Mischbetrieb), da dies zu Problemen führen kann.
{{% /notice %}}

#### Manuelle Ermittlung des Rufnummernformats

Leider übertragen nicht alle Provider  die angerufenen Rufnummern gleich. Das erkennen Sie wenn

* bei eingehenen Rufen, wenn das Telefon nicht bei der gewünschten Nebenstelle klingelt.
* bei ausgehenden Rufen, wenn dem Angerufenen nicht die gewünschte Nummer signalisiert wird.

**Eingehende Rufe:**  
Wenn Sie herausfinden wollen was der Provider in Ihrem Fall konkret überträgt, tragen Sie in Quelle und Ziel Ihrer Regel einfach jeweils einen * ein. Damit werden alle Rufe akzeptiert. Loggen Sie sich anschließend auf der Asterisk-CLI ein und starten einen eingehenden Anruf. Sobald Sie eine Ausgabe sehen, können Sie wieder auflegen. Es erscheinen viele Debug-Zeilen. Brechen Sie die Asterisk-CLI durch mit *CTRL+C* ab und scrollen Sie nach oben. Dort finden Sie, relativ weit oben, folgende Zeilen:

    Verbose("SIP/0991270060-00001cda", "1,destination 0991123456789 is determined")
    ...
    Verbose("SIP/0991270060-00001cda", "1,callee number: 0170123456789")

Unter *destination* können Sie das Ziel ablesen und unter *callee number* die Quelle.

**Ausgehende Rufe**  
Falls Sie von Ihrem Provider keine Informationen über die Signalisierung erhalten, müssen Sie verschieden Formate ausprobieren. Mögliche Formate sind (z. B. mit Länderkennzahl: 0049; Ortsvorwahl: 0991; Stammnummer: 12345; Durchwahl: 60):

* +499911234560
* 00499911234560
* 499911234560
* 9911234560
* 09911234560
* 1234560
* 60


#### Rufregeln bearbeiten

In vielen Fällen macht es Sinn in Rufregeln keine konkreten Nummern sondern Platzhalter zu verwenden, z. B. um nicht für jede Durchwahl auf der mobydick eine Regel zu erstellen, sondern wenn möglich Durchwahlen zu einer Regel zusammenzufassen.  
Platzhalter werden durch einen Unterstrich eingeleitet.

*Beispiel:  
 Soll eine Rufregel auf alle zweistelligen internen Nebenstellen matchen wird der Platzhalter X verwendet: _XX*

 mobydick kennt folgende Platzhalter:

|Platzhalter|Beschreibung|Beispiel|
|---|---|---|
|**X**|einstellige Zahl von 0 bis 9|_3X entspricht den Nummern 30 bis 39|
|**Z**|einstellige natürliche Zahl von 1 bis 9||
|**N**|einstellige Zahl von 2 bis 9||
|**.**|zeigt an, dass beliebig viele Zahlen folgen können|_0X. entspricht allen Nummern, die mit der Zahl 0 beginnen|
|**[a-b]**|einstelliges numerisches Intervall|_3[1-5] entspricht den Zahlen 31 bis 35|
|**\***|beliebige Zahlen- oder Zeichenfolgen||
|**a\|b**|Oder-Verknüpfung||

{{% notice note %}}
**Regelgültigkeit** (Bestmatch)<br>
Regeln werden nach der Genauigkeit ihrer Übereinstimmung und nicht nach der Reihenfolge in der Tabelle angewendet. Wenn ein Ruf die Kriterien mehrerer Regeln erfüllt, dann wird diejenige angewendet, deren Vorgaben die Merkmale des Rufes am eindeutigsten beschreiben. Eine Regel mit eng eingegrenzten Kriterien hat daher Vorrang vor einer allgemeineren Regel, die eher unspezifisch verfasst ist. Da die Reihenfolge in der Liste keine Bedeutung hat, sind nachträgliche Anpassungen leicht möglich.<br>Die Reihenfolge für Bestmatch wird in folgender Reihenfolge geprüft: 1) In-Prefix > 2) Quelle > 3) Ziel.
{{% /notice %}}

Neben Platzhaltern können in Regeln auch Variablen verwendet werden. Die wichtigsten Variablen sind:

* **${CALLERID(num)}** die eigene Nummer des Anrufers
* **${EXTEN}** ist die ursprünglich vom Anrufer gewählte Nummer

Beispielsweise soll die CIDNummer für jeden ausgehenden Anruf auf die Nebenstelle des Anrufers gesetzt werden. Hierfür könnten Sie natürlich für jeden internen Teilnehmer eine eigene Regel erstellen. Einfach ist es jedoch die Variable **${CALLERID(num)}** zu verwenden:  
Der Anrufer hat die interne Durchwahl 11, und in der ausgehenden Rufregel ist 099112345${CALLERID(num)} hinterlegt. Somit wird dem Angerufenen die Nummer 09911234511 signalisiert.

Die Variable **${EXTEN}** beinhaltet immer die komplette vom Anrufer gewählte Nummer. Wählt ein externen Teilnehmer beispielsweise die Nummer 09911234511 um von extern die Nebenstelle 11 zu erreichen ist die komplette Nummer in der Variable gespeichert. Evtl. möchten Sie alle eingehenden Anrufe welche eine zweistellige Durchwahl wählen auf die entsprechende interne Rufnummer verbinden. In unsrem Beispiel wären Sie also nur an der 11 in 09911234511 interessiert.
mobydick bietet hier eine einfache Möglichkeit Variablen zu beschneiden. Eine Variable wird aufgebaut wie folgt:

**${VARIABLENNAME:Offset:Länge}**

* VARIABLENNAME: Der Name der Variable, z. B. *EXTEN*
* Offset: Gibt an wie viele Stellen übersprungen werden sollen bevor Zeichen ausgeschnitten werden. Ist der Offset negativ, dann wird von hinten eingesprungen. Den Offset kann man sich wie einen Cursor vorstellen der in der Variable hin- und hergeschoben wird
* Länge: Gibt an wie viele Zeichen ausgeschnitten werden sollen. Macht man hier keine Angabe wird einfach bis zum Ende der Variable geschnitten.

Um in unserem vorherigen Beispiel die 11 aus 09911234511 zu entnehmen, kann man **${EXTEN:9:2}** angeben.
Der Cursor springt zuerst neun Stellen in die Variable und schneidet dann zwei Stellen, also die 11 aus. Nutzt man **${EXTEN:9}** passiert das Selbe, da beim Weglassen der Länge automatisch bis zum Ende der Variable geschnitten wird. Am Einfachsten kann man **${EXTEN:-2}** angeben. Der Cursor springt in die Variable zwei Stellen von hinten vor die 11 und schneidet diese, da keine Länge angegeben ist, bis an das Ende der Variable aus.


#### Clip no screening

**CLIP no screening** ist ein Leistungsmerkmal für ausgehende Rufe, welches es ermöglicht eine Rufnummer zu übermittlen, die nicht zum eigenen Telefonanschluss gehört. In der mobydick wird es z. B.  benutzt um bei einer Rufumleitung nach extern (z. B. auf ein Mobiltelefon) die Nummer des ursprünglichen Anrufers zu signalisieren.

{{% notice info %}}
Möchten Sie diese *Clip no screening* nutzen, informieren Sie sich bitte bei Ihrem Telefonanbieter ob diese Funktion für Sie freigeschaltet ist oder werden kann.
{{% /notice %}}

Anschließend muss hierfür eine *ausgehende Regel* konfiguriert werden:

|Bespiel-Einstellung||Beschreibung|
|---|---|---|
|**Quelle**|\_XXXXX.|Die Quelle die anruft hat mindestens 5 Stellen, kann also keine interne Durchwahl sein.|
|**CIDNummer**|${CALLERID(num)}|Das ist die Nummer des ursprünglichen Anrufers|
