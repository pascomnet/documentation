---
title: Upgrade von pascom 17 und älter
description: Schritte für ein Upgrade von pascom 17 und älter
weight: 80
---

{{< doctype "self" >}}

{{< description >}}

## Lizenz Upgraden

Bevor Sie das Upgrade durchführen können **kontaktieren** Sie bitte unseren **Vertrieb** um Ihre Lizenz auf pascom 18 oder höher umzustellen. Dieser Vorgang ist selbstverständlich kostenlos.

Für die Migration **benötigen** Sie außerdem einen **my.pascom.net Zugang**. Sollten Sie noch keinen Zugriff auf my.pascom.net haben ist Ihnen unser Team gerne behilflich.


## Upgrade Checkliste

Bitte beachten Sie folgende Checkliste **BEVOR** Sie mit dem Upgrade beginnen

* [ ] Ich verwende keine Siemens Telefone
* [ ] Ich verwende keine Auerswald Telefone (Unterstützung noch in Arbeit)
* [ ] Ich verwende keine Aastra Tischtelefone (Unterstützung noch in Arbeit)
* [ ] Ich verwende keine Patton Gateways
* [ ] Ich verwende keine cisco SPA 112 Gateways
* [ ] Ich verwende keine FlexPanels
* [ ] Ich verwende kein Print To Fax
* [ ] Ich verwende kein SIP-Amt ohne Registrierung (z.B. Vodafone)
* [ ] Die Hardware oder Virtuelle Maschine die ich verwende hat min 2 GB RAM
* [ ] Ich verwende keine 32Bit Hardware oder 32Bit Virtuelle Maschine
* [ ] Mein Beronet Gateway hat mindestens Firmware Version 16
* [ ] Ich verwende keinen pascom Cluster bzw. möchte diesen auflösen
* [ ] Ich habe meine Lizenz vom pascom Vertriebs Team upgraden lassen
* [ ] Ich habe einen mit meiner Firma verknüpften my.pascom.net Zugang
* [ ] Ich habe eine statische externe IP-Adresse, da ich Mobile und Desktop Clients von extern nutzen möchte oder werde extern keine Clients nutzen
* [ ] Ich nutze meine pascom Telefonanlage nicht als Router
* [ ] Ich verwende den "Admin"-User nur zu administrativen Zwecken

Weitere Details über wichtige Änderungen entnehmen Sie bitte den Release-Notes.

## Upgrade Schritte

pascom setzt ab Version 18 eine vollständig neue Basistechnologie ein. Daher kann das Upgrade nicht, wie gewohnt, "inplace" direkt auf dem laufenden Server ausgeführt werden sondern erfordert folgende Schritte.

### pascom / mobydick Version checken

Sie benötigen mindestens mobydick 7.11 (LTS) als Migrationsbasis. Falls Sie noch ein älteres System nutzen updaten Sie es bitte mindestens auf Version mobydick 7.11 (LTS). 

### Datenbank Backup erstellen

Erstellen Sie nun auf Ihrem vorhandenen System ein Datenbank Backup. Melden Sie sich hierzu an Ihren pascom / mobydick Server an und klicken unter
{{< ui-button "Appliance" >}}>{{< ui-button "Sicherung" >}}>{{< ui-button "Datenbanksicherung" >}} auf {{< ui-button "Erstellen" >}}.

Vergeben Sie einen Namen und schließen Sie ggf. Mitschnitte, Faxe und Voicemails in Ihr Backup mit ein.

Klicken Sie auf {{< ui-button "Ausführen" >}} und **laden** das so eben erstelle **Backup** 
**auf Ihren Computer herunter**.

### Backup Komplettsystem erstellen

{{% notice info %}}
Dieses Backup benötigen Sie im **Fehlerfall** um das ursprüngliche System **wiederherstellen** zu können. Bitte lassen Sie diesen Schritt in keinem Fall aus.
{{% /notice %}}

Klicken Sie auf {{< ui-button "Appliance" >}}>{{< ui-button "Sicherung" >}}>{{< ui-button "Komplettes System" >}} auf {{< ui-button "Erstellen" >}}.

Klicken Sie auf {{< ui-button "Sicherung starten" >}} und **laden** das so eben erstelle **Backup** 
**auf Ihren Computer herunter**.


### Neuinstallation pascom Server

{{% notice tip %}}
Da Sie den neuen Server höchst wahrscheinlich mit der zuvor genutzten IP-Adresse aufsetzen werden leitet Sie Ihr Browser beim ansurfen der IP-Adresse immer wieder auf **/mobydickcmd/** weiter da diese Weiterleitung im **Cache** des **Browsers** gespeichert ist. Nutzen Sie in diesem Fall einfach "HTTPS" (z.B: https://192.168.0.1) um auf das System zuzugreifen.
{{% /notice %}}

Installieren Sie nun pascom Server Version 18 oder neuer. 

Falls Sie eine virtuelle Maschine verwenden empfiehlt es sich eine neue VM zu erstellen und das alte System vorest nur abzuschalten.

Nutzen Sie die pascom Appliance, SOHO oder SMB Server installieren Sie das System bitte neu.

Folgen Sie hierzu, je nach verwendetem System, einer unserer [Server Installations Anleitungen]({{< ref "server" >}}).

### Einspielen des Backups

Während des Installationsprozesses bietet Ihnen der Setup Wizard die Möglichkeit das zuvor erstellte **Backup** als Basis für die Neuinstallation zu nutzen.

### (Variante 1) pascom DHCP-Server aktivieren

Den DHCP Server wurde von der Telefonanlagen Oberfläche in die Management Oberfläche verschoben. Somit ist die Konfiguration des DHCP-Servers auch nicht Bestandteil des von Ihnen zuvor eingespielten Backups.

Falls Sie den pascom DHCP Server in der Vergangenheit genutzt haben müssen Sie diesen im Management wieder aktivieren und konfigurieren. Details können Sie dem Howto [Telefon-Provisionierung via DHCP]({{< ref "/howto/dhcp-provisioning" >}}) entnehmen.

### (Variante 2) Ihren DHCP Server anpassen

Verwenden Sie Ihren eigenen DHCP-Server für das Provisioning müssen Sie nun die DHCP-Option 66 anpassen da sich diese für das Provisioning geringfügig geändert hat. Details können Sie dem Howto [Telefon-Provisionierung via DHCP]({{< ref "/howto/dhcp-provisioning" >}}) entnehmen.

### Neuprovisionierung aller Telefone

{{% notice tip %}}
Versorgen Sie alle Hardwaretelefone zentral über POE genügt es Ihren POE Switch einmal vom Stromnetz zu nehmen um alle Telefone neu zu starten.
{{% /notice %}}

Alle Hardware Telefone müssen nun von SIP-UDP und RTP auf SIP-TLS und SRTP (Verschlüsselung) umgestellt werden. Wenn Sie den DHCP-Server vorbereitet haben müssen Sie nun nur mehr alle Telefone neu starten. Diesen Vorgang müssen Sie manuell ausführen, da ein Reboot über den pascom Server ohne eine vorherige Umstellung der Provisionierung nicht möglich ist. 

### Neuprovisionierung Beronet PCI-Karte

Interne Beronet PCI-Karten können weiterhin vollautomatisch provisioniert werden. Das kopieren einer Provisionierungs-URL entfällt. Gehen Sie wie folgt vor: 

#### Beronet Firmware überprüfen

Loggen Sie sich auf der Weboberfläche der Beronet Karte ein und stellen Sie zunächst unter **Management** > **Info** sicher, dass Sie appfs **16 oder neuer** verwenden. Falls nicht updaten Sie die Box jetzt:

* Download der [Firmware 16.X](https://beronet.atlassian.net/wiki/spaces/PUB/pages/61210659/Tools+and+Downloads) (Abschnitt: beroNet OS)
* Setzen Sie die beroNet unter **Management** > **Firmwareupdate** in den Updatemodus
* Laden Sie die Firmware 16.X nach dem Reboot hoch und starten Sie das Update

#### Provisionierung durchführen

Melden Sie sich an der Telefonanlagen Weboberfläche an. Markieren Sie unter **Gateways** > **Gatewayliste** Ihr beronet Gateway und klicken auf **Aktionen** > **Provisionierung**. Die PCI-Karte startet automatisch neu und übernimmt, wie gewohnt, die Konfiguration des pascom Servers.

### Neuprovisionierung Beronet Box

Da Beronet Boxen ab jetzt auch über die pascom.cloud verwendet werden können ist hier ein Pairing via Provisioning-URL notwendig. Gegen Sie dazu wie folgt vor:

#### Beronet Firmware überprüfen

Loggen Sie sich auf der Weboberfläche der Beronet Box ein und stellen Sie zunächst unter **Management** > **Info** sicher, dass Sie appfs **16 oder neuer** verwenden. Falls nicht updaten Sie die Box jetzt:

* Download der [Firmware 16.X](https://beronet.atlassian.net/wiki/spaces/PUB/pages/61210659/Tools+and+Downloads) (Abschnitt: beroNet OS)
* Setzen Sie die beroNet unter **Management** > **Firmwareupdate** in den Updatemodus
* Laden Sie die Firmware 16.X nach dem Reboot hoch und starten Sie das Update


#### Provisioning URL ermitteln

Melden Sie sich an der Telefonanlagen Weboberfläche an. Markieren Sie unter **Gateways** > **Gatewayliste** Ihr beronet Gateway und klicken auf **Aktionen** > **Provisioning URL**. Kopieren Sie die URL in die Zwischenablage.

#### Provisioning URL auf Beronet eintragen

Loggen Sie sich auf der Weboberfläche der Beronet Box ein und stellen Sie zunächst unter **GUI Mode** sicher, dass Sie **Advanced** gewählt haben.

Tragen Sie nun unter **Preferences** > **Provisioning** folgende Werte ein:

|Feld|Wert|
|---|---|
|Manual Config| aktivieren|
|Provisioning on Boot:|**always**|
|Provisioning-URL|Die zuvor kopierte Provisioning-URL|
|Polling Interval (min.)|Leer lassen|

Speichern Sie die Änderung. Die Beronet Box startet neu.

### pascom Desktop Client updaten

Nutzen Sie den pascom Desktop Client < 17.10 oder den pascom Classic Client, müssen Sie den Desktop Client manuell neu installieren.

Folgen Sie hierzu der Anleitung [pascom Desktop Client Installation]({{< ref "/clients/desktop-installation" >}})

Der Grund hierfür: pascom Desktop Clients < 17.10 updaten sich über den pascom Server. Ab pascom 18 macht der Server keine Client-Updates mehr. Hierzu haben wir nun einen zentralen Updateservice etabliert.

### Änderungen am Fax-Server

Der pascom Server unterstützt kein Print-To-Fax mehr.

Zusätzlich hat sich die Nutzung von Fax-To-Mail verändert. Der pascom Server holt die Faxe jetzt von einem POP/IMAP Postfach ab anstatt die E-Mail direkt via SMTP entgegen zu nehmen.

Passen Sie hierzu Ihre Konfiguration entsprechend an.

### Änderungen Queuemetrics

Die Queuemetrics Schnittstelle überträgt die Daten zwischen pascom Server und Queuemetrics nun via Uniloader. Uniloader ersetzt den bisherigen Qloader. Der Uniloader ist auch in der Lage Befehle von Queuemetrics via HTTPS entgegen zu nehmen und diese an die Asterisk AMI weiter zu geben.

Weitere Informationen finden Sie in der [Uniloader Dokumentation](http://manuals.loway.ch/Uniloader-chunked/)

