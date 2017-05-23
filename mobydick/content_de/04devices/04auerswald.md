---
title: Auerswald IP-Tischtelefone
keywords:
description:
url:  /endgeraete/auerswald-ip-tischtelefone/
prev: /endgeraete/yealink-ip-tischtelefone/
next: /endgeraete/openstage-ip-tischtelefone/
weight: 44
toc: true

---

![Auerswald IP-Telefon](/auerwald_comfortel_3600.png?width=450px)

## Kompatibilität

|Provisionierung|Firmware-Verwaltung|Fernsteuerung über Desktop-Client|pascom Menü|
|---|---|---|---|
|ja|ja|ja|ja|

**Provisionierung**: Das IP-Telefon wird über die mobydick verwaltet.<br>
**Firmware-Verwaltung**: Die Firmware kann über mobydick aktualisiert werden.<br>
**Fernsteuerung über Desktop-Client**: Gespräche können über den Desktop-Client gestartet werden.<br>
**pascom Menü**: An einer Taste am Telefon wird das pascom Menü hinterlegt.

## Konfiguration

mobydick ist in der Lage IP-Telefone des Herstellers Auerswald automatisch und zentral zu konfigurieren. Diesen Vorgang nennt man Provisionierung. Dazu stellt mobydick eine Basis-Konfiguration (`Endgeräte` > `Basis-Konfigurationen`) zur Verfügung. Diese ist ausreichend vorparametriert und muss nur in manchen Fällen angepasst werden.

{{% notice tip%}}
Bei Neuinstallationen sollten Sie den Provisionierungsvorgang zuerst mit einem Telefon testen. War dies erfolgreich können Sie alle weiteren IP-Telefone in Betrieb nehmen.
{{% /notice %}}

### Vorbereitung

Für die automatische Inbetriebnahme ist ein funktionierender DHCP-Server zwingend erforderlich. Lesen Sie dazu
[Netzwerk planen und konfigurieren](../../server/netzwerk-konfigurieren/).


### Inbetriebnahme

Stecken Sie das IP-Telefon an das Netzwerk. Das Telefon enthält einen eingebauten Switch, benutzen Sie den Ethernet-Port mit der Bezeichnung **PoE**. Die Stromversorgung erfolgt über den PoE-Ethernet-Port. Falls Sie keinen PoE-Switch verwenden, benötigen Sie einen PoE-Injector.

Das IP-Telefon bootet nun, zieht sich vom DHCP-Server eine IP-Adresse und die passende Basis-Konfiguration. Nach diesem Vorgang trägt mobydick das IP-Telefon automatisch in die Geräteliste unter `Endgeräte` > `Geräteliste` ein und legt ein entsprechendes SIP-Peer an.

Das SIP-Peer wird automatisch angelegt. Benutzername und Passwort werden automatisch generiert. Der Benutzername besteht aus einer zufälligen Zeichenfolge und den letzten sechs Stellen der Geräte-MAC-Adresse und hat insgesamt 15 Stellen. Das Passwort ist ebenfalls 15-stellig. Da die IP-Telefone automatisch provisioniert werden, müssen Sie die Daten niemals manuell eingeben. Es ist auch nicht möglich die Benutzerdaten zu ändern. Dies erhöht die Sicherheit gegen SIP-Brute-Force-Attacken beträchtlich.

Als Bezeichnung des Telefons wird automatisch die Herstellerbezeichnung gefolgt von der MAC-Adresse vergeben. Da auf dem Telefongehäuse die MAC-Adresse vermerkt ist, lässt sich vor Ort das IP-Telefon einfach zuordnen.

Nach der erfolgreichen Provisionierung sollte das IP-Telefon am Display die richtige Sprache, die richtige Zeit und den Text *Nur Notrufe* (oder *Emergency only*) anzeigen.

{{% notice info%}}
Nach der Provisionierung des IP-Telefons wird von mobydick der Admin-User neu gesetzt.
<br>Username: *admin*
<br>Passwort: *00000000*
{{% /notice  %}}

### Benutzer zuweisen

Nachdem das IP-Telefon in der Geräteliste erscheint kann es bearbeitet werden. Klicken Sie hierzu auf `Bearbeiten`. Im Tab `Zuweisung` kann dem Telefon ein [Benutzer (oder Arbeitsplatz)](../../benutzer/benutzer-arbeitsplaetze/) zugewiesen werden.

Nach dem Speichern und Anwenden der Telefoniekonfiguration werden die neu zugewiesenen IP-Telefone neugestartet.

### Funktion testen

Am einfachsten kann man die erfolgreiche Inbetriebnahme testen, indem man mit **\*100** die eigene Voicemailbox anruft. Daraufhin sollte die Ansage Ihrer Voicemailbox zu hören sein.


### pascom Menütaste

Nach der Provisionierung ist auf der ersten Funktionstaste rechts das pascom Menü hinterlegt. Hier sind pascom Funktionen hinterlegt:

|Funktion|Beschreibung|
|---|---|
|Telefonbuch|Ruft das pascom Telefonbuch auf.|
|Journal|Zeigt verpasste, angenommene und gewählte Anrufe an|
|Rufumleitung|Setzt eine Rufumleitung, aktiviert/ändert eine schon gesetzte Rufumleitung oder deaktiviert eine aktive Rufumleitung.|
|Voicmailbox|Voicemailbox-Menü zum Einschalten/Ausschalten und Abhören der eigenen Voicemailbox|
|Anmelden|Hier kann ein Benutzer sich an dem Arbeitsplatz anmelden.|
|Abmelden [*benutzername*]|Der bereits angemeldete Benutzer kann sich an dem Arbeitsplatz abmelden.|
|Warteschlangen|Dient zur Verwaltung der Warteschlangen (anmelden, abmelden, pausieren...), je nach Konfiguration der Warteschlangen.|


{{% notice tip%}}
Setzen Sie Rufumleitungen nur über das pascom Menü, da diese Rufumleitungen über die mobydick verwaltet werden können.
{{% /notice %}}

{{% notice info%}}
Die Verwendung der DND-Taste (*do not disturb*) oder Ruhe-Taste am Yealink hat zur Folge, dass die Durchwahl am Telefon nicht erreichbar ist. Der DND-Hinweis erscheint nur am Telefon und hat für die mobydick (z. B. Desktop Client) keine weitere Bedeutung.
{{% /notice %}}


### Auf die Auerswald-Weboberfläche zugreifen

Um auf die Weboberfläche Ihres IP-Telefons zu gelangen benötigen Sie die IP-Adresse. Im Folgenden sind Möglichkeiten beschrieben, um diese in Erfahrung zu bringen:

#### IP-Adresse am Telefon anzeigen

Drücken Sie die **Menu**-Taste auf Ihrem Auerswald IP-Telefon. Über `Einstellungen` -> `Netzwerk` -> `IP-Adressen` können Sie die IP des Telefons ermitteln.

#### IP-Adresse über die Geräteliste ermitteln

Loggen Sie sich in das Web-UI der mobydick ein. Klicken Sie auf `Endgeräte` > `Geräteliste`. Nun sehen Sie eine Übersicht über alle verfügbaren Geräte. Links von jedem Eintrag finden Sie ein *Info*-Symbol. Klicken Sie es an, erhalten Sie eine Übersicht über das provisionierte Telefon, unter anderem auch die IP-Adresse.


### Funktionstasten

Die Funktionstasten rechts am Telefon sind belegbar.

#### Andere Benutzer (Nebenstellen) überwachen

Zur Überwachung anderer Benutzer oder Nebenstellen können Funktionstasten eingerichtet werden. Dazu eignen sich BLF-Tasten (Besetztlampenfeld oder Busy Lamp Field). Diese geben Informationen über den Status der überwachten Durchwahl. Überwachen bedeutet in diesem Fall zu sehen ob ein Benutzer telefoniert, angerufen wird und ggf. sein Gespräch heranzuholen (Pickup).

Tasten können auf verschiedenen Wegen konfiguriert werden.

#### Tasten belegen direkt am Telefon

Drücken Sie lange auf die Taste die Sie belegen möchten. Wählen Sie *Ebene 1* und bestätigen Sie mit der *OK*-Taste. Wählen Sie die Option *Pick-up*. Tragen Sie unter *Pick-up Ziel* die gewünschte Nebenstelle und bestätigen Sie am Display mit *Zuweisen*.


#### Tasten belegen über das Web-UI

Loggen Sie sich auf das Web-UI des IP-Telefons ein. In der linken Menüleiste finden Sie den Menüpunkt `Apps` > `Funktionstasten`. Klicken Sie die Taste die Sie konfigurieren möchten und wählen Sie in der Dropdown-Liste *Pick-up*. Geben Sie unter *Pick-up Ziel* die Rufnummer der Nebenstelle ein. Klicken Sie auf *Speichern*.
