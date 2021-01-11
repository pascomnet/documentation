---
title: Grandstream Tischtelefone
description: Integrieren Sie Ihre Grandstream IP-Tischtelefone in die pascom.
weight: 11
---

{{< doctype "both"  >}}

![Grandstream GXP2160](grandstream_GXP2160.jpg?width=400px)

## Unterstützte Geräte

**[Liste der unterstützten Endgeräte, hier klicken!]({{<ref "/endpoints#grandstream-ip-telefone" >}})**

## Provisionierung

{{% notice tip %}}
Für lokale Installationen des pascom Servers ist es möglich Endgeräte per DHCP-Server massenweise und vollautomatisch in Betrieb zu nehmen.
Details können Sie dem Howto [Telefon-Provisionierung via DHCP]({{< ref "/howto/dhcp-provisioning" >}}) entnehmen.
{{% /notice %}}

pascom ist in der Lage IP-Telefone des Herstellers Yealink automatisch und zentral zu konfigurieren. Diesen Vorgang nennt man Provisionierung. Dazu stellt pascom eine Basis-Konfiguration ({{< ui-button "Endgeräte" >}} > {{< ui-button "Basis-Konfigurationen" >}}) zur Verfügung. Diese ist ausreichend vorparametriert und muss nur in manchen Fällen angepasst werden.

## Neues Telefon hinzufügen

{{% tabs %}}

{{% tab "Cloud" %}}

**Pairing via URL funktioniert in der CLOUD + ONSITE**  

{{< num 1 "Telefon anschließen" >}}

{{% notice tip %}}
Handelt es sich nicht um ein fabrikneues Telefon setzen Sie es in jedem
Fall auf **Werkseinstellungen**zurück. 
{{% /notice %}}

Stecken Sie das IP-Telefon an das Netzwerk. Das Telefon enthält einen eingebauten Switch, benutzen Sie den Ethernet-Port mit der Bezeichnung **NET**. Falls Sie kein **PoE** (Power over Ethernet) verwenden, stecken Sie das Telefon an den Netzstrom.

Während des Boot-Vorganges steht wiederholt die IP-Adresse des Telefones im
Display. Notieren Sie sich diese.


{{< num 2 "MAC-Adresse ermitteln" >}}

Die MAC-Adresse steht auf der Rückseite des Telefones.

Alternativ surfen Sie nun mit Ihrem Browser auf die zuvor notierte IP-Adresse des Telefones.

Unter {{< ui-button "System Information" >}} > {{< ui-button "MAC-Address" >}} notieren Sie sich die MAC-Adresse des
Telefones.

{{< num 3 "Endgerät anlegen" >}}

Loggen Sie sich in Ihrer Telefonanlage ein und fügen unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} ein
neues Gerät vom Typ **IP-Telefon: Hersteller Grandstream** hinzu.

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

Gehen Sie in die Admin-UI des Grandstream-Telefons und hinterlegen Sie die kopierte Provisionierungs-URL.

Klicken Sie auf {{< ui-button "Bestätigen" >}} und anschließend auf {{< ui-button "Neustarten" >}}.

Das Telefon startet nun neu und provisioniert sich.

{{< num 8 "Funktion testen" >}}

Am einfachsten kann man die erfolgreiche Inbetriebnahme testen, indem man mit **\*100** die eigene Voicemailbox anruft. Daraufhin sollte die Ansage Ihrer Voicemailbox zu hören sein.

{{% /tab %}}

{{% tab "Onsite" %}}

**DHCP Provisioning funktioniert nur ONSITE**  


{{% notice note %}}
Für lokale Installationen des pascom Servers ist es möglich Endgeräte per DHCP-Server massenweise und vollautomatisch in Betrieb zu nehmen.
{{% /notice %}}

{{< num 1 "DHCP-Server vorbereiten" >}}

Bereiten Sie einen DHCP-Server wie unter [Telefon-Provisionierung via DHCP]({{< ref "/howto/dhcp-provisioning" >}}) beschreiben vor.

{{< num 2 "Telefon anschließen" >}}

{{% notice tip %}}
Handelt es sich nicht um ein fabrikneues Telefon setzen Sie es in jedem
Fall auf **Werkseinstellungen**zurück. Um dies am Telefon zu tun, schalten Sie das Telefon ein und drücken Sie dann {{{< ui-button "OK" >}}} und halten Sie die Taste gedrückt, bis **Factory Reset** auf dem Display erscheint. Bestätigen Sie durch Drücken der {{{< ui-button "OK" >}}. 
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

## Auf die Grandstream-Weboberfläche zugreifen

Um auf die Weboberfläche Ihres IP-Telefons zu gelangen benötigen Sie die IP-Adresse. Im Folgenden sind Möglichkeiten beschrieben, um diese in Erfahrung zu bringen:

**IP-Adresse am Telefon anzeigen**

Drücken Sie die runde Taste im Pfeil-Feld des Telefons. Über {{< ui-button "Status" >}} > {{< ui-button "Netzwerkstatus" >}} erhalten Sie die IP-Adresse Ihres Telefons.

**IP-Adresse über die Geräteliste ermitteln**

Loggen Sie sich in das Web-UI der pascom ein. Klicken Sie auf {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}}. Nun sehen Sie eine Übersicht über alle verfügbaren Geräte. Links von jedem Eintrag finden Sie ein *Info*-Symbol. Klicken Sie es an, erhalten Sie eine Übersicht über das provisionierte Telefon, unter anderem auch die IP-Adresse.

### Tasten belegen

Über das Web-UI können am Grandstream IP-Telefon Tasten belegt werden. Klicken Sie auf {{< ui-button "Einstellungen" >}} > {{< ui-button "Programmierbare Tasten" >}}. Es stehen zwei Arten von Tasten zur Verfügung:

**Virtual Multi-Purpose Keys**

Diese Tasten erscheinen auf dem Haupt-Display. Um diese Tasten zu konfigurieren klicken sie auf {{< ui-button "Edit VPK" >}}:

|Modus|Konten|Beschreibung|Wert|
|---|---|---|---|
|Besetztlampen Feld (BLF)|Konto 1|Bezeichnung für die Taste|Durchwahl der Nebenstelle|

Zum Speichern klicken Sie auf {{< ui-button "Sichern" >}}. Die Einstellungen werden mit einem Klicke auf {{< ui-button "Save VPK" >}} wirksam.

{{% notice info%}}
Um die Einstellungen der Tasten zurückzusetzten klichen Sie auf {{< ui-button "Neustart" >}} und anschließend auf {{< ui-button "Save VPK" >}}.
{{% /notice %}}


**Multi-Purpose Keys**

Das sind je nach IP-Telefon-Model zusätzliche programmierbare Tasten.
In der Übersicht sieht man die verfügbaren Multi-Funktionstasten die nun Konfiguriert werden können:

|Modus|Konten|Beschreibung|Wert|
|---|---|---|---|
|Besetztlampen Feld (BLF)|Konto 1|Bezeichnung für die Taste|Durchwahl der Nebenstelle|

Beenden Sie die Konfiguration mit {{< ui-button "Sichern und ausführen" >}}, damit alle Änderungen aktiv sind.

{{% notice info%}}
Um die Einstellungen der Tasten zurückzusetzten klichen Sie auf {{< ui-button "Neustart" >}} und anschließend auf {{< ui-button "Sichern und ausführen" >}}.
{{% /notice %}}


## Basis-Konfiguration

Wie bereits erwähnt, werden Grandstream IP-Telefone  mit Hilfe der Basis-Konfiguration provisioniert. Die Basis-Konfiguration ist unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Basis-Konfigurationen" >}} zu finden.

{{% notice note %}}
Bevor Sie die Basis-Konfiguration ändern, müssen Sie diese {{< ui-button "Duplizieren" >}}.
{{% /notice %}}

Ebenfalls können Sie eine schon bearbeitete Basis-Konfiguration als {{< ui-button "Standard setzten" >}}. Somit erhalten neu angelegte IP-Telefone automatisch die angepasste Basis-Konfiguration.

**Zuweisung einer Basis-Konfiguration**

Eine Basis-Konfiguration kann auf mehreren Wegen zugewiesen werden:

+ Über {{< ui-button "Endgeräte" >}} > {{< ui-button "Basis-Konfigurationen" >}} > Basis-Konfiguration auswählen und Bearbeiten, im Tab {{< ui-button "Geräte" >}} können gleich mehrere IP-Telefone hinzugefügt werden.
+ Über {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} > IP-Telefon auswählen und Bearbeiten im Tab {{< ui-button "Basisdaten" >}}.


**BLF-Tasten konfigurieren über die Basis-Konfiguration**

Im Tab {{< ui-button "Konfiguration" >}} können Sie die vorhandene Basis-Konfiguration anpassen.

Im Bereich **</config>** können Sie Ihre Wunschtasten einfügen. Folgendes Beispiel zeigt die Konfiguration der ersten *Virtual-Multi-Purpose-Taste*:

    <P1363>11</P1363>
    <P1364>0</P1364>
    <P1465>Max</P1465>
    <P1466>103</P1466>

*Erklärung*: **11** ist der Code für die BLF-Taste; **0** ist er erste Account auf dem Telefon; **Max** erscheint am Telefon-Display als Bezeichnung der Taste; **103** ist die Nebenstelle die überwacht wird.

<!-- Weitere Informationen entnehmen Sie bitte der [Grandstream-Tasten-Dokumentation](/grandstream_key_configuration.pdf). -->

Weisen Sie diese Basis-Konfiguration über den Tab {{< ui-button "Geräte" >}} den IP-Telefonen zu, die diese Taste auch in der Weise belegt haben sollen und speichern Sie, nach dem Neustart der IP-Telefone werden die Änderungen auf diesen übernommen.

## Firmwareupdate

Ab der mobydick Version 7.14 wird die Firmware für IP-Endgeräte nicht mehr mitgeliefert. Sollte eine andere als auf dem IP-Endgerät installierte Firmware benötigt werden, muss diese selber heruntergeladen und in die pascom Firmware-Verwaltung hochgeladen werden.

**Firmware hinzufügen**

Die gewünschte Firmware kann hinzugefügt werden unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Firmware" >}}:

|Einstellung|Beschreibung|
|---|---|
|Firmware-Datei|Laden Sie hier die Firmware hoch.|
|Model|Modellbezeichnung des Telefons|
|Version|Firmware-Version|
|Dokumentation|Optionales Feld für Notizen|

**Firmware ausrollen**

Die Firmware kann aus den IP-Endgeräten über {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} aktualisiert werden. Wählen Sie die Zielgeräte in der Geräteliste mit Häkchen aus und klicken Sie auf {{< ui-button "Aktion" >}} > {{< ui-button "Firmware ausrollen" >}}. Nun erhalten Sie eine Übersicht der gewählten Geräte, in der Sie die Zielfirmware auswählen können. Anschließend klicken Sie auf {{< ui-button "Firmware update" >}} um die gewählte Firmware auszurollen.

