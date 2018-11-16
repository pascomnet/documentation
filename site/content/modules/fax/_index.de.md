---
title: FAX Server
description: Lernen Sie den virtuellen Fax Server Ihrer pascom optimal einzurichten.
weight: 10
---

{{< doctype "both"  >}}

{{< description >}}

## Übersicht

[In unsere VoIP Software](https://www.pascom.net/de/) ist ein Fax-Server integriert. Dabei handelt es sich um das Produkt [HylaFax](http://www.hylafax.org/) welches über virtuelle IAX-Modems direkt an den Asterisk Telefonieserver angekoppelt ist.

Dabei stehen Ihnen folgende Fax-Möglichkeiten zur Verfügung:

+ Empfangen von Faxen über E-Mail.
+ Versenden von Faxen über den [pascom Client]({{< ref "/clients/desktop-userguide">}}).
+ Versenden von Faxen über [Mail-to-Fax]({{< relref "#mail-to-fax">}}) als E-Mail-Weiterleitung.
+ Versenden von Faxen über [Print-to-Fax]({{< relref "#print-to-fax">}}) mit Steueranweisungen per virtuellem Drucker oder ohne Steueranweisungen mit virtuellem Drucker über den Client.


## Fax-Server Konfigurieren

Unter {{< ui-button "Appliance" >}} > {{< ui-button "Dienste" >}} > {{< ui-button "Faxserver" >}} muss zunächst der Fax-Server aktiviert und eingerichtet werden:

|Einstellung|Beschreibung|
|---|---|
|Gesamtanzahl Faxleitungen|Die Gesamtanzahl der Faxleitungen definiert die Menge an virtuellen Modems und somit die maximale Anzahl paralleler Faxvorgänge.|
|Für eingehende Faxe reserviert|Anzahl der Faxleitungen, die immer für eingehende Faxe reserviert bleibt.|
|Ländercode|Geben Sie hier den Ländercode Ihres Landes an ohne die führenden Nullen. Z. B. 49 für Deutschland.|
|Vorwahl ohne führende 0|Geben Sie hier Ihre Ortsvorwahl ohne führende 0 an. Z. B. 89 für München.|
|Stammnummer|Geben Sie hier die Stammnummer Ihres Telefonanschlusses an.|
|Mail to Fax|Hier wird der angegeben, ob das zu versendende Fax die E-Mail oder der Anhang ist. *Default: Deaktiviert*|
|Lebensdauer Faxdokumente/Tage|Gibt an, wie lange Fax-Dokumente auf der pascom gespeichert werden. *Der Default-Wert ist 30 Tage*|
|Anzahl Sendeversuche|Gibt an, wie viele Versuche unternommen werden um ein Fax zu verdenden, falls die Gegenstelle kurzzeitig nicht erreichbar ist.|


### Übersicht der gesendeten/empfangenen Faxe

Unter {{< ui-button "Informationen" >}} > {{< ui-button "Faxserver" >}} haben Sie eine Übersicht über die gesendeten und empfangenen Faxe. Die Liste der empfangenen Faxe bietet auch die Möglichkeit die Fax-Dokumente herunterzuladen.

Über {{< ui-button "Anwenden" >}} > {{< ui-button "Faxserver bereinigen" >}} können Sie einstellen, dass ältere Faxe aus dem System gelöscht werden. Der Default-Wert hierfür ist 30 Tage. Das bedeutet, dass beim Bereinigungs-Prozess, alle Faxe, die älter sind als 30 Tage gelöscht werden. Über den Button {{< ui-button "Automatisieren" >}} kann ein Cronjob eingerichtet werden, der automatisiert bereinigt.


## Virtuelles Fax anlegen

Virtuelle Faxe können für einen [Benutzer]({{< ref "/user/user">}}) oder für ein [Team]({{< ref "/teams/configuration">}}) angelegt werden.


#### Virtuelles Benutzerfax

Unter {{< ui-button "Benutzer" >}} > {{< ui-button "Benutzerliste" >}} > Benutzer auswählen und {{< ui-button "Bearbeiten" >}} im Tab {{< ui-button "Faxgerät" >}} kann für einen schon bestehenden Benutzer ein Faxgerät angelegt werden. Setzen Sie das Häckchen bei *Persönliches Fax konfigurieren*:

|Einstellung|Beschreibung|
|---|---|
|E-Mail|Geben Sie hier die E-Mail-Adresse des Benutzers ein. Über diese E-Mail-Adresse erhält der Benutzer die Bestätigung über versendete Faxe, und je nach Konfiguration auch empfangene Faxe.|
|Fax-Durchwahl|Geben Sie hier die Faxdurchwahl des Benutzers ein. Lesen Sie bitte hierfür folgendes [Howto zum Vergeben von Durchwahlen]({{< relref "/howto/extensions">}}).|
|ausgehende Faxkennung|Hier kann optional eine ausgehende Faxkennung angegeben werden.|
|Format|Hier legen Sie fest, in welchem Format das Fax versendet wird. Zur Auswahl stehen<br> * PDF<br> * TIF<br> * DATEI<br> * INLINEGIF|

#### Virtuelles Teamfax

Unter {{< ui-button "Benutzer" >}} > {{< ui-button "Teams" >}} > Team auswählen und {{< ui-button "Bearbeiten" >}} im Tab {{< ui-button "Faxgerät" >}} kann für einen schon bestehenden Benutzer ein Faxgerät angelegt werden. Setzen Sie das Häckchen bei *Team Fax konfigurieren*:

|Einstellung|Beschreibung|
|---|---|
|E-Mail|Geben Sie hier die E-Mail-Adresse des Teams ein. Über diese E-Mail-Adresse erhält das Team empfangene Faxe und je nach Konfiguration die Bestätigung über ein versendetes Fax.|
|Durchwahl|Geben Sie hier die Faxdurchwahl des Team-Faxes an. Lesen Sie bitte hierfür folgendes [Howto zum Vergeben von Durchwahlen]({{< relref "/howto/extensions">}})|
|ausgehende Faxkennung|Hier kann optional eine ausgehende Faxkennung angegeben werden.|
|Format|Hier legen Sie fest, in welchem Format das Fax versendet wird. Zur Auswahl stehen<br> * PDF<br> * TIF<br> * DATEI<br> * INLINEGIF|



## Mail-to-Fax

### Vorbereitung

Richten Sie auf Ihrem Mail-Server ein Postfach ein, welches via Pop3 oder IMAP von der pascom Telefonanlage abgerufen werden kann.

*Beispiel:*         
*fax@meinedomain.de*


### Konfiguration

Um Mail-to-Fax nutzen zu können müssen Sie in der Weboberfläche Ihrer pascom Telefonanlage unter {{< ui-button "Appliance" >}} > {{< ui-button "Dienste" >}} > {{< ui-button "Faxserver" >}} Ihren virtuellen Faxserver einrichten.

Unter {{< ui-button "Mail to Fax" >}} können Sie Auswählen, ob Sie die Inhalte der Emails mitfaxen möchten, oder nur den Anhang faxen.
Unabhängig davon wie Sie sich entscheiden öffnen sich nach Ihrer Auswahl weitere Felder zur Konfiguration Ihres bereits vorbereiteten Mail-Postfachs.

|Einstellung|Beschreibung|
|---|---|
|Mail Server|Tragen Sie hier Ihren Mail-Server ein, auf dem sich das vorbereitete Postfach befindet.|
|Mail Protokoll|Tragen Sie ein ob die Emails via POP3 oder IMAP (*Defaulteinstellung*) abgerufen werden sollen.|
|Abrufintervall|*Nur bei POP3*: Geben Sie das Intervall in Sekunden ein, in dem die Emails abgerufen werden sollen.|
|Von Mailbox entfernen|Geben Sie an ob die Emails nach dem Abrufen im Postfach entfernt oder weiterhin gespeichert werden sollen. *Default: Ja*|
|Mail Benutzername|Tragen Sie hier den Benutzernamen des von Ihnen vorbereiteten Postfachs ein|
|Mail Kennwort|Tragen Sie hier das Login-Kennwort des von Ihnen vorbereiteten Postfachs ein|
|Ungültige Zertifikate ignorieren|Geben Sie an ob ungültige Zertifikate der pascom Telefonanlage ignoriert werden sollen. *Default: Nein*|

Stellen Sie sicher, dass sich Ihre pascom Telefonanlage mit dem Postfach auf Ihrem Mail-Server korrekt verbinden kann.


### Fax versenden

Um nach der Einrichtung ein Fax zu versenden, versenden Sie einfach ein E-Mail mit folgendem Aufbau:

|E-Mail-Feld|Beispiel|Beschreibung|
|---|---|---|
|An|fax@meinedomain.de|Tragen Sie hier die Emailadresse Ihres vorbereiteten Postfachs ein.|
|Betreff|00991123456999|Tragen Sie hier die zu verwendende Amtsholung + Faxnummer des Empfängers ein.|
|Anhang||Das ist das eigentliche Fax, im PDF- oder TIF-Dateiformat|

Je nach Auswahl in der Fax-Server Konfiguration wird auch der Inhalt der Email als Fax versendet.


### Anpassungen

Aktuell kann das Verhalten des Mail-to-Fax-Gateways teilweise nur direkt in den Konfigurationsdateien angepasst
werden. Hierzu müssen Sie sich auf der pascom per SSH einloggen und benötigen root-Rechte.

Ohne Anpassungen erhalten Sie eine Plain-Text-E-Mail sobald es eine Veränderung an einem Fax-Auftrag gibt (besetzt,
fehlgeschlagen, erfolgreich etc.).
Sie können stattdessen ein alternatives Format setzen. Bei diesem wird eine HTML-E-Mail mit eingebetteter erster Seite nebst PDF-Anhang generiert. Das Format entspricht somit einem empfangenen Fax an ein virtuelles Faxgerät welches mit Format="inlinegif" konfiguriert wurde.

* öffnen Sie die Datei */etc/hylafax/FaxNotify* mit einem Editor,
* entfernen Sie das *#*-Zeichen (Kommentar) der Zeile INLINE=true
* und starten Sie das Faxsystem per Weboberfläche oder mit dem Befehl */etc/init.d/hylafax restart* neu

{{% notice note %}}
Dies verändert auch das Benachrichtigungsformat bei Print-to-Fax-Aufträgen.
{{% /notice %}}

<!-- 
#### Adressierung anpassen


Wenn Sie nun z. B. das Adressformat auf 009912700619@meinedomain.de setzen möchten, können Sie wie folgt
vorgehen:

* Erweitern Sie über das Web-UI die Systemeinstellungen ({{< ui-button "Appliance" >}} > {{< ui-button "Systemeinstellungen" >}}) um den Eintrag *sys.fax.configure.faxmail.matcher.fax*.
* Tragen Sie hier als Wert **/||(\d+)@.\*/** ein.
* Diese Änderung aktivieren Sie mit Speichern und manuellem Anwenden der Netzwerk-Dienste ({{< ui-button "Anwenden" >}} > {{< ui-button "Netzwerk Dienste" >}})


Die Standard-Adressierung lautet wie oben erwähnt z. B. empfaenger@00991123456999.fax. Sie können das
Adressformat verändern, in dem Sie über SSH die Datei */etc/exim4/exim4.conf.mdc* editieren:

    fax:
    driver = manualroute
    transport = fax
    route_list ="\*.fax"

Wenn Sie nun z. B. das Adressformat auf 00991123456999@meinedomain.de setzen möchten, so ist folgende Anpassung
nötig:

    route_list = "meinedomain.de"

Um die Änderung abzuschließen, müssen Sie zusätzlich noch die Datei */etc/exim4/update-exim4.conf.conf* bearbeiten:

    dc_other_hostnames='localhost.localdomain;meinedomain.de'



#### Fileformat/Anhang anpassen

Über die Systemeinstellung sys.fax.configure.faxmail kann konfiguriert werden welche Bestandteile der E-Mail verschickt wird:

* 0: Alle Bestandteile der E-Mail werden konvertiert und verschickt (auch der E-Mail-Text)
* 1: Nur der Anhang wird gefaxt


#### Konvertierung der E-Mail-Bestandteile anpassen

Unter `/var/spool/hylafax/mimetype` liegen die Konverterskripte. Diese zerlegen die eingehende EMail, je nach mimetype, in ihre Bestandteile und konvertieren diese dann zu einer Faxnachricht. Liegt für einen mimetype kein Skript vor wir dieser Teil der EMail einfach ignoriert und nicht in das Fax mit eingebunden.
Folgende Skripte existieren:

|Skript|Beschreibung|
|---|---|
|application/pdf|Konvertiert einen PDF-Anhang in ein Fax|
|image/tiff|Konvertiert einen TIFF- oder TIF-Anhang in ein Fax|
|text/plain|Konvertiert den Plaintext-Body einer E-Mail in ein Fax|
|text/html|Konvertiert den HTML-Body einer E-Mail in ein Fax|
-->

## Print-to-Fax

Das Print-to-Fax-Gateway kann sowohl für den automatischen Dokumentenversand aus z. B. ERP Systemen als auch für dialogbasierte Aufträge mit dem Desktop-Client genutzt werden.

{{% notice warning %}}
Print-to-Fax wird im Cloudstack und in pascom 18 nicht unterstützt.     
Wenn Sie eine ältere pascom Version selbst gehostet im Einsatz haben finden Sie die Einrichtungs-Anleitung für Print-to-Fax in unserer [alten Dokumentation](https://www.pascom.net/doc-old/de/module/fax-server/#print-to-fax).
{{% /notice %}}

<!-- 
#### Betriebsart festlegen

Legen Sie bei der [Konfiguration des Fax-Servers]({{< relref "#fax-server-konfigurieren">}}) fest, wie Sie das Print-to-Fax-Gateway verwenden möchten.

#### Steuerfelder einfügen

Damit das Faxsystem die Zielnummer und eventuell weitere Informationen aus dem Druckauftrag ermitteln kann, muss
das zu faxende Dokument mit Steuerfeldern ausgezeichnet werden. Da diese i. d. R. nicht mit an den Empfänger
übermittelt werden sollen, können Sie diese im produktiven Betrieb z. B. auch weiß einfärben.

|Ausdruck|Bedeutung|
|---|---|
|@@+FAX:0991....@@|Die Rufnummer des Empfängers. Dies ist das einzige Pflichtfeld!|
|@@+TAG:Bestellung 12345@@|Individuelle Jobkennung, wird in Listen und Benachrichtigungen angezeigt|
|@@+NOTIFY:mustermann@pascom.net@@|Über den Fortschritt zu benachrichtigender User.|
|@@+PRIO:100@@|Priorität des Auftrags (0-255). Aufträge mit niedriger Priorität werden bevorzugt verschickt. Default ist 200. Prioritäten verwenden Sie in Zusammenhang mit lange andauernden großvolumigen Batchaufträgen, welche dann i. d. R. eine Priorität von z. B. 250 bekommen. Ansonsten müssten alle manuellen Faxvorgänge warten, bis der Batchjob abgeschlossen ist.|

#### Mögliche Probleme
Damit das System die Steuerzeichen auswerten kann, muss der Druckauftrag zunächst in ein Textformat gewandelt werden. Je nach Komplexität des Druckauftrags, verwendeten Schriftarten und Art des Druckertreibers kann es an dieser Stelle Komplikationen geben.

Folgende Punkte sollten Sie beachten:

* Halten Sie sich an die empfohlene Treibereinrichtung.
* Versuchen Sie bei Problemen die Steuerzeichen in einer Standardschriftart wie etwa Arial 10 einzutragen.


### Druckertreiber einrichten

#### Mac

* Gehen Sie in die Systemeinstellungen Ihres Macs zu {{< ui-button "Drucken und Faxen" >}}.
* Fügen Sie über {{< ui-button "+" >}} einen neuen Drucker hinzu.
* Geben Sie nun folgende Optionen im Tab {{< ui-button "IP" >}} ein:

|Option|Einstellung|
|---|---|
|Protokoll|IPP|
|Adresse|ihreAnlage:631|
|Warteliste|printers/sendfax|

#### Windows

* Fügen Sie unter {{< ui-button "Systemsteuerung" >}} > {{< ui-button "Drucker und Faxgeräte" >}} einen neuen Netzwerkdrucker ein.
* Überspringen Sie die automatische Suche.
* Wählen Sie *Freigegebenen Drucker über den Namen auswählen* und geben Sie hier folgendes ein: *http://ihreAnlage:631/printers/sendfax*
* Wählen Sie den geeigneten Druckertreiber aus:

|Betriebssystem|Druckertreiber|
|---|---|
|Windows 7|Xerox 6120PS|
|Windows 8.1|Dell Printer 3100cn PS|
|Windows 10|Microsoft Print to PDF|
-->
<!-- |Windows 2012 R2 |Dell Open Print Driver (PS)|-->
