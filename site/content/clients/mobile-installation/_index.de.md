---
title: Mobile Client Installation
description: Installieren Sie die pascom Mobile Clients via App- bzw. Playstore und pairen ihn via Bardcode mit dem pascom Server
weight: 40
---

{{< doctype "both" >}}

{{< description >}}

## Android Installation

{{% notice tip %}}
Systemvoraussetzung **Android 5.1** oder höher
{{% /notice %}}

Den aktuellen pascom Mobile Client installieren Sie direkt auf Ihrem Android Smartphone via [Google Palystore](https://www.pascom.net/playstore).

## iOS Installation

{{% notice tip %}}
Systemvoraussetzung **iOS 10 (64bit)** oder höher
{{% /notice %}}

Den aktuellen pascom Mobile Client installieren Sie direkt auf Ihrem Android Smartphone via [Apple Appstore](https://www.pascom.net/appstore).

## (Optional) Mobilgerät am Server anlegen

{{% notice tip %}}
Wenn Sie einen neuen Benutzer anlegen wird für diesen Benutzer **automatisch** auch ein **Mobiltelefon** angelegt. Haben Sie jedoch bei der Anlage des Benutzers **Hat ein Mobiltelefon : nein** gewählt, das Gerät **gelöscht** oder hat der Benutzer **mehrere Mobiltelefone** müssen Sie es vor dem Pairing Vorgang **zuerst anlegen**.
{{% /notice %}}

Gehen Sie zur Anlage eines Mobiltelefones wie folgt vor:

 * Melden Sie sich an der Weboberfläche des pascom Servers an
 * Fügen Sie ein neues Gerät hinzu: {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} > {{< ui-button "Hinzufügen" >}} > **Via Mobile Hub: Integriertes Mobiltelefon**
 * **(Optional)** Tragen Sie die Mobilfunknummer des Benutzer im Internationalen Format ein (z.B: 0049172123123). Dies brauchen Sie nur wenn Sie den GSM Fallback via Mobile-Hub nutzen möchten. Wenn Sie die Nummer leer lassen kann man diese auch in der App beim Pairing Vorgang angeben.
 * Weisen Sie das Gerät dem Benutzer im Tab {{< ui-button "Zuweisung" >}} zu
 * Speichern Sie nun und wenden den Job in der Jobbox an

## Mobile Client mit pascom Server pairen

Es gibt zwei Möglichkeiten den pascom Mobile Client mit dem pascom Server zu pairen:

### Via pascom Server pairen

Möchten Sie als Administrator den Pairing Vorgang für Ihre Benutzer übernehmen können Sie den Prozess direkt auf der pascom Server Weboberfläche starten:

 * Melden Sie sich an der Weboberfläche des pascom Servers an
 * Suchen Sie in unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} das Entsprechende Mobiltelefon
 * Klicken Sie auf {{< ui-button "Bearbeiten" >}} und dort auf {{< ui-button "Pair" >}}
 * Starten Sie die App auf dem zu Pairenden Smartphone und wählen {{< ui-button "Start" >}}
 * Scannen Sie mit der App den Barcode
 * **(Optional)** Wenn Sie den GSM Fallback via Mobile-Hub nutzen möchten tragen Sie die Mobilfunknummer ein oder bestätigen die bei der Anlage des Gerätes bereits vergeben Mobilfunknummer.


### Via Desktop Client pairen

Alternativ haben Ihre Benutzer die Möglichkeit das Mobiltelefon selbst über den pascom Desktop Client zu Pairen. Details dazu entnehmen Sie bitte dem [Mobile Client Benutzerhandbuch]

