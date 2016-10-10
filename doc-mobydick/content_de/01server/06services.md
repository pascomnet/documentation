---
title: Dienste konfigurieren
keywords:
    - Konfiguration
    -  DHCP-Server der mobydick nutzen
    -  DHCP-Server per Weboberfläche konfigurieren
    -  DHCP-Server-Konfiguration manuell erweitern
    -  Windows DHCP-Server nutzen
    -  mobydick und Windows DHCP im Mischbetrieb
    -  Linux DHCP-Server nutzen
    -  Weitere DHCP-Server nutzen
description: Konfiguration des mobydick, Windows, Linux oder anderen DHCP-Servern zur Verteilung von IP-Adresse und Konfigurationsserver an die IP-Telefone
linken: /server/dienste/
url:  /server/dienste/
prev: /server/netzwerk-konfigurieren/
next: /server/sicherung/
weight: 16
toc: true

---

## mobydick Basisdaten ##

Bevor die mobydick in Betrieb genommen werden kann, müssen noch einige Basisdaten eingegeben werden. Klicken Sie in der Web-UI auf `Appliance` > `Dienste` und bleiben Sie vorerst im Tab `Basisdaten`:

|Einstellung|Beschreibung|
|---|---|
|Hostname|Der Hostname der mobydick (falls Sie den nicht ändern lautet er **mobydick**)|
|Domain-Suffix|Ihr Domain-Suffix|
|Primärer Nameserver|interner oder externer DNS-Server|
|Sekundärer Nameserver|optional ein zusätzlicher DNS-Server|
|Benachrichtigungsadresse|E-Mail-Adresse eines Mitarbeiters oder eines E-Mail-Verteilers, der Benachrichtigungen von der mobydick erhalten soll|
|Absenderadresse|eine E-Mail-Adresse mit der die mobydick E-Mails verteilen kann|


## Mail-Server

Auf der mobydick läuft ein Mailserver. Dieser Server sollte so eingestellt werden, dass er seine E-Mails an Ihren SMTP Server weiterleitet.  
Entweder betreiben Sie direkt in Ihrem Haus einen SMTP Server oder Ihr Provider erledigt das für Sie. Zur Konfiguration muss Ihnen die IP oder der DNS-Name Ihres SMTP Servers bekannt sein. Außerdem kann es erforderlich sein (insbesondere bei SMTP-Server eines Providers), dass man sich per Benutzername und Passwort authentifizieren muss.

{{% notice note %}}
Der Mail-Server wird benötigt um Voice-Mails, Faxe, Telefon-Mitschnitte oder Benachrichtigungen der mobydick zu versenden.  
Richten Sie hierzu auf Ihrem Mailserver ein E-Mail-Konto für mobydick ein. Dieses Konto wird nur E-Mails versenden, nicht empfangen.
{{% /notice %}}

### Konfiguration ###

Zur Konfiguraton des Mail-Server klicken Sie in der WEB-UI aus `Appliance` > `Dienste` > im Tab `EMail-Server`:

|Einstellungen|Beschreibung|
|---|---|
|Sichtbarer Domain-Name|Tragen Sie hier den Teil nach dem @-Zeichen Ihrer E-Mail-Adresse|
|Mail-Server für Weiterleitung|mobydick sendet die E-Mails nicht direkt an den jeweiligen Zielserver sondern nutzt einen Weiterleitungs-Server (Relay) <br>Falls ein anderer Port als 25 verwendet wird, tragen Sie diesen bitte wie in folgendem Beispiel ein: 192.168.100.1**::587**|
|SMTP-Benutzer und -Passwort|optionale Einstellung, falls eine SMTP-Authentifizierung benötigt wird|

### Einstellungen Testen ###

Um die Funktion des Mail-Servers zu testen loggen Sie sich über SSH auf Ihre mobydick an und werden Sie root. Versenden Sie eine Test-Mail mit folgendem Befehl, wobei Sie *max@chaosconsulting.com* durch Ihre Zieladresse ersetzen:

     admin@mobydick:~$ echo Test | mail -s Test max@chaosconsulting.com

Anschließend kontrollieren Sie das Log des Mail-Servers:

    root@mobydick:/etc/admin# tail -f /var/log/exim4/mainlog

Daraufhin erhalten Sie folgende Ausgabe und können sehen ob die E-Mail über Ihren SMTP-Server versendet werden konnte.

    2016-03-16 12:21:14 1NrUpm-0007gQ-Dk <= admin@chaosconsulting.com U=admin P=local S=368
    2016-03-16 12:21:14 1NrUpm-0007gQ-Dk => max@chaosconsulting.com R=smarthost T=remote_smtp_smarthost H=ihr.mailserver [192.168.1.10]
    2016-03-16 12:21:14 1NrUpm-0007gQ-Dk Completed


## NTP-Server Konfiguration

Viele Anwendungen der mobydick sind zeitgesteuert. Z. B. können Anrufer zu verschiedenen Uhrzeiten unterschiedlich geroutet werden. Auch wird die Uhrzeit des mobydick Servers automatisch auf alle IP-Telefone verteilt. Deshalb ist es wichtig einen NTP-Server zur Zeitsynchronisation zu konfigurieren.

{{% notice tip %}}
Wenn Sie keinen eigenen NTP-Server in Netzwerk haben benutzen Sie bitte den allgemein zugänglichen NTP-Server pool.ntp.org im Internet.
{{% /notice %}}

Tragen Sie den NTP-Server in der WEB-UI über `Appliance` > `Dienste` > im Tab `NTP-Server` ein.


## Verschlüsselte Telefonie über SRTP

Bei RTP (Real-Time Transport Protocol) handelt es sich um ein Protokoll  zur Übertragung von Multimedia-Datenströme über ein Netzwerk. In der IP-Telefonie wird es verwendet um Audio- und Videoströme eines Gespräches zu übertragen. mobydick ist in der Lage die Übertragung der Gespräche zu verschlüsseln über SRTP (Secure-RTP).  
Dies können Sie einstellen unter `Appliance` > `Dienste` > im Tab `Telefonie`

Folgende Einstellungen zu SRTP sind möglich:

|Einstellung|Beschreibung|
|----|---|
|deaktiviert|Als Defaulteinstellung ist SRTP deaktiviert.|
|aktiviert für alle unterstützten Geräte	|Unterstützte Geräte sind alle Geräte, die über die mobydick provisioniert werden können (z. B. die von der mobydick provisionierten IP-Endgeräte und das mobydick Softphone)|
|aktiviert für alle unterstützten Geräte und beliebige IP-Telefone/Softphones	|SRTP wird aktiviert für alle unterstützten Geräte und beliebige IP-Telefone oder Softphones.<br/>Bitte beachten Sie, dass Sie auf den Geräten, die nicht von der mobydick provisioniert werden, SRTP selber aktivieren müssen. Wenn Sie das nicht tun, kann bei aktiviertem SRTP der mobydick das Gerät nicht mehr anrufen.|

{{% notice note %}}
Allgemein kann SRTP nur für IP-Telefone/Softphones aktiviert werden und nicht für Gateways. Beim aktivieren von SRTP auf der mobydick werden nur interne Gespräche verschlüsselt, **nicht Gespräche die über ein Gateway oder einem SIP-Anbieter** nach außen gehen.
{{% /notice %}}

{{% notice warning %}}
Beim Aktivieren (bzw. Deaktivieren) wird der Asterisk neu gestartet, das bedeutet, dass alle laufenden Gespräche abgebrochen werden. Anschließend müssen alle IP-Telefone (z. B. über Massenneustart in der Geräteliste), alle mobydick Clients mit Softphones neu gestartet werden.
{{% /notice %}}
