---
title: Queuemetrics
keywords:
    - Queuemetrics Intregraton
    - Auswertung von Warteschleifen (Teams) und deren Agenten
    - Loway
description: Queuemetrics ist eine Software für Callcenter zur Auswertung von Warteschleifen (Teams) und deren Benutzern.
url: /integrationen/queuemetrics/
prev: /integrationen/
next: /integrationen/wombatdialer/
weight: 101
toc: true
---

## Übersicht

Queuemetrics ist eine [Software für Callcenter](https://www.pascom.net/de/call-center/) zur Auswertung von Warteschleifen (Teams) und deren Benutzern. Queuemetrics wird auf einem separatem Server installiert und speichert seine Daten in einer MySQL Datenbank. Die MySQL Datenbank kann entweder auch auf dem Queuemetrics-  oder einen beliebigen anderen Server installiert werden. mobydick schreibt die zur Auswertung nötigen Daten ebenfalls in den MySQL Server.

## Konfiguration

### Queuemetrics- und MySQL Server aufsetzten
Queuemetics ist ein Produkt der Firma Loway. Laden Sie sich die neueste Queuemetrics Version herunter und folgen Sie der Anleitung des Herstellers um den Server einzurichten. Für das Setup benötigen Sie auch einen MySQL Server. Machen Sie auch hier ein Standardsetup und passen die Datenbanken und Benutzer gemäß der Queuemetrics Anleitung an. Wie empfehlen Ihnen Queuemetrics und den MySQL Server auf dem selben Server zu betrieben.
Standardmäßig liest Queuemetrics die Warteschleifen-Daten nicht aus der Datenbank sondern versucht lokal die Datei /var/log/asterisk/queues.log zu finden.
Dises Verhalten können Sie in der Weboberfläche von Queuemetrics unter Administrative tools > Edit system parameters einstellen:

    ..
    default.queue_log_file=sql:P001
    ..

### MySQL Server für mobydick vorbereiten

#### Bindings prüfen
Damit mobydick die Warteschleifen-Daten in den MySQL Server schreiben kann benötigen wir externen Zugriff auf den MySQL Server. In manchen Installationen bindet sich der MySQL Server auf den localhost und ist daher von anderen Hosts aus nicht zugänglich. Prüfen Sie das in der Datei /etc/mysql/my.conf (Dateiname und Pfad kann je nach Setup variieren) und ändern das Binding auf 0.0.0.0.

    ..
    bind-address = 0.0.0.0
    ..
Danach müssen Sie den MySQL Server neu starten:

    /etc/init.d/mysql restart

#### Benutzer anlegen
Auch empfiehlt es sich für den Zugriff der mobydick einen eigenen Benutzer am MySQL Server anzulegen und nicht den Queuemetrics Benutzer zu verwenden. Starten Sie die MySQL Console:

    mysql -u root -p

Hier müssen Sie nun das root Passwort für den MySQL Server eingeben. Dies haben Sie in der Regel beim Setup des MySQL Servers selbst vergeben.


Auf der MySQL Console legen Sie dann einen eigenen Benutzer für mobydick an:

    mysql> grant all privileges on *.* to USERNAME@'%' identified by 'PASSWORT';

Ersetzen Sie USERNAME und PASSWORT mit beliebigen Werten. Dies gibt dem USERNAME alle Rechte auf alle Datenbanken des Servers. Wenn Sie, wie empfohlen, einen dedizierten MySQL Server für Queuemetrics verwenden ist das in Ordnung. Falls nicht, sollten Sie die Zugriffe an dieser Stelle einschränken.

#### Verbindung prüfen
Loggen Sie sich auf der mobydick per SSH ein und testen mit folgender Befehlszeile ob die Verbindung zur Queuemetrics Datenbank funktioniert:

    mysql -h DB_HOST -u USERNAME --password=PASSWORT DB_NAME

Ersetzen Sie USERNAME und PASSWORT mit den eben angelegten Benutzerdaten. DB_HOST ist der Host auf dem die Datenbank läuft und DB_NAME der Name der Queuemetrics Datenbank.

### mobydick konfigurieren

#### Queuemetrics Datenbank anbinden
Loggen Sie sich auf der mobydick Weboberfläche ein und wählen Sie den Menüpunkt Erweitert > Queuemetrics:


|Parameter|Bedeutung|
|---------|---------|
|Queuemetrics Anbindung aktiv|	Wenn Sie hier ja wählen startet mobydick den Dienst der die Warteschleifen-Daten kontinuierlich in der Queuemetrics Datenbank speichert|
|IP/Host Mysql Server|	Geben Sie hier den Host an auf dem der MySQL Server läuft|
|DB Portnummer|	Tragen Sie hier den Port des MySQL Servers ein (Standard ist 3306)|
|Datenbankname|	Der Datenbankname der Queuemetrics Datenbank|
|DB Benutzername|	Der Name des für den mobydick-Zugriff erstellen Benutzers|
|DB Passwort|	Das Passwort des für den mobydick-Zugriff erstellen Benutzers|
|QueueMetrics URL|	Die URL des QueueMetrics-Servers|
|API Benutzer|	Der API- Benutzer auf dem Queuemetrics-Server (Infos dazu entnehmen Sie bitte hier)|
|API Passwort|	Das Passwort des API-Benutzers|

Speichern Sie die Konfiguration ab und wenden Sie die erzeugen Jobs an.

#### Asterisk Manager Interface konfigurieren
Für die Kommunikation mit dem Mobydick Server benötigt man Queuemetrics Zugriff auf das Asterisk Manager Interface (AMI)
Hierzu müssen Sie (falls noch nicht geschehen) zuerst das AMI für öffentliche Zugriffe freischalten. Dies machen Sie unter Appliance > Dienste im Tab Telefonie indem Sie Erlaubte AMI Verbindungen auf öffentlich stellen.

 Legen Sie nun auf der mobydick einen Manager Account für Queuemetrics unter Appliance > Asterisk Managerkonten an:


Manager Account eintragen
Den zuvor in mobydick erstellen Manager Account tragen Sie in der Queuemetrics Weboberfläche unter Administrative tools > Edit system parameters ein:
..
callfile.dir=tcp:USERNAME:PASSWORT@MOBYDICK_HOST
..
Ersetzten Sie USERNAME  und PASSWORT mit den Benutzerdaten des zuvor erstellten Manager Accounts. Statt MOBYDICK_HOST tragen Sie die IP-Adresse oder den Hostnamen des mobydick Servers ein.

## Fehleranalyse
### Laden der Daten von mobydick zu Queuemetrics prüfen
Um zu sehen ob die Übertragung der Daten von mobydick in die Queuemetrics Datenbank funktioniert können Sie das qloader.log einsehen:

    root@mobydick:/var/log/asterisk# tail /var/log/asterisk/qloader.log
     |Tue May 14 14:52:53 2013|QueueMetrics MySQL loader - $Revision: 1.29 $
     |Tue May 14 14:52:53 2013|Partition P001 - PID 9161 - TZ offset: 0 s. - Heartbeat after 900 s.
     |Tue May 14 14:52:53 2013|Now connecting to DB queuemetrics on 10.5.6.207 as user mobydick with password queuemetrics
     |Tue May 14 14:52:53 2013|Ignoring all timestamps below 0
### Manager Verbindung testen
Loggen Sie sich in der Queuemetrics Weboberfläche ein. Unter dem Punkt System diagnostic tools > AMI tester können Sie die Verbindung zur mobydick testen. Das Ergebnis sollte in etwa wie folgt aussehen:

    Status
    AMI URL: tcp:queuemetrics:queuemetrics@10.5.6.77:5038
    callfile.agentremovemember_ht is OK
    callfile.agentaddmember_ht is OK
    callfile.agentlogoff is OK
    callfile.agentlogin is OK
    Skipping check for $EM@from-internal
    callfile.monitoring is OK
    Skipping check for $EM@from-internal
    callfile.customdial is OK
    ...
    Asterisk dialog was OK
    AMI Dialog took 6289 ms
### Queuemetrics-Jobs im Commander
Haben Sie im Commander alles richtig eingetragen und gespeichert, müssen Sie noch zwei Jobs anwenden:

Sind die Jobs erfolgreich gelaufen, sollten Sie folgende Meldung erhalten:

Bei jedem Telefonie anwenden wird Queuemetrics synchronisiert:
