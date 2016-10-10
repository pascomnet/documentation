---
title: mobydick Fax Server
keywords:
    - Fax Server
    - Virtueller Fax Server
    - Fax to Mail 
    - Fax to Print
    - Faxe vom Client versehen
    - Mail to Fax
description: Lernen Sie den virtuellen Fax Server Ihrer mobydick optimal einzurichten.
url: /module/fax-server/
prev: /module/
next: /module/mitschnitt/
weight: 91
toc: true
---

## Übersicht

Unsere Integration bietet Ihnen eine ganze Reihe von Funktionen, welche dieses Howto näher beschreibt:

* Einrichten des Faxservers und Definition der Modems
* Faxempfang und Mail-Weiterleitung mit virtuellen Faxgeräten. Inbound fax-to-mail Gateway.
* Senden von Faxen per EMail-Weiterleitung. Outbound mail-to-fax Gateway.
* Senden von Faxen mit Steueranweisungen per virtuellem Drucker. Outbound print-to-fax Gateway.
* Senden von Faxen ohne Steueranweisungen per virtuellem Drucker und Client
* Senden von Faxen per Filetransfer im Client.
* Anzeigen von gesendeten/empfangenen Faxen in der Weboberfläche.
* Pflege der Fax-Warteschlangen/Logdateien

![Illustration - mobydick VoIP Fax Server Konzept](../../images/voip_fax_server_illustration.png?width=90% "mobydick VoIP Fax Server Konzept")


## Grundeinrichtung des Faxservers

Bevor der Faxserver arbeiten kann, müssen einige Eckdaten festgelegt werden. Diese hinterlegen Sie per Menüpunkt Appliance > Dienste > Faxserver. Wichtig ist hierbei die Anzahl der Faxleitungen vernünftig festzulegen, sie definiert die Menge an virtuellen Modems und somit die maximale Anzahl paralleler Faxvorgänge. In der Praxis haben sich hier 4 Modems gut bewährt.
![Illustration - Grundeinrichtung des Faxservers](../../images/faxserver_config.png?width=100% "Grundeinrichtung des Faxservers")
{{% notice info %}}
Nach dem Speichern ist unbedingt die Faxserver Konfiguration anzuwenden, damit die Änderung ans Betriebssystem übergeben werden.
{{% /notice %}}
Für das EMail Gateway muss natürlich auch der EMail Versand und Empfang klappen. Konfigurieren bzw. prüfen Sie hierzu die EMail Anbindung Ihres Telefonieservers per Appliance > Dienste > EMail-Server und geben Sie dort den Mail-Server für die Weiterleitung nebst Domain Name an. Wenden Sie nach Änderungen die Netzwerkkonfiguration an.
![Illustration - Grundeinrichtung des Faxservers](../../images/faxserver_config.png?width=100% "Grundeinrichtung des Faxservers")
{{% notice tip %}}
Weitere Informationen finden Sie auch unter Netzwerk einrichten.
{{% /notice %}}
## Anzeigen der gesendeten/empfangenen Faxe

Die Liste der empfangene Faxe (inkl. Downloads) und gesendete Faxe können Sie  bequem per Weboberfläche einsehen. Gehen Sie hierzu über das Menü Informationen > Faxserver zu den gewünschten Listen.

## Pflege der Warteschlangen/Logdateien

Alle ein- und ausgehenden Dokumente werden vom Faxserver zusammen mit Logdateien in verschiedenen Verzeichnissen unterhalb von /var/spool/hylafax aufbewahrt. Um die Performance und den Platzbedarf des Faxsystems konstant zu halten, werden diese Dateien durch einen Cronjob einmal wöchentlich bereinigt. Im Auslieferzustand der Anlage beträgt die Aufbewahrungszeit für die Dokumente 30 Tage.

Sie können den Zeitraum jederzeit verändern, in dem Sie zu Appliance > Cronjobs gehen und hier den Job mit der Bezeichnung "Faxserver bereinigen" bearbeiten. Sie können aber auch den Faxserver manuell bereinigen, indem sie den Menüpunkt Anwenden > Faxserver bereinigen benutzen.

## Persönliches Faxgerät anlegen

Als Nächstes legen Sie ein persönliches Faxgerät an, um die Durchwahl und die EMail Weiterleitung des Faxes festzulegen. Sie können ein virtuelles Fax für einen Benuzter oder einem Team anlegen, im Tab Faxgerät.
Sie benötigen:
* die E-Mail-Adresse für Benachrichtigungen und eingehende Faxe
* die Durchwahl des Faxgerätes
* das Format des Anhangs, i.d.R. wird dies PDF sein.
{{% notice info %}}

Nachdem Sie alle Faxgeräte angelegt haben, müsen Sie noch die Telefonie anwenden, damit die Änderung ans Betriebssystem übergeben werden.
{{% /notice %}}


## Versenden von Faxen per EMail Gateway
Serverseitig sind jedoch einige Vorarbeiten zu leisten. Auf dem Telefonieserver muss, wie oben bereits erwähnt, die EMail Konfiguration erfolgt sein. Damit die EMails Ihrer Clients auch zum Faxserver gelangen, muss auch der EMail Server Ihres Unternehmens angepasst werden. Sie müssen dort dafür sorgen, das alle EMails an die Domain " *.fax" per smtp zu Ihrem Telefonieserver weitergeleitet werden. Der Einrichtungsvorgang unterscheidet sich je nach EMailsystem.

Um nach der Einrichtung ein Fax zu versenden, versenden Sie einfach ein EMail mit folgendem Aufbau:
|Feld|Beispiel|Beschreibung|
|----|--------|------------|
|An|empfaenger@009912700619.fax|Dabei wird die Nummer ausgewertet und der Teil vor dem "@" Zeichen wird auf einem eventuellen Fax-Deckblatt als Empfänger eingetragen. (Standardmäßig sind Fax-Deckblätter deaktiviert)|
|Betreff und Text der Mail| |Werden in Postscript konvertiert und standardmäßig als erste Faxseite versendet.|
|Anhang| |Das eigentliche Fax als pdf oder tif Datei|

### Anpassungsmöglichkeiten
Aktuell kann das Verhalten des email-to-fax Gateways teilweise nur direkt in den Konfigurationsdateien angepasst werden. Hierzu müssen Sie sich auf der mobydick per SSH einloggen und benötigen root-Rechte.

#### Format der Benachrichtigungs-EMails anpassen
Im Auslieferzustand erhalten Sie eine Plain-Text Mail sobald es eine Veränderung an einem Fax Auftrag gibt (besetzt, fehlgeschlagen, erfolgreich etc.). Sie können stattdessen ein alternatives Format setzen. Bei diesem wird eine HTML Mail mit eingebetteter erster Seite nebst pdf Anhang generiert. Das Format entspricht somit einem empfangenen Fax an ein virtuelles Faxgerät welches mit Format="inlinegif" konfiguriert wurde.
* öffnen Sie die Datei /etc/hylafax/FaxNotify mit einem Editor
* entfernen Sie den "#" Kommentar der Zeile INLINE=true
* starten Sie das Faxsystem per Weboberfläche oder mit _ /etc/init.d/hylafax restart _ neu

{{% notice tip %}}
Dies verändert auch das Benachrichtigungsformat bei print-to-fax Aufträgen.
 {{% /notice %}}

#### Mail-to-fax Adressierung anpassen
Wenn Sie nun z. B. das Adressformat auf 009912700619@meinedomain.de setzen möchten, können Sie wie folgt vorgehen:

* Zuerst benutzen Sie die Systemeinstellungen der Weboberfläche um den Eintrag sys.fax.configure.faxmail.matcher.fax zu ergänzen. In diesem tragen Sie für obiges Beispiel folgenden Wert ein:


        /||(\d+)@.*/


* Aktivieren Sie diese  Änderung per "Manuell anwenden-Netzwerk" und setzen einen Haken bei "Mailserver einbeziehen".

* Die Standard Adressierung lautet wie oben erwähnt z. B. empfaenger@009912700619.fax. Sie können das Adressformat verändern, in dem Sie die Datei /etc/exim4/exim4.conf.mdc editieren.

    {{% md %}}
    fax:  
    driver = manualroute  
    transport = fax  
    route_list ="*.fax"
    {{% /md %}}


Wenn Sie nun z. B. das Adressformat auf 009912700619@meinedomain.de setzen möchten, so ist folgende Anpassung nötig:

    route_list = "meinedomain.de"
    
Um die Änderung zu komplettieren, müssen Sie zusätzlich noch die Datei /etc/exim4/update-exim4.conf.conf bearbeiten:

    dc_other_hostnames='localhost.localdomain;meinedomain.de'
 
**Wichtig:**
{{% notice note %}}
Abschließend müssen Sie unter "Grundkonfiguration", "Netzwerk" den Haken "EMail-Server" entfernen, die angepassten Dateien werden sonst überschrieben.
{{% /notice %}}
 
#### Mail-to-fax Fileformat/Anhang anpassen
Per Setting kann sys.fax.configure.faxmail.mode konfiguriert werden, welche Bestandteile der EMail bei einem email-to-fax Vorgang verschickt werden:

* 0 (default) Alle Bestandteile der Mail werden konvertiert und verschickt (auch der Mail-Text)
* 1 Nur der Anhang wird gefaxt

#### Konvertierung der Mail Bestandteile anpassen
Unter /var/spool/hylafax/mimetype liegen die Konverterskripte. Diese zerlegen die eingehende EMail, je nach mimetype, in ihre Bestandteile und konvertieren diese dann zu einer Faxnachricht. Liegt für einen mimetype kein Skript vor wir dieser Teil der EMail einfach ignoriert und nicht in das Fax mit eingebunden.
Folgende Skripte existieren:

|Skript|Beschreibung|
|------|------------|
|application/pdf|Konvertiert einen PDF Anhang in ein Fax|
|image/tiff|Konvertiert einen TIFF oder TIF Anhang in ein Fax|
|text/plain|Konvertiert den Plaintext Body einer EMail in ein Fax|
|text/html|Konvertiert den HTML Body einer EMail in ein Fax|

### Beispieleinstellungen für einen Exchangeserver

Um einen Exchangeserver so einzurichten, dass dieser alle *.fax EMails an die mobydick weiter leitet sind folgende Schritte notwendig:

* Exchange System Manager öffnen
* Wechseln nach: Administrative Gruppen / Routinggruppen / erste Routinggruppe /Connectors
* Im Fenster Connectros rechte Maustaste -> Neu -> SMTP Connectors
* Im Reiter Allgemein folgende Einträge machen:
    * Name = Name des Connectors (beliebig)
    * "Gesamte Mail über diesen Connector an diesen Smarthost weiterleiten" aktivieren
    * Im Feld darunter die IP (in eckigen Klammern) der mobydick eintragen
    * Lokale Bridgeheads: = Hinzufügen klicken und Exchangeserver auswählen
    * Im Reiter Adressraum *.fax
* Speichern und fertig

## Versenden von Faxen per Print Gateway

### Betriebsart festlegen
Das print-to-fax Gateway kann sowohl für den automatischen Dokumentenversand aus z. B. ERP Systemen als auch für Dialogbasierte Aufträge mit dem Desktop Client für Endbenutzer genutzt werden. 

Die Systemeinstellung sys.fax.configure.faxprint.mode bestimmt hierbei die Betriebsart des Gateways:

|Wert|Bedeutung|Standard|
|:--:|---------|--------|
|1|	Es werden keine Steuerfelder gesucht und der Auftrag wird direkt an den Client durchgereicht.|Bei Neuinstallation ab Version 6.12.01|
|2|	Steuerfelder für Automatikversand werden gesucht. Fehlen diese wird abgebrochen.| |
|3|	Zuerst werden Steuerfelder gesucht, falls keine gefunden wurden wird der Auftrag an den Client weitergegeben.|	Anlagen die bereits vor Version 6.12.01 installiert wurden|

{{% notice tip %}}
Falls Sie den automatik Modus mit Steuerzeichen nicht benötigen, empfehlen wir Ihnen aus Performance Gründen den Modus 1, da hierbei das Dokument nicht zerlegt und durchsucht werden muss.
{{% /notice %}}

### Steuerfelder einfügen
Damit das Faxsystem die Zielnummer und eventuell weitere Informationen aus dem Druckauftrag ermitteln kann, muss das zu faxende Dokument mit Steuerfeldern ausgezeichnet werden. Da diese i. d. R. nicht mit an den Empfänger übermittelt werden sollen, können Sie diese im produktiven Betrieb z. B. auch weiß einfärben.

Derzeit kennt das Faxsystem folgende Auszeichnungen:

|Ausdruck|Bedeutung|
|--------|---------|
|@@+FAX:0991....@@|Die Rufnummer des Empfängers. Dies ist das einzige Pflichtfeld!|
|@@+TAG:Bestellung 12345@@|Individuelle Jobkennung, wird in Listen und Benachrichtigungen angezeigt|
|@@+NOTIFY:mustermann@pascom.net@@|Über den Fortschritt zu benachrichtigender User. Details s. u.|
|@@+PRIO:100@@|Priorität des Auftrags (0-255). Aufträge mit niedriger Priorität werden bevorzugt verschickt. Default ist 200. Prioritäten verwenden Sie in Zusammenhang mit lange andauernden großvolumigen Batchaufträgen, welche dann i.d.R eine Priorität von z. B. 250 bekommen. Ansonsten müssten alle manuellen Faxvorgänge warten, bis der Batchjob abgeschlossen ist.

### Benachrichtigungen
Über das notify Steuerfeld können Sie eine individuelle EMail Adresse übergeben, an die alle Status-Meldungen die diesen Faxjob betreffen, geschickt werden. Fehlt das notfiy Steuerfeld, können Sie zwischen 2 Abhandlungen auswählen:

* alle Benachrichtigungen gehen an faxmaster@ihredomain (Auslieferzustand!)
* die Benachrichtigung geht an username@ihredomain wobei der Username des angemeldeten Users verwendet wird, der den Druckjob abgesetzt hat.

Sie definieren die Benachrichtigungsart und andere Einstellungen per Systemeinstellungen im Bereich `sys.fax.configure.faxprint`. Die Benachrichtigungsart legt dabei der Key `sys.fax.configure.faxprint.notify` mit dem Inhalt "faxmaster" oder "user" fest.

### Mögliche Probleme
Damit das System die Steuerzeichen auswerten kann, muss der Druckauftrag zunächst in ein Textformat gewandelt werden. Je nach Komplexität des Druckauftrags, verwendeten Schriftarten und Art des Druckertreibers kann es an dieser Stelle Komplikationen geben.

Folgende Punkte sollten Sie beachten:

* halten Sie sich an die empfohlene Treibereinrichtung (s. o.)
* versuchen Sie bei Problemen die Steuerzeichen in einer Standardschriftart wie etwa Arial 10 einzutragen.

Einige Details zum Verlauf der Druckjobs können Sie in der Logatei `/var/log/mobydick/sendfax.log` einsehen.

### Einstellungen anpassen

Um Ihnen den Umstieg von einem anderen Faxsystem zu erleichtern, können Sie eine Reihe von Einstellungen des Gateways anpassen. 

Alle Werte in der folgenden Tabelle werden in den Systemeinstellungen abgelegt. Die meisten Werte müssen bei Bedarf erst in den Systemeinstellungen hinzugefügt werden.

|Schlüssel|Bedeutung|Standardwert|Beispiel|
|---------|---------|------------|--------|
|sys.fax.configure.<br/>faxprint.matcher.fax	|Regulärer Ausdruck der die Faxnummer im Dokument sucht. Das erste Klammernpaar gibt dabei die Position der Nummer an.|	/@@\+FAX:<br/>\s*(.*?)\s*@@/	 | |
|sys.fax.configure.<br/>faxprint.matcher.jobtag|	Regulärer Ausdruck der den benutzerdefinierten Jobnamen im Dokument sucht. Das erste Klammernpaar gibt dabei die Position des Feldes an.|	/@@\+TAG:<br/>\s*(.*?)\s*@@/	 | |
|sys.fax.configure.<br/>faxprint.matcher.priority|	Regulärer Ausdruck der die Priorität im Dokument sucht. Das erste Klammernpaar gibt dabei die Position der Zahl an.|	/@@\+PRIO:<br/>\s*(\d+?)\s*@@/	 | |
|sys.fax.configure.<br/>faxprint.matcher.notify|	Regulärer Ausdruck der die EMail-Adress im Dokument sucht. Das erste Klammerpaar gibt dabei die Position der Adresse an.|	/@@\+NOTIFY:<br/>\s*(.*?@.*?)\s*@@/	| |
|sys.fax.configure.<br/>faxprint.priority|	Standardpriorität der Faxaufträge wenn keine Priorität im Dokument enthalten ist.|	200	 | |
|sys.fax.configure.<br/>faxprint.tries	|Anzahl Faxversuche pro Dokument.|	3	 | |
|sys.fax.configure.<br/>faxprint.notify|	Durch "faxmaster" oder "user" legen Sie fest, wer bei Jobänderungen zu benachrichtigen ist falls im Job keine EMail Adresse mitgegeben wurde.|	faxmaster|	user|
|sys.fax.configure.<br/>faxprint.usermangle.search|	Falls die Benutzernamen am Desktop bzw. Drucksystem und ihrer Telefonanlage abweichen, kann hier ein regulärer Ausdruck zur Selektion des Usernamens hinterlegt weden.	|(leer)|	/^(\w+)\..*/ |
|sys.fax.configure.<br/>faxprint.usermangle.replace	|Gibt den Ersetzungswert für das Username-Mangling an. Hierzu muss "search" und "replace" angegeben sein. Im Beispiel wird der Windows Username beim ersten Punkt abgeschnitten.|	(leer)|	$1|

## Fax Druckertreiber einrichten
{{% notice info%}}
Auch dieser Versandweg ist plattformunabhängig, sie müssen jedoch auf den Arbeitsstationen einen virtuellen Drucker einrichten. Richten Sie sich bitte je nach Betriebssystem nach folgenden Anleitungen. 
Zusätzlich gibt es für größere Umgebungen auch die Möglichkeit, den Drucker per ActiveDirectory an die Arbeitsplätze zu verteilen.
Neben normalen Einzelaufträgen ermöglicht Ihnen das print-to-fax Gateway auch die Anbindung von ERP Systemen oder beispielsweise das automatisierte Faxen von Rundschreiben.
{{% /notice %}}
### unter MacOS X 

1. Beginnen Sie die Installation in den Systemeinstellungen / Drucken und Faxen
![Screenshot - Installation per Systemsteuerung ](../../images/sendfaxmac1.png?width=60% "Installation per Systemsteuerung")
2. Klicken Sie auf "+" um einen Drucker hinzuzufügen
![Screenshot - Netzwerkdrucker ](../../images/sendfaxmac2.png?width=60% "Netzwerkdrucker auswählen")
3. Geben Sie die Druckerdetails ein
![Screenshot - Mac Druckerdetails](../../images/sendfaxmac3.png?width=60% "Druckerdetails")
4. Installation abschließen
Klicken Sie auf "hinzufügen" und bestätigen Sie den nachfolgenden Dialog.
Der Faxdrucker ist nun fertig eingerichtet.

### unter Windows 7

1. Beginnen Sie die Installation per Systemsteuerung / Drucker und Faxgeräte.
![Screenshot - Installation per Systemsteuerung ](../../images/sendfaxw7_1.png?width=60% "Installation per Systemsteuerung")
2. Wählen Sie "Netzwerkdrucker" aus
![Screenshot - Netzwerkdrucker ](../../images/sendfaxw7_2.png?width=60% "Netzwerkdrucker auswählen")
3. Überspringen Sie die automatische Suche
![Screenshot - automatische Suche](../../images/sendfaxw7_3.png?width=60% "automatische Suche")
4. Geben Sie die Drucker-URL ein
Hierzu verwenden Sie die IP-Nummer oder den DNS Namen Ihrer Anlage: http://ihreanlage:631/printers/sendfax
![Screenshot - IP-Nummer oder den DNS Namen verwenden](../../images/sendfaxw7_4.png?width=60% "IP-Nummer oder den DNS Namen verwenden")
5. Treiber auswählen
![Screenshot - Druckertreiber ](../../images/sendfaxw7_5.png?width=60% "Druckertreiber")
Als Druckertreiber wählen Sie den Xerox 6120PS aus.
6. Installation abschließen
![Screenshot - Installation abschließen ](../../images/sendfaxw7_6.png?width=60% "Installation abschließen")
Nach einer weiteren Bestätigung ist die Installation abgeschlossen.



### unter Windows XP

1. Beginnen Sie die Installation per Systemsteuerung / Drucker und Faxgeräte.
![Screenshot - Installation per Systemsteuerung ](../../images/sendfaxxp1.jpg?width=70% "Installation per Systemsteuerung")
2. Wählen Sie "Netzwerkdrucker" aus
![Screenshot - Netzwerkdrucker ](../../images/sendfaxxp2.jpg?width=70% "Netzwerkdrucker auswählen")
3. Geben Sie die Drucker-URL ein
Hierzu verwenden Sie die IP-Nummer oder den DNS Namen Ihrer Anlage: http://ihreanlage:631/printers/sendfax
![Screenshot - IP-Nummer oder den DNS Namen verwenden](../../images/sendfaxxp3.jpg?width=70% "IP-Nummer oder den DNS Namen verwenden")
4. Treiber auswählen
Als Druckertreiber wählen Sie den Apple LaserWriter 12 / 640 PS aus.
![Screenshot - Druckertreiber ](../../images/sendfaxxp4.jpg?width=70% "Druckertreiber")
5. Installation abschließen
Nach einer weiteren Bestätigung ist die Installation abgeschlossen.
![Screenshot - Installation abschließen ](../../images/sendfaxxp5.jpg?width=70% "Installation abschließen")


