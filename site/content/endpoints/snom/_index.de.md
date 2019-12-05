---
title: Snom Tischtelefone D100er, D300er und D700er Serie
description: Integrieren Sie Ihre Snom IP-Tischtelefone in die pascom
weight: 10
---

{{< doctype "both" >}}
 
{{< description >}}

![snom D300/D700 Serie](snom-series.png)

## Kompatibilität

[Unsere VoIP Telefonanlage](https://www.pascom.net/de/mobydick-voip/ "unsere VoIP Telefonanalge") unterstützt eine große Auswahl an IP-Telefonen des Herstellers Snom.

|Provisionierung|Firmware-Verwaltung|Fernsteuerung über Desktop-Client|pascom Menü|
|---|---|---|---|
|ja|ja|ja|ja|

**Provisionierung**: Das IP-Telefon wird über die pascom verwaltet.<br>
**Firmware-Verwaltung**: Die Firmware kann über pascom aktualisiert werden.<br>
**Fernsteuerung über Desktop-Client**: Gespräche können über den Desktop-Client gestartet werden.<br>
**pascom Menü**: An einer Taste am Telefon wird das pascom Menü hinterlegt.


## Provisionierung

pascom ist in der Lage IP-Telefone des Herstellers Snom automatisch und zentral zu konfigurieren. Diesen Vorgang nennt man Provisionierung. Dazu stellt pascom eine Basis-Konfiguration ({{< ui-button "Endgeräte" >}} > {{< ui-button "Basis-Konfigurationen" >}}) zur Verfügung. Diese ist ausreichend vorparametriert und muss nur in manchen Fällen angepasst werden.

## Neues Telefon hinzufügen

{{% tabs %}}
{{% tab "Pairing via URL (cloud + onsite)" %}}

{{< num 1 "Telefon anschließen" >}}

{{% notice tip %}}
Handelt es sich nicht um ein fabrikneues Telefon setzen Sie es in jedem
Fall auf **Werkseinstellungen** zurück. Wählen Sie hierzu am Telefon, im eingeschalteten
Zustand, <strong>\**##</strong> und halten anschließend <strong>#</strong> gedrückt bis nach dem Reboot ein Menü
erscheint. Wählen Sie **1** für Werkseinstellungen.
{{% /notice %}}

Stecken Sie das IP-Telefon an das Netzwerk. Das Telefon enthält einen eingebauten Switch, benutzen Sie den Ethernet-Port mit der Bezeichnung **NET**. Falls Sie kein **PoE** (Power over Ethernet) verwenden, stecken Sie das Telefon an den Netzstrom.

Während des Boot-Vorganges steht wiederholt die IP-Adresse des Telefones im
Display. Notieren Sie sich diese.

Nach dem Booten bleibt das Telefon bei der Länderauswahl stehen.

{{< num 2 "MAC-Adresse ermitteln" >}}

Die MAC-Adresse steht auf der Rückseite des Telefones.

Alternativ surfen Sie nun mit Ihrem Browser auf die zuvor notierte IP-Adresse des Telefones.

Unter {{< ui-button "System Information" >}} > {{< ui-button "MAC-Address" >}} notieren Sie sich die MAC-Adresse des
Telefones.

{{< num 3 "Endgerät anlegen" >}}

Loggen Sie sich in Ihrer Telefonanlage ein und fügen unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} ein
neues Gerät vom Typ **IP-Telefon: Hersteller Snom** hinzu.

Tragen Sie im Feld **Mac-Adresse** die zuvor ermittelte MAC-Adresse des Telefones
ein.

{{< num 4 "Benutzer zuweisen" >}}

Als nächstes können Sie dem IP-Telefon einen Benutzer oder Arbeitsplatz zuweisen. Klicken Sie hierzu auf {{< ui-button "Bearbeiten" >}}. Im Tab {{< ui-button "Zuweisung" >}} kann dem Telefon ein [Benutzer (oder Arbeitsplatz)]({{< ref "concept/user">}}) zugewiesen werden.

{{< num 5 "Jobs Anwenden" >}}

Nach dem Speichern von Änderungen erscheint in der Job-Box (oben) ein
entsprechender Eintrag die Telefonie anzuwenden. Starten Sie den Job durch
einen Klick auf den {{< ui-button "grünen Haken" >}}.

{{< num 6 "Provisionierung-URL ermitteln" >}}

Haken Sie das Telefon in der Geräte-Liste an und wählen {{< ui-button "Aktion" >}} > {{< ui-button "Provisioning URL" >}}. Kopieren Sie die
**URL** in die Zwischenablage.

{{< num 7 "Provisionierung-URL am Telefon eintragen" >}}

Zurück auf der Web-UI des Telefones tragen Sie unter {{< ui-button "Advanced Settings" >}} > {{< ui-button "Update" >}} > {{< ui-button "Setting URL" >}}
die eben kopierte Provisionierung-URL ein.

Klicken Sie auf {{< ui-button "Apply" >}} und anschließend auf {{< ui-button "Reboot" >}}.

{{< num 8 "Funktion testen" >}}

Am einfachsten kann man die erfolgreiche Inbetriebnahme testen, indem man mit **\*100** die eigene Voicemailbox anruft. Daraufhin sollte die Ansage Ihrer Voicemailbox zu hören sein.

{{% /tab %}}

{{% tab "DHCP Provisioning (onsite)" %}}

{{% notice note %}}
Für lokale Installationen des pascom Servers ist es möglich Endgeräte per DHCP-Server massenweise und vollautomatisch in Betrieb zu nehmen.
{{% /notice %}}

{{< num 1 "DHCP-Server vorbereiten" >}}

Bereiten Sie einen DHCP-Server wie unter [Telefon-Provisionierung via DHCP]({{< ref "/howto/dhcp-provisioning" >}}) beschreiben vor.

{{< num 2 "Telefon anschließen" >}}

{{% notice tip %}}
Handelt es sich nicht um ein fabrikneues Telefon setzen Sie es in jedem
Fall auf **Werkseinstellungen** zurück. Wählen Sie hierzu am Telefon, im eingeschalteten
Zustand, <strong>\**##</strong> und halten anschließend <strong>#</strong> gedrückt bis nach dem Reboot ein Menü
erscheint. Wählen Sie **1** für Werkseinstellungen.
{{% /notice %}}

Stecken Sie das IP-Telefon an das Netzwerk. Das Telefon enthält einen eingebauten Switch, benutzen Sie den Ethernet-Port mit der Bezeichnung **NET**. Falls Sie kein **PoE** (Power over Ethernet) verwenden, stecken Sie das Telefon an den Netzstrom.

Das Gerät wird **automatisch** vom pascom Server konfiguriert und **erscheint** daraufhin in der List {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}}. 

{{< num 3 "Benutzer zuweisen" >}}

Als nächstes können Sie dem IP-Telefon einen Benutzer oder Arbeitsplatz zuweisen. Klicken Sie hierzu auf {{< ui-button "Bearbeiten" >}}. Im Tab {{< ui-button "Zuweisung" >}} kann dem Telefon ein [Benutzer (oder Arbeitsplatz)]({{< ref "concept/user">}}) zugewiesen werden.

{{< num 4 "Jobs Anwenden" >}}

Nach dem Speichern von Änderungen erscheint in der Job-Box (oben) ein
entsprechender Eintrag die Telefonie anzuwenden. Starten Sie den Job durch
einen Klick auf den {{< ui-button "grünen Haken" >}}. Das Telefon startet neu. 
Nach dem Neustart steht der Name des Benutzers oder der zugewiesene Arbeitsplatz im Telefondisplay.

{{< num 5 "Funktion testen" >}}

Am einfachsten kann man die erfolgreiche Inbetriebnahme testen, indem man mit **\*100** die eigene Voicemailbox anruft. Daraufhin sollte die Ansage Ihrer Voicemailbox zu hören sein.


{{% /tab %}}



{{% /tabs %}}

## pascom Menütaste

Nach der Provisionierung entspricht die **Menü**-Taste am Snom IP-Telefon nicht mehr dem Telefon-Menü, sondern ruft das telefonspezifische pascom Menü auf. Hier sind pascom Funktionen hinterlegt:

|Funktion|Beschreibung|
|---|---|
|Telefonbuch|Ruft das pascom Telefonbuch auf.|
|Journal|Zeigt verpasste, angenommene und gewählte Anrufe an|
|Rufumleitung|Setzt eine Rufumleitung, aktiviert/ändert eine schon gesetzte Rufumleitung oder deaktiviert eine aktive Rufumleitung.|
|Voicmailbox|Voicemailbox-Menü zum Einschalten/Ausschalten und Abhören der eigenen Voicemailbox|
|Anmelden|Hier kann sich ein Benutzer an dem Arbeitsplatz anmelden.|
|Abmelden [*Benutzername*]|Der bereits angemeldete Benutzer kann sich an dem Arbeitsplatz abmelden.|
|Warteschlangen|Dient zur Verwaltung der Warteschlangen (anmelden, abmelden, pausieren...), je nach Konfiguration der Warteschlangen.|

Besitzt das Snom IP-Telefon keine Menütaste (z. B. Snom 300, 710, D715) wird die zweite Funktionstaste mit dem pascom Menü belegt.

{{% notice tip%}}
Setzen Sie Rufumleitungen nur über das pascom Menü, da diese Rufumleitungen über die pascom verwaltet werden können.
{{% /notice %}}

{{% notice info%}}
Die Verwendung der DND-Taste (*do not disturb*) am Snom hat zur Folge, dass die Durchwahl am Telefon nicht erreichbar ist. Der DND-Hinweis erscheint nur am Telefon und hat für die pascom (z. B. Desktop Client) keine weitere Bedeutung.
{{% /notice %}}

## Auf die Snom-Weboberfläche zugreifen

Um auf die Weboberfläche Ihres IP-Telefons zu gelangen benötigen Sie die IP-Adresse. Im Folgenden sind Möglichkeiten beschrieben, um diese in Erfahrung zu bringen:

### IP-Adresse am Telefon anzeigen

Tippen Sie die Taste **?** bzw. **Help** um die IP-Adresse Ihres Telefon anzuzeigen, anschließend wird diese am Display angezeigt.

### IP-Adresse über die Geräteliste ermitteln

Loggen Sie sich in das Web-UI der pascom ein. Klicken Sie auf {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}}. Nun sehen Sie eine Übersicht über alle verfügbaren Geräte. Links von jedem Eintrag finden Sie ein *Info*-Symbol. Klicken Sie es an, erhalten Sie eine Übersicht über das provisionierte Telefon, unter anderem auch die IP-Adresse.

### Admin-Rechte

Um Zugriff zu einigen Menüpunkten in der Web-UI des Snom Telefons zu haben benötigen Sie Admin-Rechte. Klicken Sie hierfür auf den Menüpunkt **Erweitert**. Nun geben Sie das Admin-Passwort ein.

### Tasten belegen über das Web-UI

Klicken Sie in der Menüliste auf der linken Seite auf Funktionstasten.

#### Andere Benutzer (Nebenstellen) überwachen mit BLFs

Hier können Sie Funktionstasten einrichten, um andere Nebenstellen zu überwachen. Die BLF-Taste (Besetztlampenfeld oder Busy Lamp Field) gibt Informationen über den Status der überwachten Durchwahl. Überwachen bedeutet in diesem Fall zu sehen ob ein Benutzer telefoniert, angerufen wird und ggf. sein Gespräch heranzuholen (Pickup).

|Kontext|Typ|Nummer|Kurzform|
|---|---|---|---|
|Account wählen|**BLF**|Die zu überwachende Durchwahl (z. B. 123) in der Form 123\|*8 |Besitzt das Telefon statt des Papier-Beschriftungsstreifens ein zweites Display, können hier die Tasten beschriftet werden.|

Neben Benutzer-Durchwahlen können auch Einbuchcodes für Warteschlangen oder Durchwahlschalter konfiguriert werden.
<!--FIXME Links zu dw-schalter, warteschlangen  -->

#### Weitere nützliche Funktionstasten

|Funktionstaste|Beschreibung|
|---|---|
|**Direktwahl**|Hier kann eine Telefonnummer hinterlegt werden.|
|**DTMF**|Hier können DTMF-Zeichen hinterlegt werden.|

## Basis-Konfiguration

Wie bereits erwähnt, werden Snom IP-Telefone  mit Hilfe der Basis-Konfiguration provisioniert. Die Basis-Konfiguration ist unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Basis-Konfigurationen" >}} zu finden.

{{% notice note %}}
Bevor Sie die Basis-Konfiguration ändern, müssen Sie diese {{< ui-button "Duplizieren" >}}.
{{% /notice %}}

Ebenfalls können Sie eine schon bearbeitete Basis-Konfiguration als {{< ui-button "Standard setzten" >}}. Somit erhalten neu angelegte IP-Telefone automatisch die angepasste Basis-Konfiguration.

### Zuweisung einer Basis-Konfiguration

Eine Basis-Konfiguration kann auf mehreren Wegen zugewiesen werden:

+ Über {{< ui-button "Endgeräte" >}} > {{< ui-button "Basis-Konfigurationen" >}} > Basis-Konfiguration auswählen und Bearbeiten, im Tab {{< ui-button "Geräte" >}} können gleich mehrere IP-Telefone hinzugefügt werden.
+ Über {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} > IP-Telefon auswählen und Bearbeiten im Tab {{< ui-button "Basisdaten" >}}.

### BLF-Tasten konfigurieren über die Basis-Konfiguration

Im Tab {{< ui-button "Konfiguration" >}} können Sie die vorhandene Basis-Konfiguration anpassen. Im Bereich **keys** finden Sie bereits vorkonfigurierte Funktionstasten, an denen Sie sich orientieren können.

Surfen Sie auf das Web-UI Ihres Snom Telefons und belegen Sie unter *Funktionstasten* als Beispiel die Taste **P1**. Wählen Sie als Typ **BLF**, als Nummer **\*8123** und als Label **Musterbenutzer**. Übernehmen Sie die Einstellungen.

Klicken Sie auf den Menüpunkt *Einstellungen*. Falls Sie den Menüpunkt noch nicht sehen, benötigen Sie [Admin-Rechte]({{< relref "#auf-die-snom-weboberfläche-zugreifen">}}).<br>
Suchen Sie nach *fkey0* und *fkey_label0*. Die gefundenen Zeilen tragen Sie anschließend in der Basis-Konfiguration über das Web-UI der pascom ein:

    {{!-- keys --}}
    fkey0: blf sip:123@{{{cs_domain}}}|*8
    fkey_label0: Zentrale

Weisen Sie diese Basis-Konfiguration über den Tab {{< ui-button "Geräte" >}} den IP-Telefonen zu, die diese Taste auch in der Weise belegt haben sollen und speichern Sie. Nach dem Neustart der IP-Telefone werden die Änderungen auf diesen übernommen.


## Firmwareupdate

Seit der mobydick Version 7.14 wird die Firmware für IP-Endgeräte nicht mehr mitgeliefert. Sollte eine andere als auf dem IP-Endgerät installierte Firmware benötigt werden, muss diese selber heruntergeladen und in die pascom Firmware-Verwaltung hochgeladen werden.

### Firmware hinzufügen

Die gewünschte Firmware kann hinzugefügt werden unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Firmware" >}}:

|Einstellung|Beschreibung|
|---|---|
|Firmware-Datei|Laden Sie hier die Firmware hoch. Diese finden Sie auf der [Wiki-Seite von Snom](http://wiki.snom.com/Category:Firmware).|
|Model|Modellbezeichnung des Snom-Telefons|
|Version|Firmware-Version|
|Dokumentation|Optionales Feld für Notizen|

### Firmware ausrollen

Die Firmware kann über {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} aktualisiert werden. Wählen Sie die Zielgeräte in der Geräteliste mit Häkchen aus und klicken Sie auf {{< ui-button "Aktion" >}} > {{< ui-button "Firmware ausrollen" >}}. Nun erhalten Sie eine Übersicht der gewählten Geräte, in der Sie die Zielfirmware auswählen können. Anschließend klicken Sie auf {{< ui-button "Firmware update" >}} um die gewählte Firmware auszurollen.

### Unterstützte Modelle

Nachfolgend finden Sie eine Liste an Snom Modellen, die von uns unterstützt werden:

{{% notice warning %}}
Modelle aus der Snom 3XX Reihe sind in der aktuellen pascom Cloud-Lösung nicht funktionsfähig und können nur OnSite verwendet werden.
{{% /notice %}}

|Modelle||
|---|---|
|Snom D120|Snom D715|
|Snom D315|Snom D725|
|Snom D345|Snom D735|
|Snom D375|Snom D745|
|Snom D385|Snom D765|

<!--- |Modell|getestete Firmware-Version|
|---|---|
|Snom D120|10.1.33.33|
|Snom D315| 8.9.|
|Snom D345|8.9.3.40|
|Snom D375|8.9.3.60|
|Snom D385|10.1.33.33|
|Snom D715|8.9.3.80|
|Snom D725|8.9.3|
|Snom D735|10.1.33.33|
|Snom D745|8.9.3.80|
|Snom D765|8.9.3|

alt:
|Snom D785|10.1.20.0|
|Snom 710|8.7.3.25.5|
|Snom 720|8.7.3.25.5|
|Snom 760|8.7.3.25.5|
|Snom 821|?| --->

{{% notice note %}}
Da es für die verschiedenen IP-Telefone eine Vielzahl von Firmwares gibt ist es uns leider nicht möglich jede zu testen, so dass es sein kann, dass manche Firmware-Versionen pascom Funktionen nicht unterstützen. 
{{% /notice %}}

{{% notice info %}}
Aufgrund aktueller Sicherheitsstandards werden Snom IP-Telefone der 3XX Reihe in der kommenden pascom 19 Version nicht mehr unterstützt.
{{% /notice %}}
