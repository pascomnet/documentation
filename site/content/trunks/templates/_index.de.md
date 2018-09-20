---
title: Amtsvorlagen
description: pascom liefert eine Vielzahl von Amtsvorlagen zur Erstellung von SIP-, Analog- und ISDN-Ämtern mit. Diese Vorlagen helfen Ihnen bei der Einrichtung und legen automatisch passende Rufregeln an.
weight: 10
---

{{< doctype "both"  >}}

{{< description >}}

## Amtsvorlagen verwenden

Fügen Sie ein neues Amt ein unter {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}} > {{< ui-button "Hinzufügen" >}}. Sie gelangen nun zur Ämter-Datenbank. Hier finden Sie Vorlagen für alle von pascom unterstützten und von uns getesten Ämter.  
Über den Filter können Sie direkt nach Ihrem Amt suchen und anschließend auswählen. Befüllen Sie die Vorlage mit Ihren Daten, die Sie von Ihrem Telefonanbieter erhalten haben.  
Da verschiedene Ämter-Typen unterschiedliche Variablen benötigen finden Sie im folgendem eine Übersicht:

|Variable|Erklärung|
|---|---|
|**Bezeichung**|Geben Sie Ihrem Amt einen Namen, dieser taucht dann in der Ämterliste auf|
|**Internationale Vorwahl**|Die Ziffer die vorangestellt werden muss um im Festnetz eine internationale Nummer (Ausland) zu erreichen. Im Normalfall ist das die *00*.|
|**Nationale Vorwahl**|Die Ziffer die vorangestellt werden muss um im Festnetz eine nationale Nummer (Nummer mit Ortsvorwahl) zu erreichen. Im Normalfall ist das die *0*.|
|**Länderkennung**|Geben Sie hier die Landeskennzahl für das Land an in dem sich das Amt befindet. Für Deutschland z. B. 49. Durch die IP-Ämter ist es möglich, dass sich die pascom zwar in Deutschland befindet jedoch über das Internet ein Amt in der Schweiz nutzt. Geben Sie hier immer die Landeskennzahl an in dem sich das Amt befindet, nicht den Standort der Anlage.|
|**Ortskennzahl**|Tragen Sie die Ortskennzahl bzw. Ortsvorwahl ohne führende 0 ein. Für München z. B. 89 statt 089.|
|**Stammnummer**|Das ist die Basisnummer Ihres Telefonanschusses.|
|**Präfix eing. Nummer**|Ist eine beliebige Ziffer, die bei eingehenden Telefonanrufen über dieses Amt vorangestellt wird. Wenn Sie hier eine 0 eingeben erscheint beispielsweise in der Anruferliste von IP-Telefonen dann nicht die 0172123123 sondern die 00172123123. Dadurch können Sie direkt aus der Anruferliste wieder über das selbe Amt zurückrufen.|
|**Anzahl der Durchwahlstellen**|Anzahl der Stellen der Benutzer-Durchwahlen. (NICHT die Anzahl der Nummern im Rufnummernblock!)|
|**Durchwahl der Zentrale**|Geben Sie hier an, auf welche interne Durchwahl die erste Nummer Ihres Rufnummernblocks (meistens die 0) abgeworfen werden soll.|
|**Telefonbuchabfrage**|Wählen Sie hier **Ja** wird die pascom versuchen jeden eingehenden Anruf über dieses Amt im zentralen Telefonbuch aufzulösen und bei Erfolg den Namen des Anrufers im Telefondisplay präsentieren. Dies gilt nur für IP-Endgeräte.|
|**Fallback Durchwahl**|Falls für eine Durchwahl die angerufen wird keine Rufregel existiert, wird der Anrufer auf diese Durchwahl abgeworfen.|
|**Skript ausgehende Regel**|Diese Einstellung kann für ausgehende Rufe ein Skript einbinden.|
|**Direkte Weiterleitung**|Diese Einstellung legt fest, wie Rufumleitungen, die von extern kommen und die Anlage wieder verlassen abgehandelt werden. Dazu gibt es 3 Möglichkeiten:<br>*- Anruf im System behalten*<br>*- Anruf annehmen und im System behalten*<br>*- Anruf über Provider weiterleiten (Call Deflection)*|

|Variablen beim SIP-Amt|Erklärung|
|---|---|
|**Benutzername**|Der Benutzername wird je nach Amt-Typ dazu verwendet um sich damit entweder<br> * an der Gegenstelle (der Host) zu registrieren (Typ: *User*)<br> * oder ist der Name mit dem sich eine Gegenstelle bei der pascom registriert (Typ *Peer*).<br>Wird der Typ auf *Friend* gesetzt werden zwei Datensätze angelegt und das Passwort wird sowohl für User und Peer genutzt.|
|**Passwort**|Ist, falls benötigt, das zum Benutzer gehörende Passwort.|
|**Host**|Hier tragen Sie die IP-Adresse oder den Hostnamen der Gegenstelle, an der sich der Account registrieren muss.|
|**Optionen**|Dieses Feld bietet die Möglichkeit weitere SIP-Optionen (eine Option pro Zeile), die von Asterisk verstanden werden, anzugeben. Einen Überblick über SIP-Optionen finden Sie hier: [SIP Configurations - peers and clients](http://www.voip-info.org/wiki/view/Asterisk+config+sip.conf#SIPconfigurationspeersandclients)|
|**Typ**|Analog zu Asterisk kennt pascom mehrere Typen von SIP-Verbindungen. Diese werden unter [Asterisk sip type](http://www.voip-info.org/wiki/view/Asterisk+sip+type) genauer beschrieben.|
|**Registrierung**|Wählen Sie *Ja* oder *Nein*, je nachdem ob sich die pascom beim Host anmelden muss oder nicht.|
|**Port**|Als Standard wird der Port *5060* verwendet. Soll ein anderer verwendet werden, können Sie diesen hier eintragen.|
|**Durchwahl reg.**|Hier teilen Sie dem Host mit welche Durchwahl ein eingehender Anruf auf Ihrer Seite rufen soll. Dies ist notwendig wenn der Benutzer-SIP-Account genau eine Nummer zur Verfügung stellt. Nutzen Sie jedoch einen SIP-Anlagenanschluss (z. B: sipgate trunking) geben Sie hier nichts an da die gerufene Durchwahl jeweils separat übermittelt wird.|
|**Rufnummer-Ermittlung**|Hier können Sie einstellen woher die Zielrufnummer ermittelt werden soll. Standardmäßig greift hier die Ämterautomatik, sodass der Trunk eine automatische Rufnummern-Ermittlung durchführen kann. Mögliche Einstellungen: <br> * *Request-URI*<br> * *To-Header*<br> * *AUTO*|
|**Rufnummern-Übermittlung**|Die Rufnummern-Übermittlung (CLIP) ist ein Leistungsmerkmal, welches die Übermittlung von Rufnummern bei ausgehenden Rufen ermöglicht. Standardmäßig greift hier die Ämterautomatik, sodass der Trunk eine automatische Rufnummern-Übermittlung durchführen kann. Mögliche Einstellungen: <br> * *AUTO*<br> * *FROM*<br> * *PPI*<br> * *PAI*|
|**Rufnummern-Unterdrückung**|Die Rufnummer-Unterdrückung (CLIR) ist ein Leistungsmerkmal, welches die Unterdrückung von Rufnummern bei ausgehenden Rufen ermöglicht. Standardmäßig greift hier die Ämterautomatik, sodass der Trunk eine automatische Rufnummern-Unterdrückung durchführen kann. Mögliche Einstellungen: <br>* *AUTO*<br> * *FROM*<br> * *Privacy-ID*|