---
title: Ämter konfigurieren
keywords:
description:
url:  /trunks/trunk-config/
weight: 11
next: /trunks/trunk-fallover
toc: true

---

## Konzept

Damit man mit der mobydick nicht nur mit den internen Nebenstellen kommunizieren kann benötigt man ein Amt um mit der "Außenwelt" telefonieren zu können.
Es gibt folgende Arten von Ämtern:

|Amt| Beschreibung|
|---|---|
|**IP-basiert**|IP-basierte Ämter (SIP-Amter) können ohne weitere Vorbereitung angelegt werden.|
|**ISDN**|Ein ISDN-Amt benötigt zur Anbindung ein Gateway (z. B. von Beronet oder Patton, siehe Artikel über ISDN- und Analog-Gateways)|
|IAX|Das *InterAsterisk-eXchange*-Protokoll wird verwendet, um zwei Asterisk-Server miteinander zu verbinden.|
|Analog|Ein Analog-Amt benötigt zur Anbindung ein Gateway (z. B. von Beronet oder Patton, siehe Artikel über ISDN- und Analog-Gateways). Analoge Ämter sind im deutschsprachigen Raum nicht üblich.|

Um überhaupt telefonische Verbindungen zu ermöglichen benötigt ein Amt Rufregeln. Verwenden Sie mehrere Ämter, so verwaltet jedes Amt seine eigenen Rufregeln. Es müssen für jedes Amt eingehende und ausgehende Rufregeln angelegt werden.

**Rufregeln** können

* von extern erreichbare Rufnummern auf internen Durchwahlen (z. B. Benutzer oder Teams) abwerfen,
* störende Anrufer blockieren,
* festlegen, ob Benutzer bestimmte Nummern angerufen werden dürfen oder nicht,
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
|**Länderkennung**|Geben Sie hier die Landeskennzahl für das Land an in dem sich das Amt befindet. Für Deutschland z. B. 49. Durch die IP-Ämter ist es möglich, dass sich die mobydick zwar in Deutschland befindet jedoch über das Internet ein Amt in der Schweiz nutzt. Geben Sie hier immer die Landeskennzahl an in dem sich das Amt befindet, nicht den Standort der Anlage.|
|**Ortskennzahl**|Tragen Sie die Ortskennzahl bzw. Ortsvorwahl ohne führende 0 ein. Für München z. B. 89 statt 089.|
|**Stammnummer**|Das ist die Basisnummer Ihres Telefonanschusses.|
|**Präfix eing. Nummer**|Ist eine beliebige Ziffer, die bei eingehenden Telefonanrufen über dieses Amt vorangestellt wird. Wenn Sie hier eine 0 eingeben erscheint beispielsweise in der Anruferliste von IP-Telefonen dann nicht die 0172123123 sondern die 00172123123. Dadurch können Sie direkt aus der Anruferliste wieder über das selbe Amt zurückrufen.|
|**Anzahl der Durchwahlstellen**|Anzahl der Stellen der Benutzer-Durchwahlen. (NICHT die Anzahl der Nummern im Rufnummernblock!)|
|**Durchwahl der Zentrale**|Geben Sie hier an, aus welche interne Durchwahl die erste Nummer Ihres Rufnummernblocks (meistens die 0) abgeworfen werden soll.|
|**Telefonbuchabfrage**|Wählen Sie hier **Ja** wird die mobydick versuchen jeden eingehenden Anruf über dieses Amt im zentralen Telefonbuch aufzulösen und bei Erfolg den Namen des Anrufers im Telefondisplay präsentieren. Dies gilt nur für IP-Endgeräte.|
|**Fallback Durchwahl**|Falls für eine Durchwahl die angerufen wird keine Rufregel existiert, wird der Anrufer auf diese Durchwahl abgeworfen.|
|**Skript ausgehende Regel**|Diese Einstellung kann für ausgehende Rufe ein Skript einbinden.|

|Variablen beim SIP-Amt|Erklärung|
|---|---|
|**Benutzername**|Der Benutzername wird je nach Amt-Typ dazu verwendet um sich damit entweder<br> * an der Gegenstelle (der Host) zu registrieren (Typ: *User*)<br> * oder ist der Name mit dem sich eine Gegenstelle bei der mobydick registriert (Typ *Peer*).<br>Wird der Typ auf *Friend* gesetzt werden zwei Datensätze angelegt und das Passwort wird sowohl als User und Peer genutzt.|
|**Passwort**|Ist, falls benötigt, das zum Benutzer gehörende Passwort.|
|**Host**|Hier tragen Sie die IP-Adresse oder den Hostnamen der Gegenstelle, an der sich der Account registrieren muss.|
|**Optionen**|Dieses Feld bietet die Möglichkeit weitere SIP-Optionen (eine Option pro Zeile), die von Asterisk verstanden werden, anzugeben. Einen Überblick über SIP-Optionen finden Sie hier: [SIP Configurations - peers and clients](http://www.voip-info.org/wiki/view/Asterisk+config+sip.conf#SIPconfigurationspeersandclients)|
|**Typ**|Analog zu Asterisk kennt mobydick mehrere Typen von SIP-Verbindungen. Diese werden unter [Asterisk sip type](http://www.voip-info.org/wiki/view/Asterisk+sip+type) genauer beschrieben.|
|**Registrierung**|Wählen Sie *Ja* oder *Nein*, je nachdem ob sich die mobydick beim Host anmelden muss oder nicht.|
|**Port**|Als Standard wird der Port *5060* verwendet. Soll ein anderer verwendet werden, können Sie diesen hier eintragen.|
|**Durchwahl reg.**|Hier teilen Sie dem Host mit welche Durchwahl ein eingehender Anruf auf Ihrer Seite rufen soll. Dies ist notwendig wenn der Benutzer-SIP-Account genau eine Nummer zur Verfügung stellt. Nutzen Sie jedoch einen SIP-Anlagenanschluss (z. B: sipgate trunking) geben Sie hier nichts an da die gerufene Durchwahl jeweils separat übermittelt wird.|
|**Ext. aus Header**|Standardmäßig wird die Zielrufnummer aus dem SIP-INVITE ermittelt. Setzt man diese Option auf *ja* wird die Zielrufnummer alternativ aus dem SIP-Header gelesen. Dies wird häufig bei SIP-Anlagenanschlüssen benötigt.|

<!-- |**CLIP Modus**||
 |**CLIR Modus**|| -->

### Rufregeln

Auf der mobydick unterscheidet man Rufregeln für eingehende und ausgehende Rufe.

* Die eingehenden Regeln werden für einkommende Anrufe verwendet. Sie legen fest, auf welche interne Durchwahl eine von extern erreichbare Rufnummer abgeworfen wird, z. B. bei welchem Benutzer oder bei welchem Team es klingeln soll.
* Mit ausgehenden Regeln legt man fest, welche Rufnummer dem Angerufenen signalisiert wenn man ihn mit einer bestimmten Durchwahl anruft.

Beim Bearbeiten und Speichern einer Amtsvorlage wurden bereits automatisch zwei eingehende und eine ausgehende Rufregel angelegt.

|eingehende|Rufregel|
|---|---|
|**Zentrale**|Diese Regel gilt für die erste Nummer im Rufnummern Block. In den meisten Fällen ist dies die Zentrale|
|**Durchwahl**|Diese Regeln gibt an, dass jede Durchwahl von extern direkt erreichbar ist.|

|ausgehende|Rufregel|
|---|---|
|**Standard**|Durch diese Regel wird beim Anruf nach extern die Rufnummer mit der Durchwahl des Anrufers signalisiert.|

<!--
#### Eingehende Rufe

|Einstellung|Beschreibung|
|---|---|
|**Bezeichung**|Jede Regel braucht einen eigenen Namen.|
|**Quelle**|Ist die Nummer des Anrufers. **\*** bedeutet diese Regel gilt für jeden Anrufer|
|**Ziel**|Das ist die Nummer die der Anrufer gewählt hat.|
|**Durchwahl**|Zeigt an, auf welche interne Durchwahl abgeworfen werden soll.|
|**CIDName**||
|**CIDNummer**||
|**Sprache**|Gibt z. B. an, in welcher Sprache der Anrufer mögliche Ansagen hören soll.|

#### Ausgehende Rufe

|Einstellung|Beschreibung|
|---|---|
|**Bezeichung**||
|**Im Client anzeigen**||
|****|In-Prefix|
|****|Quelle|
|****|Ziel|
|****|CIDNummer|
|****|Out-Prefix|
|****|Verbieten|
|**PIN**||
|**Übertragungskapazität**||
|**Account**||


#### Asterisk Dialplan Pattern
-->
