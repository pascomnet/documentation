---
title: pascom 18 updaten
description: Schritte für ein Update der pascom Telefonanlage
weight: 70
---

{{< doctype "self" >}}

{{< description >}}

Wenn Sie bereits eine pascom 18 oder höher im Einsatz haben, sind für ein Update folgende Schritte notwendig. 

## pascom ISO downloaden

Laden Sie sich die pascom Server [ISO-Datei](https://www.pascom.net/de/downloads/) der aktuellsten Version von der Download-Seite unserer Homepage herunter.

## pascom Update durchführen

Melden Sie sich am **pascom Server Management** an.

Klicken Sie unter dem Menüpunkt {{< ui-button "System" >}} auf den Button {{< ui-button "Update hochladen" >}} und laden Sie dort die zuvor heruntergeladene pascom ISO-Datei hoch.

Sobald der Upload erfolgreich durchgeführt wurde, wird Ihnen der Host mit der neuen Server Version unter {{< ui-button "System" >}} > {{< ui-button "Firmwares" >}} aufgelistet.

## pascom neustarten

{{% notice warning %}}
Während dem Neustart und Installationsvorgang der Telefonanlage, ist die Telefonie nicht möglich und alle laufenden Gespräche werden beendet. Führen Sie den Neustart daher nie im laufenden Betrieb aus.
{{% /notice %}}

Die Installation des Updates wird erst bei einem Neustart der Telefonanlage durchgeführt.

Klicken Sie dazu auf {{< ui-button "System" >}} > {{< ui-button "Neustart" >}}
