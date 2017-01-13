---
title: Snom Tischtelefone 300er und 700er Serie
keywords:
    - snom
    - tischtelefon
    - provisionieren
    - 300, 320, 360, 370, 710, 715, 720, 760
    - D705, D715, D725, D765
    - blf
    - besetztlampenfeld
    - busylampfield
    - firmware
description: Integrieren Sie Ihre Snom IP-Tischtelefone in die mobydick.
url:  /endgeraete/snom-tischtelefone-300-700-serie/
prev: /endgeraete/
next: /endgeraete/beliebiges-ip-geraet-einrichten/
weight: 41
toc: true

---

## Kompatibilität

|Sichere Provisionierung|Firmware-Verwaltung|Fernsteuerung|TLS|SRTP|
|---|---|---|---|---|
|ja|ja|ja|ja|ja|


## Konfiguration

mobydick ist in der Lage IP-Telefone des Herstellers Snom automatisch und zentral zu konfigurieren. Diesen Vorgang nennt man Provisionierung. Dazu stellt mobydick eine Basis-Konfiguration (`Endgeräte` > `Basis-Konfigurationen`) zur Verfügung. Diese ist ausreichend vorparametriert und muss nur in manchen Fällen angepasst werden.

{{% notice tip%}}
Bei Neuinstallationen sollten Sie den Provisionierungsvorgang zuerst mit einem Telefon testen. War dies erfolgreich können Sie alle weiteren IP-Telefone in Betrieb nehmen.
{{% /notice %}}

### Vorbereitung

Für die automatische Inbetriebnahme ist ein funktionierender DHCP-Server zwingend erforderlich. Lesen Sie dazu
[Netzwerk planen und konfigurieren](/../server/netzwerk-konfigurieren/).

### Inbetriebnahme

Stecken Sie das IP-Telefon an das Netzwerk. Das Telefon enthält einen eingebauten Switch, benutzen Sie den Ethernet-Port mit der Bezeichung **NET**. Falls Sie kein **PoE** (Power over Ethernet) verwenden, stecken Sie das Telefon an den Netzstrom.

Das IP-Telefon bootet nun, zieht sich vom DHCP eine IP-Adresse und die passende Basis-Konfiguration. Nach diesem Vorgang trägt mobydick das IP-Telefon automatisch in die Geräteliste unter `Endgeräte` > `Geräteliste` ein und legt ein entsprechendes SIP-Peer an.

Das SIP-Peer wird automatisch angelegt. Benutzername und Passwort werden automatisch generiert. Der Benutzername besteht aus einer zufälligen Zeichenfolg und den letzten sechs Stellen der Geräte-MAC-Adresse und hat insgesammt 15 Stellen. Das Passwort ist ebenfalls 15-stellig. Da die IP-Telefone automatisch provisioniert werden, müssen Sie die Daten niemals manuell eingeben. Es ist auch nicht möglich die Benutzerdaten zu ändern. Dies erhöht die Sicherheit gegen SIP-Brute-Force-Attacken beträchtlich.

Als Bezeichung des Telefons wird automatisch die Herstellerbezeichung gefolgt von der MAC-Adresse vergeben. Da auf dem Telefongehäuse die MAC-Adresse vermerkt ist, lässt sich vor Ort das IP-Telefon  einfach zuordnen.

Nach der erfolgreichen Provisionierung sollte das IP-Telefon am Display die richtige Sprache, die richtige Zeit und den Text *Nur Notrufe* (oder *Emergency only*) anzeigen.

{{% notice info%}}
Nach der Provisionierung des IP-Telefons wird von mobydick der Admin-User neu gesetzt.
<br>Username: *admin*
<br>Passwort: *0000*
{{% /notice %}}

### Benutzer zuweisen

Nachdem das IP-Telefon in der Geräteliste erscheint kann es bearbeitet werden. Klicken Sie hierzu auf `Bearbeiten`. Im Tab `Zuweisung` kann dem Telefon ein [Benutzer (oder Arbeitsplatz)](/../benutzer/benutzer-arbeitsplaetze/) zugewiesen werden.

Nach dem Speichern und Anwenden der Telefoniekonfiguration werden die neu zugewiesenen IP-Telefone neugestartet.

<!-- **Schnelle Geräteinbetriebnahme (bis mobydick Version 7.12)** -->

### Provisioniereung testen

Am einfachsten kann man die erfolgreiche Provisionierung testen, indem man intern von einem IP-Telefon auf ein anderes anruft.

Sie können sich auch auf die mobydick per SSH einloggen und über die Asterisk-CLI die Anmeldung prüfen.

     root@mobydick:/etc/admin# asterisk  -r
     Asterisk certified/11.6-cert15, Copyright (C) 1999 - 2013 Digium, Inc. and others.
     Created by Mark Spencer <markster@digium.com>
     Asterisk comes with ABSOLUTELY NO WARRANTY; type 'core show warranty' for details.
     This is free software, with components licensed under the GNU General Public
     License version 2 and other licenses; you are welcome to redistribute it under
     certain conditions. Type 'core show license' for details.
     =========================================================================
     Connected to Asterisk certified/11.6-cert15 currently running on mobydick (pid = 7412)
     mobydick*CLI> sip show peers
     Name/username             Host                       Dyn Forcerport ACL Port     Status      Description
     ag1O4pCWU283f91/ag1O4pCWU 10.1.3.128                  D   a             5060     OK (27 ms)
     VanGtc1Nw750314/VanGtc1Nw 10.1.3.141                  D   a             5060     OK (12 ms)
     dFMz2RFMH2734e1/dFMz2RFMH 10.1.3.85                   D   a             5060     OK (21 ms)
     3 sip peers [Monitored: 3 online, 0 offline Unmonitored: 0 online, 0 offline]
     mobydick*CLI>

Konnte sich ein IP-Gerät ordnungsgemäß anmelden, sehen Sie den Status **OK**. Der Wert in den Klammern zeigt an wie lange es dauert bis das IP-Gerät auf ein SIP-Paket antwortet.

### mobydick Menütaste

Nach der Provisionierung entspricht die **Menü**-Taste am Snom IP-Telefon nicht mehr dem Telefon-Menü, sondern ruft das telefonspezifische mobydick Menü auf. Hier sind mobydick Funktionen hinterlegt:

|Funktion|Beschreibung|
|---|---|
|Telefonbuch|Ruft dads mobydick Telefonbuch auf.|
|Journal|Zeigt verpasste, angenommene und gewählte Anrufer an|
|Rufumleitung|Setzt eine Rufumleitung, aktiviert/ändert schon eine gesetzt Rufumleitung oder deaktiviert eine aktiver Rufumleitung.|
|Voicmailbox|Voicemailbox-Menü zum Einschalten/Ausschalten und Abhören der eigenen Voicemailbox|
|Anmelden|Hier kann ein Benutzer sich an dem Arbeitsplatz anmelden.|
|Abmelden [*benutzername*]|Der bereits angemeldete Benutzer kann sich an dem Arbeitsplatz abmelden.|
|Warteschlagen|Dient zur Verwaltung der Warteschlagen (anmelden, abmelden, pausieren...).|

{{% notice tip%}}
Setzten Sie Rufumleitungen nur über das mobydick Menü, da diese Rufumleitungen über die mobydick Verwaltet werden können.
{{% /notice %}}

{{% notice info%}}
Die Verwendung der DND-Taste (*do not disturb*) am Snom hat zur Folge, dass die Durchwahl am Telefon nicht erreichbar ist. Der DND-Hinweis erscheint nur am Telefon und hat für die mobydick (z. B. Desktop Client) keine weitere Bedeutung.
{{% /notice %}}

### Tasten belegen

Funktionstasten können am Snom IP-Telefon über die Web-UI eingerichtet werden.

**IP-Adresse des Telefons anzeigen**

Tippen Sie die Taste **?** bzw. **Help** um die IP-Adresse Ihres Telefon anzuzeigen, anschließend wird diese am Display angezeigt. Geben Sie die I-Addesse in der Adresszeile Ihres Webbrowsers ein. Sie sehen nun die Konfigurationsoberfläche. KLicken Sie in der Menüliste auf der linken Seite auf Funktionstasten.

**Andere Nebenstellen überwachen mit BLFs**

Hier können Sie Funktionstasten einrichten, um andere Nebenstellen zu überwachen.

|Kontext|Typ|Nummer|Kurzform|
|---|---|---|---|
|Account wählen|**Nebenstelle**|Die zu überwachende Durchwahl (z. B. 123) in der Form <sip:123@192.168.100.1>.|Besitzt das Telefon ein zweites Display, können hier die Tasten beschriftet werden.|

Die BLF-Taste (Besetztlampenfeld oder Busy Lamp Field) gibt Informationen über den Status der überwachten Durchwahl.
Neben Benutzer-Durchwahlen können auch Einbuchcodes für Warteschlangen oder Durchwahlschalter konfiguriert werden.

**Weitere Funktionstasten**

|Funktionstaste|Beschreibung|
|---|---|
|**Direktwahl**|Hier kann eine Telefonnummer hinterlegt werden.|
|**DTMF**|Hier können DTMF-Zeichen hinterlegt werden.|

<!-- ### Basis-Konfiguration

### Firmwareupdate -->
