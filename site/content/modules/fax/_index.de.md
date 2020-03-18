---
title: FAX Server
description: Lernen Sie den virtuellen Fax Server Ihrer pascom optimal einzurichten.
weight: 10
---

{{< doctype "both"  >}}

{{< description >}}

## Trainingsvideo

{{< youtube ZVieZBOLqDE >}}

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
|Anzahl Sendeversuche|Gibt an, wie viele Versuche unternommen werden um ein Fax zu versenden, falls die Gegenstelle kurzzeitig nicht erreichbar ist.|


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


#### Virtuelles Teamfax

Unter {{< ui-button "Benutzer" >}} > {{< ui-button "Teams" >}} > Team auswählen und {{< ui-button "Bearbeiten" >}} im Tab {{< ui-button "Faxgerät" >}} kann für einen schon bestehenden Benutzer ein Faxgerät angelegt werden. Setzen Sie das Häckchen bei *Team Fax konfigurieren*:

|Einstellung|Beschreibung|
|---|---|
|E-Mail|Geben Sie hier die E-Mail-Adresse des Teams ein. Über diese E-Mail-Adresse erhält das Team empfangene Faxe und je nach Konfiguration die Bestätigung über ein versendetes Fax.|
|Durchwahl|Geben Sie hier die Faxdurchwahl des Team-Faxes an. Lesen Sie bitte hierfür folgendes [Howto zum Vergeben von Durchwahlen]({{< relref "/howto/extensions">}})|
|ausgehende Faxkennung|Hier kann optional eine ausgehende Faxkennung angegeben werden.|




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

{{% notice warning %}}
Nachfolgende Anpassungen sind nur möglich, wenn Sie eine **Onsite pascom Telefonanlage** verwenden!
{{% /notice %}}

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


## Print-to-Fax

Das Print-to-Fax-Gateway kann sowohl für den automatischen Dokumentenversand aus z. B. ERP Systemen als auch für dialogbasierte Aufträge mit dem Desktop-Client genutzt werden.

{{% notice warning %}}
Print-to-Fax wird im Cloudstack und in pascom 18 nicht unterstützt.     
Wenn Sie eine ältere pascom Version selbst gehostet im Einsatz haben finden Sie die Einrichtungs-Anleitung für Print-to-Fax in unserer [alten Dokumentation](https://www.pascom.net/doc-old/de/module/fax-server/#print-to-fax).
{{% /notice %}}
