---
title: IP Tischtelefone
keywords: 
    - snom 715, 720 und 760 Telefone
    - snom D705, D715, D725 und D765 Telefone
    - snom 300
description: Integrieren Sie Ihre Snom IP Tischtelefone. Alle Modelle werden von mobydick unterstützt 
url:  /endgeraete/ip-tischtelefone/
prev: /endgeraete/
next: /endgeraete/beliebiges-ip-geraet-einrichten/
weight: 41
toc: true

---


{{% notice warning%}}
Notwendige Voraussetzung
Für die automatische Inbetriebnahme von SNOM, Aastra, Yealink und Auerswald IP-Telefonen ist ein funktionierender DHCP-Server zwingend erforderlich. Siehe DHCP-Server Konfiguration.
{{% /notice %}}

## Konfiguration

### Automatische Inbetriebnahme von snom IP-Telefonen

{{% notice tip%}}
Bei Neuinstallationen sollten Sie den Provisionierungsvorgang zuerst mit einem Telefon testen. War dies erfolgreich können Sie alle weiteren IP-Telefone in Betrieb nehmen
{{% /notice %}}

mobydick ist in der Lage IP-Telefone der Hersteller SNOM, Aastra, Yealink und Auerswald automatisch, zentral zu konfigurieren. Diesen Vorgang nennt man Provisionierung. Dazu stellt mobydick für jeden der Hersteller eine Basis-Konfiguration (`ndgeräte > Basis-Konfigurationen`) zur Verfügung. Diese ist in vielen Fällen ausreichend vorparametriert und muss nur in manchen Fällen angepasst werden.

Stecken Sie das IP-Telefon an das Netzwerk und, falls Sie kein PowerOverEthernet nutzen, an den Netzstrom. Das IP-Telefon bootet nun, zieht sich vom **DHCP** eine IP-Adresse und die passende Basis-Konfiguration. Nach diesem Vorgang trägt mobydick das IP-Telefon **automatisch** in die Geräteliste ein und legt ein entsprechendes SIP-Peer an:
![Screenshot - mobydick Engeräteliste mit snom](../../images/snom_devicelist.png?width=90% "mobydick Engeräteliste mit snom")
Für jedes Gerät wird automatisch ein SIP-Peer angelegt. Benutzername und Passwort werden automatisch generiert. Der Benutzername besteht aus einer zufälligen Zeichenfolge gefolgt von den letzten 6 Stellen der Geräte-MAC-Adresse und hat insgesamt 15 Stellen. Das Passwort ist ebenfalls 15-stellig. Da die IP-Telefone automatisch provisioniert werden müssen Sie die Daten niemals manuell eingeben. Es ist nicht möglich die Benutzerdaten zu ändern. Dies erhöht die Sicherheit gegen SIP Brute Force Attacken beträchtlich.

![Screenshot - snom Endgerätekonfiguration](../../images/snom_endgeraet_details.png?width=90% "snom Endgerätekonfiguration in mobydick")

Als Bezeichnung wird hier automatisch der Telefontyp gefolgt von der MAC-Adresse vergeben. Auf den meisten IP-Telefonen ist die MAC-Adresse am Telefongehäuse vermerkt. Somit lässt sich das IP-Telefon vor Ort einfach zuordnen. Wenn Sie möchten können Sie an dieser Stelle die Bezeichnung anpassen und z. B. die Raumnummer, -namen o. Ä. ergänzen:
![Screenshot - snom MAC-Adresse](../../images/snom_endgeraet_label.png?width=90% "snom MAC-Adresse in mobydick")

Nach erfolgreicher Provisionierung sollte IP-Telefon Display die richtige Sprache, das korrekt Datum und den Text Emergency only. Da das Telefon noch keinem Benutzer zugeteilt ist befindet es sich nun im Notrufmodus. Hier kann man Notrufe wählen oder per *88Durchwahl Benutzer zuweisen.

Ein paar Beispiele:
Snom 3er Serie
	
Snom 7er Serie
	
Snom 8er Serie
		

Nach der Provisionierung des IP-Telefons wird von der mobydick der Admin-User neu gesetzt. Dieser hat nun als Username: admin und als Passwort: 0000.

 

Als nächstes fahren Sie mit Benutzer und Arbeitsplätze anlegen fort.
Schnelle Gerätegeräteinbetriebnahme

Eine schnelle Geräteinbetriebnahme erfolgt mit der Systemvariable *88. Dies erspart bei der Inbetriebnahme vieler Telefone viel Zeit.
Sobald das IP-Telefon in der Geräteliste erscheint, tippen Sie am IP-Telefon *88 gefolgt von der Durchwahl, die der neue Benutzer des IP-Telefons hat, um zu reservieren (z. B. *88123, wenn der Benutzer die Duchwahl 123 hat).

Aktualisieren Sie die Ansicht in der Geräteliste. Erscheint eine lila Markierung bei dem Info-Symbol des Geräts. Setzen Sie in Häkchen bei jedem Gerät mit der lila Markierung. Klicken Sie auf Aktion -> Schnelle Geräteinbetriebnahme.

Anschließend sehen Sie noch eine Übersicht über alle mit *88 in Betrieb genommenen IP-Telefon. Klicken Sie auf Speichern. Nach einem Neustart der Geräte sind die Benutzer den IP-Telefonen zugeordnet.


Fehleranalyse
Anmeldung der IP-Telefone manuell prüfen

Loggen Sie sich auf der mobydick per SSH ein. Öffnen Sie das asterisk CLI und geben dort sip show peers ein:

	

    admin@mobydick:~$ su
    Passwort: 
    root@mobydick:/etc/admin# asterisk -r
    Asterisk 1.8.11.1-1digium1~squeeze, Copyright (C) 1999 - 2012 Digium, Inc. and others.
    Created by Mark Spencer <markster@digium.com>
    Asterisk comes with ABSOLUTELY NO WARRANTY; type 'core show warranty' for details.
    This is free software, with components licensed under the GNU General Public
    License version 2 and other licenses; you are welcome to redistribute it under
    
    certain conditions. Type 'core show license' for details.
    =========================================================================
    Connected to Asterisk 1.8.11.1-1digium1~squeeze currently running on mobydick (pid = 3794)
    Verbosity is at least 3
    mobydick*CLI> sip show peers 
    Name/username              Host                Dyn Forcerport ACL Port   Status     
    k6B4Ugpmn453fbf/k6B4Ugpmn  192.168.1.102       D   N             5060    OK (9 ms)  
    kXIOVKh1c260a1b/kXIOVKh1c  192.168.1.101       D   N             1024    OK (23 ms) 
    max_softphone/max_softpho  192.168.1.200       D   N             35958   OK (7 ms)  
    3 sip peers [Monitored: 3 online, 0 offline Unmonitored: 0 online, 0 offline]
    mobydick*CLI> 
    Disconnected from Asterisk server
    root@mobydick:/etc/admin#

Konnte sich das Gerät ordnungsgemäß anmelden sehen Sie den Status OK und in Klammern einen Wert in Millisekunden. Dieser Wert zeigt an wie lange es dauert bis das Gerät auf ein SIP-Paket antwortet.

Auch können Sie in der asterisk CLI beobachten wenn sich ein Telefon anmeldet. Hier ein Beispiel in dem max_softphone versucht sich mit falschem Passwort anzumelden:
1
2
3
	
mobydick*CLI> 
[Nov 26 11:21:28] NOTICE[3821]: chan_sip.c:24937 handle_request_register: Registration from '"Max"<sip:max_softphone@192.168.1.1>' failed for '192.168.1.200:23062' - Wrong password
mobydick*CLI>

Haben Sie Probleme ein Gerät anzumelden und können nicht gleich erkennen woran es liegt können Sie den SIP Debug zuschalten. Als IP-Adresse geben Sie die Adresse des Gerätes ein:
1
	
mobydick*CLI> sip set debug ip 192.168.1.200

Jetzt sehen Sie alle SIP Details während des Anmeldeversuches des IP-Telefones. Vergessen Sie nicht den debug wieder auszuschalten:
1
	
mobydick*CLI> sip set debug off