---
title: Upgrade von pascom 17 und älter
description: Schritte für ein Upgrade von pascom 17 und älter
weight: 70
---

{{< doctype "self" >}}

## Lizenz Upgraden

{{% notice tip%}}
Ist eine Lizenz auf pascom 18 oder höher migriert kann diese nicht mehr für ältere Systeme verwendet werden. Möchte Sie für das alte System beispielsweise mehr Benutzer kaufen ist dies ohne ein gleichzeitiges Upgrade nicht mehr möglich.
{{% /notice %}}

Bevor Sie das Upgade durchführen können **kontaktieren** Sie bitte unseren **Vertrieb** um Ihre Lizenz auf pascom 18 oder höher umzustellen. Dieser Vorgang ist selbstverständlich kostenlos.

Für die Migration **benötigen** Sie außerdem einen **my.pascom.net Zugang**. Sollten Sie noch keinen Zugriff auf my.pascom.net haben ist Ihnen unser Team gerne behilflich.


## Upgrade Checkliste

Bitte beachten Sie folgende Checkliste **BEVOR** Sie mit dem Upgrade beginnen

* [ ] Ich verwende keine Siemens Telefone
* [ ] Ich verwende keine Patton Gateways
* [ ] Die Hardware oder Virtuelle Maschine die ich verwende hat min 2 GB RAM
* [ ] Ich verwende keine 32Bit Hardware oder 32Bit Virtuelle Maschine
* [ ] Mein Beronet Gateway hat mindestens Firmware Verison 16
* [ ] Ich verwende keinen pascom Cluster bzw. möchste diesen auflösen
* [ ] Ich verwende eine virtuelle Maschine und habe einen Snapshot erzeugt
* [ ] Ich habe meine Lizenz vom pascom Vertriebs Team upgraden lassen
* [ ] Ich habe einen mit meiner Firma verknüpften my.pascom.net Zugang

Weitere Details über wichtige Änderungen entnehmen Sie bitte den Release-Notes.

## Upgrade Schritte

pascom setzt ab Version 18 eine vollständig neue Basistechnologie ein. Daher kann das Upgrade nicht, wie gewohnt, "inplace" direkt auf dem laufenden Server ausgeführt werden sondern erfordert folgende Schritte.

### pascom / mobydick Version checken

Sie benötigen mindestens mobydick 7.11 (LTS) als Migrationsbasis. Falls Sie noch ein älteres System nutzen updaten Sie es bitte mindestens auf Version mobydick 7.11 (LTS). 

### Backup erstellen

Erstellen Sie nun auf Ihrem vorhandenen System ein Backup. Melden Sie sich hierzu an Ihren pascom / mobydick Server an und klicken unter
{{< ui-button "Appliance" >}}>{{< ui-button "Sicherung" >}}>{{< ui-button "Datenbanksicherung" >}} auf {{< ui-button "Erstellen" >}}.

Vergeben Sie einen Namen und schließen Sie ggf. Mitschnitte, Faxe und Voicemails in Ihr Backup mit ein.

Klicken Sie auf {{< ui-button "Ausführen" >}} und laden das so eben erstelle Backup auf Ihren Computer herunter.

### Neuinstallation pascom Server

Installieren Sie nun pascom Server Version 18 oder neuer. Folgen Sie hierzu, je nach verwendetem System, einer unserer [Server Installations Anleitungen]({{< ref "server" >}}).

Falls Sie eine virtuelle Maschine verwenden empfiehlt es sich eine neue VM zu erstellen und das alte System vorest nur abzuschalten.

Nutzen Sie die pascom Appliance, SOHO oder SMB Server installieren Sie das System bitte neu.

### Einspielen des Backups

Während des Installationsprozesses bietet Ihnen der Setup Wizard die Möglichkeit Ihre Installation  über **my.pascom.net** zu **Registrieren** und das zuvor erstellte **Backup** als Basis für die Neuinstallation zu nutzen.

### DHCP Server aktivieren


### Neuprovisionierung aller Endgeräte und Gateways

### Print to Fax

### Queuemetrics Uni Loader

### Manueller Client rollout Client < 17.10

### Manuelle Filesystem-Anpassungen gehen verloren

### Mail to Fax ist jetzt anders

