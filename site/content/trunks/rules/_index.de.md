---
title: Rufregeln
description: Mit Hilfe von Rufregeln steuern Sie welche Durchwahlen über ein Amt erreichbar sind bzw. wer über diese Amt hinaustelefonieren kann. Rufregeln werden von unseren Amtsvorlagen automatisch erstellt und können angepasst werden.
weight: 20
---

{{< doctype "both"  >}}

{{< description >}}

Auf der pascom unterscheidet man Rufregeln für eingehende und ausgehende Rufe.

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


## Eingehende Rufe

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

## Ausgehende Rufe

|Einstellung|Beschreibung|
|---|---|
|**Bezeichung**|Jede Regel braucht einen eigenen Namen.|
|**Im Client anzeigen**|Benutzen Sie mehrer Amtsholungen, können Sie entscheiden, ob diese im Desktop Client angezeigt werden sollen oder nicht. Stehen im Client keine Amtsholungen zur Auswahl, wird immer die Standardamtsholung verwendet|
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

## Manuelle Ermittlung des Rufnummernformats

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


## Rufregeln bearbeiten

In vielen Fällen macht es Sinn in Rufregeln keine konkreten Nummern sondern Platzhalter zu verwenden, z. B. um nicht für jede Durchwahl auf der pascom eine Regel zu erstellen, sondern wenn möglich Durchwahlen zu einer Regel zusammenzufassen.  
Platzhalter werden durch einen Unterstrich (\_) eingeleitet.

*Beispiel:  
 Soll eine Rufregel auf alle zweistelligen internen Nebenstellen matchen wird der Platzhalter X verwendet: _XX*

 pascom kennt folgende Platzhalter:

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
**Regelgültigkeit** (Bestmatch)<br><br>
Regeln werden nach der Genauigkeit ihrer Übereinstimmung und nicht nach der Reihenfolge in der Tabelle angewendet. Wenn ein Ruf die Kriterien mehrerer Regeln erfüllt, dann wird diejenige angewendet, deren Vorgaben die Merkmale des Rufes am eindeutigsten beschreiben. Eine Regel mit eng eingegrenzten Kriterien hat daher Vorrang vor einer allgemeineren Regel, die eher unspezifisch verfasst ist. Da die Reihenfolge in der Liste keine Bedeutung hat, sind nachträgliche Anpassungen leicht möglich.<br><br>Die Reihenfolge für Bestmatch wird wie folgt geprüft: 1. In-Prefix => 2. Quelle => 3. Ziel.
{{% /notice %}}

Neben Platzhaltern können in Regeln auch Variablen verwendet werden. Die wichtigsten Variablen sind:

* **${CALLERID(num)}** die eigene Nummer des Anrufers
* **${EXTEN}** ist die ursprünglich vom Anrufer gewählte Nummer

Beispielsweise soll die CIDNummer für jeden ausgehenden Anruf auf die Nebenstelle des Anrufers gesetzt werden. Hierfür könnten Sie natürlich für jeden internen Teilnehmer eine eigene Regel erstellen. Einfach ist es jedoch die Variable **${CALLERID(num)}** zu verwenden:  
Der Anrufer hat die interne Durchwahl 11, und in der ausgehenden Rufregel ist 099112345${CALLERID(num)} hinterlegt. Somit wird dem Angerufenen die Nummer 09911234511 signalisiert.

Die Variable **${EXTEN}** beinhaltet immer die komplette vom Anrufer gewählte Nummer. Wählt ein externen Teilnehmer beispielsweise die Nummer 09911234511 um von extern die Nebenstelle 11 zu erreichen ist die komplette Nummer in der Variable gespeichert. Evtl. möchten Sie alle eingehenden Anrufe welche eine zweistellige Durchwahl wählen auf die entsprechende interne Rufnummer verbinden. In unsrem Beispiel wären Sie also nur an der 11 in 09911234511 interessiert.
pascom bietet hier eine einfache Möglichkeit Variablen zu beschneiden. Eine Variable wird aufgebaut wie folgt:

**${VARIABLENNAME:Offset:Länge}**

* VARIABLENNAME: Der Name der Variable, z. B. *EXTEN*
* Offset: Gibt an wie viele Stellen übersprungen werden sollen bevor Zeichen ausgeschnitten werden. Ist der Offset negativ, dann wird von hinten eingesprungen. Den Offset kann man sich wie einen Cursor vorstellen der in der Variable hin- und hergeschoben wird
* Länge: Gibt an wie viele Zeichen ausgeschnitten werden sollen. Macht man hier keine Angabe wird einfach bis zum Ende der Variable geschnitten.

Um in unserem vorherigen Beispiel die 11 aus 09911234511 zu entnehmen, kann man **${EXTEN:9:2}** angeben.
Der Cursor springt zuerst neun Stellen in die Variable und schneidet dann zwei Stellen, also die 11 aus. Nutzt man **${EXTEN:9}** passiert das Selbe, da beim Weglassen der Länge automatisch bis zum Ende der Variable geschnitten wird. Am Einfachsten kann man **${EXTEN:-2}** angeben. Der Cursor springt in die Variable zwei Stellen von hinten vor die 11 und schneidet diese, da keine Länge angegeben ist, bis an das Ende der Variable aus.


## Clip no screening

**CLIP no screening** ist ein Leistungsmerkmal für ausgehende Rufe, welches es ermöglicht eine Rufnummer zu übermittlen, die nicht zum eigenen Telefonanschluss gehört. In der pascom wird es z. B.  benutzt um bei einer Rufumleitung nach extern (z. B. auf ein Mobiltelefon) die Nummer des ursprünglichen Anrufers zu signalisieren.

{{% notice info %}}
Möchten Sie diese *Clip no screening* nutzen, informieren Sie sich bitte bei Ihrem Telefonanbieter ob diese Funktion für Sie freigeschaltet ist oder werden kann.
{{% /notice %}}

Anschließend muss hierfür eine *ausgehende Regel* konfiguriert werden:

|Bespiel-Einstellung||Beschreibung|
|---|---|---|
|**Quelle**|\_XXXXX.|Die Quelle die anruft hat mindestens 5 Stellen, kann also keine interne Durchwahl sein.|
|**CIDNummer**|${CALLERID(num)}|Das ist die Nummer des ursprünglichen Anrufers|
