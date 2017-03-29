---
title: Yealink Tischtelefone T4-Serie
keywords:
<<<<<<< HEAD
    - t40p, t42g, t46g, t48p
prev: /endgeraete/snom-tischtelefone-300-700-serie/
url:  /endgeraete/yealink-ip-tischtelefone-t4-serie/
next: /endgeraete/grandstream-ip-tischtelefone-gxp-gxv-serie/
=======
    - T40P, T42G, T46G, T48P
prev: /endgeraete/snom-tischtelefone-300-700-serie/
url:  /endgeraete/yealink-ip-tischtelefone/
next: /endgeraete/grandstream-tischtelefone-gxp-gxv-serie/
>>>>>>> 5fd2d6b69ca79e6c78369daa4233fad5b9286c45
weight: 42
toc: true
draft: false
---

![Yealink T46G](/yealink-t4-series1.jpg?width=400px)


## Kompatibilität

|Provisionierung|Firmware-Verwaltung|Fernsteuerung über Desktop-Client|pascom Menü|
|---|---|---|---|
|ja|ja|ja|ja|

**Provisionierung**: Das IP-Telefon wird über die mobydick verwaltet.<br>
**Firmware-Verwaltung**: Die Firmware kann über mobydick aktualisiert werden.<br>
**Fernsteuerung über Desktop-Client**: Gespräche können über den Desktop-Client gestartet werden.<br>
**pascom Menü**: An einer Taste am Telefon wird das pascom Menü hinterlegt.


## Konfiguration

mobydick ist in der Lage IP-Telefone des Herstellers Yealink automatisch und zentral zu konfigurieren. Diesen Vorgang nennt man Provisionierung. Dazu stellt mobydick eine Basis-Konfiguration (`Endgeräte` > `Basis-Konfigurationen`) zur Verfügung. Diese ist ausreichend vorparametriert und muss nur in manchen Fällen angepasst werden.

{{% notice tip%}}
Bei Neuinstallationen sollten Sie den Provisionierungsvorgang zuerst mit einem Telefon testen. War dies erfolgreich können Sie alle weiteren IP-Telefone in Betrieb nehmen.
{{% /notice %}}

### Vorbereitung

Für die automatische Inbetriebnahme ist ein funktionierender DHCP-Server zwingend erforderlich. Lesen Sie dazu
[Netzwerk planen und konfigurieren](../../server/netzwerk-konfigurieren/).

### Inbetriebnahme

Stecken Sie das IP-Telefon an das Netzwerk. Das Telefon enthält einen eingebauten Switch, benutzen Sie den Ethernet-Port mit der Bezeichung **Internet**. Falls Sie kein **PoE** (Power over Ethernet) verwenden, stecken Sie das Telefon an den Netzstrom.

Das IP-Telefon bootet nun, zieht sich vom DHCP eine IP-Adresse und die passende Basis-Konfiguration. Nach diesem Vorgang trägt mobydick das IP-Telefon automatisch in die Geräteliste unter `Endgeräte` > `Geräteliste` ein und legt ein entsprechendes SIP-Peer an.

Das SIP-Peer wird automatisch angelegt. Benutzername und Passwort werden automatisch generiert. Der Benutzername besteht aus einer zufälligen Zeichenfolg und den letzten sechs Stellen der Geräte-MAC-Adresse und hat insgesammt 15 Stellen. Das Passwort ist ebenfalls 15-stellig. Da die IP-Telefone automatisch provisioniert werden, müssen Sie die Daten niemals manuell eingeben. Es ist auch nicht möglich die Benutzerdaten zu ändern. Dies erhöht die Sicherheit gegen SIP-Brute-Force-Attacken beträchtlich.

Als Bezeichung des Telefons wird automatisch die Herstellerbezeichung gefolgt von der MAC-Adresse vergeben. Da auf dem Telefongehäuse die MAC-Adresse vermerkt ist, lässt sich vor Ort das IP-Telefon  einfach zuordnen.

Nach der erfolgreichen Provisionierung sollte das IP-Telefon am Display die richtige Sprache, die richtige Zeit und den Text *Nur Notrufe* (oder *Emergency only*) anzeigen.

{{% notice info%}}
Nach der Provisionierung des IP-Telefons wird von mobydick der Admin-User neu gesetzt.
<br>Username: *admin*
<br>Passwort: *0000*
{{% /notice  %}}

Das Passwort des Admin-Users am IP-Telefon kann über die Systemeinstellungen im Web-UI geändert werden. Suchen Sie in dem Suchfeld nach dem Parameter *sys.peripherals.access.password*. Geben Sie Ihren gewünschten Wert ein. Anschließend müssen Sie manuell die Telefonie-Konfiguration anwenden und die Endgeräte neustarten.

### Benutzer zuweisen

Nachdem das IP-Telefon in der Geräteliste erscheint kann es bearbeitet werden. Klicken Sie hierzu auf `Bearbeiten`. Im Tab `Zuweisung` kann dem Telefon ein [Benutzer (oder Arbeitsplatz)](../../benutzer/benutzer-arbeitsplaetze/) zugewiesen werden.

Nach dem Speichern und Anwenden der Telefoniekonfiguration werden die neu zugewiesenen IP-Telefone neugestartet.

### Funktion testen

Am einfachsten kann man die erfolgreiche Inbetriebnahme testen, indem man mit **\*100** die eigene Voicemailbox anruft. Daraufhin sollte die Ansage Ihrer Voicemailbox zu hören sein.

### pascom Menütaste

Nach der Provisionierung ist auf der zweiten Funktionstaste am Display das pascom Menü zu finden. Hier sind pascom Funktionen hinterlegt:

|Funktion|Beschreibung|
|---|---|
|Telefonbuch|Ruft das pascom Telefonbuch auf.|
|Journal|Zeigt verpasste, angenommene und gewählte Anrufer an|
|Rufumleitung|Setzt eine Rufumleitung, aktiviert/ändert schon eine gesetzt Rufumleitung oder deaktiviert eine aktiver Rufumleitung.|
|Voicmailbox|Voicemailbox-Menü zum Einschalten/Ausschalten und Abhören der eigenen Voicemailbox|
|Anmelden|Hier kann ein Benutzer sich an dem Arbeitsplatz anmelden.|
|Abmelden [*benutzername*]|Der bereits angemeldete Benutzer kann sich an dem Arbeitsplatz abmelden.|
|Warteschlagen|Dient zur Verwaltung der Warteschlagen (anmelden, abmelden, pausieren...), je nach Konfiguration der Warteschangen.|


{{% notice tip%}}
Setzen Sie Rufumleitungen nur über das mobydick Menü, da diese Rufumleitungen über die mobydick Verwaltet werden können.
{{% /notice %}}

{{% notice info%}}
Die Verwendung der DND-Taste (*do not disturb*) oder Ruhe-Taste am Yealink hat zur Folge, dass die Durchwahl am Telefon nicht erreichbar ist. Der DND-Hinweis erscheint nur am Telefon und hat für die mobydick (z. B. Desktop Client) keine weitere Bedeutung.
{{% /notice %}}

### Auf die Yealink-Weboberfläche zugreifen

<!--FIXME Zugriff Web-UI  -->
Um auf die Weboberfläche Ihres IP-Telefons zu gelangen benötigen Sie die IP-Adresse. Im Folgenden sind Möglichkeiten beschreiben, um diese in Erfahrung zu bringen:

Drücken Sie die Yealink-Menütaste des Telefons (die linke Taste unter dem Telefon-Display), anschließend wählen Sie den Menüpunkt *Aktiv*. Nun können Sie die IPv4-Adresse des Telefons ablesen.


**IP-Adresse über die Geräteliste ermitteln**

Loggen Sie sich in das Web-UI der mobydick ein. Klicken Sie auf `Endgeräte` > `Geräteliste`. Nun sehen Sie eine Übersicht über alle verfügbaren Geräte. Links von jedem Eintrag finden Sie ein *Info*-Symbol. Klicken Sie es an, erhalten Sie eine Übersicht über das provisionierte Telefon, unter anderem auch die IP-Adresse.

### Tasten belegen über das Web-UI

<!-- Klicken Sie in der Menüliste auf der linken Seite auf Funktionstasten. -->

<!-- **Andere Benutzer (Nebenstellen) überwachen mit BLFs**

Hier können Sie Funktionstasten einrichten, um andere Nebenstellen zu überwachen. Die BLF-Taste (Besetztlampenfeld oder Busy Lamp Field) gibt Informationen über den Status der überwachten Durchwahl. Überwachen bedeutet in diesem Fall zu sehen ob ein Benutzer telefoniert, angerufen wird und ggf. sein Gespräch heranzuholen (Pickup).

|Kontext|Typ|Nummer|Kurzform|
|---|---|---|---|
|Account wählen|**Nebenstelle**|Die zu überwachende Durchwahl (z. B. 123) in der Form <sip:123@192.168.100.1>.|Besitzt das Telefon statt des Papier-Beschriftungsstreifens ein zweites Display, können hier die Tasten beschriftet werden.|

Neben Benutzer-Durchwahlen können auch Einbuchcodes für Warteschlangen oder Durchwahlschalter konfiguriert werden.
<!--FIXME Links zu dw-schalter, warteschlangen  -->

<!-- **Weitere nützliche Funktionstasten**

|Funktionstaste|Beschreibung|
|---|---|
|**Direktwahl**|Hier kann eine Telefonnummer hinterlegt werden.|
|**DTMF**|Hier können DTMF-Zeichen hinterlegt werden.| -->

### Basis-Konfiguration

Wie bereits erwählt, werden Yealink IP-Telefone  mit Hilfe der Basis-Konfiguration provisioniert. Die Basis-Konfigurationen ist unter `Endgeräte` > `Basis-Konfiguration` zu finden.

{{% notice note %}}
Bevor Sie die Basis-Konfiguration ändern, müssen Sie diese `Duplizieren`.
{{% /notice %}}

Ebenfalls können Sie eine schon bearbeitete Basis-Konfiguration als `Standard setzten`. Somit erhalten neu angelegte IP-Telefone automatisch die angepasste Basis-Konfiguration.

**Zuweisung einer Basis-Konfiguration**

Eine Basis-Konfiguration kann auf mehreren Wegen zugewiesen werden:

+ Über `Endgeräte` > `Basis-Konfiguration` > Basis-Konfiguration auswählen und Bearbeiten im Tab `Geräte` können gleich mehrere IP-Telefone hinzugefügt werden.
+ Über `Endgeräte` > `Geräteliste` > IP-Telefon auswählen und Bearbeiten im Tab `Basisdaten`.

**BLF-Tasten konfigurieren über die Basis-Konfiguration**

Im Tab `Konfiguration` können Sie die vorhandene Basis-Konfiguration anpassen. Im Bereich **keys** finden Sie bereits vorkonfigurierte Funktionstasten, an denen Sie dich orientieren können.

Surfen Sie auf das Web-UI Ihres Yealink Telefons und belegen Sie unter *Funktionstasten* als Beispiel die Taste **P1**. Wählen Sie als Typ **Nebenstelle**, als Nummer **123** und als Label **Musterbenutzer**. Übernehmen Sie die Einstellungen.

Klicken Sie auf den Menüpunkt *Einstellungen*. Falls Sie den Menüpunkt noch nicht sehen, benötigen Sie [Admin-Rechte](../snom-tischtelefone-300-700-serie/#auf-die-snom-weboberfläche-zugreifen).<br>
Suchen Sie nach *fkey0* und *fkey_label0*. Die gefundenen Zeilen tragen Sie anschließend in der Basis-Konfiguration über das Web-UI der mobydick ein:

    {{!-- keys --}}
    fkey0: dest <sip:123@192.168.100.1>
    fkey_label0: Zentrale

Weisen Sie diese Basis-Konfiguration über den Tab `Geräte` den IP-Telefonen zu, die diese Taste auch in der Weise belegt haben sollen und Speichern Sie nach dem Neustart der IP-Telefone werden die Änderungen auf diesen übernommen.

### Firmwareupdate

Ab der mobydick Version 7.14 wird die Firmware für IP-Endgeräte nicht mehr mitgeliefert. Sollte eine andere als auf dem IP-Endgerät installierte Firmware benötigt werden, muss diese selber heruntergeladen und in die mobydick Firware-Verwaltung hochgeladen werden.

**Firmware hinzufügen**

Die gewünschte Firmware kann hinzugefügt werden unter `Endgeräte` > `Firmware`:

|Einstellung|Beschreibung|
|---|---|
|Firmware-Datei|Laden Sie hier die Firware hoch. Diese finden Sie auf der [Wiki-Seite von Snom].|
|Model|Modellbezeichung des Yealink-Telefons|
|Version|Firmware-Version|
|Dokumentation|Optionales Feld für Notizen|

**Firmware ausrollen**

Die Firmware kann über `Endgeräte` > `Geräteliste` aktualisiert werden. Wählen Sie die Zielgeräte in der Geräteliste mit Häkchen aus und klicken Sie auf `Aktion` > `Firmware ausrollen`. Nun erhalten Sie eine Übersicht der gewählen Geräte, in der Sie die Zielfirmware auswählen können. Anschließend klicken Sie auf `Firmware update` um die gewählte Firmware auszurollen.

**Empfohlene Firmware**

Da es für die verschiedenen IP-Telefone eine Vielzahl von Firmwares gibt ist es uns leider nicht möglich jede zu testen, so dass es sein kann, dass manche Firmware-Versionen mobydick Funktionen nicht unterstützen. Daher finden Sie hier eine Liste der Firmwares die von uns bereits getestet wurde:

|Modell|Firmware|
|---|---|
