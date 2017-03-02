---
title: Grandstream Tischtelefone GXP- und GXV-Serie
keywords:
    - grandstream
    - gxp2170, gxp2160, gxp2140, gxp2135, gxp2130
    - gxp1630, gxp1628, gxp1620, gxp1625, gxp1610, gxp1615
    - gxp1780, gxp1782, gxp1760
    - gxv3275, gxv3240
    - tischtelefon
    - provisionieren
    - blf
    - besetztlampenfeld
    - busylampfield
    - firmware
description: Integrieren Sie Ihre Grandstream IP-Tischtelefone in die mobydick.
prev: /endgeraete/yealink-ip-tischtelefone/
url:  /endgeraete/grandstream-tischtelefone-gxp-gxv-serie/
next: /endgeraete/snom-dect/
weight: 43
toc: true
draft: false
---

![Grandstream GXP2160](/grandstream_GXP2160.jpg)

## Kompatibilität

|Provisionierung|Firmware-Verwaltung|Fernsteuerung über Desktop-Client|pascom Menü|
|---|---|---|---|
|ja|ja|ja|nein|

**Provisionierung**: Das IP-Telefon wird über die mobydick verwaltet.<br>
**Firmware-Verwaltung**: Die Firmware kann über mobydick aktualisiert werden.<br>
**Fernsteuerung über Desktop-Client**: Gespräche können über den Desktop-Client gestartet werden.<br>
**pascom Menü**: Das pascom Menü ist nicht auf dem IP-Telefon hinterlegt.

## Konfiguration

mobydick ist in der Lage IP-Telefone des Herstellers Grandstream automatisch und zentral zu konfigurieren. Diesen Vorgang nennt man Provisionierung. Dazu stellt mobydick eine Basis-Konfiguration (`Endgeräte` > `Basis-Konfigurationen`) zur Verfügung. Diese ist ausreichend vorparametriert und muss nur in manchen Fällen angepasst werden.

{{% notice tip%}}
Bei Neuinstallationen sollten Sie den Provisionierungsvorgang zuerst mit einem Telefon testen. War dies erfolgreich können Sie alle weiteren IP-Telefone in Betrieb nehmen.
{{% /notice %}}

### Vorbereitung

Für die automatische Inbetriebnahme ist ein funktionierender DHCP-Server zwingend erforderlich. Lesen Sie dazu
[Netzwerk planen und konfigurieren](../../server/netzwerk-konfigurieren/).

### Inbetriebnahme

Stecken Sie das IP-Telefon an das Netzwerk. Das Telefon enthält einen eingebauten Switch, benutzen Sie den Ethernet-Port mit der Bezeichung **LAN**. Falls Sie kein **PoE** (Power over Ethernet) verwenden, stecken Sie das Telefon an den Netzstrom.

Das IP-Telefon bootet nun, zieht sich vom DHCP eine IP-Adresse und die passende Basis-Konfiguration. Nach diesem Vorgang trägt mobydick das IP-Telefon automatisch in die Geräteliste unter `Endgeräte` > `Geräteliste` ein und legt ein entsprechendes SIP-Peer an.

Das SIP-Peer wird automatisch angelegt. Benutzername und Passwort werden automatisch generiert. Der Benutzername besteht aus einer zufälligen Zeichenfolg und den letzten sechs Stellen der Geräte-MAC-Adresse und hat insgesammt 15 Stellen. Das Passwort ist ebenfalls 15-stellig. Da die IP-Telefone automatisch provisioniert werden, müssen Sie die Daten niemals manuell eingeben. Es ist auch nicht möglich die Benutzerdaten zu ändern. Dies erhöht die Sicherheit gegen SIP-Brute-Force-Attacken beträchtlich.

Als Bezeichung des Telefons wird automatisch die Herstellerbezeichung gefolgt von der MAC-Adresse vergeben. Da auf dem Telefongehäuse die MAC-Adresse vermerkt ist, lässt sich vor Ort das IP-Telefon  einfach zuordnen.

Nach der erfolgreichen Provisionierung sollte das IP-Telefon am Display die richtige Sprache, die richtige Zeit und den Text *Nur Notrufe* (oder *Emergency only*) anzeigen.

{{% notice info%}}
Nach der Provisionierung des IP-Telefons wird von mobydick der Admin-User neu gesetzt.
<br>Username: *admin*
<br>Passwort: *0000*
{{% /notice %}}

Das Passwort des Admin-Users am IP-Telefon kann über die Systemeinstellungen im Web-UI geändert werden. Suchen Sie in dem Suchfeld nach dem Parameter *sys.peripherals.access.password*. Geben Sie Ihren gewünschten Wert ein. Anschließend müssen Sie manuell die Telefonie-Konfiguration anwenden und die Endgeräte neustarten.

### Benutzer zuweisen

Nachdem das IP-Telefon in der Geräteliste erscheint kann es bearbeitet werden. Klicken Sie hierzu auf `Bearbeiten`. Im Tab `Zuweisung` kann dem Telefon ein [Benutzer (oder Arbeitsplatz)](../../benutzer/benutzer-arbeitsplaetze/) zugewiesen werden.

Nach dem Speichern und Anwenden der Telefoniekonfiguration werden die neu zugewiesenen IP-Telefone neugestartet.

### Funktion testen

Am einfachsten kann man die erfolgreiche Inbetriebnahme testen, indem man mit **\*100** die eigene Voicemailbox anruft. Daraufhin sollte die Ansage Ihrer Voicemailbox zu hören sein.


### Auf die Grandstream-Weboberfläche zugreifen

Um auf die Weboberfläche Ihres IP-Telefons zu gelangen benötigen Sie die IP-Adresse. Im Folgenden sind Möglichkeiten beschreiben, um diese in Erfahrung zu bringen:

**IP-Adresse am Telefons anzeigen**

Drücken Sie die runde Taste im Pfeil-Feld des Telefons. Über `Status` > `Netzwerkstatus` erhalten Sie die IP-Adresse Ihres Telefons.

**IP-Adresse über die Geräteliste ermitteln**

Loggen Sie sich in das Web-UI der mobydick ein. Klicken Sie auf `Endgeräte` > `Geräteliste`. Nun sehen Sie eine Übersicht über alle verfügbaren Geräte. Links von jedem Eintrag finden Sie ein *Info*-Symbol. Klicken Sie es an, erhalten Sie eine Übersicht über das provisionierte Telefon, unter anderem auch die IP-Adresse.

### Tasten belegen

Über das Web-UI können am Grandstream IP-Telefon Tasten belegt werden. Klicken Sie auf `Einstellungen` > `Programmierbare Tasten`. Es stehen zwei Arten von Tasten zur Verfügung:

**Virtual Multi-Purpose Keys**

Diese Tasten erscheinen auf dem Haupt-Display. Um diese Tasten zu konfigurieren klicken sie auf `Edit VPK`:

|Modus|Konten|Beschreibung|Wert|
|---|---|---|---|
|Besetztlampen Feld (BLF)|Konto 1|Bezeichung für die Taste|Durchwahl der Nebenstelle|

Zum Speichern klicken Sie auf `Sichern`. Die Einstellungen werden mit einem Klicke auf `Save VPK` wirksam.

{{% notice info%}}
Um die Einstellungen der Tasten zurückzusetzten klichen Sie auf `Neustart` und anschließend auf `Save VPK`.
{{% /notice %}}


**Multi-Purpose Keys**

Das sind je nach IP-Telefon-Model zusätzliche  programmierbare Tasten.
In der Übersicht sieht man die verfügbaren Multi-Funktionstasten die nun Konfiguriert werden können:

|Modus|Konten|Beschreibung|Wert|
|---|---|---|---|
|Besetztlampen Feld (BLF)|Konto 1|Bezeichung für die Taste|Durchwahl der Nebenstelle|

Beenden Sie die Konfiguration mit `Sichern und ausführen`, damit alle Änderungen aktiv sind.

{{% notice info%}}
Um die Einstellungen der Tasten zurückzusetzten klichen Sie auf `Neustart` und anschließend auf `Sichern und ausführen`.
{{% /notice %}}

### Basis-Konfiguration




<!--
### Firmwareupdate -->
