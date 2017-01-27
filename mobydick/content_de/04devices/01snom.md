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

{{% row %}}
{{% col md-6 %}}
![snom 700 serie](/snom-700-series1.png?width=300px)
{{% /col %}}
{{% col md-6 %}}
![snom 300 serie](/snom-300-series1.png)
{{% /col %}}
{{% /row %}}



## Kompatibilität

|Provisionierung|Firmware-Verwaltung|Fernsteuerung über Desktop Client|pascom Menü|
|---|---|---|---|
|ja|ja|ja|ja|

**Provisionierung**: Das IP-telefon wird über die mobydick verwaltet.<br>
**Firmware-Verwaltung**: Die Firmware kann über mobydick aktualisiert werden.<br>
**Fernsteuerung über Desktop-Client**: Gespräche können über den Desktop Client gestartet werden.<br>
**pascom Menü**: An einer Taste am Telefon wird das pascom Menü hinterlegt.


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

<!--
FIXME: hinweis wo man pin ändern kann -->

### Benutzer zuweisen

Nachdem das IP-Telefon in der Geräteliste erscheint kann es bearbeitet werden. Klicken Sie hierzu auf `Bearbeiten`. Im Tab `Zuweisung` kann dem Telefon ein [Benutzer (oder Arbeitsplatz)](/../benutzer/benutzer-arbeitsplaetze/) zugewiesen werden.

Nach dem Speichern und Anwenden der Telefoniekonfiguration werden die neu zugewiesenen IP-Telefone neugestartet.

### Funktion testen

Am einfachsten kann man die erfolgreiche Inbetriebnahme testen, indem man mit \*100 die einene Voicemailbox anruft. Daraufhin sollte die Ansage "" zu hören sein.

### pascom Menütaste

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

### Auf die Snom-Weboberfläche zugreifen

Um auf die Weboberfläche Ihres IP-Telefons zu gelangen benötigen Sie die IP-Adresse. Im Folgenden sind Möglichkeiten beschreiben, um diese in Erfahrung zu bringen:

**IP-Adresse am Telefons anzeigen**

Tippen Sie die Taste **?** bzw. **Help** um die IP-Adresse Ihres Telefon anzuzeigen, anschließend wird diese am Display angezeigt.

**IP-Adresse über die Geräteliste ermitteln**

Loggen Sie sich in das Web-UI der mobydick ein. Klicken Sie auf `Endgeräte` > `Geräteliste`. Nun sehen Sie eine ÜBersicht über alle verfügbaren Geräte. Links von jedem Eintrag finden Sie ein *Info*-Symbol. Klicken Sie es an, erhalten Sie eine Übersicht über das provisionierte Telefon, unter anderem auch die IP-Adresse.

### Tasten belegen

KLicken Sie in der Menüliste auf der linken Seite auf Funktionstasten.
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

Wie bereits erwählt, werden Snom IP-Telefone  mit Hilfe der Basis-Konfiguration provisioniert. -->



### Firmwareupdate

mobydick kann IP-Telefone mit passender Firmware versorgen. Unter `Endgeräte` > `Geräte Firmware` finden Sie für jedes unterstütze Modell die von uns empfohlene Firmware.

**Firmware ausrollen**

Die Firmware kann über `Endgeräte` > `Geräteliste` aktualisiert werden. Wählen Sie die Zielgeräte in der Geräteliste mit Häkchen aus und klicken Sie auf `Aktion` > `Firmeware ausrollen`. Nun erhalten Sie eine Übersicht der gewählen Geräte, in der Sie die Zielfirmware auswählen können. Anschließend klicken Sie auf `Firmware update` um die gewählte Firmware auszurollen.

**Firmware hinzufügen**

Sollte Ihre gewünschte Firmware nicht zur Auswahl stehen, können Sie diese unter `Endgeräte` > `Firmware` hinzufügen.

{{% notice note %}}
Beachten Sie bitte, dass das Ausrollen einer Firmware, die nicht mit der mobydick geliefert wurde, bestimmte mobydick Funtionen nicht mehr unterstützt.
{{% /notice %}}
