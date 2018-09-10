---
title: Grandstream Tischtelefone GXP- und GXV-Serie
description: Integrieren Sie Ihre Grandstream IP-Tischtelefone in die pascom.
weight: 50
---

![Grandstream GXP2160](grandstream_GXP2160.jpg?width=400px)

## Kompatibilität

|Provisionierung|Firmware-Verwaltung|Fernsteuerung über Desktop-Client|pascom Menü|
|---|---|---|---|
|ja|ja|ja|nein|

**Provisionierung**: Das IP-Telefon wird über die pascom verwaltet.<br>
**Firmware-Verwaltung**: Die Firmware kann über pascom aktualisiert werden.<br>
**Fernsteuerung über Desktop-Client**: Gespräche können über den Desktop-Client gestartet werden.<br>
**pascom Menü**: Das pascom Menü ist nicht auf dem IP-Telefon hinterlegt.

## Unterstütze IP-Telefone

Folgende IP-Telefone werden unterstützt:

+ Grandstream GXP 1610
+ Grandstream GXP 1615
+ Grandstream GXP 1620
+ Grandstream GXP 1625
+ Grandstream GXP 1628
+ Grandstream GXP 1630
+ Grandstream GXP 2130
+ Grandstream GXP 2135	 
+ Grandstream GXP 2160
+ Grandstream GXP 2170	 
+ Grandstream GXV 3240


## Konfiguration

pascom ist in der Lage IP-Telefone des Herstellers Grandstream automatisch und zentral zu konfigurieren. Diesen Vorgang nennt man Provisionierung. Dazu stellt pascom eine Basis-Konfiguration (`Endgeräte` > `Basis-Konfigurationen`) zur Verfügung. Diese ist ausreichend vorparametriert und muss nur in manchen Fällen angepasst werden.

{{% notice tip%}}
Bei Neuinstallationen sollten Sie den Provisionierungsvorgang zuerst mit einem Telefon testen. War dies erfolgreich können Sie alle weiteren IP-Telefone in Betrieb nehmen.
{{% /notice %}}

### Vorbereitung

Für die automatische Inbetriebnahme ist ein funktionierender DHCP-Server zwingend erforderlich.

### Inbetriebnahme

Stecken Sie das IP-Telefon an das Netzwerk. Das Telefon enthält einen eingebauten Switch, benutzen Sie den Ethernet-Port mit der Bezeichnung **LAN**. Falls Sie kein **PoE** (Power over Ethernet) verwenden, stecken Sie das Telefon an den Netzstrom.

Das IP-Telefon bootet nun, zieht sich vom DHCP-Server eine IP-Adresse und die passende Basis-Konfiguration. Nach diesem Vorgang trägt pascom das IP-Telefon automatisch in die Geräteliste unter `Endgeräte` > `Geräteliste` ein und legt ein entsprechendes SIP-Peer an.

Das SIP-Peer wird automatisch angelegt. Benutzername und Passwort werden automatisch generiert. Der Benutzername besteht aus einer zufälligen Zeichenfolge und den letzten sechs Stellen der Geräte-MAC-Adresse und hat insgesamt 15 Stellen. Das Passwort ist ebenfalls 15-stellig. Da die IP-Telefone automatisch provisioniert werden, müssen Sie die Daten niemals manuell eingeben. Es ist auch nicht möglich die Benutzerdaten zu ändern. Dies erhöht die Sicherheit gegen SIP-Brute-Force-Attacken beträchtlich.

Als Bezeichnung des Telefons wird automatisch die Herstellerbezeichnung gefolgt von der MAC-Adresse vergeben. Da auf dem Telefongehäuse die MAC-Adresse vermerkt ist, lässt sich vor Ort das IP-Telefon einfach zuordnen.

Nach der erfolgreichen Provisionierung sollte das IP-Telefon am Display die richtige Sprache, die richtige Zeit und den Text *Nur Notrufe* (oder *Emergency only*) anzeigen.

{{% notice info%}}
Nach der Provisionierung des IP-Telefons wird von pascom der Admin-User neu gesetzt.
<br>Username: *admin*
<br>Passwort: *0000*
{{% /notice %}}

Das Passwort des Admin-Users am IP-Telefon kann über die Systemeinstellungen im Web-UI geändert werden. Suchen Sie in dem Suchfeld nach dem Parameter *sys.peripherals.access.password*. Geben Sie Ihren gewünschten Wert ein. Anschließend müssen Sie manuell die Telefonie-Konfiguration anwenden und die Endgeräte neustarten.

### Benutzer zuweisen

Nachdem das IP-Telefon in der Geräteliste erscheint kann es bearbeitet werden. Klicken Sie hierzu auf `Bearbeiten`. Im Tab `Zuweisung` kann dem Telefon ein [Benutzer (oder Arbeitsplatz)]({{< ref "/user/user">}}) zugewiesen werden.

Nach dem Speichern und Anwenden der Telefoniekonfiguration werden die neu zugewiesenen IP-Telefone neugestartet.

### Funktion testen

Am einfachsten kann man die erfolgreiche Inbetriebnahme testen, indem man mit **\*100** die eigene Voicemailbox anruft. Daraufhin sollte die Ansage Ihrer Voicemailbox zu hören sein.


### Auf die Grandstream-Weboberfläche zugreifen

Um auf die Weboberfläche Ihres IP-Telefons zu gelangen benötigen Sie die IP-Adresse. Im Folgenden sind Möglichkeiten beschrieben, um diese in Erfahrung zu bringen:

**IP-Adresse am Telefon anzeigen**

Drücken Sie die runde Taste im Pfeil-Feld des Telefons. Über `Status` > `Netzwerkstatus` erhalten Sie die IP-Adresse Ihres Telefons.

**IP-Adresse über die Geräteliste ermitteln**

Loggen Sie sich in das Web-UI der pascom ein. Klicken Sie auf `Endgeräte` > `Geräteliste`. Nun sehen Sie eine Übersicht über alle verfügbaren Geräte. Links von jedem Eintrag finden Sie ein *Info*-Symbol. Klicken Sie es an, erhalten Sie eine Übersicht über das provisionierte Telefon, unter anderem auch die IP-Adresse.

### Tasten belegen

Über das Web-UI können am Grandstream IP-Telefon Tasten belegt werden. Klicken Sie auf `Einstellungen` > `Programmierbare Tasten`. Es stehen zwei Arten von Tasten zur Verfügung:

**Virtual Multi-Purpose Keys**

Diese Tasten erscheinen auf dem Haupt-Display. Um diese Tasten zu konfigurieren klicken sie auf `Edit VPK`:

|Modus|Konten|Beschreibung|Wert|
|---|---|---|---|
|Besetztlampen Feld (BLF)|Konto 1|Bezeichnung für die Taste|Durchwahl der Nebenstelle|

Zum Speichern klicken Sie auf `Sichern`. Die Einstellungen werden mit einem Klicke auf `Save VPK` wirksam.

{{% notice info%}}
Um die Einstellungen der Tasten zurückzusetzten klichen Sie auf `Neustart` und anschließend auf `Save VPK`.
{{% /notice %}}


**Multi-Purpose Keys**

Das sind je nach IP-Telefon-Model zusätzliche programmierbare Tasten.
In der Übersicht sieht man die verfügbaren Multi-Funktionstasten die nun Konfiguriert werden können:

|Modus|Konten|Beschreibung|Wert|
|---|---|---|---|
|Besetztlampen Feld (BLF)|Konto 1|Bezeichnung für die Taste|Durchwahl der Nebenstelle|

Beenden Sie die Konfiguration mit `Sichern und ausführen`, damit alle Änderungen aktiv sind.

{{% notice info%}}
Um die Einstellungen der Tasten zurückzusetzten klichen Sie auf `Neustart` und anschließend auf `Sichern und ausführen`.
{{% /notice %}}


### Basis-Konfiguration

Wie bereits erwähnt, werden Grandstream IP-Telefone  mit Hilfe der Basis-Konfiguration provisioniert. Die Basis-Konfiguration ist unter `Endgeräte` > `Basis-Konfigurationen` zu finden.

{{% notice note %}}
Bevor Sie die Basis-Konfiguration ändern, müssen Sie diese `Duplizieren`.
{{% /notice %}}

Ebenfalls können Sie eine schon bearbeitete Basis-Konfiguration als `Standard setzten`. Somit erhalten neu angelegte IP-Telefone automatisch die angepasste Basis-Konfiguration.

**Zuweisung einer Basis-Konfiguration**

Eine Basis-Konfiguration kann auf mehreren Wegen zugewiesen werden:

+ Über `Endgeräte` > `Basis-Konfigurationen` > Basis-Konfiguration auswählen und Bearbeiten, im Tab `Geräte` können gleich mehrere IP-Telefone hinzugefügt werden.
+ Über `Endgeräte` > `Geräteliste` > IP-Telefon auswählen und Bearbeiten im Tab `Basisdaten`.


**BLF-Tasten konfigurieren über die Basis-Konfiguration**

Im Tab `Konfiguration` können Sie die vorhandene Basis-Konfiguration anpassen.

Im Bereich **</config>** können Sie Ihre Wunschtasten einfügen. Folgendes Beispiel zeigt die Konfiguration der ersten *Virtual-Multi-Purpose-Taste*:

    <P1363>11</P1363>
    <P1364>0</P1364>
    <P1465>Max</P1465>
    <P1466>103</P1466>

*Erklärung*: **11** ist der Code für die BLF-Taste; **0** ist er erste Account auf dem Telefon; **Max** erscheint am Telefon-Display als Bezeichnung der Taste; **103** ist die Nebenstelle die überwacht wird.

Weitere Informationen entnehmen Sie bitte der [Grandstream-Tasten-Dokumentation](/grandstream_key_configuration.pdf).

Weisen Sie diese Basis-Konfiguration über den Tab `Geräte` den IP-Telefonen zu, die diese Taste auch in der Weise belegt haben sollen und speichern Sie, nach dem Neustart der IP-Telefone werden die Änderungen auf diesen übernommen.

### Firmwareupdate

Ab der mobydick Version 7.14 wird die Firmware für IP-Endgeräte nicht mehr mitgeliefert. Sollte eine andere als auf dem IP-Endgerät installierte Firmware benötigt werden, muss diese selber heruntergeladen und in die pascom Firmware-Verwaltung hochgeladen werden.

**Firmware hinzufügen**

Die gewünschte Firmware kann hinzugefügt werden unter `Endgeräte` > `Firmware`:

|Einstellung|Beschreibung|
|---|---|
|Firmware-Datei|Laden Sie hier die Firmware hoch.|
|Model|Modellbezeichnung des Telefons|
|Version|Firmware-Version|
|Dokumentation|Optionales Feld für Notizen|

**Firmware ausrollen**

Die Firmware kann aus den IP-Endgeräten über `Endgeräte` > `Geräteliste` aktualisiert werden. Wählen Sie die Zielgeräte in der Geräteliste mit Häkchen aus und klicken Sie auf `Aktion` > `Firmware ausrollen`. Nun erhalten Sie eine Übersicht der gewählten Geräte, in der Sie die Zielfirmware auswählen können. Anschließend klicken Sie auf `Firmware update` um die gewählte Firmware auszurollen.


Da es für die verschiedenen IP-Telefone eine Vielzahl von Firmwares gibt ist es uns leider nicht möglich jede zu testen, so dass es sein kann, dass manche Firmware-Versionen pascom Funktionen nicht unterstützen. Daher finden Sie hier eine Liste der Firmwares die von uns bereits getestet wurden:

|Modell|Empfohlene Firmware|
|---|---|
|GXP 1630|1.0.4.55|
|GXP 2130|1.0.7.25|
|GXP 2135|1.0.7.97|
|GXP 2160|1.0.7.97|
|GXV 3240|1.0.3.158|
